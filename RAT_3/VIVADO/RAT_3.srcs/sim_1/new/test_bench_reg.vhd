----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 2:
-- TEST_BENCH_REG.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- Test Bench for REGISTER FILE
--
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench_reg is

end test_bench_reg;

architecture behavior of test_bench_reg is
COMPONENT REG_FILE is
    Port ( RF_WR_DATA : in STD_LOGIC_VECTOR (7 downto 0);
           ADRX       : in STD_LOGIC_VECTOR (4 downto 0);
           ADRY       : in STD_LOGIC_VECTOR (4 downto 0);
           RF_WR      : in STD_LOGIC;
           CLK        : in STD_LOGIC;
           DX_OUT     : out STD_LOGIC_VECTOR (7 downto 0);
           DY_OUT     : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

    CONSTANT CLK_PERIOD : TIME := 10ns;

    SIGNAL RF_WR_DATA_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL ADRX_TB       : STD_LOGIC_VECTOR (4 downto 0);
    SIGNAL ADRY_TB       : STD_LOGIC_VECTOR (4 downto 0);
    SIGNAL RF_WR_TB      : STD_LOGIC;
    SIGNAL CLK_TB        : STD_LOGIC;
    SIGNAL DX_OUT_TB     : STD_LOGIC_VECTOR (7 downto 0);
    SIGNAL DY_OUT_TB     : STD_LOGIC_VECTOR (7 downto 0);

begin

    UUT: REG_FILE PORT MAP (
        RF_WR_DATA => RF_WR_DATA_TB,
        ADRX => ADRX_TB,
        ADRY => ADRY_TB,
        RF_WR => RF_WR_TB,
        CLK => CLK_TB,
        DX_OUT => DX_OUT_TB,
        DY_OUT => DY_OUT_TB
        );

        CLK_PROCESS: PROCESS
            BEGIN
            CLK_TB <= '0';
            WAIT FOR 5ns;
            CLK_TB <= '1';
            WAIT FOR 5ns;
        END PROCESS;

        STIMULUS_PROCESS: PROCESS
            BEGIN

        RF_WR_DATA_TB <= "10100101";
        ADRX_TB <= "11001";
        ADRY_TB <= "00110";
        RF_WR_TB <= '0';
        WAIT FOR 80ns;

        RF_WR_DATA_TB <= "11001100";
        ADRX_TB <= "10101";
        ADRY_TB <= "11010";
        RF_WR_TB <= '1';
        WAIT FOR 80ns;

        RF_WR_DATA_TB <= "11010010";
        ADRX_TB <= "11101";
        ADRY_TB <= "00011";
        RF_WR_TB <= '1';
        WAIT FOR 80ns;

        RF_WR_DATA_TB <= "11011000";
        ADRX_TB <= "01010";
        ADRY_TB <= "00110";
        RF_WR_TB <= '1';
        WAIT FOR 80ns;

        RF_WR_DATA_TB <= "11110111";
        ADRX_TB <= "01101";
        ADRY_TB <= "10110";
        RF_WR_TB <= '1';
        WAIT FOR 80ns;

        RF_WR_DATA_TB <= "11011011";
        ADRX_TB <= "10000";
        ADRY_TB <= "00001";
        RF_WR_TB <= '1';
        WAIT FOR 80ns;

        RF_WR_DATA_TB <= "11011011";
        ADRX_TB <= "01011";
        ADRY_TB <= "10000";
        RF_WR_TB <= '1';
        WAIT FOR 80ns;

        END PROCESS;




end behavior;
