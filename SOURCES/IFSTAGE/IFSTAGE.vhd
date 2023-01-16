----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 06:51:32 PM
-- Design Name: 
-- Module Name: IFSTAGE - Behavioral
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

entity IFSTAGE is
    Port ( PC_Immed : in STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in STD_LOGIC;
           PC_LdEn : in STD_LOGIC;
           Reset : in STD_LOGIC;
           CLk : in STD_LOGIC;
           PCi : inout STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

architecture Behavioral of IFSTAGE is
component add_4
Port ( PC : in STD_LOGIC_VECTOR (31 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (31 downto 0));
           end component;
           
     component addersignexit
       Port ( PC_I : in STD_LOGIC_VECTOR (31 downto 0);
           ADDER4OUT : in STD_LOGIC_VECTOR (31 downto 0);
           ExitOFADDER : out STD_LOGIC_VECTOR (31 downto 0));
           
end component;
component mux2
Port ( mux_c : in STD_LOGIC;
           mux_out : out STD_LOGIC_VECTOR (31 downto 0);
           X0 : in STD_LOGIC_VECTOR (31 downto 0);
           X1 : in STD_LOGIC_VECTOR (31 downto 0));
           end component;
           component reg
           Port  ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DATAIN : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           DATAOUT : out STD_LOGIC_VECTOR (31 downto 0));
end component;


signal add_out: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL pcout : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL addesi_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL mux_out_t : STD_LOGIC_VECTOR(31 DOWNTO 0);
begin
adder:add_4
Port map(
PC=>PCi,
OUTPUT=>add_out);
addersign:addersignexit
Port map(
PC_I=>PC_Immed,
ADDER4OUT=>add_out,
ExitOFADDER=>addesi_out);
mux:mux2
Port map(
mux_c=>PC_sel,
mux_out=>mux_out_t,
X0=>add_out,
X1=>addesi_out);
pc:reg
port map(
CLK=>CLk,
RESET=>RESET,
DATAIN=>mux_out_t,
WE=>PC_LdEn,
DATAOUT=>PCi);



 


end Behavioral;
