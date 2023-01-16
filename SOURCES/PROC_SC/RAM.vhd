----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 03:39:23 PM
-- Design Name: 
-- Module Name: RAM - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( CLK : in STD_LOGIC;
           Inst_addr : in STD_LOGIC_VECTOR (10 downto 0);
           Inst_dout : out STD_LOGIC_VECTOR (31 downto 0);
           data_we : in STD_LOGIC;
           data_addr : in STD_LOGIC_VECTOR (10 downto 0);
           data_din : in STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out STD_LOGIC_VECTOR (31 downto 0));
end RAM;

architecture syn of RAM is
type ram_type is array (2047 downto 0) of std_logic_vector (31 downto 0);


impure function InitRamFromFile (RamFileName : in string) return ram_type is
 FILE ramfile : text is in RamFileName;
 variable RamFileLine : line;
 variable ram : ram_type;
 begin
 for i in 0 to 1023 loop
 readline(ramfile, RamFileLine);
 read (RamFileLine, ram(i));
 end loop;
 for i in 1024 to 2047 loop
 ram(i) := x"00000000";
 end loop;
 return ram;
 end function;


signal RAM_t: ram_type := InitRamFromFile("anafora1.data");
begin
 process (clk)
 begin
 if clk'event and clk = '1' then
 if data_we = '1' then
 RAM_t(conv_integer(data_addr)) <= data_din;
 end if;
 end if;
 end process;
 data_dout <= RAM_t(conv_integer(data_addr)) after 12ns;
 inst_dout <= RAM_t(conv_integer(inst_addr)) after 12ns;
end syn;