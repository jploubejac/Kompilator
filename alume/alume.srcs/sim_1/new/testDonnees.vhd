library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testDonnees is
end testDonnees;

architecture Behavioral of testDonnees is
-- Component Declaration for the Unit Under Test (UUT)

COMPONENT banc_donnees
PORT( ADDR : in STD_LOGIC_VECTOR (7 downto 0);
           IND : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           OUTD : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;


--Inputs
signal ADDR_i : std_logic_vector(7 downto 0) := (others => '0');
signal IND_i : std_logic_vector(7 downto 0) := (others => '0');
signal RW_i : std_logic := '1';
signal RST_i : std_logic := '1';
signal CLK_i : std_logic := '0';

--Outputs
signal OUTD_o : std_logic_vector(7 downto 0) := (others => '0');

-- Clock period definitions
-- Si 100 MHz
constant Clock_period : time := 10 ns;
begin
-- Instantiate the Unit Under Test (UUT)
Label_uut: banc_donnees PORT MAP (
ADDR => ADDR_i,
IND => IND_i,
RW => RW_i,
RST => RST_i,
CLK => CLK_i,
OUTD => OUTD_o
);

-- Stimulus process
-- T1 < T2 et T3 < T4

CLK_i <= not(CLK_i) after clock_period/2;
RST_i <= '0' after 20 ns, '1' after 25 ns, '0' after 90ns, '1' after 120 ns;
RW_i <= '0' after 10 ns, '1' after 30 ns;
IND_i <= x"CA" after 20 ns;
ADDR_i <= x"DA" after 10 ns, x"BC" after 30 ns, x"DA" after 40 ns;


end;