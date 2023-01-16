----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2021 09:51:45 PM
-- Design Name: 
-- Module Name: TRANSFORM32 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TRANSFORM32 is
    Port ( INSTR0_15 : in STD_LOGIC_VECTOR (15 downto 0);
           IMMEX : in STD_LOGIC_VECTOR (1 downto 0);
           IMMEDi : out STD_LOGIC_VECTOR (31 downto 0));
end TRANSFORM32;

architecture Behavioral of TRANSFORM32 is
signal output:STD_LOGIC_VECTOR (31 downto 0);
begin
process(INSTR0_15,IMMEX,output)
begin
CASE(IMMEX) IS
WHEN "00"=>
output<=std_logic_vector(resize(unsigned(INSTR0_15(15 downto 0)), 32));--zero fill
WHEN"01"=>
output<=std_logic_vector(resize(signed(INSTR0_15(15 downto 0)), 32));--sign extend
WHEN"11"=>
output<=INSTR0_15(15 downto 0)&"0000000000000000";
WHEN"10"=>
output<=std_logic_vector(resize(signed(INSTR0_15(15 downto 0)&"00"), 32)) ;
WHEN OTHERS=>
output<=output;
END CASE;
END PROCESS;
IMMEDi<=output;

end Behavioral;
