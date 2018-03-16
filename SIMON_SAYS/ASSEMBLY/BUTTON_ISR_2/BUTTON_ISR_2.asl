

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


(0001)                            || ; ----------------------------------------------------
(0002)                            || ;
(0003)                            || ; SIMON SAYS ASSEMBLY CODE
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; 
(0008)                            || ; ----------------------------------------------------
(0009)                            || 
(0010)                       032  || .EQU SWITCHES = 0x20
(0011)                       034  || .EQU RAND = 0x22
(0012)                       053  || .EQU BTN_STATUS = 0x35
(0013)                       057  || .EQU INT_BTN_PRESS = 0x39
(0014)                       064  || .EQU LEDS = 0x40
(0015)                       065  || .EQU LED_STATUS = 0x41
(0016)                       055  || .EQU INT_LED_SET = 0x37
(0017)                       056  || .EQU INT_LED_CLR = 0x38
(0018)                       129  || .EQU SEVEN_SEG = 0x81
(0019)                            || 
(0020)                            || ;--------------------------------------------------------------------------
(0021)                            || ;-- .ORG used in code segment
(0022)                            || ;--------------------------------------------------------------------------
(0023)                            || .CSEG
(0024)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0025)                            || 
(0026)                            || 
(0027)  CS-0x001  0x1A000         || SEI
(0028)                            || 
(0029)                     0x002  || MAIN:
(0030)  CS-0x002  0x08010         || BRN MAIN
(0031)                            || 
(0032)                            || 
(0033)                     0x003  || ISR:
(0034)  CS-0x003  0x32735         || IN R7, BTN_STATUS
(0035)  CS-0x004  0x34740         || OUT R7, LEDS
(0036)  CS-0x005  0x18002         || RET
(0037)                            || 
(0038)                       1023  || .ORG 0x3FF
(0039)  CS-0x3FF  0x08018  0x3FF  || VECTOR: BRN ISR





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
ISR            0x003   (0033)  ||  0039 
MAIN           0x002   (0029)  ||  0030 
VECTOR         0x3FF   (0039)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTN_STATUS     0x035   (0012)  ||  0034 
INT_BTN_PRESS  0x039   (0013)  ||  
INT_LED_CLR    0x038   (0017)  ||  
INT_LED_SET    0x037   (0016)  ||  
LEDS           0x040   (0014)  ||  0035 
LED_STATUS     0x041   (0015)  ||  
RAND           0x022   (0011)  ||  
SEVEN_SEG      0x081   (0018)  ||  
SWITCHES       0x020   (0010)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
