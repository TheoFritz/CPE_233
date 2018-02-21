

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


(0001)                            || ;--------------------------------------------------------------------
(0002)                            || ;- Port and Memory Constants
(0003)                            || ;--------------------------------------------------------------------
(0004)                       032  || .EQU SWITCH_PORT = 0x20 ; port for switch input
(0005)                       064  || .EQU LED_PORT = 0x40 ; port for LED output
(0006)                            || .CSEG
(0007)                       016  || .ORG 0x10
(0008)                     0x010  || main:
(0009)  CS-0x010  0x32A20         ||  IN r10,SWITCH_PORT
(0010)  CS-0x011  0x36BFF         ||  MOV r11,0xFF
(0011)  CS-0x012  0x00A5A         ||  EXOR r10,r11
(0012)  CS-0x013  0x34A40         ||  OUT r10,LED_PORT
(0013)  CS-0x014  0x08080         ||  BRN main





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
MAIN           0x010   (0008)  ||  0013 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
LED_PORT       0x040   (0005)  ||  0012 
SWITCH_PORT    0x020   (0004)  ||  0009 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
