; ----------------------------------------------------
;
; FINAL PROJECT
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; CONVERTS AN UNSIGNED 8 BIT BINARY NUMBER TO BINARY
; CODED DECIMAL
;
; REGISTER VALUES:
; R1 = HUNDREDTHS DIGIT 
; R2 = TENTHS DIGIT
; R3 = ONES DIGIT
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

BRN MAIN

DIVIDE_BY_100:
CMP R1, FACTOR_100; Does an initial compare to see if the number is smaller than the divisor
BRCS UNDERFLOW; If it is less than it doesn't divide and jumps to Underflow
SUB R1, FACTOR_100; Subtracts 100 from the input number
ADD R6, 0x01; Adds one to the count register which is the result of the division
CMP R1, FACTOR_100; Compares R1 after the initial subtraction with 100 to check for underflow
BRCC DIVIDE_BY_100; If the carry is cleared it continues to subtract from the input value
RET; Returns from the subroutine

DIVIDE_BY_10:
CMP R2, FACTOR_10; Does an initial compare to see if the number is smaller than the divisor
BRCS UNDERFLOW; If it is less than it doesn't divide and jumps to Underflow
SUB R2, FACTOR_10; Subtracts 10 from the input number
ADD R6, 0x01; Adds one to the count register which is the result of the division
CMP R2, FACTOR_10; Compares R1 after the initial subtraction with 100 to check for underflow
BRCC DIVIDE_BY_10; If the carry is cleared it continues to subtract from the input value
RET; Returnd from the subroutine

UNDERFLOW:
RET ; Returns from the subroutine

MAIN: IN R1, RAND ; Takes in an initial value
OUT R1, RAND
MOV R6, 0x00 ; Makes a counter register
CALL DIVIDE_BY_100 ; Calls the DIVIDE_BY_100 subroutine
MOV R2, R1; Moves the value of R1 into R2 because it is the remainder of the division operation
MOV R1, R6; Moves the value of the count register into R1 because it is the hundredths digit
MOV R6, 0x00; Clears the count register
CALL DIVIDE_BY_10; Calls the DIVIDE_BY_10 subroutine
MOV R3, R2; Moves the value of R2 into R3 because it is the remainder of the division operation
MOV R2, R6; Moves the value in the count register into R2 because it is the tenths digit

PASSCODE_ENTRY:
IN R10, BUTTON_STATUS
CMP R10, R1
BRNE PASSCODE_ENTRY

IN R11, BUTTON_STATUS
CMP R11, R2
BRNE PASSCODE_ENTRY

IN R12, BUTTON_STATUS
CMP R12, R3
BRNE PASSCODE_ENTRY

MOV R15, 0x0F
OUT R15, LED_STATUS
