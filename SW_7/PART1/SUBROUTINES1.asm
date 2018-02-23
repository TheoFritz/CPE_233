; ----------------------------------------------------
;
; SW ASSIGNMENT No. 7 PART 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
;
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42
.EQU DIV_FACTOR = 0x10

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

IN R0, IN_PORT
MOV R1, 0X00

DIVIDE_LOOP:
SUB R0, DIV_FACTOR
BREQ OUTPUT_EQUAL

BRCS OUTPUT
ADD R1, 0x01
BRN DIVIDE_LOOP

OUTPUT_EQUAL:
ADD R1, 0x01

OUTPUT: OUT R1, OUT_PORT