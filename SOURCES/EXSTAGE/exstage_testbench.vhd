----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2021 05:16:12 PM
-- Design Name: 
-- Module Name: exstage_testbench - Behavioral
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

entity exstage_testbench is
--  Port ( );
end exstage_testbench;

architecture Behavioral of exstage_testbench is
 COMPONENT exstage
    PORT(
         RF_A : IN  std_logic_vector(31 downto 0);
         RF_B : IN  std_logic_vector(31 downto 0);
         Immed : IN  std_logic_vector(31 downto 0);
         ALU_Bin_Sel : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         ALU_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RF_A : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_Sel : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: exstage PORT MAP (
          RF_A => RF_A,
          RF_B => RF_B,
          Immed => Immed,
          ALU_Bin_Sel => ALU_Bin_Sel,
          ALU_func => ALU_func,
          ALU_out => ALU_out
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      ---PROSTHESI -- diaforetiko prosimo me carry out
		RF_A  <= "11000000000000000000000001000000";
		RF_B  <= "01000000000000000000000001000010";
		Immed <= "01000000000000000000000001000010";
		ALU_Bin_Sel <= '0';
		ALU_func <= "0000";
		wait for 100 ns;
		
		---PROSTHESI -- apotelesma 0
		RF_A  <= "01000000000000000000000000000000";
		RF_B  <= "01000000000000000000000001000010";
		Immed <= "11000000000000000000000000000000";
		ALU_Bin_Sel <= '1';
		ALU_func <= "0000";
		wait for 100 ns;
		
		---AFAIRESI -- me carry out kai overflow
		RF_A  <= "10000000000000000000000000000000";
		RF_B  <= "01000000000000000000000001000010";
		Immed <= "01000000000000000000000000000000";
		ALU_Bin_Sel <= '1';
		ALU_func <= "0001";

		wait for 100 ns;
		---AND
		RF_A  <= "11000000000000000000000000000011";
		RF_B  <= "11000000000000000000000000000011";
		Immed <= "01000000000000000000000000000000";
		ALU_Bin_Sel <= '0';
		ALU_func <= "0010";

		wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;



