.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x40
;--------------------------------------------------------------------------
;-- .ORG used in data segment
;--------------------------------------------------------------------------


.DSEG
.ORG 0x00 ; sets the code segment counter to 0x00

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01
MAIN :
IN R0,IN_PORT
EXOR R0, 0xFF
ADD R0,0x01
OUT R0,OUT_PORT
BRN MAIN



