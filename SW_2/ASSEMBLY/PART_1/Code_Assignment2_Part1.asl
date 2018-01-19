

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
(0003)                       128  || .EQU THRESHOLD = 0x80
(0004)                       004  || .EQU DIVIDE = 0x04
(0005)                       002  || .EQU MULTIPLY = 0X02
(0006)                            || 
(0007)                            || ;--------------------------------------------------------------------------
(0008)                            || ;-- .ORG used in code segment
(0009)                            || ;--------------------------------------------------------------------------
(0010)                            || .CSEG
(0011)                       001  || .ORG 0x01 ; set the data segment counter to 0x01
(0012)                            || 
(0013)  CS-0x001  0x32030         || IN R0,IN_PORT
(0014)  CS-0x002  0x30080         || CMP R0,THRESHOLD
(0015)  CS-0x003  0x0A041         || BRCC DIVIDE_VALUE
(0016)  CS-0x004  0x08042         || BREQ DIVIDE_VALUE
(0017)                            || 
(0018)                     0x005  || MULTIPLY_VALUE:
(0019)  CS-0x005  0x18000         || CLC
(0020)  CS-0x006  0x10000         || LSL R0
(0021)  CS-0x007  0x08060         || BRN OUTPUT
(0022)                            || 
(0023)                     0x008  || DIVIDE_VALUE:
(0024)  CS-0x008  0x18000         || CLC
(0025)  CS-0x009  0x10001         || LSR R0
(0026)  CS-0x00A  0x18000         || CLC
(0027)  CS-0x00B  0x10001         || LSR R0
(0028)                            || 
(0029)                     0x00C  || OUTPUT:
(0030)  CS-0x00C  0x34042         || OUT R0,OUT_PORT
(0031)  CS-0x00D  0x08008         || BRN 0x01
(0032)                            || 
(0033)                            || 
(0034)                            || 
(0035)                            || 
(0036)                            || 
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
DIVIDE_VALUE   0x008   (0023)  ||  0015 0016 
MULTIPLY_VALUE 0x005   (0018)  ||  
OUTPUT         0x00C   (0029)  ||  0021 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
DIVIDE         0x004   (0004)  ||  
IN_PORT        0x030   (0001)  ||  0013 
MULTIPLY       0x002   (0005)  ||  
OUT_PORT       0x042   (0002)  ||  0030 
THRESHOLD      0x080   (0003)  ||  0014 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
