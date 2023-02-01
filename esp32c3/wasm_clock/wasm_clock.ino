#include <Arduino.h>
#include <U8g2lib.h>
#include "app.wasm.h"
#include <wasm3.h>
#include <m3_env.h>
#include <ESP32Time.h>
#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif

// Redefine the default LED pin here, if needed
#define LED_BUILTIN 8
#ifndef LED_PIN
#define LED_PIN LED_BUILTIN
#endif

#define WASM_STACK_SLOTS 10 * 1024
#define NATIVE_STACK_SIZE (64 * 1024)
// For (most) devices that cannot allocate a 64KiB wasm page
// #define WASM_MEMORY_LIMIT   4096

ESP32Time rtc;
void u8g2_print(u8g2_uint_t x, u8g2_uint_t y, const char *buf);

U8G2_SSD1306_128X64_NONAME_F_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/6, /* data=*/7, /* cs=*/10, /* dc=*/4, /* reset=*/5);


/*
 * API bindings
 *
 * Note: each RawFunction should complete with one of these calls:
 *   m3ApiReturn(val)   - Returns a value
 *   m3ApiSuccess()     - Returns void (and no traps)
 *   m3ApiTrap(trap)    - Returns a trap
 */

m3ApiRawFunction(m3_arduino_millis) {
  m3ApiReturnType(uint32_t)

    m3ApiReturn(millis());
}

m3ApiRawFunction(m3_arduino_delay) {
  m3ApiGetArg(uint32_t, ms)

    // You can also trace API calls
    //Serial.print("api: delay "); Serial.println(ms);

    delay(ms);

  m3ApiSuccess();
}

// This maps pin modes from arduino_wasm_api.h
// to actual platform-specific values
uint8_t mapPinMode(uint8_t mode) {
  switch (mode) {
    case 0: return INPUT;
    case 1: return OUTPUT;
    case 2: return INPUT_PULLUP;
  }
  return INPUT;
}

m3ApiRawFunction(m3_arduino_pinMode) {
  m3ApiGetArg(uint32_t, pin)
    m3ApiGetArg(uint32_t, mode)

#if !defined(PARTICLE)
      typedef uint8_t PinMode;
#endif
  pinMode(pin, (PinMode)mapPinMode(mode));

  m3ApiSuccess();
}

m3ApiRawFunction(m3_arduino_digitalWrite) {
  m3ApiGetArg(uint32_t, pin)
    m3ApiGetArg(uint32_t, value)

      digitalWrite(pin, value);

  m3ApiSuccess();
}

m3ApiRawFunction(m3_arduino_getPinLED) {
  m3ApiReturnType(uint32_t)

    m3ApiReturn(LED_PIN);
}

m3ApiRawFunction(m3_arduino_print) {
  m3ApiGetArgMem(const uint8_t *, buf)
    m3ApiGetArg(uint32_t, len)

      Serial.write(buf, len);
  m3ApiSuccess();
}

m3ApiRawFunction(m3_u8g2_oledSetFont) {
  m3ApiGetArg(uint32_t, data)
  if(data==0)
  {
    u8g2.setFont(u8g2_font_logisoso46_tn);
  }
  m3ApiSuccess();
}

m3ApiRawFunction(m3_u8g2_oledClear) {
  u8g2.clearBuffer();
  m3ApiSuccess();
}

m3ApiRawFunction(m3_u8g2_oledSendBuffer) {
  u8g2.sendBuffer();
  m3ApiSuccess();
}

m3ApiRawFunction(m3_u8g2_oledPrint) {
  m3ApiGetArg(uint32_t, x)
    m3ApiGetArg(uint32_t, y)
      m3ApiGetArgMem(const char *, buf)

        u8g2.drawStr(x, y, buf);             // write something to the internal memory
  m3ApiSuccess();
}

m3ApiRawFunction(m3_rtc_getEpoch) {
  m3ApiReturnType(uint32_t)
    m3ApiReturn(rtc.getEpoch()); 
}


m3ApiRawFunction(m3_rtc_getHour) {
  m3ApiReturnType(uint32_t)
    m3ApiReturn(rtc.getHour()); 
}

m3ApiRawFunction(m3_rtc_getSecond) {
  m3ApiReturnType(uint32_t)
    m3ApiReturn(rtc.getSecond()); 
}

m3ApiRawFunction(m3_rtc_getMinute) {
  m3ApiReturnType(uint32_t)
    m3ApiReturn(rtc.getMinute()); 
}


M3Result LinkArduino(IM3Runtime runtime) {
  IM3Module module = runtime->modules;
  const char *arduino = "arduino";
  const char *u8g2 = "u8g2";
  const char *rtc = "rtc";

  m3_LinkRawFunction(module, arduino, "millis", "i()", &m3_arduino_millis);
  m3_LinkRawFunction(module, arduino, "delay", "v(i)", &m3_arduino_delay);
  m3_LinkRawFunction(module, arduino, "pinMode", "v(ii)", &m3_arduino_pinMode);
  m3_LinkRawFunction(module, arduino, "digitalWrite", "v(ii)", &m3_arduino_digitalWrite);

  // Test functions
  m3_LinkRawFunction(module, arduino, "getPinLED", "i()", &m3_arduino_getPinLED);
  m3_LinkRawFunction(module, arduino, "print", "v(*i)", &m3_arduino_print);
  m3_LinkRawFunction(module, u8g2, "oledPrint", "v(ii*i)", &m3_u8g2_oledPrint);
  m3_LinkRawFunction(module, u8g2, "oledSetFont", "v(i)", &m3_u8g2_oledSetFont);
  m3_LinkRawFunction(module, u8g2, "oledClear", "v()", &m3_u8g2_oledClear);
  m3_LinkRawFunction(module, u8g2, "oledSendBuffer", "v()", &m3_u8g2_oledSendBuffer);
  m3_LinkRawFunction(module, rtc, "getEpoch", "i()", &m3_rtc_getEpoch);
  m3_LinkRawFunction(module, rtc, "getHour", "i()", &m3_rtc_getHour);
  m3_LinkRawFunction(module, rtc, "getMinute", "i()", &m3_rtc_getMinute);
  m3_LinkRawFunction(module, rtc, "getSecond", "i()", &m3_rtc_getSecond);
  return m3Err_none;
}

/*
 * Engine start, liftoff!
 */

#define FATAL(func, msg) \
  { \
    Serial.print("Fatal: " func " "); \
    Serial.println(msg); \
    return; \
  }

void wasm_task(void *) {
  M3Result result = m3Err_none;

  IM3Environment env = m3_NewEnvironment();
  if (!env) FATAL("NewEnvironment", "failed");

  IM3Runtime runtime = m3_NewRuntime(env, WASM_STACK_SLOTS, NULL);
  if (!runtime) FATAL("NewRuntime", "failed");

#ifdef WASM_MEMORY_LIMIT
  runtime->memoryLimit = WASM_MEMORY_LIMIT;
#endif

  IM3Module module;
  result = m3_ParseModule(env, &module, app_wasm, app_wasm_len);
  if (result) FATAL("ParseModule", result);

  result = m3_LoadModule(runtime, module);
  if (result) FATAL("LoadModule", result);

  result = LinkArduino(runtime);
  if (result) FATAL("LinkArduino", result);

  IM3Function f;
  result = m3_FindFunction(&f, runtime, "_start");
  if (result) FATAL("FindFunction", result);

  Serial.println("Running WebAssembly...");

  result = m3_CallV(f);

  // Should not arrive here

  if (result) {
    M3ErrorInfo info;
    m3_GetErrorInfo(runtime, &info);
    Serial.print("Error: ");
    Serial.print(result);
    Serial.print(" (");
    Serial.print(info.message);
    Serial.println(")");
    if (info.file && strlen(info.file) && info.line) {
      Serial.print("At ");
      Serial.print(info.file);
      Serial.print(":");
      Serial.println(info.line);
    }
  }
}

void setup() {
  // put your setup code here, to run once:
  u8g2.begin();

  Serial.begin(115200);
  delay(100);

  // Wait for serial port to connect
  // Needed for native USB port only
  while (!Serial) {}

  Serial.println("\nWasm3 v" M3_VERSION " (" M3_ARCH "), build " __DATE__ " " __TIME__);

#ifdef ESP32
  // On ESP32, we can launch in a separate thread
  xTaskCreate(&wasm_task, "wasm3", NATIVE_STACK_SIZE, NULL, 5, NULL);
#else
  wasm_task(NULL);
#endif
}

void loop() {
  // put your main code here, to run repeatedly:
  // u8g2.clearBuffer();                  // clear the internal memory
  // u8g2.setFont(u8g2_font_7Segments_26x42_mn);  // choose a suitable font
  // u8g2.drawStr(0, 63, "12");             // write something to the internal memory
  // u8g2.setFont(u8g2_font_freedoomr25_tn);  // choose a suitable font
  // u8g2.drawStr(64, 63, ":34");             // write something to the internal memory
  // u8g2.sendBuffer();                   // transfer internal memory to the display
  // delay(1000);
}
