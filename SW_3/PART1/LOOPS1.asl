

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
(0004)                            || ;--------------------------------------------------------------------------
(0005)                            || ;-- .ORG used in code segment
(0006)                            || ;--------------------------------------------------------------------------
(0007)                            || .CSEG
(0008)                       001  || .ORG 0x01 ; set the data segment counter to 0x01
(0009)                            || 
(0010)  CS-0x001  0x3209A         || IN R0,IN_PORT
(0011)  CS-0x002  0x04101         || MOV R1,R0
(0012)  CS-0x003  0x36200         || MOV R2, 0x00
(0013)  CS-0x004  0x36300         || MOV R3, 0x00
(0014)  CS-0x005  0x2000F         || AND R0,0x0F
(0015)  CS-0x006  0x201F0         || AND R1,0xF0
(0016)  CS-0x007  0x18000         || CLC
(0017)  CS-0x008  0x10101         || LSR R1
(0018)  CS-0x009  0x10101         || LSR R1
(0019)  CS-0x00A  0x10101         || LSR R1
(0020)  CS-0x00B  0x10101         || LSR R1
(0021)                            || 
(0022)                     0x00C  || MULTIPLY: 
(0023)  CS-0x00C  0x04308         || CMP R3,R1
(0024)  CS-0x00D  0x0808A         || BREQ OUTPUT
(0025)  CS-0x00E  0x02200         || ADD R2, R0
(0026)  CS-0x00F  0x28301         || ADD R3, 0X01
(0027)  CS-0x010  0x08060         || BRN MULTIPLY
(0028)                            || 
(0029)                     0x011  || OUTPUT:
(0030)  CS-0x011  0x34242         || OUT R2, OUT_PORT





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
MULTIPLY       0x00C   (0022)  ||  0027 
OUTPUT         0x011   (0029)  ||  0024 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0001)  ||  0010 
OUT_PORT       0x042   (0002)  ||  0030 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
