----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 01:08:08 PM
-- Design Name: 
-- Module Name: ALU_TESTBENCH - Behavioral
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

entity ALU_TESTBENCH is
--  Port ( );
end ALU_TESTBENCH;

ARCHITECTURE behavior OF ALU_TESTBENCH IS 

    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Output=> Output,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
        );
stim_proc: process
   begin		
    		
		A  <= "01111111111111111111111111111111";
		B  <=	"00000000000000000000000000000001";
		Op <= "0000";
      wait for 50 ns;
		A  <= "10111111111111111111111111111111";
		B  <=	"10111111111111111111111111111111";
		Op <= "0000";
		wait for 50 ns;
		A  <= "00000000000000000000000000000001";
		B  <=	"00000000000000000000000000000010";
		Op <= "0000";
      wait for 50 ns;
		A  <= "11111111111111111111111111111110";
		B  <=	"11111111111111111111111111111111";
		Op <= "0000";
		wait for 50 ns;
		A  <= "01000000000000010000000000000000";
		B  <=	"01000000000000010000000000000000";
		Op <= "0001";
      wait for 50 ns;
		A  <= "11000000000000010000000000000000";
		B  <=	"01000000000000010000000000000000";
		Op <= "0001";
      wait for 50 ns;
		A  <= "11000000000000010000000000000000";
		B  <=	"01000000000000010000000000000000";
		Op <= "0010";
		wait for 50 ns;
		A  <= "11000000000000010000000000000000";
		B  <=	"01000000000000010000000000000000";
		Op <= "0011";
		wait for 50 ns;
		A  <= "11000000000000010000000000000000";
		B  <=	"01000000000000010000000000000000";
		Op <= "0100";
		wait for 50 ns;
		A  <= "11000000000000010000001111100000";
		Op <= "1000";
		wait for 50 ns;
		A  <= "11000000000000010000000001000001";
		Op <= "1001";
		wait for 50 ns;
		A  <= "11000000000000010000000000100000";
		Op <= "1010";
		wait for 50 ns;
		A  <= "11000011000000010000000000000001";
		Op <= "1100";
		wait for 50 ns;
		A  <= "11000000000000010011000000000000";
		Op <= "1101";
		wait for 50 ns;
		---
      wait;
	 
   end process;




end;
