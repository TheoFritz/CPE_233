----------------------------------------------------------------------------------
--
-- HARDWARE NO. 4:
-- INTERRUPT_DRIVER.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- CREATES A MODULE TO HANDLE MORE THAN THE SINGLE INTERRUPT THAT THE RAT MCU CAN NORMALLY
-- HANDLE.
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

entity Interrupt_Driver is
    Port ( INT_IN : in STD_LOGIC_VECTOR (7 downto 0);
           INT_CLEAR : in STD_LOGIC_VECTOR (7 downto 0);
           INT_EN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           INT_OUT : out STD_LOGIC;
           INT_STATUS : out STD_LOGIC_VECTOR (7 downto 0));
end Interrupt_Driver;

architecture Behavioral of Interrupt_Driver is

begin


end Behavioral;
