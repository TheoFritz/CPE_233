----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/09/2018 11:50:03 AM
-- Design Name:
-- Module Name: CONTROL_UNIT - Behavioral
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

entity KEYPAD is
    Port ( COLUMNS : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
           ROWS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
           CLK : IN STD_LOGIC;
           READBUTTON : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
--           led : out STD_LOGIC_VECTOR (3 DOWNTO 0) 
     );
end KEYPAD;

architecture Behavioral of KEYPAD is

-- Three different FSM states
    type state_type is (ST_DETECT,ST_ROW_0, ST_ROW_1, ST_ROW_2, ST_ROW_3);
    signal PS : state_type := ST_DETECT;
    signal NS : state_type;

    SIGNAL CLK_12KHZ : STD_LOGIC := '0';
    constant MAX_COUNT_12KHZ : integer := (8333);     -- clock divider 
    signal readButtonTemp: std_logic_vector (3 downto 0);

BEGIN


sync_proc: process(CLK_12KHZ)
    begin
     IF (RISING_EDGE(CLK_12KHZ)) THEN
            PS <= NS;
     END IF;
END PROCESS sync_proc;

CLK_DIV: PROCESS(CLK)
variable div_cnt : integer := 0;   
   begin
      if (rising_edge(clk)) then
         div_cnt := div_cnt +1;   
         if (div_cnt = MAX_COUNT_12KHZ) then 
            CLK_12KHZ <= not CLK_12KHZ; 
            div_cnt := 0;
         end if; 
      end if; 

END PROCESS;

COMB_PROC: PROCESS(PS,COLUMNS)


BEGIN

case PS is
    
    when ST_DETECT =>
        ROWS <= "1111";
        readButtonTemp <= x"F";
        case (COLUMNS) is
            when "001" | "010" | "100" =>
                NS <= ST_ROW_0;
            when others =>
                NS <= PS;
        end case;
        
    when ST_ROW_0 =>
        ROWS <= "0001";        
        if COLUMNS = "001" then
            readButtonTemp <= x"1";
        elsif COLUMNS = "010" then
            readButtonTemp <= x"2";
        elsif COLUMNS = "100" THEN
            readButtonTemp <= x"3";
        else
            readButtonTemp <= x"F";    
            NS <= ST_ROW_1;
        end if;
        

    when ST_ROW_1 =>
        ROWS <= "0010";
        if COLUMNS = "001" then
            readButtonTemp <= x"4";
        elsif COLUMNS = "010" then
            readButtonTemp <= x"5";
        elsif COLUMNS = "100" THEN
            readButtonTemp <= x"6";
        else
            readButtonTemp <= x"F";    
            NS <= ST_ROW_2;
        end if;
        
    when ST_ROW_2 =>
        ROWS <= "0100";
        if COLUMNS = "001" then
            readButtonTemp <= x"7";
        elsif COLUMNS = "010" then
            readButtonTemp <= x"8";
        elsif COLUMNS = "100" THEN
            readButtonTemp <= x"9";
        else
            readButtonTemp <= x"F";
            NS <= ST_ROW_3;
        end if;
        
    when ST_ROW_3 =>
        ROWS <= "1000";
        if COLUMNS = "001" then
            readButtonTemp <= x"A";
        elsif COLUMNS = "010" then
            readButtonTemp <= x"0";
        elsif COLUMNS = "100" THEN
            readButtonTemp <= x"B";
        else
            readButtonTemp <= x"F";
            NS <= ST_ROW_0;
        end if;                              
                        
end case;
end process;

--led <= readButtonTemp;
READBUTTON <= readButtonTemp;


end Behavioral;
