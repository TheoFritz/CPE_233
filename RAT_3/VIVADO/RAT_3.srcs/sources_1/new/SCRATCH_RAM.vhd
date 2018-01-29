----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 01/28/2018 01:01:49 PM
-- Design Name:
-- Module Name: SCRATCH_RAM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SCRATCH_RAM is
    Port ( DATA_IN : in STD_LOGIC_VECTOR (9 downto 0);
           SCR_ADDR : in STD_LOGIC_VECTOR (7 downto 0);
           SCR_WE : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (9 downto 0));
end SCRATCH_RAM;

architecture Behavioral of SCRATCH_RAM is

    Type Vector_array is Array(0 to 255) of STD_LOGIC_VECTOR (9 DOWNTO 0);
    signal memoryModule: Vector_array := (others => (others => '0'));



begin

  RAM: process(CLK)
  begin
    IF (rising_edge(CLK)) then
      IF (SCR_WE = '1') then
        memoryModule(to_integer(unsigned(SCR_ADDR))) <= DATA_IN;
      END IF;
    END IF;
  end process;

  DATA_OUT <= memoryModule(to_integer(unsigned(SCR_ADDR)));


end Behavioral;
