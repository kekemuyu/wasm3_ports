/*

  Clock.ino
  
  Demonstrates a clock-like display with a very huge font.
  Also shows usage of u8x8_u8toa().

  Universal 8bit Graphics Library (https://github.com/olikraus/u8g2/)

  Copyright (c) 2016, olikraus@gmail.com
  All rights reserved.

  Redistribution and use in source and binary forms, with or without modification, 
  are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list 
    of conditions and the following disclaimer.
    
  * Redistributions in binary form must reproduce the above copyright notice, this 
    list of conditions and the following disclaimer in the documentation and/or other 
    materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
  CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  

*/

#include <Arduino.h>
#include <U8g2lib.h>
#include <WiFi.h>
#include "time.h"
#include "sntp.h"
#include "clock.h"
#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif
#include "esp_sleep.h"
#include <ESP32Time.h>

// End of constructor list
unsigned long last;
unsigned long now;
ESP32Time rtc;
tm tm;

// const char* ssid       = "Tenda_50E7E8";
// const char* password   = "FireBrain159";

const char* ntpServer1 = "ntp1.aliyun.com";
const char* ntpServer2 = "pool.ntp.org";
const char* ntpServer3 = "time.nist.gov";
const long gmtOffset_sec = 3600;
const int daylightOffset_sec = 3600;

const char* time_zone = "HKT-8";  // TimeZone rule for Europe/Rome including daylight adjustment rules (optional)

void wifi_cons_init(void) {
  wifi_cont temp;
  wifi_cons_num = 2;
  temp.ssid = "Tenda_50E7E8";
  temp.password = "FireBrain159";

  wifi_cons[0] = temp;
  temp.ssid = "redmek30e5g";
  temp.password = "12345678";
  wifi_cons[1] = temp;
}


void printLocalTime() {

  if (!getLocalTime(&tm)) {
    Serial.println("No time available (yet)");
    return;
  }
  Serial.println(&tm, "%A, %B %d %Y %H:%M:%S");
}
// Callback function (get's called when time adjusts via NTP)
void timeavailable(struct timeval* t) {
  Serial.println("Got time adjustment from NTP!");
  printLocalTime();
}
//Define bitmasks for GPIO pins used to wake from deep sleep
//Wake from deep sleep when these pins are high
//Wake from deep sleep when these pins are low
const uint64_t WAKEUP_LOW_PIN_BITMASK = 0b000011;  //GPIO0-GPIO3
//Call to enter deep sleep mode with GPIO wakeup
void deep_sleep_gpio_init(void) {
  //GPIO pins must be set as inputs
  for (int i = 0; i < 6; i++) {
    gpio_set_direction(gpio_num_t(i), GPIO_MODE_INPUT);
  }


  //hold disable, isolate and power domain config functions may be unnecessary
  gpio_deep_sleep_hold_dis();
  esp_sleep_config_gpio_isolate();
  esp_sleep_pd_config(ESP_PD_DOMAIN_RTC_PERIPH, ESP_PD_OPTION_ON);

  //Wakeup on low and high can be used concurrently for separate pins
  esp_deep_sleep_enable_gpio_wakeup(WAKEUP_LOW_PIN_BITMASK, ESP_GPIO_WAKEUP_GPIO_LOW);

  esp_deep_sleep_start();
}

/*
  U8g2lib Example Overview:
    Frame Buffer Examples: clearBuffer/sendBuffer. Fast, but may not work with all Arduino boards because of RAM consumption
    Page Buffer Examples: firstPage/nextPage. Less RAM usage, should work with all Arduino boards.
    U8x8 Text Only Example: No RAM usage, direct communication with display controller. No graphics, 8x8 Text only.
    
  This is a page buffer example.    
*/
U8G2_SSD1306_128X64_NONAME_F_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/6, /* data=*/7, /* cs=*/10, /* dc=*/4, /* reset=*/5);

void setup(void) {
  Serial.begin(115200);
  u8g2.begin();
  pinMode(0, INPUT_PULLUP);
  pinMode(1, INPUT_PULLUP);
  pinMode(2, INPUT_PULLUP);
  wifi_cons_init();
  last = millis();
  
  //connect to WiFi
  for (int i = 0; i < wifi_cons_num; i++) {
    Serial.printf("Connecting to %s ", wifi_cons[i].ssid);
    WiFi.begin(wifi_cons[i].ssid, wifi_cons[i].password);
    unsigned long temp1, temp2;
    temp1 = millis();
    while (WiFi.status() != WL_CONNECTED) {
      temp2 = millis();
      if (temp2 - temp1 > 5000) {
        WiFi.disconnect();
        break;
      }
      delay(500);
      Serial.print(".");
    }    
    if(WiFi.status() == WL_CONNECTED){
      Serial.println(" CONNECTED");
      break;
    }
  }

// set notification call-back function
  sntp_set_time_sync_notification_cb(timeavailable);
  sntp_servermode_dhcp(1);  // (optional)
  configTzTime(time_zone, ntpServer1, ntpServer2, ntpServer3);
  printLocalTime();
}

uint8_t h = 0;
uint8_t mm = 0;
uint8_t m = 24;

void loop(void) {
  char m_str[3];
  tm = rtc.getTimeStruct();
  m = tm.tm_sec;

  mm = tm.tm_min;
  h = tm.tm_hour;

  u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_logisoso46_tn);
    strcpy(m_str, u8x8_u8toa(h, 2));
    u8g2.drawStr(0, 63, m_str);
    u8g2.drawStr(57, 63, ":");
    strcpy(m_str, u8x8_u8toa(mm, 2));
    u8g2.drawStr(70, 63, m_str);
    // u8g2.setFont(u8g2_font_logisoso18_tn);
    // strcpy(m_str, u8x8_u8toa(m, 2));
    // u8g2.drawStr(90,63,m_str);
  } while (u8g2.nextPage());
  delay(100);



  now = millis();
  if (digitalRead(2) == 0) {
    last = now;
    mm++;
    if (mm == 60) {
      mm = 0;
    }
    tm.tm_min = mm;
    rtc.setTimeStruct(tm);
  }
  if (digitalRead(1) == 0) {
    last = now;
    h++;
    if (h == 24) {
      h = 0;
    }
    tm.tm_hour = h;
    rtc.setTimeStruct(tm);
  }

  if (now - last >= 30000) {
    last = now;
    printLocalTime();
    deep_sleep_gpio_init();  //睡眠
  }
}
