

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
(0032)  CS-0x026  0x08181         ||                CALL DELAY             ; DELAY FOR 500 ms
(0033)  CS-0x027  0x35440         ||                OUT  R20, LEDS         ; TURN LED OFF
(0034)  CS-0x028  0x08181         || 			   CALL DELAY
(0035)  CS-0x029  0x35540         || 			   OUT R21, LEDS
(0036)  CS-0x02A  0x08118         || 			   BRN MAIN
(0037)                            || 
(0038)                            || 
(0039)                            || 
(0040)  CS-0x02B  0x1A001  0x02B  || ISR:           CLI
(0041)  CS-0x02C  0x32AAA         ||                IN R10, INT_STATUS
(0042)  CS-0x02D  0x34A81         || 			   OUT R10, SEVEN_SEG
(0043)  CS-0x02E  0x08181         || 			   CALL DELAY
(0044)  CS-0x02F  0x1A003         || 			   RETIE
(0045)                            || 
(0046)                            || 
(0047)                            || 
(0048)                            || 
(0049)                            || 
(0050)                            || 
(0051)                     0x030  || DELAY:
(0052)  CS-0x030  0x3665E         || MOV R6, 0x5E ; MOVES 0x5E INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP1
(0053)                            ||              ; USED FOR RESETING
(0054)                            || 
(0055)                     0x031  || LOOP1:       ; HIGHEST LOOP
(0056)  CS-0x031  0x367FE         || MOV R7,0xFE  ; MOVES 0XFE INTO R2. INCREMENT COUNTER ASSOCIATED WITH LOOP2
(0057)                            ||              ; USED FOR RESETING
(0058)                            || 
(0059)                     0x032  || LOOP2:       ; MIDDLE LOOP
(0060)  CS-0x032  0x366FF         || MOV R6,0xFF  ; MOVES 0XFF INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP3
(0061)                            || 
(0062)                     0x033  || LOOP3:       ; LOWEST LOOP
(0063)  CS-0x033  0x2C801         || SUB R8,0x01  ; DECREMENTS THE COUNTER
(0064)  CS-0x034  0x0819B         || BRNE LOOP3   ; CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0065)                            || 
(0066)  CS-0x035  0x2C701         || SUB R7, 0x01 ; DECREMENTS THE COUNTER
(0067)  CS-0x036  0x08193         || BRNE LOOP2   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0068)                            || 
(0069)                            || 
(0070)  CS-0x037  0x2C601         || SUB R6, 0x01 ; DECREMENTS THE COUNTER
(0071)  CS-0x038  0x0818B         || BRNE LOOP1   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0072)                            || 
(0073)  CS-0x039  0x18002         || RET ; RETURNS
(0074)                            || 
(0075)                            || 
(0076)                       1023  || .ORG 0x3FF
(0077)  CS-0x3FF  0x08158  0x3FF  || VECTOR: BRN ISR





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
DELAY          0x030   (0051)  ||  0032 0034 0043 
ISR            0x02B   (0040)  ||  0077 
LOOP1          0x031   (0055)  ||  0071 
LOOP2          0x032   (0059)  ||  0067 
LOOP3          0x033   (0062)  ||  0064 
MAIN           0x023   (0029)  ||  0036 
VECTOR         0x3FF   (0077)  ||  


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
