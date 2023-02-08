#ifndef CLOCK_H
#define CLOCK_H

typedef struct wifi_con{
  char* ssid;
  char* password;
}wifi_cont;

wifi_cont wifi_cons[10];
uint8_t wifi_cons_num;

#endif