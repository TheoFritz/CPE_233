; ----------------------------------------------------
;
; RAT ASSIGNMENT No. 1: PART 2A
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; ----------------------------------------------------



.DSEG
.ORG               0x00


; ----------------------------------------------------
; CODE SEGMENT STARTS AT 0x40
; ----------------------------------------------------
.CSEG
.ORG               0x40         ; data starts here
	   MOV     R29,0xFC
	   ADD     R29,0x01
	   MOV     R30,0xFA
	   MOV     R31,0x05
	   EXOR    R30,R31
	   SUB     R30,R29
	   BRNE    0x41             ; loop if not equal
