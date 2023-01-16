----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2021 07:56:45 PM
-- Design Name: 
-- Module Name: testbench_decstage - Behavioral
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

entity testbench_decstage is
--  Port ( );
end testbench_decstage;

architecture Behavioral of testbench_decstage is
component decstage
port(
INSTR : in STD_LOGIC_VECTOR (31 downto 0);
           RF_WREN : in STD_LOGIC;
           ALU_OUT : in STD_LOGIC_VECTOR (31 downto 0);
           MEM_OUT : in STD_LOGIC_VECTOR (31 downto 0);
           RF_WRDATA_SEL : in STD_LOGIC;
           RF_B_SEL : in STD_LOGIC;
           Immext : in STD_LOGIC_VECTOR (1 downto 0);
           Clk : in STD_LOGIC;
           Immed : out STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out STD_LOGIC_VECTOR (31 downto 0);
           RESET:IN STD_LOGIC);
           end component;
           --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_Sel : std_logic := '0';
   signal RF_B_Sel : std_logic := '0';
   signal Clk : std_logic := '0';
   signal RESET: STD_LOGIC:='0';
   signal Immext : STD_LOGIC_VECTOR (1 downto 0):= (others => '0');

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);
 constant Clk_period : time := 100 ns;
begin
 uut: DECSTAGE PORT MAP (
          Instr => Instr,
          Reset=>reset,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_Sel => RF_WrData_Sel,
          RF_B_Sel => RF_B_Sel,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B,
          immext=>immext
        );
Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 stim_proc: process
   begin		
      
        reset<='1';
          wait for 150 ns;
          reset<='0';
		
		Instr<="10000000000000010000000000000000";
		RF_WrEn<='1';
		ALU_out<="00000000000000000000000000000001";
		MEM_out<="00000000000000000000000000000000";
		RF_WrData_Sel<='0';--ALU
		RF_B_Sel<='0';
		Immext<="00";
		
		
      wait for 150 ns;
		
		reset<='0';
		Instr<="10000000001100000000000000000000";
		RF_WrEn<='1';
		ALU_out<="00000000000000000000000000000011";
		MEM_out<="00000000000000000000000000000000";
		RF_WrData_Sel<='0';--ALU
		RF_B_Sel<='0';
		Immext<="01";
		
      wait for 150 ns;
	
		reset<='0';
		Instr<="11001000001000001000000100000110";
		RF_WrEn<='0';
		ALU_out<="00000000000000000000000000000000";
		MEM_out<="00000000110000000000000000000011";
		RF_WrData_Sel<='1';
		RF_B_Sel<='0';
		Immext<="10";
      wait for 150 ns;
	
		Instr<="11100100001100001000000011000011";
		RF_WrEn<='0';
		ALU_out<="00000000000000000000000000000000";
		MEM_out<="00000000000000000000000000000000";
		RF_WrData_Sel<='0';
		RF_B_Sel<='1';
		Immext<="11";
		
      wait for 150 ns;
		
		Instr<="11100000000000111000011111000000";
		RF_WrEn<='1';
		ALU_out<="00000000000000000000000000000000";
		MEM_out<="00000000000000000000000000000011";
		RF_WrData_Sel<='1';
		RF_B_Sel<='0';
		Immext<="00";
      wait for 150 ns;
		
		Instr<="00000000000000110001100000000000";
		RF_WrEn<='0';
		ALU_out<="00000000000000000000000000000000";
		MEM_out<="11000000000000000000000000000000";
		RF_WrData_Sel<='1';--MEM
		RF_B_Sel<='0';--
		-- sign extend and shift left 2 (Immed)
      wait for 150 ns;	

      wait for Clk_period*10;

   

      wait;
   end process;

END;


