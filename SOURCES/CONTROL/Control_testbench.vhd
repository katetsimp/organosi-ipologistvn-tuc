----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 12:05:07 AM
-- Design Name: 
-- Module Name: Control_testbench - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Control_testbench is
end;

architecture bench of Control_testbench is

  component Control
  Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
         PC_LdEn : out STD_LOGIC;
             PC_sel : out STD_LOGIC;
             RF_WrData_sel : out STD_LOGIC;
             RegDst : out STD_LOGIC;
             ImmExt : out STD_LOGIC_VECTOR (1 downto 0);
             zero : in STD_LOGIC;
             ALUSrc : out STD_LOGIC;
             ALU_func : out STD_LOGIC_VECTOR (3 downto 0);
             byteOp : out STD_LOGIC;
             MEMSTAGE_WR_EN : out STD_LOGIC;
             clk : in STD_LOGIC;
  		rst : in std_logic;
             RegWr : out STD_LOGIC);
  end component;

  signal instruction: STD_LOGIC_VECTOR (31 downto 0);
  signal PC_LdEn: STD_LOGIC;
  signal PC_sel: STD_LOGIC;
  signal RF_WrData_sel: STD_LOGIC;
  signal RegDst: STD_LOGIC;
  signal ImmExt: STD_LOGIC_VECTOR (1 downto 0);
  signal zero: STD_LOGIC;
  signal ALUSrc: STD_LOGIC;
  signal ALU_func: STD_LOGIC_VECTOR (3 downto 0);
  signal byteOp: STD_LOGIC;
  signal MEMSTAGE_WR_EN: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal rst: std_logic;
  signal RegWr: STD_LOGIC;
constant Clk_period:time:=100ns;
begin

  uut: Control port map ( instruction    => instruction,
                          PC_LdEn        => PC_LdEn,
                          PC_sel         => PC_sel,
                          RF_WrData_sel  => RF_WrData_sel,
                          RegDst         => RegDst,
                          ImmExt         => ImmExt,
                          zero           => zero,
                          ALUSrc         => ALUSrc,
                          ALU_func       => ALU_func,
                          byteOp         => byteOp,
                          MEMSTAGE_WR_EN => MEMSTAGE_WR_EN,
                          clk            => clk,
                          rst            => rst,
                          RegWr          => RegWr );
Clk_process: process
begin
Clk<='0';
wait for Clk_period/2; -- in the half of the period  became 0
Clk<='1';
wait for Clk_period/2;-- in the half of the period  became 1
end process;
  stimulus: process
  begin
  rst<='1';
  wait for 120 ns;
  rst<='0';
   instruction<="11000000000001010000000000001000";
   wait for 120ns;
    rst<='0';
   instruction<="11001100000000111010101111001101";
   wait for 120ns;
    rst<='0';
   instruction<="01111100000000110000000000000100";
   wait for 120ns;
    rst<='0';
   instruction<="10000001010001001000000000110010";
   wait for 120ns;
    rst<='0';
   instruction<="00000000000000000000000000000000";
   zero<='1';
    wait for 120ns;
   instruction<="00000100000000000000000000000000";
   zero<='0';
    wait for 120ns;
   


    -- Put test bench stimulus code here

    wait;
  end process;


end;
