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
.DB 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x20                              ; SET THE DATA SEGMENT COUNTER TO 0x20
               SEI                     ; ENABLE INTERRUPTS
               MOV R30, 0x01           ; LED HIGH
               MOV R20, 0x00           ; LED LOW

MAIN:          IN   R3, SWITCHES      ; READ WHAT INTERRUPTS TO ENABLE
               OUT  R3, INT_EN        ; ENABLE PREVIOUSLY SET INTERRUPTS
               CALL BLINK_LED         ; TOGGLE LEDS
               CALL DELAY             ; DELAY FOR 500 ms
			   BRN MAIN



ISR:           MOV  R1, 0x00
ISR_MAIN_LOOP: IN   R0, INT_STATUS    ; READ IN THE INTERRUPT STATUS
               LD   R2, (R1)          ; READ VALUE IN SCRATCH RAM TO MASK CURRENT BIT OF INTERRUPT
               AND  R0, R2            ; MASK CURRENT BIT
               BRNE ISR_OUTPUT        ; IF INTERRUPT IS ENABLED OUTPUT TO SEVEN SEGMENT
ISR_OUTPUT   : OUT  R2, SEVEN_SEG     ; OUTPUT CURRENT INTERRUPT NO. TO SEVEN SEGMENT
DELAY_ISR    : CALL DELAY             ; DELAY FOR 500 ms
               CALL DELAY             ; DELAY FOR 500 ms
               OUT  R2, INT_CLR       ; OUTPUT CURRENT INTERRUPT TO CLEAR LINE
               ADD  R1, 0x01          ; INCREMENT COUNT REG
               CMP  R1, 0x08          ; SEE IF TOTAL NO. INTERRUPT REACHED
               BRNE ISR_MAIN_LOOP     ; IF NOT LOOP BACK TO TOP OF ISR
               RETIE                  ; ELSE, RETURN TO MAIN PROGRAM



BLINK_LED   :	EXOR R30,0x01
				OUT R30,LEDS
				RET



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
