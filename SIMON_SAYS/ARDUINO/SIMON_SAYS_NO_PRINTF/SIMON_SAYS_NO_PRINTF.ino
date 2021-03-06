// ----------------------------------------------------
//
// SIMON_SAYS CPE 233 FINAL PROJECT
// DOMINIC GAIERO AND ELIZABETH DAVIS
//
// DESCRIPTION:
//
// ----------------------------------------------------

//IMPORT LIBRARIES

#include <Wire.h>
#include <Adafruit_Trellis.h>


volatile bool LED_SET_STATE = false; //DEFINE STATE FOR SETTING AN LED FROM INTERRUPT
volatile bool LED_CLR_STATE = true;  //DEFINE STATE FOR CLEARING AN LED FROM INTERRUPT
Adafruit_Trellis trellis;

void setup() {
  trellis.begin(0x70); // PASS I2C ADDRESS
  trellis.clear(); //CLEAR ALL LEDS
  trellis.writeDisplay(); //WRITE CHANGES TO DISPLAY
  DDRB = 0x00; //SET PORT B (DIGITAL 8-13) AS INPUT TO RECIEVE LED SIGNAL
  DDRC = 0xFF; //SET PORT C (ANALOG 0-5) AS OUTPUT TO SEND BUTTON DATA
  attachInterrupt(digitalPinToInterrupt(3), LED_SET_ISR, RISING); //ATTACH INTERRUPT TO DIGITAL PIN 3 (SET AN LED)
  attachInterrupt(digitalPinToInterrupt(2), LED_CLR_ISR, RISING); //ATTACH INTERRUPT TO DIGITAL PIN2 (CLEAR AN LED)
  // LIGHT UP ALL LEDS
  for (uint8_t i = 0; i < 16; i++) {

    trellis.setLED(i);
    trellis.writeDisplay();
    delay(50);
  }
  // TURN ALL LEDS OFF
  for (uint8_t i = 0; i < 16; i++) {

    trellis.clrLED(i);
    trellis.writeDisplay();
    delay(50);
  }
}

void loop() {
  digitalWrite(13, LOW); //INTERRUPT PIN FOR BUTTON PRESS

  delay(30);

  if (LED_SET_STATE) { //CHECK IF LED SET INTERRUPT WAS SET
    int LED_STATUS = PINB; //READ FROM PORTB (FROM ASM VALUE TO SET LED)
    trellis.setLED(LED_STATUS); //SET THE LED
    trellis.writeDisplay(); //WRITE THE LED
    LED_SET_STATE = false; //REEST INTERRUPT STATUS
  }
  if (LED_CLR_STATE) { //CHECK IF LED CLR INTERRUPT WAS SET
    int LED_STATUS = PINB; //READ FROM PORTB (FROM ASM VALUE TO SET LED)
    trellis.clrLED(LED_STATUS); //SET THE LED
    trellis.writeDisplay(); //WRITE THE LED
    LED_CLR_STATE = false; //REEST INTERRUPT STATUS
  }

  //READ THE CURRENT BUTTON THAT WAS PRESSED AND SEND OVER PORTC TO ASM
  if (trellis.readSwitches()) {
    for (uint8_t i = 0; i < 16; i++) {
      if (trellis.justPressed(i)) {
        digitalWrite(13, HIGH);
        PORTC = i;
        trellis.setLED(i);
      }
      if (trellis.justReleased(i)) {
        trellis.clrLED(i);
      }
    }
    trellis.writeDisplay();
  }
}

void LED_SET_ISR() {
  noInterrupts();
  LED_SET_STATE = true;
  interrupts();
}

void LED_CLR_ISR() {
  noInterrupts();
  LED_CLR_STATE = true;
  interrupts();
}
