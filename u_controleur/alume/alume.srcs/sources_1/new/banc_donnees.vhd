----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 09:15:49 AM
-- Design Name: 
-- Module Name: banc_donnees - Behavioral
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

entity banc_donnees is
    Port ( ADDR : in STD_LOGIC_VECTOR (7 downto 0);
           IND : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           OUTD : out STD_LOGIC_VECTOR (7 downto 0));
end banc_donnees;

architecture Behavioral of banc_donnees is


type RAM is array (255 downto 0) of std_logic_vector(7 downto 0);
signal data: RAM := (others => (others => '0'));

begin

process(CLK)
begin
    if (CLK'Event and CLK='1') then
        if RST='0' then
            data <= (others => (others =>'0'));
        elsif RW = '1' then
            OUTD <= data(to_integer(unsigned(ADDR)));
        elsif RW = '0' then
            data(to_integer(unsigned(ADDR))) <= IND;
        end if;
    end if;
end process;

end Behavioral;
