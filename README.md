# Issues

RAT_MCU
When the Assembly file was:
```Assembly
IN r10,SWITCH_PORT
; MOV r11,0xFF
EXOR r10,r11
OUT r10,LED_PORT
BRN main
```
the blip did not happen. However, when the assembly file was
```Assembly
IN r10,SWITCH_PORT
MOV r11,0xFF
EXOR r10,r11
OUT r10,LED_PORT
BRN main
```
The blip did occur.
