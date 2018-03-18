

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
(0012)                     0x001  || INIT:
(0013)                            || 
(0014)                     0x001  || MAIN:
(0015)  CS-0x001  0x36200         || MOV R2, 0x00
(0016)                     0x002  || CHECK_RED_VALUE_BTN_PRESS:
(0017)  CS-0x002  0x28201         || ADD R2, 0x01 ; INCREMENTS
(0018)  CS-0x003  0x34281         || OUT R2, SEVEN_SEG ; SHOWS WHICH VALUE IS BEING OUTPUTTED R,G,B
(0019)  CS-0x004  0x32022         || IN R0, CHANGE_MODE ; TAKES IN A BUTTON PRESS
(0020)  CS-0x005  0x30000         || CMP R0, 0x00 ; CHECKS IF THERE WAS NO BUTTON PRESS
(0021)  CS-0x006  0x08012         || BREQ CHECK_RED_VALUE_BTN_PRESS ; IF THERE WAS NO BUTTON PRESS THEN IT CONTINUES TO POLL
(0022)  CS-0x007  0x32720         || IN R7, SWITCHES ; TAKES IN THE VALUE OF THE SWITCHES
(0023)                            || 
(0024)                     0x008  || CHECK_GRN_VALUE_BTN_PRESS: ; SAME AS ABOVE (GREEN)
(0025)  CS-0x008  0x28201         || ADD R2, 0x01
(0026)  CS-0x009  0x34281         || OUT R2, SEVEN_SEG
(0027)  CS-0x00A  0x32022         || IN R0, CHANGE_MODE
(0028)  CS-0x00B  0x30000         || CMP R0, 0x00
(0029)  CS-0x00C  0x08042         || BREQ CHECK_GRN_VALUE_BTN_PRESS
(0030)  CS-0x00D  0x32820         || IN R8, SWITCHES
(0031)                            || 
(0032)                     0x00E  || CHECK_BLU_VALUE_BTN_PRESS: ; SAME AS ABOVE (BLUE)
(0033)  CS-0x00E  0x28201         || ADD R2, 0x01
(0034)  CS-0x00F  0x34281         || OUT R2, SEVEN_SEG
(0035)  CS-0x010  0x32022         || IN R0, CHANGE_MODE
(0036)  CS-0x011  0x30000         || CMP R0, 0x00
(0037)  CS-0x012  0x08072         || BREQ CHECK_BLU_VALUE_BTN_PRESS
(0038)  CS-0x013  0x32920         || IN R9, SWITCHES
(0039)                            || 
(0040)  CS-0x014  0x34752         || OUT R7, RED_LED ; OUTPUTS THE SWITCH VALUE TO THE RED LED
(0041)  CS-0x015  0x34853         || OUT R8, GRN_LED ; OUTPUTS THE SWITCH VALUE TO THE GREEN LED
(0042)  CS-0x016  0x34954         || OUT R9, BLU_LED ; OUTPUTS THE SWITCH VALUE TO THE BLUE LED
(0043)                            || 
(0044)  CS-0x017  0x08008         || BRN MAIN





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
CHECK_BLU_VALUE_BTN_PRESS 0x00E   (0032)  ||  0037 
CHECK_GRN_VALUE_BTN_PRESS 0x008   (0024)  ||  0029 
CHECK_RED_VALUE_BTN_PRESS 0x002   (0016)  ||  0021 
INIT           0x001   (0012)  ||  
MAIN           0x001   (0014)  ||  0044 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BLU_LED        0x054   (0006)  ||  0042 
CHANGE_MODE    0x022   (0002)  ||  0019 0027 0035 
GRN_LED        0x053   (0005)  ||  0041 
RED_LED        0x052   (0004)  ||  0040 
SEVEN_SEG      0x081   (0003)  ||  0018 0026 0034 
SWITCHES       0x020   (0001)  ||  0022 0030 0038 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
