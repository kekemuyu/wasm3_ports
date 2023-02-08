#include <Arduino.h>
#include <U8g2lib.h>

U8G2_SSD1306_128X64_NONAME_F_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/6, /* data=*/7, /* cs=*/10, /* dc=*/4, /* reset=*/5);
void setup() {
  // put your setup code here, to run once:
Serial.begin(115200);
  u8g2.begin();
  pinMode(0, INPUT_PULLUP);
  pinMode(1, INPUT_PULLUP);
  pinMode(2, INPUT_PULLUP);

}

void loop() {
  // put your main code here, to run repeatedly:
   u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_ncenB10_tr);
    u8g2.drawStr(0,24,"[Hello World!]");
  } while ( u8g2.nextPage() );
}
