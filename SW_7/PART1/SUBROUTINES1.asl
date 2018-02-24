

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
(0003)                            || ; SW ASSIGNMENT No. 7 PART 1
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; CONVERTS AN UNSIGNED 8 BIT BINARY NUMBER TO BINARY
(0008)                            || ; CODED DECIMAL
(0009)                            || ; ----------------------------------------------------
(0010)                            || 
(0011)                       154  || .EQU IN_PORT = 0x9A
(0012)                       066  || .EQU OUT_PORT = 0x42
(0013)                       010  || .EQU FACTOR_10 = 0x0A
(0014)                       100  || .EQU FACTOR_100 = 0x64
(0015)                            || 
(0016)                            || ;--------------------------------------------------------------------------
(0017)                            || ;-- .ORG used in code segment
(0018)                            || ;--------------------------------------------------------------------------
(0019)                            || .CSEG
(0020)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0021)                            || 
(0022)  CS-0x001  0x08088         || BRN MAIN
(0023)                            || 
(0024)                     0x002  || DIVIDE_BY_100:
(0025)  CS-0x002  0x30164         || CMP R1, FACTOR_100
(0026)  CS-0x003  0x0A080         || BRCS UNDERFLOW
(0027)  CS-0x004  0x2C164         || SUB R1, FACTOR_100
(0028)  CS-0x005  0x28601         || ADD R6, 0x01
(0029)  CS-0x006  0x30164         || CMP R1, FACTOR_100
(0030)  CS-0x007  0x0A011         || BRCC DIVIDE_BY_100
(0031)  CS-0x008  0x18002         || RET
(0032)                            || 
(0033)                     0x009  || DIVIDE_BY_10:
(0034)  CS-0x009  0x3020A         || CMP R2, FACTOR_10
(0035)  CS-0x00A  0x0A080         || BRCS UNDERFLOW
(0036)  CS-0x00B  0x2C20A         || SUB R2, FACTOR_10
(0037)  CS-0x00C  0x28601         || ADD R6, 0x01
(0038)  CS-0x00D  0x3020A         || CMP R2, FACTOR_10
(0039)  CS-0x00E  0x0A049         || BRCC DIVIDE_BY_10
(0040)  CS-0x00F  0x18002         || RET
(0041)                            || 
(0042)                     0x010  || UNDERFLOW:
(0043)  CS-0x010  0x18002         || RET
(0044)                            || 
(0045)  CS-0x011  0x3219A  0x011  || MAIN: IN R1, IN_PORT
(0046)  CS-0x012  0x36600         || MOV R6, 0x00
(0047)  CS-0x013  0x08011         || CALL DIVIDE_BY_100
(0048)  CS-0x014  0x04209         || MOV R2, R1
(0049)  CS-0x015  0x04131         || MOV R1, R6
(0050)  CS-0x016  0x36600         || MOV R6, 0x00
(0051)  CS-0x017  0x08049         || CALL DIVIDE_BY_10
(0052)  CS-0x018  0x04311         || MOV R3, R2
(0053)  CS-0x019  0x04231         || MOV R2, R6
(0054)                            || 
(0055)  CS-0x01A  0x34142         || OUT R1, OUT_PORT
(0056)  CS-0x01B  0x34242         || OUT R2, OUT_PORT
(0057)  CS-0x01C  0x34342         || OUT R3, OUT_PORT





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
DIVIDE_BY_10   0x009   (0033)  ||  0039 0051 
DIVIDE_BY_100  0x002   (0024)  ||  0030 0047 
MAIN           0x011   (0045)  ||  0022 
UNDERFLOW      0x010   (0042)  ||  0026 0035 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
FACTOR_10      0x00A   (0013)  ||  0034 0036 0038 
FACTOR_100     0x064   (0014)  ||  0025 0027 0029 
IN_PORT        0x09A   (0011)  ||  0045 
OUT_PORT       0x042   (0012)  ||  0055 0056 0057 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
