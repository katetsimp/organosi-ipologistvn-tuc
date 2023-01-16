----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2021 09:48:08 PM
-- Design Name: 
-- Module Name: DECSTAGE - Behavioral
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

entity DECSTAGE is
    Port ( INSTR : in STD_LOGIC_VECTOR (31 downto 0);
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
end DECSTAGE;

architecture Behavioral of DECSTAGE is
COMPONENT Rf 
PORT(
   ANDR1 : in STD_LOGIC_VECTOR (4 downto 0);
           ANDR2 : in STD_LOGIC_VECTOR (4 downto 0);
           AWR : in STD_LOGIC_VECTOR (4 downto 0);
           DIN : in STD_LOGIC_VECTOR (31 downto 0);
           WREN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DOUT1 : out STD_LOGIC_VECTOR (31 downto 0);
           DOUT2 : out STD_LOGIC_VECTOR (31 downto 0)
           );
           END COMPONENT;
 COMPONENT  MUX2
 Port ( mux_c : in STD_LOGIC;
           mux_out : out STD_LOGIC_VECTOR (31 downto 0);
           X0 : in STD_LOGIC_VECTOR (31 downto 0);
           X1 : in STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;
COMPONENT TRANSFORM32
 Port ( INSTR0_15 : in STD_LOGIC_VECTOR (15 downto 0);
           IMMEX : in STD_LOGIC_VECTOR (1 downto 0);
           IMMEDi : out STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;
COMPONENT MUX5
PORT(
 mux5_c : in STD_LOGIC;
           mux5_out : out STD_LOGIC_VECTOR (4 downto 0);
           X0 : in STD_LOGIC_VECTOR (4 downto 0);
           X1 : in STD_LOGIC_VECTOR (4 downto 0));
end COMPONENT;

signal mux5out:STD_LOGIC_VECTOR (4 downto 0);
signal mux2out:STD_LOGIC_VECTOR (31 downto 0);
begin 

mux5_1:mux5 port map(
mux5_c=>RF_B_SEL,
mux5_out=>mux5out,
X0=>instr(15 downto 11),
X1=>instr(20 downto 16)
);
mux2_2:mux2 port map(
mux_c=>rf_wrdata_sel,
mux_out=>mux2out,
X0=>ALU_out,
X1=>MEM_out);
RF1:rf port map(
CLK=>clk,
RESET=>reset,
ANDR1=>instr(25 downto 21),
ANDR2=>mux5out,
AWR=> instr(20 downto 16),
DIN=>mux2out,
WREN=>RF_WrEn,
DOUT1=>RF_A,
DOUT2=>RF_B);

transform:transform32 port map(
INSTR0_15=>instr(15 downto 0),
IMMEX=>Immext,
IMMEDi=>Immed);














end Behavioral;
