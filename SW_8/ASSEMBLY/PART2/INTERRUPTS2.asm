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
.EQU LEDS = 0x42
.EQU SWITCHES = 0x20

;--------------------------------------------------------------------------
;-- .ORG used in code segment
;--------------------------------------------------------------------------
.CSEG
.ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01

SEI ; ENABLES INTERRUPTS 
IN R0,SWITCHES; TAKES IN A VALUE FROM THE LEDS
IN R4,0x9B; TAKES IN THE VALUE OF THE BUTTON 
MOV R0,R1; 


