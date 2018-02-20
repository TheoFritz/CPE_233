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
     );
end KEYPAD;

architecture Behavioral of KEYPAD is

-- Three different FSM states
    type state_type is (ST_ROW_0, ST_ROW_1, ST_ROW_2, ST_ROW_3);
    signal PS, NS: state_type;


BEGIN


sync_proc: process(CLK,NS)
    begin
     IF (RISING_EDGE(CLK)) THEN
--        IF PS = ST_INIT THEN
            PS <= NS;
--        ELSE 
--           PS <= ST_INIT;    
--        END IF;
     END IF;
END PROCESS sync_proc;

COMB_PROC: PROCESS(PS,COLUMNS)


BEGIN

case PS is
    
--    when ST_INIT =>
--        NS <= ST_ROW_0;
        
    when ST_ROW_0 =>
        if COLUMNS = "001" then
            READBUTTON <= x"3";
        elsif COLUMNS = "010" then
            READBUTTON <= x"2";
        elsif COLUMNS = "100" THEN
            READBUTTON <= x"1";
        ELSE
            READBUTTON <= x"F";
        end if;
        NS <= ST_ROW_1;

    when ST_ROW_1 =>
        if COLUMNS = "001" then
            READBUTTON <= x"6";
        elsif COLUMNS = "010" then
            READBUTTON <= x"5";
        elsif COLUMNS = "100" THEN
            READBUTTON <= x"4";
        ELSE
            READBUTTON <= x"F";
        end if;
        NS <= ST_ROW_2;
        
    when ST_ROW_2 =>
        if COLUMNS = "001" then
            READBUTTON <= x"9";
        elsif COLUMNS = "010" then
            READBUTTON <= x"8";
        elsif COLUMNS = "100" THEN
            READBUTTON <= x"7";
        ELSE
            READBUTTON <= x"F";
        end if;
        NS <= ST_ROW_3;
        
    when ST_ROW_3 =>
        if COLUMNS = "001" then
            READBUTTON <= x"B";
        elsif COLUMNS = "010" then
            READBUTTON <= x"0";
        elsif COLUMNS = "100" THEN
            READBUTTON <= x"A";
        ELSE
            READBUTTON <= x"F";
        end if;
        NS <= ST_ROW_0;
   WHEN OTHERS =>
        NS <= ST_ROW_0;
                        
end case;
end process;

with PS select
   ROWS <= "1110" when ST_ROW_0,
           "1101" when ST_ROW_1,
           "1011" when ST_ROW_2,
           "0111" when ST_ROW_3,
           "0000" WHEN OTHERS;
           



end Behavioral;
