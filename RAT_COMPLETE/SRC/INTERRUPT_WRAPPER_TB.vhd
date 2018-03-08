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
    component Interrupt_Driver
port (
  INT_IN     : in  STD_LOGIC_VECTOR (7 downto 0);
  INT_CLEAR  : in  STD_LOGIC_VECTOR (7 downto 0);
  INT_EN     : in  STD_LOGIC_VECTOR (7 downto 0);
  CLK        : in  STD_LOGIC;
  INT_OUT    : out STD_LOGIC;
  INT_STATUS : out STD_LOGIC_VECTOR (7 downto 0)
);
end component Interrupt_Driver;



    --Signal declarions - can be the same names as the ports
    signal INT_IN     : STD_LOGIC_VECTOR (7 downto 0);
    signal INT_CLEAR  : STD_LOGIC_VECTOR (7 downto 0);
    signal INT_EN     : STD_LOGIC_VECTOR (7 downto 0);
    signal CLK        : STD_LOGIC;
    signal INT_OUT    : STD_LOGIC;
    signal INT_STATUS : STD_LOGIC_VECTOR (7 downto 0);


	--For designs with a CLK uncomment the following
	constant CLK_period: time := 10 ns;

    begin

		-- Map the UUT's ports to the signals
        uut : Interrupt_Driver
        port map (
          INT_IN     => INT_IN,
          INT_CLEAR  => INT_CLEAR,
          INT_EN     => INT_EN,
          CLK        => CLK,
          INT_OUT    => INT_OUT,
          INT_STATUS => INT_STATUS
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
            INT_IN <= X"08";
            INT_CLEAR <= "00000000";
            INT_CLEAR(7) <= '0';
            INT_EN <= X"08";
            WAIT FOR 1000 ms;
            INT_CLEAR <= X"08";

        end process;
end Behavioral;
