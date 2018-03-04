----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 3:
-- SCRATCH_RAM.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The Scratch RAM serves two functions. The first of those is to provide
-- temporary storage that is accessible from the RAT instruction set. The second
-- is that the RAT uses the scratch RAM as storage for the stack.
--
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY SCRATCH_RAM IS
	PORT
	(
		DATA_IN  : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		SCR_ADDR : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		SCR_WE   : IN STD_LOGIC;
		CLK      : IN STD_LOGIC;
		DATA_OUT : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
	);
END SCRATCH_RAM;
ARCHITECTURE Behavioral OF SCRATCH_RAM IS
	TYPE Vector_array IS ARRAY(0 TO 255) OF STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL memoryModule : Vector_array := (OTHERS => (OTHERS => '0')); -- Initalize to zero
BEGIN
	RAM : PROCESS (CLK)
	BEGIN
		IF (rising_edge(CLK)) THEN -- RAM writes synchronously
			IF (SCR_WE = '1') THEN
				memoryModule(to_integer(unsigned(SCR_ADDR))) <= DATA_IN;
			END IF;
		END IF;
	END PROCESS;
	DATA_OUT <= memoryModule(to_integer(unsigned(SCR_ADDR))); -- Data is read asynchronously
END Behavioral;
