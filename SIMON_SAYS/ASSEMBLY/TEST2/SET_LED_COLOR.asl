

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
(0026)  CS-0x001  0x36000  0x001  || MAIN: MOV R0, 0x00
(0027)  CS-0x002  0x36101         || MOV R1, 0x01
(0028)  CS-0x003  0x36200         || MOV R2, 0x00
(0029)                            || 
(0030)  CS-0x004  0x34137  0x004  || MAIN_LOOP: OUT R1, INT_LED_SET
(0031)  CS-0x005  0x08059         || CALL QRT_SEC_DEL
(0032)  CS-0x006  0x34041         || OUT R0, LED_STATUS
(0033)  CS-0x007  0x08059         || CALL QRT_SEC_DEL
(0034)  CS-0x008  0x28001         || ADD R0, 0x01
(0035)  CS-0x009  0x30010         || CMP R0, 0x10
(0036)  CS-0x00A  0x08023         || BRNE MAIN_LOOP
(0037)                            || 
(0038)                     0x00B  || QRT_SEC_DEL :	;- initialize to 0
(0039)  CS-0x00B  0x36C00         || 				MOV R12,0x00
(0040)  CS-0x00C  0x36D00         || 				MOV R13,0x00
(0041)  CS-0x00D  0x36E00         || 				MOV R14,0x00
(0042)                            || 
(0043)  CS-0x00E  0x28C01  0x00E  || clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
(0044)  CS-0x00F  0x30CFF         || 				CMP R12,0xFF
(0045)                            || 				;- if R12 = 190, zero flag is set, branch to clock_delay2
(0046)  CS-0x010  0x08092         || 				BREQ clock_delay2
(0047)                            || 				;- otherwise, run this loop again
(0048)  CS-0x011  0x08070         || 				BRN clock_delay1
(0049)                            || 
(0050)  CS-0x012  0x28D01  0x012  || clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
(0051)  CS-0x013  0x30DFF         || 				CMP R13,0xFF
(0052)                            || 				;- if R13 = 190, zero flag is set, return to main
(0053)  CS-0x014  0x080B2         || 				BREQ clock_delay3
(0054)                            || 				;- otherwise, run clock_delay1
(0055)  CS-0x015  0x08070         || 				BRN clock_delay1
(0056)                            || 
(0057)  CS-0x016  0x28E01  0x016  || clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
(0058)  CS-0x017  0x30E18         || 				CMP R14,0x18
(0059)                            || 				;- if R14 = value that works, zero flag is set, return to main
(0060)  CS-0x018  0x080D2         || 				BREQ return
(0061)                            || 				;- otherwise, run clock_delay1
(0062)  CS-0x019  0x08070         || 				BRN clock_delay1
(0063)                            || 
(0064)  CS-0x01A  0x18002  0x01A  || return :		RET
(0065)                            || 





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
CLOCK_DELAY1   0x00E   (0043)  ||  0048 0055 0062 
CLOCK_DELAY2   0x012   (0050)  ||  0046 
CLOCK_DELAY3   0x016   (0057)  ||  0053 
MAIN           0x001   (0026)  ||  
MAIN_LOOP      0x004   (0030)  ||  0036 
QRT_SEC_DEL    0x00B   (0038)  ||  0031 0033 
RETURN         0x01A   (0064)  ||  0060 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTN_STATUS     0x035   (0012)  ||  
INT_BTN_PRESS  0x039   (0013)  ||  
INT_LED_CLR    0x038   (0017)  ||  
INT_LED_SET    0x037   (0016)  ||  0030 
LEDS           0x040   (0014)  ||  
LED_STATUS     0x041   (0015)  ||  0032 
RAND           0x022   (0011)  ||  
SEVEN_SEG      0x081   (0018)  ||  
SWITCHES       0x020   (0010)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
