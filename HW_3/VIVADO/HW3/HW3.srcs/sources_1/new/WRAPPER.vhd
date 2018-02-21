----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2018 12:31:49 AM
-- Design Name: 
-- Module Name: WRAPPER - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WRAPPER is
    Port ( COLUMNS : in STD_LOGIC_VECTOR (2 downto 0);
           ROWS : out STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
--           led : out STD_LOGIC_VECTOR (3 downto 0));
end WRAPPER;

architecture Behavioral of WRAPPER is

COMPONENT keypad is
    Port ( COLUMNS : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
           ROWS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           CLK : IN STD_LOGIC;
           READBUTTON : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) 
     );
END COMPONENT;

COMPONENT BCD7SEG_8 IS
    PORT (
            sw : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            btn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            seg : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
END COMPONENT;

SIGNAL BUTTONIMMET : STD_LOGIC_VECTOR (3 DOWNTO 0);
begin

keypad1: keypad
PORT MAP (
COLUMNS => COLUMNS,
ROWS => ROWS,
CLK => CLK,
READBUTTON => BUTTONIMMET
);

bcd7seg_8_1: BCD7SEG_8
PORT MAP (
sw => BUTTONIMMET,
btn => "1000",
seg => seg,
AN => an
);

--led <= BUTTONIMMET;

end Behavioral;
