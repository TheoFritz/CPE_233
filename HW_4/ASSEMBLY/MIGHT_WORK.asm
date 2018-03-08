; ----------------------------------------------------
;
; HW ASSIGNMENT NO. 4
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
;
; ----------------------------------------------------

.EQU SEVEN_SEG = 0x81
.EQU LEDS = 0x40
.EQU SWITCHES = 0x20
.EQU INT_CLR = 0xAC
.EQU INT_STATUS = 0XAA
.EQU INT_EN = 0XAE


.DSEG
.ORG 0x00
;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x20                              ; SET THE DATA SEGMENT COUNTER TO 0x20
               SEI                     ; ENABLE INTERRUPTS
               MOV R20, 0x01           ; LED HIGH
               MOV R30, 0xFF           ; LED LOW

MAIN:          IN   R0, SWITCHES      ; READ WHAT INTERRUPTS TO ENABLE
               OUT  R31, SEVEN_SEG    ; ENABLE PREVIOUSLY SET INTERRUPTS
               OUT  R0, INT_EN        ; TURN LED ON
               CALL DELAY             ; DELAY FOR 500 ms
               OUT  R20, LEDS         ; TURN LED OFF
			   CALL DELAY
			   OUT R21, LEDS
			   BRN MAIN



ISR:           CLI
               IN R10, INT_STATUS
			   OUT R10, SEVEN_SEG
			   CALL DELAY
			   RETIE






DELAY:
MOV R6, 0x5E ; MOVES 0x5E INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP1
             ; USED FOR RESETING

LOOP1:       ; HIGHEST LOOP
MOV R7,0xFE  ; MOVES 0XFE INTO R2. INCREMENT COUNTER ASSOCIATED WITH LOOP2
             ; USED FOR RESETING

LOOP2:       ; MIDDLE LOOP
MOV R6,0xFF  ; MOVES 0XFF INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP3

LOOP3:       ; LOWEST LOOP
SUB R8,0x01  ; DECREMENTS THE COUNTER
BRNE LOOP3   ; CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP

SUB R7, 0x01 ; DECREMENTS THE COUNTER
BRNE LOOP2   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP


SUB R6, 0x01 ; DECREMENTS THE COUNTER
BRNE LOOP1   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP

RET ; RETURNS


.ORG 0x3FF
VECTOR: BRN ISR
