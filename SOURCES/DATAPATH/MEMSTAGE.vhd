----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 03:06:26 PM
-- Design Name: 
-- Module Name: MEMSTAGE - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMSTAGE is
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
end MEMSTAGE;

architecture Behavioral of MEMSTAGE is
COMPONENT ADDER_400
PORT(
ALU_OUT : in STD_LOGIC_VECTOR (31 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (31 downto 0));
           END COMPONENT;
signal memory_adress : STD_LOGIC_VECTOR (31 downto 0);
begin
ADDER40:ADDER_400
port map(
ALU_OUT=>ALU_MEM_Addr,
OUTPUT=>memory_adress);
MM_Addr<=memory_adress;
MM_WrEn<=Mem_WrEn;
MEM_DataOut <= 	MM_RdData when byteOp = '0' else 
std_logic_vector(resize(signed(MM_RdData(7 downto 0)), 32)) when memory_adress(1 downto 0) = "00" else
						std_logic_vector(resize(signed(MM_RdData(15 downto 8)) ,32)) when memory_adress(1 downto 0) = "01" else
						std_logic_vector(resize(signed(MM_RdData(23 downto 16)) ,32)) when memory_adress(1 downto 0) = "10" else
						std_logic_vector(resize(signed(MM_RdData(31 downto 23)) ,32)) when memory_adress(1 downto 0) = "11";
		
	
		MM_WrData <= 	MEM_DataIn when byteOp = '0' else
						MM_RdData(31 downto 8)&MEM_DataIn(7 downto 0) when memory_adress(1 downto 0) = "00" else
						MM_RdData(31 downto 16) & MEM_DataIn(15 downto 8)&MM_RdData(7 downto 0) when memory_adress(1 downto 0) = "01" else
						MM_RdData(31 downto 24)&MEM_DataIn(23 downto 16)&MM_RdData(15 downto 0) when memory_adress(1 downto 0) = "10" else
						MEM_DataIn(31 downto 24)&MM_RdData(23 downto 0) when memory_adress(1 downto 0) = "11";



end Behavioral;
