

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
(0003)                            || ; SW ASSIGNMENT No. 4 PART 2
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; READS TWO VALUE IN FROM IN_PORT (0x9A) THEN DIVIDES BY THE SECOND VALUE
(0008)                            || ; AND OUTPUTS TO OUT_PORT (0x42)
(0009)                            || ; ----------------------------------------------------
(0010)                            || 
(0011)                       154  || .EQU IN_PORT = 0x9A
(0012)                       066  || .EQU OUT_PORT = 0x42
(0013)                            || 
(0014)                            || ;--------------------------------------------------------------------------
(0015)                            || ;-- .ORG used in code segment
(0016)                            || ;--------------------------------------------------------------------------
(0017)                            || .CSEG
(0018)                       001  || .ORG 0x01                ; SET DATA SEGMENT COUNTER TO 0x01
(0019)                            || 
(0020)  CS-0x001  0x3209A         || IN R0, IN_PORT           ; R0 TAKES IN VALUE OF IN_PORT ("NUMERATOR")
(0021)  CS-0x002  0x3219A         || IN R1, IN_PORT           ; R1 TAKES IN VALUE OF IN_PORT ("DENOMINATOR")
(0022)  CS-0x003  0x36200         || MOV R2, 0x00             ; CLEAR COUNT REG
(0023)                     0x004  || DIVIDE_LOOP:
(0024)  CS-0x004  0x0200A         || SUB R0, R1
(0025)  CS-0x005  0x0804A         || BREQ OUTPUT_EQUAL        ; CHECKS IF THE DIVISOR FACTOR IS EVENLY DIVISIBLE INTO
(0026)                            ||                          ; INPUT NUMBER
(0027)  CS-0x006  0x0A050         || BRCS OUTPUT              ; IF IT IS NOT DIVISIBLE, CARRY WILL BE SET TO 1, OUTPUT
(0028)  CS-0x007  0x28201         || ADD R2, 0x01             ; INCREMENT COUNTER
(0029)  CS-0x008  0x08020         || BRN DIVIDE_LOOP          ; RETURN TO DIVIDE_LOOP
(0030)                            || 
(0031)                     0x009  || OUTPUT_EQUAL:
(0032)  CS-0x009  0x28201         || ADD R2, 0x01             ; IF IT IS EQUAL, ADD 1 AGAIN
(0033)                            || 
(0034)  CS-0x00A  0x34242  0x00A  || OUTPUT: OUT R2, OUT_PORT ; OUTPUT VALUE





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
DIVIDE_LOOP    0x004   (0023)  ||  0029 
OUTPUT         0x00A   (0034)  ||  0027 
OUTPUT_EQUAL   0x009   (0031)  ||  0025 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0011)  ||  0020 0021 
OUT_PORT       0x042   (0012)  ||  0034 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
