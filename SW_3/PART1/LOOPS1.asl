

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
(0003)                            || ; SW ASSIGNMENT No. 3
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; Take an input from port 0x9A (unsigned 8-bit). Split
(0008)                            || ; input into two four-bits (top four and bottom four).
(0009)                            || ; Multiply with numbers together and ouptut on 0x42.
(0010)                            || ; ----------------------------------------------------
(0011)                            || 
(0012)                       154  || .EQU IN_PORT = 0x9A
(0013)                       066  || .EQU OUT_PORT = 0x42
(0014)                            || 
(0015)                            || ;--------------------------------------------------------------------------
(0016)                            || ;-- .ORG used in code segment
(0017)                            || ;--------------------------------------------------------------------------
(0018)                            || .CSEG
(0019)                       001  || .ORG 0x01 ; set the data segment counter to 0x01
(0020)                            || 
(0021)  CS-0x001  0x3209A         || IN R0,IN_PORT
(0022)  CS-0x002  0x04101         || MOV R1,R0
(0023)  CS-0x003  0x36200         || MOV R2, 0x00 ; CLEAR TEMPORARY MULTIPLY REGISTER
(0024)  CS-0x004  0x36300         || MOV R3, 0x00 ; CLEAR COUNT REGISTER
(0025)  CS-0x005  0x2000F         || AND R0,0x0F  ; MASK BOTTOM FOUR BITS
(0026)  CS-0x006  0x201F0         || AND R1,0xF0  ; MASK TOP FOUR BITS
(0027)  CS-0x007  0x18000         || CLC
(0028)  CS-0x008  0x10101         || LSR R1
(0029)  CS-0x009  0x10101         || LSR R1
(0030)  CS-0x00A  0x10101         || LSR R1
(0031)  CS-0x00B  0x10101         || LSR R1       ; SHIFT BITS DOWN TO BOTTOM FOUR
(0032)                            || 
(0033)                     0x00C  || MULTIPLY: 
(0034)  CS-0x00C  0x04308         || CMP R3,R1    ; CHECK IF TEMPORARY COUNT REG = THE MULTIPLIER VALUE
(0035)  CS-0x00D  0x0808A         || BREQ OUTPUT  ; IF IT DOES, GO TO OUTPUT
(0036)  CS-0x00E  0x02200         || ADD R2, R0
(0037)  CS-0x00F  0x28301         || ADD R3, 0X01 ; INCREMENT COUNTER
(0038)  CS-0x010  0x08060         || BRN MULTIPLY
(0039)                            || 
(0040)                     0x011  || OUTPUT:
(0041)  CS-0x011  0x34242         || OUT R2, OUT_PORT





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
MULTIPLY       0x00C   (0033)  ||  0038 
OUTPUT         0x011   (0040)  ||  0035 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0012)  ||  0021 
OUT_PORT       0x042   (0013)  ||  0041 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
