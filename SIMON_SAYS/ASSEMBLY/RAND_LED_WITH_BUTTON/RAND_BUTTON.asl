

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
(0008)                            || ;
(0009)                            || ; REGISTERS
(0010)                            || ; R4 - TOTAL NUMBER OF ITERATIONS
(0011)                            || ; R23 - VALUE FROM THE BUTTON_STATUS
(0012)                            || ; R31 - RANDOM NUMBER
(0013)                            || ; R5 - LOCATION IN THE SCRATCH RAM
(0014)                            || ; R3 - HOLDS THE VALUE TO SEND TO THE LED
(0015)                            || ; R2 - VALUE THAT GOES TO THE INTERRUPTS
(0016)                            || ; R12 - DELAY REGISTER
(0017)                            || ; R13 - DELAY REGISTER
(0018)                            || ; R14 - DELAY REGISTER
(0019)                            || ;
(0020)                            || ; ----------------------------------------------------
(0021)                            || 
(0022)                       032  || .EQU SWITCHES = 0x20
(0023)                       034  || .EQU RAND = 0x22
(0024)                       053  || .EQU BTN_STATUS = 0x35
(0025)                       064  || .EQU LEDS = 0x40
(0026)                       065  || .EQU LED_STATUS = 0x41
(0027)                       055  || .EQU INT_LED_SET = 0x37
(0028)                       056  || .EQU INT_LED_CLR = 0x38
(0029)                       129  || .EQU SEVEN_SEG = 0x81
(0030)                            || 
(0031)                            || ;--------------------------------------------------------------------------
(0032)                            || ;-- .ORG used in code segment
(0033)                            || ;--------------------------------------------------------------------------
(0034)                            || .CSEG
(0035)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0036)                            || 
(0037)                            || 
(0038)                     0x001  || MAIN:
(0039)  CS-0x001  0x36400         || MOV R4, 0x00
(0040)  CS-0x002  0x34440  0x002  || MAIN_LOOP: OUT R4, LEDS ; KEEP TRACK OF ITERATIONS ON THE BOARD LEDS
(0041)  CS-0x003  0x33F22         || IN R31, RAND ; TAKES IN A RANDOM NUMBER
(0042)  CS-0x004  0x21F0F         || AND R31, 0X0F ; TAKES THE LOWER FOUR BITS OF THE RANDOM NUMBER
(0043)  CS-0x005  0x05F23         || ST R31, (R4) ; STORES THAT VALUE IN THE SCRATCH RAM OF THE ITERATION NUMBER
(0044)  CS-0x006  0x080C9         || CALL SHOW_LED
(0045)                            || 
(0046)                     0x007  || BTN_INPUT:
(0047)  CS-0x007  0x36500         || MOV R5, 0x00
(0048)                            || 
(0049)                     0x008  || CHECK_BTN_MAIN_LOOP:
(0050)  CS-0x008  0x0432A         || LD R3,(R5) ; LOADS VALUES FROM THE SCRATH RAM
(0051)                            || 
(0052)  CS-0x009  0x33735  0x009  || CHECK_BTN_STATUS: IN R23, BTN_STATUS ; TAKES IN THE VALUE FROM BUTTON_STATUS
(0053)  CS-0x00A  0x33735         || IN R23, BTN_STATUS
(0054)  CS-0x00B  0x31700         || CMP R23, 0x00
(0055)  CS-0x00C  0x0804A         || BREQ CHECK_BTN_STATUS ; IF NOT IT WILL LOOP BACK AROUND AND CONTINUE TO CHECK
(0056)  CS-0x00D  0x2D701         || SUB R23, 0x01
(0057)  CS-0x00E  0x35781         || OUT R23, SEVEN_SEG ; OUTPUTS THAT VALUE TO THE SEVEN_SEG
(0058)  CS-0x00F  0x05718         || CMP R23, R3
(0059)  CS-0x010  0x0800B         || BRNE MAIN
(0060)  CS-0x011  0x04428         || CMP R4,R5 ; COMPARES THE LOCATION IN THE SCRATCH RAM WITH THE TOTAL NUMBER OF ITERATIONS
(0061)  CS-0x012  0x080BB         || BRNE ADD_ONE_CHECK_BTN
(0062)                            || 
(0063)  CS-0x013  0x28401         || ADD R4, 0x01 ; ITERATES THE COUNTER
(0064)  CS-0x014  0x30406         || CMP R4, 0x06 ; ALLOWS FOR SIX ITERATIONS
(0065)  CS-0x015  0x08013         || BRNE MAIN_LOOP ; ELSE IT LOOPS BACK AROUND
(0066)  CS-0x016  0x08008         || BRN MAIN
(0067)                            || 
(0068)                     0x017  || ADD_ONE_CHECK_BTN:
(0069)  CS-0x017  0x28501         || ADD R5,0x01 ; ITERATES THE LOCATION IN THE SCRATCH RAM
(0070)  CS-0x018  0x08040         || BRN CHECK_BTN_MAIN_LOOP
(0071)                            || 
(0072)                            || 
(0073)                            || 
(0074)                            || 
(0075)                            || 
(0076)                     0x019  || SHOW_LED:
(0077)  CS-0x019  0x36500         || MOV R5,0x00; CLEARS R5
(0078)                            || 
(0079)                     0x01A  || SHOW_LED_MAIN_LOOP:
(0080)  CS-0x01A  0x0432A         || LD R3,(R5) ; LOADS VALUES FROM THE SCRATH RAM
(0081)  CS-0x01B  0x08109         || CALL TURN_LED_ON
(0082)  CS-0x01C  0x04428         || CMP R4,R5 ; COMPARES THE LOCATION IN THE SCRATCH RAM WITH THE TOTAL NUMBER OF ITERATIONS
(0083)  CS-0x01D  0x080FB         || BRNE ADD_ONE_SHOW_LED
(0084)  CS-0x01E  0x18002         || RET
(0085)                            || 
(0086)                     0x01F  || ADD_ONE_SHOW_LED:
(0087)  CS-0x01F  0x28501         || ADD R5,0x01 ; ITERATES THE LOCATION IN THE SCRATCH RAM
(0088)  CS-0x020  0x080D0         || BRN SHOW_LED_MAIN_LOOP
(0089)                            || 
(0090)  CS-0x021  0x36201  0x021  || TURN_LED_ON: MOV R2, 0x01 ; OUTPUT SIGNAL FOR LED
(0091)  CS-0x022  0x34341         || OUT R3, LED_STATUS ; OUTPUTS TO THE TRELLIS LEDS
(0092)  CS-0x023  0x34237         || OUT R2, INT_LED_SET ; OUTPUTS A HIGH TO INT_LED_SET
(0093)  CS-0x024  0x08159         || CALL QRT_SEC_DEL ; DELAYS FOR O.25 SECONDS
(0094)  CS-0x025  0x34238         || OUT R2, INT_LED_CLR ; OUTPUTS A HIGH TO INT_LED_CLR
(0095)  CS-0x026  0x08159         || CALL QRT_SEC_DEL ; DELAYS FOR 0.25 SECONDS
(0096)  CS-0x027  0x36200         || MOV R2, 0x00
(0097)  CS-0x028  0x34237         || OUT R2, INT_LED_SET ; OUTPUTS A LOW TO INT_LED_SET
(0098)  CS-0x029  0x34238         || OUT R2, INT_LED_CLR ; OUTPUTS A LOW TO INT_LED_CLR
(0099)  CS-0x02A  0x18002         || RET
(0100)                            || 
(0101)                     0x02B  ||  QRT_SEC_DEL :	;- initialize to 0
(0102)  CS-0x02B  0x36C00         || 				MOV R12,0x00
(0103)  CS-0x02C  0x36D00         || 				MOV R13,0x00
(0104)  CS-0x02D  0x36E00         || 				MOV R14,0x00
(0105)                            || 
(0106)  CS-0x02E  0x28C01  0x02E  || clock_delay1 :	ADD R12,0x01 ;- add 1 (1 clock cycle)
(0107)  CS-0x02F  0x30CFF         || 				CMP R12,0xFF
(0108)                            || 				;- if R12 = 190, zero flag is set, branch to clock_delay2
(0109)  CS-0x030  0x08192         || 				BREQ clock_delay2
(0110)                            || 				- otherwise, run this loop again
            syntax error
            syntax error
            syntax error
            syntax error

(0111)  CS-0x031  0x08170         || 				BRN clock_delay1
(0112)                            || 
(0113)  CS-0x032  0x28D01  0x032  || clock_delay2 :	ADD R13,0x01 ;- add 1 (1 clock cycle)
(0114)  CS-0x033  0x30DFF         || 				CMP R13,0xFF
(0115)                            || 				;if R13 = 190, zero flag is set, return to main
(0116)  CS-0x034  0x081B2         || 				BREQ clock_delay3
(0117)                            || 				;- otherwise, run clock_delay1
(0118)  CS-0x035  0x08170         || 				BRN clock_delay1
(0119)                            || 
(0120)  CS-0x036  0x28E01  0x036  || clock_delay3 :	ADD R14,0x01 ;- add 1 (1 clock cycle)
(0121)  CS-0x037  0x30E18         || 				CMP R14,0x18
(0122)                            || 				;- if R14 = value that works, zero flag is set, return to main
(0123)  CS-0x038  0x081D2         || 				BREQ return
(0124)                            || 				;- otherwise, run clock_delay1
(0125)  CS-0x039  0x08170         || 				BRN clock_delay1
(0126)                            || 
(0127)  CS-0x03A  0x18002  0x03A  || return :		RET





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
ADD_ONE_CHECK_BTN 0x017   (0068)  ||  0061 
ADD_ONE_SHOW_LED 0x01F   (0086)  ||  0083 
BTN_INPUT      0x007   (0046)  ||  
CHECK_BTN_MAIN_LOOP 0x008   (0049)  ||  0070 
CHECK_BTN_STATUS 0x009   (0052)  ||  0055 
CLOCK_DELAY1   0x02E   (0106)  ||  0111 0118 0125 
CLOCK_DELAY2   0x032   (0113)  ||  0109 
CLOCK_DELAY3   0x036   (0120)  ||  0116 
MAIN           0x001   (0038)  ||  0059 0066 
MAIN_LOOP      0x002   (0040)  ||  0065 
QRT_SEC_DEL    0x02B   (0101)  ||  0093 0095 
RETURN         0x03A   (0127)  ||  0123 
SHOW_LED       0x019   (0076)  ||  0044 
SHOW_LED_MAIN_LOOP 0x01A   (0079)  ||  0088 
TURN_LED_ON    0x021   (0090)  ||  0081 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BTN_STATUS     0x035   (0024)  ||  0052 0053 
INT_LED_CLR    0x038   (0028)  ||  0094 0098 
INT_LED_SET    0x037   (0027)  ||  0092 0097 
LEDS           0x040   (0025)  ||  0040 
LED_STATUS     0x041   (0026)  ||  0091 
RAND           0x022   (0023)  ||  0041 
SEVEN_SEG      0x081   (0029)  ||  0057 
SWITCHES       0x020   (0022)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
