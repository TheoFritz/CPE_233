----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 2:
-- PC_MUX.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY REG_MUX IS
	PORT (
		FROM_IN_PORT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		RF_WR_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		FROM_PC : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		FROM_B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		FROM_ALU : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		D_OUT      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END REG_MUX;
ARCHITECTURE Behavioral OF REG_MUX IS
BEGIN
	D_OUT <= FROM_ALU WHEN (RF_WR_SEL = "00") ELSE
	         FROM_PC WHEN (RF_WR_SEL = "01") ELSE
	         FROM_B WHEN (RF_WR_SEL = "10") ELSE
					 FROM_IN_PORT WHEN (RF_WR_SEL = "11");

END Behavioral;
