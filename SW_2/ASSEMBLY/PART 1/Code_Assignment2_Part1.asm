.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x42
.EQU THRESHOLD = 0x80
.EQU DIVIDE = 0x04
.EQU MULTIPLY = 0X02

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01

IN R0,IN_PORT
CMP R0,THRESHOLD
BRCS DIVIDE_VALUE
BREQ DIVIDE_VALUE


DIVIDE_VALUE:
CLC
LSR R0
CLC
LSR R0

BRN OUTPUT

MULTIPLY_VALUE:
CLC
LSL R0

OUTPUT:
OUT R0,OUT_PORT






