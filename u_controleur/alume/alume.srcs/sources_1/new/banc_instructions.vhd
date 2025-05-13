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
        --afc
        0 => x"00020601",
        
        --cop
        6 => x"00010502",
        
        -- add
        11 => x"02010103",
        
        --sous
        16 => x"03010304",
        
        --mul
        21 => x"03010205",

        --div
        26 => x"05010406",
    -- ...
        others => x"ffffffff"
    );  

    
begin

    process(CLK)
    begin
        if (CLK'Event and CLK='1') then
            OUTD <= instr(to_integer(unsigned(ADDR)));
        end if;
    end process;


end Behavioral;