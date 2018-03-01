----------------------------------------------------------------------------------
-- HW ASSIGNMENT NO. 3:
-- Keypad Driver (BCD7SEG_8.vhd)
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- DESCRIPTION: This file incorporates the seven segment display and defines the 
-- different segments for the different hex displayed values. It also defines which 
-- display to use.
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BCD7SEG_8 IS
	PORT (
		sw : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		seg : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END BCD7SEG_8;
ARCHITECTURE Behavioral OF BCD7SEG_8 IS

BEGIN
	SEVENSEG : PROCESS (sw)
	BEGIN
		CASE sw IS
			WHEN "0000" => seg <= "11000000";
			WHEN "0001" => seg <= "11111001";
			WHEN "0010" => seg <= "10100100";
			WHEN "0011" => seg <= "10110000";
			WHEN "0100" => seg <= "10011001";
			WHEN "0101" => seg <= "10010010";
			WHEN "0110" => seg <= "10000010";
			WHEN "0111" => seg <= "11111000";
			WHEN "1000" => seg <= "10000000";
			WHEN "1001" => seg <= "10011000";
			WHEN "1010" => seg <= "10001000";
			when "1011" => seg <= "10000011";
			WHEN "1111" => seg <= "11111111";
			WHEN OTHERS => seg <= "11111111";
		END CASE;
	 END PROCESS;
	 
	 an <= "1110";
 END Behavioral;