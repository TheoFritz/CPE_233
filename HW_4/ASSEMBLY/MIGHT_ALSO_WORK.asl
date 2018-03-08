

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


(0001)                       032  || .EQU SW_INPORT		= 0x20 ; R1
(0002)                       174  || .EQU INT_EN			= 0xAE ;- output port (also R1)
(0003)                       170  || .EQU INT_STATUS 	= 0xAA ; R0
(0004)                       172  || .EQU INT_CLEAR		= 0xAC ;- output port
(0005)                       064  || .EQU LED_OUTPORT	= 0x40 ; R5
(0006)                       129  || .EQU SEV_SEG_DISP	= 0x81
(0007)                            || ;----------------------------------------------------------------
(0008)                            || 
(0009)                            || .CSEG
(0010)                       001  || .ORG 0x01	; start at address 01
(0011)                            || 
(0012)  CS-0x001  0x1A000         || 		SEI ;- enable interrupts upon start
(0013)  CS-0x002  0x36000         || 		MOV R0,0x00 ;- clear int_status upon reset
(0014)  CS-0x003  0x34081         || 		OUT R0,SEV_SEG_DISP
(0015)                            || 
(0016)                     0x004  || MAIN :	
(0017)  CS-0x004  0x32120         || 		IN	R1,SW_INPORT ;- read from switches
(0018)  CS-0x005  0x341AE         || 		OUT R1,INT_EN ;- switches gets mapped to enable
(0019)  CS-0x006  0x08101         || 		CALL LED_TOGGLE
(0020)  CS-0x007  0x08119         || 		CALL QRT_SEC_DEL
(0021)  CS-0x008  0x08020         || 		BRN MAIN
(0022)                            || 
(0023)                     0x009  || ISR :	
(0024)  CS-0x009  0x1A001         || 		CLI
(0025)  CS-0x00A  0x320AA         || 		IN	R0,INT_STATUS ;- read in from int_status
(0026)  CS-0x00B  0x34081         || 		OUT R0,SEV_SEG_DISP
(0027)  CS-0x00C  0x08119         || 		CALL QRT_SEC_DEL
(0028)  CS-0x00D  0x08119         || 		CALL QRT_SEC_DEL
(0029)  CS-0x00E  0x08119         || 		CALL QRT_SEC_DEL
(0030)  CS-0x00F  0x08119         || 		CALL QRT_SEC_DEL
(0031)  CS-0x010  0x1A003         || 		RETIE
(0032)                            || 
(0033)                       1023  || .ORG 0x3FF
(0034)  CS-0x3FF  0x08048         || BRN ISR
(0035)                            || 
(0036)                       032  || .ORG 0x20
(0037)                            || 
(0038)                            || ; LED on Subloop
(0039)                            || ;----------------------------------------------------------------
(0040)  CS-0x020  0x24501  0x020  || LED_TOGGLE :	EXOR R5,0x01
(0041)  CS-0x021  0x34540         || 				OUT R5,LED_OUTPORT
(0042)  CS-0x022  0x18002         || 				RET
(0043)                            || ;----------------------------------------------------------------
(0044)                            || 
(0045)                            || ; Quarter Second Delay Subloop
(0046)                            || ;----------------------------------------------------------------
(0047)                     0x023  || QRT_SEC_DEL :	;- initialize to 0
(0048)  CS-0x023  0x36200         || 				MOV R2,0x00
(0049)  CS-0x024  0x36300         || 				MOV R3,0x00
(0050)  CS-0x025  0x36400         || 				MOV R4,0x00
(0051)                            || 
(0052)  CS-0x026  0x28201  0x026  || clock_delay1 :	ADD R2,0x01 ;- add 1 (1 clock cycle)
(0053)  CS-0x027  0x302FF         || 				CMP R2,0xFF
(0054)                            || 				;- if R2 = 190, zero flag is set, branch to clock_delay2
(0055)  CS-0x028  0x08152         || 				BREQ clock_delay2
(0056)                            || 				;- otherwise, run this loop again
(0057)  CS-0x029  0x08130         || 				BRN clock_delay1
(0058)                            || 
(0059)  CS-0x02A  0x28301  0x02A  || clock_delay2 :	ADD R3,0x01 ;- add 1 (1 clock cycle)
(0060)  CS-0x02B  0x303FF         || 				CMP R3,0xFF
(0061)                            || 				;- if R3 = 190, zero flag is set, return to main
(0062)  CS-0x02C  0x08172         || 				BREQ clock_delay3
(0063)                            || 				;- otherwise, run clock_delay1
(0064)  CS-0x02D  0x08130         || 				BRN clock_delay1
(0065)                            || 
(0066)  CS-0x02E  0x28401  0x02E  || clock_delay3 :	ADD R4,0x01 ;- add 1 (1 clock cycle)
(0067)  CS-0x02F  0x30418         || 				CMP R4,0x18
(0068)                            || 				;- if R4 = value that works, zero flag is set, return to main
(0069)  CS-0x030  0x08192         || 				BREQ return
(0070)                            || 				;- otherwise, run clock_delay1
(0071)  CS-0x031  0x08130         || 				BRN clock_delay1
(0072)                            || 
(0073)  CS-0x032  0x18002  0x032  || return :		RET





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
CLOCK_DELAY1   0x026   (0052)  ||  0057 0064 0071 
CLOCK_DELAY2   0x02A   (0059)  ||  0055 
CLOCK_DELAY3   0x02E   (0066)  ||  0062 
ISR            0x009   (0023)  ||  0034 
LED_TOGGLE     0x020   (0040)  ||  0019 
MAIN           0x004   (0016)  ||  0021 
QRT_SEC_DEL    0x023   (0047)  ||  0020 0027 0028 0029 0030 
RETURN         0x032   (0073)  ||  0069 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INT_CLEAR      0x0AC   (0004)  ||  
INT_EN         0x0AE   (0002)  ||  0018 
INT_STATUS     0x0AA   (0003)  ||  0025 
LED_OUTPORT    0x040   (0005)  ||  0041 
SEV_SEG_DISP   0x081   (0006)  ||  0014 0026 
SW_INPORT      0x020   (0001)  ||  0017 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
