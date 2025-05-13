LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY test_pipeline IS
END test_pipeline;

ARCHITECTURE behavior OF test_pipeline IS

signal clk : std_logic := '0';
signal rst: std_logic:= '0';

  -- Clock generation
constant Clock_period : time := 10 ns;

BEGIN

  CLK_PROCESS : PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR CLOCK_PERIOD / 2;
    clk <= '1';
    WAIT FOR CLOCK_PERIOD / 2;
  END PROCESS;

uut: entity work.pipeline
    port map(
        clk => clk,
        rst => rst
    );

-- mettre un reset

END behavior;