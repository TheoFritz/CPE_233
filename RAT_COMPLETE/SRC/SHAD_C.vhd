----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 5:
-- Z_FLAG_FF.vhd
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The Z_FLAG file creates a d flip-flop that handles
-- the Z flag within the the flags component.
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHAD_C IS
	PORT
	(
		C           : IN STD_LOGIC;
		FLG_SHAD_LD : IN STD_LOGIC;
		CLK         : IN STD_LOGIC;
		SHAD_C_FLAG      : OUT STD_LOGIC
	);
END SHAD_C;

ARCHITECTURE Behavioral OF SHAD_C IS
	SIGNAL C_FLAG_TEMP : STD_LOGIC;
BEGIN
	SHAD_C_DF : PROCESS (C_FLAG_TEMP, C, CLK, FLG_SHAD_LD)
	BEGIN
		IF (RISING_EDGE(CLK)) THEN -- When the rising edge of the clock and when FLG_Z_LD is high
			IF FLG_SHAD_LD = '1' THEN -- the flip-flop will latch data.
				C_FLAG_TEMP <= C;
			ELSE
				C_FLAG_TEMP <= C_FLAG_TEMP; -- Otherwise 0
			END IF;

		END IF;
	END PROCESS;

	SHAD_C_FLAG <= C_FLAG_TEMP;
END Behavioral;
