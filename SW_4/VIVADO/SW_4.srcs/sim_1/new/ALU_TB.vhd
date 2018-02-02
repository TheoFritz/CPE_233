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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_TB is

end ALU_TB;

architecture stimulus of ALU_TB is

FILE ALU_TB_VECS: TEXT OPEN READ_MODE IS "ALU_TB.TB";

COMPONENT ALU IS
  Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
         B : in STD_LOGIC_VECTOR (7 downto 0);
         SEL : in STD_LOGIC_VECTOR (3 downto 0);
         C_IN : in STD_LOGIC;
         SUM : OUT STD_LOGIC_VECTOR (7 downto 0);
         C_FLAG : OUT STD_LOGIC;
         Z_FLAG : OUT STD_LOGIC);
END COMPONENT;

SIGNAL A_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL B_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL SEL_TB : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL C_IN_TB : STD_LOGIC;
SIGNAL SUM_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL C_FLAG_TB : STD_LOGIC;
SIGNAL Z_FLAG_TB : STD_LOGIC;

SIGNAL S_FAIL : STD_LOGIC := '0';


begin

ALU_TB_UUT: ALU PORT MAP (

  A => A_TB,
  B => B_TB,
  SEL => SEL_TB,
  C_IN => C_IN_TB,
  SUM => SUM_TB,
  C_FLAG => C_FLAG_TB,
  Z_FLAG => Z_FLAG_TB

);

STIMULUS_PROCESS: PROCESS

  VARIABLE V_VEC_LINE: LINE;
  VARIABLE V_A, V_B : STD_LOGIC_VECTOR (7 DOWNTO 0);
  VARIABLE V_SEL : STD_LOGIC_VECTOR (3 DOWNTO 0);
  VARIABLE V_C_IN : STD_LOGIC;
  VARIABLE V_SUM_TB : STD_LOGIC_VECTOR (7 DOWNTO 0);
  VARIABLE V_C_FLAG, V_Z_FLAG : STD_LOGIC;

BEGIN

  WHILE NOT ENDFILE(ALU_TB_VECS) LOOP

    READLINE(ALU_TB_VECS,V_VEC_LINE);

    IF V_VEC_LINE(1) ='$' THEN
      NEXT;
    END IF;

    READ(V_VEC_LINE,V_A);
    READ(V_VEC_LINE,V_B);
    READ(V_VEC_LINE,V_SEL);
    READ(V_VEC_LINE,V_C_IN);

    READ(V_VEC_LINE,V_SUM_TB);
    READ(V_VEC_LINE,V_C_FLAG);
    READ(V_VEC_LINE,V_Z_FLAG);

    A_TB <= V_A;
    B_TB <= V_B;
    SEL_TB <= V_SEL;
    C_IN_TB <= V_C_IN;
    -- SUM_TB <= V_SUM_TB;
    -- C_FLAG_TB <= V_C_FLAG;
    -- Z_FLAG_TB <= V_Z_FLAG;

    WAIT FOR 20 ns;

     IF (SUM_TB /= V_SUM_TB) THEN
      S_FAIL <= '1';
    END IF;

    ASSERT (SUM_TB = V_SUM_TB)
      REPORT "SUM IS NOT CORRECT" SEVERITY ERROR;
    ASSERT (C_FLAG_TB = V_C_FLAG)
      REPORT "C_FLAG IS NOT CORRECT" SEVERITY ERROR;
    ASSERT (Z_FLAG_TB = V_Z_FLAG)
      REPORT "Z_FLAG IS NOT CORRECT" SEVERITY ERROR;


  END LOOP;
  WAIT;
END PROCESS;



end stimulus;
