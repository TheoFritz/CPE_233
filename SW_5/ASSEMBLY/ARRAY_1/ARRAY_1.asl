

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


(0001)                       066  || .EQU OUT_PORT = 0x42
(0002)                            || 
(0003)                            || .DSEG
(0004)                       032  || .ORG 0x20
(0005)  DS-0x020             005  || FIB_SEQ: .DB 0x01, 0x01, 0x02, 0x03, 0x05
(0006)  DS-0x025             005  ||          .DB 0x08, 0x0D, 0x15, 0x22, 0x37
(0007)  DS-0x02A             003  || 		     .DB 0x59, 0x90, 0xE9
(0008)                            || 
(0009)                            || .CSEG
(0010)                       064  || .ORG 0x40
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x001  0x3A020  0x020  ||              LD      r0,0x20     ; place reg data in mem 
-STUP-  CS-0x002  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x003  0x3A021  0x021  ||              LD      r0,0x21     ; place reg data in mem 
-STUP-  CS-0x004  0x36002  0x002  ||              MOV     r0,0x02     ; write dseg data to reg
-STUP-  CS-0x005  0x3A022  0x022  ||              LD      r0,0x22     ; place reg data in mem 
-STUP-  CS-0x006  0x36003  0x003  ||              MOV     r0,0x03     ; write dseg data to reg
-STUP-  CS-0x007  0x3A023  0x023  ||              LD      r0,0x23     ; place reg data in mem 
-STUP-  CS-0x008  0x36005  0x005  ||              MOV     r0,0x05     ; write dseg data to reg
-STUP-  CS-0x009  0x3A024  0x024  ||              LD      r0,0x24     ; place reg data in mem 
-STUP-  CS-0x00A  0x36008  0x008  ||              MOV     r0,0x08     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A025  0x025  ||              LD      r0,0x25     ; place reg data in mem 
-STUP-  CS-0x00C  0x3600D  0x00D  ||              MOV     r0,0x0D     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A026  0x026  ||              LD      r0,0x26     ; place reg data in mem 
-STUP-  CS-0x00E  0x36015  0x015  ||              MOV     r0,0x15     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A027  0x027  ||              LD      r0,0x27     ; place reg data in mem 
-STUP-  CS-0x010  0x36022  0x022  ||              MOV     r0,0x22     ; write dseg data to reg
-STUP-  CS-0x011  0x3A028  0x028  ||              LD      r0,0x28     ; place reg data in mem 
-STUP-  CS-0x012  0x36037  0x037  ||              MOV     r0,0x37     ; write dseg data to reg
-STUP-  CS-0x013  0x3A029  0x029  ||              LD      r0,0x29     ; place reg data in mem 
-STUP-  CS-0x014  0x36059  0x059  ||              MOV     r0,0x59     ; write dseg data to reg
-STUP-  CS-0x015  0x3A02A  0x02A  ||              LD      r0,0x2A     ; place reg data in mem 
-STUP-  CS-0x016  0x36090  0x090  ||              MOV     r0,0x90     ; write dseg data to reg
-STUP-  CS-0x017  0x3A02B  0x02B  ||              LD      r0,0x2B     ; place reg data in mem 
-STUP-  CS-0x018  0x360E9  0x0E9  ||              MOV     r0,0xE9     ; write dseg data to reg
-STUP-  CS-0x019  0x3A02C  0x02C  ||              LD      r0,0x2C     ; place reg data in mem 
-STUP-  CS-0x01A  0x08200  0x100  ||              BRN     0x40        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0011)  CS-0x040  0x36020         || MOV R0, 0x20
(0012)  CS-0x041  0x36123         || MOV R1, 0x23
(0013)  CS-0x042  0x04202  0x042  || MAIN: LD R2, (R0)
(0014)  CS-0x043  0x0430A         ||       LD R3, (R1)
(0015)  CS-0x044  0x02312         ||       SUB R3, R2
(0016)  CS-0x045  0x34342         ||       OUT R3, OUT_PORT
(0017)  CS-0x046  0x28001         ||       ADD R0, 0x01
(0018)  CS-0x047  0x28101         ||       ADD R1, 0x01
(0019)  CS-0x048  0x18000         || 	  CLC
(0020)  CS-0x049  0x3002A         || 	  CMP R0, 0x2A
(0021)  CS-0x04A  0x0A210         ||       BRCS MAIN





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
MAIN           0x042   (0013)  ||  0021 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
OUT_PORT       0x042   (0001)  ||  0016 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
FIB_SEQ        0x025   (0005)  ||  
