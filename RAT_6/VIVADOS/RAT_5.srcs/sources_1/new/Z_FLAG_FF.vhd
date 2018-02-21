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

ENTITY Z_FLAG_FF IS
	PORT
	(
		Z        : IN STD_LOGIC;
		FLG_Z_LD : IN STD_LOGIC;
		CLK      : IN STD_LOGIC;
		Z_FLAG   : OUT STD_LOGIC
	);
END Z_FLAG_FF;

ARCHITECTURE Behavioral OF Z_FLAG_FF IS
	SIGNAL Z_FLAG_TEMP : STD_LOGIC;
BEGIN
	Z_FLAG_DF : PROCESS (Z, CLK, FLG_Z_LD)
	BEGIN
		IF (RISING_EDGE(CLK)) THEN -- When the rising edge of the clock and when FLG_Z_LD is high
			IF FLG_Z_LD = '1' THEN -- the flip-flop will latch data.
				Z_FLAG_TEMP <= Z;
			ELSE
				Z_FLAG_TEMP <= '0'; -- Otherwise 0
			END IF;

		END IF;
	END PROCESS;

	Z_FLAG <= Z_FLAG_TEMP;
END Behavioral;
