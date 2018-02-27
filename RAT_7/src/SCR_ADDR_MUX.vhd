----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 7:
-- SCR_ADDR_MUX.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- This program switches the address location for the scratch ram
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY SCR_ADDR_MUX IS
	PORT (
		DY_OUT                  : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- TAKES DATA FROM THE Y LINE OF THE REG_FILE
		FROM_IMMED              : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- TAKES DATA FROM THE FROM_IMMED LINE
		SP_DATA_OUT             : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- TAKES DATA FROM THE STACK POINTER
		SCR_ADDR_SEL            : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- SELECTS WHICH INPUT DATA COMES FROM
    SCR_ADDR_MUX_DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- OUTPUT OF THE MUX
	);
END SCR_ADDR_MUX;
ARCHITECTURE Behavioral OF SCR_ADDR_MUX IS
BEGIN
	SCR_ADDR_MUX_DATA_OUT <= DY_OUT WHEN ( SCR_ADDR_SEL= "00") ELSE -- when select is "00" DY_OUT goes to SCR_ADDR_MUX_DATA_OUT
	         FROM_IMMED WHEN (SCR_ADDR_SEL = "01") ELSE -- when select is "01" FROM_IMMED goes to SCR_ADDR_MUX_DATA_OUT
	         SP_DATA_OUT WHEN (SCR_ADDR_SEL = "10") ELSE -- when select is "10" SP_DATA_OUT goes to SCR_ADDR_MUX_DATA_OUT
	         (SP_DATA_OUT - "00000001") WHEN (SCR_ADDR_SEL = "11"); -- when select is "11"
	       

END Behavioral;
