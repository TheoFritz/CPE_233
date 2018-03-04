----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 7:
-- SCR_DATA_MUX.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- This program is the mux for switching the data input for the scratch ram.
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SCR_DATA_MUX is
    Port ( DX_OUT : in STD_LOGIC_VECTOR (7 DOWNTO 0); -- DATA FROM THE X LINE OF THE REG_FILE
           PC_COUNT : in STD_LOGIC_VECTOR (9 downto 0); -- OUTPUT OF THE PC COUNTER
           SCR_DATA_SEL : in STD_LOGIC; -- SELECTOR FOR THE MUX
           SCR_DATA_OUT : out STD_LOGIC_VECTOR (9 downto 0)); -- OUTPUT OF THE MUX INTO THE SCRATCH RAM
end SCR_DATA_MUX;

architecture Behavioral of SCR_DATA_MUX is

begin

   SCR_DATA_OUT <= ("00" & DX_OUT) WHEN (SCR_DATA_SEL = '0') ELSE -- TAKES DATA FROM THE REG FILE WHEN '0' IS SELECTED
        PC_COUNT WHEN (SCR_DATA_SEL = '1'); -- TAKES DATA FROM THE PC_COUNTER WHEN '1' IS SELECTED



end Behavioral;
