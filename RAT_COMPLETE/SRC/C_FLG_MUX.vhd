----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 8:
-- C_FLAG_FF.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- Modified C_FLG_MUX file that includes the data from the shadow flags.
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

entity C_FLG_MUX is
    Port ( C_IN : in STD_LOGIC;
           SHAD_C : in STD_LOGIC;
           FLG_LD_SEL : in STD_LOGIC;
           C_FLG_DATA_OUT : out STD_LOGIC);
end C_FLG_MUX;

architecture Behavioral of C_FLG_MUX is

begin

   C_FLG_DATA_OUT <= C_IN WHEN (FLG_LD_SEL = '0') ELSE
        SHAD_C WHEN (FLG_LD_SEL = '1') ELSE
        '0';



end Behavioral;
