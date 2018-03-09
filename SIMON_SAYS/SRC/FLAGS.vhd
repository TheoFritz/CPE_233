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

	component SHAD_Z
	port (
	  Z           : IN  STD_LOGIC;
	  FLG_SHAD_LD : IN  STD_LOGIC;
	  CLK         : IN  STD_LOGIC;
	  SHAD_Z_FLAG : OUT STD_LOGIC
	);
	end component SHAD_Z;

	component SHAD_C
	port (
	  C           : IN  STD_LOGIC;
	  FLG_SHAD_LD : IN  STD_LOGIC;
	  CLK         : IN  STD_LOGIC;
	  SHAD_C_FLAG : OUT STD_LOGIC
	);
	end component SHAD_C;

	component C_FLG_MUX
	port (
	  C_IN           : in  STD_LOGIC;
	  SHAD_C         : in  STD_LOGIC;
	  FLG_LD_SEL     : in  STD_LOGIC;
	  C_FLG_DATA_OUT : out STD_LOGIC
	);
	end component C_FLG_MUX;

	component Z_FLG_MUX
	port (
	  Z_IN           : in  STD_LOGIC;
	  SHAD_Z         : in  STD_LOGIC;
	  FLG_LD_SEL     : in  STD_LOGIC;
	  Z_FLG_DATA_OUT : out STD_LOGIC
	);
	end component Z_FLG_MUX;


	signal SHAD_C_FLAG : STD_LOGIC;
	signal SHAD_Z_FLG : std_logic;
	SIGNAL C_FLG_DATA_OUT : STD_LOGIC;
	SIGNAL C_FLAG_TEMP : STD_LOGIC;
	SIGNAL Z_FLG_DATA_OUT : STD_LOGIC;
	SIGNAL Z_FLAG_TEMP : STD_LOGIC;


BEGIN

	C_FLG_MUX_i : C_FLG_MUX
	port map (
	  C_IN           => C,
	  SHAD_C         => SHAD_C_FLAG,
	  FLG_LD_SEL     => FLG_LD_SEL,
	  C_FLG_DATA_OUT => C_FLG_DATA_OUT
	);

	C_FLAG_FF_i : C_FLAG_FF
	PORT MAP
	(
		C         => C_FLG_DATA_OUT,
		FLG_C_LD  => FLG_C_LD,
		FLG_C_SET => FLG_C_SET,
		FLG_C_CLR => FLG_C_CLR,
		CLK       => CLK,
		C_FLAG    => C_FLAG_TEMP
	);

	SHAD_C_i : SHAD_C
	port map (
	  C           => C_FLAG_TEMP,
	  FLG_SHAD_LD => FLG_SHAD_LD,
	  CLK         => CLK,
	  SHAD_C_FLAG => SHAD_C_FLAG
	);


	Z_FLAG_FF_i : Z_FLAG_FF
	PORT MAP
	(
		Z        => Z_FLG_DATA_OUT,
		FLG_Z_LD => FLG_Z_LD,
		CLK      => CLK,
		Z_FLAG   => Z_FLAG
	);

	Z_FLAG_MUX_i : Z_FLG_MUX
	PORT MAP (
	Z_IN           => Z,
	SHAD_Z         => SHAD_Z_FLG,
	FLG_LD_SEL     => FLG_LD_SEL,
	Z_FLG_DATA_OUT => Z_FLG_DATA_OUT
);

  SHAD_Z_i: SHAD_Z
	PORT MAP (
	Z           => Z_FLAG_TEMP,
	FLG_SHAD_LD => FLG_SHAD_LD,
	CLK         => CLK,
	SHAD_Z_FLAG => SHAD_Z_FLG

	);

	C_FLAG <= C_FLAG_TEMP;
	Z_FLAG <= Z_FLAG_TEMP;
END Behavioral;
