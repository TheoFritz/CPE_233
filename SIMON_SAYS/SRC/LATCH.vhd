library ieee;
use ieee.std_logic_1164.all;

entity latch_16 is

  port (
    din   : in std_logic_vector(3 downto 0);
    reset : in std_logic;
    dout  : out std_logic_vector(3 downto 0);
    en    : in std_logic);

end latch_16;

architecture Behavioral_latch of latch_16 is

begin  -- Behavioral_latch
process (din, reset, en)
begin  -- process
  if (reset = '1') then
    dout <= (others => '0');
  elsif (en = '1') then
    dout <= din;
  end if;
end process;


end Behavioral_latch;
