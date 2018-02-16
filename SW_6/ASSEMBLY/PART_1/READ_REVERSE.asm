.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0X42


.CSEG
.ORG 0x01 ; Starts the cseg at 0x01
MOV R0, 0x00 ; Moves 0x00 into R0 to acts as a counter
READ_VALE_LOOP: IN R1, IN_PORT ; Takes a value from the in_port
CMP R1, 0xFF ; Compares the value that was just inputted with 0xFF
BREQ POP_LOOP; If the previous value that was inputted was 0xFF then the program jumps to the next loop
PUSH R1 ; Otherwise the program pushes the inputted value to the stack
ADD R0, 0X01 ; Adds 0x01 to the counter
BRN READ_VALE_LOOP ; Branches to the start of the loop

POP_LOOP:
POP R1 ; Pops the last value from the stack
SUB R0, 0X01 ; Subtracts 1 from the counter
OUT R1, OUT_PORT ; Outputs the popped value
CMP R0, 0X00 ; Checks if the counter is 0x00
BRNE POP_LOOP ; If the counter is not 0x00 the counter continues to pop values
BREQ END ; If R0 is 0x00 it ends the program

END:
