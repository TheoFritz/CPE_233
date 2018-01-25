

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
(0003)                            || ; HW ASSIGNMENT No. 1
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; Cycles through 0-255 and outputs it to PWM_PORT (0x40)
(0008)                            || ; ----------------------------------------------------
(0009)                            || 
(0010)                       064  || .EQU PWM_PORT = 0x40
(0011)                            || 
(0012)                            || ; ----------------------------------------------------
(0013)                            || ; -- .ORG used in code segment
(0014)                            || ; ----------------------------------------------------
(0015)                            || .CSEG
(0016)                       001  || .ORG 0x01 ; set the data segment counter to 0x01
(0017)  CS-0x001  0x36000  0x001  || MAIN : MOV R0,0x00  ; Moves 0x00 into R0
(0018)  CS-0x002  0x34040  0x002  || ADD_1: OUT R0,PWM_PORT; Outputs the value of R0 to the PWM_port
(0019)  CS-0x003  0x300FF         ||        CMP R0,0xFF ; Compares the value in R0 to 0xFF
(0020)  CS-0x004  0x28001         || 	   ADD R0,0x01 ; Adds one
(0021)  CS-0x005  0x08013         ||        BRNE ADD_1 ; Branches to END_PROGRAM if R0!=255
(0022)                            || 	   
  BRNE ADD_1 ; Branches to END_PROGRAM if R0!=255
(0023)  CS-0x006  0x08013         || 	   
  BRNE ADD_1 ; Branches to END_PROGRAM if R0!=255





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
ADD_1          0x002   (0018)  ||  0021 0023 
MAIN           0x001   (0017)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
PWM_PORT       0x040   (0010)  ||  0018 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
