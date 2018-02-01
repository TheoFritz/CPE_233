; ----------------------------------------------------
;
; SW ASSIGNMENT No. 4 PART 2
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; READS TWO VALUE IN FROM IN_PORT (0x9A) THEN DIVIDES BY THE SECOND VALUE
; AND OUTPUTS TO OUT_PORT (0x42)
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET DATA SEGMENT COUNTER TO 0x01

IN R0, IN_PORT           ; R0 TAKES IN VALUE OF IN_PORT ("NUMERATOR")
IN R1, IN_PORT           ; R1 TAKES IN VALUE OF IN_PORT ("DENOMINATOR")
MOV R2, 0x00             ; CLEAR COUNT REG
DIVIDE_LOOP:
SUB R0, R1
BREQ OUTPUT_EQUAL        ; CHECKS IF THE DIVISOR FACTOR IS EVENLY DIVISIBLE INTO
                         ; INPUT NUMBER
BRCS OUTPUT              ; IF IT IS NOT DIVISIBLE, CARRY WILL BE SET TO 1, OUTPUT
ADD R2, 0x01             ; INCREMENT COUNTER
BRN DIVIDE_LOOP          ; RETURN TO DIVIDE_LOOP

OUTPUT_EQUAL:
ADD R2, 0x01             ; IF IT IS EQUAL, ADD 1 AGAIN

OUTPUT: OUT R2, OUT_PORT ; OUTPUT VALUE
