

f = open("ALU_TB.txt")
fout = open("ALU_TB_OUT.VHD", 'w')
for line in f:
	lineData = line.strip()
	lineData = lineData.split(" ")
	if lineData[0] == "$":
		pass
	else:
		print (lineData)

		V_A = lineData[0]
		V_B = lineData[1]
		V_SEL = lineData[2]
		V_C_IN = lineData[3]
		V_SUM = lineData[4]
		V_C_FLAG = lineData[5]
		V_Z_FLAG = lineData[6]

		toFillOut = """
		A_TB    <= "{0}";
		B_TB    <= "{1}";
		SEL_TB  <= "{2}";
		C_IN_TB <= '{3}';
		WAIT FOR 20 ns;
		IF (NOT(SUM_TB = "{4}")) THEN
			write(v_results_line, STRING'("FAILURE (SUM INCORRECT): A         B         SEL   C_IN SUM      Z_FLAG C_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED: "));
			write(v_results_line, STRING'("{0}  {1}  {2}  {3}    {4} {5}      {6}      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL  :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		END IF;
		IF (NOT(C_FLAG_TB = '{5}')) THEN
			write(v_results_line, STRING'("FAILURE (C_FLAG INCORRECT): A         B         SEL   C_IN SUM      Z_FLAG C_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED: "));

			write(v_results_line, STRING'("{0}  {1}  {2}  {3}    {4} {5}      {6}      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL  :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		END IF;
		IF (NOT(Z_FLAG_TB = '{6}')) THEN
			write(v_results_line, STRING'("FAILURE (Z_FLAG INCORRECT): A         B         SEL   C_IN SUM      Z_FLAG C_FLAG TIME"));
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               EXPECTED: "));

			write(v_results_line, STRING'("{0}  {1}  {2}  {3}    {4} {5}      {6}      "));
			write(v_results_line, now);
			writeline(ALU_TB_RESULTS, v_results_line);
			write(v_results_line, STRING'("               ACTUAL  :                                "));
			write(v_results_line, SUM_TB);
			write(v_results_line, STRING'(" "));
			write(v_results_line, C_FLAG_TB);
			write(v_results_line, STRING'("      "));
			write(v_results_line, Z_FLAG_TB);
			writeline(ALU_TB_RESULTS, v_results_line);
			V_FAIL := '1';
		END IF;
		WAIT FOR 20 ns;""".format(V_A,V_B,V_SEL,V_C_IN,V_SUM,V_C_FLAG,V_Z_FLAG)
		print (toFillOut)
		fout.write('{}\n'.format(toFillOut))
