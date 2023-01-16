----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 02:14:19 PM
-- Design Name: 
-- Module Name: REG - Behavioral
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

entity REG is
Port  ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DATAIN : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           DATAOUT : out STD_LOGIC_VECTOR (31 downto 0));
end REG;

architecture Behavioral of REG is
signal tmp: std_logic_vector(31 downto 0);
begin
PROCESS(CLK,tmp,reset,we)
begin
if(reset='1')then
tmp<="00000000000000000000000000000000";
elsif (CLK'EVENT AND CLK='1')then 
if(we='1') then 
tmp<= DATAIN;
ELSE
tmp <= tmp;
	end if;
	END IF;
end process;	
DATAOUT <=tmp after 10 ns;


end Behavioral;
