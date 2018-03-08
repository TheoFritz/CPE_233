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

entity Interrupt_Driver is
    Port ( INT_IN : in STD_LOGIC_VECTOR (7 downto 0);
           INT_CLEAR : in STD_LOGIC_VECTOR (7 downto 0);
           INT_EN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           INT_OUT : out STD_LOGIC;
           INT_STATUS : out STD_LOGIC_VECTOR (7 downto 0));
end Interrupt_Driver;

architecture Behavioral of Interrupt_Driver is

    component I_FLAG_DVR_FF
    port (
      I_SET     : IN  STD_LOGIC;
      I_CLR     : IN  STD_LOGIC;
      CLK       : IN  STD_LOGIC;
      I_FLG_OUT : OUT STD_LOGIC
    );
    end component I_FLAG_DVR_FF;

SIGNAL I_SET, I_FLG_OUT : STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

    I_FLAG_FF_0 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(0),
      I_CLR     => INT_CLEAR(0),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(0)
    );
    I_FLAG_FF_1 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(1),
      I_CLR     => INT_CLEAR(1),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(1)
    );
    I_FLAG_FF_2 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(2),
      I_CLR     => INT_CLEAR(2),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(2)
    );
    I_FLAG_FF_3 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(3),
      I_CLR     => INT_CLEAR(3),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(3)
    );
    I_FLAG_FF_4 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(4),
      I_CLR     => INT_CLEAR(4),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(4)
    );
    I_FLAG_FF_5 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(5),
      I_CLR     => INT_CLEAR(5),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(5)
    );
    I_FLAG_FF_6 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(6),
      I_CLR     => INT_CLEAR(6),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(6)
    );
    I_FLAG_FF_7 : I_FLAG_DVR_FF
    port map (
      I_SET     => I_SET(7),
      I_CLR     => INT_CLEAR(7),
      CLK       => CLK,
      I_FLG_OUT => I_FLG_OUT(7)
    );

I_SET <= INT_IN AND INT_EN;

INT_OUT <= I_FLG_OUT(0) OR I_FLG_OUT(1) OR I_FLG_OUT(2) OR I_FLG_OUT(3) OR I_FLG_OUT(4) OR I_FLG_OUT(5) OR I_FLG_OUT(6) OR I_FLG_OUT(7);
INT_STATUS <= I_FLG_OUT;

end Behavioral;
