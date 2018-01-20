----------------------------------------------------------------------------------
--
-- HW ASSIGNMENT NO. 1:
-- Digital to Analog Converter using PWM and RC Filter
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- DESCRIPTION:
-- Pulse width modulation describes a modulation technique used to
-- vary square waves. A PWM signal varies the width of the high or low of a
-- square wave without changing the frequency of the pulses.
-- This changes the signals duty cycle, varying from 0% (always low) to
-- 100% (always high). The resolution of the PWM is determined by how
-- many different duty cycles can be created from a digital value.
-- An 8-bit value can define 256 different values, signifying a 256 different
-- duty cycles from 0% (0) to 100% (255).
-- The Basys3 has a system clock of 100 MHz. The highest frequency PWM signal
-- that will allow 256 variable widths is 100 MHz / 256 = 390.625 kHz.
-- This will be the frequency for the PWM signal used in this component.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity counter is
    Port ( sw       : in STD_LOGIC_VECTOR (7 downto 0);
           sig      : out STD_LOGIC;
           RST      : in STD_LOGIC;
           CLK      : in STD_LOGIC);
end counter;

architecture Behavioral of counter is
signal tempSig      : std_logic  := '0';
begin

cntrPrcs            : process(CLK)
  variable countVar : integer := 0;
  variable swVAR    : integer;
begin
  swVAR := to_integer(unsigned(sw)); -- CAST SW TO UNSIGNED INT
  IF (rising_edge(CLK)) then
    IF (RST = '0') then
      IF (countVar <= swVAR) then --countVAR WILL BE HIGH WHEN IT IS LESS THAN
                                  -- swVAR. (128 WILL YIELD 50% DC)
        tempSig <= '1';
        countVar := countVar + 1;
      ELSIF (countVar = 256) then -- CHECK IF countVar IS AT UPPER THRESHOLD
        tempSig <= '0';
        countVar := 0;
      ELSE
        tempSig <= '0';
        countVar := countVar + 1;
      END IF;
    ELSE
        tempSig <= '0';
    END IF;
  END IF;

end process;

sig <= tempSig;


end Behavioral;
