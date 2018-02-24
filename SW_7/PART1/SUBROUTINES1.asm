; ----------------------------------------------------
;
; SW ASSIGNMENT No. 7 PART 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; CONVERTS AN UNSIGNED 8 BIT BINARY NUMBER TO BINARY
; CODED DECIMAL
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42
.EQU FACTOR_10 = 0x0A
.EQU FACTOR_100 = 0x64

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

BRN MAIN

DIVIDE_BY_100:
CMP R1, FACTOR_100; Does an initial compare to see if the number is smaller than the divisor
BRCS UNDERFLOW; If it is less than it doesnt divide and jumps to Underflow
SUB R1, FACTOR_100; Subtracts 100 from the input number
ADD R6, 0x01; Adds one to the count register which is the result of the divsion
CMP R1, FACTOR_100; Compares R1 after the initial subtraction with 100 to check for underflow
BRCC DIVIDE_BY_100; If the carry is cleared it continues to subtract from the input value
RET; Returns from the subroutine

DIVIDE_BY_10:
CMP R2, FACTOR_10; Does an initial compare to see if the number is smaller than the divisor
BRCS UNDERFLOW; If it is less than it doesnt divide and jumps to Underflow
SUB R2, FACTOR_10; Subtracts 10 from the input number
ADD R6, 0x01; Adds one to the count register which is the result of the divsion
CMP R2, FACTOR_10; Compares R1 after the initial subtraction with 100 to check for underflow
BRCC DIVIDE_BY_10; If the carry is cleared it continues to subtract from the input value
RET; Returnd from the subroutine

UNDERFLOW:
RET ; Returns from the subroutine

MAIN: IN R1, IN_PORT ; Takes in an initial value
MOV R6, 0x00 ; Makes a counter register
CALL DIVIDE_BY_100 ; Calls the DIVIDE_BY_100 subroutine
MOV R2, R1; Moves the value of R1 into R2 because it is the remainder of the division operation
MOV R1, R6; Moves the value of the count register into R1 because it is the hundreths digit
MOV R6, 0x00; Clears the count register
CALL DIVIDE_BY_10; Calls the DIVIDE_BY_10 subroutine
MOV R3, R2; Moves the value of R2 into R3 because it is the remainder of the division operation
MOV R2, R6; Moves the value in the count register into R2 because it is the tenths digit

OUT R1, OUT_PORT; Outputs the hundreths digit
OUT R2, OUT_PORT; Outputs the tenths digit
OUT R3, OUT_PORT; Outputs the ones digit
