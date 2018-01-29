----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 01/28/2018 01:01:49 PM
-- Design Name:
-- Module Name: REG_FILE - Behavioral
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

entity REG_FILE is
    Port ( RF_WR_DATA : in STD_LOGIC_VECTOR (7 downto 0);
           ADRX       : in STD_LOGIC_VECTOR (4 downto 0);
           ADRY       : in STD_LOGIC_VECTOR (4 downto 0);
           RF_WR      : in STD_LOGIC;
           CLK        : in STD_LOGIC;
           DX_OUT     : out STD_LOGIC_VECTOR (7 downto 0);
           DY_OUT     : out STD_LOGIC_VECTOR (7 downto 0));
end REG_FILE;

architecture Behavioral of REG_FILE is

    Type Vector_array is Array(0 to 31) of STD_LOGIC_VECTOR (7 DOWNTO 0);


   signal memoryModule: Vector_array := (x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
                                         x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
                                         x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
                                         x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00");
begin




RAM_WRITE: Process(CLK, RF_WR)
begin
   If(Rising_Edge(CLK)) THEN
      If (RF_WR = '1') THEN
         memoryModule(to_integer(unsigned(ADRX))) <= RF_WR_DATA;
      End if;
  End if;
End Process;

DX_OUT <= memoryModule(to_integer(unsigned(ADRX)));
DY_OUT <= memoryModule(to_integer(unsigned(ADRY)));

end Behavioral;
