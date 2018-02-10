----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/09/2018 05:22:33 PM
-- Design Name:
-- Module Name: RAT_MCU - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAT_MCU is
    Port ( IN_PORT  : in STD_LOGIC_VECTOR (7 downto 0);
           RESET    : in STD_LOGIC;
           INT      : in STD_LOGIC;
           CLK      : in STD_LOGIC;
           OUT_PORT : out STD_LOGIC_VECTOR (7 downto 0);
           PORT_ID  : out STD_LOGIC_VECTOR (7 downto 0);
           IO_STRB  : out STD_LOGIC);


end RAT_MCU;

architecture Behavioral of RAT_MCU is

COMPONENT CONTROL_UNIT
PORT ( C_FLAG       : in STD_LOGIC;
       Z_FLAG       : in STD_LOGIC;
       INT          : in STD_LOGIC;
       RESET        : in STD_LOGIC;
       OPCODE_HI_5  : in STD_LOGIC_VECTOR (4 downto 0);
       OPCODE_LO_2  : in STD_LOGIC_VECTOR (1 downto 0);
       CLK          : in STD_LOGIC;

       I_SET        : out STD_LOGIC;
       I_CLR        : out STD_LOGIC;
       PC_LD        : out STD_LOGIC;
       PC_INC       : out STD_LOGIC;
       PC_MUX_SEL   : out STD_LOGIC_VECTOR (1 downto 0);
       ALU_OPY_SEL  : out STD_LOGIC;
       ALU_SEL      : out STD_LOGIC_VECTOR (3 downto 0);
       RF_WR        : out STD_LOGIC;
       RF_WR_SEL    : out STD_LOGIC_VECTOR (1 downto 0);
       SP_LD        : out STD_LOGIC;
       SP_INC       : out STD_LOGIC;
       SP_DECR      : out STD_LOGIC;
       SCR_WE       : out STD_LOGIC;
       SCR_ADDR_SEL : out STD_LOGIC_VECTOR (1 downto 0);
       SCR_DATA_SEL : out STD_LOGIC;
       FLG_C_SET    : out STD_LOGIC;
       FLG_C_CLR    : out STD_LOGIC;
       FLG_C_LD     : out STD_LOGIC;
       FLG_Z_LD     : out STD_LOGIC;
       FLG_LD_SEL   : out STD_LOGIC;
       FLG_SHAD_LD  : out STD_LOGIC;
       RST          : out STD_LOGIC);
END COMPONENT;

component prog_rom
port (
  ADDRESS           : in  std_logic_vector(9 downto 0);
  INSTRUCTION       : out std_logic_vector(17 downto 0);
  CLK               : in  std_logic
);
end component prog_rom;

component ALU_MUX
port (
  DY_OUT               : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
  FROM_INSTRUCTION_REG : in  STD_LOGIC_VECTOR (7 downto 0);
  ALU_OPY_SEL          : in  STD_LOGIC;
  B                    : out STD_LOGIC_VECTOR (7 downto 0)
);
end component ALU_MUX;


COMPONENT ALU
PORT
	(
		A                 : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- A Input to the ALU
		B                 : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- B Input to the ALU
		SEL               : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- Selector
		C_IN              : IN STD_LOGIC; -- Carry In
		SUM               : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); -- Output of the Operation
		C_FLAG            : OUT STD_LOGIC; -- Carry Flag
	Z_FLAG             : OUT STD_LOGIC); -- Zero Flag

END COMPONENT;

COMPONENT REG_FILE IS
	PORT
	(
		RF_WR_DATA        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		ADRX              : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ADRY              : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		RF_WR             : IN STD_LOGIC;
		CLK               : IN STD_LOGIC;
		DX_OUT            : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		DY_OUT            : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;

component REG_MUX
port (
  FROM_IN_PORT : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
  RF_WR_SEL    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
  FROM_PC      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
  FROM_B       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
  FROM_ALU     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
  D_OUT        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end component REG_MUX;


COMPONENT pc_mux IS
		PORT (
			FROM_IMMED       : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			FROM_STACK       : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PC_MUX_SEL       : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			D_OUT            : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT program_counter IS
		PORT (
			D_IN             : IN std_logic_vector(9 DOWNTO 0);
			PC_LD            : IN std_logic;
			PC_INC           : IN std_logic;
			RST              : IN std_logic;
			CLK              : IN std_logic;
			PC_COUNT         : OUT std_logic_vector(9 DOWNTO 0)
		);
	END COMPONENT;

signal C_FLAG       : STD_LOGIC;
signal Z_FLAG       : STD_LOGIC;
signal OPCODE_HI_5  : STD_LOGIC_VECTOR (4 downto 0);
signal OPCODE_LO_2  : STD_LOGIC_VECTOR (1 downto 0);
signal I_SET        : STD_LOGIC;
signal I_CLR        : STD_LOGIC;
signal PC_LD        : STD_LOGIC;
signal PC_INC       : STD_LOGIC;
signal PC_MUX_SEL   : STD_LOGIC_VECTOR (1 downto 0);
signal ALU_OPY_SEL  : STD_LOGIC;
signal ALU_SEL      : STD_LOGIC_VECTOR (3 downto 0);
signal RF_WR        : STD_LOGIC;
signal RF_WR_SEL    : STD_LOGIC_VECTOR (1 downto 0);
signal SP_LD        : STD_LOGIC;
signal SP_INC       : STD_LOGIC;
signal SP_DECR      : STD_LOGIC;
signal SCR_WE       : STD_LOGIC;
signal SCR_ADDR_SEL : STD_LOGIC_VECTOR (1 downto 0);
signal SCR_DATA_SEL : STD_LOGIC;
signal FLG_C_SET    : STD_LOGIC;
signal FLG_C_CLR    : STD_LOGIC;
signal FLG_C_LD     : STD_LOGIC;
signal FLG_Z_LD     : STD_LOGIC;
signal FLG_LD_SEL   : STD_LOGIC;
signal FLG_SHAD_LD  : STD_LOGIC;
signal RST          : STD_LOGIC;

signal RF_WR_DATA   : STD_LOGIC_VECTOR (7 DOWNTO 0);
signal ADRX         : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal ADRY         : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal DX_OUT       : STD_LOGIC_VECTOR (7 DOWNTO 0);
signal DY_OUT       : STD_LOGIC_VECTOR (7 DOWNTO 0);

signal ADDRESS      : std_logic_vector(9 downto 0);
signal INSTRUCTION  : std_logic_vector(17 downto 0);
signal A            : STD_LOGIC_VECTOR (7 DOWNTO 0); -- A Input to the ALU
signal B            : std_logic_vector (7 downto 0); -- B Input to the ALU
--signal SEL          : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Selector
signal C_IN         : STD_LOGIC; -- Carry In
signal SUM          : STD_LOGIC_VECTOR (7 DOWNTO 0);
signal FROM_IMMED   : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal FROM_STACK   : STD_LOGIC_VECTOR(9 DOWNTO 0);
--signal D_OUT        : STD_LOGIC_VECTOR(9 DOWNTO 0);
signal D_IN         : std_logic_vector(9 DOWNTO 0);

begin

  CU                : CONTROL_UNIT
  port map (
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
    RST          => RST
  );

REG_FILE_i          : REG_FILE
port map (
  RF_WR_DATA => RF_WR_DATA,
  ADRX       => ADRX,
  ADRY       => ADRY,
  RF_WR      => RF_WR,
  CLK        => CLK,
  DX_OUT     => DX_OUT,
  DY_OUT     => DY_OUT
);

REG_MUX_i : REG_MUX
port map (
  FROM_IN_PORT => IN_PORT,
  RF_WR_SEL    => RF_WR_SEL,
  FROM_PC      => "00000000",
  FROM_B       => "00000000",
  FROM_ALU     => SUM,
  D_OUT        => RF_WR_DATA
);


prog_rom_i          : prog_rom
port map (
  ADDRESS     => ADDRESS,
  INSTRUCTION => INSTRUCTION,
  CLK         => CLK
);

ALU_MUX_i : ALU_MUX
port map (
  DY_OUT               => DY_OUT,
  FROM_INSTRUCTION_REG => INSTRUCTION(7 DOWNTO 0),
  ALU_OPY_SEL          => ALU_OPY_SEL,
  B                    => B
);


ALU_i               : ALU
PORT MAP (
A => A,
B => B,
SEL => ALU_SEL,
C_IN => C_IN,
SUM => SUM,
C_FLAG => C_FLAG,
Z_FLAG => Z_FLAG
);

PC_MUX_1 : pc_mux
	PORT MAP(
		FROM_IMMED => FROM_IMMED,
		FROM_STACK => FROM_STACK,
		PC_MUX_SEL => PC_MUX_SEL,
		D_OUT      => D_IN
	);
	PC : program_counter
	PORT MAP(
		D_IN     => D_IN,
		PC_LD    => PC_LD,
		PC_INC   => PC_INC,
		RST      => RST,
		CLK      => CLK,
		PC_COUNT => ADDRESS
	);

A <= DX_OUT;
OUT_PORT <= DX_OUT;
FROM_IMMED <= INSTRUCTION (12 DOWNTO 3);
OPCODE_HI_5 <= INSTRUCTION (17 DOWNTO 13);
OPCODE_LO_2 <= INSTRUCTION (1 DOWNTO 0);
--PC_COUNT <= ADDRESS;
ADRX <= INSTRUCTION (12 DOWNTO 8);
ADRY <= INSTRUCTION (7 DOWNTO 3);



end Behavioral;
