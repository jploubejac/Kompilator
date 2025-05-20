library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.types_Banc.all;
use IEEE.numeric_std.ALL;

entity main is
    Port (
        clk : in std_logic;
        rst: in  std_logic;
        seg: out std_logic_vector(6 downto 0);
        an : out std_logic_vector(3 downto 0);
        leds : out std_logic_vector(7 downto 0);
        pc_leds : out std_logic_vector(7 downto 0);
        --clk_led : out std_logic;
        sw : in std_logic_vector(15 downto 0)
    );
end main;

architecture Behavioral of main is

    signal slow_clk : std_logic;
    signal result_alu : std_logic_vector(7 downto 0) := (others => '0');
    signal result_registres : Banc := (others => (others => '0'));
    signal be : std_logic_vector(7 downto 0) := (others => '0');

begin
    
    pipeline: entity work.pipeline
        port map(
            clk => slow_clk,
            rst => rst,
            result_alu => result_alu,
            registres_o => result_registres,
            switches => sw
        );
    seven_seg: entity work.seven_seg_controller
        port map(
            clk => clk,
            left_in => result_registres(2),
            right_in => result_registres(1),
            seg => seg,
            an => an
        );
    clock_div: entity work.clock_div
        port map(
            clk => clk,
            rst => rst,
            slow_clk => slow_clk
        );

--clk_led <= slow_clk;
leds <= std_logic_vector(to_unsigned(1, 8) sll to_integer(unsigned(result_registres(0)(2 downto 0))));
pc_leds <= result_registres(3);
end Behavioral;
