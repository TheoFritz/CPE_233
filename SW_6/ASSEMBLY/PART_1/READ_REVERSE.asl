

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
(0007)  CS-0x001  0x36000         || MOV R0, 0x00
(0008)  CS-0x002  0x3219A  0x002  || READ_VALE_LOOP: IN R1, IN_PORT
(0009)  CS-0x003  0x301FF         || CMP R1, 0xFF
(0010)  CS-0x004  0x08042         || BREQ POP_LOOP
(0011)  CS-0x005  0x12101         || PUSH R1
(0012)  CS-0x006  0x28001         || ADD R0, 0X01
(0013)  CS-0x007  0x08010         || BRN READ_VALE_LOOP
(0014)                            || 
(0015)                     0x008  || POP_LOOP:
(0016)  CS-0x008  0x12102         || POP R1
(0017)  CS-0x009  0x2C001         || SUB R0, 0X01
(0018)  CS-0x00A  0x34142         || OUT R1, OUT_PORT
(0019)  CS-0x00B  0x30000         || CMP R0, 0X00
(0020)  CS-0x00C  0x08043         || BRNE POP_LOOP
(0021)  CS-0x00D  0x08072         || BREQ END
(0022)                            || 
(0023)                     0x00E  || END:





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
END            0x00E   (0023)  ||  0021 
POP_LOOP       0x008   (0015)  ||  0010 0020 
READ_VALE_LOOP 0x002   (0008)  ||  0013 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0001)  ||  0008 
OUT_PORT       0x042   (0002)  ||  0018 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
