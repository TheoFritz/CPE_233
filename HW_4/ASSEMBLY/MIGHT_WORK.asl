

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
(0017)                            || 
(0018)                            || .DSEG
(0019)                       000  || .ORG 0x00
(0020)                            || ;--------------------------------------------------------------------------
(0021)                            || ;-- .ORG used in code segment
(0022)                            || ;--------------------------------------------------------------------------
(0023)                            || .CSEG
(0024)                       032  || .ORG 0x20                              ; SET THE DATA SEGMENT COUNTER TO 0x20
(0025)  CS-0x020  0x1A000         ||                SEI                     ; ENABLE INTERRUPTS
(0026)  CS-0x021  0x37401         ||                MOV R20, 0x01           ; LED HIGH
(0027)  CS-0x022  0x37EFF         ||                MOV R30, 0xFF           ; LED LOW
(0028)                            || 
(0029)  CS-0x023  0x32020  0x023  || MAIN:          IN   R0, SWITCHES      ; READ WHAT INTERRUPTS TO ENABLE
(0030)  CS-0x024  0x35F81         ||                OUT  R31, SEVEN_SEG    ; ENABLE PREVIOUSLY SET INTERRUPTS
(0031)  CS-0x025  0x340AE         ||                OUT  R0, INT_EN        ; TURN LED ON
(0032)  CS-0x026  0x08179         ||                CALL DELAY             ; DELAY FOR 500 ms
(0033)  CS-0x027  0x35440         ||                OUT  R20, LEDS         ; TURN LED OFF
(0034)  CS-0x028  0x08179         || 			   CALL DELAY
(0035)  CS-0x029  0x35540         || 			   OUT R21, LEDS
(0036)  CS-0x02A  0x08118         || 			   BRN MAIN
(0037)                            || 
(0038)                            || 
(0039)                            || 
(0040)                     0x02B  || ISR:
(0041)  CS-0x02B  0x32AAA         ||                IN R10, INT_STATUS
(0042)  CS-0x02C  0x34A81         || 			   OUT R10, SEVEN_SEG
(0043)  CS-0x02D  0x08179         || 			   CALL DELAY
(0044)  CS-0x02E  0x1A003         || 			   RETIE
(0045)                            || 
(0046)                            || 
(0047)                            || 
(0048)                            || 
(0049)                            || 
(0050)                            || 
(0051)                            || ; DELAY:        MOV   R29, OUTSIDE
(0052)                            || ; OUTSIDE:      SUB   R29, 0x01
(0053)                            || ; 			  MOV   R28, MIDDLE
(0054)                            || ;
(0055)                            || ; MIDDLE:       SUB   R28, 0x01
(0056)                            || ;               MOV   R27, INSIDE
(0057)                            || ;
(0058)                            || ; INSIDE:       SUB   R27, 0x01
(0059)                            || ;               BRNE  INSIDE
(0060)                            || ;
(0061)                            || ;               OR    R28, 0x00
(0062)                            || ;               BRNE  MIDDLE
(0063)                            || ;
(0064)                            || ;               OR    R29, 0x00
(0065)                            || ;               BRNE  OUTSIDE
(0066)  CS-0x02F  0x18002  0x02F  || DELAY:              RET
(0067)                            || 
(0068)                            || 
(0069)                       1023  || .ORG 0x3FF
(0070)  CS-0x3FF  0x08158  0x3FF  || VECTOR: BRN ISR





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
DELAY          0x02F   (0066)  ||  0032 0034 0043 
ISR            0x02B   (0040)  ||  0070 
MAIN           0x023   (0029)  ||  0036 
VECTOR         0x3FF   (0070)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INT_CLR        0x0AC   (0013)  ||  
INT_EN         0x0AE   (0015)  ||  0031 
INT_STATUS     0x0AA   (0014)  ||  0041 
LEDS           0x040   (0011)  ||  0033 0035 
SEVEN_SEG      0x081   (0010)  ||  0030 0042 
SWITCHES       0x020   (0012)  ||  0029 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
