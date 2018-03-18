

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
(0012)                     0x001  || MAIN:
(0013)  CS-0x001  0x36200         || MOV R2, 0x00
(0014)                            || 
(0015)                     0x002  || CHECK_RED_VALUE_BTN_PRESS:
(0016)  CS-0x002  0x34281         || OUT R2, SEVEN_SEG ; SHOWS WHICH VALUE IS BEING OUTPUTTED R,G,B
(0017)  CS-0x003  0x32022         || IN R0, CHANGE_MODE ; TAKES IN A BUTTON PRESS
(0018)  CS-0x004  0x30001         || CMP R0, 0x01 ; CHECKS IF THERE WAS NO BUTTON PRESS
(0019)  CS-0x005  0x08013         || BRNE CHECK_RED_VALUE_BTN_PRESS ; IF THERE WAS NO BUTTON PRESS THEN IT CONTINUES TO POLL
(0020)  CS-0x006  0x080B9         || CALL INCREMENT
(0021)  CS-0x007  0x32720         || IN R7, SWITCHES ; TAKES IN THE VALUE OF THE SWITCHES
(0022)                            || 
(0023)                     0x008  || CHECK_GRN_VALUE_BTN_PRESS: ; SAME AS ABOVE (GREEN)
(0024)  CS-0x008  0x34281         || OUT R2, SEVEN_SEG
(0025)  CS-0x009  0x32022         || IN R0, CHANGE_MODE
(0026)  CS-0x00A  0x30001         || CMP R0, 0x01
(0027)  CS-0x00B  0x08043         || BRNE CHECK_GRN_VALUE_BTN_PRESS
(0028)  CS-0x00C  0x080B9         || CALL INCREMENT
(0029)  CS-0x00D  0x32820         || IN R8, SWITCHES
(0030)                            || 
(0031)                     0x00E  || CHECK_BLU_VALUE_BTN_PRESS: ; SAME AS ABOVE (BLUE)
(0032)  CS-0x00E  0x34281         || OUT R2, SEVEN_SEG
(0033)  CS-0x00F  0x32022         || IN R0, CHANGE_MODE
(0034)  CS-0x010  0x30001         || CMP R0, 0x01
(0035)  CS-0x011  0x08073         || BRNE CHECK_BLU_VALUE_BTN_PRESS
(0036)  CS-0x012  0x32920         || IN R9, SWITCHES
(0037)                            || 
(0038)  CS-0x013  0x34752         || OUT R7, RED_LED ; OUTPUTS THE SWITCH VALUE TO THE RED LED
(0039)  CS-0x014  0x34853         || OUT R8, GRN_LED ; OUTPUTS THE SWITCH VALUE TO THE GREEN LED
(0040)  CS-0x015  0x34954         || OUT R9, BLU_LED ; OUTPUTS THE SWITCH VALUE TO THE BLUE LED
(0041)                            || 
(0042)  CS-0x016  0x08008         || BRN MAIN
(0043)                            || 
(0044)                     0x017  || INCREMENT:
(0045)  CS-0x017  0x28201         || ADD R2, 0x01 ; INCREMENTS
(0046)  CS-0x018  0x18002         || RET





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
CHECK_BLU_VALUE_BTN_PRESS 0x00E   (0031)  ||  0035 
CHECK_GRN_VALUE_BTN_PRESS 0x008   (0023)  ||  0027 
CHECK_RED_VALUE_BTN_PRESS 0x002   (0015)  ||  0019 
INCREMENT      0x017   (0044)  ||  0020 0028 
MAIN           0x001   (0012)  ||  0042 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BLU_LED        0x054   (0006)  ||  0040 
CHANGE_MODE    0x022   (0002)  ||  0017 0025 0033 
GRN_LED        0x053   (0005)  ||  0039 
RED_LED        0x052   (0004)  ||  0038 
SEVEN_SEG      0x081   (0003)  ||  0016 0024 0032 
SWITCHES       0x020   (0001)  ||  0021 0029 0036 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
