----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 01:05:46 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Op : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0);
           Zero : out STD_LOGIC;
           Cout : out STD_LOGIC;
           Ovf : out STD_LOGIC);
           
end ALU;

architecture Behavioral of ALU is
signal temp_out:STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
signal zero_t:std_logic:='0';
signal Cout_t:std_logic:='0';
signal Ovf_t:std_logic:='0';
signal addition : std_logic_vector(32 downto 0);
begin
process(A ,B,Op,zero_t,temp_out,Cout_t,Ovf_t,addition)
begin
case(Op) is
when "0000"=>
addition<= ('0'&A)+('0'&B); --addition
ovf_t<=((A(31) and B(31) and (not addition(31))) or ( (not A(31)) and (not B(31)) and addition(31) ));
Cout_t<= addition(32);
temp_out<=addition(31 downto 0);
when "0001"=>
addition<= ('0'&A)+('0'&NOT(B-1)); --sub
 ovf_t<=((A(31) and B(31) and (not addition(31))) or ( (not A(31)) and (not B(31)) and addition(31) ));
Cout_t<= addition(32);
temp_out<=addition(31 downto 0);


when "0010"=>
temp_out<= A and B; --Logical and 
Cout_t<='0';
ovf_t<='0';
when "0011"=>
temp_out<= A or B;--Logical or
Cout_t<='0';
ovf_t<='0';
when "0100"=>
temp_out<= not A;--Logical NOT
Cout_t<='0';
ovf_t<='0';
when "0101"=>
temp_out<= A Nand B;--Logical NAND
Cout_t<='0';
ovf_t<='0';
when "0110"=>
temp_out<= A NOR B;--Logical NOR
ovf_t<='0';
Cout_t<='0';
when "1000"=>
temp_out<= A(31)&A(31 downto 1);-- ARITH SIFT RIGHT
ovf_t<='0';
Cout_t<='0';
when "1001"=>
temp_out<= '0'&A(31 downto 1);-- LOGICAL SIFT RIGHT
ovf_t<='0';
Cout_t<='0';
when "1010"=>
temp_out<= A(30 downto 0)&'0';-- LOGICAL SIFT LEFT
ovf_t<='0';
Cout_t<='0';
when "1100"=>
temp_out<= A(30 downto 0)& A(31);-- ROTATE LEFT
ovf_t<='0';
Cout_t<='0';
when "1101"=>
temp_out<= A(0)&A(31 downto 1);-- ROTATE RIGHT
ovf_t<='0';
Cout_t<='0';
when others=>
temp_out<=temp_out;
end case;
if(temp_out="00000000000000000000000000000000")then
zero_t<='1';
else
zero_t<='0';
end if;

end process;
 

Output<=temp_out after 10ns;
Zero<=zero_t after 10ns;
Cout<=Cout_t after 10ns;
ovf<=ovf_t after 10ns;




end Behavioral;

