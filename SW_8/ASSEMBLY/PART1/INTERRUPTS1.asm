; ----------------------------------------------------
;
; SW ASSIGNMENT No. 8 PART 1
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; A PROGRAM THAT ALTERNATIVELY TURNS ON/OFF THE LEDS
; WHEN IT RECIEVES AN INTERRUPT. THE LED OR LEDS THAT
; TURN ON CORRESPOND TO THE MOST RECENT VALUE INPUTTED
; ON THE SWITCHES.
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU LEDS = 0x42
.EQU SWITCHES = 0x20

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

SEI ; ENABLES INTERRUPTS
MOV R11, 0x00 ; CLEARS R11
MAIN: IN R9, SWITCHES ; TAKES IN A VALUE FROM THE SWITCHES
CMP R9,R11; CHECKS TO SEE IF R9 AND R11 ARE EQUAL (IE IF THERE IS A NEW INPUT ON R11)
BRNE NOT_EQUAL; BRANCHES IF A NEW VALUE WAS INPUTTED ON THE SWITCHES
OUT R10, LEDS ; OUTS THAT VALUE TO THE SWITCHES
BRN MAIN ; BRANCHES TO MAIN

NOT_EQUAL: MOV R10,R9; MOVES THE VALUE IN R9 INTO R10
MOV R11,R10; MOVES THE VALUE IN R10 TO R11
OUT R10,LEDS; OUTPUTS R10 TO THE LEDS
BRN MAIN; BRANCHES TO MAIN

ISR: EXOR R10, R11 ; BLINKS THE LED
RETIE ; RETURN WITH INTERRUPTS ENABLED

.ORG 0x3FF
VECTOR: BRN ISR ; BRANCHES TO ISR WHEN THE THE PROGRAM COUNTER IS 0x3FF
