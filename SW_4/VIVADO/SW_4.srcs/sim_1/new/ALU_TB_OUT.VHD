
		A_TB    <= "10101010";
		B_TB    <= "10101010";
		SEL_TB  <= "0000";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01010100")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  10101010  0000  0    01010100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0000  0    01010100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0000  0    01010100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0000  0    01010100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0000  0    01010100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0000  0    01010100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "00001010";
		B_TB    <= "10100000";
		SEL_TB  <= "0000";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10101010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("00001010  10100000  0000  1    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00001010  10100000  0000  1    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00001010  10100000  0000  1    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00001010  10100000  0000  1    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00001010  10100000  0000  1    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00001010  10100000  0000  1    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11111111";
		B_TB    <= "00000001";
		SEL_TB  <= "0000";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11111111  00000001  0000  0    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11111111  00000001  0000  0    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11111111  00000001  0000  0    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11111111  00000001  0000  0    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11111111  00000001  0000  0    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11111111  00000001  0000  0    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11001000";
		B_TB    <= "00110110";
		SEL_TB  <= "0001";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "11111111")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11001000  00110110  0001  1    11111111 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  00110110  0001  1    11111111 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  00110110  0001  1    11111111 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  00110110  0001  1    11111111 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  00110110  0001  1    11111111 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  00110110  0001  1    11111111 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11001000";
		B_TB    <= "00110111";
		SEL_TB  <= "0001";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11001000  00110111  0001  1    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  00110111  0001  1    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  00110111  0001  1    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  00110111  0001  1    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  00110111  0001  1    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  00110111  0001  1    00000000 1      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11001000";
		B_TB    <= "01100100";
		SEL_TB  <= "0010";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01100100")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11001000  01100100  0010  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0010  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0010  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0010  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0010  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0010  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11001000";
		B_TB    <= "01100100";
		SEL_TB  <= "0010";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01100100")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11001000  01100100  0010  1    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0010  1    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0010  1    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0010  1    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0010  1    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0010  1    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "01100100";
		B_TB    <= "11001000";
		SEL_TB  <= "0010";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10011100")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("01100100  11001000  0010  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0010  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01100100  11001000  0010  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0010  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01100100  11001000  0010  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0010  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11001000";
		B_TB    <= "01100100";
		SEL_TB  <= "0011";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01100100")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11001000  01100100  0011  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0011  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0011  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0011  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0011  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0011  0    01100100 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11001000";
		B_TB    <= "01100100";
		SEL_TB  <= "0011";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01100011")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11001000  01100100  0011  1    01100011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0011  1    01100011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0011  1    01100011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0011  1    01100011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11001000  01100100  0011  1    01100011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11001000  01100100  0011  1    01100011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "01100100";
		B_TB    <= "11001000";
		SEL_TB  <= "0011";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10011100")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("01100100  11001000  0011  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0011  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01100100  11001000  0011  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0011  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01100100  11001000  0011  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0011  0    10011100 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "01100100";
		B_TB    <= "11001000";
		SEL_TB  <= "0011";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10011011")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("01100100  11001000  0011  1    10011011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0011  1    10011011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01100100  11001000  0011  1    10011011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0011  1    10011011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01100100  11001000  0011  1    10011011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01100100  11001000  0011  1    10011011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10101010";
		B_TB    <= "11111111";
		SEL_TB  <= "0100";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10101011")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  11111111  0100  0    10101011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  11111111  0100  0    10101011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  11111111  0100  0    10101011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  11111111  0100  0    10101011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  11111111  0100  0    10101011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  11111111  0100  0    10101011 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "11111111";
		B_TB    <= "10101010";
		SEL_TB  <= "0100";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01010101")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("11111111  10101010  0100  0    01010101 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11111111  10101010  0100  0    01010101 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11111111  10101010  0100  0    01010101 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11111111  10101010  0100  0    01010101 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("11111111  10101010  0100  0    01010101 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("11111111  10101010  0100  0    01010101 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10101010";
		B_TB    <= "10101010";
		SEL_TB  <= "0100";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  10101010  0100  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0100  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0100  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0100  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0100  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0100  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10111011";
		B_TB    <= "10111011";
		SEL_TB  <= "0101";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10111011")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10111011  10111011  0101  0    10111011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10111011  10111011  0101  0    10111011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10111011  10111011  0101  0    10111011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10111011  10111011  0101  0    10111011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10111011  10111011  0101  0    10111011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10111011  10111011  0101  0    10111011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10101010";
		B_TB    <= "10101010";
		SEL_TB  <= "0101";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10101010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  10101010  0101  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0101  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0101  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0101  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0101  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0101  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "00000011";
		B_TB    <= "10101010";
		SEL_TB  <= "0101";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("00000011  10101010  0101  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0101  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000011  10101010  0101  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0101  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000011  10101010  0101  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0101  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10101010";
		B_TB    <= "10101010";
		SEL_TB  <= "0110";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10101010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  10101010  0110  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0110  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0110  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0110  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0110  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0110  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "00000011";
		B_TB    <= "10101010";
		SEL_TB  <= "0110";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10101011")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("00000011  10101010  0110  0    10101011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0110  0    10101011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000011  10101010  0110  0    10101011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0110  0    10101011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000011  10101010  0110  0    10101011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0110  0    10101011 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10101010";
		B_TB    <= "10101010";
		SEL_TB  <= "0111";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  10101010  0111  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0111  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0111  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0111  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  0111  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  0111  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "00000011";
		B_TB    <= "10101010";
		SEL_TB  <= "0111";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10101001")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("00000011  10101010  0111  0    10101001 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0111  0    10101001 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000011  10101010  0111  0    10101001 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0111  0    10101001 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000011  10101010  0111  0    10101001 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000011  10101010  0111  0    10101001 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10101010";
		B_TB    <= "10101010";
		SEL_TB  <= "1000";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "10101010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  10101010  1000  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  1000  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  1000  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  1000  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  10101010  1000  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  10101010  1000  0    10101010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "01010101";
		B_TB    <= "10101010";
		SEL_TB  <= "1000";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("01010101  10101010  1000  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01010101  10101010  1000  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01010101  10101010  1000  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01010101  10101010  1000  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01010101  10101010  1000  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01010101  10101010  1000  0    00000000 0      1      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "00000001";
		B_TB    <= "00010010";
		SEL_TB  <= "1001";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("00000001  00010010  1001  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000001  00010010  1001  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000001  00010010  1001  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000001  00010010  1001  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000001  00010010  1001  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000001  00010010  1001  0    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10000000";
		B_TB    <= "00110011";
		SEL_TB  <= "1010";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10000000  00110011  1010  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  00110011  1010  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  00110011  1010  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  00110011  1010  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  00110011  1010  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  00110011  1010  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10000000";
		B_TB    <= "01000011";
		SEL_TB  <= "1010";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "11000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10000000  01000011  1010  1    11000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  01000011  1010  1    11000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  01000011  1010  1    11000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  01000011  1010  1    11000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  01000011  1010  1    11000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  01000011  1010  1    11000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "00000001";
		B_TB    <= "10101011";
		SEL_TB  <= "1011";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00000010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("00000001  10101011  1011  1    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000001  10101011  1011  1    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000001  10101011  1011  1    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000001  10101011  1011  1    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("00000001  10101011  1011  1    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("00000001  10101011  1011  1    00000010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10101010";
		B_TB    <= "11110010";
		SEL_TB  <= "1011";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01010101")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10101010  11110010  1011  0    01010101 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  11110010  1011  0    01010101 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '1')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  11110010  1011  0    01010101 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  11110010  1011  0    01010101 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10101010  11110010  1011  0    01010101 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10101010  11110010  1011  0    01010101 1      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10000000";
		B_TB    <= "00111100";
		SEL_TB  <= "1100";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10000000  00111100  1100  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  00111100  1100  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  00111100  1100  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  00111100  1100  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  00111100  1100  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  00111100  1100  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10000000";
		B_TB    <= "10011000";
		SEL_TB  <= "1100";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10000000  10011000  1100  1    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  10011000  1100  1    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  10011000  1100  1    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  10011000  1100  1    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  10011000  1100  1    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  10011000  1100  1    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "10000000";
		B_TB    <= "10000001";
		SEL_TB  <= "1101";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "01000000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("10000000  10000001  1101  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  10000001  1101  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  10000001  1101  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  10000001  1101  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("10000000  10000001  1101  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("10000000  10000001  1101  0    01000000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "01000000";
		B_TB    <= "10110010";
		SEL_TB  <= "1101";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00100000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("01000000  10110010  1101  0    00100000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01000000  10110010  1101  0    00100000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01000000  10110010  1101  0    00100000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01000000  10110010  1101  0    00100000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01000000  10110010  1101  0    00100000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01000000  10110010  1101  0    00100000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "01010000";
		B_TB    <= "00110000";
		SEL_TB  <= "1110";
		C_IN_TB <= '0';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00110000")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("01010000  00110000  1110  0    00110000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01010000  00110000  1110  0    00110000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01010000  00110000  1110  0    00110000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01010000  00110000  1110  0    00110000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01010000  00110000  1110  0    00110000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01010000  00110000  1110  0    00110000 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;

		A_TB    <= "01000011";
		B_TB    <= "00100010";
		SEL_TB  <= "1110";
		C_IN_TB <= '1';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "00100010")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));
			write(v_results_line, STRING'("01000011  00100010  1110  1    00100010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (SUM CORRECT)     : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01000011  00100010  1110  1    00100010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(C_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01000011  00100010  1110  1    00100010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                  "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (C_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01000011  00100010  1110  1    00100010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
		END IF;
		IF (NOT(Z_FLAG_TB = '0')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG CORRECT): A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   :   "));

			write(v_results_line, STRING'("01000011  00100010  1110  1    00100010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		ELSE
			write(v_results_line, STRING'("SUCCESS (Z_FLAG CORRECT)  : A         B         SEL   C_IN SUM      C_FLAG Z_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED   : "));

			write(v_results_line, STRING'("01000011  00100010  1110  1    00100010 0      0      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL     :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);

		END IF;
		WAIT FOR 20 ns;
