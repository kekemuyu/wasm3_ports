package main

import "strconv"

/*
 * Arduino API
 */
const (
	LOW  = 0
	HIGH = 1

	INPUT        = 0
	OUTPUT       = 1
	INPUT_PULLUP = 2
)

//go:wasm-module arduino
//go:export millis
func millis() uint

//go:wasm-module arduino
//go:export delay
func delay(ms uint)

//go:wasm-module arduino
//go:export pinMode
func pinMode(pin, mode uint)

//go:wasm-module arduino
//go:export digitalWrite
func digitalWrite(pin, value uint)

//go:wasm-module arduino
//go:export getPinLED
func getPinLED() uint

//go:wasm-module arduino
//go:export print
func Print(s string)

//go:wasm-module u8g2
//go:export oledPrint
func oledPrint(x, y uint, s string)

func Println(s string) {
	Print(s)
	Print("\n")
}

//go:wasm-module u8g2
//go:export oledSetFont
func oledSetFont(x uint)

//go:wasm-module u8g2
//go:export oledClear
func oledClear()

//go:wasm-module u8g2
//go:export oledSendBuffer
func oledSendBuffer()

//go:wasm-module rtc
//go:export getEpoch
func getEpoch() uint

//go:wasm-module rtc
//go:export getHour
func getHour() uint

//go:wasm-module rtc
//go:export getMinute
func getMinute() uint

//go:wasm-module rtc
//go:export getSecond
func getSecond() uint

/*
 * App
 */

var LED = getPinLED()

func setup() {
	pinMode(LED, 1)
}

func loop() {
	digitalWrite(LED, HIGH)
	delay(100)
	digitalWrite(LED, LOW)
	delay(100)
}

/*
 * Entry point
 */

func main() {
	setup()

	for {
	
		h := getHour()
		m := getMinute()
		s := getSecond()
		Print(strconv.Itoa(int(h)) + ":" + strconv.Itoa(int(m)) + ":" + strconv.Itoa(int(s)) + "\n")
		oledClear()
		oledSetFont(0)
		oledPrint(0, 63, strconv.Itoa(int(m))+":"+strconv.Itoa(int(s)))
		oledSendBuffer()
		loop()
	}
}
