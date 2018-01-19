

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
(0003)                            || ; RAT ASSIGNMENT No. 1: PART 2A
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; ----------------------------------------------------
(0007)                            || 
(0008)                            || 
(0009)                            || 
(0010)                            || .DSEG
(0011)                       000  || .ORG               0x00
(0012)                            || 
(0013)                            || 
(0014)                            || ; ----------------------------------------------------
(0015)                            || ; CODE SEGMENT STARTS AT 0x40
(0016)                            || ; ----------------------------------------------------
(0017)                            || .CSEG
(0018)                       064  || .ORG               0x40         ; data starts here
(0019)  CS-0x040  0x37DFC         || 	   MOV     R29,0xFC
(0020)  CS-0x041  0x29D01         || 	   ADD     R29,0x01
(0021)  CS-0x042  0x37EFA         || 	   MOV     R30,0xFA
(0022)  CS-0x043  0x37F05         || 	   MOV     R31,0x05
(0023)  CS-0x044  0x01EFA         || 	   EXOR    R30,R31
(0024)  CS-0x045  0x03EEA         || 	   SUB     R30,R29
(0025)  CS-0x046  0x0820B         || 	   BRNE    0x41             ; loop if not equal





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
--> No labels used


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
--> No ".EQU" directives used


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
