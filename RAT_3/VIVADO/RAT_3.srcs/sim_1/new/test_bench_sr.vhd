----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 2:
-- TEST_BENCH.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- Test Bench for PC
--
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench_sr is

end test_bench_sr;

architecture behavior of test_bench_sr is
    COMPONENT SCRATCH_RAM IS
        PORT (
                DATA_IN  : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
                SCR_ADDR : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                SCR_WE   : IN STD_LOGIC;
                CLK      : IN STD_LOGIC;
                DATA_OUT : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
        );
    END COMPONENT;

    CONSTANT CLK_PERIOD : TIME := 10 ns;

    SIGNAL DATA_IN_TB : STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL SCR_ADDR_TB    : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL SCR_WE_TB : STD_LOGIC;
    SIGNAL CLK_TB : STD_LOGIC;
    SIGNAL DATA_OUT_TB : STD_LOGIC_VECTOR (9 DOWNTO 0);

begin

    UUT: SCRATCH_RAM PORT MAP (
        DATA_IN => DATA_IN_TB,
        SCR_ADDR => SCR_ADDR_TB,
        SCR_WE => SCR_WE_TB,
        CLK => CLK_TB,
        DATA_OUT => DATA_OUT_TB
        );

        CLK_PROCESS: PROCESS
            BEGIN
            CLK_TB <= '0';
            WAIT FOR 5 ns;
            CLK_TB <= '1';
            WAIT FOR 5 ns;
        END PROCESS;

        STIMULUS_PROCESS: PROCESS
            BEGIN

            DATA_IN_TB <= "0101011010";
            SCR_ADDR_TB <= "01110110";
            SCR_WE_TB <= '1';
            WAIT FOR 80 ns;

            DATA_IN_TB <= "0101011010";
            SCR_ADDR_TB <= "01110110";
            SCR_WE_TB <= '0';
            WAIT FOR 80 ns;

            DATA_IN_TB <= "1111111111";
            SCR_ADDR_TB <= "01011011";
            SCR_WE_TB <= '1';
            WAIT FOR 80 ns;

            DATA_IN_TB <= "1110011111";
            SCR_ADDR_TB <= "01011011";
            SCR_WE_TB <= '0';
            WAIT FOR 80 ns;

            DATA_IN_TB <= "0000000001";
            SCR_ADDR_TB <= "01011000";
            SCR_WE_TB <= '1';
            WAIT FOR 80 ns;



        END PROCESS;




end behavior;
