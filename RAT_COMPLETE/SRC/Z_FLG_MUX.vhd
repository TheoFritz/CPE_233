----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/09/2018 08:48:12 PM
-- Design Name:
-- Module Name: ALU_MUX - Behavioral
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

entity Z_FLG_MUX is
    Port ( Z_IN : in STD_LOGIC;
           SHAD_Z : in STD_LOGIC;
           FLG_LD_SEL : in STD_LOGIC;
           Z_FLG_DATA_OUT : out STD_LOGIC);
end Z_FLG_MUX;

architecture Behavioral of Z_FLG_MUX is

begin

   Z_FLG_DATA_OUT <= Z_IN WHEN (FLG_LD_SEL = '0') ELSE
        SHAD_Z WHEN (FLG_LD_SEL = '1') ELSE
        '0';



end Behavioral;
