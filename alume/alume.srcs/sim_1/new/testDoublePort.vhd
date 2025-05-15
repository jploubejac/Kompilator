library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testDoublePort is
end testDoublePort;

architecture Behavioral of testDoublePort is
-- Component Declaration for the Unit Under Test (UUT)

COMPONENT doubleport
PORT( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC_VECTOR (3 downto 0);
           Wb : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0)
);
END COMPONENT;


--Inputs
signal A_i : std_logic_vector(3 downto 0) := (others => '0');
signal B_i : std_logic_vector(3 downto 0) := (others => '0');
signal W_i : std_logic_vector(3 downto 0) := (others => '0');
signal Wb_i : std_logic := '0';
signal DATA_i : std_logic_vector(7 downto 0) := (others => '0');
signal RST_i : std_logic := '1';
signal CLK_i : std_logic := '0';

--Outputs
signal QA_o : std_logic_vector(7 downto 0) := (others => '0');
signal QB_o : std_logic_vector(7 downto 0) := (others => '0');

-- Clock period definitions
-- Si 100 MHz
constant Clock_period : time := 10 ns;
begin
-- Instantiate the Unit Under Test (UUT)
Label_uut: doubleport PORT MAP (
A => A_i,
B => B_i,
W => W_i,
Wb => Wb_i,
DATA => DATA_i,
RST => RST_i,
CLK => CLK_i,
QA => QA_o,
QB => QB_o
);

-- Stimulus process
-- T1 < T2 et T3 < T4

CLK_i <= not(CLK_i) after clock_period/2;
RST_i <= '0' after 20 ns, '1' after 25 ns, '0' after 90ns;
W_i <= x"C" after 30 ns;
DATA_i <= x"04" after 30 ns, x"08" after 60 ns, x"12" after 80 ns;
Wb_i <= '1' after 40 ns, '0' after 80 ns;
B_i <= x"C" after 50 ns;
A_i <= x"C" after 80 ns;


end;