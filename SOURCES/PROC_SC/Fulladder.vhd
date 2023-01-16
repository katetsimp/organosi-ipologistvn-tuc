----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 05:04:03 PM
-- Design Name: 
-- Module Name: Fulladder - Behavioral
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
 
entity fulladder is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
end fulladder;
 
architecture gate_level of fulladder is
 
begin
 
 S <= A XOR B XOR Cin  ;
 Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
 
end gate_level;

