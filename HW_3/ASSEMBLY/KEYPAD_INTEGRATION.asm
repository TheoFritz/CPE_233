.EQU KEYPAD = 0x22
.EQU OUT_PORT = 0x42

.CSEG
.ORG 0X01; Starts CSEG at 0x01

; Passcode detector of 0410
; Outputs a 0x01 if correct 

MOV R0, 0x00 ; Moves a 0 into the register
FIRST_DIGIT: IN R0, KEYPAD ; Takes in a value from the keypad  
CMP R0, 0x00 ; Compares the value with the first number of the passcode
BREQ SECOND_DIGIT ; If it is equal it continues to check the next digit
BRNE FIRST_DIGIT ; If it is not equal it loops around to check the first digit

SECOND_DIGIT:
IN R0, KEYPAD ; Takes in another input from the keypad 
CMP R0, 0X04 ; Checks to see if it is the same as the second number in the passcode
BREQ THIRD_DIGIT ; If it is equal it continues on to check the next digit
BRNE FIRST_DIGIT ; If it is not equal it loops around to check the first digit

THIRD_DIGIT:
IN R0, KEYPAD ; Takes in another input from the keypad
CMP R0, 0X01 ; Checks to see if it is the same as the third number in the passcode
BREQ FOURTH_DIGIT ; If it is equal then it continues on to check the next digit
BRNE FIRST_DIGIT ; If it is not equal it loops around to check the first digit

FOURTH_DIGIT:
IN R0, KEYPAD ; Takes in another input from the keypad 
CMP R0, 0X00 ; Checks to see if it is the same as the fourth number in the passcode
BREQ DONE ; If it is equal then it continues on to the done loop
BRNE FIRST_DIGIT ; If it is not equal it loops around to check the first digit

DONE:
MOV R1, 0X01 ; Moves 0x01 into R1
OUT R1, OUT_PORT ; Outputs R1 to the OUT_PORT
