----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 8:
-- INTERRUPT_DRIVER.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- CONTROLS THE INTERRUPTS FOR THE SYSTEM (TOTAL OF 8)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Interrupt_Driver is
    Port ( INT_IN : in STD_LOGIC_VECTOR (7 downto 0);
           INT_CLEAR : in STD_LOGIC_VECTOR (7 downto 0);
           INT_EN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           INT_OUT : out STD_LOGIC;
           INT_STATUS : out STD_LOGIC_VECTOR (7 downto 0));
end Interrupt_Driver;

architecture Behavioral of Interrupt_Driver is


signal    s_I_SET : STD_LOGIC_VECTOR (7 downto 0);
signal    s_OUTPUT : STD_LOGIC_VECTOR (7 downto 0);

begin

process (s_I_SET,CLK, INT_CLEAR)
begin
if (rising_edge(CLK)) then
    s_OUTPUT <= s_I_SET and (not INT_CLEAR);
end if;
end process;



 s_I_SET <= INT_IN AND INT_EN;

 INT_OUT <= '0' when s_OUTPUT = X"00" else '1';
 INT_STATUS <= s_OUTPUT;



end Behavioral;
