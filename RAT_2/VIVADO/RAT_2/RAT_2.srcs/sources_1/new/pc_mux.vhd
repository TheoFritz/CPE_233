----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2018 11:40:44 PM
-- Design Name: 
-- Module Name: pc_mux - Behavioral
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

entity pc_mux is
  Port (
  FROM_IMMED: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  FROM_STACK: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  PC_MUX_SEL: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  D_OUT: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) 
  );
end pc_mux;

architecture Behavioral of pc_mux is

begin


D_OUT <= FROM_IMMED when (PC_MUX_SEL = "00") else
        FROM_STACK when (PC_MUX_SEL = "01") else
        "1111111111" when (PC_MUX_SEL = "10") else
        "0000000000";
        



end Behavioral;
