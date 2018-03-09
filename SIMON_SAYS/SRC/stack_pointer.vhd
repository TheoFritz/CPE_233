----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 2:
-- STACK_POINTER.VHD
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


entity stack_pointer is
  Port (
    SP_D_IN: IN std_logic_vector(7 downto 0); -- DATA IN
    SP_LD: IN std_logic; -- STACK POINTER LOAD DATA
    SP_INC: IN std_logic; -- STACK POINTER INCREMENT DATA
    SP_DECR: IN std_logic; -- STACK POINTER INCREMENT DATA
    RST: IN std_logic; -- RESET
    CLK: IN std_logic; -- CLOCK
    SP_D_OUT: OUT std_logic_vector(7 downto 0) -- STACK POINTER DATA OUT
  );
end stack_pointer;

architecture Behavioral of stack_pointer is

  SIGNAL SP_COUNT_TMP : STD_LOGIC_VECTOR (7 DOWNTO 0); -- TEMPORARY OUTPUT FOR INSIDE PROCESS STATEMENT


begin


    pc: process(RST, CLK, SP_LD, SP_INC, SP_DECR)
    begin

    IF (rising_edge(CLK)) THEN
          IF (RST = '1') THEN -- SYNCHRONOUS HIGH RESET
            SP_COUNT_TMP <= X"00"; -- SET PC_COUNT_TEMP TO 0x00
          ELSIF (SP_LD = '1') THEN -- PC_LD TAKES PRECEDANCE OVER PC_INT
            SP_COUNT_TMP <= SP_D_IN;
          ELSIF (SP_INC = '1') THEN
            SP_COUNT_TMP <= std_logic_vector(unsigned(SP_COUNT_TMP) + 1);
          ELSIF (SP_DECR = '1') THEN
            SP_COUNT_TMP <= std_logic_vector(unsigned(SP_COUNT_TMP) - 1);
          ELSE
            SP_COUNT_TMP <= SP_COUNT_TMP;
          END IF;
          end if;


    end process;

    SP_D_OUT <= SP_COUNT_TMP; -- ELIMINATE STALE VALUES

end Behavioral;
