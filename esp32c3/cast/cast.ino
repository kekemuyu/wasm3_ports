#include <Arduino.h>
#include <U8g2lib.h>

// #define U8X8_HAVE_HW_SPI 1

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif
U8G2_SSD1306_128X64_NONAME_F_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/6, /* data=*/7, /* cs=*/10, /* dc=*/4, /* reset=*/5);

void setup() {
  // put your setup code here, to run once:
  u8g2.begin();
  Serial.begin(115200);
  Serial.println(random(0, 255));
  Serial.println(random(0, 255));
  Serial.println(random(0, 255));
  Serial.println(random(0, 255));
}
unsigned char buffer[128 * 64];

void loop() {
  // put your main code here, to run repeatedly:
  for (uint8_t i=0;i<128*64;i++) {
    buffer[i] = random(0, 255);
  }
  u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_ncenB14_tr);
    u8g2.drawXBMP(0, 0, 127, 63, buffer);
  } while (u8g2.nextPage());
}
