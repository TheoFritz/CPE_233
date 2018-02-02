----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/02/2018 08:40:52 AM
-- Design Name:
-- Module Name: ALU_TB - Behavioral
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

entity ALU_TB is

end ALU_TB;

architecture Behavioral of ALU_TB is

COMPONENT ALU IS
  Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
         B : in STD_LOGIC_VECTOR (7 downto 0);
         SEL : in STD_LOGIC_VECTOR (3 downto 0);
         C_IN : in STD_LOGIC;
         SUM : OUT STD_LOGIC_VECTOR (7 downto 0);
         C_FLAG : OUT STD_LOGIC;
         Z_FLAG : OUT STD_LOGIC);
END COMPONENT;

SIGNAL A_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL B_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL SEL_TB : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL C_IN_TB : STD_LOGIC;
SIGNAL SUM_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL C_FLAG_TB : STD_LOGIC;
SIGNAL Z_FLAG_TB : STD_LOGIC;


begin

ALU_TB_UUT: ALU PORT MAP (

  A => A_TB,
  B => B_TB,
  SEL => SEL_TB,
  C_IN => C_IN_TB,
  SUM => SUM_TB,
  C_FLAG => C_FLAG_TB,
  Z_FLAG => Z_FLAG_TB

);



end Behavioral;
