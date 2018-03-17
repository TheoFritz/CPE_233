; ----------------------------------------------------
;
; RANDOM LED TEST
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION: TESTS LED OUTPUT FUNCTIONALITY WITH THE
; RANDOM NUMBER GENERATOR
; ----------------------------------------------------

.EQU SWITCHES = 0x20
.EQU RAND = 0x22
.EQU BTN_STATUS = 0x35
.EQU INT_BTN_PRESS = 0x39
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
MAIN_LOOP: IN R31, RAND
AND R31, 0X0F
ST R31, (R4)
CALL SHOW_LED
ADD R4, 0x01
CMP R4, 0x06
BRNE MAIN_LOOP
BRN MAIN

SHOW_LED:
MOV R5,0x00

SHOW_LED_MAIN_LOOP:
LD R3,(R5)
CALL TURN_LED_ON
CMP R4,R5
BRNE ADD_ONE_SHOW_LED
RET

ADD_ONE_SHOW_LED:
ADD R5,0x01
BRN SHOW_LED_MAIN_LOOP

TURN_LED_ON: MOV R2, 0x01 ; OUTPUT SIGNAL FOR LED
OUT R3, LED_STATUS
OUT R3, SEVEN_SEG
OUT R2, INT_LED_SET
CALL QRT_SEC_DEL
OUT R2, INT_LED_CLR
CALL QRT_SEC_DEL
MOV R2, 0x00
OUT R2, INT_LED_SET
OUT R2, INT_LED_CLR
RET

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
				CMP R13,0xFF
				;if R13 = 190, zero flag is set, return to main
				BREQ clock_delay3
				;- otherwise, run clock_delay1
				BRN clock_delay1

clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
				CMP R14,0x18
				;- if R14 = value that works, zero flag is set, return to main
				BREQ return
				;- otherwise, run clock_delay1
				BRN clock_delay1

return :		RET
