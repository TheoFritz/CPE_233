

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


(0001)                       048  || .EQU IN_PORT = 0x30
(0002)                       064  || .EQU OUT_PORT = 0x40
(0003)                            || ;--------------------------------------------------------------------------
(0004)                            || ;-- .ORG used in data segment
(0005)                            || ;--------------------------------------------------------------------------
(0006)                            || 
(0007)                            || 
(0008)                            || .DSEG
(0009)                       000  || .ORG 0x00 ; sets the code segment counter to 0x34
(0010)                            || 
(0011)                            || ;--------------------------------------------------------------------------
(0012)                            || ;-- .ORG used in code segment
(0013)                            || ;--------------------------------------------------------------------------
(0014)                            || .CSEG
(0015)                       001  || .ORG 0x01 ; set the data segment counter to 0x5A
(0016)  CS-0x001  0x36000  0x001  || MAIN : MOV R0,0x00
(0017)  CS-0x002  0x36100         || MOV R1,0x00
(0018)  CS-0x003  0x32030         || IN R0,IN_PORT
(0019)  CS-0x004  0x02100         || ADD R1,R0
(0020)  CS-0x005  0x32030         || IN R0,IN_PORT
(0021)  CS-0x006  0x02100         || ADD R1,R0
(0022)  CS-0x007  0x32030         || IN R0,IN_PORT
(0023)  CS-0x008  0x02100         || ADD R1,R0
(0024)  CS-0x009  0x34140         || OUT R1, OUT_PORT
(0025)  CS-0x00A  0x08008         || BRN MAIN





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
MAIN           0x001   (0016)  ||  0025 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x030   (0001)  ||  0018 0020 0022 
OUT_PORT       0x040   (0002)  ||  0024 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
