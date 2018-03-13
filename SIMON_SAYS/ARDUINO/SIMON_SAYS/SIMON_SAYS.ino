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
  Serial.begin(9600);
  trellis.begin(0x70); // PASS I2C ADDRESS
  trellis.clear(); //CLEAR ALL LEDS
  trellis.writeDisplay(); //WRITE CHANGES TO DISPLAY
  DDRB = 0x00; //SET PORT B (DIGITAL 8-13) AS INPUT TO RECIEVE LED SIGNAL
  DDRC = 0xFF; //SET PORT C (ANALOG 0-5) AS OUTPUT TO SEND BUTTON DATA
  attachInterrupt(digitalPinToInterrupt(3), LED_SET_ISR, RISING); //ATTACH INTERRUPT TO DIGITAL PIN 3 (SET AN LED)
  attachInterrupt(digitalPinToInterrupt(2), LED_CLR_ISR, RISING); //ATTACH INTERRUPT TO DIGITAL PIN2 (CLEAR AN LED)
  // LIGHT UP ALL LEDS
  Serial.printf("INITIAL PROGRAM START\n");
        Serial.printf("LEDS SET\n");
  for (uint8_t i = 0; i < 16; i++) {

    trellis.setLED(i);
    trellis.writeDisplay();
    delay(50);
  }
  // TURN ALL LEDS OFF
            Serial.printf("LEDS CLEARED\n\n");
  for (uint8_t i = 0; i < 16; i++) {

    trellis.clrLED(i);
    trellis.writeDisplay();
    delay(50);
  }
  Serial.printf("PIN     S/C      STATUS\n");
}

void loop() {
  digitalWrite(13, LOW); //INTERRUPT PIN FOR BUTTON PRESS

  delay(30);

  if (LED_SET_STATE) { //CHECK IF LED SET INTERRUPT WAS SET
    int LED_STATUS = PINB; //READ FROM PORTB (FROM ASM VALUE TO SET LED)
  Serial.printf(" %02d       S      N/A\n", LED_STATUS);
    //    Serial.println(LED_STATUS); //PRINT CURRENT LED TO SERIAL
    trellis.setLED(LED_STATUS); //SET THE LED
    trellis.writeDisplay(); //WRITE THE LED
    LED_SET_STATE = false; //REEST INTERRUPT STATUS
  }
  if (LED_CLR_STATE) { //CHECK IF LED CLR INTERRUPT WAS SET
    int LED_STATUS = PINB; //READ FROM PORTB (FROM ASM VALUE TO SET LED)
    Serial.printf(" %02d       C      N/A\n", LED_STATUS);
    //    Serial.println(LED_STATUS); //PRINT CURRENT LED TO SERIAL
    trellis.clrLED(LED_STATUS); //SET THE LED
    trellis.writeDisplay(); //WRITE THE LED
    LED_CLR_STATE = false; //REEST INTERRUPT STATUS
  }

  //READ THE CURRENT BUTTON THAT WAS PRESSED AND SEND OVER PORTC TO ASM
  if (trellis.readSwitches()) {
    for (uint8_t i = 0; i < 16; i++) {
      if (trellis.justPressed(i)) {
        Serial.printf(" %02d       S      PRESS\n", i);
        //        Serial.print("v"); Serial.println(i);
        digitalWrite(13, HIGH);
        PORTC = i;
        trellis.setLED(i);
      }
      if (trellis.justReleased(i)) {
        //        Serial.print("^"); Serial.println(i);
       Serial.printf(" %02d       S      RELEASE\n", i);
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
