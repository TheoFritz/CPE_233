; ----------------------------------------------------
;
; SW ASSIGNMENT No. 3 PART 2
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; READS A VALUE IN FROM 0x9A THEN DELAYS FOR 0.5 SECONDS. OUTPUTS TO THE
; OUTPORT
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01

IN R0, IN_PORT ; R0 TAKES IN THE VALUE OF IN_PORT

MOV R1, 0x5E ; MOVES 0xFF INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP1
             ; USED FOR RESETING

LOOP1:       ; HIGHEST LOOP
MOV R2,0xFE  ; MOVES 0XFE INTO R2. INCREMENT COUNTER ASSOCIATED WITH LOOP2
             ; USED FOR RESETING
LOOP2:       ; MIDDLE LOOP
MOV R3,0xFF  ; MOVES 0XFF INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP3

LOOP3:       ; LOWEST LOOP
SUB R3,0x01  ; DECREMENTS THE COUNTER
BRNE LOOP3   ; CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP

SUB R2, 0x01 ; DECREMENTS THE COUNTER
BRNE LOOP2   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP


SUB R1, 0x01 ; DECREMENTS THE COUNTER 
BRNE LOOP1   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP


OUT R0,OUT_PORT ; OUTPUTS TO THE OUTPORT