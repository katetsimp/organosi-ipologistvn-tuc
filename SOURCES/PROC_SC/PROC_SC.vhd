----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 12:52:24 AM
-- Design Name: 
-- Module Name: PROC_SC - Behavioral
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

entity PROC_SC is
  Port (clk : in STD_LOGIC;
  		rst : in STD_LOGIC
  );
end PROC_SC;

architecture Behavioral of PROC_SC is
	
	component Control
		port(
			instruction    : in  STD_LOGIC_VECTOR(31 downto 0);
			PC_LdEn        : out STD_LOGIC;
			PC_sel         : out STD_LOGIC;
			RF_WrData_sel  : out STD_LOGIC;
			RegDst         : out STD_LOGIC;
			ImmExt         : out STD_LOGIC_VECTOR(1 downto 0);
			zero           : in  STD_LOGIC;
			ALUSrc         : out STD_LOGIC;
			ALU_func       : out STD_LOGIC_VECTOR(3 downto 0);
			byteOp         : out STD_LOGIC;
			MEMSTAGE_WR_EN : out STD_LOGIC;
			clk            : in  STD_LOGIC;
			rst            : in  std_logic;
			RegWr          : out STD_LOGIC
		);
	end component Control;
	
	component Datapath
		port(
			PC_LdEn        : in  STD_LOGIC;
			PC_sel         : in  STD_LOGIC;
			RF_WrData_sel  : in  STD_LOGIC;
			RegDst         : in  STD_LOGIC;
			ImmExt         : in  STD_LOGIC_VECTOR(1 downto 0);
			zero           : out STD_LOGIC;
			ALUSrc         : in  STD_LOGIC;
			ALU_func       : in  STD_LOGIC_VECTOR(3 downto 0);
			byteOp         : in  STD_LOGIC;
			MEMSTAGE_WR_EN : in  STD_LOGIC;
			clk            : in  STD_LOGIC;
			RegWr          : in  STD_LOGIC;
			PC             : inout STD_LOGIC_VECTOR(31 downto 0);
			instruction    : in  std_logic_vector(31 downto 0);
			MM_RdData      : in  STD_LOGIC_VECTOR(31 downto 0);
			MM_WrData      : out STD_LOGIC_VECTOR(31 downto 0);
			MM_Addr        : out STD_LOGIC_VECTOR(31 downto 0);
			MemWr          : out STD_LOGIC;
			rst            : in  STD_LOGIC
		);
	end component Datapath;

	component RAM
		port(
			clk       : in  std_logic;
			inst_addr : in  std_logic_vector(10 downto 0);
			inst_dout : out std_logic_vector(31 downto 0);
			data_we   : in  std_logic;
			data_addr : in  std_logic_vector(10 downto 0);
			data_din  : in  std_logic_vector(31 downto 0);
			data_dout : out std_logic_vector(31 downto 0)
		);
	end component RAM;
	signal instruction : STD_LOGIC_VECTOR(31 downto 0);
	signal PC_LdEn : STD_LOGIC;
	signal PC_sel : STD_LOGIC;
	signal RF_WrData_sel : STD_LOGIC;
	signal RegDst : STD_LOGIC;
	signal ImmExt : STD_LOGIC_VECTOR(1 downto 0);
	signal zero : STD_LOGIC;
	signal ALUSrc : STD_LOGIC;
	signal ALU_func : STD_LOGIC_VECTOR(3 downto 0);
	signal byteOp : STD_LOGIC;
	signal MEMSTAGE_WR_EN : STD_LOGIC;
	signal RegWr : STD_LOGIC;
	signal MemWr : STD_LOGIC;
	signal PC : STD_LOGIC_VECTOR(31 downto 0);
	signal MM_RdData : STD_LOGIC_VECTOR(31 downto 0);
	signal MM_WrData : STD_LOGIC_VECTOR(31 downto 0);
	signal MM_Addr : STD_LOGIC_VECTOR(31 downto 0);
		

begin
	
		controll:Control port map(
			instruction => instruction,
			PC_LdEn => PC_LdEn,
			PC_sel => PC_sel,
			RF_WrData_sel => RF_WrData_sel,
			RegDst => RegDst,
			ImmExt => ImmExt,
			zero => zero,
			ALUSrc => ALUSrc,
			ALU_func => ALU_func,
			byteOp => byteOp,
			MEMSTAGE_WR_EN => MEMSTAGE_WR_EN,
			clk => clk,
			rst => rst,
			RegWr => RegWr
		);
	
		datapathh:Datapath port map(
		PC_LdEn => PC_LdEn,
		PC_sel => PC_sel,
		RF_WrData_sel => RF_WrData_sel,
		RegDst => RegDst,
		ImmExt => ImmExt,
		zero => zero,
		ALUSrc => ALUSrc,
		ALU_func => ALU_func,
		byteOp => byteOp,
		MEMSTAGE_WR_EN => MEMSTAGE_WR_EN,
		clk => clk,
		RegWr => RegWr,
		PC => PC,
		instruction => instruction,
		MM_RdData => MM_RdData,
		MM_WrData => MM_WrData,
		MM_Addr => MM_Addr,
		MemWr => MemWr,
		rst => rst
	);
	
	data_memory:RAM port map(
		clk => clk,
		inst_addr => PC(12 downto 2),
		inst_dout => instruction,
		data_we => MemWr,
		data_addr => MM_Addr(10 downto 0 ),
		data_din => MM_WrData,
		data_dout => MM_RdData
	);


end Behavioral;

