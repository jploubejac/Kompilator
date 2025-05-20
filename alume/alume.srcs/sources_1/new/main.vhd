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
        debug_leds : out std_logic_vector(7 downto 0);
        --clk_debug : out std_logic;
        sw : in std_logic_vector(15 downto 0)
    );
end main;

architecture Behavioral of main is

    signal slow_clk : std_logic;
    signal result_alu : std_logic_vector(7 downto 0) := (others => '0');
    signal result_registres : Banc := (others => (others => '0'));
    signal be : std_logic_vector(7 downto 0) := (others => '0');
    signal button : std_logic_vector(7 downto 0) := (others => '0');
    signal left_in_data : std_logic_vector(7 downto 0) := (others => '0');
    signal right_in_data : std_logic_vector(7 downto 0) := (others => '0');

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
            left_in => left_in_data,
            right_in => right_in_data,
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
button <= result_registres(3);
leds <= std_logic_vector(to_unsigned(1, 8) sll to_integer(unsigned(result_registres(0)(2 downto 0))));
debug_leds <= result_registres(3);
left_in_data <=  x"FF" when unsigned(result_registres(2)) < 1 else
                x"CA" when unsigned(result_registres(2)) >= 1 and unsigned(result_registres(1)) >= 10 else
                result_registres(5); --when unsigned(result_registres(2)) < 15 and unsigned(result_registres(1)) < 10;
right_in_data <= x"15" when unsigned(result_registres(2)) < 1 else
                x"FE" when unsigned(result_registres(2)) >= 1 and unsigned(result_registres(1)) >= 10 else
                result_registres(1); --when unsigned(result_registres(2)) < 15 and unsigned(result_registres(1)) < 10;
                    
end Behavioral;
