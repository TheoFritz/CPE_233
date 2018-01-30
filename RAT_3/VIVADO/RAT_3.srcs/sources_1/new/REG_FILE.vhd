----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 3:
-- REG_FILE.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The register file stores all register values.
--
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY REG_FILE IS
	PORT
	(
		RF_WR_DATA : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		ADRX       : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ADRY       : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		RF_WR      : IN STD_LOGIC;
		CLK        : IN STD_LOGIC;
		DX_OUT     : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		DY_OUT     : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END REG_FILE;
ARCHITECTURE Behavioral OF REG_FILE IS
	TYPE Vector_array IS ARRAY(0 TO 31) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL memoryModule : Vector_array := (OTHERS => (OTHERS => '0')); -- Initalize memory module
	-- set all values to zero
BEGIN
	RAM_WRITE : PROCESS (CLK, RF_WR)
	BEGIN
		IF (Rising_Edge(CLK)) THEN -- Data is written synchronously
			IF (RF_WR = '1') THEN
				memoryModule(to_integer(unsigned(ADRX))) <= RF_WR_DATA;
			END IF;
		END IF;
	END PROCESS;
	DX_OUT <= memoryModule(to_integer(unsigned(ADRX))); -- Data is read asynchronously
	DY_OUT <= memoryModule(to_integer(unsigned(ADRY)));
END Behavioral;
