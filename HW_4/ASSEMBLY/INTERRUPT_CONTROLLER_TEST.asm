; ----------------------------------------------------
;
; HW ASSIGNMENT NO. 4
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; 
; ----------------------------------------------------

.EQU INT_IN = 0xAA
.EQU SEVEN_SEG = 0x81
.EQU LEDS = 0x40
.EQU SWITCHES = 0x20
.EQU INT_CLR

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

MOV R1, BIT_0
OUT R1, INT_EN
OR R1, BIT_1
OUT R1, INT_EN
OR R1, BIT_2
OUT R1, INT_EN
MOV R2, BIT_2
EXOR R2, 0xFF
AND R1,R2
OUT R1, INT_EN 
