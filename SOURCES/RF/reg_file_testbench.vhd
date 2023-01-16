----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 08:36:01 PM
-- Design Name: 
-- Module Name: reg_file_testbench - Behavioral
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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_RegisterFile IS
END test_RegisterFile;
 
ARCHITECTURE behavior OF test_RegisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rf
    PORT(
         ANDR1 : IN  std_logic_vector(4 downto 0);
         ANDR2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         WREN : IN  std_logic;
         CLK : IN  std_logic;
         RESET : in STD_LOGIC;
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ANDR1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ANDR2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal WREN : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RESET:std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 120 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rf PORT MAP (
          ANDR1 => ANDR1,
          ANDR2 => ANDR2,
          Awr => Awr,
          Dout1 => Dout1,
          Dout2 => Dout2,
          Din => Din,
          WREN => WREN,
          CLK => CLK,
          RESET=>RESET
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      Reset<='1';
      wait for 120 ns;
   		Andr1 <= "01000";
		Andr2 <= "00010";
   	   Awr  <= "00101";
   	   Din  <= "00000011110001010101100000000000";
       wait for 120 ns;
		
		RESET<='0';
   		WrEn <= '1';-- grafei ston kataxwrhth (alla den exei entolh na to diabasei)
		Awr  <= "00101";
		Din  <= "00000011110001010101100000000000";
      wait for 120 ns;
		ANDR1 <= "00101";
		Awr  <= "00100";
		Din  <= "00000011110001010101100000000111";
		WrEn <= '1';
      wait for 120 ns;
		--blepoyme sthn eksodo duo diaforetikes dieuthhnseis
		ANDR2 <= "00101";
		ANDR1 <= "00100";
		WrEn <= '1';
      wait for 120 ns;
	
		ANDR1 <= "00000";
		Awr  <= "00000";
		Din  <= "11111111110001010101100000000111";
		WrEn <= '1';
      wait for 120 ns;
		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
