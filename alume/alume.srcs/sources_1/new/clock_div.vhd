----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 09:27:42 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
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
use ieee.numeric_std.all;


entity clock_div is
    Port( 
        clk : in std_logic;
        rst : in std_logic;
        slow_clk : out std_logic
    );
end clock_div;

architecture Behavioral of clock_div is

signal aux: unsigned(31 downto 0) := (others => '0');
signal slow_clk_int : std_logic := '0';

begin

process(clk)
begin 
    if rising_edge(clk) then
        if rst = '1' then
            aux <= (others => '0');
        else
            aux <= aux + 1;
            slow_clk_int <= aux(20); -- comme 100Mhz / 2^27
        end if;
    end if;
end process;
slow_clk <= slow_clk_int;

end Behavioral;
