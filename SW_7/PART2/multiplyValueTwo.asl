

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
(0003)                            || ; SW ASSIGNMENT No. 7 PART 2
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; MULTIPLIES TWO 8 BIT NUMBERS TOGETHER AND SEPERATES THE
(0008)                            || ; EIGHTEEN BIT RESULT INTO A HIGH 8 BITS AND A LOW 8 BITS
(0009)                            || ; ----------------------------------------------------
(0010)                            || .CSEG
(0011)                       032  || .ORG 0x20
(0012)                            || 
(0013)                            || 
(0014)                     0x020  || MAIN:
(0015)  CS-0x020  0x36200         || MOV R2, 0x00
(0016)  CS-0x021  0x36300         || MOV R3, 0x00
(0017)  CS-0x022  0x32020         || IN R0, 0x20
(0018)  CS-0x023  0x30000         || CMP R0, 0x00
(0019)  CS-0x024  0x08182         || BREQ OUTPUT_ZERO_VAL
(0020)  CS-0x025  0x32121         || IN R1, 0x21
(0021)  CS-0x026  0x30100         || CMP R1, 0x00
(0022)  CS-0x027  0x08182         || BREQ OUTPUT_ZERO_VAL
(0023)  CS-0x028  0x04209         || MOV R2, R1
(0024)  CS-0x029  0x081A9  0x029  || MULTIPLY: CALL MULTIPLY_VAL
(0025)  CS-0x02A  0x2C201         || SUB R2, 0x01
(0026)  CS-0x02B  0x0816A         || BREQ OUTPUT_VAL
(0027)  CS-0x02C  0x08148         || BRN MULTIPLY
(0028)                            || 
(0029)  CS-0x02D  0x34341  0x02D  || OUTPUT_VAL: OUT R3, 0x41
(0030)  CS-0x02E  0x34442         || OUT R4, 0x42
(0031)  CS-0x02F  0x08280         || BRN 0x50
(0032)                            || 
(0033)  CS-0x030  0x36300  0x030  || OUTPUT_ZERO_VAL: MOV R3, 0x00
(0034)  CS-0x031  0x36000         || MOV R0, 0x00
(0035)  CS-0x032  0x34341         || OUT R3, 0x41
(0036)  CS-0x033  0x34042         || OUT R0, 0x42
(0037)  CS-0x034  0x08280         || BRN 0x50
(0038)                            || 
(0039)  CS-0x035  0x02400  0x035  || MULTIPLY_VAL: ADD R4,R0
(0040)  CS-0x036  0x2A300         || ADDC R3, 0x00
(0041)  CS-0x037  0x18002         || RET





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
MAIN           0x020   (0014)  ||  
MULTIPLY       0x029   (0024)  ||  0027 
MULTIPLY_VAL   0x035   (0039)  ||  0024 
OUTPUT_VAL     0x02D   (0029)  ||  0026 
OUTPUT_ZERO_VAL 0x030   (0033)  ||  0019 0022 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
--> No ".EQU" directives used


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
