----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 03:15:34 AM
-- Design Name: 
-- Module Name: proc_sc_testbench - Behavioral
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




-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity proc_sc_testbench is
end;

architecture bench of proc_sc_testbench is

  component PROC_SC
    Port (clk : in STD_LOGIC;
    		rst : in STD_LOGIC
    );
  end component;

  signal clk: STD_LOGIC;
  signal rst: STD_LOGIC ;
   constant CLK_period : time := 100 ns;

begin

  uut: PROC_SC port map ( clk => clk,
                          rst => rst );
                           CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

  stimulus: process
  begin
  
    rst<='1';
    wait for 5*CLK_period;
    rst<='0';
    wait for 1*CLK_period;
     
    

   

    wait;
  end process;


end;

