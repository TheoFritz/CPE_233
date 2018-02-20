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

entity CONTROL_UNIT is
    Port ( );
end CONTROL_UNIT;

architecture Behavioral of CONTROL_UNIT is

-- Three different FSM states
    type state_type is (ST_INIT, ST_READ0, ST_READ1, ST_READ2, ST_READ3);
    signal PS, NS: state_type;

--OP Code
    signal sig_opcode_7: std_logic_vector(6 downto 0);

    SIGNAL EXEC_STATE: STD_LOGIC_VECTOR(5 DOWNTO 0);


BEGIN


sync_proc: process(CLK,NS,RESET)
    begin
     IF (RISING_EDGE(CLK)) THEN
         PS <= NS;
         IF (RESET = '1') THEN
             PS <= ST_INIT;
          END IF;
      END IF;
      END PROCESS sync_proc;

COMB_PROC: PROCESS(sig_opcode_7, C_FLAG, Z_FLAG, PS, INT)


BEGIN

case column is
    when "0111" =>
        if readrow = "1000" then
            currentChar <= x"0";
        elsif readrow = "0100" then
            currentChar <= x"1";
        elsif readrow = "0010" THEN
            currentChar <= x"2";
        elsif readrow = "0001" THEN
            curretnChar <= x"3";
        end if;

    when "0111" =>
        if readrow = "1000" then
            currentChar <= x"0";
        elsif readrow = "0100" then
            currentChar <= x"1";
        elsif readrow = "0010" THEN
            currentChar <= x"2";
        elsif readrow = "0001" THEN
            curretnChar <= x"3";
        end if;
end case;

end process;




end Behavioral;
