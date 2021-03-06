; ----------------------------------------------------
;
; ADDING BUTTON PRESSES TO RAND LED TEST
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION: TESTS LED OUTPUT FUNCTIONALITY WITH THE
; RANDOM NUMBER GENERATOR
;
; REGISTERS
; R4 - TOTAL NUMBER OF ITERATIONS
; R23 - VALUE FROM THE BUTTON_STATUS
; R31 - RANDOM NUMBER
; R5 - LOCATION IN THE SCRATCH RAM
; R3 - HOLDS THE VALUE TO SEND TO THE LED
; R2 - VALUE THAT GOES TO THE INTERRUPTS
; R12 - DELAY REGISTER
; R13 - DELAY REGISTER
; R14 - DELAY REGISTER
;
; ----------------------------------------------------

.EQU SWITCHES = 0x20
.EQU RAND = 0x22
.EQU BTN_STATUS = 0x35
.EQU LEDS = 0x40
.EQU LED_STATUS = 0x41
.EQU INT_LED_SET = 0x37
.EQU INT_LED_CLR = 0x38
.EQU SEVEN_SEG = 0x81

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01


MAIN:
MOV R4, 0x00
MAIN_LOOP: OUT R4, LEDS ; KEEP TRACK OF ITERATIONS ON THE BOARD LEDS
IN R31, RAND ; TAKES IN A RANDOM NUMBER
AND R31, 0X0F ; TAKES THE LOWER FOUR BITS OF THE RANDOM NUMBER
ST R31, (R4) ; STORES THAT VALUE IN THE SCRATCH RAM OF THE ITERATION NUMBER
CALL SHOW_LED
CALL READ_BUTTONS


ADD R4, 0x01 ; ITERATES THE COUNTER
CMP R4, 0x06 ; ALLOWS FOR SIX ITERATIONS
BRNE MAIN_LOOP ; ELSE IT LOOPS BACK AROUND
BRN MAIN

READ_BUTTONS:
MOV R5, 0x00

READ_BUTTON_MAIN_LOOP:
LD R3, (R5)
OUT R3, LEDS
CALL READ_BUTTON_STATUS
CMP R23, R3
BRNE END_PROGRAM
CMP R4,R5 ; COMPARES THE LOCATION IN THE SCRATCH RAM WITH THE TOTAL NUMBER OF ITERATIONS
BRNE ADD_ONE_BTN_STATUS
RET

ADD_ONE_BTN_STATUS:
ADD R5,0x01 ; ITERATES THE LOCATION IN THE SCRATCH RAM
BRN READ_BUTTON_MAIN_LOOP



READ_BUTTON_STATUS:
CHECK_BTN_INT_STATUS: IN R23, BTN_STATUS ; TAKES IN THE VALUE FROM BUTTON_STATUS
IN R23, BTN_STATUS
CMP R23, 0x00
BREQ CHECK_BTN_INT_STATUS ; IF NOT IT WILL LOOP BACK AROUND AND CONTINUE TO CHECK
SUB R23, 0x01
OUT R23, SEVEN_SEG ; OUTPUTS THAT VALUE TO THE SEVEN_SEG
CHECK_BTN_PRESS_STATUS : IN R27, BTN_STATUS ; TAKES IN THE VALUE FROM BUTTON_STATUS
CMP R27, 0x00
BRNE CHECK_BTN_PRESS_STATUS ; IF NOT IT WILL LOOP BACK AROUND AND CONTINUE TO CHECK
RET

SHOW_LED:
MOV R5,0x00; CLEARS R5

SHOW_LED_MAIN_LOOP:
LD R3,(R5) ; LOADS VALUES FROM THE SCRATH RAM
CALL TURN_LED_ON
CMP R4,R5 ; COMPARES THE LOCATION IN THE SCRATCH RAM WITH THE TOTAL NUMBER OF ITERATIONS
BRNE ADD_ONE_SHOW_LED
RET

ADD_ONE_SHOW_LED:
ADD R5,0x01 ; ITERATES THE LOCATION IN THE SCRATCH RAM
BRN SHOW_LED_MAIN_LOOP

TURN_LED_ON: MOV R2, 0x01 ; OUTPUT SIGNAL FOR LED
OUT R3, LED_STATUS ; OUTPUTS TO THE TRELLIS LEDS
OUT R2, INT_LED_SET ; OUTPUTS A HIGH TO INT_LED_SET
CALL QRT_SEC_DEL ; DELAYS FOR O.25 SECONDS
OUT R2, INT_LED_CLR ; OUTPUTS A HIGH TO INT_LED_CLR
CALL QRT_SEC_DEL ; DELAYS FOR 0.25 SECONDS
MOV R2, 0x00
OUT R2, INT_LED_SET ; OUTPUTS A LOW TO INT_LED_SET
OUT R2, INT_LED_CLR ; OUTPUTS A LOW TO INT_LED_CLR
RET

END_PROGRAM:
MOV R3, 0x00
MAIN_LOOP_END_PROGRAM: CALL TURN_LED_ON
ADD R3, 0x01
CMP R3, 0x10
BRNE MAIN_LOOP_END_PROGRAM
BRN END_PROGRAM

 QRT_SEC_DEL :	;- initialize to 0
				MOV R12,0x00
				MOV R13,0x00
				MOV R14,0x00

clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
				CMP R12,0xFF
				;- if R12 = 190, zero flag is set, branch to clock_delay2
				BREQ clock_delay2
				- otherwise, run this loop again
				BRN clock_delay1

clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
				CMP R13,0xFE
				;if R13 = 190, zero flag is set, return to main
				BREQ clock_delay3
				;- otherwise, run clock_delay1
				BRN clock_delay1

clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
				CMP R14,0x5E
				;- if R14 = value that works, zero flag is set, return to main
				BREQ return
				;- otherwise, run clock_delay1
				BRN clock_delay1

return :		RET
