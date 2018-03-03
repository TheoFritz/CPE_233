; ----------------------------------------------------
;
; SW ASSIGNMENT No. 8 PART 2
; DOMINIC GAIERO AND ELIZABETH DAVIS
;
; DESCRIPTION:
; A PROGRAM THAT OUTPUTS THE MOST RECENT VALUE RECIEVED
; ON THE SWITCHES TO THE LEDS WHEN IT RECEIVES AN INTERRUPT.
; WHEN THE SWITCHES OUTPUT THE SAME VALUE ON TWO INTERRUPTS IN
; A ROW THE PROGRAM WILL STOP OUTPUTTING VALUES (ie TURN OFF THE
; LEDS) UNTIL BUTTON(0) IS PRESSED. THE PROGRAM THEN CONTINUES AS
; NORMAL.
; ----------------------------------------------------

.EQU IN_PORT = 0x9A
.EQU BUTTONS = 0x9B
.EQU LEDS = 0x42
.EQU SWITCHES = 0x20

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

MOV R3, 0x00 ; CLEAR INTERRUPT FLAG REGISTER
MOV R2, 0x00 ; CLEAR PREVIOUS VALUE REGISTER

BRN MAIN ; GO TO START OF PROGRAM

ISR: MOV R3, 0x01 ; INTERRUPT FLAG
CMP R2, R0 ; COMAPRE CURRENT VALUE TO PREVIOUS VALUE
BRNE VALUES_NOT_EQUAL ;IF CURRENT VALUE DOES NOT EQUAL PREVIOUS VALUE
VALUES_EQUAL:
OUT R0,LEDS ; OUTPUT THE SWITCH VALUES TO THE LEDS
BRN CHECK_BTN ; GO TO CHECK BUTTON
VALUES_NOT_EQUAL: MOV R2, R0 ; IF THE VALUES ARE NOT EUQAL, THEN SET THE PREVIOUS VALUE TO THE CURRENT VALUE
RETIE

CHECK_BTN:
CLI ; CLEAR INTERRUPTS
MOV R0, 0x00 ; CLEAR OTUPUT REGISTER
OUT R0, LEDS ; OUTPUT NOTHING TO LEDS
IN R10, BUTTONS ; READ BUTTON PRESS
AND R10, 0x01 ; MASK BUTTON TO ONLY GET LSB
CMP R10, 0x01 ; CHECK IF BUTTON IS EQUAL TO ONE
BRNE CHECK_BTN ; IF IT IS NOT, THEN BRANCH BACK TO BUTTON

MAIN: SEI ; ENABLES INTERRUPTS
MOV R10, 0x00 ; CLEAR BUTTON REGISTER
IN R0, SWITCHES ; READ IN SWITCH VALUES
MOV R30,0X00 ;****DELETE ME**********************************
CMP R3, 0x01 ; CHECK IF INTERRUPT FLAG IS HIGH (ONLY OUTPUT IF INTERRUPT)
BRNE MAIN ; IF IT IS NOT HIGH, RETURN TO MAIN
OUT R0, LEDS ; OUTPUT SWITCH VALUES TO LEDS
MOV R3, 0x00 ; RESET INTERRUPT FLAG
BRN MAIN ; RETURN TO MAIN

.ORG 0x3FF
VECTOR: BRN ISR ; CALL ISR
