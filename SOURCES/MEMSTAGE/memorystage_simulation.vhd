----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2021 03:36:33 AM
-- Design Name: 
-- Module Name: memorystage_simulation - Behavioral
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

entity memorystage_simulation is
--  Port ( );
end memorystage_simulation;

architecture Behavioral of memorystage_simulation is
component memstage
Port ( CLK : in STD_LOGIC;
           ByteOp : in STD_LOGIC;
           Mem_WrEn : in STD_LOGIC;
           ALU_MEM_Addr : in STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out STD_LOGIC_VECTOR (31 downto 0);
           MM_Addr : out STD_LOGIC_VECTOR (31 downto 0);
           MM_WrEn : out STD_LOGIC;
           MM_WrData : out STD_LOGIC_VECTOR (31 downto 0);
           MM_RdData : in STD_LOGIC_VECTOR (31 downto 0));
end component;
           signal CLK :  STD_LOGIC;
           signal  ByteOp :  STD_LOGIC;
           signal Mem_WrEn : STD_LOGIC;
           signal ALU_MEM_Addr : STD_LOGIC_VECTOR (31 downto 0);
           signal MEM_DataIn : STD_LOGIC_VECTOR (31 downto 0);
           signal MEM_DataOut :  STD_LOGIC_VECTOR (31 downto 0);
           signal MM_Addr : STD_LOGIC_VECTOR (31 downto 0);
           signal MM_WrEn :  STD_LOGIC;
           signal MM_WrData :  STD_LOGIC_VECTOR (31 downto 0);
           signal MM_RdData :  STD_LOGIC_VECTOR (31 downto 0);

constant CLK_period : time := 120 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memstage PORT MAP (
   CLK=>CLK,
   ByteOp=>ByteOp,
   Mem_WrEn=>Mem_WrEn,
   ALU_MEM_Addr=>ALU_MEM_Addr,
   MEM_DataIn=>MEM_DataIn,
   MEM_DataOut=>MEM_DataOut,
   MM_Addr=>MM_Addr,
   MM_WrEn=>MM_WrEn,
   MM_WrData=>MM_WrData,
   MM_RdData=>MM_RdData);
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
   ByteOp<='0';
   Mem_WrEn<='0';
   ALU_MEM_Addr<="00000000000000000000000000000000";
   MEM_DataIn<="00000000000000000000000000000000";
   MM_RdData<="00000000000000000000000000000000";
   wait for 120 ns;
   ByteOp<='1';
   Mem_WrEn<='0';
   ALU_MEM_Addr<="00000000000000001000000000000001";
   MEM_DataIn<="00000100000000000010000000000001";
   MM_RdData<="10001000000000100000100000000001";
   wait for 120 ns;
   wait;
   end process;
   

end Behavioral;
