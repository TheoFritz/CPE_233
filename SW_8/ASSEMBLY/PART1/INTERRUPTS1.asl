

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
(0014)                       064  || .EQU LEDS = 0x40
(0015)                       032  || .EQU SWITCHES = 0x20
(0016)                            || 
(0017)                            || ;--------------------------------------------------------------------------
(0018)                            || ;-- .ORG used in code segment
(0019)                            || ;--------------------------------------------------------------------------
(0020)                            || .CSEG
(0021)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0022)                            || 
(0023)  CS-0x001  0x1A000         || SEI ; ENABLES INTERRUPTS
(0024)  CS-0x002  0x36B00         || MOV R11, 0x00 ; CLEARS R11
(0025)  CS-0x003  0x32920  0x003  || MAIN: IN R9, SWITCHES ; TAKES IN A VALUE FROM THE SWITCHES
(0026)  CS-0x004  0x04958         || CMP R9,R11; CHECKS TO SEE IF R9 AND R11 ARE EQUAL (IE IF THERE IS A NEW INPUT ON R11)
(0027)  CS-0x005  0x08043         || BRNE NOT_EQUAL; BRANCHES IF A NEW VALUE WAS INPUTTED ON THE SWITCHES
(0028)  CS-0x006  0x34A40         || OUT R10, LEDS ; OUTS THAT VALUE TO THE SWITCHES
(0029)  CS-0x007  0x08018         || BRN MAIN ; BRANCHES TO MAIN
(0030)                            || 
(0031)  CS-0x008  0x04A49  0x008  || NOT_EQUAL: MOV R10,R9; MOVES THE VALUE IN R9 INTO R10
(0032)  CS-0x009  0x04B51         || MOV R11,R10; MOVES THE VALUE IN R10 TO R11
(0033)  CS-0x00A  0x34A40         || OUT R10,LEDS; OUTPUTS R10 TO THE LEDS
(0034)  CS-0x00B  0x08018         || BRN MAIN; BRANCHES TO MAIN
(0035)                            || 
(0036)  CS-0x00C  0x00A5A  0x00C  || ISR: EXOR R10, R11 ; BLINKS THE LED
(0037)  CS-0x00D  0x1A003         || RETIE ; RETURN WITH INTERRUPTS ENABLED
(0038)                            || 
(0039)                       1023  || .ORG 0x3FF
(0040)  CS-0x3FF  0x08060  0x3FF  || VECTOR: BRN ISR ; BRANCHES TO ISR WHEN THE THE PROGRAM COUNTER IS 0x3FF





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
ISR            0x00C   (0036)  ||  0040 
MAIN           0x003   (0025)  ||  0029 0034 
NOT_EQUAL      0x008   (0031)  ||  0027 
VECTOR         0x3FF   (0040)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_PORT        0x09A   (0013)  ||  
LEDS           0x040   (0014)  ||  0028 0033 
SWITCHES       0x020   (0015)  ||  0025 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
