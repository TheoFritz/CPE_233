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

entity ALU_MUX is
    Port ( DY_OUT : in STD_LOGIC_VECTOR (7 DOWNTO 0);
           FROM_INSTRUCTION_REG : in STD_LOGIC_VECTOR (7 downto 0);
           ALU_OPY_SEL : in STD_LOGIC;
           B : out STD_LOGIC_VECTOR (7 downto 0));
end ALU_MUX;

architecture Behavioral of ALU_MUX is

begin

   B <= DY_OUT WHEN (ALU_OPY_SEL = '0') ELSE
        FROM_INSTRUCTION_REG WHEN (ALU_OPY_SEL = '1');
        


end Behavioral;
