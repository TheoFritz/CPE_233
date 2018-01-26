; ----------------------------------------------------
;
; SW ASSIGNMENT No. 3
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; Take an input from port 0x9A (unsigned 8-bit). Split
; input into two four-bits (top four and bottom four).
; Multiply with numbers together and ouptut on 0x42.
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
MOV R2, 0x00 ; CLEAR TEMPORARY MULTIPLY REGISTER
MOV R3, 0x00 ; CLEAR COUNT REGISTER
AND R0,0x0F  ; MASK BOTTOM FOUR BITS
AND R1,0xF0  ; MASK TOP FOUR BITS
CLC
LSR R1
LSR R1
LSR R1
LSR R1       ; SHIFT BITS DOWN TO BOTTOM FOUR

MULTIPLY: 
CMP R3,R1    ; CHECK IF TEMPORARY COUNT REG = THE MULTIPLIER VALUE
BREQ OUTPUT  ; IF IT DOES, GO TO OUTPUT
ADD R2, R0
ADD R3, 0X01 ; INCREMENT COUNTER
BRN MULTIPLY

OUTPUT:
OUT R2, OUT_PORT
