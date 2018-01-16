.EQU IN_PORT = 0x30
.EQU OUT_PORT = 0x40
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
MAIN : MOV R1,0x00
IN R0,IN_PORT ;R0 used to temporarily store IN_PORT data before being added with R1
ADD R1,R0 ;Adds R0 to R1 and stores the result in R1
IN R0,IN_PORT
ADD R1,R0
IN R0,IN_PORT
ADD R1,R0
OUT R1, OUT_PORT ;Outputs R1 to OUT_PORT (0x40)
BRN MAIN
