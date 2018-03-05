----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 8:
-- INTERRUPT_WRAPPER.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- WRAPS INTERRUPT FLAGS
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY INTURREPT_WRAPPER IS
    PORT (
    INT : IN STD_LOGIC;
    I_SET : IN STD_LOGIC;
    I_CLR : IN STD_LOGIC;
    CLK: IN STD_LOGIC;
    I_OUT: OUT STD_LOGIC
    );
END INTURREPT_WRAPPER;

ARCHITECTURE Behavioral OF INTURREPT_WRAPPER IS

component I_FLAG_FF
port (
  I_SET     : IN  STD_LOGIC;
  I_CLR     : IN  STD_LOGIC;
  CLK       : IN  STD_LOGIC;
  I_FLG_OUT : OUT STD_LOGIC
);
end component I_FLAG_FF;

SIGNAL I_FLG_OUT : STD_LOGIC;

BEGIN

I_FLAG_FF_i : I_FLAG_FF
port map (
  I_SET     => I_SET,
  I_CLR     => I_CLR,
  CLK       => CLK,
  I_FLG_OUT => I_FLG_OUT
);

I_OUT <= INT AND I_FLG_OUT;

END Behavioral;
