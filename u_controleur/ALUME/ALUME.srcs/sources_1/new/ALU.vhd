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

-- 00 : addition
-- 01 : soustraction
-- 10 : multiplication
-- 11 : division
signal aux: std_logic_vector (15 downto 0):= (others=>'0');
 
begin
    
    with Ctrl_Alu select
        aux <= std_logic_vector(unsigned(A) + unsigned(B)) when "00",
        std_logic_vector(unsigned(A) - unsigned(B)) when "01",
        std_logic_vector(unsigned(A) * unsigned(B)) when "10",
        std_logic_vector(unsigned(A) / unsigned(B)) when others
        ; 
       
    S  <= aux(7 downto 0);
      
    N <= '1' when (B > A and Ctrl_Alu = "01");
    O <= '1' when (unsigned(aux(15 downto 8)) > 0);
    Z <= '1' when (aux = "00000000");
    C <= aux(8);
    
    
end Behavioral;
