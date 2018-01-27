

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
(0003)                            || ; SW ASSIGNMENT No. 3 PART 2
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; READS A VALUE IN FROM 0x9A THEN DELAYS FOR 0.5 SECONDS. OUTPUTS TO THE
(0008)                            || ; OUTPORT
(0009)                            || ; ----------------------------------------------------
(0010)                            || 
(0011)                       154  || .EQU IN_PORT = 0x9A
(0012)                       066  || .EQU OUT_PORT = 0x42
(0013)                            || 
(0014)                            || ;--------------------------------------------------------------------------
(0015)                            || ;-- .ORG used in code segment
(0016)                            || ;--------------------------------------------------------------------------
(0017)                            || .CSEG
(0018)                       001  || .ORG 0x01 ; set the data segment counter to 0x01
(0019)                            || 
(0020)  CS-0x001  0x3209A         || IN R0, IN_PORT ; R0 TAKES IN THE VALUE OF IN_PORT
(0021)                            || 
(0022)  CS-0x002  0x3615E         || MOV R1, 0x5E ; MOVES 0xFF INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP1
(0023)                            ||              ; USED FOR RESETING
(0024)                            || 
(0025)                     0x003  || LOOP1:       ; HIGHEST LOOP
(0026)  CS-0x003  0x362FE         || MOV R2,0xFE  ; MOVES 0XFE INTO R2. INCREMENT COUNTER ASSOCIATED WITH LOOP2
(0027)                            ||              ; USED FOR RESETING
(0028)                     0x004  || LOOP2:       ; MIDDLE LOOP
(0029)  CS-0x004  0x363FF         || MOV R3,0xFF  ; MOVES 0XFF INTO R1. INCREMENT COUNTER ASSOCIATED WITH LOOP3
(0030)                            || 
(0031)                     0x005  || LOOP3:       ; LOWEST LOOP
(0032)  CS-0x005  0x2C301         || SUB R3,0x01  ; DECREMENTS THE COUNTER
(0033)  CS-0x006  0x0802B         || BRNE LOOP3   ; CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0034)                            || 
(0035)  CS-0x007  0x2C201         || SUB R2, 0x01 ; DECREMENTS THE COUNTER
(0036)  CS-0x008  0x08023         || BRNE LOOP2   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0037)                            || 
(0038)                            || 
(0039)  CS-0x009  0x2C101         || SUB R1, 0x01 ; DECREMENTS THE COUNTER 
(0040)  CS-0x00A  0x0801B         || BRNE LOOP1   ;CHECKS THE ZERO FLAG TO SEE IF THE PROGRAM CAN MOVE TO THE NEXT LOOP
(0041)                            || 
(0042)                            || 
(0043)  CS-0x00B  0x34042         || OUT R0,OUT_PORT ; OUTPUTS TO THE OUTPORT
 IF THE PROGRAM CAN MOVE TO THE NEXT LOOP





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
LOOP1          0x003   (0025)  ||  0040 
LOOP2          0x004   (0028)  ||  0036 
LOOP3          0x005   (0031)  ||  0033 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0011)  ||  0020 
OUT_PORT       0x042   (0012)  ||  0043 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
