----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 5:
-- RAT_MCU.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The RAT MCU is the overarching architecture of all the
-- modules created thus far. It includes the program counter,
-- prog_rom, reg_file, ALU, flags, control unit and the associated muxes that
-- go along with it. We will eventually modify this to include all of the components
-- needed to execute commands in the RAT assembler.
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY RAT_MCU IS
	PORT
	(
		IN_PORT                : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		RESET                  : IN STD_LOGIC;
		INT                    : IN STD_LOGIC;
		CLK                    : IN STD_LOGIC;
		OUT_PORT               : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		PORT_ID                : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		IO_STRB                : OUT STD_LOGIC
	);
END RAT_MCU;

ARCHITECTURE Behavioral OF RAT_MCU IS

	COMPONENT CONTROL_UNIT
		PORT
		(
			C_FLAG                : IN STD_LOGIC;
			Z_FLAG                : IN STD_LOGIC;
			INT                   : IN STD_LOGIC;
			RESET                 : IN STD_LOGIC;
			OPCODE_HI_5           : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			OPCODE_LO_2           : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			CLK                   : IN STD_LOGIC;

			I_SET                 : OUT STD_LOGIC;
			I_CLR                 : OUT STD_LOGIC;
			PC_LD                 : OUT STD_LOGIC;
			PC_INC                : OUT STD_LOGIC;
			PC_MUX_SEL            : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			ALU_OPY_SEL           : OUT STD_LOGIC;
			ALU_SEL               : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			RF_WR                 : OUT STD_LOGIC;
			RF_WR_SEL             : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			SP_LD                 : OUT STD_LOGIC;
			SP_INC                : OUT STD_LOGIC;
			SP_DECR               : OUT STD_LOGIC;
			SCR_WE                : OUT STD_LOGIC;
			SCR_ADDR_SEL          : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			SCR_DATA_SEL          : OUT STD_LOGIC;
			FLG_C_SET             : OUT STD_LOGIC;
			FLG_C_CLR             : OUT STD_LOGIC;
			FLG_C_LD              : OUT STD_LOGIC;
			FLG_Z_LD              : OUT STD_LOGIC;
			FLG_LD_SEL            : OUT STD_LOGIC;
			FLG_SHAD_LD           : OUT STD_LOGIC;
			RST                   : OUT STD_LOGIC;
			IO_STRB               : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT prog_rom
		PORT
		(
			ADDRESS               : IN std_logic_vector(9 DOWNTO 0);
			INSTRUCTION           : OUT std_logic_vector(17 DOWNTO 0);
			CLK                   : IN std_logic
		);
	END COMPONENT prog_rom;

	COMPONENT ALU_MUX
		PORT
		(
			DY_OUT                : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			FROM_INSTRUCTION_REG  : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			ALU_OPY_SEL           : IN STD_LOGIC;
			B                     : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT ALU_MUX;
	COMPONENT ALU
		PORT
		(
			A                     : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- A Input to the ALU
			B                     : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- B Input to the ALU
			SEL                   : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- Selector
			C_IN                  : IN STD_LOGIC; -- Carry In
			SUM                   : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); -- Output of the Operation
			C_FLAG                : OUT STD_LOGIC; -- Carry Flag
		Z_FLAG                 : OUT STD_LOGIC); -- Zero Flag

	END COMPONENT;

	COMPONENT REG_FILE IS
		PORT
		(
			RF_WR_DATA            : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			ADRX                  : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			ADRY                  : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			RF_WR                 : IN STD_LOGIC;
			CLK                   : IN STD_LOGIC;
			DX_OUT                : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			DY_OUT                : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT REG_MUX
		PORT
		(
			FROM_IN_PORT          : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			RF_WR_SEL             : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			FROM_PC               : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			FROM_B                : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			FROM_ALU              : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			D_OUT                 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT REG_MUX;
	COMPONENT pc_mux IS
		PORT
		(
			FROM_IMMED            : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			FROM_STACK            : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PC_MUX_SEL            : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			D_OUT                 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT program_counter IS
		PORT
		(
			D_IN                  : IN std_logic_vector(9 DOWNTO 0);
			PC_LD                 : IN std_logic;
			PC_INC                : IN std_logic;
			RST                   : IN std_logic;
			CLK                   : IN std_logic;
			PC_COUNT              : OUT std_logic_vector(9 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT FLAGS
		PORT
		(
			FLG_C_SET             : IN STD_LOGIC;
			FLG_C_CLR             : IN STD_LOGIC;
			C                     : IN STD_LOGIC;
			Z                     : IN STD_LOGIC;
			FLG_C_LD              : IN STD_LOGIC;
			FLG_Z_LD              : IN STD_LOGIC;
			FLG_LD_SEL            : IN STD_LOGIC;
			FLG_SHAD_LD           : IN STD_LOGIC;
			C_FLAG                : OUT STD_LOGIC;
			Z_FLAG                : OUT STD_LOGIC;
			CLK                   : IN STD_LOGIC
		);
	END COMPONENT FLAGS;

	component stack_pointer
		port (
		  SP_D_IN              : IN  std_logic_vector(7 downto 0);
		  SP_LD                : IN  std_logic;
		  SP_INC               : IN  std_logic;
		  SP_DECR              : IN  std_logic;
		  RST                  : IN  std_logic;
		  CLK                  : IN  std_logic;
		  SP_D_OUT             : OUT std_logic_vector(7 downto 0) -- STACK POINTER DATA OUT
		);
	end component stack_pointer;

	component SCR_DATA_MUX
	port (
	  DX_OUT                : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
	  PC_COUNT              : in  STD_LOGIC_VECTOR (9 downto 0);
	  SCR_DATA_SEL          : in  STD_LOGIC;
	  SCR_DATA_OUT          : out STD_LOGIC_VECTOR (9 downto 0)
	);
	end component SCR_DATA_MUX;

	component SCRATCH_RAM
	port (
	  DATA_IN               : IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
	  SCR_ADDR              : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
	  SCR_WE                : IN  STD_LOGIC;
	  CLK                   : IN  STD_LOGIC;
	  DATA_OUT              : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
	);
	end component SCRATCH_RAM;

	component SCR_ADDR_MUX
	port (
	  DY_OUT                : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
	  FROM_IMMED            : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
	  SP_DATA_OUT           : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
	  SCR_ADDR_SEL          : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	  SCR_ADDR_MUX_DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	end component SCR_ADDR_MUX;





	SIGNAL C_FLAG           : STD_LOGIC;
	SIGNAL Z_FLAG           : STD_LOGIC;
	SIGNAL OPCODE_HI_5      : STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL OPCODE_LO_2      : STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL I_SET            : STD_LOGIC;
	SIGNAL I_CLR            : STD_LOGIC;
	SIGNAL PC_LD            : STD_LOGIC;
	SIGNAL PC_INC           : STD_LOGIC;
	SIGNAL PC_MUX_SEL       : STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL ALU_OPY_SEL      : STD_LOGIC;
	SIGNAL ALU_SEL          : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL RF_WR            : STD_LOGIC;
	SIGNAL RF_WR_SEL        : STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL SP_LD            : STD_LOGIC;
	SIGNAL SP_INC           : STD_LOGIC;
	SIGNAL SP_DECR          : STD_LOGIC;
	SIGNAL SCR_WE           : STD_LOGIC;
	SIGNAL SCR_ADDR_SEL     : STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL SCR_DATA_SEL     : STD_LOGIC;
	SIGNAL FLG_C_SET        : STD_LOGIC;
	SIGNAL FLG_C_CLR        : STD_LOGIC;
	SIGNAL FLG_C_LD         : STD_LOGIC;
	SIGNAL FLG_Z_LD         : STD_LOGIC;
	SIGNAL FLG_LD_SEL       : STD_LOGIC;
	SIGNAL FLG_SHAD_LD      : STD_LOGIC;
	SIGNAL RST              : STD_LOGIC;

	SIGNAL C                : STD_LOGIC;
	SIGNAL Z                : STD_LOGIC;

	SIGNAL RF_WR_DATA       : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL ADRX             : STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL ADRY             : STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL DX_OUT           : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL DY_OUT           : STD_LOGIC_VECTOR (7 DOWNTO 0);

	SIGNAL ADDRESS          : std_logic_vector(9 DOWNTO 0);
	SIGNAL INSTRUCTION      : std_logic_vector(17 DOWNTO 0);
	SIGNAL A                : STD_LOGIC_VECTOR (7 DOWNTO 0); -- A Input to the ALU
	SIGNAL B                : std_logic_vector (7 DOWNTO 0); -- B Input to the ALU
	--signal SEL : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Selector
	--signal C_IN : STD_LOGIC; -- Carry In
	SIGNAL SUM              : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL FROM_IMMED       : STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL FROM_STACK       : STD_LOGIC_VECTOR(9 DOWNTO 0);
	--signal D_OUT : STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL D_IN             : std_logic_vector(9 DOWNTO 0);



	-- signal SP_D_IN  : std_logic_vector(7 downto 0);
	-- signal SP_LD    : std_logic;
	-- signal SP_INC   : std_logic;
	-- signal SP_DECR  : std_logic;
	-- signal RST      : std_logic;
	-- signal CLK      : std_logic;
	signal SP_D_OUT         : std_logic_vector(7 downto 0); -- STACK POINTER DATA OUT;
	SIGNAL SCR_DATA_IN      : std_logic_vector(9 DOWNTO 0);
	SIGNAL SCR_DATA_OUT     : std_logic_vector(9 DOWNTO 0);
	SIGNAL SCR_ADDR         : STD_LOGIC_VECTOR(7 DOWNTO 0);



BEGIN
	CU                      : CONTROL_UNIT
	PORT MAP
	(
		C_FLAG       => C_FLAG,
		Z_FLAG       => Z_FLAG,
		INT          => INT,
		RESET        => RESET,
		OPCODE_HI_5  => OPCODE_HI_5,
		OPCODE_LO_2  => OPCODE_LO_2,
		CLK          => CLK,
		I_SET        => I_SET,
		I_CLR        => I_CLR,
		PC_LD        => PC_LD,
		PC_INC       => PC_INC,
		PC_MUX_SEL   => PC_MUX_SEL,
		ALU_OPY_SEL  => ALU_OPY_SEL,
		ALU_SEL      => ALU_SEL,
		RF_WR        => RF_WR,
		RF_WR_SEL    => RF_WR_SEL,
		SP_LD        => SP_LD,
		SP_INC       => SP_INC,
		SP_DECR      => SP_DECR,
		SCR_WE       => SCR_WE,
		SCR_ADDR_SEL => SCR_ADDR_SEL,
		SCR_DATA_SEL => SCR_DATA_SEL,
		FLG_C_SET    => FLG_C_SET,
		FLG_C_CLR    => FLG_C_CLR,
		FLG_C_LD     => FLG_C_LD,
		FLG_Z_LD     => FLG_Z_LD,
		FLG_LD_SEL   => FLG_LD_SEL,
		FLG_SHAD_LD  => FLG_SHAD_LD,
		RST          => RST,
		IO_STRB      => IO_STRB
	);

	FLAGS_i                 : FLAGS
	PORT MAP
	(
		FLG_C_SET   => FLG_C_SET,
		FLG_C_CLR   => FLG_C_CLR,
		C           => C,
		Z           => Z,
		FLG_C_LD    => FLG_C_LD,
		FLG_Z_LD    => FLG_Z_LD,
		FLG_LD_SEL  => FLG_LD_SEL,
		FLG_SHAD_LD => FLG_SHAD_LD,
		C_FLAG      => C_FLAG,
		Z_FLAG      => Z_FLAG,
		CLK         => CLK
	);
	REG_FILE_i              : REG_FILE
	PORT MAP
	(
		RF_WR_DATA => RF_WR_DATA,
		ADRX       => ADRX,
		ADRY       => ADRY,
		RF_WR      => RF_WR,
		CLK        => CLK,
		DX_OUT     => DX_OUT,
		DY_OUT     => DY_OUT
	);

	REG_MUX_i               : REG_MUX
	PORT MAP
	(
		FROM_IN_PORT => IN_PORT,
		RF_WR_SEL    => RF_WR_SEL,
		FROM_PC      => SCR_DATA_OUT(7 DOWNTO 0),
		FROM_B       => SP_D_OUT,
		FROM_ALU     => SUM,
		D_OUT        => RF_WR_DATA
	);
	prog_rom_i              : prog_rom
	PORT MAP
	(
		ADDRESS     => ADDRESS,
		INSTRUCTION => INSTRUCTION,
		CLK         => CLK
	);

	ALU_MUX_i               : ALU_MUX
	PORT MAP
	(
		DY_OUT               => DY_OUT,
		FROM_INSTRUCTION_REG => INSTRUCTION(7 DOWNTO 0),
		ALU_OPY_SEL          => ALU_OPY_SEL,
		B                    => B
	);
	ALU_i                   : ALU
	PORT MAP
	(
		A      => A,
		B      => B,
		SEL    => ALU_SEL,
		C_IN   => C_FLAG,
		SUM    => SUM,
		C_FLAG => C,
		Z_FLAG => Z
	);

	PC_MUX_1                : pc_mux
	PORT MAP
	(
		FROM_IMMED => FROM_IMMED,
		FROM_STACK => SCR_DATA_OUT,
		PC_MUX_SEL => PC_MUX_SEL,
		D_OUT      => D_IN
	);
	PC                      : program_counter
	PORT MAP
	(
		D_IN     => D_IN,
		PC_LD    => PC_LD,
		PC_INC   => PC_INC,
		RST      => RST,
		CLK      => CLK,
		PC_COUNT => ADDRESS
	);

	stack_pointer_i         : stack_pointer
	port map (
	  SP_D_IN  => DX_OUT,
	  SP_LD    => SP_LD,
	  SP_INC   => SP_INC,
	  SP_DECR  => SP_DECR,
	  RST      => RST,
	  CLK      => CLK,
	  SP_D_OUT => SP_D_OUT
	);

	SCR_DATA_MUX_i          : SCR_DATA_MUX
	port map (
	  DX_OUT       => DX_OUT,
	  PC_COUNT     => D_IN,
	  SCR_DATA_SEL => SCR_DATA_SEL,
	  SCR_DATA_OUT => SCR_DATA_IN
	);

	SCRATCH_RAM_i           : SCRATCH_RAM
	port map (
	  DATA_IN  => SCR_DATA_IN,
	  SCR_ADDR => SCR_ADDR,
	  SCR_WE   => SCR_WE,
	  CLK      => CLK,
	  DATA_OUT => SCR_DATA_OUT
	);

	SCR_ADDR_MUX_i          : SCR_ADDR_MUX
	port map (
	  DY_OUT                => DY_OUT,
	  FROM_IMMED            => INSTRUCTION(7 DOWNTO 0),
	  SP_DATA_OUT           => SP_D_OUT,
	  SCR_ADDR_SEL          => SCR_ADDR_SEL,
	  SCR_ADDR_MUX_DATA_OUT => SCR_ADDR
	);




	A           <= DX_OUT;
	OUT_PORT    <= DX_OUT;
	FROM_IMMED  <= INSTRUCTION (12 DOWNTO 3);
	OPCODE_HI_5 <= INSTRUCTION (17 DOWNTO 13);
	OPCODE_LO_2 <= INSTRUCTION (1 DOWNTO 0);
	--PC_COUNT <= ADDRESS;
	ADRX    <= INSTRUCTION (12 DOWNTO 8);
	ADRY    <= INSTRUCTION (7 DOWNTO 3);
	PORT_ID <= INSTRUCTION (7 DOWNTO 0);

END Behavioral;
