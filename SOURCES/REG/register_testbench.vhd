----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 06:31:18 PM
-- Design Name: 
-- Module Name: register_testbench - Behavioral
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

entity register_testbench is
--  Port ( );
end register_testbench;

architecture Behavioral of register_testbench is
Component reg
port(
CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DATAIN : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           DATAOUT : out STD_LOGIC_VECTOR (31 downto 0));
end Component;
signal RESET,CLK,WE:STD_LOGIC;
signal DATAIN:STD_LOGIC_VECTOR (31 downto 0);
signal DATAOUT: STD_LOGIC_VECTOR (31 downto 0);
constant Clk_period:time:=100ns;

begin
uut: reg PORT MAP (
          RESET => RESET,
          CLK => CLK,
          WE => WE,
          DATAIN=> DATAIN,
          DATAOUT => DATAOUT
         
        );
        DATAIN<="10000000000000000000000000000000";
Clk_process: process
begin
Clk<='0';
wait for Clk_period/2; -- in the half of the period  became 0
Clk<='1';
wait for Clk_period/2;-- in the half of the period  became 1
end process;
stim_proc: process
 begin
 RESET<='1';
 WE<='0';
 wait for 50ns;	
 RESET<='0';
 WE<='0';
 wait for 50ns;	
 RESET<='0';
 WE<='1';
 wait for 50ns;	
 wait;
 end process;


end Behavioral;
