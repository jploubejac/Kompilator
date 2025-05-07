LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY test_pipeline IS
END test_pipeline;

ARCHITECTURE behavior OF test_pipeline IS

  COMPONENT pipeline
    PORT(
      CLK_c : IN STD_LOGIC;
      -- LIDI
      LIDI_i : IN STD_LOGIC_VECTOR(31 downto 0);
      LIDI_A_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      LIDI_B_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      LIDI_C_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      LIDI_OP_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      -- DIEX
      DIEX_A_i : IN STD_LOGIC_VECTOR(7 downto 0);
      DIEX_B_i : IN STD_LOGIC_VECTOR(7 downto 0);
      DIEX_C_i : IN STD_LOGIC_VECTOR(7 downto 0);
      DIEX_OP_i : IN STD_LOGIC_VECTOR(7 downto 0);
      DIEX_A_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      DIEX_B_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      DIEX_C_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      DIEX_OP_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      -- EXMEM
      EXMEM_A_i : IN STD_LOGIC_VECTOR(7 downto 0);
      EXMEM_B_i : IN STD_LOGIC_VECTOR(7 downto 0);
      EXMEM_C_i : IN STD_LOGIC_VECTOR(7 downto 0);
      EXMEM_OP_i : IN STD_LOGIC_VECTOR(7 downto 0);
      EXMEM_A_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      EXMEM_B_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      EXMEM_C_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      EXMEM_OP_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      -- MEMRE
      MEMRE_A_i : IN STD_LOGIC_VECTOR(7 downto 0);
      MEMRE_B_i : IN STD_LOGIC_VECTOR(7 downto 0);
      MEMRE_C_i : IN STD_LOGIC_VECTOR(7 downto 0);
      MEMRE_OP_i : IN STD_LOGIC_VECTOR(7 downto 0);
      MEMRE_A_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      MEMRE_B_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      MEMRE_C_o : OUT STD_LOGIC_VECTOR(7 downto 0);
      MEMRE_OP_o : OUT STD_LOGIC_VECTOR(7 downto 0)
    );
  END COMPONENT;

  SIGNAL CLK_c : STD_LOGIC := '0';
  SIGNAL LIDI_i : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL LIDI_A_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL LIDI_B_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL LIDI_C_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL LIDI_OP_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_A_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_B_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_C_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_OP_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_A_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_B_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_C_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL DIEX_OP_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_A_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_B_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_C_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_OP_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_A_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_B_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_C_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL EXMEM_OP_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_A_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_B_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_C_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_OP_i : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_A_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_B_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_C_o : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL MEMRE_OP_o : STD_LOGIC_VECTOR(7 downto 0);

  -- Clock generation
constant Clock_period : time := 10 ns;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut: pipeline PORT MAP (
    CLK_c => CLK_c,
    LIDI_i => LIDI_i,
    LIDI_A_o => LIDI_A_o,
    LIDI_B_o => LIDI_B_o,
    LIDI_C_o => LIDI_C_o,
    LIDI_OP_o => LIDI_OP_o,
    DIEX_A_i => DIEX_A_i,
    DIEX_B_i => DIEX_B_i,
    DIEX_C_i => DIEX_C_i,
    DIEX_OP_i => DIEX_OP_i,
    DIEX_A_o => DIEX_A_o,
    DIEX_B_o => DIEX_B_o,
    DIEX_C_o => DIEX_C_o,
    DIEX_OP_o => DIEX_OP_o,
    EXMEM_A_i => EXMEM_A_i,
    EXMEM_B_i => EXMEM_B_i,
    EXMEM_C_i => EXMEM_C_i,
    EXMEM_OP_i => EXMEM_OP_i,
    EXMEM_A_o => EXMEM_A_o,
    EXMEM_B_o => EXMEM_B_o,
    EXMEM_C_o => EXMEM_C_o,
    EXMEM_OP_o => EXMEM_OP_o,
    MEMRE_A_i => MEMRE_A_i,
    MEMRE_B_i => MEMRE_B_i,
    MEMRE_C_i => MEMRE_C_i,
    MEMRE_OP_i => MEMRE_OP_i,
    MEMRE_A_o => MEMRE_A_o,
    MEMRE_B_o => MEMRE_B_o,
    MEMRE_C_o => MEMRE_C_o,
    MEMRE_OP_o => MEMRE_OP_o
  );

  CLK_PROCESS : PROCESS
  BEGIN
    CLK_c <= '0';
    WAIT FOR CLOCK_PERIOD / 2;
    CLK_c <= '1';
    WAIT FOR CLOCK_PERIOD / 2;
  END PROCESS;

  STIMULUS : PROCESS
  BEGIN
    LIDI_i <= x"00010607";
  END PROCESS;

END behavior;
