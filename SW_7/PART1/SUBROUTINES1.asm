; ----------------------------------------------------
;
; SW ASSIGNMENT No. 7 PART 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; CONVERTS AN UNSIGNED 8 BIT BINARY NUMBER TO BINARY
; CODED DECIMAL
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42
.EQU FACTOR_10 = 0x0A
.EQU FACTOR_100 = 0x64

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

BRN MAIN

DIVIDE_BY_100:
SUB R1, FACTOR_100
ADD R6, 0x01
CMP R1, FACTOR_100
BRCC DIVIDE_BY_100
RET

DIVIDE_BY_10:
SUB R2, FACTOR_10
ADD R6, 0x01
CMP R2, FACTOR_10
BRCC DIVIDE_BY_10
RET

MAIN: IN R1, IN_PORT
MOV R6, 0x00
CALL DIVIDE_BY_100
MOV R2, R1
MOV R1, R6
MOV R6, 0x00
CALL DIVIDE_BY_10
MOV R3, R2
MOV R2, R6

OUT R1, OUT_PORT
OUT R2, OUT_PORT
OUT R3, OUT_PORT
