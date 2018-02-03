----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/02/2018 08:40:52 AM
-- Design Name:
-- Module Name: ALU_TB - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE std.textio.ALL;
use ieee.std_logic_textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
ENTITY ALU_TB IS
END ALU_TB;
ARCHITECTURE stimulus OF ALU_TB IS
	FILE ALU_TB_VECS    : TEXT OPEN READ_MODE IS "C:\Users\dgaiero\Documents\School\College\Year_2\Quarter_2\CPE_233\SW_4\VIVADO\SW_4.srcs\sim_1\new\ALU_TB.txt";
	FILE ALU_TB_RESULTS : TEXT OPEN WRITE_MODE IS "C:\Users\dgaiero\Documents\School\College\Year_2\Quarter_2\CPE_233\SW_4\VIVADO\SW_4.srcs\sim_1\new\ALU_TB_RESULTS.LOG";
	COMPONENT ALU IS
		PORT
		(
			A      : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			B      : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			SEL    : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			C_IN   : IN STD_LOGIC;
			SUM    : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			C_FLAG : OUT STD_LOGIC;
			Z_FLAG : OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL A_TB      : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL B_TB      : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL SEL_TB    : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL C_IN_TB   : STD_LOGIC;
	SIGNAL SUM_TB    : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL C_FLAG_TB : STD_LOGIC;
	SIGNAL Z_FLAG_TB : STD_LOGIC;
	SIGNAL S_FAIL    : STD_LOGIC := '0';
BEGIN
	ALU_TB_UUT : ALU
	PORT MAP
	(
		A => A_TB,
    B => B_TB,
		SEL => SEL_TB,
    C_IN => C_IN_TB,
		SUM => SUM_TB,
    C_FLAG => C_FLAG_TB,
		Z_FLAG => Z_FLAG_TB
	);
	STIMULUS_PROCESS            : PROCESS
		VARIABLE V_FAIL             : STD_LOGIC := '0';
--		VARIABLE V_VEC_LINE         : LINE;
		VARIABLE v_results_line     : LINE;
--		VARIABLE V_A, V_B           : STD_LOGIC_VECTOR (7 DOWNTO 0);
--		VARIABLE V_SEL              : STD_LOGIC_VECTOR (3 DOWNTO 0);
--		VARIABLE V_C_IN             : STD_LOGIC;
--		VARIABLE V_SUM              : STD_LOGIC_VECTOR (7 DOWNTO 0);
--		VARIABLE V_C_FLAG, V_Z_FLAG : STD_LOGIC;
	BEGIN
--		WHILE NOT ENDFILE(ALU_TB_VECS) LOOP
--		READLINE(ALU_TB_VECS, V_VEC_LINE);
--		IF V_VEC_LINE(0) = '$' THEN
--			NEXT;
--		END IF;
--		READ(V_VEC_LINE, V_A);
--		READ(V_VEC_LINE, V_B);
--		READ(V_VEC_LINE, V_SEL);
--		READ(V_VEC_LINE, V_C_IN);
--		READ(V_VEC_LINE, V_SUM);
--		READ(V_VEC_LINE, V_C_FLAG);
--		READ(V_VEC_LINE, V_Z_FLAG);
		A_TB    <= V_A;
		B_TB    <= V_B;
		SEL_TB  <= V_SEL;
		C_IN_TB <= V_C_IN;
		WAIT FOR 20 ns;
		IF (SUM_TB /= V_SUM) THEN
			write(v_results_line, STRING'("SUM IS NOT correct at "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		END IF;
		IF (C_FLAG_TB /= V_C_FLAG) THEN
			write(v_results_line, STRING'("C FLAG IS NOT correct at "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		END IF;
		IF (Z_FLAG_TB /= V_Z_FLAG) THEN
			write(v_results_line, STRING'("Z FLAG IS NOT correct at "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		END IF;
--	END LOOP;
	IF (v_fail = '1') THEN
		write(v_results_line, STRING'("The DUT failed testing."));
		writeline(ALU_TB_RESULTS, v_results_line);
	ELSE
		write(v_results_line, STRING'("The DUT tested properly."));
		writeline(ALU_TB_RESULTS, v_results_line);
	END IF;
	WAIT;
	END PROCESS;
END stimulus;
