

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
(0003)                            || ; SW ASSIGNMENT No. 8 PART 2
(0004)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0005)                            || ;
(0006)                            || ; DESCRIPTION:
(0007)                            || ; A PROGRAM THAT OUTPUTS THE MOST RECENT VALUE RECIEVED
(0008)                            || ; ON THE SWITCHES TO THE LEDS WHEN IT RECEIVES AN INTERRUPT.
(0009)                            || ; WHEN THE SWITCHES OUTPUT THE SAME VALUE ON TWO INTERRUPTS IN
(0010)                            || ; A ROW THE PROGRAM WILL STOP OUTPUTTING VALUES (ie TURN OFF THE
(0011)                            || ; LEDS) UNTIL BUTTON(0) IS PRESSED. THE PROGRAM THEN CONTINUES AS
(0012)                            || ; NORMAL.
(0013)                            || ; ----------------------------------------------------
(0014)                            || 
(0015)                       154  || .EQU IN_PORT = 0x9A
(0016)                       155  || .EQU BUTTONS = 0x9B
(0017)                       066  || .EQU LEDS = 0x42
(0018)                       032  || .EQU SWITCHES = 0x20
(0019)                            || 
(0020)                            || ;--------------------------------------------------------------------------
(0021)                            || ;-- .ORG used in code segment
(0022)                            || ;--------------------------------------------------------------------------
(0023)                            || .CSEG
(0024)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0025)                            || 
(0026)  CS-0x001  0x36300         || MOV R3, 0x00
(0027)  CS-0x002  0x36200         || MOV R2, 0x00
(0028)  CS-0x003  0x36100         || MOV R1, 0x00
(0029)                            || 
(0030)  CS-0x004  0x08098         || BRN MAIN
(0031)                            || 
(0032)  CS-0x005  0x04200  0x005  || ISR: CMP R2, R0 ; COMAPRE CURRENT VALUE TO PREVIOUS VALUE
(0033)  CS-0x006  0x0804B         || BRNE VALUES_NOT_EQUAL ; 
(0034)  CS-0x007  0x28101  0x007  || VALUES_EQUAL: ADD R1, 0x01
(0035)  CS-0x008  0x1A003         || RETIE
(0036)  CS-0x009  0x04201  0x009  || VALUES_NOT_EQUAL: MOV R2, R0
(0037)  CS-0x00A  0x36301         || MOV R3, 0x01
(0038)  CS-0x00B  0x1A003         || RETIE
(0039)                            || 
(0040)                     0x00C  || CHECK_BTN: 
(0041)  CS-0x00C  0x1A001         || CLI
(0042)  CS-0x00D  0x36000         || MOV R0, 0x00
(0043)  CS-0x00E  0x34042         || OUT R0, LEDS
(0044)  CS-0x00F  0x32A9B         || IN R10, BUTTONS
(0045)  CS-0x010  0x20A01         || AND R10, 0x01
(0046)  CS-0x011  0x30A01         || CMP R10, 0x01
(0047)  CS-0x012  0x08063         || BRNE CHECK_BTN
(0048)                            || 
(0049)  CS-0x013  0x1A000  0x013  || MAIN: SEI ; ENABLES INTERRUPTS
(0050)  CS-0x014  0x36A00         || MOV R10, 0x00
(0051)  CS-0x015  0x32020         || IN R0, SWITCHES
(0052)  CS-0x016  0x30101         || CMP R1, 0x01
(0053)  CS-0x017  0x08062         || BREQ CHECK_BTN
(0054)  CS-0x018  0x30301         || CMP R3, 0x01
(0055)  CS-0x019  0x0809B         || BRNE MAIN
(0056)  CS-0x01A  0x34042         || OUT R0, LEDS
(0057)  CS-0x01B  0x36300         || MOV R3, 0x00
(0058)  CS-0x01C  0x08098         || BRN MAIN
(0059)                            || 
(0060)                       1023  || .ORG 0x3FF
(0061)  CS-0x3FF  0x08028  0x3FF  || VECTOR: BRN ISR





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
CHECK_BTN      0x00C   (0040)  ||  0047 0053 
ISR            0x005   (0032)  ||  0061 
MAIN           0x013   (0049)  ||  0030 0055 0058 
VALUES_EQUAL   0x007   (0034)  ||  
VALUES_NOT_EQUAL 0x009   (0036)  ||  0033 
VECTOR         0x3FF   (0061)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BUTTONS        0x09B   (0016)  ||  0044 
IN_PORT        0x09A   (0015)  ||  
LEDS           0x042   (0017)  ||  0043 0056 
SWITCHES       0x020   (0018)  ||  0051 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
