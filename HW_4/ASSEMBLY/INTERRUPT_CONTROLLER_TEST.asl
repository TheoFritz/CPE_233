

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
(0020)  DS-0x000             008  || .DB 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
(0021)                            || ;--------------------------------------------------------------------------
(0022)                            || ;-- .ORG used in code segment
(0023)                            || ;--------------------------------------------------------------------------
(0024)                            || .CSEG
(0025)                       032  || .ORG 0x20                             ; SET THE DATA SEGMENT COUNTER TO 0x20
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x001  0x3A000  0x000  ||              LD      r0,0x00     ; place reg data in mem 
-STUP-  CS-0x002  0x36002  0x002  ||              MOV     r0,0x02     ; write dseg data to reg
-STUP-  CS-0x003  0x3A001  0x001  ||              LD      r0,0x01     ; place reg data in mem 
-STUP-  CS-0x004  0x36004  0x004  ||              MOV     r0,0x04     ; write dseg data to reg
-STUP-  CS-0x005  0x3A002  0x002  ||              LD      r0,0x02     ; place reg data in mem 
-STUP-  CS-0x006  0x36008  0x008  ||              MOV     r0,0x08     ; write dseg data to reg
-STUP-  CS-0x007  0x3A003  0x003  ||              LD      r0,0x03     ; place reg data in mem 
-STUP-  CS-0x008  0x36010  0x010  ||              MOV     r0,0x10     ; write dseg data to reg
-STUP-  CS-0x009  0x3A004  0x004  ||              LD      r0,0x04     ; place reg data in mem 
-STUP-  CS-0x00A  0x36020  0x020  ||              MOV     r0,0x20     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A005  0x005  ||              LD      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x00C  0x36040  0x040  ||              MOV     r0,0x40     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A006  0x006  ||              LD      r0,0x06     ; place reg data in mem 
-STUP-  CS-0x00E  0x36080  0x080  ||              MOV     r0,0x80     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A007  0x007  ||              LD      r0,0x07     ; place reg data in mem 
-STUP-  CS-0x010  0x08100  0x100  ||              BRN     0x20        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0026)  CS-0x020  0x1A000         ||                SEI                     ; ENABLE INTERRUPTS
(0027)  CS-0x021  0x37E01         ||                MOV R30, 0x01           ; LED HIGH
(0028)  CS-0x022  0x37400         ||                MOV R20, 0x00           ; LED LOW
(0029)                            || 
(0030)  CS-0x023  0x32320  0x023  || MAIN:          IN   R3, SWITCHES      ; READ WHAT INTERRUPTS TO ENABLE
(0031)  CS-0x024  0x343AE         ||                OUT  R3, INT_EN        ; ENABLE PREVIOUSLY SET INTERRUPTS
(0032)  CS-0x025  0x35E40         ||                OUT  R30, LEDS         ; TURN LED ON
(0033)  CS-0x026  0x081B1         ||                CALL DELAY             ; DELAY FOR 500 ms
(0034)  CS-0x027  0x35440         ||                OUT  R20, LEDS         ; TURN LED OFF
(0035)  CS-0x028  0x08118         || 			   BRN MAIN
(0036)                            || 
(0037)                            || 
(0038)                            || 
(0039)  CS-0x029  0x36100  0x029  || ISR:           MOV  R1, 0x00
(0040)  CS-0x02A  0x320AA  0x02A  || ISR_MAIN_LOOP: IN   R0, INT_STATUS    ; READ IN THE INTERRUPT STATUS
(0041)  CS-0x02B  0x0420A         ||                LD   R2, (R1)          ; READ VALUE IN SCRATCH RAM TO MASK CURRENT BIT OF INTERRUPT
(0042)  CS-0x02C  0x00010         ||                AND  R0, R2            ; MASK CURRENT BIT
(0043)  CS-0x02D  0x08173         ||                BRNE ISR_OUTPUT        ; IF INTERRUPT IS ENABLED OUTPUT TO SEVEN SEGMENT
(0044)  CS-0x02E  0x34281  0x02E  || ISR_OUTPUT   : OUT  R2, SEVEN_SEG     ; OUTPUT CURRENT INTERRUPT NO. TO SEVEN SEGMENT
(0045)  CS-0x02F  0x081B1  0x02F  || DELAY_ISR    : CALL DELAY             ; DELAY FOR 500 ms
(0046)  CS-0x030  0x081B1         ||                CALL DELAY             ; DELAY FOR 500 ms
(0047)  CS-0x031  0x342AC         ||                OUT  R2, INT_CLR       ; OUTPUT CURRENT INTERRUPT TO CLEAR LINE
(0048)  CS-0x032  0x28101         ||                ADD  R1, 0x01          ; INCREMENT COUNT REG
(0049)  CS-0x033  0x30108         ||                CMP  R1, 0x08          ; SEE IF TOTAL NO. INTERRUPT REACHED
(0050)  CS-0x034  0x08153         ||                BRNE ISR_MAIN_LOOP     ; IF NOT LOOP BACK TO TOP OF ISR
(0051)  CS-0x035  0x1A003         ||                RETIE                  ; ELSE, RETURN TO MAIN PROGRAM
(0052)                            || 
(0053)                            || 
(0054)                            || 
(0055)                            || 
(0056)                            || 
(0057)                            || 
(0058)                            || 
(0059)                     0x036  || DELAY:
(0060)  CS-0x036  0x3665E         || MOV R6, 0x5E ; MOVES 0x5E INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP1
(0061)                            ||              ; USED FOR RESETING
(0062)                            || 
(0063)                     0x037  || LOOP1:       ; HIGHEST LOOP
(0064)  CS-0x037  0x367FE         || MOV R7,0xFE  ; MOVES 0XFE INTO R2. INCREMENT COUNTER ASSOCIATED WITH LOOP2
(0065)                            ||              ; USED FOR RESETING
(0066)                            || 
(0067)                     0x038  || LOOP2:       ; MIDDLE LOOP
(0068)  CS-0x038  0x366FF         || MOV R6,0xFF  ; MOVES 0XFF INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP3
(0069)                            || 
(0070)                     0x039  || LOOP3:       ; LOWEST LOOP
(0071)  CS-0x039  0x2C801         || SUB R8,0x01  ; DECREMENTS THE COUNTER
(0072)  CS-0x03A  0x081CB         || BRNE LOOP3   ; CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0073)                            || 
(0074)  CS-0x03B  0x2C701         || SUB R7, 0x01 ; DECREMENTS THE COUNTER
(0075)  CS-0x03C  0x081C3         || BRNE LOOP2   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0076)                            || 
(0077)                            || 
(0078)  CS-0x03D  0x2C601         || SUB R6, 0x01 ; DECREMENTS THE COUNTER
(0079)  CS-0x03E  0x081BB         || BRNE LOOP1   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0080)                            || 
(0081)  CS-0x03F  0x18002         || RET ; RETURNS
(0082)                            || 
(0083)                            || 
(0084)                       1023  || .ORG 0x3FF
(0085)  CS-0x3FF  0x08148  0x3FF  || VECTOR: BRN ISR





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
DELAY          0x036   (0059)  ||  0033 0045 0046 
DELAY_ISR      0x02F   (0045)  ||  
ISR            0x029   (0039)  ||  0085 
ISR_MAIN_LOOP  0x02A   (0040)  ||  0050 
ISR_OUTPUT     0x02E   (0044)  ||  0043 
LOOP1          0x037   (0063)  ||  0079 
LOOP2          0x038   (0067)  ||  0075 
LOOP3          0x039   (0070)  ||  0072 
MAIN           0x023   (0030)  ||  0035 
VECTOR         0x3FF   (0085)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INT_CLR        0x0AC   (0013)  ||  0047 
INT_EN         0x0AE   (0015)  ||  0031 
INT_STATUS     0x0AA   (0014)  ||  0040 
LEDS           0x040   (0011)  ||  0032 0034 
SEVEN_SEG      0x081   (0010)  ||  0044 
SWITCHES       0x020   (0012)  ||  0030 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
