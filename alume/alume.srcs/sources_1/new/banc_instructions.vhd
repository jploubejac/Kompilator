----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 10:05:15 AM
-- Design Name: 
-- Module Name: banc_instructions - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity banc_instructions is
    Port ( ADDR : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           OUTD : out STD_LOGIC_VECTOR (31 downto 0));
end banc_instructions;

architecture Behavioral of banc_instructions is

    type MEM is array (255 downto 0) of std_logic_vector(31 downto 0);
    signal instr: MEM := (
        -- format: C:B:OP:A => OP A B C 
        -- ex: 00020601 => AFC R1 2 
        --afc
        -- 0 => x"00020601",

        --cop
        -- 1 => x"00010502",
        --6 => x"00010502",
        
        -- add
        -- 2 => x"02010103",
        --11 => x"02010103",
        
        --sous
        -- 3 => x"03010304",
        --16 => x"03010304",
        
        --mul
        -- 4 => x"03010205",
        --21 => x"03010205",

        --div
        -- 5 => x"05010406",
        --26 => x"05010406",
        
        --str
        -- 6 => x"00051101",
        --31 => x"00051101",

        --ldr
        -- 7 => x"00011000",
        --36 => x"00011000",
    -- ...
--    0 => x"00030600",
--    1 => x"00040601",
--    2 => x"00010502",
--    3 => x"00020601",
--    4 => x"00010503",
--    5 => x"00030501",
--    6 => x"00010503",
--    7 => x"00010601",
--    8 => x"00010504",
--    9 => x"00030601",
--    10 => x"00040605",
--    11 => x"05010101",
--    12 => x"00040505",
--    13 => x"00020506",
--    14 => x"06050105",
--    15 => x"00040506",
--    16 => x"00030507",
--    17 => x"00020508",
--    18 => x"08070207",
--    19 => x"07060106",
--    20 => x"06050205",
--    21 => x"00050509",
--    22 => x"00000700",
    0 => x"00040600",
    1 => x"00050601",
    2 => x"00010F00",
    3 => x"00090602",
    4 => x"00020E00",
    5 => x"00000D00",

    others => x"00001200"
);  

    
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            OUTD <= instr(to_integer(unsigned(ADDR)));
        end if;
    end process;


end Behavioral;