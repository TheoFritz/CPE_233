----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 5:
-- FLAGS.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- TOP LEVEL FLAGS FILE. HOLDS C AND Z FLAG FLIP FLOPS. WILL EVENTUALLY INCLUDE
-- SHADOW FLAGS
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FLAGS IS
	PORT
	(
		FLG_C_SET   : IN STD_LOGIC;
		FLG_C_CLR   : IN STD_LOGIC;
		C           : IN STD_LOGIC;
		Z           : IN STD_LOGIC;
		FLG_C_LD    : IN STD_LOGIC;
		FLG_Z_LD    : IN STD_LOGIC;
		FLG_LD_SEL  : IN STD_LOGIC;
		FLG_SHAD_LD : IN STD_LOGIC;
		C_FLAG      : OUT STD_LOGIC;
		Z_FLAG      : OUT STD_LOGIC;
		CLK         : IN STD_LOGIC
	);
END FLAGS;

ARCHITECTURE Behavioral OF FLAGS IS

	COMPONENT C_FLAG_FF
		PORT
		(
			C         : IN STD_LOGIC;
			FLG_C_LD  : IN STD_LOGIC;
			FLG_C_SET : IN STD_LOGIC;
			FLG_C_CLR : IN STD_LOGIC;
			CLK       : IN STD_LOGIC;
			C_FLAG    : OUT STD_LOGIC
		);
	END COMPONENT C_FLAG_FF;
	COMPONENT Z_FLAG_FF
		PORT
		(
			Z        : IN STD_LOGIC;
			FLG_Z_LD : IN STD_LOGIC;
			CLK      : IN STD_LOGIC;
			Z_FLAG   : OUT STD_LOGIC
		);
	END COMPONENT Z_FLAG_FF;
BEGIN
	C_FLAG_FF_i : C_FLAG_FF
	PORT MAP
	(
		C         => C,
		FLG_C_LD  => FLG_C_LD,
		FLG_C_SET => FLG_C_SET,
		FLG_C_CLR => FLG_C_CLR,
		CLK       => CLK,
		C_FLAG    => C_FLAG
	);

	Z_FLAG_FF_i : Z_FLAG_FF
	PORT MAP
	(
		Z        => Z,
		FLG_Z_LD => FLG_Z_LD,
		CLK      => CLK,
		Z_FLAG   => Z_FLAG
	);
END Behavioral;
