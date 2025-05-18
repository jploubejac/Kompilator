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
        clk_led : out std_logic
    );
end main;

architecture Behavioral of main is

    signal slow_clk : std_logic;
    signal result_alu : std_logic_vector(7 downto 0) := (others => '0');
    signal seg_data : std_logic_vector(6 downto 0) := (others => '0'); 
    signal an_data : std_logic_vector(3 downto 0) := (others => '0'); 

begin
    
    pipeline: entity work.pipeline
        port map(
            clk => slow_clk,
            rst => rst,
            result_alu => result_alu
        );
    seven_seg: entity work.seven_seg_controller
        port map(
            clk => clk,
            left_in => x"00",
            right_in => result_alu(7 downto 0),
            seg => seg_data,
            an => an_data
        );
    clock_div: entity work.clock_div
        port map(
            clk => clk,
            rst => rst,
            slow_clk => slow_clk
        );

seg <= seg_data;
an <= an_data;
clk_led <= slow_clk;
leds <= result_alu;
pc_leds <= seg_data;
end Behavioral;
