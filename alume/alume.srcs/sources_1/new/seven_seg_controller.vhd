-- Anode: l'afficheur ; Segments : les traits allumés de l'afficheur
-- Comme on change un digit à la fois, une clock trop élevé va faire mal aux yeux
-- On sélectionne le digit en cours avec un compteur
-- BCD : Binary-Coded Digit
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_seg_controller is
    Port (
        clk : in  STD_LOGIC;
        right_in : in  STD_LOGIC_VECTOR(7 downto 0);
        left_in : in  STD_LOGIC_VECTOR(7 downto 0);
        seg : out STD_LOGIC_VECTOR(6 downto 0); -- Segments (a à g)
        an : out STD_LOGIC_VECTOR(3 downto 0) -- Anodes (les 4 afficheurs)
    );
end seven_seg_controller;

architecture Behavioral of seven_seg_controller is
    signal counter: unsigned(19 downto 0) := (others => '0');
    signal digit_sel: integer range 0 to 3 := 0; -- afficheur actif
    signal bcd_digit: STD_LOGIC_VECTOR(3 downto 0);
    signal right_bcd: STD_LOGIC_VECTOR(7 downto 0);
    signal left_bcd : STD_LOGIC_VECTOR(7 downto 0);
begin
    right_bcd <= right_in;
    left_bcd  <= left_in;
process(clk)
begin
    if rising_edge(clk) then
        counter <= counter + 1;
        digit_sel <= to_integer(counter(19 downto 18));  -- 2 bits pour 4 états
    end if;
end process;

with digit_sel select
    bcd_digit <= left_bcd(7 downto 4)  when 0, -- gauche
                 left_bcd(3 downto 0)  when 1, -- gauche/milieu
                 right_bcd(7 downto 4) when 2, -- droit/milieu
                 right_bcd(3 downto 0)  when 3; -- droit

with digit_sel select
    an <= "0111" when 0, -- gauche
          "1011" when 1, -- gauche/milieu
          "1101" when 2, -- droite/milieu
          "1110" when 3, -- droite
          "1111" when others;

-- Hexa -> 7 digits
with bcd_digit select
    seg <= "0000001" when "0000",  -- 0
        "1001111" when "0001",  -- 1
        "0010010" when "0010",  -- 2
        "0000110" when "0011",  -- 3
        "1001100" when "0100",  -- 4
        "0100100" when "0101",  -- 5
        "0100000" when "0110",  -- 6
        "0001111" when "0111",  -- 7
        "0000000" when "1000",  -- 8
        "0000100" when "1001",  -- 9
        "0000010" when "1010",  -- A
        "1100000" when "1011",  -- b
        "0110001" when "1100",  -- C
        "1000010" when "1101",  -- d
        "0110000" when "1110",  -- E
        "0111000" when "1111",  -- F
        "1111111" when others;  -- Eteint
end Behavioral;