

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
(0003)                            || ; ADDING BUTTON PRESSES TO RAND LED TEST
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
(0029)  CS-0x002  0x3770F         || MOV R23, 0x0F
(0030)  CS-0x003  0x34440  0x003  || MAIN_LOOP: OUT R4, LEDS
(0031)  CS-0x004  0x33F22         || IN R31, RAND
(0032)  CS-0x005  0x21F0F         || AND R31, 0X0F
(0033)  CS-0x006  0x05F23         || ST R31, (R4)
(0034)  CS-0x007  0x080A9         || CALL SHOW_LED
(0035)  CS-0x008  0x28401         || ADD R4, 0x01
(0036)  CS-0x009  0x30406         || CMP R4, 0x06
(0037)  CS-0x00A  0x0801B         || BRNE MAIN_LOOP
(0038)                     0x00B  || CHECK_BTN_INT_STATUS:
(0039)  CS-0x00B  0x1A000         || SEI
(0040)                            || MOV 29, 0x0F
            syntax error

(0041)  CS-0x00C  0x31700         || CMP R23, 0x00
(0042)  CS-0x00D  0x0805A         || BREQ CHECK_BTN_INT_STATUS
(0043)  CS-0x00E  0x35781         || OUT R23, SEVEN_SEG
(0044)  CS-0x00F  0x3770F         || MOV R23, 0x0F
(0045)  CS-0x010  0x1A001         || CLI
(0046)  CS-0x011  0x08008         || BRN MAIN
(0047)                            || 
(0048)                     0x012  || ISR:
(0049)  CS-0x012  0x33735         || IN R23, BTN_STATUS
(0050)  CS-0x013  0x2970F         || ADD R23, 0x0F
(0051)  CS-0x014  0x1A003         || RETIE
(0052)                            || 
(0053)                     0x015  || SHOW_LED:
(0054)  CS-0x015  0x36500         || MOV R5,0x00
(0055)                            || 
(0056)                     0x016  || SHOW_LED_MAIN_LOOP:
(0057)  CS-0x016  0x0432A         || LD R3,(R5)
(0058)  CS-0x017  0x080E9         || CALL TURN_LED_ON
(0059)  CS-0x018  0x04428         || CMP R4,R5
(0060)  CS-0x019  0x080DB         || BRNE ADD_ONE_SHOW_LED
(0061)  CS-0x01A  0x18002         || RET
(0062)                            || 
(0063)                     0x01B  || ADD_ONE_SHOW_LED:
(0064)  CS-0x01B  0x28501         || ADD R5,0x01
(0065)  CS-0x01C  0x080B0         || BRN SHOW_LED_MAIN_LOOP
(0066)                            || 
(0067)  CS-0x01D  0x36201  0x01D  || TURN_LED_ON: MOV R2, 0x01 ; OUTPUT SIGNAL FOR LED
(0068)  CS-0x01E  0x34341         || OUT R3, LED_STATUS
(0069)                            || ; OUT R3, LEDS
(0070)  CS-0x01F  0x34237         || OUT R2, INT_LED_SET
(0071)  CS-0x020  0x08139         || CALL QRT_SEC_DEL
(0072)  CS-0x021  0x34238         || OUT R2, INT_LED_CLR
(0073)  CS-0x022  0x08139         || CALL QRT_SEC_DEL
(0074)  CS-0x023  0x36200         || MOV R2, 0x00
(0075)  CS-0x024  0x34237         || OUT R2, INT_LED_SET
(0076)  CS-0x025  0x34238         || OUT R2, INT_LED_CLR
(0077)  CS-0x026  0x18002         || RET
(0078)                            || 
(0079)                     0x027  ||  QRT_SEC_DEL :	;- initialize to 0
(0080)  CS-0x027  0x36C00         || 				MOV R12,0x00
(0081)  CS-0x028  0x36D00         || 				MOV R13,0x00
(0082)  CS-0x029  0x36E00         || 				MOV R14,0x00
(0083)                            || 
(0084)  CS-0x02A  0x28C01  0x02A  || clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
(0085)  CS-0x02B  0x30CFF         || 				CMP R12,0xFF
(0086)                            || 				;- if R12 = 190, zero flag is set, branch to clock_delay2
(0087)  CS-0x02C  0x08172         || 				BREQ clock_delay2
(0088)                            || 				- otherwise, run this loop again
            syntax error
            syntax error
            syntax error
            syntax error

(0089)  CS-0x02D  0x08150         || 				BRN clock_delay1
(0090)                            || 
(0091)  CS-0x02E  0x28D01  0x02E  || clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
(0092)  CS-0x02F  0x30DFF         || 				CMP R13,0xFF
(0093)                            || 				;if R13 = 190, zero flag is set, return to main
(0094)  CS-0x030  0x08192         || 				BREQ clock_delay3
(0095)                            || 				;- otherwise, run clock_delay1
(0096)  CS-0x031  0x08150         || 				BRN clock_delay1
(0097)                            || 
(0098)  CS-0x032  0x28E01  0x032  || clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
(0099)  CS-0x033  0x30E18         || 				CMP R14,0x18
(0100)                            || 				;- if R14 = value that works, zero flag is set, return to main
(0101)  CS-0x034  0x081B2         || 				BREQ return
(0102)                            || 				;- otherwise, run clock_delay1
(0103)  CS-0x035  0x08150         || 				BRN clock_delay1
(0104)                            || 
(0105)  CS-0x036  0x18002  0x036  || return :		RET
(0106)                            || 
(0107)                            || 
(0108)                       1023  || .ORG 0x3FF
(0109)  CS-0x3FF  0x08090  0x3FF  || VECTOR: BRN ISR





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
ADD_ONE_SHOW_LED 0x01B   (0063)  ||  0060 
CHECK_BTN_INT_STATUS 0x00B   (0038)  ||  0042 
CLOCK_DELAY1   0x02A   (0084)  ||  0089 0096 0103 
CLOCK_DELAY2   0x02E   (0091)  ||  0087 
CLOCK_DELAY3   0x032   (0098)  ||  0094 
ISR            0x012   (0048)  ||  0109 
MAIN           0x001   (0027)  ||  0046 
MAIN_LOOP      0x003   (0030)  ||  0037 
QRT_SEC_DEL    0x027   (0079)  ||  0071 0073 
RETURN         0x036   (0105)  ||  0101 
SHOW_LED       0x015   (0053)  ||  0034 
SHOW_LED_MAIN_LOOP 0x016   (0056)  ||  0065 
TURN_LED_ON    0x01D   (0067)  ||  0058 
VECTOR         0x3FF   (0109)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTN_STATUS     0x035   (0012)  ||  0049 
INT_BTN_PRESS  0x039   (0013)  ||  
INT_LED_CLR    0x038   (0017)  ||  0072 0076 
INT_LED_SET    0x037   (0016)  ||  0070 0075 
LEDS           0x040   (0014)  ||  0030 
LED_STATUS     0x041   (0015)  ||  0068 
RAND           0x022   (0011)  ||  0031 
SEVEN_SEG      0x081   (0018)  ||  0043 
SWITCHES       0x020   (0010)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
