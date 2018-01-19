

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
(0003)                            || ; RAT ASSIGNMENT No. 1: PART C
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; ----------------------------------------------------
(0007)                            || 
(0008)                            || 
(0009)                            || 
(0010)                            || ; ----------------------------------------------------
(0011)                            || ; PORT DEFINITIONS
(0012)                            || ; ----------------------------------------------------
(0013)                       204  || .EQU IN_PORT     = 0xCC         ; port for output
(0014)                       090  || .EQU OUT_PORT    = 0x5A
(0015)                            || 
(0016)                            || .DSEG
(0017)                       000  || .ORG               0x00
(0018)                            || 
(0019)                            || 
(0020)                            || ; ----------------------------------------------------
(0021)                            || ; CODE SEGMENT STARTS AT 0x40
(0022)                            || ; ----------------------------------------------------
(0023)                            || .CSEG
(0024)                       064  || .ORG               0x40         ; data starts here
(0025)                     0x040  || main_loop:
(0026)  CS-0x040  0x33ECC         ||            IN      R30,IN_PORT
(0027)  CS-0x041  0x25EDE         ||            EXOR    R30,0xDE
(0028)  CS-0x042  0x35E5A         ||            OUT     R30,OUT_PORT
(0029)  CS-0x043  0x08200         ||            BRN     main_loop    ; endless loop





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
MAIN_LOOP      0x040   (0025)  ||  0029 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x0CC   (0013)  ||  0026 
OUT_PORT       0x05A   (0014)  ||  0028 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
