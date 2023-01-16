----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 06:11:28 PM
-- Design Name: 
-- Module Name: addersignexit - Behavioral
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

entity addersignexit is
    Port ( PC_I : in STD_LOGIC_VECTOR (31 downto 0);
           ADDER4OUT : in STD_LOGIC_VECTOR (31 downto 0);
           ExitOFADDER : out STD_LOGIC_VECTOR (31 downto 0));
end addersignexit;

architecture Behavioral of addersignexit is
Component fulladder
Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
end component;

signal carry:STD_LOGIC_VECTOR (32 downto 0);
begin
carry(0)<='0';

fullad:
for i in 0 to 31 generate
adder:fulladder port map(A=>PC_I(i),
                         B=>ADDER4OUT(i),
                         Cin=>carry(i),
                         S=>ExitOFADDER(i),
                         Cout=> carry(i+1));
                         
              end generate;          


end Behavioral;
