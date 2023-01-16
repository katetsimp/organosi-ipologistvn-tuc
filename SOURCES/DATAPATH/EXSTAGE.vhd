----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2021 04:53:28 PM
-- Design Name: 
-- Module Name: EXSTAGE - Behavioral
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

entity EXSTAGE is
    Port ( RF_A : in STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in STD_LOGIC_VECTOR (31 downto 0);
           Immed : in STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in STD_LOGIC;
           ALU_func : in STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out STD_LOGIC_VECTOR (31 downto 0);
           ALU_zero : out STD_LOGIC);
end EXSTAGE;

architecture Behavioral of EXSTAGE is
component mux2
port(mux_c : in STD_LOGIC;
           mux_out : out STD_LOGIC_VECTOR (31 downto 0);
           X0 : in STD_LOGIC_VECTOR (31 downto 0);
           X1 : in STD_LOGIC_VECTOR (31 downto 0));
           end component;
 component ALU 
 port(
 A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Op : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0);
           Zero : out STD_LOGIC;
           Cout : out STD_LOGIC;
           Ovf : out STD_LOGIC);
           end component;
 signal mux_out_t:STD_LOGIC_VECTOR (31 downto 0);
 signal cout : STD_LOGIC;
	signal ovfl : STD_LOGIC;

begin
mux_in_ex:mux2
port map(
mux_c=>ALU_Bin_sel,
mux_out=>mux_out_t,
X0=>RF_B,
X1=>Immed);
Alu_IN_EX:ALU
port map(
A=>RF_A,
B=>mux_out_t,
OP=>ALU_FUNC,
Output=>ALU_OUT,
zero=>ALU_zero,
Cout=>cout,
ovf=>ovfl
);






end Behavioral;
