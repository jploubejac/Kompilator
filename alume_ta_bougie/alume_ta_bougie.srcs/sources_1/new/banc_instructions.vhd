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
    -- 0 => x"00090600",
    --1 => x"00000D00",
--    1 => x"00050601",
--    2 => x"00010F00",
--    3 => x"00090602",
--    4 => x"00020E00",
--    5 => x"00000D01",
        
        --test while ex11.c
--        0 => x"00000701",
--        1 => x"00000600",
--        2 => x"00000502",
--        3 => x"001E0603",
--        4 => x"03020902",
--        5 => x"0002080B",
--        6 => x"00000503",
--        7 => x"00010605",
--        8 => x"05030103",
--        9 => x"00030500",
--        10 => x"00000702",
--        11 => x"00000602",
        0 => x"00000701", 
        1 => x"00000600", 
        2 => x"00000601", 
        3 => x"003C0602", 
        4 => x"00000603", 
        5 => x"00000604", 
        6 => x"00000605", 
        7 => x"00020506", 
        8 => x"00010607", 
        9 => x"07060A06", 
        10 => x"00060848", 
        11 => x"00000507", 
        12 => x"00020508", 
        13 => x"08070107", 
        14 => x"00070500", 
        15 => x"00000507", 
        16 => x"000F0608", 
        17 => x"08070A07", 
        18 => x"00070818", 
        19 => x"00000508", 
        20 => x"000F0609", 
        21 => x"09080308", 
        22 => x"00080500", 
        23 => x"0000070F", 
        24 => x"00010607", 
        25 => x"00000508", 
        26 => x"00080509", 
        27 => x"0000060A", 
        28 => x"0A090A09", 
        29 => x"00090827", 
        30 => x"0007050A", 
        31 => x"0002060B", 
        32 => x"0B0A020A", 
        33 => x"000A0507", 
        34 => x"0008050A", 
        35 => x"0001060B", 
        36 => x"0B0A030A", 
        37 => x"000A0508", 
        38 => x"0000071A", 
        39 => x"00000609", 
        40 => x"00090504", 
        41 => x"00000609", 
        42 => x"00090505", 
        43 => x"00040509", 
        44 => x"0005060A", 
        45 => x"0A090909", 
        46 => x"0005050A", 
        47 => x"0000060B", 
        48 => x"0B0A0B0A", 
        49 => x"0A090F09", 
        50 => x"00090843", 
        51 => x"0003050A", 
        52 => x"0007050B", 
        53 => x"0B0A0B0A", 
        54 => x"000A083E", 
        55 => x"0001050A", 
        56 => x"0001060B", 
        57 => x"0B0A010A", 
        58 => x"000A0501", 
        59 => x"0001060A", 
        60 => x"000A0505", 
        61 => x"0000073E", 
        62 => x"0004050A", 
        63 => x"0001060B", 
        64 => x"0B0A010A", 
        65 => x"000A0504", 
        66 => x"0000072B", 
        67 => x"00020509", 
        68 => x"0001060A", 
        69 => x"0A090309", 
        70 => x"00090502", 
        71 => x"00000707", 
        72 => x"00000608", 


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