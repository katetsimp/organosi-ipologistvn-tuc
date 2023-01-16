----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 07:54:14 PM
-- Design Name: 
-- Module Name: testbench_ifstage - Behavioral
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

entity testbench_ifstage is
--  Port ( );
end testbench_ifstage;

architecture Behavioral of testbench_ifstage is
component ifstage
Port ( PC_Immed : in STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in STD_LOGIC;
           PC_LdEn : in STD_LOGIC;
           Reset : in STD_LOGIC;
           CLk : in STD_LOGIC;
           PCi : inout STD_LOGIC_VECTOR (31 downto 0));
end component;
signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal PC_Sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal PCi : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IFSTAGE PORT MAP (
          PC_Immed => PC_Immed,
          PC_Sel => PC_Sel,
          PC_LdEn => PC_LdEn,
          Reset => Reset,
          Clk => Clk,
          PCi => PCi
        );
   

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
      Reset<='1';	
    wait for 100 ns;
      -- hold reset state for 100 ns.
		PC_Immed<="00000000000000000000000000000001"; -- thesh mhden
		PC_Sel<='0'; --PC+4
		PC_LdEn<='0';
		Reset<='0';
		
      wait for 100 ns;

		PC_Immed<="00000000000000000000000000000011";
		PC_Sel<='0';
		PC_LdEn<='1';
		Reset<='0';
		
      wait for 100 ns;

		PC_Immed<="00000000000000000000000000000000";
		PC_Sel<='0';
		PC_LdEn<='1';
		Reset<='0';
		
      wait for 100 ns;

		PC_Immed<="00000000000000000000000000010000";
		PC_Sel<='1';--PC+4+Immediate
		PC_LdEn<='1';
		Reset<='0';
		
      wait for 100 ns;

		PC_Immed<="00000000000000000000000000000000";
		PC_Sel<='0';
		PC_LdEn<='1';
		Reset<='0';
		
      wait for 100 ns;

		PC_Immed<="00000000000000000000000000010000"; -- Immed=(+4)
		PC_Sel<='0'; -- PC +4
		PC_LdEn<='1';
		Reset<='0';
		
      wait for 100 ns;

		PC_Immed<="00000000000000000000000000000011";-- Immed=(+3)
		PC_Sel<='1'; --PC+4+Immed
		PC_LdEn<='1';
		Reset<='0';
		
      wait for 100 ns;

		PC_Immed<="00000000000000000000000000000000";
		PC_Sel<='0';
		PC_LdEn<='1';
		Reset<='0';
		
      wait for 100 ns;		

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;


