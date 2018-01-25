.EQU SW = 0X30
.EQU LEDS = 0X31
;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x40 ; set the data segment counter to 0x01
MAIN: IN R0,SW
MOV R11,0xFF
EXOR R10, R11
OUT R10,LEDS
BRN MAIN
.ORG 0X50
