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



ISR:
               IN R10, INT_STATUS
			   OUT R10, SEVEN_SEG
			   CALL DELAY
			   RETIE






; DELAY:        MOV   R29, OUTSIDE
; OUTSIDE:      SUB   R29, 0x01
; 			  MOV   R28, MIDDLE
;
; MIDDLE:       SUB   R28, 0x01
;               MOV   R27, INSIDE
;
; INSIDE:       SUB   R27, 0x01
;               BRNE  INSIDE
;
;               OR    R28, 0x00
;               BRNE  MIDDLE
;
;               OR    R29, 0x00
;               BRNE  OUTSIDE
DELAY:              RET


.ORG 0x3FF
VECTOR: BRN ISR
