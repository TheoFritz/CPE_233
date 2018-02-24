

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
(0007)                            || ;
(0008)                            || ; ----------------------------------------------------
(0009)                            || 
(0010)                       154  || .EQU IN_PORT = 0x9A
(0011)                       066  || .EQU OUT_PORT = 0x42
(0012)                       010  || .EQU FACTOR_10 = 0x0A
(0013)                       100  || .EQU FACTOR_100 = 0x64
(0014)                            || 
(0015)                            || ;--------------------------------------------------------------------------
(0016)                            || ;-- .ORG used in code segment
(0017)                            || ;--------------------------------------------------------------------------
(0018)                            || .CSEG
(0019)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0020)                            || 
(0021)  CS-0x001  0x08060         || BRN MAIN
(0022)                            || 
(0023)                     0x002  || DIVIDE_BY_100:
(0024)  CS-0x002  0x2C164         || SUB R1, FACTOR_100
(0025)  CS-0x003  0x28601         || ADD R6, 0x01
(0026)  CS-0x004  0x30164         || CMP R1, FACTOR_100
(0027)  CS-0x005  0x0A011         || BRCC DIVIDE_BY_100
(0028)  CS-0x006  0x18002         || RET
(0029)                            || 
(0030)                     0x007  || DIVIDE_BY_10:
(0031)  CS-0x007  0x2C20A         || SUB R2, FACTOR_10
(0032)  CS-0x008  0x28601         || ADD R6, 0x01
(0033)  CS-0x009  0x3020A         || CMP R2, FACTOR_10
(0034)  CS-0x00A  0x0A039         || BRCC DIVIDE_BY_10
(0035)  CS-0x00B  0x18002         || RET
(0036)                            || 
(0037)  CS-0x00C  0x3219A  0x00C  || MAIN: IN R1, IN_PORT
(0038)  CS-0x00D  0x36600         || MOV R6, 0x00
(0039)  CS-0x00E  0x08011         || CALL DIVIDE_BY_100
(0040)  CS-0x00F  0x04209         || MOV R2, R1
(0041)  CS-0x010  0x04131         || MOV R1, R6
(0042)  CS-0x011  0x36600         || MOV R6, 0x00
(0043)  CS-0x012  0x08039         || CALL DIVIDE_BY_10
(0044)  CS-0x013  0x04311         || MOV R3, R2
(0045)  CS-0x014  0x04231         || MOV R2, R6
(0046)                            || 
(0047)  CS-0x015  0x34142         || OUT R1, OUT_PORT
(0048)  CS-0x016  0x34242         || OUT R2, OUT_PORT
(0049)  CS-0x017  0x34342         || OUT R3, OUT_PORT





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
DIVIDE_BY_10   0x007   (0030)  ||  0034 0043 
DIVIDE_BY_100  0x002   (0023)  ||  0027 0039 
MAIN           0x00C   (0037)  ||  0021 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
FACTOR_10      0x00A   (0012)  ||  0031 0033 
FACTOR_100     0x064   (0013)  ||  0024 0026 
IN_PORT        0x09A   (0010)  ||  0037 
OUT_PORT       0x042   (0011)  ||  0047 0048 0049 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
