; ----------------------------------------------------
;
; SIMON SAYS ASSEMBLY CODE
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION: A PROGRAM THAT TAKES IN VALUES FOR
; DIFFERENT R,G, AND B VALUES. IT TAKES THEM IN
; SEPERATELY AND INCREMENTS THE SEVEN SEGMENT DISPLAY
; TO SHOW WHICH VALUES ARE BEING READ IN. WHEN R0
; IS ONE IT WILL TAKE IN THE RED VALUE. WHEN R0 IS TWO
; IT WILL TAKE IN THE GREEN VALUE. WHEN R0 IS THREE IT 
; WILL TAKE IN THE BLUE VALUE. WHEN R0 IS FOUR IT WILL
; OUTPUT THE RED,GREEN, AND BLUE VALUES TO THE LEDS. THEN 
; IT WILL CONTINUOUSLY RUN THE PROGRAM.
;
;
; REGISTERS
; R0 - COUNT REGISTER FOR THE SEVEN SEGMENT DISPLAY
; R1 - HOLDS THE VALUE THAT IS INPUTTED ON THE SWITCHES
; R3 - HOLDS THE RED VALUE
; R4 - HOLDS THE GREEN VALUE
; R5 - HOLDS THE BLUE VALUE
;
; ----------------------------------------------------

.EQU SWITCHES    = 0x20
.EQU CHANGE_MODE = 0x22
.EQU SEVEN_SEG   = 0x81
.EQU RED_LED     = 0x52
.EQU GRN_LED     = 0x53
.EQU BLU_LED     = 0x54


.CSEG
.ORG 0x01

	SEI ; SETS INTERRUPTS
	
	INIT:
		MOV R0, 0x00 ; CLEARS THE COUNT REGISTER
	
	MAIN:
		IN R1, SWITCHES ; TAKES IN A VALUE FROM THE SWITCHES
		CMP R0, 0x01 ; CHECKS TO SEE IF THE RED VALUE SHOULD BE TAKEN IN
		BREQ OUT_RED ; IF R0 = 1 IT GOES THE THE IN_RED LOOP
		CMP R0, 0x02 ; CHECKS TO SEE IF THE GREEN VALUE SHOULD BE TAKEN IN
		BREQ OUT_GREEN ; IF R0 = 2 IT GOES THE THE IN_GREEN LOOP
		CMP R0, 0x03 ; CHECKS TO SEE IF THE BLUE VALUE SHOULD BE TAKEN IN
		BREQ OUT_BLUE ; IF R0 = 3 IT GOES THE THE IN_BLUE LOOP
		CMP R0, 0x04 ; CHECKS TO SEE IF THE R,G, AND B VALUES HAVE ALL BEEN TAKEN IN
		BREQ OUTPUT_VALUES ; IF R0 = 4 IT GOES THE THE OUTPUT_VALUES LOOP
		BRN INIT ; OTHERWISE BRANCH TO THE INIT STATE
	
	
	IN_RED: 
		MOV R3, R1 ; MOVES THE VALUE FROM THE SWITCHES TO R3
		BRN MAIN
	
	IN_GREEN: 
		MOV R4, R1 ; MOVES THE VALUE FROM THE SWITCHES TO R4
		BRN MAIN
	
	IN_BLUE: 
		MOV R5, R1 ; MOVES THE VALUE FROM THE SWITCHES TO R5 
		BRN MAIN
	
	OUTPUT_VALUES: 
		OUT R3, RED_LED ; OUTPUTS RED VALUE
		OUT R4, GRN_LED ; OUTPUTS GREEN VALUE
		OUT R5, BLU_LED ; OUTPUTS BLUE VALUE
		BRN INIT ; BRANCHES TO THE INIT STATE
	
	
	
	ISR: 
		ADD R0, 0x01 ; INCREMENTS R0
		OUT R0, SEVEN_SEG ; DISPLAYS R0 ON THE SEVEN SEGMENT DISPLAY
		RETIE ; RETURNS WITH INTERRUPTS ENABLED
	
.ORG 0x3FF
	VECTOR: BRN ISR
