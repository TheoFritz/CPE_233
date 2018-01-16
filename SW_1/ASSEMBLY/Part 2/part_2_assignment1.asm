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
IN R0,IN_PORT ;Takes in an 8-bit signed two's complement number and stores it in R0
EXOR R0, 0xFF ;XORs R0 to flip all bits
ADD R0,0x01 ;Adds 1 to finish sign inversion
OUT R0,OUT_PORT ;Outputs R0 to OUT_PORT (0x40)
BRN MAIN
