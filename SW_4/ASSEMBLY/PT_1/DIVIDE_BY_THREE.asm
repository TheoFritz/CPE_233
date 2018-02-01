; ----------------------------------------------------
;
; SW ASSIGNMENT No. 4 PART 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; READS A VALUE IN FROM 0x9A THEN DIVIDES BY THREE AND
; OUTPUTS TO OUTPORT
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42
.EQU DIV_FACTOR = 0x03

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

IN R0, IN_PORT           ; R0 TAKES IN THE VALUE OF IN_PORT
MOV R1, 0x00             ; CLEAR COUNTER REG
DIVIDE_LOOP:     
SUB R0, DIV_FACTOR     
BREQ OUTPUT_EQUAL        ; CHECKS IF THE DIVISIOR FACTOR IS EVENLY DIVISIBLE INTO
                         ; INPUT NUMBER
BRCS OUTPUT              ; IF IT IS NOT DIVISIBLE, CARRY WILL BE SET TO 1, OUTPUT
ADD R1, 0x01             ; INCREMENT COUNTER
BRN DIVIDE_LOOP          ; RETURN TO DIVIDE_LOOP

OUTPUT_EQUAL:
ADD R1, 0x01             ; IF IT IS EQUAL, ADD 1 AGAIN

OUTPUT: OUT R1, OUT_PORT ; OUTPUT VALUE
