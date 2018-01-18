.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x42


;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01

IN R0,IN_PORT
MOV R1,R0

CLC 
LSR R1
BRCS IS_ODD

CLC
LSR R1
BRCC IS_DIVISIBLE_BY_FOUR

SUB R0,0x01
BRN OUTPUT

IS_ODD:
ADD R0,0x11
CLC
LSR R0
BRN OUTPUT

IS_DIVISIBLE_BY_FOUR:
EXOR R0,0xFF
BRN OUTPUT

OUTPUT:
OUT R0,OUT_PORT
 
