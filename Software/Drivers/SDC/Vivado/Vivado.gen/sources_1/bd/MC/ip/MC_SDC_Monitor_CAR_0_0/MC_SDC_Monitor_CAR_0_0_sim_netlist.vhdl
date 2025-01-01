-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Thu Dec 26 16:48:46 2024
-- Host        : mikkelsPC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0_sim_netlist.vhdl
-- Design      : MC_SDC_Monitor_CAR_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR is
  port (
    SDC_NOT_CLOSED_VECTOR_O : out STD_LOGIC_VECTOR ( 16 downto 0 );
    TSMS_I : in STD_LOGIC;
    TSMP_I : in STD_LOGIC;
    HVD_I : in STD_LOGIC;
    BSPD_I : in STD_LOGIC;
    TSAC_AMS_ENABLE_I : in STD_LOGIC;
    TSAC_IMD_I : in STD_LOGIC;
    TSAC_HV_CONNECTOR_I : in STD_LOGIC;
    RL_WHEEL_I : in STD_LOGIC;
    RR_WHEEL_I : in STD_LOGIC;
    FL_WHEEL_I : in STD_LOGIC;
    FR_WHEEL_I : in STD_LOGIC;
    R_EMERGENCY_BUTTON_I : in STD_LOGIC;
    L_EMERGENCY_BUTTON_I : in STD_LOGIC;
    INERTIA_I : in STD_LOGIC;
    BOTS_I : in STD_LOGIC;
    COCKPIT_EMERGENCY_I : in STD_LOGIC;
    SDC_SUPPLY_I : in STD_LOGIC;
    CLK_I : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR : entity is "SDC_Monitor_CAR";
end MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR;

architecture STRUCTURE of MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR is
  signal StartUp_Enable : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_n_1\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_n_2\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__0_n_3\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_n_1\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_n_2\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__1_n_3\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_n_0\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_n_1\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_n_2\ : STD_LOGIC;
  signal \StartUp_Enable1_carry__2_n_3\ : STD_LOGIC;
  signal StartUp_Enable1_carry_i_1_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_i_2_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_i_3_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_i_4_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_i_5_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_i_6_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_i_7_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_i_8_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_n_0 : STD_LOGIC;
  signal StartUp_Enable1_carry_n_1 : STD_LOGIC;
  signal StartUp_Enable1_carry_n_2 : STD_LOGIC;
  signal StartUp_Enable1_carry_n_3 : STD_LOGIC;
  signal StartUp_Enable_i_1_n_0 : STD_LOGIC;
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal NLW_StartUp_Enable1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_StartUp_Enable1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_StartUp_Enable1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_StartUp_Enable1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[10]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[10]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[11]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[11]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[12]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[12]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[13]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[13]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[14]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[14]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[15]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[15]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[16]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[16]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[4]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[4]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[5]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[5]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[6]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[6]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[7]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[7]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[8]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[8]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_NOT_CLOSED_VECTOR_O_reg[9]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_NOT_CLOSED_VECTOR_O_reg[9]\ : label is "VCC:GE GND:CLR";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of StartUp_Enable1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \StartUp_Enable1_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \StartUp_Enable1_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \StartUp_Enable1_carry__2\ : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
begin
\SDC_NOT_CLOSED_VECTOR_O_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => SDC_SUPPLY_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(0)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSAC_HV_CONNECTOR_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(10)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSAC_IMD_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(11)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSAC_AMS_ENABLE_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(12)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => BSPD_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(13)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => HVD_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(14)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSMP_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(15)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[16]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSMS_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(16)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => COCKPIT_EMERGENCY_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(1)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => BOTS_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(2)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => INERTIA_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(3)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => L_EMERGENCY_BUTTON_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(4)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => R_EMERGENCY_BUTTON_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(5)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => FR_WHEEL_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(6)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => FL_WHEEL_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(7)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => RR_WHEEL_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(8)
    );
\SDC_NOT_CLOSED_VECTOR_O_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => RL_WHEEL_I,
      G => StartUp_Enable,
      GE => '1',
      Q => SDC_NOT_CLOSED_VECTOR_O(9)
    );
StartUp_Enable1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => StartUp_Enable1_carry_n_0,
      CO(2) => StartUp_Enable1_carry_n_1,
      CO(1) => StartUp_Enable1_carry_n_2,
      CO(0) => StartUp_Enable1_carry_n_3,
      CYINIT => '1',
      DI(3) => StartUp_Enable1_carry_i_1_n_0,
      DI(2) => StartUp_Enable1_carry_i_2_n_0,
      DI(1) => StartUp_Enable1_carry_i_3_n_0,
      DI(0) => StartUp_Enable1_carry_i_4_n_0,
      O(3 downto 0) => NLW_StartUp_Enable1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => StartUp_Enable1_carry_i_5_n_0,
      S(2) => StartUp_Enable1_carry_i_6_n_0,
      S(1) => StartUp_Enable1_carry_i_7_n_0,
      S(0) => StartUp_Enable1_carry_i_8_n_0
    );
\StartUp_Enable1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => StartUp_Enable1_carry_n_0,
      CO(3) => \StartUp_Enable1_carry__0_n_0\,
      CO(2) => \StartUp_Enable1_carry__0_n_1\,
      CO(1) => \StartUp_Enable1_carry__0_n_2\,
      CO(0) => \StartUp_Enable1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \StartUp_Enable1_carry__0_i_1_n_0\,
      DI(2) => counter_reg(13),
      DI(1) => counter_reg(11),
      DI(0) => \StartUp_Enable1_carry__0_i_2_n_0\,
      O(3 downto 0) => \NLW_StartUp_Enable1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \StartUp_Enable1_carry__0_i_3_n_0\,
      S(2) => \StartUp_Enable1_carry__0_i_4_n_0\,
      S(1) => \StartUp_Enable1_carry__0_i_5_n_0\,
      S(0) => \StartUp_Enable1_carry__0_i_6_n_0\
    );
\StartUp_Enable1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => counter_reg(14),
      I1 => counter_reg(15),
      O => \StartUp_Enable1_carry__0_i_1_n_0\
    );
\StartUp_Enable1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => counter_reg(8),
      I1 => counter_reg(9),
      O => \StartUp_Enable1_carry__0_i_2_n_0\
    );
\StartUp_Enable1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(15),
      I1 => counter_reg(14),
      O => \StartUp_Enable1_carry__0_i_3_n_0\
    );
\StartUp_Enable1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(12),
      I1 => counter_reg(13),
      O => \StartUp_Enable1_carry__0_i_4_n_0\
    );
\StartUp_Enable1_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(10),
      I1 => counter_reg(11),
      O => \StartUp_Enable1_carry__0_i_5_n_0\
    );
\StartUp_Enable1_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(8),
      O => \StartUp_Enable1_carry__0_i_6_n_0\
    );
\StartUp_Enable1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \StartUp_Enable1_carry__0_n_0\,
      CO(3) => \StartUp_Enable1_carry__1_n_0\,
      CO(2) => \StartUp_Enable1_carry__1_n_1\,
      CO(1) => \StartUp_Enable1_carry__1_n_2\,
      CO(0) => \StartUp_Enable1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \StartUp_Enable1_carry__1_i_1_n_0\,
      DI(2) => counter_reg(21),
      DI(1) => \StartUp_Enable1_carry__1_i_2_n_0\,
      DI(0) => \StartUp_Enable1_carry__1_i_3_n_0\,
      O(3 downto 0) => \NLW_StartUp_Enable1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \StartUp_Enable1_carry__1_i_4_n_0\,
      S(2) => \StartUp_Enable1_carry__1_i_5_n_0\,
      S(1) => \StartUp_Enable1_carry__1_i_6_n_0\,
      S(0) => \StartUp_Enable1_carry__1_i_7_n_0\
    );
\StartUp_Enable1_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => counter_reg(22),
      I1 => counter_reg(23),
      O => \StartUp_Enable1_carry__1_i_1_n_0\
    );
\StartUp_Enable1_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => counter_reg(18),
      I1 => counter_reg(19),
      O => \StartUp_Enable1_carry__1_i_2_n_0\
    );
\StartUp_Enable1_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(16),
      I1 => counter_reg(17),
      O => \StartUp_Enable1_carry__1_i_3_n_0\
    );
\StartUp_Enable1_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(23),
      I1 => counter_reg(22),
      O => \StartUp_Enable1_carry__1_i_4_n_0\
    );
\StartUp_Enable1_carry__1_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(20),
      I1 => counter_reg(21),
      O => \StartUp_Enable1_carry__1_i_5_n_0\
    );
\StartUp_Enable1_carry__1_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(19),
      I1 => counter_reg(18),
      O => \StartUp_Enable1_carry__1_i_6_n_0\
    );
\StartUp_Enable1_carry__1_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(16),
      I1 => counter_reg(17),
      O => \StartUp_Enable1_carry__1_i_7_n_0\
    );
\StartUp_Enable1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \StartUp_Enable1_carry__1_n_0\,
      CO(3) => \StartUp_Enable1_carry__2_n_0\,
      CO(2) => \StartUp_Enable1_carry__2_n_1\,
      CO(1) => \StartUp_Enable1_carry__2_n_2\,
      CO(0) => \StartUp_Enable1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \StartUp_Enable1_carry__2_i_1_n_0\,
      DI(2) => \StartUp_Enable1_carry__2_i_2_n_0\,
      DI(1) => \StartUp_Enable1_carry__2_i_3_n_0\,
      DI(0) => \StartUp_Enable1_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_StartUp_Enable1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \StartUp_Enable1_carry__2_i_5_n_0\,
      S(2) => \StartUp_Enable1_carry__2_i_6_n_0\,
      S(1) => \StartUp_Enable1_carry__2_i_7_n_0\,
      S(0) => \StartUp_Enable1_carry__2_i_8_n_0\
    );
\StartUp_Enable1_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(30),
      I1 => counter_reg(31),
      O => \StartUp_Enable1_carry__2_i_1_n_0\
    );
\StartUp_Enable1_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(28),
      I1 => counter_reg(29),
      O => \StartUp_Enable1_carry__2_i_2_n_0\
    );
\StartUp_Enable1_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(26),
      I1 => counter_reg(27),
      O => \StartUp_Enable1_carry__2_i_3_n_0\
    );
\StartUp_Enable1_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(24),
      I1 => counter_reg(25),
      O => \StartUp_Enable1_carry__2_i_4_n_0\
    );
\StartUp_Enable1_carry__2_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(30),
      I1 => counter_reg(31),
      O => \StartUp_Enable1_carry__2_i_5_n_0\
    );
\StartUp_Enable1_carry__2_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(28),
      I1 => counter_reg(29),
      O => \StartUp_Enable1_carry__2_i_6_n_0\
    );
\StartUp_Enable1_carry__2_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(26),
      I1 => counter_reg(27),
      O => \StartUp_Enable1_carry__2_i_7_n_0\
    );
\StartUp_Enable1_carry__2_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(24),
      I1 => counter_reg(25),
      O => \StartUp_Enable1_carry__2_i_8_n_0\
    );
StartUp_Enable1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => counter_reg(6),
      I1 => counter_reg(7),
      O => StartUp_Enable1_carry_i_1_n_0
    );
StartUp_Enable1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(5),
      O => StartUp_Enable1_carry_i_2_n_0
    );
StartUp_Enable1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(3),
      O => StartUp_Enable1_carry_i_3_n_0
    );
StartUp_Enable1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      O => StartUp_Enable1_carry_i_4_n_0
    );
StartUp_Enable1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(6),
      O => StartUp_Enable1_carry_i_5_n_0
    );
StartUp_Enable1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(4),
      I1 => counter_reg(5),
      O => StartUp_Enable1_carry_i_6_n_0
    );
StartUp_Enable1_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(3),
      O => StartUp_Enable1_carry_i_7_n_0
    );
StartUp_Enable1_carry_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      I1 => counter_reg(1),
      O => StartUp_Enable1_carry_i_8_n_0
    );
StartUp_Enable_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => StartUp_Enable,
      I1 => \StartUp_Enable1_carry__2_n_0\,
      O => StartUp_Enable_i_1_n_0
    );
StartUp_Enable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => StartUp_Enable_i_1_n_0,
      Q => StartUp_Enable,
      R => '0'
    );
\counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => StartUp_Enable,
      I1 => \StartUp_Enable1_carry__2_n_0\,
      O => \counter[0]_i_1_n_0\
    );
\counter[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_3_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[0]_i_2_n_7\,
      Q => counter_reg(0),
      R => '0'
    );
\counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2_n_0\,
      CO(2) => \counter_reg[0]_i_2_n_1\,
      CO(1) => \counter_reg[0]_i_2_n_2\,
      CO(0) => \counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2_n_4\,
      O(2) => \counter_reg[0]_i_2_n_5\,
      O(1) => \counter_reg[0]_i_2_n_6\,
      O(0) => \counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_3_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => '0'
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => '0'
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => '0'
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => '0'
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => '0'
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => '0'
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => '0'
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => '0'
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => '0'
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => '0'
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[0]_i_2_n_6\,
      Q => counter_reg(1),
      R => '0'
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => '0'
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => '0'
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => '0'
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => '0'
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => '0'
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3) => \counter_reg[24]_i_1_n_0\,
      CO(2) => \counter_reg[24]_i_1_n_1\,
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[24]_i_1_n_4\,
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => counter_reg(27 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => '0'
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => '0'
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[24]_i_1_n_4\,
      Q => counter_reg(27),
      R => '0'
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[28]_i_1_n_7\,
      Q => counter_reg(28),
      R => '0'
    );
\counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[28]_i_1_n_1\,
      CO(1) => \counter_reg[28]_i_1_n_2\,
      CO(0) => \counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[28]_i_1_n_4\,
      O(2) => \counter_reg[28]_i_1_n_5\,
      O(1) => \counter_reg[28]_i_1_n_6\,
      O(0) => \counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => counter_reg(31 downto 28)
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[28]_i_1_n_6\,
      Q => counter_reg(29),
      R => '0'
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[0]_i_2_n_5\,
      Q => counter_reg(2),
      R => '0'
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[28]_i_1_n_5\,
      Q => counter_reg(30),
      R => '0'
    );
\counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[28]_i_1_n_4\,
      Q => counter_reg(31),
      R => '0'
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[0]_i_2_n_4\,
      Q => counter_reg(3),
      R => '0'
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => '0'
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => '0'
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => '0'
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => '0'
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => '0'
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[0]_i_1_n_0\,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MC_SDC_Monitor_CAR_0_0 is
  port (
    CLK_I : in STD_LOGIC;
    SDC_SUPPLY_I : in STD_LOGIC;
    COCKPIT_EMERGENCY_I : in STD_LOGIC;
    BOTS_I : in STD_LOGIC;
    INERTIA_I : in STD_LOGIC;
    L_EMERGENCY_BUTTON_I : in STD_LOGIC;
    R_EMERGENCY_BUTTON_I : in STD_LOGIC;
    FR_WHEEL_I : in STD_LOGIC;
    FL_WHEEL_I : in STD_LOGIC;
    RR_WHEEL_I : in STD_LOGIC;
    RL_WHEEL_I : in STD_LOGIC;
    TSAC_HV_CONNECTOR_I : in STD_LOGIC;
    TSAC_IMD_I : in STD_LOGIC;
    TSAC_AMS_ENABLE_I : in STD_LOGIC;
    BSPD_I : in STD_LOGIC;
    HVD_I : in STD_LOGIC;
    TSMP_I : in STD_LOGIC;
    TSMS_I : in STD_LOGIC;
    SDC_NOT_CLOSED_VECTOR_O : out STD_LOGIC_VECTOR ( 16 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MC_SDC_Monitor_CAR_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MC_SDC_Monitor_CAR_0_0 : entity is "MC_SDC_Monitor_CAR_0_0,SDC_Monitor_CAR,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MC_SDC_Monitor_CAR_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MC_SDC_Monitor_CAR_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MC_SDC_Monitor_CAR_0_0 : entity is "SDC_Monitor_CAR,Vivado 2024.1";
end MC_SDC_Monitor_CAR_0_0;

architecture STRUCTURE of MC_SDC_Monitor_CAR_0_0 is
begin
U0: entity work.MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR
     port map (
      BOTS_I => BOTS_I,
      BSPD_I => BSPD_I,
      CLK_I => CLK_I,
      COCKPIT_EMERGENCY_I => COCKPIT_EMERGENCY_I,
      FL_WHEEL_I => FL_WHEEL_I,
      FR_WHEEL_I => FR_WHEEL_I,
      HVD_I => HVD_I,
      INERTIA_I => INERTIA_I,
      L_EMERGENCY_BUTTON_I => L_EMERGENCY_BUTTON_I,
      RL_WHEEL_I => RL_WHEEL_I,
      RR_WHEEL_I => RR_WHEEL_I,
      R_EMERGENCY_BUTTON_I => R_EMERGENCY_BUTTON_I,
      SDC_NOT_CLOSED_VECTOR_O(16 downto 0) => SDC_NOT_CLOSED_VECTOR_O(16 downto 0),
      SDC_SUPPLY_I => SDC_SUPPLY_I,
      TSAC_AMS_ENABLE_I => TSAC_AMS_ENABLE_I,
      TSAC_HV_CONNECTOR_I => TSAC_HV_CONNECTOR_I,
      TSAC_IMD_I => TSAC_IMD_I,
      TSMP_I => TSMP_I,
      TSMS_I => TSMS_I
    );
end STRUCTURE;
