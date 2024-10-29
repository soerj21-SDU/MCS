-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Thu Oct 24 10:22:55 2024
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
    IS_SDC_CLOSED_VECTOR_O : out STD_LOGIC_VECTOR ( 15 downto 0 );
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
    CLK_I : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR : entity is "SDC_Monitor_CAR";
end MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR;

architecture STRUCTURE of MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR is
  signal counter : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counter0_carry__0_n_0\ : STD_LOGIC;
  signal \counter0_carry__0_n_1\ : STD_LOGIC;
  signal \counter0_carry__0_n_2\ : STD_LOGIC;
  signal \counter0_carry__0_n_3\ : STD_LOGIC;
  signal \counter0_carry__1_n_0\ : STD_LOGIC;
  signal \counter0_carry__1_n_1\ : STD_LOGIC;
  signal \counter0_carry__1_n_2\ : STD_LOGIC;
  signal \counter0_carry__1_n_3\ : STD_LOGIC;
  signal \counter0_carry__2_n_0\ : STD_LOGIC;
  signal \counter0_carry__2_n_1\ : STD_LOGIC;
  signal \counter0_carry__2_n_2\ : STD_LOGIC;
  signal \counter0_carry__2_n_3\ : STD_LOGIC;
  signal \counter0_carry__3_n_0\ : STD_LOGIC;
  signal \counter0_carry__3_n_1\ : STD_LOGIC;
  signal \counter0_carry__3_n_2\ : STD_LOGIC;
  signal \counter0_carry__3_n_3\ : STD_LOGIC;
  signal \counter0_carry__4_n_0\ : STD_LOGIC;
  signal \counter0_carry__4_n_1\ : STD_LOGIC;
  signal \counter0_carry__4_n_2\ : STD_LOGIC;
  signal \counter0_carry__4_n_3\ : STD_LOGIC;
  signal \counter0_carry__5_n_0\ : STD_LOGIC;
  signal \counter0_carry__5_n_1\ : STD_LOGIC;
  signal \counter0_carry__5_n_2\ : STD_LOGIC;
  signal \counter0_carry__5_n_3\ : STD_LOGIC;
  signal \counter0_carry__6_n_3\ : STD_LOGIC;
  signal counter0_carry_n_0 : STD_LOGIC;
  signal counter0_carry_n_1 : STD_LOGIC;
  signal counter0_carry_n_2 : STD_LOGIC;
  signal counter0_carry_n_3 : STD_LOGIC;
  signal \counter[30]_i_2_n_0\ : STD_LOGIC;
  signal \counter[30]_i_3_n_0\ : STD_LOGIC;
  signal \counter[30]_i_4_n_0\ : STD_LOGIC;
  signal \counter[30]_i_5_n_0\ : STD_LOGIC;
  signal \counter[30]_i_6_n_0\ : STD_LOGIC;
  signal \counter[30]_i_7_n_0\ : STD_LOGIC;
  signal \counter[30]_i_8_n_0\ : STD_LOGIC;
  signal \counter[30]_i_9_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal startup_delay_1sec_i_1_n_0 : STD_LOGIC;
  signal startup_delay_1sec_reg_n_0 : STD_LOGIC;
  signal \NLW_counter0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counter0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[10]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[10]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[11]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[11]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[12]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[12]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[13]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[13]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[14]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[14]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[15]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[15]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[4]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[4]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[5]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[5]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[6]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[6]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[7]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[7]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[8]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[8]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \IS_SDC_CLOSED_VECTOR_O_reg[9]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \IS_SDC_CLOSED_VECTOR_O_reg[9]\ : label is "VCC:GE GND:CLR";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \counter0_carry__6\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter[30]_i_4\ : label is "soft_lutpair0";
begin
\IS_SDC_CLOSED_VECTOR_O_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => COCKPIT_EMERGENCY_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(0)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSAC_IMD_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(10)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSAC_AMS_ENABLE_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(11)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => BSPD_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(12)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => HVD_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(13)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSMP_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(14)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSMS_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(15)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => BOTS_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(1)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => INERTIA_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(2)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => L_EMERGENCY_BUTTON_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(3)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => R_EMERGENCY_BUTTON_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(4)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => FR_WHEEL_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(5)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => FL_WHEEL_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(6)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => RR_WHEEL_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(7)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => RL_WHEEL_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(8)
    );
\IS_SDC_CLOSED_VECTOR_O_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => TSAC_HV_CONNECTOR_I,
      G => startup_delay_1sec_reg_n_0,
      GE => '1',
      Q => IS_SDC_CLOSED_VECTOR_O(9)
    );
counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => counter0_carry_n_0,
      CO(2) => counter0_carry_n_1,
      CO(1) => counter0_carry_n_2,
      CO(0) => counter0_carry_n_3,
      CYINIT => counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(4 downto 1),
      S(3 downto 0) => counter(4 downto 1)
    );
\counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => counter0_carry_n_0,
      CO(3) => \counter0_carry__0_n_0\,
      CO(2) => \counter0_carry__0_n_1\,
      CO(1) => \counter0_carry__0_n_2\,
      CO(0) => \counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(8 downto 5),
      S(3 downto 0) => counter(8 downto 5)
    );
\counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__0_n_0\,
      CO(3) => \counter0_carry__1_n_0\,
      CO(2) => \counter0_carry__1_n_1\,
      CO(1) => \counter0_carry__1_n_2\,
      CO(0) => \counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(12 downto 9),
      S(3 downto 0) => counter(12 downto 9)
    );
\counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__1_n_0\,
      CO(3) => \counter0_carry__2_n_0\,
      CO(2) => \counter0_carry__2_n_1\,
      CO(1) => \counter0_carry__2_n_2\,
      CO(0) => \counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(16 downto 13),
      S(3 downto 0) => counter(16 downto 13)
    );
\counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__2_n_0\,
      CO(3) => \counter0_carry__3_n_0\,
      CO(2) => \counter0_carry__3_n_1\,
      CO(1) => \counter0_carry__3_n_2\,
      CO(0) => \counter0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(20 downto 17),
      S(3 downto 0) => counter(20 downto 17)
    );
\counter0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__3_n_0\,
      CO(3) => \counter0_carry__4_n_0\,
      CO(2) => \counter0_carry__4_n_1\,
      CO(1) => \counter0_carry__4_n_2\,
      CO(0) => \counter0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(24 downto 21),
      S(3 downto 0) => counter(24 downto 21)
    );
\counter0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__4_n_0\,
      CO(3) => \counter0_carry__5_n_0\,
      CO(2) => \counter0_carry__5_n_1\,
      CO(1) => \counter0_carry__5_n_2\,
      CO(0) => \counter0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(28 downto 25),
      S(3 downto 0) => counter(28 downto 25)
    );
\counter0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter0_carry__5_n_0\,
      CO(3 downto 1) => \NLW_counter0_carry__6_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counter0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counter0_carry__6_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => p_1_in(30 downto 29),
      S(3 downto 2) => B"00",
      S(1 downto 0) => counter(30 downto 29)
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(0),
      O => p_1_in(0)
    );
\counter[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \counter[30]_i_2_n_0\,
      I1 => \counter[30]_i_3_n_0\,
      I2 => \counter[30]_i_4_n_0\,
      O => p_0_in
    );
\counter[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \counter[30]_i_5_n_0\,
      I1 => \counter[30]_i_6_n_0\,
      I2 => \counter[30]_i_7_n_0\,
      I3 => counter(1),
      I4 => counter(11),
      I5 => counter(2),
      O => \counter[30]_i_2_n_0\
    );
\counter[30]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => counter(9),
      I1 => counter(25),
      I2 => counter(17),
      I3 => counter(22),
      I4 => \counter[30]_i_8_n_0\,
      O => \counter[30]_i_3_n_0\
    );
\counter[30]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => counter(0),
      I1 => counter(3),
      I2 => counter(28),
      I3 => counter(8),
      I4 => \counter[30]_i_9_n_0\,
      O => \counter[30]_i_4_n_0\
    );
\counter[30]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => counter(30),
      I1 => counter(4),
      I2 => counter(15),
      I3 => counter(24),
      O => \counter[30]_i_5_n_0\
    );
\counter[30]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => counter(12),
      I1 => counter(23),
      I2 => counter(21),
      I3 => counter(10),
      O => \counter[30]_i_6_n_0\
    );
\counter[30]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => counter(14),
      I1 => counter(7),
      I2 => counter(13),
      I3 => counter(29),
      O => \counter[30]_i_7_n_0\
    );
\counter[30]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => counter(18),
      I1 => counter(20),
      I2 => counter(26),
      I3 => counter(6),
      O => \counter[30]_i_8_n_0\
    );
\counter[30]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => counter(19),
      I1 => counter(5),
      I2 => counter(16),
      I3 => counter(27),
      O => \counter[30]_i_9_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(0),
      Q => counter(0),
      R => p_0_in
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(10),
      Q => counter(10),
      R => p_0_in
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(11),
      Q => counter(11),
      R => p_0_in
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(12),
      Q => counter(12),
      R => p_0_in
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(13),
      Q => counter(13),
      R => p_0_in
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(14),
      Q => counter(14),
      R => p_0_in
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(15),
      Q => counter(15),
      R => p_0_in
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(16),
      Q => counter(16),
      R => p_0_in
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(17),
      Q => counter(17),
      R => p_0_in
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(18),
      Q => counter(18),
      R => p_0_in
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(19),
      Q => counter(19),
      R => p_0_in
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(1),
      Q => counter(1),
      R => p_0_in
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(20),
      Q => counter(20),
      R => p_0_in
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(21),
      Q => counter(21),
      R => p_0_in
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(22),
      Q => counter(22),
      R => p_0_in
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(23),
      Q => counter(23),
      R => p_0_in
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(24),
      Q => counter(24),
      R => p_0_in
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(25),
      Q => counter(25),
      R => p_0_in
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(26),
      Q => counter(26),
      R => p_0_in
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(27),
      Q => counter(27),
      R => p_0_in
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(28),
      Q => counter(28),
      R => p_0_in
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(29),
      Q => counter(29),
      R => p_0_in
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(2),
      Q => counter(2),
      R => p_0_in
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(30),
      Q => counter(30),
      R => p_0_in
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(3),
      Q => counter(3),
      R => p_0_in
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(4),
      Q => counter(4),
      R => p_0_in
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(5),
      Q => counter(5),
      R => p_0_in
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(6),
      Q => counter(6),
      R => p_0_in
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(7),
      Q => counter(7),
      R => p_0_in
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(8),
      Q => counter(8),
      R => p_0_in
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => p_1_in(9),
      Q => counter(9),
      R => p_0_in
    );
startup_delay_1sec_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABAA"
    )
        port map (
      I0 => startup_delay_1sec_reg_n_0,
      I1 => \counter[30]_i_4_n_0\,
      I2 => \counter[30]_i_3_n_0\,
      I3 => \counter[30]_i_2_n_0\,
      O => startup_delay_1sec_i_1_n_0
    );
startup_delay_1sec_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => '1',
      D => startup_delay_1sec_i_1_n_0,
      Q => startup_delay_1sec_reg_n_0,
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
    IS_SDC_CLOSED_VECTOR_O : out STD_LOGIC_VECTOR ( 16 downto 0 )
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
  signal \<const0>\ : STD_LOGIC;
  signal \^is_sdc_closed_vector_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  IS_SDC_CLOSED_VECTOR_O(16) <= \<const0>\;
  IS_SDC_CLOSED_VECTOR_O(15 downto 0) <= \^is_sdc_closed_vector_o\(15 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
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
      IS_SDC_CLOSED_VECTOR_O(15 downto 0) => \^is_sdc_closed_vector_o\(15 downto 0),
      L_EMERGENCY_BUTTON_I => L_EMERGENCY_BUTTON_I,
      RL_WHEEL_I => RL_WHEEL_I,
      RR_WHEEL_I => RR_WHEEL_I,
      R_EMERGENCY_BUTTON_I => R_EMERGENCY_BUTTON_I,
      TSAC_AMS_ENABLE_I => TSAC_AMS_ENABLE_I,
      TSAC_HV_CONNECTOR_I => TSAC_HV_CONNECTOR_I,
      TSAC_IMD_I => TSAC_IMD_I,
      TSMP_I => TSMP_I,
      TSMS_I => TSMS_I
    );
end STRUCTURE;
