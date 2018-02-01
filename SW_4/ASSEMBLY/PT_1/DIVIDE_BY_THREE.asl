

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
(0003)                       003  || .EQU DIV_FACTOR = 0x03
(0004)                            || 
(0005)                            || .CSEG
(0006)                       001  || .ORG 0x01
(0007)                            || 
(0008)  CS-0x001  0x3209A         || IN R0, IN_PORT
(0009)  CS-0x002  0x36100         || MOV R1, 0x00
(0010)                     0x003  || DIVIDE_LOOP:
(0011)  CS-0x003  0x2C003         || SUB R0, DIV_FACTOR
(0012)  CS-0x004  0x08042         || BREQ OUTPUT_EQUAL
(0013)  CS-0x005  0x0A048         || BRCS OUTPUT
(0014)  CS-0x006  0x28101         || ADD R1, 0x01
(0015)  CS-0x007  0x08018         || BRN DIVIDE_LOOP
(0016)                            || 
(0017)                     0x008  || OUTPUT_EQUAL:
(0018)  CS-0x008  0x28101         || ADD R1, 0x01
(0019)                            || 
(0020)  CS-0x009  0x34142  0x009  || OUTPUT: OUT R1, OUT_PORT





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
DIVIDE_LOOP    0x003   (0010)  ||  0015 
OUTPUT         0x009   (0020)  ||  0013 
OUTPUT_EQUAL   0x008   (0017)  ||  0012 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
DIV_FACTOR     0x003   (0003)  ||  0011 
IN_PORT        0x09A   (0001)  ||  0008 
OUT_PORT       0x042   (0002)  ||  0020 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
