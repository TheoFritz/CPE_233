

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
(0003)                            || ; RANDOM LED TEST
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION: TESTS LED OUTPUT FUNCTIONALITY WITH THE
(0007)                            || ; RANDOM NUMBER GENERATOR
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
(0028)  CS-0x001  0x36400         || MOV R4, 0x00
(0029)  CS-0x002  0x33F22  0x002  || MAIN_LOOP: IN R31, RAND
(0030)  CS-0x003  0x21F0F         || AND R31, 0X0F
(0031)  CS-0x004  0x05F23         || ST R31, (R4)
(0032)  CS-0x005  0x08051         || CALL SHOW_LED
(0033)  CS-0x006  0x28401         || ADD R4, 0x01
(0034)  CS-0x007  0x30406         || CMP R4, 0x06
(0035)  CS-0x008  0x08013         || BRNE MAIN_LOOP
(0036)  CS-0x009  0x08008         || BRN MAIN
(0037)                            || 
(0038)                     0x00A  || SHOW_LED:
(0039)  CS-0x00A  0x36500         || MOV R5,0x00
(0040)                            || 
(0041)                     0x00B  || SHOW_LED_MAIN_LOOP:
(0042)  CS-0x00B  0x0432A         || LD R3,(R5)
(0043)  CS-0x00C  0x08091         || CALL TURN_LED_ON
(0044)  CS-0x00D  0x04428         || CMP R4,R5
(0045)  CS-0x00E  0x08083         || BRNE ADD_ONE_SHOW_LED
(0046)  CS-0x00F  0x18002         || RET
(0047)                            || 
(0048)                     0x010  || ADD_ONE_SHOW_LED:
(0049)  CS-0x010  0x28501         || ADD R5,0x01
(0050)  CS-0x011  0x08058         || BRN SHOW_LED_MAIN_LOOP
(0051)                            || 
(0052)  CS-0x012  0x36201  0x012  || TURN_LED_ON: MOV R2, 0x01 ; OUTPUT SIGNAL FOR LED
(0053)  CS-0x013  0x34341         || OUT R3, LED_STATUS
(0054)  CS-0x014  0x34381         || OUT R3, SEVEN_SEG
(0055)  CS-0x015  0x34237         || OUT R2, INT_LED_SET
(0056)  CS-0x016  0x080E9         || CALL QRT_SEC_DEL
(0057)  CS-0x017  0x34238         || OUT R2, INT_LED_CLR
(0058)  CS-0x018  0x080E9         || CALL QRT_SEC_DEL
(0059)  CS-0x019  0x36200         || MOV R2, 0x00
(0060)  CS-0x01A  0x34237         || OUT R2, INT_LED_SET
(0061)  CS-0x01B  0x34238         || OUT R2, INT_LED_CLR
(0062)  CS-0x01C  0x18002         || RET
(0063)                            || 
(0064)                     0x01D  ||  QRT_SEC_DEL :	;- initialize to 0
(0065)  CS-0x01D  0x36C00         || 				MOV R12,0x00
(0066)  CS-0x01E  0x36D00         || 				MOV R13,0x00
(0067)  CS-0x01F  0x36E00         || 				MOV R14,0x00
(0068)                            || 
(0069)  CS-0x020  0x28C01  0x020  || clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
(0070)  CS-0x021  0x30CFF         || 				CMP R12,0xFF
(0071)                            || 				;- if R12 = 190, zero flag is set, branch to clock_delay2
(0072)  CS-0x022  0x08122         || 				BREQ clock_delay2
(0073)                            || 				- otherwise, run this loop again
            syntax error
            syntax error
            syntax error
            syntax error

(0074)  CS-0x023  0x08100         || 				BRN clock_delay1
(0075)                            || 
(0076)  CS-0x024  0x28D01  0x024  || clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
(0077)  CS-0x025  0x30DFF         || 				CMP R13,0xFF
(0078)                            || 				;if R13 = 190, zero flag is set, return to main
(0079)  CS-0x026  0x08142         || 				BREQ clock_delay3
(0080)                            || 				;- otherwise, run clock_delay1
(0081)  CS-0x027  0x08100         || 				BRN clock_delay1
(0082)                            || 
(0083)  CS-0x028  0x28E01  0x028  || clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
(0084)  CS-0x029  0x30E18         || 				CMP R14,0x18
(0085)                            || 				;- if R14 = value that works, zero flag is set, return to main
(0086)  CS-0x02A  0x08162         || 				BREQ return
(0087)                            || 				;- otherwise, run clock_delay1
(0088)  CS-0x02B  0x08100         || 				BRN clock_delay1
(0089)                            || 
(0090)  CS-0x02C  0x18002  0x02C  || return :		RET





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
ADD_ONE_SHOW_LED 0x010   (0048)  ||  0045 
CLOCK_DELAY1   0x020   (0069)  ||  0074 0081 0088 
CLOCK_DELAY2   0x024   (0076)  ||  0072 
CLOCK_DELAY3   0x028   (0083)  ||  0079 
MAIN           0x001   (0027)  ||  0036 
MAIN_LOOP      0x002   (0029)  ||  0035 
QRT_SEC_DEL    0x01D   (0064)  ||  0056 0058 
RETURN         0x02C   (0090)  ||  0086 
SHOW_LED       0x00A   (0038)  ||  0032 
SHOW_LED_MAIN_LOOP 0x00B   (0041)  ||  0050 
TURN_LED_ON    0x012   (0052)  ||  0043 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTN_STATUS     0x035   (0012)  ||  
INT_BTN_PRESS  0x039   (0013)  ||  
INT_LED_CLR    0x038   (0017)  ||  0057 0061 
INT_LED_SET    0x037   (0016)  ||  0055 0060 
LEDS           0x040   (0014)  ||  
LED_STATUS     0x041   (0015)  ||  0053 
RAND           0x022   (0011)  ||  0029 
SEVEN_SEG      0x081   (0018)  ||  0054 
SWITCHES       0x020   (0010)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
