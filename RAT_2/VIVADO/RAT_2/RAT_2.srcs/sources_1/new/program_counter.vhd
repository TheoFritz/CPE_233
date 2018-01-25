----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 01/23/2018 10:46:34 PM
-- Design Name:
-- Module Name: program_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity program_counter is
  Port (
    D_IN: IN std_logic_vector(9 downto 0);
    PC_LD: IN std_logic;
    PC_INC: IN std_logic;
    RST: IN std_logic;
    CLK: IN std_logic;
    PC_COUNT: OUT std_logic_vector(9 downto 0)
  );
end program_counter;

architecture Behavioral of program_counter is

  SIGNAL PC_COUNT_TMP : STD_LOGIC_VECTOR (9 DOWNTO 0);


begin


    pc: process(CLK)
    -- variable CNT: integer := 0;
    begin

      IF (rising_edge(CLK)) THEN
        IF (RST = '0') THEN
          IF (PC_LD = '1') THEN
            PC_COUNT_TMP <= D_IN;
          ELSIF (PC_LD = '0') THEN
            IF (PC_INC = '1') THEN
                PC_COUNT_TMP <= std_logic_vector(unsigned(PC_COUNT_TMP) + 1);
            END IF;
          END IF;
        ELSE
          PC_COUNT_TMP <= "0000000000";
        END IF;
      END IF;


    end process;

    PC_COUNT <= PC_COUNT_TMP;

end Behavioral;
