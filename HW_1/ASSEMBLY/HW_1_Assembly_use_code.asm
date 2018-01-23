; ----------------------------------------------------
;
; HW ASSIGNMENT No. 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; Cycles through 0-255 and outputs it to PWM_PORT (0x40)
; ----------------------------------------------------

.EQU PWM_PORT = 0x40

; ----------------------------------------------------
; -- .ORG used in code segment
; ----------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01
MAIN : MOV R0,0x00  ; Moves 0x00 into R0
ADD_1: OUT R0,PWM_PORT; Outputs the value of R0 to the PWM_port
       CMP R0,0xFF ; Compares the value in R0 to 0xFF
	   ADD R0,0x01 ; Adds one
       BREQ END_PROGRAM ; Branches to END_PROGRAM if R0=255
       BRN ADD_1 ; Loops the program by adding one each time until it reaches 255

       END_PROGRAM: ; Terminates program


