----------------------------------------------------------------------------------
-- Company:
-- Engineer: Dominic Gaiero and Elizabeth Davis
--
-- Create Date: 10/11/2017 03:45:05 PM
-- Design Name:
-- Module Name: BCD7SEG - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BCD7SEG_8 IS
	PORT (
		sw : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		btn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		seg : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END BCD7SEG_8;
ARCHITECTURE Behavioral OF BCD7SEG_8 IS

BEGIN
	SEVENSEG : PROCESS (BTN, sw)
	BEGIN
		IF BTN = "-000" THEN
			an <= "1110";
		ELSIF BTN = "-001" THEN
			an <= "1101";
		ELSIF BTN = "-010" THEN
			an <= "1011";
		ELSIF BTN = "-011" THEN
			an <= "0111";
		ELSE
			an <= "1111";
		END IF;
		CASE sw IS
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
			WHEN OTHERS => seg <= "11111111";
		END CASE;
		IF BTN = "1---" then
		 CASE sw IS
			 WHEN "1010" => seg <= "10001000";
			 WHEN "1011" => seg <= "10000011";
			 WHEN "1100" => seg <= "10100111";
			 WHEN "1101" => seg <= "10100001";
			 WHEN "1110" => seg <= "10000110";
			 WHEN "1111" => seg <= "10001110";
			 WHEN OTHERS => seg <= "11111111";
			 END CASE;
		 END IF;
 
 
	 END PROCESS SEVENSEG;
 END Behavioral;