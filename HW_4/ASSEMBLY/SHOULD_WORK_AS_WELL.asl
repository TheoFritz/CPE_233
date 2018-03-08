

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
(0003)                            || ; HW ASSIGNMENT NO. 4
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ;
(0008)                            || ; ----------------------------------------------------
(0009)                            || 
(0010)                       129  || .EQU SEVEN_SEG = 0x81
(0011)                       064  || .EQU LEDS = 0x40
(0012)                       032  || .EQU SWITCHES = 0x20
(0013)                       172  || .EQU INT_CLR = 0xAC
(0014)                       170  || .EQU INT_STATUS = 0XAA
(0015)                       174  || .EQU INT_EN = 0XAE
(0016)                            || 
(0017)                            || .CSEG
(0018)                       032  || .ORG 0x20                              ; SET THE DATA SEGMENT COUNTER TO 0x20
(0019)  CS-0x020  0x1A000         ||                SEI                     ; ENABLE INTERRUPTS
(0020)  CS-0x021  0x37501         ||                MOV R21, 0x01           ; LED HIGH
(0021)                            || 			   
(0022)  CS-0x022  0x32320  0x022  || MAIN:          IN   R3, SWITCHES      ; READ WHAT INTERRUPTS TO ENABLE
(0023)  CS-0x023  0x343AE         ||                OUT  R3, INT_EN        ; ENABLE PREVIOUSLY SET INTERRUPTS
(0024)  CS-0x024  0x08169         ||                CALL BLINK_LED         ; TOGGLE LEDS
(0025)  CS-0x025  0x08181         ||                CALL DELAY             ; DELAY FOR 500 ms
(0026)  CS-0x026  0x08110         || 			   BRN MAIN
(0027)                            || 			   
(0028)  CS-0x027  0x1A001  0x027  || ISR:           CLI
(0029)  CS-0x028  0x320AA         || 			   IN R0, INT_STATUS
(0030)  CS-0x029  0x34081         || 			   OUT R0, SEVEN_SEG
(0031)  CS-0x02A  0x08181         || 			   CALL DELAY
(0032)  CS-0x02B  0x08181         || 			   CALL DELAY
(0033)  CS-0x02C  0x1A003         || 			   RETIE
(0034)                            || 			   
(0035)  CS-0x02D  0x25501  0x02D  || BLINK_LED:   	EXOR R21,0x01
(0036)  CS-0x02E  0x35540         || 				OUT R21,LEDS
(0037)  CS-0x02F  0x18002         || 				RET
(0038)                            || 
(0039)                            || 
(0040)                            || 
(0041)  CS-0x030  0x37D31  0x030  || DELAY:        MOV   R29, OUTSIDE
(0042)  CS-0x031  0x2DD01  0x031  || OUTSIDE:      SUB   R29, 0x01
(0043)  CS-0x032  0x37C33         || 			  MOV   R28, MIDDLE
(0044)                            || 
(0045)  CS-0x033  0x2DC01  0x033  || MIDDLE:       SUB   R28, 0x01
(0046)  CS-0x034  0x37B35         ||               MOV   R27, INSIDE
(0047)                            || 
(0048)  CS-0x035  0x2DB01  0x035  || INSIDE:       SUB   R27, 0x01
(0049)  CS-0x036  0x081AB         ||               BRNE  INSIDE
(0050)                            || 
(0051)  CS-0x037  0x23C00         ||               OR    R28, 0x00
(0052)  CS-0x038  0x0819B         ||               BRNE  MIDDLE
(0053)                            || 
(0054)  CS-0x039  0x23D00         ||               OR    R29, 0x00
(0055)  CS-0x03A  0x0818B         ||               BRNE  OUTSIDE
(0056)  CS-0x03B  0x18002         || 			  RET
(0057)                            || 
(0058)                            || 
(0059)                       1023  || .ORG 0x3FF
(0060)  CS-0x3FF  0x08138  0x3FF  || VECTOR: BRN ISR





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
BLINK_LED      0x02D   (0035)  ||  0024 
DELAY          0x030   (0041)  ||  0025 0031 0032 
INSIDE         0x035   (0048)  ||  0046 0049 
ISR            0x027   (0028)  ||  0060 
MAIN           0x022   (0022)  ||  0026 
MIDDLE         0x033   (0045)  ||  0043 0052 
OUTSIDE        0x031   (0042)  ||  0041 0055 
VECTOR         0x3FF   (0060)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INT_CLR        0x0AC   (0013)  ||  
INT_EN         0x0AE   (0015)  ||  0023 
INT_STATUS     0x0AA   (0014)  ||  0029 
LEDS           0x040   (0011)  ||  0036 
SEVEN_SEG      0x081   (0010)  ||  0030 
SWITCHES       0x020   (0012)  ||  0022 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
