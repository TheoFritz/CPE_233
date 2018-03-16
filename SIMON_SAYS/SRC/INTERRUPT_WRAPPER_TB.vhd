----------------------------------------------------------------------------------
-- Engineer: Bridget Benson
-- Create Date: 09/21/2015 09:02:18 AM
-- Description: Template file for test benches
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--make the entity name of your simulation file the same name as the file you  wish to simulate
--with the word Sim at the end of it.  The entity is empty because a simulation file does not
--connect to anything on the board.
entity simulation is
--  Port ( );
end simulation;

architecture Behavioral of simulation is

    -- Component Declaration for the Unit Under Test (UUT) (the module you are testing)
COMPONENT RAT_wrapper_no is
        Port ( LEDS     : out   STD_LOGIC_VECTOR (7 downto 0);
               an       : out   STD_LOGIC_VECTOR (3 DOWNTO 0);
               seg      : out   STD_LOGIC_VECTOR (7 DOWNTO 0);
               BTN_STATUS : in  STD_LOGIC_VECTOR (3 downto 0);
               INT_BTN_PRESS : in STD_LOGIC;
               LED_STATUS : out STD_LOGIC_VECTOR (3 DOWNTO 0);
               INT_LED_SET : out STD_LOGIC;
               INT_LED_CLR : out STD_LOGIC;
               INT        : IN STD_LOGIC;
               SWITCHES : in    STD_LOGIC_VECTOR (7 downto 0);
               RST      : in    STD_LOGIC;
               CLK      : in    STD_LOGIC);
    end COMPONENT;



    --Signal declarions - can be the same names as the ports
    signal LEDS          : STD_LOGIC_VECTOR (7 downto 0);
    signal an            : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal seg           : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal BTN_STATUS    : STD_LOGIC_VECTOR (3 downto 0);
    signal INT_BTN_PRESS : STD_LOGIC;
    signal LED_STATUS    : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal INT_LED_SET   : STD_LOGIC;
    signal INT_LED_CLR   : STD_LOGIC;
    signal INT           : STD_LOGIC;
    signal SWITCHES      : STD_LOGIC_VECTOR (7 downto 0);
    signal RST           : STD_LOGIC;
    signal CLK           : STD_LOGIC;



	--For designs with a CLK uncomment the following
	constant CLK_period: time := 20 ns;

    begin

		-- Map the UUT's ports to the signals
        uut : RAT_wrapper
        port map (
          LEDS          => LEDS,
          an            => an,
          seg           => seg,
          BTN_STATUS    => BTN_STATUS,
          INT_BTN_PRESS => INT_BTN_PRESS,
          LED_STATUS    => LED_STATUS,
          INT_LED_SET   => INT_LED_SET,
          INT_LED_CLR   => INT_LED_CLR,
          INT           => INT,
          SWITCHES      => SWITCHES,
          RST           => RST,
          CLK           => CLK
        );



		--For designs with a CLK uncomment the following
		CLK_process : process
		begin
			CLK <= '0';
			wait for CLK_period/2;
			CLK <= '1';
			wait for CLK_period/2;
		end process;


        stim_proc: process
        begin
            -- now assign values to the input signals
			-- you should include at least 8 test cases for all labs that
			-- are representative of different inputs for your circuit
			-- if you can do an exhaustive test (like those that have only 8
			-- or 16 possible input combinations) - do an exhaustive test
            INT <= '1';
            BTN_STATUS <= "1111";
            WAIT FOR 40 ns;
            INT <= '0';
            WAIT FOR 40 ns;
            INT <= '1';
            BTN_STATUS <= "0100";
            WAIT FOR 40 ns;
            INT <= '0';
            WAIT FOR 40 ns;
            INT <= '1';
            BTN_STATUS <= "1011";               

        end process;
end Behavioral;
