----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 07:07:23 PM
-- Design Name: 
-- Module Name: Control - Behavioral
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

entity Control is
  Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
       PC_LdEn : out STD_LOGIC;
           PC_sel : out STD_LOGIC;
           RF_WrData_sel : out STD_LOGIC;
           RegDst : out STD_LOGIC;
           ImmExt : out STD_LOGIC_VECTOR (1 downto 0);
           zero : in STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           ALU_func : out STD_LOGIC_VECTOR (3 downto 0);
           byteOp : out STD_LOGIC;
           MEMSTAGE_WR_EN : out STD_LOGIC;
           clk : in STD_LOGIC;
		rst : in std_logic;
           RegWr : out STD_LOGIC);

end Control;

architecture Behavioral of Control is


begin
  
ALUSrc<=
'0'  when 
instruction(31 downto 26) ="100000" or
instruction(31 downto 26) ="111111" or
instruction(31 downto 26) ="000000" or
instruction(31 downto 26) ="000001" else
'1' ;
ALU_func<=
"0000" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="110000" else
"0001" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="110001" else
"0010" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="110010" else
"0011" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="110011" else
"0100" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="110100" else
"0101" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="110101" else
"0110" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="110110" else
"1000" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="111000" else
"1001" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="111001" else
"1010" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="111010" else
"1100" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="111100" else
"1101" WHEN instruction(31 downto 26)="100000" and instruction(5 downto 0)="111101" else

"1010" WHEN  instruction(31 downto 26)="111010" else
"1101" WHEN  instruction(31 downto 26)="111101" else
"0011" WHEN  instruction(31 downto 26)="111000" else
"0011" WHEN  instruction(31 downto 26)="111001" else
"0000" WHEN  instruction(31 downto 26)="110000" else
"0101" WHEN  instruction(31 downto 26)="110010" else
"0011" WHEN  instruction(31 downto 26)="110011" else
"0001" WHEN  instruction(31 downto 26)="111111" else
"0001" WHEN  instruction(31 downto 26)="000000" else
"0001" WHEN  instruction(31 downto 26)="000001" else
"0000" WHEN  instruction(31 downto 26)="000011" else
"0000" WHEN  instruction(31 downto 26)="000111" else
"0000" WHEN  instruction(31 downto 26)="001111" else
"0000" WHEN  instruction(31 downto 26)="011111" else

"1111"; 

PC_LdEn<='1';

PC_sel<=
'1'  WHEN
 instruction(31 downto 26)="111111" or
(instruction(31 downto 26)="000000" and zero = '1') or 

(instruction(31 downto 26)="000001" and  zero = '0')  else
'0' ;
ImmExt<=
"00" when

 instruction(31 downto 26)="110010" or
 instruction(31 downto 26)="110011" 
 else

"10" when

 instruction(31 downto 26)="111111" or
 instruction(31 downto 26)="000000" or
 instruction(31 downto 26)="000001" else
"11" when
 instruction(31 downto 26)="111001" else
"01";

 
MEMSTAGE_WR_EN<=
'1'  when
 instruction(31 downto 26)="000111" or
 instruction(31 downto 26)="011111" else
'0' ;
byteOp<=
'1'  when 
 instruction(31 downto 26)="000011" or
 instruction(31 downto 26)="000111" else
'0' ;  
RF_WrData_sel<=
'1' when 
 instruction(31 downto 26)="000011" or
 instruction(31 downto 26)="001111" else
'0' ;  
RegDst<=
'0'  when instruction(31 downto 26) ="100000" else
'1' ;
RegWr<='1' when
 instruction(31 downto 26)="100000" or
 instruction(31 downto 26)="111000" or
 instruction(31 downto 26)="111001" or
 instruction(31 downto 26)="110000" or
 instruction(31 downto 26)="110010" or
 instruction(31 downto 26)="110011" or
 instruction(31 downto 26)="000011" or
 instruction(31 downto 26)="001111" else '0'
 

;


end Behavioral;