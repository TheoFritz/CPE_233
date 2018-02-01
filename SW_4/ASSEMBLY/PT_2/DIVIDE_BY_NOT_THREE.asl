

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
(0004)                            || .CSEG
(0005)                       001  || .ORG 0x01
(0006)                            || 
(0007)  CS-0x001  0x3209A         || IN R0, IN_PORT
(0008)  CS-0x002  0x3219A         || IN R1, IN_PORT
(0009)  CS-0x003  0x36200         || MOV R2, 0x00
(0010)                     0x004  || DIVIDE_LOOP:
(0011)  CS-0x004  0x0200A         || SUB R0, R1
(0012)  CS-0x005  0x0804A         || BREQ OUTPUT_EQUAL
(0013)  CS-0x006  0x0A050         || BRCS OUTPUT
(0014)  CS-0x007  0x28201         || ADD R2, 0x01
(0015)  CS-0x008  0x08020         || BRN DIVIDE_LOOP
(0016)                            || 
(0017)                     0x009  || OUTPUT_EQUAL:
(0018)  CS-0x009  0x28201         || ADD R2, 0x01
(0019)                            || 
(0020)  CS-0x00A  0x34242  0x00A  || OUTPUT: OUT R2, OUT_PORT





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
DIVIDE_LOOP    0x004   (0010)  ||  0015 
OUTPUT         0x00A   (0020)  ||  0013 
OUTPUT_EQUAL   0x009   (0017)  ||  0012 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0001)  ||  0007 0008 
OUT_PORT       0x042   (0002)  ||  0020 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
