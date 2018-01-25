----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 2:
-- PC_WRAPPER.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- Wraps the program counter and the program counter mux together
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY PC_WRAPPER IS
	PORT (
		RST        : IN STD_LOGIC;
		INC        : IN STD_LOGIC;
		LD         : IN STD_LOGIC;
		CLK        : IN STD_LOGIC;
		FROM_IMMED : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		FROM_STACK : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		PC_MUX_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		IR         : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END PC_WRAPPER;
ARCHITECTURE Behavioral OF PC_WRAPPER IS
	----------------------------------------------------------------------------------
	-- PORT MAP EXTERNAL COMPONENTS
	----------------------------------------------------------------------------------
	COMPONENT pc_mux IS
		PORT (
			FROM_IMMED : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			FROM_STACK : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PC_MUX_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			D_OUT      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT program_counter IS
		PORT (
			D_IN     : IN std_logic_vector(9 DOWNTO 0);
			PC_LD    : IN std_logic;
			PC_INC   : IN std_logic;
			RST      : IN std_logic;
			CLK      : IN std_logic;
			PC_COUNT : OUT std_logic_vector(9 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT prog_rom IS
		PORT (
			ADDRESS     : IN std_logic_vector(9 DOWNTO 0);
			INSTRUCTION : OUT std_logic_vector(17 DOWNTO 0);
			CLK         : IN std_logic
		);
	END COMPONENT;
	SIGNAL D_IN, ADDR : STD_LOGIC_VECTOR(9 DOWNTO 0);
BEGIN
	mux1 : pc_mux
	PORT MAP(
		FROM_IMMED => FROM_IMMED,
		FROM_STACK => FROM_STACK,
		PC_MUX_SEL => PC_MUX_SEL,
		D_OUT      => D_IN
	);
	PC : program_counter
	PORT MAP(
		D_IN     => D_IN,
		PC_LD    => LD,
		PC_INC   => INC,
		RST      => RST,
		CLK      => CLK,
		PC_COUNT => ADDR
	);
	ROM : prog_rom
	PORT MAP(
		ADDRESS     => ADDR,
		INSTRUCTION => IR,
		CLK         => CLK
	);
END Behavioral;