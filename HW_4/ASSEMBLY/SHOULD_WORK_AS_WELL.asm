; ----------------------------------------------------
;
; HW ASSIGNMENT NO. 4
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
;
; ----------------------------------------------------

.EQU SEVEN_SEG = 0x81
.EQU LEDS = 0x40
.EQU SWITCHES = 0x20
.EQU INT_CLR = 0xAC
.EQU INT_STATUS = 0XAA
.EQU INT_EN = 0XAE

.CSEG
.ORG 0x20                              ; SET THE DATA SEGMENT COUNTER TO 0x20
               SEI                     ; ENABLE INTERRUPTS
               MOV R21, 0x01           ; LED HIGH
			   
MAIN:          IN   R3, SWITCHES      ; READ WHAT INTERRUPTS TO ENABLE
               OUT  R3, INT_EN        ; ENABLE PREVIOUSLY SET INTERRUPTS
               CALL BLINK_LED         ; TOGGLE LEDS
               CALL DELAY             ; DELAY FOR 500 ms
			   BRN MAIN
			   
ISR:           CLI
			   IN R0, INT_STATUS
			   OUT R0, SEVEN_SEG
			   CALL DELAY
			   CALL DELAY
			   RETIE
			   
BLINK_LED:   	EXOR R21,0x01
				OUT R21,LEDS
				RET



DELAY:        MOV   R29, OUTSIDE
OUTSIDE:      SUB   R29, 0x01
			  MOV   R28, MIDDLE

MIDDLE:       SUB   R28, 0x01
              MOV   R27, INSIDE

INSIDE:       SUB   R27, 0x01
              BRNE  INSIDE

              OR    R28, 0x00
              BRNE  MIDDLE

              OR    R29, 0x00
              BRNE  OUTSIDE
			  RET


.ORG 0x3FF
VECTOR: BRN ISR
