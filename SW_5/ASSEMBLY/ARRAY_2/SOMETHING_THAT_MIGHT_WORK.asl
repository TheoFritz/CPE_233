

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


(0001)                       154  || .EQU IN_PORT = 0x9A
(0002)                       066  || .EQU OUT_PORT = 0x42
(0003)                            || 
(0004)                            || .DSEG
(0005)                       001  || .ORG 0x01
(0006)  DS-0x001             005  || FIB_SEQ: .DB 0x0F, 0x04, 0x02, 0x0E, 0x07
(0007)  DS-0x006             005  ||          .DB 0x09, 0x04, 0x08, 0x0A, 0x01
(0008)                            || 
(0009)                            || .CSEG
(0010)                       032  || .ORG 0x20
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x3600F  0x00F  ||              MOV     r0,0x0F     ; write dseg data to reg
-STUP-  CS-0x001  0x3A001  0x001  ||              LD      r0,0x01     ; place reg data in mem 
-STUP-  CS-0x002  0x36004  0x004  ||              MOV     r0,0x04     ; write dseg data to reg
-STUP-  CS-0x003  0x3A002  0x002  ||              LD      r0,0x02     ; place reg data in mem 
-STUP-  CS-0x004  0x36002  0x002  ||              MOV     r0,0x02     ; write dseg data to reg
-STUP-  CS-0x005  0x3A003  0x003  ||              LD      r0,0x03     ; place reg data in mem 
-STUP-  CS-0x006  0x3600E  0x00E  ||              MOV     r0,0x0E     ; write dseg data to reg
-STUP-  CS-0x007  0x3A004  0x004  ||              LD      r0,0x04     ; place reg data in mem 
-STUP-  CS-0x008  0x36007  0x007  ||              MOV     r0,0x07     ; write dseg data to reg
-STUP-  CS-0x009  0x3A005  0x005  ||              LD      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x00A  0x36009  0x009  ||              MOV     r0,0x09     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A006  0x006  ||              LD      r0,0x06     ; place reg data in mem 
-STUP-  CS-0x00C  0x36004  0x004  ||              MOV     r0,0x04     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A007  0x007  ||              LD      r0,0x07     ; place reg data in mem 
-STUP-  CS-0x00E  0x36008  0x008  ||              MOV     r0,0x08     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A008  0x008  ||              LD      r0,0x08     ; place reg data in mem 
-STUP-  CS-0x010  0x3600A  0x00A  ||              MOV     r0,0x0A     ; write dseg data to reg
-STUP-  CS-0x011  0x3A009  0x009  ||              LD      r0,0x09     ; place reg data in mem 
-STUP-  CS-0x012  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x013  0x3A00A  0x00A  ||              LD      r0,0x0A     ; place reg data in mem 
-STUP-  CS-0x014  0x08100  0x100  ||              BRN     0x20        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0011)  CS-0x020  0x37E01         || MOV R30, 0x01
(0012)                            || ; MOV R0, 0x0A
(0013)                            || ; READ_VALUE_LOOP: IN R1, IN_PORT
(0014)                            || ;                  ST R1, (R0)
(0015)                            || ;                  SUB R0, 0x01
(0016)                            || ;                  CMP R0, 0x00
(0017)                            || ;                  BREQ SORT_FUNC
(0018)                            || ;                  BRNE READ_VALUE_LOOP
(0019)  CS-0x021  0x3620A         || MOV R2, 0x0A
(0020)  CS-0x022  0x36309         || MOV R3, 0x09
(0021)                            || 				  
(0022)                     0x023  || SORT_FUNC:        
(0023)                            || 
(0024)  CS-0x023  0x0441A         || 				  LD R4, (R3)
(0025)  CS-0x024  0x04512         ||                   LD R5, (R2)
(0026)  CS-0x025  0x04520         ||                   CMP R5, R4
(0027)  CS-0x026  0x0A139         ||                   BRCC SWAP_VALUES
(0028)  CS-0x027  0x0451B  0x027  || SWAP_VALUES:      ST R5, (R3)
(0029)  CS-0x028  0x04413         || 				  ST R4, (R2)





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
SORT_FUNC      0x023   (0022)  ||  
SWAP_VALUES    0x027   (0028)  ||  0027 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0001)  ||  
OUT_PORT       0x042   (0002)  ||  


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
FIB_SEQ        0x006   (0006)  ||  
