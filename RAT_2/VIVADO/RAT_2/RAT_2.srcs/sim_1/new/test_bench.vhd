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

entity test_bench is

end test_bench;

architecture behavior of test_bench is
    COMPONENT PC_WRAPPER IS
        PORT (
                   RST        : in STD_LOGIC;
                   INC        : in STD_LOGIC;
                   LD         : in STD_LOGIC;
                   CLK        : in STD_LOGIC;
                   FROM_IMMED : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
                   FROM_STACK : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
                   PC_MUX_SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
                   IR         : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;

    CONSTANT CLK_PERIOD : TIME := 10ns;

    SIGNAL RST_TB : STD_LOGIC;
    SIGNAL INC_TB    : STD_LOGIC;
    SIGNAL LD_TB : STD_LOGIC;
    SIGNAL CLK_TB : STD_LOGIC;
    SIGNAL FROM_IMMED_TB : STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL FROM_STACK_TB : STD_LOGIC_VECTOR (9 DOWNTO 0);
    SIGNAL PC_MUX_SEL_TB : STD_LOGIC_VECTOR (1 DOWNTO 0);

begin

    UUT: PC_WRAPPER PORT MAP (
        RST => RST_TB,
        INC => INC_TB,
        LD => LD_TB,
        CLK => CLK_TB,
        FROM_IMMED => FROM_IMMED_TB,
        FROM_STACK => FROM_STACK_TB,
        PC_MUX_SEL => PC_MUX_SEL_TB
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

            ----------------------------------------------------------------------------------
            -- VERIFY IF MUX "00" WORKS
            ----------------------------------------------------------------------------------
            FROM_IMMED_TB <= "0001000000";
            PC_MUX_SEL_TB <= "00";
            RST_TB <= '0';
            INC_TB <= '1';
            LD_TB <= '0';
wait;



        END PROCESS;




end behavior;
