

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


(0001)                       032  || .EQU SWITCHES    = 0x20
(0002)                       034  || .EQU CHANGE_MODE = 0x22
(0003)                       129  || .EQU SEVEN_SEG   = 0x81
(0004)                       082  || .EQU RED_LED     = 0x52
(0005)                       083  || .EQU GRN_LED     = 0x53
(0006)                       084  || .EQU BLU_LED     = 0x54
(0007)                            || 
(0008)                            || 
(0009)                            || .CSEG
(0010)                       001  || .ORG 0x01
(0011)                            || 
(0012)  CS-0x001  0x1A000         || SEI
(0013)                            || 
(0014)                     0x002  || INIT:
(0015)  CS-0x002  0x36000         || MOV R0, 0x00
(0016)                            || 
(0017)                     0x003  || MAIN:
(0018)  CS-0x003  0x32120         || IN R1, SWITCHES
(0019)  CS-0x004  0x30001         || CMP R0, 0x01
(0020)  CS-0x005  0x0806A         || BREQ OUT_RED
(0021)  CS-0x006  0x30002         || CMP R0, 0x02
(0022)  CS-0x007  0x0807A         || BREQ OUT_GREEN
(0023)  CS-0x008  0x30003         || CMP R0, 0x03
(0024)  CS-0x009  0x0808A         || BREQ OUT_BLUE
(0025)  CS-0x00A  0x30004         || CMP R0, 0x04
(0026)  CS-0x00B  0x0809A         || BREQ OUTPUT_VALUES
(0027)  CS-0x00C  0x08010         || BRN INIT
(0028)                            || 
(0029)                            || 
(0030)                     0x00D  || OUT_RED: 
(0031)  CS-0x00D  0x04309         || MOV R3, R1
(0032)  CS-0x00E  0x08018         || BRN MAIN
(0033)                            || 
(0034)                     0x00F  || OUT_GREEN: 
(0035)  CS-0x00F  0x04409         || MOV R4, R1
(0036)  CS-0x010  0x08018         || BRN MAIN
(0037)                            || 
(0038)                     0x011  || OUT_BLUE: 
(0039)  CS-0x011  0x04509         || MOV R5, R1
(0040)  CS-0x012  0x08018         || BRN MAIN
(0041)                            || 
(0042)                     0x013  || OUTPUT_VALUES: 
(0043)  CS-0x013  0x34352         || OUT R3, RED_LED
(0044)  CS-0x014  0x34453         || OUT R4, GRN_LED
(0045)  CS-0x015  0x34554         || OUT R5, BLU_LED
(0046)  CS-0x016  0x08010         || BRN INIT
(0047)                            || 
(0048)                            || 
(0049)                            || 
(0050)                     0x017  || ISR: 
(0051)  CS-0x017  0x28001         || ADD R0, 0x01
(0052)  CS-0x018  0x34081         || OUT R0, SEVEN_SEG
(0053)  CS-0x019  0x1A003         || RETIE
(0054)                            || 
(0055)                       1023  || .ORG 0x3FF
(0056)  CS-0x3FF  0x080B8  0x3FF  || VECTOR: BRN ISR





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
INIT           0x002   (0014)  ||  0027 0046 
ISR            0x017   (0050)  ||  0056 
MAIN           0x003   (0017)  ||  0032 0036 0040 
OUTPUT_VALUES  0x013   (0042)  ||  0026 
OUT_BLUE       0x011   (0038)  ||  0024 
OUT_GREEN      0x00F   (0034)  ||  0022 
OUT_RED        0x00D   (0030)  ||  0020 
VECTOR         0x3FF   (0056)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BLU_LED        0x054   (0006)  ||  0045 
CHANGE_MODE    0x022   (0002)  ||  
GRN_LED        0x053   (0005)  ||  0044 
RED_LED        0x052   (0004)  ||  0043 
SEVEN_SEG      0x081   (0003)  ||  0052 
SWITCHES       0x020   (0001)  ||  0018 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
