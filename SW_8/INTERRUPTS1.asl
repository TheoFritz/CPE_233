

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
(0003)                            || ; SW ASSIGNMENT No. 8 PART 1
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; A PROGRAM THAT ALTERNATIVELY TURNS ON/OFF THE LEDS
(0008)                            || ; WHEN IT RECIEVES AN INTERRUPT. THE LED OR LEDS THAT
(0009)                            || ; TURN ON CORRESPOND TO THE MOST RECENT VALUE INPUTTED
(0010)                            || ; ON THE SWITCHES.
(0011)                            || ; ----------------------------------------------------
(0012)                            || 
(0013)                       154  || .EQU IN_PORT = 0x9A
(0014)                       066  || .EQU LEDS = 0x42
(0015)                       032  || .EQU SWITCHES = 0x20
(0016)                            || 
(0017)                            || ;--------------------------------------------------------------------------
(0018)                            || ;-- .ORG used in code segment
(0019)                            || ;--------------------------------------------------------------------------
(0020)                            || .CSEG
(0021)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0022)                            || 
(0023)  CS-0x001  0x1A000         || SEI ; ENABLES INTERRUPTS
(0024)  CS-0x002  0x36BFF         || MOV R11, 0xFF ; MOVES IN 0xFF INTO R11
(0025)  CS-0x003  0x32A20  0x003  || MAIN: IN R10, SWITCHES ; TAKES IN A VALUE FROM THE SWITCHES
(0026)  CS-0x004  0x00A5A         || EXOR R10, R11 ; FLIPS THE BITS ON THE VAALUE TAKEN IN ON THE SWITCHES
(0027)  CS-0x005  0x34A42         || OUT R10, LEDS ; OUTS THAT VALUE TO THE SWITCHES
(0028)  CS-0x006  0x08018         || BRN MAIN
(0029)                            || 
(0030)  CS-0x007  0x24BFF  0x007  || ISR: EXOR R11, 0xFF ; TOGGLES THE BITS IN R11
(0031)  CS-0x008  0x1A003         || RETIE ; RETURN WITH INTERRUPTS ENABLED
(0032)                            || 
(0033)                       1023  || .ORG 0x3FF
(0034)  CS-0x3FF  0x08038  0x3FF  || VECTOR: BRN ISR ; BRANCHES TO ISR WHEN THE THE PROGRAM COUNTER IS 0x3FF





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
ISR            0x007   (0030)  ||  0034 
MAIN           0x003   (0025)  ||  0028 
VECTOR         0x3FF   (0034)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0013)  ||  
LEDS           0x042   (0014)  ||  0027 
SWITCHES       0x020   (0015)  ||  0025 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
