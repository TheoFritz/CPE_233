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

MAIN: IN R5, INT_BTN_PRESS
CMP R5, 0x01
BRNE MAIN
IN R4, BTN_STATUS
OUT R4, SEVEN_SEG
BRN MAIN
