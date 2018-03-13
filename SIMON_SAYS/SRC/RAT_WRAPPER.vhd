----------------------------------------------------------------------------------
-- Company:  RAT Technologies (a subdivision of Cal Poly CENG)
-- Engineer:  Various RAT rats
--
-- Create Date:    02/03/2017
-- Module Name:    RAT_wrapper - Behavioral
-- Target Devices:  Basys3
-- Description: Wrapper for RAT CPU. This model provides a template to interfaces
--    the RAT CPU to the Basys3 development board.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAT_wrapper is
    Port ( LEDS     : out   STD_LOGIC_VECTOR (7 downto 0);
           an       : out   STD_LOGIC_VECTOR (3 DOWNTO 0);
           seg      : out   STD_LOGIC_VECTOR (7 DOWNTO 0);
           BTN_STATUS : in  STD_LOGIC_VECTOR (3 downto 0);
           INT_BTN_PRESS : IN STD_LOGIC;
           LED_STATUS : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           INT_LED_SET : OUT STD_LOGIC;
           INT_LED_CLR : OUT STD_LOGIC;
           SWITCHES : in    STD_LOGIC_VECTOR (7 downto 0);
           INT      : in    STD_LOGIC;
           RST      : in    STD_LOGIC;
           CLK      : in    STD_LOGIC;
           INT_IN   : in    STD_LOGIC_VECTOR (7 DOWNTO 0));
end RAT_wrapper;

architecture Behavioral of RAT_wrapper is

   -- INPUT PORT IDS -------------------------------------------------------------
   -- Right now, the only possible inputs are the switches
   -- In future labs you can add more port IDs, and you'll have
   -- to add constants here for the mux below
   CONSTANT SWITCHES_ID : STD_LOGIC_VECTOR (7 downto 0) := X"20";
   CONSTANT RAND_ID     : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"22";
   CONSTANT BTN_STATUS_ID  : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"35";
   CONSTANT INT_BTN_PRESS_ID : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"39";



   -------------------------------------------------------------------------------

   -------------------------------------------------------------------------------
   -- OUTPUT PORT IDS ------------------------------------------------------------
   -- In future labs you can add more port IDs
   CONSTANT LEDS_ID       : STD_LOGIC_VECTOR (7 downto 0) := X"40";
   CONSTANT LED_STATUS_ID : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"41";
   CONSTANT INT_LED_SET_ID : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"37";
   CONSTANT INT_LED_CLR_ID : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"38";
   CONSTANT SEVEN_SEG     : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"81";
   -------------------------------------------------------------------------------

   -- Declare RAT_CPU ------------------------------------------------------------
   component RAT_MCU
       Port ( IN_PORT  : in  STD_LOGIC_VECTOR (7 downto 0);
              OUT_PORT : out STD_LOGIC_VECTOR (7 downto 0);
              PORT_ID  : out STD_LOGIC_VECTOR (7 downto 0);
              IO_STRB  : out STD_LOGIC;
              RESET    : in  STD_LOGIC;
              INT      : in  STD_LOGIC;
              CLK      : in  STD_LOGIC);
   end component RAT_MCU;
   -------------------------------------------------------------------------------

   component sseg_dec
   port (
     ALU_VAL  : in  std_logic_vector(7 downto 0);
     CLK      : in  std_logic;
     DISP_EN  : out std_logic_vector(3 downto 0);
     SEGMENTS : out std_logic_vector(7 downto 0)
   );
   end component sseg_dec;


    component db_1shot_FSM
    port (
      A    : in  STD_LOGIC;
      CLK  : in  STD_LOGIC;
      A_DB : out STD_LOGIC
    );
    end component db_1shot_FSM;

    component LATCH
    port (
    din : in std_logic_vector (4 downto 0);
    reset : in std_logic;
    dout: out std_logic_vector (4 downto 0);
    en : in std_logic
    );
  end component LATCH;

  component RandGen is
      Port ( Clk : in STD_LOGIC;     -- Clock to change random value, should be fast (100 MHz)
             Reset : in STD_LOGIC;   -- Reset to preset Seed value when high
             Random : out STD_LOGIC_VECTOR (7 downto 0)); -- 8 bit random binary output
  end component RandGen;

  component latch_16
  port (
    din   : in  std_logic_vector(3 downto 0);
    reset : in  std_logic;
    dout  : out std_logic_vector(3 downto 0);
    en    : in  std_logic
  );
  end component latch_16;


   -- Signals for connecting RAT_CPU to RAT_wrapper -------------------------------
   signal s_input_port  : std_logic_vector (7 downto 0);
   signal s_output_port : std_logic_vector (7 downto 0);
   signal s_port_id     : std_logic_vector (7 downto 0);
   signal s_load        : std_logic;
   signal s_clk_sig     : std_logic := '0';
   constant MAX_COUNT_50MHZ : integer := (2);     -- clock divider
   signal CLK_50MHZ : std_logic := '0';
   signal SEVEN_SEG_IM : std_logic_vector (3 downto 0);
   signal s_interrupt   : std_logic;

   -- Register definitions for output devices ------------------------------------
   -- add signals for any added outputs
   signal r_LEDS        : std_logic_vector (7 downto 0);
   signal r_SevenSeg    : std_logic_vector (7 downto 0);
   signal r_LED_Status  : std_logic_vector (7 downto 0);
   signal r_INT_LED_SET : std_logic_vector (7 downto 0);
   signal r_INT_LED_CLR : std_logic_vector (7 downto 0);
   -------------------------------------------------------------------------------


   signal RAND : std_logic_vector (7 downto 0);
   signal BTN_STATUS_LATCHED : std_logic_vector (3 downto 0);
   signal LED_INT_MASTER : std_logic;
begin

   -- Clock Divider Process ------------------------------------------------------
--   clkdiv: process(CLK)
--    begin
--        if RISING_EDGE(CLK) then
--            s_clk_sig <= NOT s_clk_sig;
--        end if;
--    end process clkdiv;
   -------------------------------------------------------------------------------


   CLK_50MHZ_PROC: process (clk)
         --variable div_cnt : integer := 0;
      begin
         if (rising_edge(clk)) then
            --if (div_cnt = MAX_COUNT_50MHZ) then
               s_clk_sig <= not s_clk_sig;
               --div_cnt := 0;
            --else
               --div_cnt := div_cnt + 1;
            --end if;
         end if;
      end process CLK_50MHZ_PROC;
      CLK_50MHZ <= s_clk_sig;




   -- Instantiate RAT_CPU --------------------------------------------------------
   CPU: RAT_MCU
   port map(  IN_PORT  => s_input_port,
              OUT_PORT => s_output_port,
              PORT_ID  => s_port_id,
              RESET    => RST,
              IO_STRB  => s_load,
              INT      => s_interrupt,
              CLK      => CLK_50MHZ);
   -------------------------------------------------------------------------------


   -- db_1shot_FSM_i : db_1shot_FSM
   --  port map (
   --    A    => INT,
   --    CLK  => CLK_50MHZ,
   --    A_DB => s_interrupt
   --  );

   randNum1: RandGen
   port map( Clk => CLK_50MHZ,
             Reset => '0',
             Random => RAND);

    sseg_dec_i : sseg_dec
    port map (
      ALU_VAL  => r_SevenSeg,
      CLK      => CLK,
      DISP_EN  => an,
      SEGMENTS => seg
    );



   -- SSEG1: BCD7SEG_8
   -- PORT MAP( seg => seg,
   --           an  => an,
   --           sw => SEVEN_SEG_IM);

   -------------------------------------------------------------------------------
   -- MUX for selecting what input to read ---------------------------------------
   -- add conditions and connections for any added PORT IDs
   -------------------------------------------------------------------------------
   inputs: process(s_port_id, SWITCHES, RAND, BTN_STATUS, BTN_STATUS_LATCHED,INT_BTN_PRESS)
   begin
      if (s_port_id = RAND_ID) THEN
         s_input_port <= RAND;
      elsif (s_port_id = BTN_STATUS_ID) THEN
         s_input_port <= "0000" & BTN_STATUS_LATCHED; --Because the BTN_STATUS needs to be a vector
     elsif (s_port_id = INT_BTN_PRESS_ID) THEN
         s_input_port <= "0000000" & INT_BTN_PRESS; --Because the LED_STATUS needs to be a vector
      elsif (s_port_id = SWITCHES_ID) then
         s_input_port <= SWITCHES;
      else
         s_input_port <= x"00";

      end if;
   end process inputs;
   -------------------------------------------------------------------------------

   -------------------------------------------------------------------------------
   -- MUX for updating output registers ------------------------------------------
   -- Register updates depend on rising clock edge and asserted load signal
   -- add conditions and connections for any added PORT IDs
   -------------------------------------------------------------------------------
   outputs: process(CLK)
   begin
      if (rising_edge(CLK)) then
         if (s_load = '1') then
            -- the register definition for the LEDS
            if (s_port_id = LEDS_ID) then
               r_LEDS <= s_output_port;
            elsif (s_port_id = SEVEN_SEG) then
               r_SevenSeg <= s_output_port;
            elsif (s_port_id = LED_STATUS_ID) THEN
               r_LED_Status <= s_output_port;
            elsif (s_port_id = INT_LED_SET_ID) then
               r_INT_LED_SET <= s_output_port;
            elsif (s_port_id = INT_LED_CLR_ID) then
               r_INT_LED_CLR <= s_output_port;
            end if;
         end if;
      end if;
   end process outputs;
   -------------------------------------------------------------------------------
   INT_LED_SET <= r_INT_LED_SET(0);
   INT_LED_CLR <= r_INT_LED_CLR(0);
   LED_INT_MASTER <= r_INT_LED_SET(0) OR r_INT_LED_CLR(0);

   LATCH_LED_STATUS_OUTPUT : latch_16
    port map (
      din   => r_LED_Status (3 DOWNTO 0),
      reset => '0',
      dout  => LED_STATUS,
      en    => LED_INT_MASTER
    );

    LATCH_BTN_STATUS_INPUT : latch_16
    port map (
      din   => BTN_STATUS,
      reset => '0',
      dout  => BTN_STATUS_LATCHED,
      en    => INT_BTN_PRESS
    );


   -- Register Interface Assignments ---------------------------------------------
   -- add all outputs that you added to this design
   LEDS <= r_LEDS;
   SEVEN_SEG_IM <= r_SevenSeg(3 DOWNTO 0);


end Behavioral;
