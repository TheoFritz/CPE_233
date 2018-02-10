

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || ; ----------------------------------------------------
(0002)                            || ;
(0003)                            || ; SW ASSIGNMENT No. 5 PART 1
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; LOADS TEN VALUES INTO MEMORY, AND SORTS FROM SMALLEST TO LARGEST.
(0008)                            || ; OUTPUTS ON OUT_PORT IN ORDER
(0009)                            || ; ----------------------------------------------------
(0010)                       154  || .EQU IN_PORT = 0x9A
(0011)                       066  || .EQU OUT_PORT = 0x42
(0012)                            || 
(0013)                            || 
(0014)                            || .CSEG
(0015)                       032  || .ORG 0x20
(0016)  CS-0x020  0x37E01         ||                     MOV  R30, 0x01
(0017)  CS-0x021  0x3600A         ||                     MOV  R0,  0x0A
(0018)  CS-0x022  0x36601         ||                     MOV  R6,  0x01
(0019)                            || 
(0020)  CS-0x023  0x3219A  0x023  || READ_VALUE_LOOP:    IN   R1,   IN_PORT                ; READ VALUE FROM IN_PORT TO ASSIGN TO MEMORY
(0021)  CS-0x024  0x04103         ||                     ST   R1,   (R0)                   ; STORE VALUE FROM IN_PORT IN MEMORY
(0022)  CS-0x025  0x2C001         ||                     SUB  R0,   0x01                   ; SUBTRACT COUNTER
(0023)  CS-0x026  0x30000         ||                     CMP  R0,   0x00                   ; COMPARE COUNTER TO ZERO
(0024)  CS-0x027  0x0814A         ||                     BREQ       MAIN_OUTER_LOOP        ; IF COUNT == 0, GOTO MAIN LOOP
(0025)  CS-0x028  0x0811B         ||                     BRNE       READ_VALUE_LOOP        ; ELSE RETURN TO READ_VALUE_LOOP
(0026)                            || 
(0027)  CS-0x029  0x28601  0x029  || MAIN_OUTER_LOOP:    ADD  R6,  0x01                    ; TOTAL LOOP ITTERATION COUNTER
(0028)  CS-0x02A  0x3060B         || 			              CMP  R6,  0x0B                    ; CHECKC IF LOOP HAS ITTERATED THE CORRECT NUMBER OF TIMES
(0029)  CS-0x02B  0x0A1D1         || 				            BRCC      OUTPUT_VALUES           ; IF TOTAL ITTERATION COMPLETE, OUTPUT
(0030)  CS-0x02C  0x3620A         || 				            MOV  R2,  0x0A                    ; RESET COMPARE REG 1
(0031)  CS-0x02D  0x36309         || 				            MOV  R3,  0x09                    ; RESET COMPARE REG 2
(0032)                            || 
(0033)  CS-0x02E  0x04412  0x02E  || SORT_FUNC:          LD   R4,  (R2)                    ; LOAD VALUE FROM LOCATION STORED IN R2 TO R4
(0034)  CS-0x02F  0x0451A         ||                     LD   R5,  (R3)                    ; LOAD VALUE FROM LOCATION STORED IN R2 TO R4
(0035)  CS-0x030  0x04520         ||                     CMP  R5,  R4                      ; CHECK TWO VALUES TO DETERMINE SMALLER VALUE
(0036)  CS-0x031  0x0A199         ||                     BRCC      SWAP_VALUES             ; IF VALUE LARGER, SWAP
(0037)  CS-0x032  0x0A1A8         || 				            BRCS      AFTER_SWAP_VALUES       ; ELSE DON'T SWAP
(0038)                            || 
(0039)  CS-0x033  0x04513  0x033  || SWAP_VALUES:        ST   R5,  (R2)                    ; PUT VALUE IN R5 IN LOCATION REFERENCED IN R2
(0040)  CS-0x034  0x0441B         || 				            ST   R4,  (R3)                    ; PUT VALUE IN R4 IN LOCATION REFERENCED IN R3
(0041)                            || 
(0042)  CS-0x035  0x2C201  0x035  || AFTER_SWAP_VALUES:  SUB  R2,  0x01                    ; SUBTRACT COMPARE REGISTERS
(0043)  CS-0x036  0x2C301         || 				            SUB  R3,  0x01                    ; SUBTRACT COMPARE REGISTERS
(0044)  CS-0x037  0x05E10         || 				            CMP  R30, R2                      ; TEST IF R2 == 0x01
(0045)  CS-0x038  0x0A170         || 				            BRCS      SORT_FUNC               ; IF YES, GOTO SORTING FUNCTION
(0046)  CS-0x039  0x08148         || 				            BRN       MAIN_OUTER_LOOP         ; ELSE RUN MAIN LOOP AGAIN
(0047)                            || 
(0048)  CS-0x03A  0x36601  0x03A  || OUTPUT_VALUES:      MOV  R6,  0x01                    ; INITALIZES COUNT REGISTER
(0049)                            || 
(0050)  CS-0x03B  0x04532  0x03B  || OUT_VALUES_LOOP:    LD   R5,  (R6)                    ; LOADS VALUE IN MEMORY FROM LOCATION SPECIFIED IN R6
(0051)  CS-0x03C  0x34542         || 				            OUT  R5,  OUT_PORT                ; OUTPUTS REGISTER VALUE TO OUTPORT
(0052)  CS-0x03D  0x28601         || 				            ADD  R6,  0x01                    ; INCREMENT COUNT REGISTER
(0053)  CS-0x03E  0x3060B         || 			              CMP  R6,  0x0B                    ; COMPARE IF R6 IS AT MAX
(0054)  CS-0x03F  0x0A1D8         || 				            BRCS      OUT_VALUES_LOOP         ; ELSE BREAK TO OUT LOOP





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
AFTER_SWAP_VALUES 0x035   (0042)  ||  0037 
MAIN_OUTER_LOOP 0x029   (0027)  ||  0024 0046 
OUTPUT_VALUES  0x03A   (0048)  ||  0029 
OUT_VALUES_LOOP 0x03B   (0050)  ||  0054 
READ_VALUE_LOOP 0x023   (0020)  ||  0025 
SORT_FUNC      0x02E   (0033)  ||  0045 
SWAP_VALUES    0x033   (0039)  ||  0036 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0010)  ||  0020 
OUT_PORT       0x042   (0011)  ||  0051 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
