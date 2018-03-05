----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 8:
-- Z_FLAG_MUX.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- Modified Z_FLG_MUX file that includes the data from the shadow flags.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


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
