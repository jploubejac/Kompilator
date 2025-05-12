library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testInstruction is
end testInstruction;

architecture Behavioral of testInstruction is
-- Component Declaration for the Unit Under Test (UUT)

COMPONENT banc_instructions
PORT( ADDR : in STD_LOGIC_VECTOR (7 downto 0);
   CLK : in STD_LOGIC;
   OUTD : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;


--Inputs
signal ADDR_i : std_logic_vector(7 downto 0) := (others => '0');
signal CLK_i : std_logic := '0';

--Outputs
signal OUTD_o : std_logic_vector(31 downto 0) := (others => '0');

-- Clock period definitions
-- Si 100 MHz
constant Clock_period : time := 10 ns;
begin
-- Instantiate the Unit Under Test (UUT)
Label_uut: banc_instructions PORT MAP (
ADDR => ADDR_i,
CLK => CLK_i,
OUTD => OUTD_o
);

-- Stimulus process
-- T1 < T2 et T3 < T4

CLK_i <= not(CLK_i) after clock_period/2;
ADDR_i <= x"DA" after 10 ns, x"BC" after 30 ns, x"DA" after 40 ns;


end;