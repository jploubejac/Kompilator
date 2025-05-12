----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2025 03:40:32 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.numeric_std.ALL;
use IEEE.std_logic_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

-- 000 : addition
-- 001 : soustraction
-- 010 : multiplication
-- 011 : division
-- 100 : and
-- 101 : or
-- 110 : not

signal aux: std_logic_vector (15 downto 0):= (others=>'0');
 
begin
    
    with Ctrl_Alu select
        aux <= (x"00" & A) + (x"00" & B) when "000",
        A * B when "001",
        (x"00" & A) - (x"00" & B) when "010",
        x"00" & ('0' & A(7 downto 1)) when "011",
        "000000000000000" & (A(1) and B(1)) when "100",
        "000000000000000" & (A(1) or B(1)) when "101",
        "000000000000000" & (not(A(1))) when "110",
        (x"00" & A) + (x"00" & B) when others
        ; 
       
    S  <= aux(7 downto 0);
      
    N <= '1' when aux(15)='1' else '0';
    O <= '1' when (unsigned(aux(15 downto 8)) > 0 and Ctrl_Alu="010") else '0';
    Z <= '1' when (aux = "00000000") else '0';
    C <= aux(8) when Ctrl_Alu = "000";
    
    
end Behavioral;
