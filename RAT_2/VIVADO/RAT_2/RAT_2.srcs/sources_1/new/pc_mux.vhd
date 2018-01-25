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
  FROM_IMMED: IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- Branch and Call instructions obtain the new value of the PC from the immediate value included as part of the individual instruction formats.
  FROM_STACK: IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- Return instructions (return from subroutine) obtain the new PC value from the stack.
  PC_MUX_SEL: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Interrupts (when they are acted upon) set the PC to the interrupt vector: 0x3FF. 
  D_OUT: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) -- The output of the mux
  );
end pc_mux;

architecture Behavioral of pc_mux is

begin


D_OUT <= FROM_IMMED when (PC_MUX_SEL = "00") else -- when select is "00" FROM_IMMED goes to D_Out
        FROM_STACK when (PC_MUX_SEL = "01") else -- when select is "01" FROM_STACK goes to D_Out
        "1111111111" when (PC_MUX_SEL = "10") else -- when select is "10" "1111111111" goes to D_Out
        "0000000000"; -- catch all when select is "11" "0000000000" goes to D_Out
        



end Behavioral;
