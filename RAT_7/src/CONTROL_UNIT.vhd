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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
ENTITY CONTROL_UNIT IS
    PORT
    (
        C_FLAG       : IN STD_LOGIC;
        Z_FLAG       : IN STD_LOGIC;
        INT          : IN STD_LOGIC;
        RESET        : IN STD_LOGIC;
        OPCODE_HI_5  : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        OPCODE_LO_2  : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        CLK          : IN STD_LOGIC;
        I_SET        : OUT STD_LOGIC;
        I_CLR        : OUT STD_LOGIC;
        PC_LD        : OUT STD_LOGIC;
        PC_INC       : OUT STD_LOGIC;
        PC_MUX_SEL   : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        ALU_OPY_SEL  : OUT STD_LOGIC;
        ALU_SEL      : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        RF_WR        : OUT STD_LOGIC;
        RF_WR_SEL    : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        SP_LD        : OUT STD_LOGIC;
        SP_INC       : OUT STD_LOGIC;
        SP_DECR      : OUT STD_LOGIC;
        SCR_WE       : OUT STD_LOGIC;
        SCR_ADDR_SEL : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        SCR_DATA_SEL : OUT STD_LOGIC;
        FLG_C_SET    : OUT STD_LOGIC;
        FLG_C_CLR    : OUT STD_LOGIC;
        FLG_C_LD     : OUT STD_LOGIC;
        FLG_Z_LD     : OUT STD_LOGIC;
        FLG_LD_SEL   : OUT STD_LOGIC;
        FLG_SHAD_LD  : OUT STD_LOGIC;
        RST          : OUT STD_LOGIC;
        IO_STRB      : OUT STD_LOGIC);
END CONTROL_UNIT;
ARCHITECTURE Behavioral OF CONTROL_UNIT IS
    -- Three different FSM states
    TYPE state_type IS (ST_INIT, ST_FETCH, ST_EXEC);
    SIGNAL PS, NS       : state_type;
    --OP Code
    SIGNAL sig_opcode_7 : std_logic_vector(6 DOWNTO 0);
    SIGNAL EXEC_STATE   : STD_LOGIC_VECTOR(5 DOWNTO 0);
BEGIN
    sync_proc : PROCESS (CLK, NS, RESET)
    BEGIN
        IF (RISING_EDGE(CLK)) THEN
            PS <= NS;
            IF (RESET = '1') THEN
                PS <= ST_INIT;
            END IF;
        END IF;
    END PROCESS sync_proc;
    COMB_PROC : PROCESS (OPCODE_HI_5, OPCODE_LO_2, sig_opcode_7, C_FLAG, Z_FLAG, PS, INT)
    BEGIN
        I_SET        <= '0';
        I_CLR        <= '0';
        PC_LD        <= '0';
        PC_INC       <= '0';
        PC_MUX_SEL   <= "00";
        ALU_OPY_SEL  <= '0';
        ALU_SEL      <= "0000";
        RF_WR        <= '0';
        RF_WR_SEL    <= "00";
        SP_LD        <= '0';
        SP_INC       <= '0';
        SP_DECR      <= '0';
        SCR_WE       <= '0';
        SCR_ADDR_SEL <= "00";
        SCR_DATA_SEL <= '0';
        FLG_C_SET    <= '0';
        FLG_C_CLR    <= '0';
        FLG_C_LD     <= '0';
        FLG_Z_LD     <= '0';
        FLG_LD_SEL   <= '0';
        FLG_SHAD_LD  <= '0';
        RST          <= '0';
        IO_STRB      <= '0';
        sig_OPCODE_7 <= OPCODE_HI_5 & OPCODE_LO_2;
        CASE PS IS
            WHEN ST_INIT =>
                NS  <= ST_FETCH;
                RST <= '1';
            WHEN ST_FETCH =>
                NS     <= ST_EXEC;
                PC_INC <= '1';
            WHEN ST_EXEC =>
                NS <= ST_FETCH;
                CASE SIG_OPCODE_7 IS
                    WHEN "0000100" => -- ADD (REG-REG)
                        RF_WR       <= '1';
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1010000" | "1010001" | "1010010" | "1010011" => -- ADD (REG-IMMED)
                        ALU_OPY_SEL <= '1';
                        RF_WR       <= '1';
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0000101" => -- ADDC (REG-REG)
                        ALU_SEL     <= "0001";
                        RF_WR       <= '1';
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1010100" | "1010101" | "1010110" | "1010111" => --ADDC (REG-IMMED)
                        ALU_SEL     <= "0001";
                        ALU_OPY_SEL <= '1';
                        RF_WR       <= '1';
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0000000" => -- AND (REG-REG)
                        ALU_SEL     <= "0101";
                        RF_WR       <= '1';
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1000000" | "1000001" | "1000010" | "1000011" => -- AND (REG-IMMED)
                        ALU_SEL     <= "0101";
                        ALU_OPY_SEL <= '1';
                        RF_WR       <= '1';
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0100100" => -- ASR (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "1101";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0010101" => -- BRCC
                        IF C_FLAG = '0' THEN
                            PC_LD   <= '1';
                        ELSE
                            PC_LD   <= '0';
                        END IF;
                    WHEN "0010100" => -- BRCS
                        IF C_FLAG = '1' THEN
                            PC_LD   <= '1';
                        ELSE
                            PC_LD   <= '0';
                        END IF;
                    WHEN "0010000" => --BRN
                        PC_LD       <= '1';
                    WHEN "0010010" => -- BREQ
                        IF Z_FLAG = '1' THEN
                            PC_LD   <= '1';
                        ELSE
                            PC_LD   <= '0';
                        END IF;
                    WHEN "0010011" => -- BRNE
                        IF Z_FLAG = '0' THEN
                            PC_LD   <= '1';
                        ELSE
                            PC_LD   <= '0';
                        END IF;
                    WHEN "0110000" => -- CLC (REG-REG)
                        RF_WR       <= '1';
                        FLG_C_CLR   <= '1';
                    WHEN "0001000" => -- CMP (REG-REG)
                        ALU_SEL     <= "0100";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1100000" | "1100001" | "1100010" | "1100011" => -- CMP (REG-IMMED)
                        ALU_SEL     <= "0100";
                        ALU_OPY_SEL <= '1';
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0000010" => -- EXOR (REG-REG)
                        ALU_SEL     <= "0111";
                        RF_WR       <= '1';
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1001000" | "1001001" | "1001010" | "1001011" => -- EXOR (REG-IMMED)
                        ALU_OPY_SEL <= '1';
                        ALU_SEL     <= "0111";
                        RF_WR       <= '1';
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1100100" | "1100101" | "1100110" | "1100111" => -- IN (REG-IMMED)
                        RF_WR       <= '1';
                        RF_WR_SEL   <= "11";
                    WHEN "0100000" => -- LSL (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "1001";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0100001" => -- LSR (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "1010";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0001001" => -- MOV (REG-REG)
                        ALU_SEL     <= "1110";
                        RF_WR       <= '1';
                    WHEN "1101100" | "1101101" | "1101110" | "1101111" => -- MOV (REG-IMEMD)
                        ALU_OPY_SEL <= '1';
                        ALU_SEL     <= "1110";
                        RF_WR       <= '1';
                    WHEN "1101000" | "1101001" | "1101010" | "1101011" => -- OUT (REG-REG)
                        IO_STRB     <= '1';
                    WHEN "1001100" | "1001101" | "1001110" | "1001111" => --TEST (REG-IMMED)
                        ALU_SEL     <= "1000";
                        ALU_OPY_SEL <= '1';
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0000011" => --TEST (REG-REG)
                        ALU_SEL     <= "1000";
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1011100" | "1011101" | "1011110" | "1011111" => -- SUBC(REG-IMMED)
                        RF_WR       <= '1';
                        ALU_SEL     <= "0011";
                        ALU_OPY_SEL <= '1';
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0000111" => --SUBC (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "0011";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1011000" | "1011001" | "1011010" | "1011011" => -- SUB (REG-IMMED)
                        RF_WR       <= '1';
                        ALU_SEL     <= "0010";
                        ALU_OPY_SEL <= '1';
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0000110" => -- SUB (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "0010";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0110001" => -- SEC (REG-REG)
                        RF_WR       <= '1';
                        FLG_C_SET   <= '1';
                    WHEN "0100011" => -- ROR (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "1100";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0100010" => -- ROL (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "1011";
                        FLG_C_LD    <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "1000100" | "1000101" | "1000110" | "1000111" => -- OR (REG-IMMED)
                        RF_WR       <= '1';
                        ALU_SEL     <= "0110";
                        ALU_OPY_SEL <= '1';
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0000001" => -- OR (REG-REG)
                        RF_WR       <= '1';
                        ALU_SEL     <= "0110";
                        FLG_C_CLR   <= '1';
                        FLG_Z_LD    <= '1';
                    WHEN "0010001" => -- CALL (REG-IMMED)
                        PC_LD <= '1';
                        SCR_DATA_SEL <= '1';
                        SCR_WE <= '1';
                        SCR_ADDR_SEL <= "11";
                        SP_DECR <= '1';
                    WHEN "0001010" => -- LD (REG-REG)
                        RF_WR <= '1';
                        RF_WR_SEL <= "11";
                    WHEN "1110000" | "1110001" | "1110010" | "1110011" => -- LD (REG-REG)
                        RF_WR <= '1';
                        RF_WR_SEL <= "11";
                        SCR_ADDR_SEL <= "01";
                    WHEN "0100110" => -- POP (REG)
                        RF_WR <= '1';
                        RF_WR_SEL <= "01";
                        SCR_ADDR_SEL <= "10";
                        SP_LD <= '1';
                        SP_INC <= '1';
                    WHEN "0100101" => -- PUSH (REG)
                        SCR_WE <= '1';
                        SCR_ADDR_SEL <= "10";
                        SP_LD <= '1';
                        SP_DECR <= '1';
                    WHEN "0110010" => -- RET
                        PC_LD <= '1';
                        PC_MUX_SEL <= "01";
                        SCR_ADDR_SEL <= "10";
                        SP_INC <= '1';
                    WHEN "0001011" => -- ST (REG-REG)
                        SCR_WE <= '1';
                    WHEN "1110100" | "1110101" | "1110110" | "1110111" => --ST (REG-IMMED)
                        SCR_WE <= '1';
                        SCR_ADDR_SEL <= "01";
                    WHEN "0101000" => -- WSP
                        SP_LD <= '1';


                    WHEN OTHERS =>
                        NS <= ST_FETCH;
                END CASE;
            WHEN OTHERS =>
                NS <= ST_INIT;
        END CASE;
    END PROCESS COMB_PROC;
END Behavioral;
