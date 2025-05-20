library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 use ieee.numeric_std.all;
 use work.types_Banc.all;
 
entity doubleport is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC_VECTOR (3 downto 0);
           Wb : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0);
           registres_o : out Banc
           );
           
end doubleport;

architecture Behavioral of doubleport is
--type Banc is array (15 downto 0) of std_logic_vector(7 downto 0);
signal registres: Banc := (others => (others => '0'));

begin

    QA <= DATA when Wb = '1' and W = A  else registres(to_integer(unsigned(A)));
    QB <= DATA when Wb = '1' and W = B  else registres(to_integer(unsigned(B)));
    registres_o <= registres;
    
    process (CLK)
    begin
        if CLK'Event and CLK='1' then
            if RST='1' then
                registres <= (others => (others =>'0'));
            elsif Wb = '1' then
                registres(to_integer(unsigned(W))) <= DATA;
            end if;
        end if;
    end process;
                

end Behavioral;
