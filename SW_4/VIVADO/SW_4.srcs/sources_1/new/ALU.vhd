----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/01/2018 05:24:34 PM
-- Design Name:
-- Module Name: ALU - Behavioral
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


entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (3 downto 0);
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC_VECTOR (7 downto 0);
           C_FLAG : out STD_LOGIC;
           Z_FLAG : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
  signal temp_result: STD_LOGIC_VECTOR (8 downto 0);
begin

  process (A,B,C_IN)
    begin
      case SEL is
        WHEN "0000" => temp_result <= ('0' & A) + B; --ADD
        WHEN "0001" => temp_result <= '0' & (A + B + C_IN);--ADDC
        WHEN "0010" => temp_result <= ('0' & A) - B;--SUB
        WHEN "0011" => temp_result <= '0' & (A - B - C_IN); --SUBC
        WHEN "0100" => temp_result <= ('0' & A) - B; --CMP
        WHEN "0101" => temp_result <= ('0' & (A AND B)); --AND
        WHEN "0110" => temp_result <= ('0' & (A OR B)); --OR
        WHEN "0111" => temp_result <= ('0' & (A XOR B)); --EXOR
        WHEN "1000" => temp_result <= '0' & (A AND B); --TEST
        WHEN "1001" => temp_result <= A(7) & A(6 downto 0) & C_IN; --LSL
        WHEN "1010" => temp_result <= '0' & C_IN & A(7 downto 1); --LSR
        WHEN "1011" => temp_result <= C_IN & A(6 downto 0) & A(7); --ROL
        WHEN "1100" => temp_result <= A(0) & A (7 downto 1) & C_IN; --ROR
        WHEN "1101" => temp_result <= A(0) & A (7 downto 0); --ASR
        WHEN "1110" => temp_result <= '0' & B; --MOV
        WHEN others => temp_result <= "000000000"; --UNUSED


      END case;
  END process;

SUM <= temp_result (7 downto 0);
C_FLAG <= temp_result(8);

process (temp_result)
  begin
    if temp_result = "000000000" then
      Z_FLAG <= '1';
    else
      Z_FLAG <= '0';
  END IF;
end process;

end Behavioral;
