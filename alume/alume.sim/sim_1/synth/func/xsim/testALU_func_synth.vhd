-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Fri May  2 08:59:16 2025
-- Host        : insa-10585 running 64-bit Linux Mint 21.1
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/lacau/GitHub/Kompilator/u_controleur/ALUME/ALUME.sim/sim_1/synth/func/xsim/testALU_func_synth.vhd
-- Design      : ALU
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU is
  port (
    A : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Ctrl_Alu : in STD_LOGIC_VECTOR ( 2 downto 0 );
    N : out STD_LOGIC;
    O : out STD_LOGIC;
    Z : out STD_LOGIC;
    C : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ALU : entity is true;
end ALU;

architecture STRUCTURE of ALU is
  signal A_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal B_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal C_OBUF : STD_LOGIC;
  signal C_reg_i_10_n_0 : STD_LOGIC;
  signal C_reg_i_11_n_0 : STD_LOGIC;
  signal C_reg_i_12_n_0 : STD_LOGIC;
  signal C_reg_i_13_n_1 : STD_LOGIC;
  signal C_reg_i_13_n_3 : STD_LOGIC;
  signal C_reg_i_13_n_6 : STD_LOGIC;
  signal C_reg_i_13_n_7 : STD_LOGIC;
  signal C_reg_i_14_n_0 : STD_LOGIC;
  signal C_reg_i_15_n_0 : STD_LOGIC;
  signal C_reg_i_16_n_0 : STD_LOGIC;
  signal C_reg_i_17_n_0 : STD_LOGIC;
  signal C_reg_i_2_n_0 : STD_LOGIC;
  signal C_reg_i_3_n_0 : STD_LOGIC;
  signal C_reg_i_3_n_1 : STD_LOGIC;
  signal C_reg_i_3_n_2 : STD_LOGIC;
  signal C_reg_i_3_n_3 : STD_LOGIC;
  signal C_reg_i_5_n_0 : STD_LOGIC;
  signal C_reg_i_6_n_0 : STD_LOGIC;
  signal C_reg_i_7_n_0 : STD_LOGIC;
  signal C_reg_i_8_n_0 : STD_LOGIC;
  signal C_reg_i_9_n_0 : STD_LOGIC;
  signal Ctrl_Alu_IBUF : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal N_OBUF : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_1 : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_2 : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_3 : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_4 : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_5 : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_6 : STD_LOGIC;
  signal N_OBUF_inst_i_10_n_7 : STD_LOGIC;
  signal N_OBUF_inst_i_11_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_12_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_13_n_1 : STD_LOGIC;
  signal N_OBUF_inst_i_13_n_3 : STD_LOGIC;
  signal N_OBUF_inst_i_13_n_6 : STD_LOGIC;
  signal N_OBUF_inst_i_13_n_7 : STD_LOGIC;
  signal N_OBUF_inst_i_14_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_15_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_16_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_17_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_18_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_19_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_20_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_21_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_22_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_23_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_24_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_25_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_2_n_1 : STD_LOGIC;
  signal N_OBUF_inst_i_2_n_2 : STD_LOGIC;
  signal N_OBUF_inst_i_2_n_3 : STD_LOGIC;
  signal N_OBUF_inst_i_3_n_3 : STD_LOGIC;
  signal N_OBUF_inst_i_4_n_3 : STD_LOGIC;
  signal N_OBUF_inst_i_4_n_6 : STD_LOGIC;
  signal N_OBUF_inst_i_4_n_7 : STD_LOGIC;
  signal N_OBUF_inst_i_5_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_6_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_7_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_8_n_0 : STD_LOGIC;
  signal N_OBUF_inst_i_9_n_0 : STD_LOGIC;
  signal O_OBUF : STD_LOGIC;
  signal O_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal O_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal O_OBUF_inst_i_4_n_0 : STD_LOGIC;
  signal S_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \S_OBUF[0]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[2]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_10_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_10_n_1\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_10_n_2\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_10_n_3\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_10_n_4\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_11_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_12_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_13_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_14_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_15_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_16_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_17_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_18_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_19_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_20_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_21_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_22_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_23_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_24_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_25_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_26_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_2_n_1\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_2_n_2\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_2_n_3\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_3_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_4_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_5_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_6_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_7_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_8_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_0\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_1\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_2\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_3\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_4\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_5\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_6\ : STD_LOGIC;
  signal \S_OBUF[3]_inst_i_9_n_7\ : STD_LOGIC;
  signal \S_OBUF[4]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[5]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[6]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_10_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_11_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_12_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_13_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_14_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_15_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_16_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_17_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_18_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_19_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_20_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_21_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_22_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_23_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_24_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_25_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_1\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_2\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_3\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_4\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_5\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_6\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_26_n_7\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_1\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_2\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_3\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_4\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_5\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_6\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_27_n_7\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_1\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_2\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_3\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_4\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_5\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_6\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_28_n_7\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_29_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_2_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_2_n_1\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_2_n_2\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_2_n_3\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_30_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_31_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_32_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_33_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_34_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_35_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_36_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_37_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_38_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_39_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_3_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_3_n_1\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_3_n_2\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_3_n_3\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_40_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_41_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_42_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_43_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_44_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_45_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_46_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_47_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_48_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_49_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_4_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_4_n_1\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_4_n_2\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_4_n_3\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_50_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_51_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_52_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_53_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_54_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_55_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_56_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_57_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_58_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_59_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_5_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_5_n_1\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_5_n_2\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_5_n_3\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_6_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_7_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_8_n_0\ : STD_LOGIC;
  signal \S_OBUF[7]_inst_i_9_n_0\ : STD_LOGIC;
  signal Z_OBUF : STD_LOGIC;
  signal Z_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_4_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_5_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_6_n_0 : STD_LOGIC;
  signal Z_OBUF_inst_i_7_n_0 : STD_LOGIC;
  signal aux : STD_LOGIC_VECTOR ( 8 to 8 );
  signal data1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal minusOp : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_C_reg_i_13_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_C_reg_i_13_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_C_reg_i_4_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_C_reg_i_4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_N_OBUF_inst_i_13_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_N_OBUF_inst_i_13_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_N_OBUF_inst_i_2_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_N_OBUF_inst_i_3_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_N_OBUF_inst_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_N_OBUF_inst_i_4_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_N_OBUF_inst_i_4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of C_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of C_reg : label is "VCC:GE GND:CLR";
  attribute HLUTNM : string;
  attribute HLUTNM of C_reg_i_11 : label is "lutpair4";
  attribute HLUTNM of C_reg_i_12 : label is "lutpair3";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of C_reg_i_2 : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of C_reg_i_3 : label is 35;
  attribute HLUTNM of C_reg_i_6 : label is "lutpair4";
  attribute HLUTNM of C_reg_i_7 : label is "lutpair3";
  attribute HLUTNM of C_reg_i_8 : label is "lutpair2";
  attribute ADDER_THRESHOLD of N_OBUF_inst_i_2 : label is 35;
  attribute SOFT_HLUTNM of \S_OBUF[3]_inst_i_25\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \S_OBUF[3]_inst_i_26\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \S_OBUF[3]_inst_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \S_OBUF[5]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \S_OBUF[6]_inst_i_1\ : label is "soft_lutpair0";
  attribute HLUTNM of \S_OBUF[7]_inst_i_10\ : label is "lutpair1";
  attribute HLUTNM of \S_OBUF[7]_inst_i_11\ : label is "lutpair0";
  attribute HLUTNM of \S_OBUF[7]_inst_i_14\ : label is "lutpair2";
  attribute HLUTNM of \S_OBUF[7]_inst_i_15\ : label is "lutpair1";
  attribute HLUTNM of \S_OBUF[7]_inst_i_16\ : label is "lutpair0";
  attribute ADDER_THRESHOLD of \S_OBUF[7]_inst_i_3\ : label is 35;
  attribute SOFT_HLUTNM of \S_OBUF[7]_inst_i_52\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \S_OBUF[7]_inst_i_53\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \S_OBUF[7]_inst_i_54\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \S_OBUF[7]_inst_i_55\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \S_OBUF[7]_inst_i_56\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \S_OBUF[7]_inst_i_58\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \S_OBUF[7]_inst_i_59\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of Z_OBUF_inst_i_5 : label is "soft_lutpair0";
begin
\A_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(0),
      O => A_IBUF(0)
    );
\A_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(1),
      O => A_IBUF(1)
    );
\A_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(2),
      O => A_IBUF(2)
    );
\A_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(3),
      O => A_IBUF(3)
    );
\A_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(4),
      O => A_IBUF(4)
    );
\A_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(5),
      O => A_IBUF(5)
    );
\A_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(6),
      O => A_IBUF(6)
    );
\A_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(7),
      O => A_IBUF(7)
    );
\B_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(0),
      O => B_IBUF(0)
    );
\B_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(1),
      O => B_IBUF(1)
    );
\B_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(2),
      O => B_IBUF(2)
    );
\B_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(3),
      O => B_IBUF(3)
    );
\B_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(4),
      O => B_IBUF(4)
    );
\B_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(5),
      O => B_IBUF(5)
    );
\B_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(6),
      O => B_IBUF(6)
    );
\B_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(7),
      O => B_IBUF(7)
    );
C_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => C_OBUF,
      O => C
    );
C_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => aux(8),
      G => C_reg_i_2_n_0,
      GE => '1',
      Q => C_OBUF
    );
C_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00500CF000500C0"
    )
        port map (
      I0 => N_OBUF_inst_i_3_n_3,
      I1 => data1(8),
      I2 => Ctrl_Alu_IBUF(0),
      I3 => Ctrl_Alu_IBUF(2),
      I4 => Ctrl_Alu_IBUF(1),
      I5 => p_0_out(8),
      O => aux(8)
    );
C_reg_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => C_reg_i_6_n_0,
      I1 => N_OBUF_inst_i_10_n_7,
      I2 => C_reg_i_13_n_1,
      I3 => \S_OBUF[7]_inst_i_28_n_4\,
      O => C_reg_i_10_n_0
    );
C_reg_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_4\,
      I1 => C_reg_i_13_n_6,
      I2 => \S_OBUF[7]_inst_i_28_n_5\,
      I3 => C_reg_i_7_n_0,
      O => C_reg_i_11_n_0
    );
C_reg_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_5\,
      I1 => C_reg_i_13_n_7,
      I2 => \S_OBUF[7]_inst_i_28_n_6\,
      I3 => C_reg_i_8_n_0,
      O => C_reg_i_12_n_0
    );
C_reg_i_13: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[7]_inst_i_27_n_0\,
      CO(3) => NLW_C_reg_i_13_CO_UNCONNECTED(3),
      CO(2) => C_reg_i_13_n_1,
      CO(1) => NLW_C_reg_i_13_CO_UNCONNECTED(1),
      CO(0) => C_reg_i_13_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => C_reg_i_14_n_0,
      DI(0) => C_reg_i_15_n_0,
      O(3 downto 2) => NLW_C_reg_i_13_O_UNCONNECTED(3 downto 2),
      O(1) => C_reg_i_13_n_6,
      O(0) => C_reg_i_13_n_7,
      S(3 downto 2) => B"01",
      S(1) => C_reg_i_16_n_0,
      S(0) => C_reg_i_17_n_0
    );
C_reg_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0888"
    )
        port map (
      I0 => B_IBUF(2),
      I1 => A_IBUF(6),
      I2 => A_IBUF(7),
      I3 => B_IBUF(1),
      O => C_reg_i_14_n_0
    );
C_reg_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000ECA0ECA0ECA0"
    )
        port map (
      I0 => A_IBUF(5),
      I1 => B_IBUF(1),
      I2 => B_IBUF(2),
      I3 => A_IBUF(6),
      I4 => B_IBUF(0),
      I5 => A_IBUF(7),
      O => C_reg_i_15_n_0
    );
C_reg_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F3F"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => A_IBUF(6),
      I2 => B_IBUF(2),
      I3 => A_IBUF(7),
      O => C_reg_i_16_n_0
    );
C_reg_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2540F03F4FBFCF3F"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => A_IBUF(5),
      I2 => B_IBUF(2),
      I3 => A_IBUF(6),
      I4 => A_IBUF(7),
      I5 => B_IBUF(1),
      O => C_reg_i_17_n_0
    );
C_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => Ctrl_Alu_IBUF(1),
      I1 => Ctrl_Alu_IBUF(0),
      I2 => Ctrl_Alu_IBUF(2),
      O => C_reg_i_2_n_0
    );
C_reg_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[7]_inst_i_3_n_0\,
      CO(3) => C_reg_i_3_n_0,
      CO(2) => C_reg_i_3_n_1,
      CO(1) => C_reg_i_3_n_2,
      CO(0) => C_reg_i_3_n_3,
      CYINIT => '0',
      DI(3) => C_reg_i_5_n_0,
      DI(2) => C_reg_i_6_n_0,
      DI(1) => C_reg_i_7_n_0,
      DI(0) => C_reg_i_8_n_0,
      O(3 downto 0) => data1(11 downto 8),
      S(3) => C_reg_i_9_n_0,
      S(2) => C_reg_i_10_n_0,
      S(1) => C_reg_i_11_n_0,
      S(0) => C_reg_i_12_n_0
    );
C_reg_i_4: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[7]_inst_i_4_n_0\,
      CO(3 downto 1) => NLW_C_reg_i_4_CO_UNCONNECTED(3 downto 1),
      CO(0) => p_0_out(8),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_C_reg_i_4_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
C_reg_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => N_OBUF_inst_i_10_n_7,
      I1 => C_reg_i_13_n_1,
      I2 => \S_OBUF[7]_inst_i_28_n_4\,
      O => C_reg_i_5_n_0
    );
C_reg_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_4\,
      I1 => C_reg_i_13_n_6,
      I2 => \S_OBUF[7]_inst_i_28_n_5\,
      O => C_reg_i_6_n_0
    );
C_reg_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_5\,
      I1 => C_reg_i_13_n_7,
      I2 => \S_OBUF[7]_inst_i_28_n_6\,
      O => C_reg_i_7_n_0
    );
C_reg_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_6\,
      I1 => \S_OBUF[7]_inst_i_27_n_4\,
      I2 => \S_OBUF[7]_inst_i_28_n_7\,
      O => C_reg_i_8_n_0
    );
C_reg_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_28_n_4\,
      I1 => C_reg_i_13_n_1,
      I2 => N_OBUF_inst_i_10_n_7,
      I3 => N_OBUF_inst_i_13_n_7,
      I4 => N_OBUF_inst_i_10_n_6,
      O => C_reg_i_9_n_0
    );
\Ctrl_Alu_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Ctrl_Alu(0),
      O => Ctrl_Alu_IBUF(0)
    );
\Ctrl_Alu_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Ctrl_Alu(1),
      O => Ctrl_Alu_IBUF(1)
    );
\Ctrl_Alu_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Ctrl_Alu(2),
      O => Ctrl_Alu_IBUF(2)
    );
N_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => N_OBUF,
      O => N
    );
N_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000450"
    )
        port map (
      I0 => Ctrl_Alu_IBUF(2),
      I1 => data1(15),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => Ctrl_Alu_IBUF(0),
      I4 => N_OBUF_inst_i_3_n_3,
      O => N_OBUF
    );
N_OBUF_inst_i_10: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[7]_inst_i_26_n_0\,
      CO(3) => N_OBUF_inst_i_10_n_0,
      CO(2) => N_OBUF_inst_i_10_n_1,
      CO(1) => N_OBUF_inst_i_10_n_2,
      CO(0) => N_OBUF_inst_i_10_n_3,
      CYINIT => '0',
      DI(3) => N_OBUF_inst_i_14_n_0,
      DI(2) => N_OBUF_inst_i_15_n_0,
      DI(1) => N_OBUF_inst_i_16_n_0,
      DI(0) => N_OBUF_inst_i_17_n_0,
      O(3) => N_OBUF_inst_i_10_n_4,
      O(2) => N_OBUF_inst_i_10_n_5,
      O(1) => N_OBUF_inst_i_10_n_6,
      O(0) => N_OBUF_inst_i_10_n_7,
      S(3) => N_OBUF_inst_i_18_n_0,
      S(2) => N_OBUF_inst_i_19_n_0,
      S(1) => N_OBUF_inst_i_20_n_0,
      S(0) => N_OBUF_inst_i_21_n_0
    );
N_OBUF_inst_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(6),
      I2 => B_IBUF(6),
      I3 => A_IBUF(7),
      O => N_OBUF_inst_i_11_n_0
    );
N_OBUF_inst_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E53F"
    )
        port map (
      I0 => B_IBUF(6),
      I1 => A_IBUF(6),
      I2 => B_IBUF(7),
      I3 => A_IBUF(7),
      O => N_OBUF_inst_i_12_n_0
    );
N_OBUF_inst_i_13: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[7]_inst_i_28_n_0\,
      CO(3) => NLW_N_OBUF_inst_i_13_CO_UNCONNECTED(3),
      CO(2) => N_OBUF_inst_i_13_n_1,
      CO(1) => NLW_N_OBUF_inst_i_13_CO_UNCONNECTED(1),
      CO(0) => N_OBUF_inst_i_13_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => N_OBUF_inst_i_22_n_0,
      DI(0) => N_OBUF_inst_i_23_n_0,
      O(3 downto 2) => NLW_N_OBUF_inst_i_13_O_UNCONNECTED(3 downto 2),
      O(1) => N_OBUF_inst_i_13_n_6,
      O(0) => N_OBUF_inst_i_13_n_7,
      S(3 downto 2) => B"01",
      S(1) => N_OBUF_inst_i_24_n_0,
      S(0) => N_OBUF_inst_i_25_n_0
    );
N_OBUF_inst_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(5),
      I2 => B_IBUF(6),
      I3 => A_IBUF(6),
      O => N_OBUF_inst_i_14_n_0
    );
N_OBUF_inst_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(4),
      I2 => B_IBUF(6),
      I3 => A_IBUF(5),
      O => N_OBUF_inst_i_15_n_0
    );
N_OBUF_inst_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(3),
      I2 => B_IBUF(6),
      I3 => A_IBUF(4),
      O => N_OBUF_inst_i_16_n_0
    );
N_OBUF_inst_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(2),
      I2 => B_IBUF(6),
      I3 => A_IBUF(3),
      O => N_OBUF_inst_i_17_n_0
    );
N_OBUF_inst_i_18: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6FC030C0"
    )
        port map (
      I0 => A_IBUF(5),
      I1 => A_IBUF(7),
      I2 => B_IBUF(6),
      I3 => A_IBUF(6),
      I4 => B_IBUF(7),
      O => N_OBUF_inst_i_18_n_0
    );
N_OBUF_inst_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"903FCF3F"
    )
        port map (
      I0 => A_IBUF(4),
      I1 => A_IBUF(6),
      I2 => B_IBUF(6),
      I3 => A_IBUF(5),
      I4 => B_IBUF(7),
      O => N_OBUF_inst_i_19_n_0
    );
N_OBUF_inst_i_2: unisim.vcomponents.CARRY4
     port map (
      CI => C_reg_i_3_n_0,
      CO(3) => NLW_N_OBUF_inst_i_2_CO_UNCONNECTED(3),
      CO(2) => N_OBUF_inst_i_2_n_1,
      CO(1) => N_OBUF_inst_i_2_n_2,
      CO(0) => N_OBUF_inst_i_2_n_3,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => N_OBUF_inst_i_4_n_7,
      DI(1) => N_OBUF_inst_i_5_n_0,
      DI(0) => N_OBUF_inst_i_6_n_0,
      O(3 downto 0) => data1(15 downto 12),
      S(3) => N_OBUF_inst_i_4_n_6,
      S(2) => N_OBUF_inst_i_7_n_0,
      S(1) => N_OBUF_inst_i_8_n_0,
      S(0) => N_OBUF_inst_i_9_n_0
    );
N_OBUF_inst_i_20: unisim.vcomponents.LUT5
    generic map(
      INIT => X"903FCF3F"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => A_IBUF(5),
      I2 => B_IBUF(6),
      I3 => A_IBUF(4),
      I4 => B_IBUF(7),
      O => N_OBUF_inst_i_20_n_0
    );
N_OBUF_inst_i_21: unisim.vcomponents.LUT5
    generic map(
      INIT => X"903FCF3F"
    )
        port map (
      I0 => A_IBUF(2),
      I1 => A_IBUF(4),
      I2 => B_IBUF(6),
      I3 => A_IBUF(3),
      I4 => B_IBUF(7),
      O => N_OBUF_inst_i_21_n_0
    );
N_OBUF_inst_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0888"
    )
        port map (
      I0 => B_IBUF(5),
      I1 => A_IBUF(6),
      I2 => B_IBUF(4),
      I3 => A_IBUF(7),
      O => N_OBUF_inst_i_22_n_0
    );
N_OBUF_inst_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000EAC0EAC0EAC0"
    )
        port map (
      I0 => B_IBUF(4),
      I1 => A_IBUF(5),
      I2 => B_IBUF(5),
      I3 => A_IBUF(6),
      I4 => A_IBUF(7),
      I5 => B_IBUF(3),
      O => N_OBUF_inst_i_23_n_0
    );
N_OBUF_inst_i_24: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F3F"
    )
        port map (
      I0 => B_IBUF(4),
      I1 => A_IBUF(6),
      I2 => B_IBUF(5),
      I3 => A_IBUF(7),
      O => N_OBUF_inst_i_24_n_0
    );
N_OBUF_inst_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"25404FBFF03FCF3F"
    )
        port map (
      I0 => B_IBUF(3),
      I1 => A_IBUF(5),
      I2 => B_IBUF(5),
      I3 => A_IBUF(6),
      I4 => B_IBUF(4),
      I5 => A_IBUF(7),
      O => N_OBUF_inst_i_25_n_0
    );
N_OBUF_inst_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[7]_inst_i_2_n_0\,
      CO(3 downto 1) => NLW_N_OBUF_inst_i_3_CO_UNCONNECTED(3 downto 1),
      CO(0) => N_OBUF_inst_i_3_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_N_OBUF_inst_i_3_O_UNCONNECTED(3 downto 0),
      S(3 downto 0) => B"0001"
    );
N_OBUF_inst_i_4: unisim.vcomponents.CARRY4
     port map (
      CI => N_OBUF_inst_i_10_n_0,
      CO(3 downto 1) => NLW_N_OBUF_inst_i_4_CO_UNCONNECTED(3 downto 1),
      CO(0) => N_OBUF_inst_i_4_n_3,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => N_OBUF_inst_i_11_n_0,
      O(3 downto 2) => NLW_N_OBUF_inst_i_4_O_UNCONNECTED(3 downto 2),
      O(1) => N_OBUF_inst_i_4_n_6,
      O(0) => N_OBUF_inst_i_4_n_7,
      S(3 downto 1) => B"001",
      S(0) => N_OBUF_inst_i_12_n_0
    );
N_OBUF_inst_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => N_OBUF_inst_i_10_n_5,
      I1 => N_OBUF_inst_i_13_n_6,
      O => N_OBUF_inst_i_5_n_0
    );
N_OBUF_inst_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => N_OBUF_inst_i_10_n_6,
      I1 => N_OBUF_inst_i_13_n_7,
      O => N_OBUF_inst_i_6_n_0
    );
N_OBUF_inst_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => N_OBUF_inst_i_13_n_1,
      I1 => N_OBUF_inst_i_10_n_4,
      I2 => N_OBUF_inst_i_4_n_7,
      O => N_OBUF_inst_i_7_n_0
    );
N_OBUF_inst_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => N_OBUF_inst_i_13_n_6,
      I1 => N_OBUF_inst_i_10_n_5,
      I2 => N_OBUF_inst_i_13_n_1,
      I3 => N_OBUF_inst_i_10_n_4,
      O => N_OBUF_inst_i_8_n_0
    );
N_OBUF_inst_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => N_OBUF_inst_i_13_n_7,
      I1 => N_OBUF_inst_i_10_n_6,
      I2 => N_OBUF_inst_i_13_n_6,
      I3 => N_OBUF_inst_i_10_n_5,
      O => N_OBUF_inst_i_9_n_0
    );
O_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => O_OBUF,
      O => O
    );
O_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => Ctrl_Alu_IBUF(2),
      I1 => Ctrl_Alu_IBUF(0),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => O_OBUF_inst_i_2_n_0,
      O => O_OBUF
    );
O_OBUF_inst_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004544"
    )
        port map (
      I0 => aux(8),
      I1 => Ctrl_Alu_IBUF(2),
      I2 => O_OBUF_inst_i_3_n_0,
      I3 => O_OBUF_inst_i_4_n_0,
      I4 => N_OBUF,
      O => O_OBUF_inst_i_2_n_0
    );
O_OBUF_inst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => Ctrl_Alu_IBUF(1),
      I1 => Ctrl_Alu_IBUF(0),
      I2 => data1(11),
      I3 => data1(10),
      I4 => data1(14),
      I5 => data1(13),
      O => O_OBUF_inst_i_3_n_0
    );
O_OBUF_inst_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFAA03FF"
    )
        port map (
      I0 => N_OBUF_inst_i_3_n_3,
      I1 => data1(12),
      I2 => data1(9),
      I3 => Ctrl_Alu_IBUF(0),
      I4 => Ctrl_Alu_IBUF(1),
      O => O_OBUF_inst_i_4_n_0
    );
\S_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(0),
      O => S(0)
    );
\S_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \S_OBUF[0]_inst_i_2_n_0\,
      O => S_OBUF(0)
    );
\S_OBUF[0]_inst_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => Z_OBUF_inst_i_6_n_0,
      I1 => Z_OBUF_inst_i_7_n_0,
      O => \S_OBUF[0]_inst_i_2_n_0\,
      S => Ctrl_Alu_IBUF(2)
    );
\S_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(1),
      O => S(1)
    );
\S_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F0F8000"
    )
        port map (
      I0 => p_0_out(1),
      I1 => Ctrl_Alu_IBUF(1),
      I2 => Ctrl_Alu_IBUF(2),
      I3 => Ctrl_Alu_IBUF(0),
      I4 => \S_OBUF[1]_inst_i_2_n_0\,
      O => S_OBUF(1)
    );
\S_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => A_IBUF(2),
      I1 => minusOp(1),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => data1(1),
      I4 => Ctrl_Alu_IBUF(0),
      I5 => p_0_out(1),
      O => \S_OBUF[1]_inst_i_2_n_0\
    );
\S_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(2),
      O => S(2)
    );
\S_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8080FF00"
    )
        port map (
      I0 => Ctrl_Alu_IBUF(0),
      I1 => Ctrl_Alu_IBUF(1),
      I2 => p_0_out(2),
      I3 => \S_OBUF[2]_inst_i_2_n_0\,
      I4 => Ctrl_Alu_IBUF(2),
      O => S_OBUF(2)
    );
\S_OBUF[2]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => minusOp(2),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => data1(2),
      I4 => Ctrl_Alu_IBUF(0),
      I5 => p_0_out(2),
      O => \S_OBUF[2]_inst_i_2_n_0\
    );
\S_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(3),
      O => S(3)
    );
\S_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F800F0F8F800000"
    )
        port map (
      I0 => p_0_out(3),
      I1 => Ctrl_Alu_IBUF(0),
      I2 => Ctrl_Alu_IBUF(2),
      I3 => \S_OBUF[3]_inst_i_3_n_0\,
      I4 => Ctrl_Alu_IBUF(1),
      I5 => \S_OBUF[3]_inst_i_4_n_0\,
      O => S_OBUF(3)
    );
\S_OBUF[3]_inst_i_10\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \S_OBUF[3]_inst_i_10_n_0\,
      CO(2) => \S_OBUF[3]_inst_i_10_n_1\,
      CO(1) => \S_OBUF[3]_inst_i_10_n_2\,
      CO(0) => \S_OBUF[3]_inst_i_10_n_3\,
      CYINIT => '0',
      DI(3) => \S_OBUF[3]_inst_i_18_n_0\,
      DI(2) => \S_OBUF[3]_inst_i_19_n_0\,
      DI(1) => \S_OBUF[3]_inst_i_20_n_0\,
      DI(0) => '0',
      O(3) => \S_OBUF[3]_inst_i_10_n_4\,
      O(2 downto 0) => data1(2 downto 0),
      S(3) => \S_OBUF[3]_inst_i_21_n_0\,
      S(2) => \S_OBUF[3]_inst_i_22_n_0\,
      S(1) => \S_OBUF[3]_inst_i_23_n_0\,
      S(0) => \S_OBUF[3]_inst_i_24_n_0\
    );
\S_OBUF[3]_inst_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => B_IBUF(3),
      I1 => A_IBUF(3),
      I2 => A_IBUF(2),
      I3 => B_IBUF(4),
      I4 => A_IBUF(1),
      I5 => B_IBUF(5),
      O => \S_OBUF[3]_inst_i_11_n_0\
    );
\S_OBUF[3]_inst_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => B_IBUF(4),
      I1 => A_IBUF(1),
      I2 => B_IBUF(5),
      I3 => A_IBUF(0),
      O => \S_OBUF[3]_inst_i_12_n_0\
    );
\S_OBUF[3]_inst_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => B_IBUF(4),
      O => \S_OBUF[3]_inst_i_13_n_0\
    );
\S_OBUF[3]_inst_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A953F3F6A6AC0C0"
    )
        port map (
      I0 => A_IBUF(2),
      I1 => A_IBUF(3),
      I2 => B_IBUF(3),
      I3 => A_IBUF(0),
      I4 => B_IBUF(4),
      I5 => \S_OBUF[3]_inst_i_25_n_0\,
      O => \S_OBUF[3]_inst_i_14_n_0\
    );
\S_OBUF[3]_inst_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => B_IBUF(5),
      I2 => A_IBUF(1),
      I3 => B_IBUF(4),
      I4 => B_IBUF(3),
      I5 => A_IBUF(2),
      O => \S_OBUF[3]_inst_i_15_n_0\
    );
\S_OBUF[3]_inst_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => B_IBUF(3),
      I1 => A_IBUF(1),
      I2 => B_IBUF(4),
      I3 => A_IBUF(0),
      O => \S_OBUF[3]_inst_i_16_n_0\
    );
\S_OBUF[3]_inst_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => B_IBUF(3),
      O => \S_OBUF[3]_inst_i_17_n_0\
    );
\S_OBUF[3]_inst_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => B_IBUF(0),
      I2 => B_IBUF(1),
      I3 => A_IBUF(2),
      I4 => A_IBUF(1),
      I5 => B_IBUF(2),
      O => \S_OBUF[3]_inst_i_18_n_0\
    );
\S_OBUF[3]_inst_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => B_IBUF(1),
      I2 => B_IBUF(2),
      I3 => A_IBUF(0),
      O => \S_OBUF[3]_inst_i_19_n_0\
    );
\S_OBUF[3]_inst_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \S_OBUF[3]_inst_i_2_n_0\,
      CO(2) => \S_OBUF[3]_inst_i_2_n_1\,
      CO(1) => \S_OBUF[3]_inst_i_2_n_2\,
      CO(0) => \S_OBUF[3]_inst_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A_IBUF(3 downto 0),
      O(3 downto 0) => p_0_out(3 downto 0),
      S(3) => \S_OBUF[3]_inst_i_5_n_0\,
      S(2) => \S_OBUF[3]_inst_i_6_n_0\,
      S(1) => \S_OBUF[3]_inst_i_7_n_0\,
      S(0) => \S_OBUF[3]_inst_i_8_n_0\
    );
\S_OBUF[3]_inst_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => A_IBUF(0),
      O => \S_OBUF[3]_inst_i_20_n_0\
    );
\S_OBUF[3]_inst_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A3F953F6AC06AC0"
    )
        port map (
      I0 => A_IBUF(2),
      I1 => B_IBUF(0),
      I2 => A_IBUF(3),
      I3 => B_IBUF(1),
      I4 => A_IBUF(0),
      I5 => \S_OBUF[3]_inst_i_26_n_0\,
      O => \S_OBUF[3]_inst_i_21_n_0\
    );
\S_OBUF[3]_inst_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8777788878887888"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => B_IBUF(2),
      I2 => B_IBUF(1),
      I3 => A_IBUF(1),
      I4 => A_IBUF(2),
      I5 => B_IBUF(0),
      O => \S_OBUF[3]_inst_i_22_n_0\
    );
\S_OBUF[3]_inst_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => A_IBUF(1),
      I2 => A_IBUF(0),
      I3 => B_IBUF(1),
      O => \S_OBUF[3]_inst_i_23_n_0\
    );
\S_OBUF[3]_inst_i_24\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => A_IBUF(0),
      O => \S_OBUF[3]_inst_i_24_n_0\
    );
\S_OBUF[3]_inst_i_25\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => B_IBUF(5),
      O => \S_OBUF[3]_inst_i_25_n_0\
    );
\S_OBUF[3]_inst_i_26\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => B_IBUF(2),
      O => \S_OBUF[3]_inst_i_26_n_0\
    );
\S_OBUF[3]_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => A_IBUF(4),
      I1 => Ctrl_Alu_IBUF(0),
      I2 => minusOp(3),
      O => \S_OBUF[3]_inst_i_3_n_0\
    );
\S_OBUF[3]_inst_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => \S_OBUF[3]_inst_i_9_n_7\,
      I1 => \S_OBUF[3]_inst_i_10_n_4\,
      I2 => Ctrl_Alu_IBUF(0),
      I3 => p_0_out(3),
      O => \S_OBUF[3]_inst_i_4_n_0\
    );
\S_OBUF[3]_inst_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => B_IBUF(3),
      O => \S_OBUF[3]_inst_i_5_n_0\
    );
\S_OBUF[3]_inst_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(2),
      I1 => B_IBUF(2),
      O => \S_OBUF[3]_inst_i_6_n_0\
    );
\S_OBUF[3]_inst_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => B_IBUF(1),
      O => \S_OBUF[3]_inst_i_7_n_0\
    );
\S_OBUF[3]_inst_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => B_IBUF(0),
      O => \S_OBUF[3]_inst_i_8_n_0\
    );
\S_OBUF[3]_inst_i_9\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \S_OBUF[3]_inst_i_9_n_0\,
      CO(2) => \S_OBUF[3]_inst_i_9_n_1\,
      CO(1) => \S_OBUF[3]_inst_i_9_n_2\,
      CO(0) => \S_OBUF[3]_inst_i_9_n_3\,
      CYINIT => '0',
      DI(3) => \S_OBUF[3]_inst_i_11_n_0\,
      DI(2) => \S_OBUF[3]_inst_i_12_n_0\,
      DI(1) => \S_OBUF[3]_inst_i_13_n_0\,
      DI(0) => '0',
      O(3) => \S_OBUF[3]_inst_i_9_n_4\,
      O(2) => \S_OBUF[3]_inst_i_9_n_5\,
      O(1) => \S_OBUF[3]_inst_i_9_n_6\,
      O(0) => \S_OBUF[3]_inst_i_9_n_7\,
      S(3) => \S_OBUF[3]_inst_i_14_n_0\,
      S(2) => \S_OBUF[3]_inst_i_15_n_0\,
      S(1) => \S_OBUF[3]_inst_i_16_n_0\,
      S(0) => \S_OBUF[3]_inst_i_17_n_0\
    );
\S_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(4),
      O => S(4)
    );
\S_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CA0A0A0A"
    )
        port map (
      I0 => \S_OBUF[4]_inst_i_2_n_0\,
      I1 => Ctrl_Alu_IBUF(0),
      I2 => Ctrl_Alu_IBUF(2),
      I3 => Ctrl_Alu_IBUF(1),
      I4 => p_0_out(4),
      O => S_OBUF(4)
    );
\S_OBUF[4]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => A_IBUF(5),
      I1 => minusOp(4),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => data1(4),
      I4 => Ctrl_Alu_IBUF(0),
      I5 => p_0_out(4),
      O => \S_OBUF[4]_inst_i_2_n_0\
    );
\S_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(5),
      O => S(5)
    );
\S_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CA0A0A0A"
    )
        port map (
      I0 => \S_OBUF[5]_inst_i_2_n_0\,
      I1 => Ctrl_Alu_IBUF(0),
      I2 => Ctrl_Alu_IBUF(2),
      I3 => Ctrl_Alu_IBUF(1),
      I4 => p_0_out(5),
      O => S_OBUF(5)
    );
\S_OBUF[5]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => A_IBUF(6),
      I1 => minusOp(5),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => data1(5),
      I4 => Ctrl_Alu_IBUF(0),
      I5 => p_0_out(5),
      O => \S_OBUF[5]_inst_i_2_n_0\
    );
\S_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(6),
      O => S(6)
    );
\S_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CA0A0A0A"
    )
        port map (
      I0 => \S_OBUF[6]_inst_i_2_n_0\,
      I1 => Ctrl_Alu_IBUF(0),
      I2 => Ctrl_Alu_IBUF(2),
      I3 => Ctrl_Alu_IBUF(1),
      I4 => p_0_out(6),
      O => S_OBUF(6)
    );
\S_OBUF[6]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => A_IBUF(7),
      I1 => minusOp(6),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => data1(6),
      I4 => Ctrl_Alu_IBUF(0),
      I5 => p_0_out(6),
      O => \S_OBUF[6]_inst_i_2_n_0\
    );
\S_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => S_OBUF(7),
      O => S(7)
    );
\S_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00A00CF000A00C0"
    )
        port map (
      I0 => minusOp(7),
      I1 => data1(7),
      I2 => Ctrl_Alu_IBUF(0),
      I3 => Ctrl_Alu_IBUF(2),
      I4 => Ctrl_Alu_IBUF(1),
      I5 => p_0_out(7),
      O => S_OBUF(7)
    );
\S_OBUF[7]_inst_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_7\,
      I1 => \S_OBUF[7]_inst_i_27_n_5\,
      I2 => \S_OBUF[3]_inst_i_9_n_4\,
      O => \S_OBUF[7]_inst_i_10_n_0\
    );
\S_OBUF[7]_inst_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \S_OBUF[3]_inst_i_9_n_5\,
      I1 => \S_OBUF[7]_inst_i_27_n_6\,
      O => \S_OBUF[7]_inst_i_11_n_0\
    );
\S_OBUF[7]_inst_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \S_OBUF[3]_inst_i_9_n_6\,
      I1 => \S_OBUF[7]_inst_i_27_n_7\,
      O => \S_OBUF[7]_inst_i_12_n_0\
    );
\S_OBUF[7]_inst_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \S_OBUF[3]_inst_i_9_n_7\,
      I1 => \S_OBUF[3]_inst_i_10_n_4\,
      O => \S_OBUF[7]_inst_i_13_n_0\
    );
\S_OBUF[7]_inst_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_6\,
      I1 => \S_OBUF[7]_inst_i_27_n_4\,
      I2 => \S_OBUF[7]_inst_i_28_n_7\,
      I3 => \S_OBUF[7]_inst_i_10_n_0\,
      O => \S_OBUF[7]_inst_i_14_n_0\
    );
\S_OBUF[7]_inst_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_26_n_7\,
      I1 => \S_OBUF[7]_inst_i_27_n_5\,
      I2 => \S_OBUF[3]_inst_i_9_n_4\,
      I3 => \S_OBUF[7]_inst_i_11_n_0\,
      O => \S_OBUF[7]_inst_i_15_n_0\
    );
\S_OBUF[7]_inst_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9666"
    )
        port map (
      I0 => \S_OBUF[3]_inst_i_9_n_5\,
      I1 => \S_OBUF[7]_inst_i_27_n_6\,
      I2 => \S_OBUF[7]_inst_i_27_n_7\,
      I3 => \S_OBUF[3]_inst_i_9_n_6\,
      O => \S_OBUF[7]_inst_i_16_n_0\
    );
\S_OBUF[7]_inst_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => \S_OBUF[3]_inst_i_10_n_4\,
      I1 => \S_OBUF[3]_inst_i_9_n_7\,
      I2 => \S_OBUF[7]_inst_i_27_n_7\,
      I3 => \S_OBUF[3]_inst_i_9_n_6\,
      O => \S_OBUF[7]_inst_i_17_n_0\
    );
\S_OBUF[7]_inst_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(7),
      I1 => B_IBUF(7),
      O => \S_OBUF[7]_inst_i_18_n_0\
    );
\S_OBUF[7]_inst_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(6),
      I1 => B_IBUF(6),
      O => \S_OBUF[7]_inst_i_19_n_0\
    );
\S_OBUF[7]_inst_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[7]_inst_i_5_n_0\,
      CO(3) => \S_OBUF[7]_inst_i_2_n_0\,
      CO(2) => \S_OBUF[7]_inst_i_2_n_1\,
      CO(1) => \S_OBUF[7]_inst_i_2_n_2\,
      CO(0) => \S_OBUF[7]_inst_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A_IBUF(7 downto 4),
      O(3 downto 0) => minusOp(7 downto 4),
      S(3) => \S_OBUF[7]_inst_i_6_n_0\,
      S(2) => \S_OBUF[7]_inst_i_7_n_0\,
      S(1) => \S_OBUF[7]_inst_i_8_n_0\,
      S(0) => \S_OBUF[7]_inst_i_9_n_0\
    );
\S_OBUF[7]_inst_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(5),
      I1 => B_IBUF(5),
      O => \S_OBUF[7]_inst_i_20_n_0\
    );
\S_OBUF[7]_inst_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A_IBUF(4),
      I1 => B_IBUF(4),
      O => \S_OBUF[7]_inst_i_21_n_0\
    );
\S_OBUF[7]_inst_i_22\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(3),
      I1 => A_IBUF(3),
      O => \S_OBUF[7]_inst_i_22_n_0\
    );
\S_OBUF[7]_inst_i_23\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(2),
      I1 => A_IBUF(2),
      O => \S_OBUF[7]_inst_i_23_n_0\
    );
\S_OBUF[7]_inst_i_24\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => A_IBUF(1),
      O => \S_OBUF[7]_inst_i_24_n_0\
    );
\S_OBUF[7]_inst_i_25\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => A_IBUF(0),
      O => \S_OBUF[7]_inst_i_25_n_0\
    );
\S_OBUF[7]_inst_i_26\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \S_OBUF[7]_inst_i_26_n_0\,
      CO(2) => \S_OBUF[7]_inst_i_26_n_1\,
      CO(1) => \S_OBUF[7]_inst_i_26_n_2\,
      CO(0) => \S_OBUF[7]_inst_i_26_n_3\,
      CYINIT => '0',
      DI(3) => \S_OBUF[7]_inst_i_29_n_0\,
      DI(2) => \S_OBUF[7]_inst_i_30_n_0\,
      DI(1) => \S_OBUF[7]_inst_i_31_n_0\,
      DI(0) => '0',
      O(3) => \S_OBUF[7]_inst_i_26_n_4\,
      O(2) => \S_OBUF[7]_inst_i_26_n_5\,
      O(1) => \S_OBUF[7]_inst_i_26_n_6\,
      O(0) => \S_OBUF[7]_inst_i_26_n_7\,
      S(3) => \S_OBUF[7]_inst_i_32_n_0\,
      S(2) => \S_OBUF[7]_inst_i_33_n_0\,
      S(1) => \S_OBUF[7]_inst_i_34_n_0\,
      S(0) => \S_OBUF[7]_inst_i_35_n_0\
    );
\S_OBUF[7]_inst_i_27\: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[3]_inst_i_10_n_0\,
      CO(3) => \S_OBUF[7]_inst_i_27_n_0\,
      CO(2) => \S_OBUF[7]_inst_i_27_n_1\,
      CO(1) => \S_OBUF[7]_inst_i_27_n_2\,
      CO(0) => \S_OBUF[7]_inst_i_27_n_3\,
      CYINIT => '0',
      DI(3) => \S_OBUF[7]_inst_i_36_n_0\,
      DI(2) => \S_OBUF[7]_inst_i_37_n_0\,
      DI(1) => \S_OBUF[7]_inst_i_38_n_0\,
      DI(0) => \S_OBUF[7]_inst_i_39_n_0\,
      O(3) => \S_OBUF[7]_inst_i_27_n_4\,
      O(2) => \S_OBUF[7]_inst_i_27_n_5\,
      O(1) => \S_OBUF[7]_inst_i_27_n_6\,
      O(0) => \S_OBUF[7]_inst_i_27_n_7\,
      S(3) => \S_OBUF[7]_inst_i_40_n_0\,
      S(2) => \S_OBUF[7]_inst_i_41_n_0\,
      S(1) => \S_OBUF[7]_inst_i_42_n_0\,
      S(0) => \S_OBUF[7]_inst_i_43_n_0\
    );
\S_OBUF[7]_inst_i_28\: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[3]_inst_i_9_n_0\,
      CO(3) => \S_OBUF[7]_inst_i_28_n_0\,
      CO(2) => \S_OBUF[7]_inst_i_28_n_1\,
      CO(1) => \S_OBUF[7]_inst_i_28_n_2\,
      CO(0) => \S_OBUF[7]_inst_i_28_n_3\,
      CYINIT => '0',
      DI(3) => \S_OBUF[7]_inst_i_44_n_0\,
      DI(2) => \S_OBUF[7]_inst_i_45_n_0\,
      DI(1) => \S_OBUF[7]_inst_i_46_n_0\,
      DI(0) => \S_OBUF[7]_inst_i_47_n_0\,
      O(3) => \S_OBUF[7]_inst_i_28_n_4\,
      O(2) => \S_OBUF[7]_inst_i_28_n_5\,
      O(1) => \S_OBUF[7]_inst_i_28_n_6\,
      O(0) => \S_OBUF[7]_inst_i_28_n_7\,
      S(3) => \S_OBUF[7]_inst_i_48_n_0\,
      S(2) => \S_OBUF[7]_inst_i_49_n_0\,
      S(1) => \S_OBUF[7]_inst_i_50_n_0\,
      S(0) => \S_OBUF[7]_inst_i_51_n_0\
    );
\S_OBUF[7]_inst_i_29\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(1),
      O => \S_OBUF[7]_inst_i_29_n_0\
    );
\S_OBUF[7]_inst_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \S_OBUF[7]_inst_i_3_n_0\,
      CO(2) => \S_OBUF[7]_inst_i_3_n_1\,
      CO(1) => \S_OBUF[7]_inst_i_3_n_2\,
      CO(0) => \S_OBUF[7]_inst_i_3_n_3\,
      CYINIT => '0',
      DI(3) => \S_OBUF[7]_inst_i_10_n_0\,
      DI(2) => \S_OBUF[7]_inst_i_11_n_0\,
      DI(1) => \S_OBUF[7]_inst_i_12_n_0\,
      DI(0) => \S_OBUF[7]_inst_i_13_n_0\,
      O(3 downto 0) => data1(7 downto 4),
      S(3) => \S_OBUF[7]_inst_i_14_n_0\,
      S(2) => \S_OBUF[7]_inst_i_15_n_0\,
      S(1) => \S_OBUF[7]_inst_i_16_n_0\,
      S(0) => \S_OBUF[7]_inst_i_17_n_0\
    );
\S_OBUF[7]_inst_i_30\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => B_IBUF(7),
      O => \S_OBUF[7]_inst_i_30_n_0\
    );
\S_OBUF[7]_inst_i_31\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => B_IBUF(7),
      O => \S_OBUF[7]_inst_i_31_n_0\
    );
\S_OBUF[7]_inst_i_32\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"956AC0C0"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => A_IBUF(3),
      I2 => B_IBUF(6),
      I3 => A_IBUF(2),
      I4 => B_IBUF(7),
      O => \S_OBUF[7]_inst_i_32_n_0\
    );
\S_OBUF[7]_inst_i_33\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(1),
      I2 => B_IBUF(6),
      I3 => A_IBUF(2),
      O => \S_OBUF[7]_inst_i_33_n_0\
    );
\S_OBUF[7]_inst_i_34\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8777"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(0),
      I2 => B_IBUF(6),
      I3 => A_IBUF(1),
      O => \S_OBUF[7]_inst_i_34_n_0\
    );
\S_OBUF[7]_inst_i_35\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => B_IBUF(6),
      O => \S_OBUF[7]_inst_i_35_n_0\
    );
\S_OBUF[7]_inst_i_36\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(2),
      I1 => A_IBUF(4),
      I2 => A_IBUF(5),
      I3 => B_IBUF(1),
      I4 => B_IBUF(0),
      I5 => A_IBUF(6),
      O => \S_OBUF[7]_inst_i_36_n_0\
    );
\S_OBUF[7]_inst_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(2),
      I1 => A_IBUF(3),
      I2 => A_IBUF(4),
      I3 => B_IBUF(1),
      I4 => B_IBUF(0),
      I5 => A_IBUF(5),
      O => \S_OBUF[7]_inst_i_37_n_0\
    );
\S_OBUF[7]_inst_i_38\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(2),
      I1 => A_IBUF(2),
      I2 => A_IBUF(3),
      I3 => B_IBUF(1),
      I4 => B_IBUF(0),
      I5 => A_IBUF(4),
      O => \S_OBUF[7]_inst_i_38_n_0\
    );
\S_OBUF[7]_inst_i_39\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(2),
      I1 => A_IBUF(1),
      I2 => A_IBUF(2),
      I3 => B_IBUF(1),
      I4 => B_IBUF(0),
      I5 => A_IBUF(3),
      O => \S_OBUF[7]_inst_i_39_n_0\
    );
\S_OBUF[7]_inst_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \S_OBUF[3]_inst_i_2_n_0\,
      CO(3) => \S_OBUF[7]_inst_i_4_n_0\,
      CO(2) => \S_OBUF[7]_inst_i_4_n_1\,
      CO(1) => \S_OBUF[7]_inst_i_4_n_2\,
      CO(0) => \S_OBUF[7]_inst_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => A_IBUF(7 downto 4),
      O(3 downto 0) => p_0_out(7 downto 4),
      S(3) => \S_OBUF[7]_inst_i_18_n_0\,
      S(2) => \S_OBUF[7]_inst_i_19_n_0\,
      S(1) => \S_OBUF[7]_inst_i_20_n_0\,
      S(0) => \S_OBUF[7]_inst_i_21_n_0\
    );
\S_OBUF[7]_inst_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A6A6A959595"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_36_n_0\,
      I1 => B_IBUF(1),
      I2 => A_IBUF(6),
      I3 => A_IBUF(5),
      I4 => B_IBUF(2),
      I5 => \S_OBUF[7]_inst_i_52_n_0\,
      O => \S_OBUF[7]_inst_i_40_n_0\
    );
\S_OBUF[7]_inst_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_37_n_0\,
      I1 => B_IBUF(2),
      I2 => A_IBUF(4),
      I3 => \S_OBUF[7]_inst_i_53_n_0\,
      I4 => B_IBUF(0),
      I5 => A_IBUF(6),
      O => \S_OBUF[7]_inst_i_41_n_0\
    );
\S_OBUF[7]_inst_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_38_n_0\,
      I1 => B_IBUF(2),
      I2 => A_IBUF(3),
      I3 => \S_OBUF[7]_inst_i_54_n_0\,
      I4 => B_IBUF(0),
      I5 => A_IBUF(5),
      O => \S_OBUF[7]_inst_i_42_n_0\
    );
\S_OBUF[7]_inst_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_39_n_0\,
      I1 => B_IBUF(2),
      I2 => A_IBUF(2),
      I3 => \S_OBUF[7]_inst_i_55_n_0\,
      I4 => B_IBUF(0),
      I5 => A_IBUF(4),
      O => \S_OBUF[7]_inst_i_43_n_0\
    );
\S_OBUF[7]_inst_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(5),
      I1 => A_IBUF(4),
      I2 => B_IBUF(4),
      I3 => A_IBUF(5),
      I4 => A_IBUF(6),
      I5 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_44_n_0\
    );
\S_OBUF[7]_inst_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(5),
      I1 => A_IBUF(3),
      I2 => B_IBUF(4),
      I3 => A_IBUF(4),
      I4 => A_IBUF(5),
      I5 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_45_n_0\
    );
\S_OBUF[7]_inst_i_46\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(5),
      I1 => A_IBUF(2),
      I2 => B_IBUF(4),
      I3 => A_IBUF(3),
      I4 => A_IBUF(4),
      I5 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_46_n_0\
    );
\S_OBUF[7]_inst_i_47\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888800080008000"
    )
        port map (
      I0 => B_IBUF(5),
      I1 => A_IBUF(1),
      I2 => B_IBUF(4),
      I3 => A_IBUF(2),
      I4 => A_IBUF(3),
      I5 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_47_n_0\
    );
\S_OBUF[7]_inst_i_48\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"956A6A6A6A959595"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_44_n_0\,
      I1 => A_IBUF(6),
      I2 => B_IBUF(4),
      I3 => A_IBUF(5),
      I4 => B_IBUF(5),
      I5 => \S_OBUF[7]_inst_i_56_n_0\,
      O => \S_OBUF[7]_inst_i_48_n_0\
    );
\S_OBUF[7]_inst_i_49\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_45_n_0\,
      I1 => B_IBUF(5),
      I2 => A_IBUF(4),
      I3 => \S_OBUF[7]_inst_i_57_n_0\,
      I4 => A_IBUF(6),
      I5 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_49_n_0\
    );
\S_OBUF[7]_inst_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \S_OBUF[7]_inst_i_5_n_0\,
      CO(2) => \S_OBUF[7]_inst_i_5_n_1\,
      CO(1) => \S_OBUF[7]_inst_i_5_n_2\,
      CO(0) => \S_OBUF[7]_inst_i_5_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => A_IBUF(3 downto 0),
      O(3 downto 0) => minusOp(3 downto 0),
      S(3) => \S_OBUF[7]_inst_i_22_n_0\,
      S(2) => \S_OBUF[7]_inst_i_23_n_0\,
      S(1) => \S_OBUF[7]_inst_i_24_n_0\,
      S(0) => \S_OBUF[7]_inst_i_25_n_0\
    );
\S_OBUF[7]_inst_i_50\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_46_n_0\,
      I1 => B_IBUF(5),
      I2 => A_IBUF(3),
      I3 => \S_OBUF[7]_inst_i_58_n_0\,
      I4 => A_IBUF(5),
      I5 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_50_n_0\
    );
\S_OBUF[7]_inst_i_51\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => \S_OBUF[7]_inst_i_47_n_0\,
      I1 => B_IBUF(5),
      I2 => A_IBUF(2),
      I3 => \S_OBUF[7]_inst_i_59_n_0\,
      I4 => A_IBUF(4),
      I5 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_51_n_0\
    );
\S_OBUF[7]_inst_i_52\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => A_IBUF(7),
      O => \S_OBUF[7]_inst_i_52_n_0\
    );
\S_OBUF[7]_inst_i_53\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => A_IBUF(5),
      O => \S_OBUF[7]_inst_i_53_n_0\
    );
\S_OBUF[7]_inst_i_54\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => A_IBUF(4),
      O => \S_OBUF[7]_inst_i_54_n_0\
    );
\S_OBUF[7]_inst_i_55\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => A_IBUF(3),
      O => \S_OBUF[7]_inst_i_55_n_0\
    );
\S_OBUF[7]_inst_i_56\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(7),
      I1 => B_IBUF(3),
      O => \S_OBUF[7]_inst_i_56_n_0\
    );
\S_OBUF[7]_inst_i_57\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(5),
      I1 => B_IBUF(4),
      O => \S_OBUF[7]_inst_i_57_n_0\
    );
\S_OBUF[7]_inst_i_58\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(4),
      I1 => B_IBUF(4),
      O => \S_OBUF[7]_inst_i_58_n_0\
    );
\S_OBUF[7]_inst_i_59\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => B_IBUF(4),
      O => \S_OBUF[7]_inst_i_59_n_0\
    );
\S_OBUF[7]_inst_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(7),
      I1 => A_IBUF(7),
      O => \S_OBUF[7]_inst_i_6_n_0\
    );
\S_OBUF[7]_inst_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(6),
      I1 => A_IBUF(6),
      O => \S_OBUF[7]_inst_i_7_n_0\
    );
\S_OBUF[7]_inst_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(5),
      I1 => A_IBUF(5),
      O => \S_OBUF[7]_inst_i_8_n_0\
    );
\S_OBUF[7]_inst_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => B_IBUF(4),
      I1 => A_IBUF(4),
      O => \S_OBUF[7]_inst_i_9_n_0\
    );
Z_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Z_OBUF,
      O => Z
    );
Z_OBUF_inst_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => O_OBUF_inst_i_2_n_0,
      I1 => Z_OBUF_inst_i_2_n_0,
      I2 => S_OBUF(2),
      I3 => S_OBUF(3),
      I4 => Z_OBUF_inst_i_3_n_0,
      I5 => Z_OBUF_inst_i_4_n_0,
      O => Z_OBUF
    );
Z_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222F2FFFFFFF2FF"
    )
        port map (
      I0 => p_0_out(1),
      I1 => Z_OBUF_inst_i_5_n_0,
      I2 => \S_OBUF[1]_inst_i_2_n_0\,
      I3 => Z_OBUF_inst_i_6_n_0,
      I4 => Ctrl_Alu_IBUF(2),
      I5 => Z_OBUF_inst_i_7_n_0,
      O => Z_OBUF_inst_i_2_n_0
    );
Z_OBUF_inst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAFFAAFFEAAAAAAA"
    )
        port map (
      I0 => S_OBUF(7),
      I1 => p_0_out(6),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => Ctrl_Alu_IBUF(2),
      I4 => Ctrl_Alu_IBUF(0),
      I5 => \S_OBUF[6]_inst_i_2_n_0\,
      O => Z_OBUF_inst_i_3_n_0
    );
Z_OBUF_inst_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FA00FAFFFFCCFE"
    )
        port map (
      I0 => p_0_out(5),
      I1 => \S_OBUF[5]_inst_i_2_n_0\,
      I2 => p_0_out(4),
      I3 => Z_OBUF_inst_i_5_n_0,
      I4 => \S_OBUF[4]_inst_i_2_n_0\,
      I5 => Ctrl_Alu_IBUF(2),
      O => Z_OBUF_inst_i_4_n_0
    );
Z_OBUF_inst_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => Ctrl_Alu_IBUF(0),
      I1 => Ctrl_Alu_IBUF(2),
      I2 => Ctrl_Alu_IBUF(1),
      O => Z_OBUF_inst_i_5_n_0
    );
Z_OBUF_inst_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => data1(0),
      I1 => p_0_out(0),
      I2 => Ctrl_Alu_IBUF(1),
      I3 => A_IBUF(1),
      I4 => Ctrl_Alu_IBUF(0),
      I5 => minusOp(0),
      O => Z_OBUF_inst_i_6_n_0
    );
Z_OBUF_inst_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4C4F4373"
    )
        port map (
      I0 => p_0_out(0),
      I1 => Ctrl_Alu_IBUF(1),
      I2 => Ctrl_Alu_IBUF(0),
      I3 => B_IBUF(1),
      I4 => A_IBUF(1),
      O => Z_OBUF_inst_i_7_n_0
    );
end STRUCTURE;
