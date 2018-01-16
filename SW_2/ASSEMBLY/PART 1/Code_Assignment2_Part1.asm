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
BRCS MULTIPLY_VALUE
BREQ MULTIPLY_VALUE

