----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2021 06:57:01 PM
-- Design Name: 
-- Module Name: MUX5 - Behavioral
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

entity MUX5 is
Port ( mux5_c : in STD_LOGIC;
           mux5_out : out STD_LOGIC_VECTOR (4 downto 0);
           X0 : in STD_LOGIC_VECTOR (4 downto 0);
           X1 : in STD_LOGIC_VECTOR (4 downto 0));
end MUX5;

architecture Behavioral of mux5 is
signal mux_out_t:std_logic_vector(4 downto 0);
begin
process(mux5_c,mux_out_t,X0,X1)
begin
case(mux5_c) is
when'0'=>
mux_out_t<=X0 ;
when'1'=>
mux_out_t<=X1;
when others=>
mux_out_t<=mux_out_t;
end case;

end process;
mux5_out<=mux_out_t after 10 ns;
end ;
