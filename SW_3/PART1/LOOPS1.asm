.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01

IN R0,IN_PORT
MOV R1,R0
AND R0,0x0F
AND R1,0xF0
CLC
LSR R1
LSR R1
LSR R1
LSR R1

MULTIPLY:
ADD

