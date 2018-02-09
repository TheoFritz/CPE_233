; ----------------------------------------------------
;
; SW ASSIGNMENT No. 4 PART 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; LOADS TEN VALUES INTO MEMORY, AND SORTS FROM SMALLEST TO LARGEST.
; OUTPUTS ON OUT_PORT IN ORDER
; ----------------------------------------------------
.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42


.CSEG
.ORG 0x20
                    MOV  R30, 0x01
                    MOV  R0,  0x0A
                    MOV  R6,  0x01

READ_VALUE_LOOP:    IN   R1,   IN_PORT                ; READ VALUE FROM IN_PORT TO ASSIGN TO MEMORY
                    ST   R1,   (R0)                   ; STORE VALUE FROM IN_PORT IN MEMORY
                    SUB  R0,   0x01                   ; SUBTRACT COUNTER
                    CMP  R0,   0x00                   ; COMPARE COUNTER TO ZERO
                    BREQ       MAIN_OUTER_LOOP        ; IF COUNT == 0, GOTO MAIN LOOP
                    BRNE       READ_VALUE_LOOP        ; ELSE RETURN TO READ_VALUE_LOOP

MAIN_OUTER_LOOP:    ADD  R6,  0x01                    ; TOTAL LOOP ITTERATION COUNTER
			              CMP  R6,  0x0B                    ; CHECKC IF LOOP HAS ITTERATED THE CORRECT NUMBER OF TIMES
				            BRCC      OUTPUT_VALUES           ; IF TOTAL ITTERATION COMPLETE, OUTPUT
				            MOV  R2,  0x0A                    ; RESET COMPARE REG 1
				            MOV  R3,  0x09                    ; RESET COMPARE REG 2

SORT_FUNC:          LD   R4,  (R2)                    ; LOAD VALUE FROM LOCATION STORED IN R2 TO R4
                    LD   R5,  (R3)                    ; LOAD VALUE FROM LOCATION STORED IN R2 TO R4
                    CMP  R5,  R4                      ; CHECK TWO VALUES TO DETERMINE SMALLER VALUE
                    BRCC      SWAP_VALUES             ; IF VALUE LARGER, SWAP
				            BRCS      AFTER_SWAP_VALUES       ; ELSE DON'T SWAP

SWAP_VALUES:        ST   R5,  (R2)                    ; PUT VALUE IN R5 IN LOCATION REFERENCED IN R2
				            ST   R4,  (R3)                    ; PUT VALUE IN R4 IN LOCATION REFERENCED IN R3

AFTER_SWAP_VALUES:  SUB  R2,  0x01                    ; SUBTRACT COMPARE REGISTERS
				            SUB  R3,  0x01                    ; SUBTRACT COMPARE REGISTERS
				            CMP  R30, R2                      ; TEST IF R2 == 0x01
				            BRCS      SORT_FUNC               ; IF YES, GOTO SORTING FUNCTION
				            BRN       MAIN_OUTER_LOOP         ; ELSE RUN MAIN LOOP AGAIN

OUTPUT_VALUES:      MOV  R6,  0x01                    ; INITALIZES COUNT REGISTER

OUT_VALUES_LOOP:    LD   R5,  (R6)                    ; LOADS VALUE IN MEMORY FROM LOCATION SPECIFIED IN R6
				            OUT  R5,  OUT_PORT                ; OUTPUTS REGISTER VALUE TO OUTPORT
				            ADD  R6,  0x01                    ; INCREMENT COUNT REGISTER
			              CMP  R6,  0x0B                    ; COMPARE IF R6 IS AT MAX
				            BRCS      OUT_VALUES_LOOP         ; ELSE BREAK TO OUT LOOP
