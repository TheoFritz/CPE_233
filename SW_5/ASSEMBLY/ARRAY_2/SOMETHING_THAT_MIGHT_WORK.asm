.EQU IN_PORT = 0x9A
.EQU OUT_PORT = 0x42

.DSEG
.ORG 0x01
FIB_SEQ: .DB 0x0F, 0x04, 0x02, 0x0E, 0x07
         .DB 0x09, 0x04, 0x08, 0x0A, 0x01

.CSEG
.ORG 0x20
MOV R30, 0x01
; MOV R0, 0x0A
; READ_VALUE_LOOP: IN R1, IN_PORT
;                  ST R1, (R0)
;                  SUB R0, 0x01
;                  CMP R0, 0x00
;                  BREQ SORT_FUNC
;                  BRNE READ_VALUE_LOOP
MOV R2, 0x0A
MOV R3, 0x09
				  
SORT_FUNC:        

				  LD R4, (R3)
                  LD R5, (R2)
                  CMP R5, R4
                  BRCC SWAP_VALUES
SWAP_VALUES:      ST R5, (R3)
				  ST R4, (R2)
