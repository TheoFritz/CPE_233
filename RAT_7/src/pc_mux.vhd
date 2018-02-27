----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 2:
-- PC_MUX.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The program counter (PC) takes in a 10 bit input (D_IN) from a mux.
-- D_IN specifies where the PC starts counting.
-- Data is only loaded into the PC when PC_ID is '1'.
-- When PC_INC is a 1, the data is incremented, otherwise, the output is
-- the same as the current value in the PC and is not incremented.
-- RST resets the counter back to 0, and CLK is the timing signal that
-- all operations operate on.
-- PC_COUNT is a 10-bit output representing the current count.
--
-- This mux switches from immediate, stack, or 0x3FF
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY pc_mux IS
	PORT (
		FROM_IMMED : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- Branch and Call instructions obtain the new value of the PC from the immediate value included as part of the individual instruction formats.
		FROM_STACK : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- Return instructions (return from subroutine) obtain the new PC value from the stack.
		PC_MUX_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Interrupts (when they are acted upon) set the PC to the interrupt vector: 0x3FF.
		D_OUT      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) -- The output of the mux
	);
END pc_mux;
ARCHITECTURE Behavioral OF pc_mux IS
BEGIN
	D_OUT <= FROM_IMMED WHEN (PC_MUX_SEL = "00") ELSE -- when select is "00" FROM_IMMED goes to D_Out
	         FROM_STACK WHEN (PC_MUX_SEL = "01") ELSE -- when select is "01" FROM_STACK goes to D_Out
	         "1111111111" WHEN (PC_MUX_SEL = "10") ELSE -- when select is "10" "1111111111" goes to D_Out
	         "0000000000"; -- catch all when select is "11" "0000000000" goes to D_Out

END Behavioral;
