

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


(0001)                       048  || .EQU SW = 0X30
(0002)                       049  || .EQU LEDS = 0X31
(0003)                            || ;--------------------------------------------------------------------------
(0004)                            || ;-- .ORG used in code segment
(0005)                            || ;--------------------------------------------------------------------------
(0006)                            || .CSEG
(0007)                       064  || .ORG 0x40 ; set the data segment counter to 0x01
(0008)  CS-0x040  0x32030  0x040  || MAIN: IN R0,SW
(0009)  CS-0x041  0x36BFF         || MOV R11,0xFF
(0010)  CS-0x042  0x00A5A         || EXOR R10, R11
(0011)  CS-0x043  0x34A31         || OUT R10,LEDS
(0012)  CS-0x044  0x08200         || BRN MAIN
(0013)                       080  || .ORG 0X50





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
MAIN           0x040   (0008)  ||  0012 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
LEDS           0x031   (0002)  ||  0011 
SW             0x030   (0001)  ||  0008 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
