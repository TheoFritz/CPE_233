----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2018 10:30:03 PM
-- Design Name: 
-- Module Name: C_FLAG_FF - Behavioral
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

entity C_FLAG_FF is
    Port ( C : in STD_LOGIC;
           FLG_C_LD : in STD_LOGIC;
           FLG_C_SET : in STD_LOGIC;
           FLG_C_CLR : in STD_LOGIC;
           CLK : in STD_LOGIC;
           C_FLAG: OUT STD_LOGIC);
end C_FLAG_FF;

architecture Behavioral of C_FLAG_FF is
SIGNAL C_FLAG_TEMP : STD_LOGIC;
begin

C_FLAG_DF: PROCESS(C, FLG_C_LD, FLG_C_SET, FLG_C_CLR, CLK)
   BEGIN
      IF (RISING_EDGE(CLK)) THEN
         IF  FLG_C_SET = '1' THEN
            C_FLAG_TEMP <= '1';
         ELSIF FLG_C_CLR = '1' THEN
            C_FLAG_TEMP <= '0';
         ELSE
            C_FLAG_TEMP <= C;
         END IF;
      END IF;
      END PROCESS;
                   
C_FLAG <= C_FLAG_TEMP;

end Behavioral;
