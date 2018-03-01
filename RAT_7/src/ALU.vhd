----------------------------------------------------------------------------------
--
-- RAT ASSIGNMENT NO. 4:
-- ALU.VHD
-- DOMINIC GAIERO AND ELIZABETH DAVIS
--
-- The ALU takes in two 8 bit numbers, and, based on the select input will
-- process those inputs and output on SUM. The carry flag and zero flag are set
-- based on conditions of the input. The ALU performs arithmetic and logic operations.
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY ALU IS
	PORT
	(
		A      : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- A Input to the ALU
		B      : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- B Input to the ALU
		SEL    : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- Selector
		C_IN   : IN STD_LOGIC; -- Carry In
		SUM    : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); -- Output of the Operation
		C_FLAG : OUT STD_LOGIC; -- Carry Flag
	Z_FLAG : OUT STD_LOGIC); -- Zero Flag
END ALU;
ARCHITECTURE Behavioral OF ALU IS
	SIGNAL temp_result : STD_LOGIC_VECTOR (8 DOWNTO 0); -- TEMPORARY OUTPUT FOR INSIDE THE PROCESS STATEMENT
BEGIN
	PROCESS (A, B, C_IN, SEL)
	BEGIN
		CASE SEL IS
			WHEN "0000" => temp_result  <= ('0' & A) + B; --ADD
			WHEN "0001" => temp_result  <= (('0' & A) + B + C_IN);--ADDC
			WHEN "0010" => temp_result  <= ('0' & A) - B;--SUB
			WHEN "0011" => temp_result  <= (('0' & A) - B - C_IN); --SUBC
			WHEN "0100" => temp_result  <= ('0' & A) - B; --CMP
			WHEN "0101" => temp_result  <= ('0' & (A AND B)); --AND
			WHEN "0110" => temp_result  <= ('0' & (A OR B)); --OR
			WHEN "0111" => temp_result  <= ('0' & (A XOR B)); --EXOR
			WHEN "1000" => temp_result  <= '0' & (A AND B); --TEST
			WHEN "1001" => temp_result  <= A & C_IN; --LSL
			WHEN "1010" => temp_result <= A(0) & C_IN & A(7 DOWNTO 1); --LSR
			WHEN "1011" => temp_result <= C_IN & A(6 DOWNTO 0) & A(7); --ROL
--			WHEN "1100" => temp_result <= A(0) & A (7 DOWNTO 1) & C_IN; --ROR
            WHEN "1100" => temp_result <= '0'&A(0) & A (7 DOWNTO 1); --ROR
			WHEN "1101" => temp_result <= '0' & A(7)&A (7 DOWNTO 1); --ASR
			WHEN "1110" => temp_result <= '0' & B; --MOV
			WHEN OTHERS => temp_result <= "000000000"; --UNUSED
		END CASE;
	END PROCESS;
	SUM    <= temp_result (7 DOWNTO 0); -- SETS THE LAST EIGHT BITS OG TEMP RESULT TO BE THE SUM OR OUTPUT
	C_FLAG <= temp_result(8); -- SETS THE NINTH BIT OF TEMP RESULT TO BE THE C-FLAG
	PROCESS (A, B, C_IN, SEL, temp_result)
		BEGIN
			IF temp_result (7 DOWNTO 0) = "00000000" THEN -- IF THE RESULT IS ALL 0'S THE Z-FLAG GOES HIGH OTHERWISE LOW
				Z_FLAG <= '1';
			ELSE
				Z_FLAG <= '0';
			END IF;
		END PROCESS;
END Behavioral;
