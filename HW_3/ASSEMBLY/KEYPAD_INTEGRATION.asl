

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


(0001)                       034  || .EQU KEYPAD = 0x22
(0002)                       066  || .EQU OUT_PORT = 0x42
(0003)                            || 
(0004)                            || .CSEG
(0005)                       001  || .ORG 0X01; Starts CSEG at 0x01
(0006)                            || 
(0007)  CS-0x001  0x36000         || MOV R0, 0x00
(0008)  CS-0x002  0x32022  0x002  || FIRST_DIGIT: IN R0, KEYPAD
(0009)  CS-0x003  0x30000         || CMP R0, 0x00
(0010)  CS-0x004  0x08032         || BREQ SECOND_DIGIT
(0011)  CS-0x005  0x08013         || BRNE FIRST_DIGIT
(0012)                            || 
(0013)                     0x006  || SECOND_DIGIT:
(0014)  CS-0x006  0x32022         || IN R0, KEYPAD
(0015)  CS-0x007  0x30004         || CMP R0, 0X04
(0016)  CS-0x008  0x08052         || BREQ THIRD_DIGIT
(0017)  CS-0x009  0x08013         || BRNE FIRST_DIGIT
(0018)                            || 
(0019)                     0x00A  || THIRD_DIGIT:
(0020)  CS-0x00A  0x32022         || IN R0, KEYPAD
(0021)  CS-0x00B  0x30001         || CMP R0, 0X01
(0022)  CS-0x00C  0x08072         || BREQ FOURTH_DIGIT 
(0023)  CS-0x00D  0x08013         || BRNE FIRST_DIGIT
(0024)                            || 
(0025)                     0x00E  || FOURTH_DIGIT:
(0026)  CS-0x00E  0x32022         || IN R0, KEYPAD
(0027)  CS-0x00F  0x30000         || CMP R0, 0X00
(0028)  CS-0x010  0x08092         || BREQ DONE
(0029)  CS-0x011  0x08013         || BRNE FIRST_DIGIT
(0030)                            || 
(0031)                     0x012  || DONE:
(0032)  CS-0x012  0x36101         || MOV R1, 0X01
(0033)  CS-0x013  0x34142         || OUT R1, OUT_PORT





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
DONE           0x012   (0031)  ||  0028 
FIRST_DIGIT    0x002   (0008)  ||  0011 0017 0023 0029 
FOURTH_DIGIT   0x00E   (0025)  ||  0022 
SECOND_DIGIT   0x006   (0013)  ||  0010 
THIRD_DIGIT    0x00A   (0019)  ||  0016 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEYPAD         0x022   (0001)  ||  0008 0014 0020 0026 
OUT_PORT       0x042   (0002)  ||  0033 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
