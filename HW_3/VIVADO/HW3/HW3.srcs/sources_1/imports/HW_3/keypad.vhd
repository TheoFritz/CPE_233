----------------------------------------------------------------------------------
-- HW ASSIGNMENT NO. 3:
-- Keypad Driver (keypad.vhd)
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- DESCRIPTION: This file implements the finite state machine used to check which
-- button is pressed on the keypad. It first sets each row high and the checks to see
-- if any of the columns in that row are high as a result. If one of the buttons in
-- a single column are high then a hex value is outputted. If none of the buttons in a 
-- column that is being checked is pressed then the program moves on to the next
-- state. It continues to do this until it finds the key that is pressed.
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

-- Five different FSM states
    type state_type is (ST_DETECT, ST_ROW_0, ST_ROW_1, ST_ROW_2, ST_ROW_3);
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
    
    when ST_DETECT =>         -- Initially sets the rows high in the initial state
        ROWS <= "1111";
        readButtonTemp <= x"F";  -- sets it to the hex value 'F' which is set as all the segments turned off in our seven segment file
        case (COLUMNS) is
            when "001" | "010" | "100" => -- defines each of the states
                NS <= ST_ROW_0;
            when others =>
                NS <= PS;
        end case;
        
    when ST_ROW_0 =>
        ROWS <= "0001";   -- sets the first row high     
        if COLUMNS = "001" then
            readButtonTemp <= x"1"; -- first column key is pressed
        elsif COLUMNS = "010" then
            readButtonTemp <= x"2"; -- second column key is pressed
        elsif COLUMNS = "100" THEN
            readButtonTemp <= x"3"; -- third column key is pressed
        else
            readButtonTemp <= x"F";    -- if no column key is pressed in that row it displays nothing
            NS <= ST_ROW_1; -- goes to the next state
        end if;
        

    when ST_ROW_1 =>
        ROWS <= "0010"; -- sets the second row high
        if COLUMNS = "001" then
            readButtonTemp <= x"4"; -- first column key is pressed
        elsif COLUMNS = "010" then
            readButtonTemp <= x"5"; -- second column key is pressed
        elsif COLUMNS = "100" THEN
            readButtonTemp <= x"6"; -- third column key is pressed
        else
            readButtonTemp <= x"F"; -- if no column key is pressed in that row it displays nothing
            NS <= ST_ROW_2; -- goes to the next state
        end if;
        
    when ST_ROW_2 =>
        ROWS <= "0100"; -- sets the third row high
        if COLUMNS = "001" then -- first column key is pressed
            readButtonTemp <= x"7"; 
        elsif COLUMNS = "010" then -- second column key is pressed 
            readButtonTemp <= x"8"; 
        elsif COLUMNS = "100" THEN -- third column key is pressed
            readButtonTemp <= x"9";
        else
            readButtonTemp <= x"F"; -- if no column key is pressed in that row it displays nothing
            NS <= ST_ROW_3; -- goes to the next state
        end if;
        
    when ST_ROW_3 =>
        ROWS <= "1000"; -- sets the fourth row high 
        if COLUMNS = "001" then -- first column is pressed
            readButtonTemp <= x"A";
        elsif COLUMNS = "010" then -- second column key is pressed
            readButtonTemp <= x"0";
        elsif COLUMNS = "100" THEN -- third column key is pressed
            readButtonTemp <= x"B";
        else
            readButtonTemp <= x"F"; -- if no column key is pressed in that row it displays nothing
            NS <= ST_ROW_0; -- goes to the next state
        end if;                              
                        
end case;
end process;

READBUTTON <= readButtonTemp;


end Behavioral;
