.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0X42


.CSEG
.ORG 0x01 ; Starts the cseg at 0x01

MOV R0, 0x00; Moves 0x00 into R0
MOV R3, 0x00; Moves 0x00 into R3
READ_VALUE_LOOP: IN R1, IN_PORT ; Takes a value in from the in_port
CMP R1, 0xFF ; Compares the inputted value with 0xFF
BREQ LOAD_LOOP ; If the inputted value is equal to 0xFF it will jump to the load loop
PUSH R1 ; Pushes the inputted value to the stack
ADD R0, 0X01 ; Adds one to the count register 
BRN READ_VALUE_LOOP ; Branches to the READ_VALUE_LOOP

LOAD_LOOP:
LD R2,(R1) ; Loads the value in the location of R1 which is 0xFF
SUB R1, 0x01 ; Subtracts one from R1
ADD R3, 0x01 ; Adds one to R3
OUT R2, OUT_PORT ; Outputs the value in R2 to the out_port
CMP R3,R0 ; Compares the value in R3 with the value in the count register
BREQ END ; If they are equal the program ends
BRNE LOAD_LOOP ; If they are not equal the program continues to loop through LOAD_LOOP until they are


END:
