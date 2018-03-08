.EQU SW_INPORT		= 0x20 ; R1
.EQU INT_EN			= 0xAE ;- output port (also R1)
.EQU INT_STATUS 	= 0xAA ; R0
.EQU INT_CLEAR		= 0xAC ;- output port
.EQU LED_OUTPORT	= 0x40 ; R5
.EQU SEV_SEG_DISP	= 0x81
;----------------------------------------------------------------

.CSEG
.ORG 0x01	; start at address 01

		SEI ;- enable interrupts upon start
		MOV R0,0x00 ;- clear int_status upon reset
		OUT R0,SEV_SEG_DISP

MAIN :	
		IN	R1,SW_INPORT ;- read from switches
		OUT R1,INT_EN ;- switches gets mapped to enable
		CALL LED_TOGGLE
		CALL QRT_SEC_DEL
		BRN MAIN

ISR :	
		CLI
		IN	R0,INT_STATUS ;- read in from int_status
		OUT R0,SEV_SEG_DISP
		CALL QRT_SEC_DEL
		CALL QRT_SEC_DEL
		CALL QRT_SEC_DEL
		CALL QRT_SEC_DEL
		RETIE

.ORG 0x3FF
BRN ISR

.ORG 0x20

; LED on Subloop
;----------------------------------------------------------------
LED_TOGGLE :	EXOR R5,0x01
				OUT R5,LED_OUTPORT
				RET
;----------------------------------------------------------------

; Quarter Second Delay Subloop
;----------------------------------------------------------------
QRT_SEC_DEL :	;- initialize to 0
				MOV R2,0x00
				MOV R3,0x00
				MOV R4,0x00

clock_delay1 :	ADD R2,0x01 ;- add 1 (1 clock cycle)
				CMP R2,0xFF
				;- if R2 = 190, zero flag is set, branch to clock_delay2
				BREQ clock_delay2
				;- otherwise, run this loop again
				BRN clock_delay1

clock_delay2 :	ADD R3,0x01 ;- add 1 (1 clock cycle)
				CMP R3,0xFF
				;- if R3 = 190, zero flag is set, return to main
				BREQ clock_delay3
				;- otherwise, run clock_delay1
				BRN clock_delay1

clock_delay3 :	ADD R4,0x01 ;- add 1 (1 clock cycle)
				CMP R4,0x18
				;- if R4 = value that works, zero flag is set, return to main
				BREQ return
				;- otherwise, run clock_delay1
				BRN clock_delay1

return :		RET
