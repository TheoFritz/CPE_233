; ----------------------------------------------------
;
; SW ASSIGNMENT No. 7 PART 2
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; MULTIPLIES TWO 8 BIT NUMBERS TOGETHER AND SEPERATES THE
; EIGHTEEN BIT RESULT INTO A HIGH 8 BITS AND A LOW 8 BITS
; ----------------------------------------------------
.CSEG
.ORG 0x20


MAIN:
MOV R3, 0x00 ; Initalize overflow register
IN R0, 0x20 ; Input first value
CMP R0, 0x00 ;Check if value is 0
BREQ OUTPUT_ZERO_VAL ; If true - output zero
IN R1, 0x21 ; Input second value
CMP R1, 0x00 ;Check if value is 0
BREQ OUTPUT_ZERO_VAL ; If true - output zero
MOV R2, R1 ; Set count register
MULTIPLY: CALL MULTIPLY_VAL ; Multiply loop
SUB R2, 0x01 ; decrement count register
BREQ OUTPUT_VAL ; If output is done correct no. times, output
BRN MULTIPLY ; else, branch multiply

OUTPUT_VAL: OUT R3, 0x41 ; output values
OUT R4, 0x42
BRN 0x50

OUTPUT_ZERO_VAL: MOV R3, 0x00 ; output zeros
MOV R0, 0x00
OUT R3, 0x41
OUT R0, 0x42
BRN 0x50

MULTIPLY_VAL: ADD R4,R0 ; Add two numbers together
ADDC R3, 0x00 ; add carry if exists
RET ; return
