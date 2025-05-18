----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2025 10:13:17 AM
-- Design Name: 
-- Module Name: doubleport - Behavioral
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

entity doubleport is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC_VECTOR (3 downto 0);
           Wb : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end doubleport;

architecture Behavioral of doubleport is

type Banc is array (15 downto 0) of std_logic_vector(7 downto 0);
signal registres: Banc := (others => (others => '0'));

begin

    QA <= DATA when Wb = '1' and W = A  else registres(to_integer(unsigned(A)));
    QB <= DATA when Wb = '1' and W = B  else registres(to_integer(unsigned(B)));

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
