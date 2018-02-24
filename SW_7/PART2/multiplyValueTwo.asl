

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
(0019)  CS-0x024  0x0818A         || BREQ OUTPUT_ZERO_VAL
(0020)  CS-0x025  0x32121         || IN R1, 0x21
(0021)  CS-0x026  0x30100         || CMP R1, 0x00
(0022)  CS-0x027  0x0818A         || BREQ OUTPUT_ZERO_VAL
(0023)  CS-0x028  0x04209         || MOV R2, R1
(0024)  CS-0x029  0x081B1  0x029  || MULTIPLY: CALL MULTIPLY_VAL
(0025)  CS-0x02A  0x2C201         || SUB R2, 0x01
(0026)  CS-0x02B  0x30201         || CMP R2, 0x01
(0027)  CS-0x02C  0x08172         || BREQ OUTPUT_VAL
(0028)  CS-0x02D  0x08148         || BRN MULTIPLY
(0029)                            || 
(0030)  CS-0x02E  0x34341  0x02E  || OUTPUT_VAL: OUT R3, 0x41
(0031)  CS-0x02F  0x34042         || OUT R0, 0x42
(0032)  CS-0x030  0x08280         || BRN 0x50
(0033)                            || 
(0034)  CS-0x031  0x36300  0x031  || OUTPUT_ZERO_VAL: MOV R3, 0x00
(0035)  CS-0x032  0x36000         || MOV R0, 0x00
(0036)  CS-0x033  0x34341         || OUT R3, 0x41
(0037)  CS-0x034  0x34042         || OUT R0, 0x42
(0038)  CS-0x035  0x08280         || BRN 0x50
(0039)                            || 
(0040)  CS-0x036  0x02008  0x036  || MULTIPLY_VAL: ADD R0,R1
(0041)  CS-0x037  0x0A1C9         || BRCC SKIP_ADD_UPPER
(0042)  CS-0x038  0x28301         || ADD R3, 0x01
(0043)                     0x039  || SKIP_ADD_UPPER:
(0044)  CS-0x039  0x18002         || RET
(0045)                            || 
(0046)                            || 
(0047)                            || 
(0048)                            || 





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
MULTIPLY       0x029   (0024)  ||  0028 
MULTIPLY_VAL   0x036   (0040)  ||  0024 
OUTPUT_VAL     0x02E   (0030)  ||  0027 
OUTPUT_ZERO_VAL 0x031   (0034)  ||  0019 0022 
SKIP_ADD_UPPER 0x039   (0043)  ||  0041 


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
