----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/05/2018 03:03:39 PM
-- Design Name:
-- Module Name: SPEAKER_DRIVER - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPEAKER_DRIVER is
    Port ( sw : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           speaker : out STD_LOGIC);
end SPEAKER_DRIVER;

architecture Behavioral of SPEAKER_DRIVER is
  signal tmp_clk : std_logic := '0';

begin
  speaker_driver_sound: process (clk,tmp_clk,sw)
  variable frequency : integer;
  variable period : integer;
  variable clk_div : integer;
  variable div_cnt : integer := 0;
  begin
  case sw is
  when "00000000" => frequency := (0);
  when "00000001" => frequency := (95510);
  when "00000010" => frequency := (90171);
  when "00000011" => frequency := (85106);
  when "00000100" => frequency := (80321);
  when "00000101" => frequency := (75815);
  when "00000110" => frequency := (71581);
  when "00000111" => frequency := (67567);
  when "00001000" => frequency := (63775);
  when "00001001" => frequency := (60204);
  when "00001010" => frequency := (56818);
  when "00001011" => frequency := (53619);
  when "00001100" => frequency := (50607);
  when "00001101" => frequency := (47778);
  when "00001110" => frequency := (45105);
  when "00001111" => frequency := (42571);
  when "00010000" => frequency := (40176);
  when "00010001" => frequency := (37921);
  when "00010010" => frequency := (35803);
  when "00010011" => frequency := (33783);
  when "00010100" => frequency := (31887);
  when "00010101" => frequency := (30102);
  when "00010110" => frequency := (28409);
  when "00010111" => frequency := (26816);
  when "00011000" => frequency := (25310);
  when "00011001" => frequency := (23889);
  when "00011010" => frequency := (22547);
  when "00011011" => frequency := (21281);
  when "00011100" => frequency := (20088);
  when "00011101" => frequency := (18960);
  when "00011110" => frequency := (17895);
  when "00011111" => frequency := (16891);
  when "00100000" => frequency := (15943);
  when "00100001" => frequency := (15048);
  when "00100010" => frequency := (14204);
  when "00100011" => frequency := (13406);
  when "00100100" => frequency := (12655);


  when others => frequency := (0);


  end case;

    if (rising_edge(clk)) then
       if (div_cnt >= frequency) then
          tmp_clk <= not tmp_clk;
          div_cnt := 0;
       else
          div_cnt := div_cnt + 1;
       end if;
    end if;
    speaker <= tmp_clk;
   end process speaker_driver_sound;




end Behavioral;
