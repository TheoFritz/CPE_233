; ----------------------------------------------------
;
; SW ASSIGNMENT No. 7 PART 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; CONVERTS AN UNSIGNED 8 BIT BINARY NUMBER TO BINARY
; CODED DECIMAL
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42
.EQU FACTOR_10 = 0x0A
.EQU FACTOR_100 = 0x64

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

