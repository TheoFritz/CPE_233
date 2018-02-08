----------------------------------------------------------------------------------
--
-- HW ASSIGNMENT NO. 2:
-- SPEAKER_DRIVER.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The speaker driver takes in an 8-bit input and, depending on the switch
-- configuration, outputs various frequencies.
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY SPEAKER_DRIVER IS
	PORT
	(
		sw      : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clk     : IN STD_LOGIC;
		speaker : OUT STD_LOGIC
	);
END SPEAKER_DRIVER;
ARCHITECTURE Behavioral OF SPEAKER_DRIVER IS
	SIGNAL tmp_clk : std_logic := '0';
BEGIN
	speaker_driver_sound : PROCESS (clk, tmp_clk, sw)
		VARIABLE frequency   : INTEGER;
		VARIABLE period      : INTEGER;
		VARIABLE clk_div     : INTEGER;
		VARIABLE div_cnt     : INTEGER := 0;
	BEGIN
		CASE sw IS
			WHEN "00000000" => frequency  := (0); -- FREQUENCY = 0Hz
			WHEN "00000001" => frequency  := (95510); -- FREQUENCY = 1047Hz
			WHEN "00000010" => frequency  := (90171); -- FREQUENCY = 1109Hz
			WHEN "00000011" => frequency  := (85106); -- FREQUENCY = 1175Hz
			WHEN "00000100" => frequency  := (80321); -- FREQUENCY = 1245Hz
			WHEN "00000101" => frequency  := (75815); -- FREQUENCY = 1319Hz
			WHEN "00000110" => frequency  := (71581); -- FREQUENCY = 1397Hz
			WHEN "00000111" => frequency  := (67567); -- FREQUENCY = 1480Hz
			WHEN "00001000" => frequency  := (63775); -- FREQUENCY = 1568Hz
			WHEN "00001001" => frequency  := (60204); -- FREQUENCY = 1661Hz
			WHEN "00001010" => frequency := (56818); -- FREQUENCY = 1760Hz
			WHEN "00001011" => frequency := (53619); -- FREQUENCY = 1865Hz
			WHEN "00001100" => frequency := (50607); -- FREQUENCY = 1976Hz
			WHEN "00001101" => frequency := (47778); -- FREQUENCY = 2093Hz
			WHEN "00001110" => frequency := (45105); -- FREQUENCY = 2217Hz
			WHEN "00001111" => frequency := (42571); -- FREQUENCY = 2349Hz
			WHEN "00010000" => frequency := (40176); -- FREQUENCY = 2489Hz
			WHEN "00010001" => frequency := (37921); -- FREQUENCY = 2637Hz
			WHEN "00010010" => frequency := (35803); -- FREQUENCY = 2793Hz
			WHEN "00010011" => frequency := (33783); -- FREQUENCY = 2960Hz
			WHEN "00010100" => frequency := (31887); -- FREQUENCY = 3136Hz
			WHEN "00010101" => frequency := (30102); -- FREQUENCY = 3322Hz
			WHEN "00010110" => frequency := (28409); -- FREQUENCY = 3520Hz
			WHEN "00010111" => frequency := (26816); -- FREQUENCY = 3729Hz
			WHEN "00011000" => frequency := (25310); -- FREQUENCY = 3951Hz
			WHEN "00011001" => frequency := (23889); -- FREQUENCY = 4186Hz
			WHEN "00011010" => frequency := (22547); -- FREQUENCY = 4435Hz
			WHEN "00011011" => frequency := (21281); -- FREQUENCY = 4699Hz
			WHEN "00011100" => frequency := (20088); -- FREQUENCY = 4978Hz
			WHEN "00011101" => frequency := (18960); -- FREQUENCY = 5274Hz
			WHEN "00011110" => frequency := (17895); -- FREQUENCY = 5588Hz
			WHEN "00011111" => frequency := (16891); -- FREQUENCY = 5920Hz
			WHEN "00100000" => frequency := (15943); -- FREQUENCY = 6272Hz
			WHEN "00100001" => frequency := (15048); -- FREQUENCY = 6645Hz
			WHEN "00100010" => frequency := (14204); -- FREQUENCY = 7040Hz
			WHEN "00100011" => frequency := (13406); -- FREQUENCY = 7459Hz
			WHEN "00100100" => frequency := (12655); -- FREQUENCY = 7902Hz
			WHEN OTHERS => frequency     := (0);
		END CASE;
		IF (rising_edge(clk)) THEN
			IF (div_cnt >= frequency) THEN
				tmp_clk <= NOT tmp_clk;
				div_cnt := 0;
			ELSE
				div_cnt := div_cnt + 1;
			END IF;
		END IF;
		speaker <= tmp_clk;
	END PROCESS speaker_driver_sound;
END Behavioral;