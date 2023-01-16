----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 04:25:58 PM
-- Design Name: 
-- Module Name: Datapath_testbench - Behavioral
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

entity Datapath_testbench is
--  Port ( );
end Datapath_testbench;

architecture Behavioral of Datapath_testbench is
component datapath
port(
 PC_LdEn : in STD_LOGIC;
           PC_sel : in STD_LOGIC;
           RF_WrData_sel : in STD_LOGIC;
           RegDst : in STD_LOGIC;
           ImmExt : in STD_LOGIC_VECTOR (1 downto 0);
           zero : out STD_LOGIC;
           ALUSrc : in STD_LOGIC;
           ALU_func : in STD_LOGIC_VECTOR (3 downto 0);
           byteOp : in STD_LOGIC;
           MEMSTAGE_WR_EN : in STD_LOGIC;
           clk : in STD_LOGIC;
           RegWr : in STD_LOGIC;
           PC : inout STD_LOGIC_VECTOR(31 downto 0);
		   instruction : in std_logic_vector(31 downto 0);
            MM_RdData : in STD_LOGIC_VECTOR(31 downto 0);
		    MM_WrData : out STD_LOGIC_VECTOR(31 downto 0);
	   	    MM_Addr : out STD_LOGIC_VECTOR(31 downto 0);
           	MemWr : out STD_LOGIC;
           	rst : in STD_LOGIC);
           	end component;
   signal PC_LdEn :  STD_LOGIC;
   signal   PC_sel : STD_LOGIC;
   signal  RF_WrData_sel :  STD_LOGIC;
   signal  RegDst : STD_LOGIC;
   signal ImmExt :  STD_LOGIC_VECTOR (1 downto 0);
   signal zero :  STD_LOGIC;
   signal  ALUSrc :  STD_LOGIC;
   signal  ALU_func : STD_LOGIC_VECTOR (3 downto 0);
   signal byteOp :  STD_LOGIC;
   signal  MEMSTAGE_WR_EN : STD_LOGIC;
   signal  clk :  STD_LOGIC;
   signal  RegWr : STD_LOGIC;
   signal   PC :  STD_LOGIC_VECTOR(31 downto 0);
   signal instruction :  std_logic_vector(31 downto 0);
   signal   MM_RdData :  STD_LOGIC_VECTOR(31 downto 0);
	signal	 MM_WrData :  STD_LOGIC_VECTOR(31 downto 0);
	signal   MM_Addr :  STD_LOGIC_VECTOR(31 downto 0);
    signal   MemWr :  STD_LOGIC;
    signal  rst :  STD_LOGIC;    
    constant Clk_period:time:=50ns;  	

begin
uut: datapath PORT MAP(
PC_LdEn=>PC_LdEn,
PC_sel=>PC_sel,
RF_WrData_sel=>RF_WrData_sel,
RegDst=>RegDst,
ImmExt=>ImmExt,
zero=>zero,
ALUSrc=>ALUSrc,
ALU_func=>ALU_func,
byteOp=>byteOp,
MEMSTAGE_WR_EN=>MEMSTAGE_WR_EN,
clk=>clk,
RegWr=>RegWr,
PC=>PC,
instruction=>instruction,
MM_RdData=>MM_RdData,
MM_WrData=>MM_WrData,
MM_Addr=>MM_Addr,
MemWr=>MemWr,
rst=>rst);
Clk_process: process
begin
Clk<='0';
wait for Clk_period/2; -- in the half of the period  became 0
Clk<='1';
wait for Clk_period/2;-- in the half of the period  became 1
end process;
stim_proc: process
 begin
 rst<='1';
 PC_LdEn<='0';
 PC_sel<='0';
 RF_WrData_sel<='0';
 RegDst<='0';
 ImmExt<="00";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000000";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50ns;	
 rst<='0';
 PC_LdEn<='1';
 PC_sel<='0';
 RF_WrData_sel<='0';
 RegDst<='1';
 ImmExt<="01";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000000";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50ns;	
  rst<='0';
 PC_LdEn<='1';
 PC_sel<='0';
 RF_WrData_sel<='0';
 RegDst<='1';
 ImmExt<="01";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000000";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50ns;	
  rst<='0';
 PC_LdEn<='1';
 PC_sel<='1';
 RF_WrData_sel<='0';
 RegDst<='1';
 ImmExt<="11";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000001";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50ns;	
  rst<='0';
 PC_LdEn<='1';
 PC_sel<='1';
 RF_WrData_sel<='0';
 RegDst<='1';
 ImmExt<="00";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000001";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50ns;	
  rst<='0';
 PC_LdEn<='1';
 PC_sel<='1';
 RF_WrData_sel<='0';
 RegDst<='1';
 ImmExt<="01";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000001";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50 ns;
  rst<='0';
 PC_LdEn<='1';
 PC_sel<='1';
 RF_WrData_sel<='0';
 RegDst<='1';
 ImmExt<="11";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000001";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50 ns;
  rst<='0';
 PC_LdEn<='1';
 PC_sel<='1';
 RF_WrData_sel<='0';
 RegDst<='1';
 ImmExt<="10";
 ALUSrc<='0';
 ALU_func<="0000";
 byteOp<='0';
 MEMSTAGE_WR_EN<='0';
 RegWr<='0';
 instruction<="00000000000000000000000000000001";
 MM_RdData<="00000000000000000000000000000000";
 wait for 50ns;	

 wait;
 end process;

end Behavioral;
