

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
(0002)                       064  || .EQU PWM_PORT = 0x40
(0003)                            || ;--------------------------------------------------------------------------
(0004)                            || ;-- .ORG used in data segment
(0005)                            || ;--------------------------------------------------------------------------
(0006)                            || 
(0007)                            || 
(0008)                            || .DSEG
(0009)                       000  || .ORG 0x00 ; sets the code segment counter to 0x00
(0010)                            || 
(0011)                            || ;--------------------------------------------------------------------------
(0012)                            || ;-- .ORG used in code segment
(0013)                            || ;--------------------------------------------------------------------------
(0014)                            || .CSEG
(0015)                       001  || .ORG 0x01 ; set the data segment counter to 0x01
(0016)  CS-0x001  0x36000  0x001  || MAIN : MOV R0,0x00  
(0017)  CS-0x002  0x34040  0x002  || ADD_1: OUT R0,PWM_PORT
(0018)  CS-0x003  0x300FF         ||        CMP R0,0xFF
(0019)  CS-0x004  0x28001         || 	   ADD R0,0x01
(0020)  CS-0x005  0x0A038         ||        BRCS END_PROGRAM
(0021)  CS-0x006  0x08010         ||        BRN ADD_1
(0022)                            || 
(0023)                     0x007  ||        END_PROGRAM:
(0024)                            || 
(0025)                            || 





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
ADD_1          0x002   (0017)  ||  0021 
END_PROGRAM    0x007   (0023)  ||  0020 
MAIN           0x001   (0016)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x030   (0001)  ||  
PWM_PORT       0x040   (0002)  ||  0017 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
