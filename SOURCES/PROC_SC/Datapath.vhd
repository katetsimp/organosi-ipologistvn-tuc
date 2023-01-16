----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 03:17:02 PM
-- Design Name: 
-- Module Name: Datapath - Behavioral
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

entity Datapath is
 Port ( PC_LdEn : in STD_LOGIC;
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
end Datapath;


architecture Behavioral of Datapath is
component IFSTAGE
PORT(
          PC_Immed : in STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in STD_LOGIC;
           PC_LdEn : in STD_LOGIC;
           Reset : in STD_LOGIC;
           CLk : in STD_LOGIC;
           PCi : inout STD_LOGIC_VECTOR (31 downto 0));
           END COMPONENT;
component DECSTAGE 
PORT(
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
           END COMPONENT;
  COMPONENT EXSTAGE
  Port ( RF_A : in STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in STD_LOGIC_VECTOR (31 downto 0);
           Immed : in STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in STD_LOGIC;
           ALU_func : in STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out STD_LOGIC);
           END COMPONENT ;
  COMPONENT MEMSTAGE
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
           END COMPONENT;
           
signal ALU_out : STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
	signal Immed : STD_LOGIC_VECTOR(31 downto 0);
	signal RF_A : STD_LOGIC_VECTOR(31 downto 0);
	signal RF_B : STD_LOGIC_VECTOR(31 downto 0);
	signal MEM_DataOut : STD_LOGIC_VECTOR(31 downto 0);
begin
ifstage1:ifstage
port map(
PC_Immed=>immed,
PC_sel=>PC_sel,
PC_LdEn=>PC_LdEn,
RESET=>rst,
CLK=>CLK,
PCi=>PC);
decstage1:decstage
port map(
INSTR=>instruction,
RF_WREN=>regWr,
ALU_OUT=>ALU_out,
MEM_OUT=>MEM_DataOut,
RF_WrData_sel=>RF_WrData_sel,
RF_B_sel=>RegDst,
ImmExt=>ImmExt,
clk=>clk,
Immed=>Immed,
RF_A=>RF_A,
RF_B=>RF_B,
RESET=>rst);
exstage1:exstage
port map(
RF_A=>RF_A,
RF_B=>RF_B,
Immed=>immed,
ALU_Bin_sel=>ALUsrc,
ALU_func=>ALU_func,
ALU_out=>ALU_out,
ALU_zero=>zero);
memstage1:memstage
port map(
CLK=>clk,
ByteOp=>ByteOp,
Mem_WrEn=>MEMSTAGE_WR_EN,
ALU_MEM_Addr=>ALU_OUT,
MEM_DataIn=>RF_B,
MEM_DataOut=>MEM_DataOut,
MM_Addr=>MM_Addr,
MM_WrEn=>MemWr,
MM_WrData=>MM_WrData,
MM_RdData=>MM_RdData);








end Behavioral;
