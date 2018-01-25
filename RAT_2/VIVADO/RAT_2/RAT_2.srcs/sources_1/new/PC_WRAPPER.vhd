----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 01/24/2018 07:29:03 PM
-- Design Name:
-- Module Name: PC_WRAPPER - Behavioral
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

entity PC_WRAPPER is
    Port ( RST        : in STD_LOGIC;
           INC        : in STD_LOGIC;
           LD         : in STD_LOGIC;
           CLK        : in STD_LOGIC;
           FROM_IMMED : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
           FROM_STACK : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
           PC_MUX_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
           IR         : OUT STD_LOGIC_VECTOR(17 DOWNTO 0));
end PC_WRAPPER;

architecture Behavioral of PC_WRAPPER is

component pc_mux is
    Port (
  FROM_IMMED          : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  FROM_STACK          : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  PC_MUX_SEL          : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  D_OUT               : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
  );

end component;

component program_counter is
    Port (
        D_IN          : IN std_logic_vector(9 downto 0);
        PC_LD         : IN std_logic;
        PC_INC        : IN std_logic;
        RST           : IN std_logic;
        CLK           : IN std_logic;
        PC_COUNT      : OUT std_logic_vector(9 downto 0)
        );
end component;

component prog_rom is
  Port (
    ADDRESS           : in std_logic_vector(9 downto 0);
    INSTRUCTION       : out std_logic_vector(17 downto 0);
    CLK               : in std_logic
  );
end component;

SIGNAL D_IN, ADDR     : STD_LOGIC_VECTOR(9 DOWNTO 0);

begin

mux1                  : pc_mux
port map (
    FROM_IMMED => FROM_IMMED,
    FROM_STACK => FROM_STACK,
    PC_MUX_SEL => PC_MUX_SEL,
    D_OUT => D_IN
);

PC                    : program_counter
port map (
    D_IN => D_IN,
    PC_LD => LD,
    PC_INC => INC,
    RST => RST,
    CLK => CLK,
    PC_COUNT => ADDR
    );

ROM                   : prog_rom
port map (
  ADDRESS => ADDR,
  INSTRUCTION => IR,
  CLK => CLK
);


end Behavioral;
