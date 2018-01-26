; ----------------------------------------------------
;
; SW ASSIGNMENT No. 3
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; Cycles through 0-255 and outputs it to PWM_PORT (0x40)
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01

IN R0,IN_PORT
MOV R1,R0
MOV R2, 0x00
MOV R3, 0x00
AND R0,0x0F
AND R1,0xF0
CLC
LSR R1
LSR R1
LSR R1
LSR R1

MULTIPLY: 
CMP R3,R1
BREQ OUTPUT
ADD R2, R0
ADD R3, 0X01
BRN MULTIPLY

OUTPUT:
OUT R2, OUT_PORT
