----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2021 03:24:57 AM
-- Design Name: 
-- Module Name: adder_400 - Behavioral
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

entity adder_400 is
Port ( ALU_OUT : in STD_LOGIC_VECTOR (31 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (31 downto 0));
end adder_400;
architecture Behavioral of adder_400 is
COMPONENT fulladder
port( A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
 end component;
signal carry:STD_LOGIC_VECTOR (32 downto 0);
signal X:STD_LOGIC_VECTOR (31 downto 0);
begin
carry(0)<='0';
X<="00000000000000000000000110010000";
MAKETHE32BITADDER:
	for i in 0 to 31 generate
adder:fulladder port map(A=>ALU_OUT(i),
                         B=>X(i),
                         Cin=>carry(i),
                         S=>OUTPUT(i),
                         Cout=> carry(i+1));
                         
              end generate;          






end Behavioral;
