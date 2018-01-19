; ----------------------------------------------------
;
; RAT ASSIGNMENT No. 1: PART C
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; ----------------------------------------------------



; ----------------------------------------------------
; PORT DEFINITIONS
; ----------------------------------------------------
.EQU IN_PORT     = 0xCC         ; port for output
.EQU OUT_PORT    = 0x5A

.DSEG
.ORG               0x00


; ----------------------------------------------------
; CODE SEGMENT STARTS AT 0x40
; ----------------------------------------------------
.CSEG
.ORG               0x40         ; data starts here
main_loop:
           IN      R30,IN_PORT
           EXOR    R30,0xDE
           OUT     R30,OUT_PORT
           BRN     main_loop    ; endless loop
