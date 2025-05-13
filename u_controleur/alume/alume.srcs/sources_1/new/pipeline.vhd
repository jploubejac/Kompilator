library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- add leds
entity pipeline is
    Port(
        clk : in std_logic;
        rst: in std_logic);
end pipeline;

architecture Behavioral of pipeline is
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
    signal BD_RST_i  : std_logic := '1';

    --Outputs
    signal BD_OUTD_o : std_logic_vector(7 downto 0) := (others => '0');

    --===========================BANC_REGISTREs=========================== 
    --Inputs
    signal BR_A_i: std_logic_vector(3 downto 0) := (others => '0');     
    signal BR_B_i: std_logic_vector(3 downto 0) := (others => '0');     
    signal BR_W_i: std_logic_vector(3 downto 0) := (others => '0');     
    signal BR_Wb_i: std_logic := '0';
    signal BR_DATA_i: std_logic_vector(7 downto 0) := (others => '0');     
    signal BR_RST_i: std_logic := '1';
    
    --Outputs
    signal BR_Qa_o : std_logic_vector(7 downto 0) := (others => '0');
    signal BR_Qb_o : std_logic_vector(7 downto 0) := (others => '0');

    --===========================ALU=========================== 
    signal ALU_A_i : std_logic_vector(7 downto 0) := (others => '0');
    signal ALU_B_i : std_logic_vector(7 downto 0) := (others => '0');
    signal ALU_Ctrl_Alu_i : std_logic_vector(2 downto 0) := (others => '0');
    signal ALU_N_o :  std_logic := '0';
    signal ALU_O_o : std_logic := '0';
    signal ALU_Z_o : std_logic := '0';
    signal ALU_C_o : std_logic := '0';
    signal ALU_S_o : std_logic_vector(7 downto 0) := (others => '0');

    signal LC_DONNEES : std_logic := '0';
    signal LC_ALU : std_logic_vector(2 downto 0) := "000";
    signal LC_BD : std_logic := '0'; 

begin


-- Instanciation du composant banc_instructions
U_banc_instructions : banc_instructions
    Port map(
        ADDR => BI_ADDR_i,
        CLK => CLK,
        OUTD => BI_OUTD_o
    );

-- Instanciation du composant banc_donnees
U_banc_donnees : banc_donnees
    Port map(
        ADDR => BD_ADDR_i,
       IND => BD_IND_i,
       RW => BD_RW_i,
       RST => BD_RST_i,
       CLK => CLK,
       OUTD => BD_OUTD_o
    );
    
-- Instanciation du composant banc_registres
U_banc_registres : doubleport
    Port map(
        A => BR_A_i,
           B => BR_B_i,
           W => BR_W_i,
           Wb => BR_Wb_i,
           DATA => BR_DATA_i,
           RST => BR_RST_i,
           CLK => CLK,
           QA => BR_QA_o,
           QB => BR_QB_o
    );
   
    
-- Instanciation du composant banc_ALU
U_ALU : ALU
    Port map(
        A => ALU_A_i,
        B => ALU_B_i,
        Ctrl_Alu => ALU_Ctrl_Alu_i,
        N => ALU_N_o,
        O => ALU_O_o,
        Z => ALU_Z_o,
        C => ALU_C_o,
        S => ALU_S_o
    );
    
LIDI_i <= BI_OUTD_o;



--Addition 0x01
--Multiplication 0x02
--Soustraction 0x03
--Division 0x04
--Copie 0x05
--Affectation 0x06
--Chargement 0x07
--Sauvegarde 0x08

-- Multiplexeurs

DIEX_A_i <= LIDI_A_o;
DIEX_OP_i <= LIDI_OP_o;
DIEX_B_i <= LIDI_B_o when LIDI_OP_o = x"06" else BR_QA_o;
DIEX_C_i <= BR_QB_o;

EXMEM_A_i <= DIEX_A_o;
EXMEM_OP_i <= DIEX_OP_o;
EXMEM_B_i <= ALU_S_o when (DIEX_OP_o = x"01" or DIEX_OP_o = x"02" or DIEX_OP_o = x"03" or DIEX_OP_o = x"04") else DIEX_B_o;


MEMRE_A_i <= EXMEM_A_o;
MEMRE_OP_i <= BD_Out_o when (EXMEM_OP_o = x"16" )else EXMEM_OP_o;
MEMRE_B_i <= EXMEM_B_o;

LC_DONNEES <= '1' when MEMRE_OP_o = x"06" or
                        MEMRE_OP_o = x"05" or 
                        MEMRE_OP_o = x"01" or 
                        MEMRE_OP_o = x"02" or 
                        MEMRE_OP_o = x"03" or
                        MEMRE_OP_o = x"04" else
                        '0';
    
BR_DATA_i <= MEMRE_B_o;
BR_Wb_i <= LC_DONNEES;
BR_W_i <= MEMRE_A_o(3 downto 0);
BR_A_i <= LIDI_B_o (3 downto 0);
BR_B_i <= LIDI_C_o (3 downto 0);

ALU_B_i <= DIEX_C_o;
ALU_A_i <= DIEX_B_o;

ALU_Ctrl_Alu_i <= LC_ALU;

LC_ALU <= "000" when DIEX_OP_o = x"01" else
           "001" when DIEX_OP_o = x"02" else
           "010" when DIEX_OP_o = x"03" else
           "011" when DIEX_OP_o = x"04" else
           "000";

BD_Addr_i <= EXMEM_B_o;

LC_BD <= '1' when EXMEM_OP_o = x"16" else '0' 

BD_RW_i <= LC_BD

process(CLK)
begin
  if rising_edge(CLK) then
    BI_ADDR_i <= std_logic_vector(unsigned(BI_ADDR_i) + 1);
    --report "ADDR: " & integer'image(to_integer(unsigned(BI_ADDR_i)));
    LIDI_A_o <= LIDI_i(7 downto 0);
    LIDI_OP_o <= LIDI_i(15 downto 8);
    LIDI_B_o <= LIDI_i(23 downto 16);
    LIDI_C_o <= LIDI_i(31 downto 24);

    -----------PAS TOUCHER-------------
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
    -----------------------------
  end if;
end process;
end Behavioral;