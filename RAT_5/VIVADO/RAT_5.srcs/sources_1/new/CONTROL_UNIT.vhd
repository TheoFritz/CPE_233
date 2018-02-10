----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/09/2018 11:50:03 AM
-- Design Name:
-- Module Name: CONTROL_UNIT - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTROL_UNIT is
    Port ( C_FLAG       : in STD_LOGIC;
           Z_FLAG       : in STD_LOGIC;
           INT          : in STD_LOGIC;
           RESET        : in STD_LOGIC;
           OPCODE_HI_5   : in STD_LOGIC_VECTOR (4 downto 0);
           OPCODE_LO_2  : in STD_LOGIC_VECTOR (1 downto 0);
           CLK          : in STD_LOGIC;

           I_SET        : out STD_LOGIC;
           I_CLR        : out STD_LOGIC;
           PC_LD        : out STD_LOGIC;
           PC_INC       : out STD_LOGIC;
           PC_MUX_SEL   : out STD_LOGIC_VECTOR (1 downto 0);
           ALU_OPY_SEL  : out STD_LOGIC;
           ALU_SEL      : out STD_LOGIC_VECTOR (3 downto 0);
           RF_WR        : out STD_LOGIC;
           RF_WR_SEL    : out STD_LOGIC_VECTOR (1 downto 0);
           SP_LD        : out STD_LOGIC;
           SP_INC       : out STD_LOGIC;
           SP_DECR      : out STD_LOGIC;
           SCR_WE       : out STD_LOGIC;
           SCR_ADDR_SEL : out STD_LOGIC_VECTOR (1 downto 0);
           SCR_DATA_SEL : out STD_LOGIC;
           FLG_C_SET    : out STD_LOGIC;
           FLG_C_CLR    : out STD_LOGIC;
           FLG_C_LD     : out STD_LOGIC;
           FLG_Z_LD     : out STD_LOGIC;
           FLG_LD_SEL   : out STD_LOGIC;
           FLG_SHAD_LD  : out STD_LOGIC;
           RST          : out STD_LOGIC);
end CONTROL_UNIT;

architecture Behavioral of CONTROL_UNIT is

-- Three different FSM states
    type state_type is (ST_INIT, ST_FETCH, ST_EXEC);
    signal PS, NS: state_type;

--OP Code
    signal sig_opcode_7: std_logic_vector(6 downto 0);



BEGIN


sync_proc: process(CLK,NS,RESET)
    begin
      IF (RESET = '1') THEN
         PS <= ST_INIT;
      ELSIF (RISING_EDGE(CLK)) THEN
         PS <= NS;
      END IF;
      END PROCESS sync_proc;

COMB_PROC: PROCESS(OPCODE_HI_5, OPCODE_LO_2, sig_opcode_7, C_FLAG, Z_FLAG, PS, NS, INT)

BEGIN
sig_OPCODE_7 <= OPCODE_HI_5 & OPCODE_LO_2;

CASE PS IS
WHEN  ST_INIT =>
  NS <= ST_FETCH;
  I_SET        <= '0';    I_CLR        <= '0';
  PC_LD        <= '0';    PC_INC       <= '0';    PC_MUX_SEL   <= "00";
  ALU_OPY_SEL  <= '0';    ALU_SEL      <= "0000";
  RF_WR        <= '0';    RF_WR_SEL    <= "00";
  SP_LD        <= '0';    SP_INC       <= '0';    SP_DECR      <= '0';
  SCR_WE       <= '0';    SCR_ADDR_SEL <= "00";   SCR_DATA_SEL <= '0';
  FLG_C_SET    <= '0';    FLG_C_CLR    <= '0';    FLG_C_LD     <= '0';
  FLG_Z_LD     <= '0';    FLG_LD_SEL   <= '0';    FLG_SHAD_LD  <= '0';
  RST          <= '1';
WHEN ST_FETCH =>
  NS <= ST_EXEC;
  I_SET        <= '0';    I_CLR        <= '0';
  PC_LD        <= '0';    PC_INC       <= '1';    PC_MUX_SEL   <= "00";
  ALU_OPY_SEL  <= '0';    ALU_SEL      <= "0000";
  RF_WR        <= '0';    RF_WR_SEL    <= "00";
  SP_LD        <= '0';    SP_INC       <= '0';    SP_DECR      <= '0';
  SCR_WE       <= '0';    SCR_ADDR_SEL <= "00";   SCR_DATA_SEL <= '0';
  FLG_C_SET    <= '0';    FLG_C_CLR    <= '0';    FLG_C_LD     <= '0';
  FLG_Z_LD     <= '0';    FLG_LD_SEL   <= '0';    FLG_SHAD_LD  <= '0';
  RST          <= '0';
WHEN ST_EXEC =>
  NS <= ST_FETCH;
  IF sig_OPCODE_7 <= "0010000" THEN -- BRN
    PC_LD <= '1';
  ELSIF sig_OPCODE_7 <= "0000010" THEN -- EXOR (REG-REG)
    RF_WR <= '1';
    ALU_SEL <= "0111";
    FLG_C_CLR <= '1';
    FLG_Z_LD <= '1';
  ELSIF OPCODE_HI_5 <= "10010" THEN -- EXOR (REG-IMMED)
    RF_WR <= '1';
    ALU_SEL <= "0111";
    ALU_OPY_SEL <= '1';
    FLG_C_CLR <= '1';
    FLG_Z_LD <= '1';
  ELSIF OPCODE_HI_5 <= "11001" THEN -- IN (REG-IMMED)
    RF_WR <= '1';
    RF_WR_SEL <= "11";
  ELSIF sig_OPCODE_7 <= "0001001" THEN -- MOV (REG-REG)
    RF_WR <= '1';
    ALU_SEL <= "1110";
  ELSIF OPCODE_HI_5 <= "11011" THEN -- MOV (REG-IMEMD)
    RF_WR <= '1';
    ALU_SEL <= "1110";
    ALU_OPY_SEL <= '1';
  ELSIF OPCODE_HI_5 <= "11010" THEN -- OUT (REG-REG)
  ELSE
    I_SET        <= '0';    I_CLR        <= '0';
    PC_LD        <= '0';    PC_INC       <= '0';    PC_MUX_SEL   <= "00";
    ALU_OPY_SEL  <= '0';    ALU_SEL      <= "0000";
    RF_WR        <= '0';    RF_WR_SEL    <= "00";
    SP_LD        <= '0';    SP_INC       <= '0';    SP_DECR      <= '0';
    SCR_WE       <= '0';    SCR_ADDR_SEL <= "00";   SCR_DATA_SEL <= '0';
    FLG_C_SET    <= '0';    FLG_C_CLR    <= '0';    FLG_C_LD     <= '0';
    FLG_Z_LD     <= '0';    FLG_LD_SEL   <= '0';    FLG_SHAD_LD  <= '0';
    RST          <= '0';
  END IF;

WHEN OTHERS =>
  I_SET        <= '0';    I_CLR        <= '0';
  PC_LD        <= '0';    PC_INC       <= '0';    PC_MUX_SEL   <= "00";
  ALU_OPY_SEL  <= '0';    ALU_SEL      <= "0000";
  RF_WR        <= '0';    RF_WR_SEL    <= "00";
  SP_LD        <= '0';    SP_INC       <= '0';    SP_DECR      <= '0';
  SCR_WE       <= '0';    SCR_ADDR_SEL <= "00";   SCR_DATA_SEL <= '0';
  FLG_C_SET    <= '0';    FLG_C_CLR    <= '0';    FLG_C_LD     <= '0';
  FLG_Z_LD     <= '0';    FLG_LD_SEL   <= '0';    FLG_SHAD_LD  <= '0';
  RST          <= '0';
END CASE;


END PROCESS COMB_PROC;




end Behavioral;