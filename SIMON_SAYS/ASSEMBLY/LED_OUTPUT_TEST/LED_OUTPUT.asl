

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
(0003)                            || ; OUTPUT LED TEST
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION: TESTS LED OUTPUT FUNCTIONALITY
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
(0027)                     0x001  || MAIN:
(0028)  CS-0x001  0x36100         || MOV R1, 0x00
(0029)  CS-0x002  0x08039  0x002  || MAIN_LOOP: CALL TURN_LED_ON
(0030)  CS-0x003  0x28101         || ADD R1, 0x01
(0031)  CS-0x004  0x30110         || CMP R1, 0x10
(0032)  CS-0x005  0x08013         || BRNE MAIN_LOOP
(0033)  CS-0x006  0x08008         || BRN MAIN
(0034)                            || 
(0035)  CS-0x007  0x36201  0x007  || TURN_LED_ON: MOV R2, 0x01 ; OUTPUT SIGNAL FOR LED
(0036)  CS-0x008  0x34141         || OUT R1, LED_STATUS
(0037)  CS-0x009  0x34237         || OUT R2, INT_LED_SET
(0038)  CS-0x00A  0x08089         || CALL QRT_SEC_DEL
(0039)  CS-0x00B  0x34238         || OUT R2, INT_LED_CLR
(0040)  CS-0x00C  0x08089         || CALL QRT_SEC_DEL
(0041)  CS-0x00D  0x36200         || MOV R2, 0x00
(0042)  CS-0x00E  0x34237         || OUT R2, INT_LED_SET
(0043)  CS-0x00F  0x34238         || OUT R2, INT_LED_CLR
(0044)  CS-0x010  0x18002         || RET
(0045)                            || 
(0046)                     0x011  ||  QRT_SEC_DEL :	;- initialize to 0
(0047)  CS-0x011  0x36C00         || 				MOV R12,0x00
(0048)  CS-0x012  0x36D00         || 				MOV R13,0x00
(0049)  CS-0x013  0x36E00         || 				MOV R14,0x00
(0050)                            || 
(0051)  CS-0x014  0x28C01  0x014  || clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
(0052)  CS-0x015  0x30CFF         || 				CMP R12,0xFF
(0053)                            || 				;- if R12 = 190, zero flag is set, branch to clock_delay2
(0054)  CS-0x016  0x080C2         || 				BREQ clock_delay2
(0055)                            || 				;- otherwise, run this loop again
(0056)  CS-0x017  0x080A0         || 				BRN clock_delay1
(0057)                            || 
(0058)  CS-0x018  0x28D01  0x018  || clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
(0059)  CS-0x019  0x30DFF         || 				CMP R13,0xFF
(0060)                            || 				; if R13 = 190, zero flag is set, return to main
(0061)  CS-0x01A  0x080E2         || 				BREQ clock_delay3
(0062)                            || 				;- otherwise, run clock_delay1
(0063)  CS-0x01B  0x080A0         || 				BRN clock_delay1
(0064)                            || 
(0065)  CS-0x01C  0x28E01  0x01C  || clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
(0066)  CS-0x01D  0x30E18         || 				CMP R14,0x18
(0067)                            || 				;- if R14 = value that works, zero flag is set, return to main
(0068)  CS-0x01E  0x08102         || 				BREQ return
(0069)                            || 				;- otherwise, run clock_delay1
(0070)  CS-0x01F  0x080A0         || 				BRN clock_delay1
(0071)                            || 
(0072)  CS-0x020  0x18002  0x020  || return :		RET





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
CLOCK_DELAY1   0x014   (0051)  ||  0056 0063 0070 
CLOCK_DELAY2   0x018   (0058)  ||  0054 
CLOCK_DELAY3   0x01C   (0065)  ||  0061 
MAIN           0x001   (0027)  ||  0033 
MAIN_LOOP      0x002   (0029)  ||  0032 
QRT_SEC_DEL    0x011   (0046)  ||  0038 0040 
RETURN         0x020   (0072)  ||  0068 
TURN_LED_ON    0x007   (0035)  ||  0029 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTN_STATUS     0x035   (0012)  ||  
INT_BTN_PRESS  0x039   (0013)  ||  
INT_LED_CLR    0x038   (0017)  ||  0039 0043 
INT_LED_SET    0x037   (0016)  ||  0037 0042 
LEDS           0x040   (0014)  ||  
LED_STATUS     0x041   (0015)  ||  0036 
RAND           0x022   (0011)  ||  
SEVEN_SEG      0x081   (0018)  ||  
SWITCHES       0x020   (0010)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
