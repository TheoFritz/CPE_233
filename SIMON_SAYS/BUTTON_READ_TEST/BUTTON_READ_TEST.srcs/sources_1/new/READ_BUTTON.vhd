----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/10/2018 11:36:15 PM
-- Design Name:
-- Module Name: READ_BUTTON - Behavioral
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

entity READ_BUTTON is
    Port ( BUTTON_STATUS, sw : in STD_LOGIC_VECTOR (3 downto 0);
           INT_LED_SET, INT_LED_CLR, INT_BTN_PRESS : in STD_LOGIC; -- FROM ARDUINO (INT_LED_SET = INTERRUPT to SET; INT_LED_CLR = INTERRUPT to CLEAR)
           INT_LED_SET_OUT, INT_LED_CLR_OUT, BTN_INT_STATUS : out STD_LOGIC; -- TO ARDUINO (INT_LED_SET_OUT = INTERRUPT TO SET; INT_LED_CLR = INTERRUPT TO CLEAR)
           seg : out std_logic_vector (7 downto 0);
           LED_STATUS, led, an : out STD_LOGIC_VECTOR (3 downto 0));
end READ_BUTTON;

architecture Behavioral of READ_BUTTON is

begin

	SEVENSEG : PROCESS (BUTTON_STATUS)
	BEGIN
		CASE BUTTON_STATUS IS
			WHEN "0000" => seg <= "11000000";
			WHEN "0001" => seg <= "11111001";
			WHEN "0010" => seg <= "10100100";
			WHEN "0011" => seg <= "10110000";
			WHEN "0100" => seg <= "10011001";
			WHEN "0101" => seg <= "10010010";
			WHEN "0110" => seg <= "10000010";
			WHEN "0111" => seg <= "11111000";
			WHEN "1000" => seg <= "10000000";
			WHEN "1001" => seg <= "10011000";
            WHEN "1010" => seg <= "10001000";
            WHEN "1011" => seg <= "10000011";
            WHEN "1100" => seg <= "10100111";
            WHEN "1101" => seg <= "10100001";
            WHEN "1110" => seg <= "10000110";
            WHEN "1111" => seg <= "10001110";
            WHEN OTHERS => seg <= "11111111";
       END CASE;


	 END PROCESS SEVENSEG;
an <= "1110";
LED_STATUS <= sw;
INT_LED_SET_OUT <= INT_LED_SET;
INT_LED_CLR_OUT <= INT_LED_CLR;
BTN_INT_STATUS <= INT_BTN_PRESS;
led <= BUTTON_STATUS;

end Behavioral;
