----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 04:27:54 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
    Port ( C : in STD_LOGIC_VECTOR (4 downto 0);
           X0 : in STD_LOGIC_VECTOR (31 downto 0);
           X1 : in STD_LOGIC_VECTOR (31 downto 0);
           X2 : in STD_LOGIC_VECTOR (31 downto 0);
           X3 : in STD_LOGIC_VECTOR (31 downto 0);
           X4 : in STD_LOGIC_VECTOR (31 downto 0);
           X5 : in STD_LOGIC_VECTOR (31 downto 0);
           X6 : in STD_LOGIC_VECTOR (31 downto 0);
           X7 : in STD_LOGIC_VECTOR (31 downto 0);
           X8 : in STD_LOGIC_VECTOR (31 downto 0);
           X9: in STD_LOGIC_VECTOR (31 downto 0);
           X10 : in STD_LOGIC_VECTOR (31 downto 0);
           X11 : in STD_LOGIC_VECTOR (31 downto 0);
           X12 : in STD_LOGIC_VECTOR (31 downto 0);
           X13 : in STD_LOGIC_VECTOR (31 downto 0);
           X14 : in STD_LOGIC_VECTOR (31 downto 0);
           X15 : in STD_LOGIC_VECTOR (31 downto 0);
           X16 : in STD_LOGIC_VECTOR (31 downto 0);
           X17 : in STD_LOGIC_VECTOR (31 downto 0);
           X18 : in STD_LOGIC_VECTOR (31 downto 0);
           X19 : in STD_LOGIC_VECTOR (31 downto 0);
           X20 : in STD_LOGIC_VECTOR (31 downto 0);
           X21 : in STD_LOGIC_VECTOR (31 downto 0);
           X22 : in STD_LOGIC_VECTOR (31 downto 0);
           X23 : in STD_LOGIC_VECTOR (31 downto 0);
           X24 : in STD_LOGIC_VECTOR (31 downto 0);
           X25 : in STD_LOGIC_VECTOR (31 downto 0);
           X26 : in STD_LOGIC_VECTOR (31 downto 0);
           X27 : in STD_LOGIC_VECTOR (31 downto 0);
           X28 : in STD_LOGIC_VECTOR (31 downto 0);
           X29 : in STD_LOGIC_VECTOR (31 downto 0);
           X30 : in STD_LOGIC_VECTOR (31 downto 0);
           X31 : in STD_LOGIC_VECTOR (31 downto 0);
           D : out STD_LOGIC_VECTOR (31 downto 0));
end mux;

architecture Behavioral of mux is
signal D_t:std_logic_vector(31 downto 0);
begin
process(C,D_t,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31)
begin
case(C) is
when"00000"=>
D_t<=X0;
when"00001"=>
D_t<=X1;
when"00010"=>
D_t<=X2;
when"00011"=>
D_t<=X3;
when"00100"=>
D_t<=X4;
when"00101"=>
D_t<=X5;
when"00110"=>
D_t<=X6;
when"00111"=>
D_t<=X7;
when"01000"=>
D_t<=X8;
when"01001"=>
D_t<=X9;
when"01010"=>
D_t<=X10;
when"01011"=>
D_t<=X11;
when"01100"=>
D_t<=X12;
when"01101"=>
D_t<=X13;
when"01110"=>
D_t<=X14;
when"01111"=>
D_t<=X15;
when"10000"=>
D_t<=X16;
when"10001"=>
D_t<=X17;
when"10010"=>
D_t<=X18;
when"10011"=>
D_t<=X19;
when"10100"=>
D_t<=X20;
when"10101"=>
D_t<=X21;
when"10110"=>
D_t<=X22;
when"10111"=>
D_t<=X23;
when"11000"=>
D_t<=X24;
when"11001"=>
D_t<=X25;
when"11010"=>
D_t<=X26;
when"11011"=>
D_t<=X27;
when"11100"=>
D_t<=X28;
when"11101"=>
D_t<=X29;
when"11110"=>
D_t<=X30;
when"11111"=>
D_t<=X31;
when others=>
D_t<=D_t;
end case;
end process;
D<=D_t after 10ns;
end Behavioral;
