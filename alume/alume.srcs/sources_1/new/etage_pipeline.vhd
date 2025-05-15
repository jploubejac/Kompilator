----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 10:30:52 AM
-- Design Name: 
-- Module Name: etage_pipeline - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity etage_pipeline is
Port ( A_i : in STD_LOGIC_VECTOR (7 downto 0);
           OP_i : in STD_LOGIC_VECTOR (7 downto 0);
           B_i : in STD_LOGIC_VECTOR (7 downto 0);
           C_i : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC; 
           A_o : out STD_LOGIC_VECTOR (7 downto 0);
           OP_o : out STD_LOGIC_VECTOR (7 downto 0);
           B_o : out STD_LOGIC_VECTOR (7 downto 0);
           C_o : out STD_LOGIC_VECTOR (7 downto 0));
end etage_pipeline;

architecture Behavioral of etage_pipeline is

begin

    process(CLK)
        begin
            if (CLK'Event and CLK='1') then
                A_o <= A_i;
                OP_o <= OP_i;
                B_o <= B_i;
                C_o <= C_i;
            end if;
    end process;
        


end Behavioral;
