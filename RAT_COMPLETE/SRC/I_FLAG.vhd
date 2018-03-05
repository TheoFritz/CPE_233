----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 8:
-- I_FLAG.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The Interrupt Flag handles enabling or disabling interrupts
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY I_FLAG_FF IS
	PORT
	(
		I_SET  : IN STD_LOGIC;
		I_CLR : IN STD_LOGIC;
		CLK       : IN STD_LOGIC;
		I_FLG_OUT    : OUT STD_LOGIC
	);
END I_FLAG_FF;

ARCHITECTURE Behavioral OF I_FLAG_FF IS
	SIGNAL I_FLG_TEMP : STD_LOGIC;

BEGIN
	I_FLAG_DF : PROCESS (I_FLG_TEMP, I_SET, I_CLR, CLK)
	BEGIN
		IF (RISING_EDGE(CLK)) THEN -- When the rising edge of the clock and when I_SET is high
		    IF I_SET = '1' THEN
		        I_FLG_TEMP <= '1';
			ELSIF I_CLR = '1' THEN -- the C_FLAG will go high.
				I_FLG_TEMP <= '0';
			END IF;
		END IF;
	END PROCESS;

	I_FLG_OUT <= I_FLG_TEMP;

END Behavioral;
