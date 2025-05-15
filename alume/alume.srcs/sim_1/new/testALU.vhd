library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testALU is
end testALU;

architecture Behavioral of testALU is
-- Component Declaration for the Unit Under Test (UUT)

COMPONENT ALU
PORT(
    A : IN std_logic_vector(7 downto 0);
    B : IN std_logic_vector(7 downto 0);
    Ctrl_Alu : in std_logic_vector(2 downto 0);
    N : out std_logic;
    O : out std_logic;
    Z : out std_logic;
    C : out std_logic;
    S : out std_logic_vector(7 downto 0)  
);
END COMPONENT;


--Inputs
signal A_i : std_logic_vector(7 downto 0) := (others => '0');
signal B_i : std_logic_vector(7 downto 0) := (others => '0');
signal Ctrl_Alu_i : std_logic_vector(2 downto 0) := (others => '0');

--Outputs
signal N_i : std_logic;
signal O_i : std_logic;
signal Z_i : std_logic;
signal C_i : std_logic;
signal S_i : std_logic_vector(7 downto 0);


-- Clock period definitions
-- Si 100 MHz
constant Clock_period : time := 10 ns;
begin
-- Instantiate the Unit Under Test (UUT)
Label_uut: ALU PORT MAP (
A => A_i,
B => B_i,
Ctrl_Alu => Ctrl_Alu_i,
N => N_i,
O => O_i,
Z => Z_i,
C => C_i,
S => S_i
);

-- Stimulus process
-- T1 < T2 et T3 < T4

-- Test add
-- Test mul
-- Test sub
-- Test div
-- Test and
-- Test or
-- Test not
Ctrl_Alu_i <= "000" after 10 ns, "001" after 20 ns, "010" after 30 ns, "011" after 40 ns, "100" after 50 ns, "101" after 60 ns, "110" after 70 ns;
A_i <= x"01" after 10 ns, x"05" after 20 ns, x"05" after 30 ns, x"05" after 40 ns, x"01" after 50 ns, x"01" after 60 ns, x"00" after 70 ns;
B_i <= x"02" after 10 ns, x"02" after 20 ns, x"02" after 30 ns, x"02" after 40 ns, x"01" after 50 ns, x"00" after 60 ns, x"02" after 70 ns;



end;