; ----------------------------------------------------
;
; SIMON SAYS ASSEMBLY CODE
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; 
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

MAIN: MOV R0, 0x00
MOV R1, 0x01
MOV R2, 0x00

MAIN_LOOP: OUT R1, INT_LED_SET
CALL QRT_SEC_DEL
OUT R0, LED_STATUS
CALL QRT_SEC_DEL
ADD R0, 0x01
CMP R0, 0x10
BRNE MAIN_LOOP

QRT_SEC_DEL :	;- initialize to 0
				MOV R12,0x00
				MOV R13,0x00
				MOV R14,0x00

clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
				CMP R12,0xFF
				;- if R12 = 190, zero flag is set, branch to clock_delay2
				BREQ clock_delay2
				;- otherwise, run this loop again
				BRN clock_delay1

clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
				CMP R13,0xFF
				;- if R13 = 190, zero flag is set, return to main
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

