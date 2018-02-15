

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
(0002)                       066  || .EQU OUT_PORT = 0X42
(0003)                            || 
(0004)                            || 
(0005)                            || .CSEG
(0006)                       001  || .ORG 0x01
(0007)                            || 
(0008)  CS-0x001  0x36000         || MOV R0, 0x00
(0009)  CS-0x002  0x36300         || MOV R3, 0x00
(0010)  CS-0x003  0x3219A  0x003  || READ_VALUE_LOOP: IN R1, IN_PORT
(0011)  CS-0x004  0x301FF         || CMP R1, 0xFF
(0012)  CS-0x005  0x0804A         || BREQ LOAD_LOOP
(0013)  CS-0x006  0x12101         || PUSH R1
(0014)  CS-0x007  0x28001         || ADD R0, 0X01
(0015)  CS-0x008  0x08018         || BRN READ_VALUE_LOOP
(0016)                            || 
(0017)                     0x009  || LOAD_LOOP:
(0018)  CS-0x009  0x0420A         || LD R2,(R1)
(0019)  CS-0x00A  0x2C101         || SUB R1, 0x01
(0020)  CS-0x00B  0x28301         || ADD R3, 0x01
(0021)  CS-0x00C  0x34242         || OUT R2, OUT_PORT
(0022)  CS-0x00D  0x04300         || CMP R3,R0
(0023)  CS-0x00E  0x08082         || BREQ END
(0024)  CS-0x00F  0x0804B         || BRNE LOAD_LOOP
(0025)                            || 
(0026)                            || 
(0027)                     0x010  || END:





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
END            0x010   (0027)  ||  0023 
LOAD_LOOP      0x009   (0017)  ||  0012 0024 
READ_VALUE_LOOP 0x003   (0010)  ||  0015 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0001)  ||  0010 
OUT_PORT       0x042   (0002)  ||  0021 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
