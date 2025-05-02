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
--  Port ( );
end pipeline;

architecture Structural of pipeline is
    COMPONENT banc_instructions
    PORT( ADDR : in STD_LOGIC_VECTOR (7 downto 0);
       CLK : in STD_LOGIC;
       OUTD : out STD_LOGIC_VECTOR (31 downto 0));
    END COMPONENT;
    COMPONENT etage_pipeline
    PORT( A_i : in STD_LOGIC_VECTOR (7 downto 0);
       OP_i : in STD_LOGIC_VECTOR (7 downto 0);
       B_i : in STD_LOGIC_VECTOR (7 downto 0);
       C_i : in STD_LOGIC_VECTOR (7 downto 0);
       CLK : in STD_LOGIC; 
       A_o : out STD_LOGIC_VECTOR (7 downto 0);
       OP_o : out STD_LOGIC_VECTOR (7 downto 0);
       B_o : out STD_LOGIC_VECTOR (7 downto 0);
       C_o : out STD_LOGIC_VECTOR (7 downto 0));
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
    signal BAIN_ADDR_i: std_logic_vector(7 downto 0) := (others => '0');     
    
begin

    Label_LIDI: etage_pipeline PORT MAP (
        A_i => LIDI_i(7 downto 0),
        B_i => LIDI_i(23 downto 16),
        C_i => LIDI_i(31 downto 24),
        OP_i => LIDI_i(15 downto 8),
        CLK => CLK_c,
        A_o => LIDI_A_o,
        B_o => LIDI_B_o,
        C_o => LIDI_C_o,
        OP_o => LIDI_OP_o
    );
    
    Label_DIEX: etage_pipeline PORT MAP (
        A_i => LIDI_A_o,
        B_i => DIEX_B_i,
        C_i => DIEX_C_i,
        OP_i => LIDI_OP_o,
        CLK => CLK_c,
        A_o => DIEX_A_o,
        B_o => DIEX_B_o,
        C_o => DIEX_C_o,
        OP_o => DIEX_OP_o
    );
    
    Label_EXMEM: etage_pipeline PORT MAP (
        A_i => DIEX_A_o,
        B_i => EXMEM_B_i,
        C_i => EXMEM_C_i,
        OP_i => LIDI_OP_o,
        CLK => CLK_c,
        A_o => EXMEM_A_o,
        B_o => EXMEM_B_o,
        C_o => EXMEM_C_o,
        OP_o => EXMEM_OP_o
    );
    
    Label_MEMRE: etage_pipeline PORT MAP (
        A_i => EXMEM_A_o,
        B_i => MEMRE_B_i,
        C_i => MEMRE_C_i,
        OP_i => EXMEM_OP_o,
        CLK => CLK_c,
        A_o => MEMRE_A_o,
        B_o => MEMRE_B_o,
        C_o => MEMRE_C_o,
        OP_o => MEMRE_OP_o
    );
    
    Label_Banc_Instruction: banc_instructions PORT MAP (
        ADDR => BAIN_ADDR_i,
        CLK => CLK_c,
        OUTD => LIDI_i
    );


end Structural;
