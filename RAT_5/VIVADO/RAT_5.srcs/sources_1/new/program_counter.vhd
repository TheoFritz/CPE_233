----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 2:
-- PROGRAM_COUNTER.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The program counter (PC) takes in a 10 bit input (D_IN) from a mux.
-- D_IN specifies where the PC starts counting.
-- Data is only loaded into the PC when PC_ID is '1'.
-- When PC_INC is a 1, the data is incremented, otherwise, the output is
-- the same as the current value in the PC and is not incremented.
-- RST resets the counter back to 0, and CLK is the timing signal that
-- all operations operate on.
-- PC_COUNT is a 10-bit output representing the current count.
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity program_counter is
  Port (
    D_IN: IN std_logic_vector(9 downto 0); -- DATA IN
    PC_LD: IN std_logic; -- PROGRAM COUNTER LOAD DATA
    PC_INC: IN std_logic; -- PROGRAM COUNTER INCREMENT DATA
    RST: IN std_logic; -- RESET
    CLK: IN std_logic; -- CLOCK
    PC_COUNT: OUT std_logic_vector(9 downto 0) -- PROGRAM COUNTER COUNT
  );
end program_counter;

architecture Behavioral of program_counter is

  SIGNAL PC_COUNT_TMP : STD_LOGIC_VECTOR (9 DOWNTO 0); -- TEMPORARY OUTPUT FOR INSIDE PROCESS STATEMENT


begin


    pc: process(CLK)
    begin

      IF (rising_edge(CLK)) THEN
        IF (RST = '0') THEN -- SYNCHRONOUS HIGH RESET
          IF (PC_LD = '1') THEN -- PC_LD TAKES PRECEDANCE OVER PC_INT
            PC_COUNT_TMP <= D_IN;
          ELSIF (PC_LD = '0') THEN
            IF (PC_INC = '1') THEN
                PC_COUNT_TMP <= std_logic_vector(unsigned(PC_COUNT_TMP) + 1);
            END IF;
          END IF;
        ELSE
          PC_COUNT_TMP <= "0000000000"; -- SET PC_COUNT_TEMP TO 0x00
        END IF;
      END IF;


    end process;

    PC_COUNT <= PC_COUNT_TMP; -- ELIMINATE STALE VALUES

end Behavioral;
