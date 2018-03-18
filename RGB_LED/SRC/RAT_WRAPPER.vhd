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
           RED      : OUT   STD_LOGIC;
           GREEN    : OUT   STD_LOGIC;
           BLUE     : OUT   STD_LOGIC;
           SWITCHES : in    STD_LOGIC_VECTOR (7 downto 0);
           BUTTON   : IN    STD_LOGIC;
--           INT      : in    STD_LOGIC;
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
   CONSTANT BUTTON_ID : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"22";
--   CONSTANT INT_STATUS  : STD_LOGIC_VECTOR (7 downto 0) := X"AA";
--   CONSTANT INT_EN        : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"AE";
   -------------------------------------------------------------------------------

   -------------------------------------------------------------------------------
   -- OUTPUT PORT IDS ------------------------------------------------------------
   -- In future labs you can add more port IDs
   CONSTANT LEDS_ID       : STD_LOGIC_VECTOR (7 downto 0) := X"40";
   CONSTANT SEVEN_SEG_ID     : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"81";
   CONSTANT RED_ID           : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"52";
   CONSTANT GREEN_ID         : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"53";
   CONSTANT BLUE_ID          : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"54";
--   CONSTANT INT_CLR       : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"AC";
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

    component Interrupt_Driver is
        Port ( INT_IN : in STD_LOGIC_VECTOR (7 downto 0);
               INT_CLEAR : in STD_LOGIC_VECTOR (7 downto 0);
               INT_EN : in STD_LOGIC_VECTOR (7 downto 0);
               CLK : in STD_LOGIC;
               INT_OUT : out STD_LOGIC;
               INT_STATUS : out STD_LOGIC_VECTOR (7 downto 0));
    end component Interrupt_Driver;

    component PWM is
        Port ( sw       : in STD_LOGIC_VECTOR (7 downto 0);
           sig      : out STD_LOGIC;
           RST      : in STD_LOGIC;
           CLK      : in STD_LOGIC
           );
    end component PWM;



   -- Signals for connecting RAT_CPU to RAT_wrapper -------------------------------
   signal s_input_port  : std_logic_vector (7 downto 0);
   signal s_output_port : std_logic_vector (7 downto 0);
   signal s_port_id     : std_logic_vector (7 downto 0);
   signal s_load        : std_logic;
   signal s_clk_sig     : std_logic := '0';
   constant MAX_COUNT_50MHZ : integer := (2);     -- clock divider
   signal CLK_50MHZ : std_logic := '0';
   signal SEVEN_SEG_IM : std_logic_vector (3 downto 0);
   signal s_interrupt, s_BUTTON   : std_logic;

   signal INTERRUPT_STATUS : std_logic_vector (7 downto 0);

   -- Register definitions for output devices ------------------------------------
   -- add signals for any added outputs
   signal r_LEDS        : std_logic_vector (7 downto 0);
   signal r_SevenSeg    : std_logic_vector (7 downto 0);
   signal r_red       : std_logic_vector (7 downto 0 );
   signal r_green     : std_logic_vector (7 downto 0);
   signal r_blue      : std_logic_vector (7 downto 0);
   signal r_INT_EN    : std_logic_vector (7 downto 0);
   signal r_INT_CLR    : std_logic_vector (7 downto 0);
   -------------------------------------------------------------------------------

begin

   -- Clock Divider Process ------------------------------------------------------
  -- clkdiv: process(CLK)
  --  begin
  --      if RISING_EDGE(CLK) then
  --          s_clk_sig <= NOT s_clk_sig;
  --      end if;
  --  end process clkdiv;
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


   db_1shot_FSM_i : db_1shot_FSM
    port map (
      A    => BUTTON,
      CLK  => CLK_50MHZ,
      A_DB => s_BUTTON
    );

    s_interrupt <= s_BUTTON;


    sseg_dec_i : sseg_dec
    port map (
      ALU_VAL  => r_SevenSeg,
      CLK      => CLK,
      DISP_EN  => an,
      SEGMENTS => seg
    );

    int_dvr_i : Interrupt_Driver
    port map (
        INT_IN => INT_IN,
        INT_CLEAR => r_INT_CLR,
        INT_EN => r_INT_EN,
        CLK => CLK_50MHZ,
        INT_OUT => s_interrupt,
        INT_STATUS => INTERRUPT_STATUS
    );

    pwm_red : PWM
    port map (
        sw => r_red,
        sig => RED,
        RST => RST,
        CLK => CLK
    );

    pwm_green : PWM
    port map (
        sw => r_green,
        sig => GREEN,
        RST => RST,
        CLK => CLK
    );

    pwm_blue : PWM
    port map (
        sw => r_blue,
        sig => BLUE,
        RST => RST,
        CLK => CLK
    );

   -------------------------------------------------------------------------------
   -- MUX for selecting what input to read ---------------------------------------
   -- add conditions and connections for any added PORT IDs
   -------------------------------------------------------------------------------
   inputs: process(s_port_id, SWITCHES, INTERRUPT_STATUS)
   begin
      if (s_port_id = SWITCHES_ID) then
         s_input_port <= SWITCHES;
     --elsif (s_port_id = INT_STATUS) then
         --s_input_port <=  INTERRUPT_STATUS;
      elsif (s_port_id = BUTTON_ID) THEN
         s_input_port <= "0000000" & s_BUTTON;
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
            elsif (s_port_id = SEVEN_SEG_ID) then
               r_SevenSeg <= s_output_port;
--           elsif (s_port_id = INT_EN) then
--               r_INT_EN <= s_output_port;
--           elsif (s_port_id = INT_CLR) then
--               r_INT_CLR <= s_output_port;
             ELSIF (S_PORT_ID = RED_ID) THEN
               r_red <= s_output_port;
             elsif (s_port_id = BLUE_ID) THEN
               r_blue <= s_output_port;
             elsif (s_port_id = GREEN_ID) THEN
               r_green <= s_output_port;

            end if;

         end if;
      end if;
   end process outputs;
   -------------------------------------------------------------------------------



   -- Register Interface Assignments ---------------------------------------------
   -- add all outputs that you added to this design
   LEDS <= r_LEDS;


end Behavioral;
