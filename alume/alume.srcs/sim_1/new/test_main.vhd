library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_main is
end test_main;

architecture Behavioral of test_main is

signal clk : std_logic := '0';
signal rst: std_logic:= '1';
signal seg: std_logic_vector(6 downto 0):= (others => '0');
signal an: std_logic_vector(3 downto 0):= (others => '0');

constant Clock_period : time := 10 ns;

begin

    main: entity work.main
        port map(
            clk => clk,
            rst => rst,
            seg => seg,
            an => an
        );
        
    clk_process : process
        begin
            clk <= '0';
            wait for Clock_period / 2;
            clk <= '1';
            wait for Clock_period / 2;
      end process;
    
    end_simulation : process
    begin
        wait for 100 ms;
        report "Fin de simulation" severity note;
    end process;
    
end Behavioral;
