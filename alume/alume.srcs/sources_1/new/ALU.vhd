library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_signed.ALL;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (3 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

-- 000 : addition
-- 001 : multiplication
-- 010 : soustraction
-- 011 : division
-- 100 : and
-- 101 : or
-- 110 : not

signal aux: std_logic_vector (15 downto 0):= (others=>'0');
signal inf_result : std_logic_vector(15 downto 0);
signal sup_result : std_logic_vector(15 downto 0);
signal equ_result : std_logic_vector(15 downto 0);

begin
    inf_result <= x"0001" when signed(A) < signed(B) else x"0000";
    sup_result <= x"0001" when signed(A) > signed(B) else x"0000";
    equ_result <= x"0001" when signed(A) = signed(B) else x"0000";

    with Ctrl_Alu select
        aux <= (x"00" & A) + (x"00" & B) when "0000",
        A * B when "0001",
        (x"00" & A) - (x"00" & B) when "0010",
        x"00" & ('0' & A(7 downto 1)) when "0011",
        x"00" & (A and B) when "0100",
        x"00" & (A or B) when "0101",
        x"00" & (not(A)) when "0110",
        inf_result when "0111",
        sup_result when "1000",
        equ_result when "1001",
        (x"00" & A) + (x"00" & B) when others
        ; 
       
    S  <= aux(7 downto 0);
      
    N <= '1' when aux(15)='1' else '0';
    O <= '1' when (unsigned(aux(15 downto 8)) > 0 and Ctrl_Alu="010") else '0';
    Z <= '1' when (aux = "00000000") else '0';
    C <= aux(8) when Ctrl_Alu = "000";
    
    
end Behavioral;
