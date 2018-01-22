.EQU IN_PORT = 0x30
.EQU PWM_PORT = 0x40
;--------------------------------------------------------------------------
;-- .ORG used in data segment
;--------------------------------------------------------------------------


.DSEG
.ORG 0x00 ; sets the code segment counter to 0x00

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01 ; set the data segment counter to 0x01
MAIN : MOV R0,0x00  
ADD_1: OUT R0,PWM_PORT
       CMP R0,0xFF
	   ADD R0,0x01
       BRCS END_PROGRAM
       BRN ADD_1

       END_PROGRAM:


