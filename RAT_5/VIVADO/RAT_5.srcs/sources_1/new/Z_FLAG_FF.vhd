----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2018 10:30:03 PM
-- Design Name: 
-- Module Name: Z_FLAG_FF - Behavioral
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

entity Z_FLAG_FF is
    Port ( Z : in STD_LOGIC;
           FLG_Z_LD : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Z_FLAG : out STD_LOGIC);
end Z_FLAG_FF;

architecture Behavioral of Z_FLAG_FF is

begin


end Behavioral;
