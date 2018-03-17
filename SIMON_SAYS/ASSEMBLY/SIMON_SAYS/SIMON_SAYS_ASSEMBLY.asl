

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
(0026)  CS-0x001  0x36100         || MOV R1, 0x00 ; MOVES 0x00 INTO R1 (R1 HOLDS THE LOCATION OF THE VALUES IN THE SCRATCH RAM
(0027)                            || 
(0028)  CS-0x002  0x32022  0x002  || MAIN: IN R0, RAND ; TAKES IN A VALUE FROM THE RANDOM NUMBER GENERATOR
(0029)  CS-0x003  0x2000F         || AND R0, 0x0F ; MASKS THE UPPER FOUR BITS OF THE VALUE FROM THE RANDOM NUMBER GENERATOR
(0030)                            || 
(0031)  CS-0x004  0x0400B         || ST R0,(R1) ; STORES THE VALUE FROM THE RANDOM NUMBER GENERATOR AT LOCATION 0 IN THE SCRATCH RAM
(0032)  CS-0x005  0x08059         || CALL SHOW_LED ; CALLS THE SHOW LED SUBROUTINE
(0033)  CS-0x006  0x080D9         || CALL READ_VALUES ; CALLS THE READ_VALUES SUBROUTINE
(0034)  CS-0x007  0x28101         || ADD R1, 0x01 ; ADDS ONE TO R1 TO STEP THROUGH THE SCRATCH RAM
(0035)  CS-0x008  0x301C8         || CMP R1, 0xC8 ; COMPARES R1 WITH DECIMAL 200
(0036)  CS-0x009  0x0815A         || BREQ PROGRAM_END ; IF R1 IS 200 THE PROGRAM WILL END
(0037)  CS-0x00A  0x08010         || BRN MAIN ; ELSE IT WILL CONTINUE TO LOOP
(0038)                            || 
(0039)                            || 
(0040)                     0x00B  || SHOW_LED:
(0041)  CS-0x00B  0x36200         || MOV R2,0x00
(0042)  CS-0x00C  0x36601         || MOV R6, 0x01
(0043)                            || 
(0044)                     0x00D  || SHOW_LED_MAIN_LOOP:
(0045)  CS-0x00D  0x04312         || LD R3,(R2)
(0046)  CS-0x00E  0x34341         || OUT R3, LED_STATUS; OUTPUT THE VALUE IN R3 TO THE SIMON SAYS LEDS
(0047)  CS-0x00F  0x34637         || OUT R6, INT_LED_SET
(0048)  CS-0x010  0x081C9         || CALL QRT_SEC_DEL
(0049)  CS-0x011  0x34638         || OUT R6, INT_LED_CLR
(0050)  CS-0x012  0x24601         || EXOR R6, 0x01
(0051)  CS-0x013  0x34637         || OUT R6, INT_LED_SET
(0052)  CS-0x014  0x34638         || OUT R6, INT_LED_CLR
(0053)  CS-0x015  0x24601         || EXOR R6, 0x01
(0054)  CS-0x016  0x04110         || CMP R1,R2
(0055)  CS-0x017  0x080CB         || BRNE ADD_ONE_SHOW_LED
(0056)  CS-0x018  0x18002         || RET
(0057)                            || 
(0058)                     0x019  || ADD_ONE_SHOW_LED:
(0059)  CS-0x019  0x28201         || ADD R2,0x01
(0060)  CS-0x01A  0x08068         || BRN SHOW_LED_MAIN_LOOP
(0061)                            || 
(0062)                     0x01B  || READ_VALUES:
(0063)  CS-0x01B  0x36200         || MOV R2,0x00
(0064)                            || 
(0065)                     0x01C  || READ_VALUES_MAIN_LOOP:
(0066)  CS-0x01C  0x32535         || IN R5, BTN_STATUS
(0067)  CS-0x01D  0x34540         || OUT R5, LEDS
(0068)  CS-0x01E  0x30500         || CMP R5, 0x00
(0069)  CS-0x01F  0x080E3         || BRNE READ_VALUES_MAIN_LOOP
(0070)  CS-0x020  0x2C501         || SUB R5, 0x01
(0071)  CS-0x021  0x04312         || LD R3, (R2)
(0072)  CS-0x022  0x34081         || OUT R0, SEVEN_SEG
(0073)  CS-0x023  0x04320         || CMP R3, R4
(0074)  CS-0x024  0x0815B         || BRNE PROGRAM_END
(0075)  CS-0x025  0x04208         || CMP R2,R1
(0076)  CS-0x026  0x08143         || BRNE ADD_ONE_READ_VALUES
(0077)  CS-0x027  0x18002         || RET
(0078)                            || 
(0079)                     0x028  || ADD_ONE_READ_VALUES:
(0080)  CS-0x028  0x28201         || ADD R2, 0x01
(0081)  CS-0x029  0x04312         || LD R3, (R2)
(0082)  CS-0x02A  0x080E0         || BRN READ_VALUES_MAIN_LOOP
(0083)                            || 
(0084)  CS-0x02B  0x3670F  0x02B  || PROGRAM_END: MOV R7, 0x0F
(0085)  CS-0x02C  0x36601         || MOV R6, 0x01
(0086)  CS-0x02D  0x34637         || OUT R6, INT_LED_SET
(0087)  CS-0x02E  0x34741         || OUT R7, LED_STATUS
(0088)  CS-0x02F  0x081C9         || CALL QRT_SEC_DEL
(0089)  CS-0x030  0x34638         || OUT R6, INT_LED_CLR
(0090)  CS-0x031  0x36600         || MOV R6, 0x00
(0091)  CS-0x032  0x34637         || OUT R6, INT_LED_SET
(0092)  CS-0x033  0x34638         || OUT R6, INT_LED_CLR
(0093)  CS-0x034  0x36800         || MOV R8, 0x00
(0094)  CS-0x035  0x34841         || OUT R8, LED_STATUS
(0095)  CS-0x036  0x081C9         || CALL QRT_SEC_DEL
(0096)  CS-0x037  0x34741         || OUT R7, LED_STATUS
(0097)  CS-0x038  0x08010         || BRN MAIN
(0098)                            || 
(0099)                            || 
(0100)                     0x039  ||  QRT_SEC_DEL :	;- initialize to 0
(0101)  CS-0x039  0x36C00         || 				MOV R12,0x00
(0102)  CS-0x03A  0x36D00         || 				MOV R13,0x00
(0103)  CS-0x03B  0x36E00         || 				MOV R14,0x00
(0104)                            || 
(0105)  CS-0x03C  0x28C01  0x03C  || clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
(0106)  CS-0x03D  0x30CFF         || 				CMP R12,0xFF
(0107)                            || 				;- if R12 = 190, zero flag is set, branch to clock_delay2
(0108)  CS-0x03E  0x08202         || 				BREQ clock_delay2
(0109)                            || 				;- otherwise, run this loop again
(0110)  CS-0x03F  0x081E0         || 				BRN clock_delay1
(0111)                            || 
(0112)  CS-0x040  0x28D01  0x040  || clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
(0113)  CS-0x041  0x30DFF         || 				CMP R13,0xFF
(0114)                            || 				; if R13 = 190, zero flag is set, return to main
(0115)  CS-0x042  0x08222         || 				BREQ clock_delay3
(0116)                            || 				;- otherwise, run clock_delay1
(0117)  CS-0x043  0x081E0         || 				BRN clock_delay1
(0118)                            || 
(0119)  CS-0x044  0x28E01  0x044  || clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
(0120)  CS-0x045  0x30E18         || 				CMP R14,0x18
(0121)                            || 				;- if R14 = value that works, zero flag is set, return to main
(0122)  CS-0x046  0x08242         || 				BREQ return
(0123)                            || 				;- otherwise, run clock_delay1
(0124)  CS-0x047  0x081E0         || 				BRN clock_delay1
(0125)                            || 
(0126)  CS-0x048  0x18002  0x048  || return :		RET





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
ADD_ONE_READ_VALUES 0x028   (0079)  ||  0076 
ADD_ONE_SHOW_LED 0x019   (0058)  ||  0055 
CLOCK_DELAY1   0x03C   (0105)  ||  0110 0117 0124 
CLOCK_DELAY2   0x040   (0112)  ||  0108 
CLOCK_DELAY3   0x044   (0119)  ||  0115 
MAIN           0x002   (0028)  ||  0037 0097 
PROGRAM_END    0x02B   (0084)  ||  0036 0074 
QRT_SEC_DEL    0x039   (0100)  ||  0048 0088 0095 
READ_VALUES    0x01B   (0062)  ||  0033 
READ_VALUES_MAIN_LOOP 0x01C   (0065)  ||  0069 0082 
RETURN         0x048   (0126)  ||  0122 
SHOW_LED       0x00B   (0040)  ||  0032 
SHOW_LED_MAIN_LOOP 0x00D   (0044)  ||  0060 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTN_STATUS     0x035   (0012)  ||  0066 
INT_BTN_PRESS  0x039   (0013)  ||  
INT_LED_CLR    0x038   (0017)  ||  0049 0052 0089 0092 
INT_LED_SET    0x037   (0016)  ||  0047 0051 0086 0091 
LEDS           0x040   (0014)  ||  0067 
LED_STATUS     0x041   (0015)  ||  0046 0087 0094 0096 
RAND           0x022   (0011)  ||  0028 
SEVEN_SEG      0x081   (0018)  ||  0072 
SWITCHES       0x020   (0010)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
