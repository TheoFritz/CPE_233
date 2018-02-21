----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 5:
-- C_FLAG_FF.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The C_FLAG file creates a d flip-flop that handles
-- the C flag within the the flags component.
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY C_FLAG_FF IS
	PORT
	(
		C         : IN STD_LOGIC;
		FLG_C_LD  : IN STD_LOGIC;
		FLG_C_SET : IN STD_LOGIC;
		FLG_C_CLR : IN STD_LOGIC;
		CLK       : IN STD_LOGIC;
		C_FLAG    : OUT STD_LOGIC
	);
END C_FLAG_FF;

ARCHITECTURE Behavioral OF C_FLAG_FF IS
	SIGNAL C_FLAG_TEMP : STD_LOGIC;
BEGIN
	C_FLAG_DF : PROCESS (C, FLG_C_LD, FLG_C_SET, FLG_C_CLR, CLK)
	BEGIN
		IF (RISING_EDGE(CLK)) THEN -- When the rising edge of the clock and when FLG_C_LD is high
		    IF FLG_C_LD = '1' THEN
		        C_FLAG_TEMP <= C;
			ELSIF FLG_C_SET = '1' THEN -- the C_FLAG will go high.
				C_FLAG_TEMP <= '1';
			ELSIF FLG_C_CLR = '1' THEN
				C_FLAG_TEMP <= '0'; -- Otherwise 0
			ELSE
				C_FLAG_TEMP <= C; -- the flip-flop will latch data.
			END IF;
		END IF;
	END PROCESS;

	C_FLAG <= C_FLAG_TEMP;

END Behavioral;
