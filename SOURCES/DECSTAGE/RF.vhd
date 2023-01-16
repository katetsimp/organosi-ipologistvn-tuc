----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2021 02:58:52 PM
-- Design Name: 
-- Module Name: RF - Behavioral
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

entity RF is
    Port ( ANDR1 : in STD_LOGIC_VECTOR (4 downto 0);
           ANDR2 : in STD_LOGIC_VECTOR (4 downto 0);
           AWR : in STD_LOGIC_VECTOR (4 downto 0);
           DIN : in STD_LOGIC_VECTOR (31 downto 0);
           WREN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DOUT1 : out STD_LOGIC_VECTOR (31 downto 0);
           DOUT2 : out STD_LOGIC_VECTOR (31 downto 0)
           );
end RF;

architecture Structural of RF is
COMPONENT decoder
port ( AWR : in STD_LOGIC_VECTOR (4 downto 0);
          DECODER_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;
component REG
Port  ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DATAIN : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           DATAOUT : out STD_LOGIC_VECTOR (31 downto 0));
           END COMPONENT;
           
 
Component mux
    Port ( C : in STD_LOGIC_VECTOR (4 downto 0);
           X0 : in STD_LOGIC_VECTOR (31 downto 0);
           X1 : in STD_LOGIC_VECTOR (31 downto 0);
           X2 : in STD_LOGIC_VECTOR (31 downto 0);
           X3 : in STD_LOGIC_VECTOR (31 downto 0);
           X4 : in STD_LOGIC_VECTOR (31 downto 0);
           X5 : in STD_LOGIC_VECTOR (31 downto 0);
           X6 : in STD_LOGIC_VECTOR (31 downto 0);
           X7 : in STD_LOGIC_VECTOR (31 downto 0);
           X8 : in STD_LOGIC_VECTOR (31 downto 0);
           X9: in STD_LOGIC_VECTOR (31 downto 0);
           X10 : in STD_LOGIC_VECTOR (31 downto 0);
           X11 : in STD_LOGIC_VECTOR (31 downto 0);
           X12 : in STD_LOGIC_VECTOR (31 downto 0);
           X13 : in STD_LOGIC_VECTOR (31 downto 0);
           X14 : in STD_LOGIC_VECTOR (31 downto 0);
           X15 : in STD_LOGIC_VECTOR (31 downto 0);
           X16 : in STD_LOGIC_VECTOR (31 downto 0);
           X17 : in STD_LOGIC_VECTOR (31 downto 0);
           X18 : in STD_LOGIC_VECTOR (31 downto 0);
           X19 : in STD_LOGIC_VECTOR (31 downto 0);
           X20 : in STD_LOGIC_VECTOR (31 downto 0);
           X21 : in STD_LOGIC_VECTOR (31 downto 0);
           X22 : in STD_LOGIC_VECTOR (31 downto 0);
           X23 : in STD_LOGIC_VECTOR (31 downto 0);
           X24 : in STD_LOGIC_VECTOR (31 downto 0);
           X25 : in STD_LOGIC_VECTOR (31 downto 0);
           X26 : in STD_LOGIC_VECTOR (31 downto 0);
           X27 : in STD_LOGIC_VECTOR (31 downto 0);
           X28 : in STD_LOGIC_VECTOR (31 downto 0);
           X29 : in STD_LOGIC_VECTOR (31 downto 0);
           X30 : in STD_LOGIC_VECTOR (31 downto 0);
           X31 : in STD_LOGIC_VECTOR (31 downto 0);
           D : out STD_LOGIC_VECTOR (31 downto 0));
end component;
signal decoder_outs,reg_we:std_logic_vector(31 downto 0);
type arrayforreg  is array(0 to 31) of std_logic_vector (31 downto 0);
signal reg_out:arrayforreg;
begin
dec:decoder
port map(
Awr=>Awr,
DECODER_OUT=>decoder_outs
);
register0:reg
port map(DATAIN => "00000000000000000000000000000000",
        WE => '1',
		CLK => CLK,
		RESET=>RESET,
		DATAOUT => reg_out(0)
		);
make_registers:
for i in 1 to 31 generate
reg_we(i)<=WREN and decoder_outs(i)after 2ns;


registers_1_to_31:reg
port map(DATAIN => Din,
        WE => reg_we(i),
		CLK => CLK,
		RESET=>RESET,
		DATAOUT => reg_out(i)
		);
		end generate;
		
	mux1: Mux
	port map(
         C=>ANDR1,
          X0 =>reg_out(0),
          X1 =>reg_out(1),
          X2 =>reg_out(2),
          X3 =>reg_out(3),
          X4 =>reg_out(4),
          X5 =>reg_out(5),
          X6 =>reg_out(6),
          X7 =>reg_out(7),
          X8 =>reg_out(8),
          X9=>reg_out(9),
          X10=>reg_out(10),
          X11 =>reg_out(11),
         X12 =>reg_out(12),
         X13 =>reg_out(13),
         X14 =>reg_out(14),
         X15 =>reg_out(15),
         X16 =>reg_out(16),
         X17 =>reg_out(17),
         X18 =>reg_out(18),
         X19 =>reg_out(19),
         X20 =>reg_out(20),
         X21 =>reg_out(21),
         X22 =>reg_out(22),
         X23 =>reg_out(23),
         X24 =>reg_out(24),
         X25 =>reg_out(25),
         X26 =>reg_out(26),
         X27 =>reg_out(27),
         X28 =>reg_out(28),
         X29 =>reg_out(29),
         X30 =>reg_out(30),
         X31 =>reg_out(31),
         
         D=>DOUT1
         
         );
         mux2: Mux
	port map(

          X0 =>reg_out(0),
          X1 =>reg_out(1),
          X2 =>reg_out(2),
          X3 =>reg_out(3),
          X4 =>reg_out(4),
          X5 =>reg_out(5),
          X6 =>reg_out(6),
          X7 =>reg_out(7),
          X8 =>reg_out(8),
          X9=>reg_out(9),
          X10=>reg_out(10),
          X11 =>reg_out(11),
         X12 =>reg_out(12),
         X13 =>reg_out(13),
         X14 =>reg_out(14),
         X15 =>reg_out(15),
         X16 =>reg_out(16),
         X17 =>reg_out(17),
         X18 =>reg_out(18),
         X19 =>reg_out(19),
         X20 =>reg_out(20),
         X21 =>reg_out(21),
         X22 =>reg_out(22),
         X23 =>reg_out(23),
         X24 =>reg_out(24),
         X25 =>reg_out(25),
         X26 =>reg_out(26),
         X27 =>reg_out(27),
         X28 =>reg_out(28),
         X29 =>reg_out(29),
         X30 =>reg_out(30),
         X31 =>reg_out(31),
         C=>ANDR2,
         D=>DOUT2
         
         );
         
         
          
           



end Structural;
