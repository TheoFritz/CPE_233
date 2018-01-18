

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
(0002)                       066  || .EQU OUT_PORT = 0x42
(0003)                            || 
(0004)                            || 
(0005)                            || ;--------------------------------------------------------------------------
(0006)                            || ;-- .ORG used in code segment
(0007)                            || ;--------------------------------------------------------------------------
(0008)                            || .CSEG
(0009)                       001  || .ORG 0x01 ; set the data segment counter to 0x01
(0010)                            || 
(0011)  CS-0x001  0x32030         || IN R0,IN_PORT
(0012)  CS-0x002  0x04101         || MOV R1,R0
(0013)                            || 
(0014)  CS-0x003  0x18000         || CLC 
(0015)  CS-0x004  0x10100         || LSL R1
(0016)  CS-0x005  0x0A059         || BRCC IS_ODD
(0017)                            || 
(0018)  CS-0x006  0x18000         || CLC
(0019)  CS-0x007  0x10100         || LSL R1
(0020)  CS-0x008  0x0A078         || BRCS IS_DIVISIBLE_BY_FOUR
(0021)                            || 
(0022)  CS-0x009  0x2C001         || SUB R0,0x01
(0023)  CS-0x00A  0x08088         || BRN OUTPUT
(0024)                            || 
(0025)                     0x00B  || IS_ODD:
(0026)  CS-0x00B  0x28011         || ADD R0,0x11
(0027)  CS-0x00C  0x18000         || CLC
(0028)  CS-0x00D  0x10000         || LSL R0
(0029)  CS-0x00E  0x08088         || BRN OUTPUT
(0030)                            || 
(0031)                     0x00F  || IS_DIVISIBLE_BY_FOUR:
(0032)  CS-0x00F  0x240FF         || EXOR R0,0xFF
(0033)  CS-0x010  0x08088         || BRN OUTPUT
(0034)                            || 
(0035)                     0x011  || OUTPUT:
(0036)  CS-0x011  0x34042         || OUT R0,OUT_PORT
(0037)                            ||  





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
IS_DIVISIBLE_BY_FOUR 0x00F   (0031)  ||  0020 
IS_ODD         0x00B   (0025)  ||  0016 
OUTPUT         0x011   (0035)  ||  0023 0029 0033 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x030   (0001)  ||  0011 
OUT_PORT       0x042   (0002)  ||  0036 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
