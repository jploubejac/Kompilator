library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

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
        if RST='1' then
            data <= (others => (others =>'0'));
        elsif RW = '1' then
            OUTD <= data(to_integer(unsigned(ADDR)));
        elsif RW = '0' then
            data(to_integer(unsigned(ADDR))) <= IND;
        end if;
    end if;
end process;

end Behavioral;
