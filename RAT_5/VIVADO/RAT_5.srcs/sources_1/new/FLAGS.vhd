----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/10/2018 06:58:00 PM
-- Design Name:
-- Module Name: FLAGS - Behavioral
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

entity FLAGS is
    Port ( FLG_C_SET : in STD_LOGIC;
           FLG_C_CLR : in STD_LOGIC;
           C : in STD_LOGIC;
           Z : in STD_LOGIC;
           FLG_C_LD : in STD_LOGIC;
           FLG_Z_LD : in STD_LOGIC;
           FLG_LD_SEL : in STD_LOGIC;
           FLG_SHAD_LD : in STD_LOGIC;
           C_FLAG : out STD_LOGIC;
           Z_FLAG : out STD_LOGIC;
           CLK : in STD_LOGIC);
end FLAGS;

architecture Behavioral of FLAGS is

  component C_FLAG_FF
  port (
    C         : in  STD_LOGIC;
    FLG_C_LD  : in  STD_LOGIC;
    FLG_C_SET : in  STD_LOGIC;
    FLG_C_CLR : in  STD_LOGIC;
    CLK       : in  STD_LOGIC;
    C_FLAG    : OUT STD_LOGIC
  );
  end component C_FLAG_FF;
  component Z_FLAG_FF
  port (
    Z        : in  STD_LOGIC;
    FLG_Z_LD : in  STD_LOGIC;
    CLK      : in  STD_LOGIC;
    Z_FLAG   : out STD_LOGIC
  );
  end component Z_FLAG_FF;


begin

  C_FLAG_FF_i : C_FLAG_FF
  port map (
    C         => C,
    FLG_C_LD  => FLG_C_LD,
    FLG_C_SET => FLG_C_SET,
    FLG_C_CLR => FLG_C_CLR,
    CLK       => CLK,
    C_FLAG    => C_FLAG
  );

  Z_FLAG_FF_i : Z_FLAG_FF
  port map (
    Z        => Z,
    FLG_Z_LD => FLG_Z_LD,
    CLK      => CLK,
    Z_FLAG   => Z_FLAG
  );




end Behavioral;
