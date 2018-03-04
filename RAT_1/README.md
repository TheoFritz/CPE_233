**Rat Assignment #1**

**Elizabeth Davis**

**Dominic Gaiero**

**Part 1 Table**

<table>
  <tr>
    <td>PC</td>
    <td>Instruction</td>
    <td>Destination Register Value</td>
    <td>C=?</td>
    <td>Z=?</td>
    <td>Output (ADDR) (OUR instr)</td>
  </tr>
  <tr>
    <td>040</td>
    <td>MOV R10,0x05</td>
    <td>R10 = 0x05</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>041</td>
    <td>MOV R11,0x64</td>
    <td>R11 = 0x64</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>042</td>
    <td>ADD R10,R11</td>
    <td>R10 = 0x69</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>043</td>
    <td>ADD R10,0x14</td>
    <td>R10 = 0x7D</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>044</td>
    <td>MOV R20,R10</td>
    <td>R20 = 0x7D</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>045</td>
    <td>OUT R20,LED_PORT</td>
    <td>--</td>
    <td>0</td>
    <td>0</td>
    <td>7D</td>
  </tr>
  <tr>
    <td>046</td>
    <td>BRN main_loop</td>
    <td>--</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
</table>


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

**PART2_A**

0x00FB = 0000       0000       1111       1011

       = 00 00      00 00      11 11      10 11

       = 0x00 0x00  0x00 0x00  0x03 0x03  0x02 0x03

0x820B 0x3EEA 0x1EFA 0x7F05 0x7EFA 0x9D01 0x7DFC

<table>
  <tr>
    <td>2-bit pairs from INITP_00</td>
    <td>2 bytes from INIT_00</td>
    <td>Concatenation of left two columns of this table</td>
    <td>Assembly Instruction</td>
    <td>ProgRom Mem Loc.</td>
  </tr>
  <tr>
    <td>11</td>
    <td>0x7DFC</td>
    <td>11 0111 1101 1111 1100</td>
    <td>MOV R29,0xFC</td>
    <td>0x40</td>
  </tr>
  <tr>
    <td>10</td>
    <td>0x9D01</td>
    <td>10 1001 1101 0000 0001</td>
    <td>ADD R29,0x01</td>
    <td>0x41</td>
  </tr>
  <tr>
    <td>11</td>
    <td>0x7EFA</td>
    <td>11 0111 1110 1111 1010</td>
    <td>MOV R30,0xFA</td>
    <td>0x42</td>
  </tr>
  <tr>
    <td>11</td>
    <td>0x7F05</td>
    <td>11 0111 1111 0000 0101</td>
    <td>MOV R31,0x05</td>
    <td>0x43</td>
  </tr>
  <tr>
    <td>00</td>
    <td>0x1EFA</td>
    <td>00 0001 1110 1111 1010</td>
    <td>EXOR R30,R31</td>
    <td>0x44</td>
  </tr>
  <tr>
    <td>00</td>
    <td>0x3EEA</td>
    <td>00 0011 1110 1110 1010</td>
    <td>SUB R30,R29</td>
    <td>0x45</td>
  </tr>
  <tr>
    <td>00</td>
    <td>0x820B</td>
    <td>00 1000 0010 0000 1011</td>
    <td>BRNE 0x41</td>
    <td>0x46</td>
  </tr>
</table>


**; ----------------------------------------------------**

**;**

**; RAT ASSIGNMENT No. 1: PART 2A**

**; DOMINIC GAIERO AND ELIZABETH DAVIS**

**;**

**; ----------------------------------------------------**

**.DSEG**

**.ORG               0x00**

**; ----------------------------------------------------**

**; CODE SEGMENT STARTS AT 0x40**

**; ----------------------------------------------------**

**.CSEG**

**.ORG                    0x40         ; data starts here**

**	   MOV     R29,0xFC**

**	   ADD     R29,0x01**

**	   MOV     R30,0xFA**

**	   MOV     R31,0x05**

**	   EXOR    R30,R31**

**	   SUB     R30,R29**

**	   BRNE    0x41             ; loop if not equal**

**PART2_B**

<table>
  <tr>
    <td>PC</td>
    <td>Instruction</td>
    <td>Destination Register Value</td>
    <td>C=?</td>
    <td>Z=?</td>
    <td>Output (ADDR) (OUR instr)</td>
  </tr>
  <tr>
    <td>040</td>
    <td>MOV R29,0xFC</td>
    <td>R29 = 0xFC</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>041</td>
    <td>ADD R29,0x01</td>
    <td>R29 = 0xFD</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>042</td>
    <td>MOV R30,0xFA</td>
    <td>R30 = 0xFA</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>043</td>
    <td>MOV R31,0x05</td>
    <td>R31 = 0x05</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>044</td>
    <td>EXOR R30,R31</td>
    <td>R30 = 0xFF</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>045</td>
    <td>SUB R30,R29</td>
    <td>R30 = 0x02</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>046</td>
    <td>BRNE 0x41</td>
    <td>--</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>041</td>
    <td>ADD R29,0x01</td>
    <td>R29 = 0xFE</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>042</td>
    <td>MOV R30,0xFA</td>
    <td>R30 = 0xFA</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>043</td>
    <td>MOV R31,0x05</td>
    <td>R31 = 0x05</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>044</td>
    <td>EXOR R30,R31</td>
    <td>R30 = 0xFF</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>045</td>
    <td>SUB R30,R29</td>
    <td>R30 = 0x01</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>046</td>
    <td>BRNE 0x41</td>
    <td>--</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>041</td>
    <td>ADD R29,0x01</td>
    <td>R29 = 0xFF</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>042</td>
    <td>MOV R30,0xFA</td>
    <td>R30 = 0xFA</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>043</td>
    <td>MOV R31,0x05</td>
    <td>R31 = 0x05</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>044</td>
    <td>EXOR R30,R31</td>
    <td>R30 = 0xFF</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
  <tr>
    <td>045</td>
    <td>SUB R30,R29</td>
    <td>R30 = 0x00</td>
    <td>0</td>
    <td>1</td>
    <td>--</td>
  </tr>
  <tr>
    <td>046</td>
    <td>BRNE 0x41</td>
    <td>--</td>
    <td>0</td>
    <td>0</td>
    <td>--</td>
  </tr>
</table>


QUESTIONS

1. Briefly describe why the prog_rom.vhd is tedious to interpret.

    1. The prog_rom.vhd is tedious to interpret because it contains the machine code in hex format. This requires converting the hex to binary, cross referencing with the RAT Assembler manual and looking up each command.  

2. Why is it necessary to have assembly language programming when there are much more elegant languages such as C, Java, etc. available?

    2. Assembly language is simple, human readable machine code. Many compilers for languages such as C, Java, etc. have the option to generate assembly instead of the machine code or bytecode. This allows for easier debugging of the machine code in a more human-readable format.

3. Describe a system other than the examples given in the link above in which reverse engineering could or has led to a significant business advantage?

    3. A manufacturer in China called BYD has become known for reverse engineering electronics, batteries, or cars to be more efficient and cost effective. Other Chinese companies work to create products that are influenced by other products, but BYD works to make a profit by finding out how other products are made and finding a way to produce them cheaper and more efficient.

