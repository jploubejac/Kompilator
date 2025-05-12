----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 10:44:36 AM
-- Design Name: 
-- Module Name: pipeline - Behavioral
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

entity pipeline is
    Port(
        clk : in std_logic;
        rst: in std_logic
        --leds
    );
end pipeline;

architecture Structural of pipeline is
    COMPONENT banc_instructions
    PORT( ADDR : in STD_LOGIC_VECTOR (7 downto 0);
       CLK : in STD_LOGIC;
       OUTD : out STD_LOGIC_VECTOR (31 downto 0));
    END COMPONENT;
    COMPONENT banc_donnees
    PORT( ADDR : in STD_LOGIC_VECTOR (7 downto 0);
       IND : in STD_LOGIC_VECTOR (7 downto 0);
       RW : in STD_LOGIC;
       RST : in STD_LOGIC;
       CLK : in STD_LOGIC;
       OUTD : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    COMPONENT ALU
    PORT( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    COMPONENT doubleport
    PORT( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC_VECTOR (3 downto 0);
           Wb : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    
    
    
    --Clock
    signal CLK_c : std_logic := '0';

    --===========================LI/DI===========================
    --Inputs
    signal LIDI_i: std_logic_vector(31 downto 0) := (others => '0');
    
    --Outputs
    signal LIDI_A_o : std_logic_vector(7 downto 0) := (others => '0');
    signal LIDI_B_o : std_logic_vector(7 downto 0) := (others => '0');
    signal LIDI_C_o : std_logic_vector(7 downto 0) := (others => '0');
    signal LIDI_OP_o : std_logic_vector(7 downto 0) := (others => '0');
    
    --===========================DI/EX===========================
    --Inputs
    signal DIEX_A_i : std_logic_vector(7 downto 0) := (others => '0');
    signal DIEX_B_i : std_logic_vector(7 downto 0) := (others => '0');
    signal DIEX_C_i : std_logic_vector(7 downto 0) := (others => '0');
    signal DIEX_OP_i : std_logic_vector(7 downto 0) := (others => '0');

    --Outputs
    signal DIEX_A_o : std_logic_vector(7 downto 0) := (others => '0');
    signal DIEX_B_o : std_logic_vector(7 downto 0) := (others => '0');
    signal DIEX_C_o : std_logic_vector(7 downto 0) := (others => '0');
    signal DIEX_OP_o : std_logic_vector(7 downto 0) := (others => '0');
    
    --===========================EX/MEM===========================
    --Inputs
    signal EXMEM_A_i : std_logic_vector(7 downto 0) := (others => '0');
    signal EXMEM_B_i : std_logic_vector(7 downto 0) := (others => '0');
    signal EXMEM_C_i : std_logic_vector(7 downto 0) := (others => '0');
    signal EXMEM_OP_i : std_logic_vector(7 downto 0) := (others => '0');

    --Outputs
    signal EXMEM_A_o : std_logic_vector(7 downto 0) := (others => '0');
    signal EXMEM_B_o : std_logic_vector(7 downto 0) := (others => '0');
    signal EXMEM_C_o : std_logic_vector(7 downto 0) := (others => '0');
    signal EXMEM_OP_o : std_logic_vector(7 downto 0) := (others => '0'); 
    
    --===========================MEM/RE===========================
    --Inputs
    signal MEMRE_A_i : std_logic_vector(7 downto 0) := (others => '0');
    signal MEMRE_B_i : std_logic_vector(7 downto 0) := (others => '0');
    signal MEMRE_C_i : std_logic_vector(7 downto 0) := (others => '0');
    signal MEMRE_OP_i : std_logic_vector(7 downto 0) := (others => '0');

    --Outputs
    signal MEMRE_A_o : std_logic_vector(7 downto 0) := (others => '0');
    signal MEMRE_B_o : std_logic_vector(7 downto 0) := (others => '0');
    signal MEMRE_C_o : std_logic_vector(7 downto 0) := (others => '0');
    signal MEMRE_OP_o : std_logic_vector(7 downto 0) := (others => '0'); 
    
    --===========================BANC_INSTRUCTION=========================== 
    --Inputs
    signal BI_ADDR_i: std_logic_vector(7 downto 0) := (others => '0');
    
    --Outputs     
    signal BI_OUTD_o: std_logic_vector(31 downto 0) := (others => '0');     

    --===========================BANC_DONNEES=========================== 
    --Inputs
    signal BD_ADDR_i : std_logic_vector(7 downto 0) := (others => '0');
    signal BD_IND_i  : std_logic_vector(7 downto 0) := (others => '0');
    signal BD_RW_i   : std_logic := '0';
    signal BD_RST_i  : std_logic := '0';

    --Outputs
    signal BD_OUTD_o : std_logic_vector(7 downto 0) := (others => '0');

    --===========================BANC_REGISTREs=========================== 
    --Inputs
    signal BR_A_i: std_logic_vector(3 downto 0) := (others => '0');     
    signal BR_B_i: std_logic_vector(3 downto 0) := (others => '0');     
    signal BR_W_i: std_logic_vector(3 downto 0) := (others => '0');     
    signal BR_Wb_i: std_logic := '0';
    signal BR_DATA_i: std_logic_vector(7 downto 0) := (others => '0');     
    signal BR_RST_i: std_logic := '0';
    
    --Outputs
    signal BR_Qa_o : std_logic_vector(7 downto 0) := (others => '0');
    signal BR_Qb_B_o : std_logic_vector(7 downto 0) := (others => '0');

begin

--Addition 0x01
--Multiplication 0x02
--Soustraction 0x03
--Division 0x04
--Copie 0x05
--Affectation 0x06
--Chargement 0x07
--Sauvegarde 0x08

-- Multiplexeurs
process(CLK_c)
begin
  if rising_edge(CLK_c) then
    
    BI_OUTD_o <= LIDI_i;
    LIDI_A_o <= LIDI_i(7 downto 0);
    LIDI_B_o <= LIDI_i(15 downto 0);
    LIDI_C_o <= LIDI_i(23 downto 0);
    LIDI_OP_o <= LIDI_i(31 downto 0);
    
    DIEX_A_o <= DIEX_A_i;
    DIEX_B_o <= DIEX_B_i;
    DIEX_C_o <= DIEX_C_i;
    DIEX_OP_o <= DIEX_OP_i;

    EXMEM_A_o <= EXMEM_A_i;
    EXMEM_B_o <= EXMEM_B_i;
    EXMEM_C_o <= EXMEM_C_i;
    EXMEM_OP_o <= EXMEM_OP_i;

    MEMRE_A_o <= MEMRE_A_i;
    MEMRE_B_o <= MEMRE_B_i;
    MEMRE_C_o <= MEMRE_C_i;
    MEMRE_OP_o <= MEMRE_OP_i;
    
    case LIDI_OP_o is
      when x"01" =>     
      when x"02" =>
      when x"03" =>
      when x"04" =>
      when x"05" =>
      when x"06" =>
        DIEX_A_i <= LIDI_A_o;
        DIEX_B_i <= LIDI_B_o;
        DIEX_OP_i <= LIDI_OP_o;
      when others => null;
    end case;
    case DIEX_OP_o is
      when x"01" =>     
      when x"02" =>
      when x"03" =>
      when x"04" =>
      when x"05" =>
      when x"06" =>
        EXMEM_A_i <= DIEX_A_o;
        EXMEM_B_i <= DIEX_B_o;
        EXMEM_OP_i <= DIEX_OP_o;
      when others => null;
    end case;
    case EXMEM_OP_o is
      when x"01" =>     
      when x"02" =>
      when x"03" =>
      when x"04" =>
      when x"05" =>
      when x"06" =>
        MEMRE_A_i <= EXMEM_A_o;
        MEMRE_B_i <= EXMEM_B_o;
        MEMRE_OP_i <= EXMEM_OP_o;
      when others => null;
    end case;
    case MEMRE_OP_o is
      when x"01" =>     
      when x"02" =>
      when x"03" =>
      when x"04" =>
      when x"05" =>
      when x"06" =>
        BR_W_i <= EXMEM_A_o;
        BR_Wb_i <= '1';
        BR_DATA_i <= EXMEM_B_o;
      when others => null;
    end case;
  end if;
end process;


