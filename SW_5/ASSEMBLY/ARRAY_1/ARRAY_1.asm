.EQU OUT_PORT = 0x42

.DSEG
.ORG 0x20 ; Starts the DSEG at 0x20
FIB_SEQ: .DB 0x01, 0x01, 0x02, 0x03, 0x05 ; First thirteen entries of the Fibonacci
         .DB 0x08, 0x0D, 0x15, 0x22, 0x37
		     .DB 0x59, 0x90, 0xE9

.CSEG
.ORG 0x40 ; Starts the Code Segment at 0x40
MOV R0, 0x20 ; Points to the first value in the array 
MOV R1, 0x23 ; Points to the second value in the array
MAIN: LD R2, (R0) ; Loads the value pointed to in R0 into R2
      LD R3, (R1) ; Loads the value pointed to in R1 into R3
      SUB R3, R2 ; Subtracts R3 from R2
      OUT R3, OUT_PORT ; Outs the result to 0x42
      ADD R0, 0x01 ; Adds 1 to R0 in order to increment the value
      ADD R1, 0x01 ; Adds 1 to R0 in order to increment the value
	  CLC ; Clears the carry
	  CMP R0, 0x2A ; Compares the value in R0 to 0x2A the amount of times the program is supposed to loop
      BRCS MAIN ; Branches to main
