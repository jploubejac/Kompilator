library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port (
        clk : in std_logic;
        rst: in  std_logic;
        seg: out std_logic_vector(6 downto 0);
        an : out std_logic_vector(3 downto 0);
        leds : out std_logic_vector(7 downto 0);
        pc_leds : out std_logic_vector(6 downto 0);
        clk_led : out std_logic;
        sw : in std_logic_vector(15 downto 0)
    );
end main;

architecture Behavioral of main is

    signal slow_clk : std_logic;
    signal result_alu : std_logic_vector(7 downto 0) := (others => '0');
    signal result_R9 : std_logic_vector(7 downto 0) := (others => '0');
    signal result_R1 : std_logic_vector(7 downto 0) := (others => '0');
    signal result_R2 : std_logic_vector(7 downto 0) := (others => '0');
    signal score : std_logic_vector(7 downto 0) := (others => '0');
    signal timer : std_logic_vector(7 downto 0) := (others => '0');
begin
    
    pipeline: entity work.pipeline
        port map(
            clk => slow_clk,
            rst => rst,
            result_alu => result_alu,
            result_R9 => result_R9,
            result_R1 => result_R1,
            result_R2 => result_R2,
            switches => sw
        );
    seven_seg: entity work.seven_seg_controller
        port map(
            clk => clk,
            left_in => timer,
            right_in => score,
            seg => seg,
            an => an
        );
    clock_div: entity work.clock_div
        port map(
            clk => clk,
            rst => rst,
            slow_clk => slow_clk
        );

clk_led <= slow_clk;
leds <= result_alu;
end Behavioral;
