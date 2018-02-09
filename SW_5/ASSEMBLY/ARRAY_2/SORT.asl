

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


(0001)                       154  || .EQU IN_PORT = 0x9A
(0002)                       066  || .EQU OUT_PORT = 0x42
(0003)                            || 
(0004)                            || 
(0005)                            || .CSEG
(0006)                       032  || .ORG 0x20
(0007)  CS-0x020  0x37E01         || MOV R30, 0x01
(0008)  CS-0x021  0x3600A         || MOV R0, 0x0A
(0009)  CS-0x022  0x36601         || MOV R6, 0x01
(0010)  CS-0x023  0x3219A  0x023  || READ_VALUE_LOOP:  IN R1, IN_PORT
(0011)  CS-0x024  0x04103         ||                   ST R1, (R0)
(0012)  CS-0x025  0x2C001         ||                   SUB R0, 0x01
(0013)  CS-0x026  0x30000         ||                   CMP R0, 0x00
(0014)  CS-0x027  0x0814A         ||                   BREQ MAIN_OUTER_LOOP
(0015)  CS-0x028  0x0811B         ||                   BRNE READ_VALUE_LOOP
(0016)                            || 
(0017)                     0x029  || MAIN_OUTER_LOOP:  
(0018)  CS-0x029  0x28601         || 				  ADD R6, 0x01
(0019)  CS-0x02A  0x3060B         || 			      CMP R6, 0x0B
(0020)  CS-0x02B  0x0A1D1         || 				  BRCC OUTPUT_VALUES
(0021)  CS-0x02C  0x3620A         || 				  MOV R2, 0x0A
(0022)  CS-0x02D  0x36309         || 				  MOV R3, 0x09
(0023)                     0x02E  || SORT_FUNC:        
(0024)                            || 
(0025)  CS-0x02E  0x04412         || 				  LD R4, (R2)
(0026)  CS-0x02F  0x0451A         ||                   LD R5, (R3)
(0027)  CS-0x030  0x04520         ||                   CMP R5, R4
(0028)  CS-0x031  0x0A199         ||                   BRCC SWAP_VALUES
(0029)  CS-0x032  0x0A1A8         || 				  BRCS AFTER_SWAP_VALUES
(0030)  CS-0x033  0x04513  0x033  || SWAP_VALUES:      ST R5, (R2)
(0031)  CS-0x034  0x0441B         || 				  ST R4, (R3)
(0032)  CS-0x035  0x2C201  0x035  || AFTER_SWAP_VALUES:SUB R2, 0x01
(0033)  CS-0x036  0x2C301         || 				  SUB R3, 0x01
(0034)  CS-0x037  0x05E10         || 				  CMP R30, R2
(0035)  CS-0x038  0x0A170         || 				  BRCS SORT_FUNC
(0036)  CS-0x039  0x08148         || 				  BRN MAIN_OUTER_LOOP
(0037)                            || 
(0038)  CS-0x03A  0x36601  0x03A  || OUTPUT_VALUES:    MOV R6, 0x01
(0039)  CS-0x03B  0x04532  0x03B  || OUT_VALUES_LOOP:  LD R5, (R6)
(0040)  CS-0x03C  0x34542         || 				  OUT R5, OUT_PORT
(0041)  CS-0x03D  0x28601         || 				  ADD R6, 0x01
(0042)  CS-0x03E  0x3060B         || 			      CMP R6, 0x0B
(0043)  CS-0x03F  0x0A1D8         || 				  BRCS OUT_VALUES_LOOP





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
AFTER_SWAP_VALUES 0x035   (0032)  ||  0029 
MAIN_OUTER_LOOP 0x029   (0017)  ||  0014 0036 
OUTPUT_VALUES  0x03A   (0038)  ||  0020 
OUT_VALUES_LOOP 0x03B   (0039)  ||  0043 
READ_VALUE_LOOP 0x023   (0010)  ||  0015 
SORT_FUNC      0x02E   (0023)  ||  0035 
SWAP_VALUES    0x033   (0030)  ||  0028 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0001)  ||  0010 
OUT_PORT       0x042   (0002)  ||  0040 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
