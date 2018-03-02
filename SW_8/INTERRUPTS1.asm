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
MOV R11, 0xFF ; MOVES IN 0xFF INTO R11
MAIN: IN R10, SWITCHES ; TAKES IN A VALUE FROM THE SWITCHES
EXOR R10, R11 ; FLIPS THE BITS ON THE VAALUE TAKEN IN ON THE SWITCHES
OUT R10, LEDS ; OUTS THAT VALUE TO THE SWITCHES
BRN MAIN

ISR: EXOR R11, 0xFF ; TOGGLES THE BITS IN R11
RETIE ; RETURN WITH INTERRUPTS ENABLED

.ORG 0x3FF
VECTOR: BRN ISR ; BRANCHES TO ISR WHEN THE THE PROGRAM COUNTER IS 0x3FF
