----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2021 07:00:46 PM
-- Design Name: 
-- Module Name: Ram_testbench - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ram_testbench is
--  Port ( );
end Ram_testbench;

architecture Behavioral of Ram_testbench is
component ram
port(
CLK : in STD_LOGIC;
           Inst_addr : in STD_LOGIC_VECTOR (10 downto 0);
           Inst_dout : out STD_LOGIC_VECTOR (31 downto 0);
           data_we : in STD_LOGIC;
           data_addr : in STD_LOGIC_VECTOR (10 downto 0);
           data_din : in STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal CLK:STD_LOGIC;
signal Inst_addr : STD_LOGIC_VECTOR (10 downto 0);
signal Inst_dout : STD_LOGIC_VECTOR (31 downto 0);
signal data_we :  STD_LOGIC;
signal data_addr :  STD_LOGIC_VECTOR (10 downto 0);
signal data_din :  STD_LOGIC_VECTOR (31 downto 0);
signal data_dout : STD_LOGIC_VECTOR (31 downto 0);
constant Clk_period : time := 120 ns;


begin
uut: RAM PORT MAP (
clk=>clk,
Inst_addr=>Inst_addr,
Inst_dout=>Inst_dout,
data_we=>data_we,
data_addr=>data_addr,
data_din=>data_din,
data_dout=>data_dout);
Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
   stimulus :process
   begin
   for i in 0 to 2047 loop
   inst_addr<=std_logic_vector(to_unsigned(i,inst_addr'length));
   data_addr<=std_logic_vector(to_unsigned(i,data_addr'length));
    
   wait for 100 ns;
   end loop;
  data_we<='1';
   data_addr<="00000000111";
   data_din<="00001111000011110000111100001111";
   wait;
   end process;
end Behavioral;
