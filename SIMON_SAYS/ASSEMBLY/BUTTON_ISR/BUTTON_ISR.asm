; ----------------------------------------------------
;
; SIMON SAYS ASSEMBLY CODE
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; 
; ----------------------------------------------------

.EQU SWITCHES = 0x20
.EQU RAND = 0x22
.EQU BTN_STATUS = 0x35
.EQU INT_BTN_PRESS = 0x39
.EQU LEDS = 0x40
.EQU LED_STATUS = 0x41
.EQU INT_LED_SET = 0x37
.EQU INT_LED_CLR = 0x38
.EQU SEVEN_SEG = 0x81

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

INIT: MOV R0, 0x00
MOV R2, 0x00
IN R1, RAND
OUT R1, SEVEN_SEG
SEI
MAIN: CMP R2, R1
BREQ INIT
BRN MAIN


ISR:
IN R7, BTN_STATUS
ADD R2, R7
OUT R2, SEVEN_SEG
RETIE

.ORG 0x3FF
VECTOR: BRN ISR
