-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Tue Nov 12 14:35:13 2024
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
    SDC_VECTOR_O : out STD_LOGIC_VECTOR ( 16 downto 0 );
    D : in STD_LOGIC_VECTOR ( 16 downto 0 );
    CLK_I : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR : entity is "SDC_Monitor_CAR";
end MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR;

architecture STRUCTURE of MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR is
  signal counter : STD_LOGIC_VECTOR ( 30 downto 0 );
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of counter : signal is std.standard.true;
  signal \counter[30]_i_10_n_0\ : STD_LOGIC;
  signal \counter[30]_i_2_n_0\ : STD_LOGIC;
  signal \counter[30]_i_3_n_0\ : STD_LOGIC;
  signal \counter[30]_i_4_n_0\ : STD_LOGIC;
  signal \counter[30]_i_5_n_0\ : STD_LOGIC;
  signal \counter[30]_i_6_n_0\ : STD_LOGIC;
  signal \counter[30]_i_7_n_0\ : STD_LOGIC;
  signal \counter[30]_i_8_n_0\ : STD_LOGIC;
  signal \counter[30]_i_9_n_0\ : STD_LOGIC;
  signal counter_reg0 : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__5_n_0\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__5_n_1\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry__6_n_3\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \counter_reg0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal startup_delay_1sec : STD_LOGIC;
  attribute MARK_DEBUG of startup_delay_1sec : signal is std.standard.true;
  signal startup_delay_1sec_i_1_n_0 : STD_LOGIC;
  signal \NLW_counter_reg0_inferred__0/i__carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counter_reg0_inferred__0/i__carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[10]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[10]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[11]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[11]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[12]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[12]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[13]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[13]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[14]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[14]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[15]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[15]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[16]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[16]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[4]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[4]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[5]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[5]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[6]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[6]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[7]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[7]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[8]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[8]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \SDC_VECTOR_O_reg[9]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \SDC_VECTOR_O_reg[9]\ : label is "VCC:GE GND:CLR";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_reg0_inferred__0/i__carry__6\ : label is 35;
  attribute KEEP : string;
  attribute KEEP of \counter_reg[0]\ : label is "yes";
  attribute mark_debug_string : string;
  attribute mark_debug_string of \counter_reg[0]\ : label is "true";
  attribute KEEP of \counter_reg[10]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[10]\ : label is "true";
  attribute KEEP of \counter_reg[11]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[11]\ : label is "true";
  attribute KEEP of \counter_reg[12]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[12]\ : label is "true";
  attribute KEEP of \counter_reg[13]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[13]\ : label is "true";
  attribute KEEP of \counter_reg[14]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[14]\ : label is "true";
  attribute KEEP of \counter_reg[15]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[15]\ : label is "true";
  attribute KEEP of \counter_reg[16]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[16]\ : label is "true";
  attribute KEEP of \counter_reg[17]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[17]\ : label is "true";
  attribute KEEP of \counter_reg[18]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[18]\ : label is "true";
  attribute KEEP of \counter_reg[19]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[19]\ : label is "true";
  attribute KEEP of \counter_reg[1]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[1]\ : label is "true";
  attribute KEEP of \counter_reg[20]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[20]\ : label is "true";
  attribute KEEP of \counter_reg[21]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[21]\ : label is "true";
  attribute KEEP of \counter_reg[22]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[22]\ : label is "true";
  attribute KEEP of \counter_reg[23]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[23]\ : label is "true";
  attribute KEEP of \counter_reg[24]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[24]\ : label is "true";
  attribute KEEP of \counter_reg[25]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[25]\ : label is "true";
  attribute KEEP of \counter_reg[26]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[26]\ : label is "true";
  attribute KEEP of \counter_reg[27]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[27]\ : label is "true";
  attribute KEEP of \counter_reg[28]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[28]\ : label is "true";
  attribute KEEP of \counter_reg[29]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[29]\ : label is "true";
  attribute KEEP of \counter_reg[2]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[2]\ : label is "true";
  attribute KEEP of \counter_reg[30]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[30]\ : label is "true";
  attribute KEEP of \counter_reg[3]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[3]\ : label is "true";
  attribute KEEP of \counter_reg[4]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[4]\ : label is "true";
  attribute KEEP of \counter_reg[5]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[5]\ : label is "true";
  attribute KEEP of \counter_reg[6]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[6]\ : label is "true";
  attribute KEEP of \counter_reg[7]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[7]\ : label is "true";
  attribute KEEP of \counter_reg[8]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[8]\ : label is "true";
  attribute KEEP of \counter_reg[9]\ : label is "yes";
  attribute mark_debug_string of \counter_reg[9]\ : label is "true";
  attribute KEEP of startup_delay_1sec_reg : label is "yes";
  attribute mark_debug_string of startup_delay_1sec_reg : label is "true";
begin
\SDC_VECTOR_O_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(0),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(0)
    );
\SDC_VECTOR_O_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(10),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(10)
    );
\SDC_VECTOR_O_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(11),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(11)
    );
\SDC_VECTOR_O_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(12),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(12)
    );
\SDC_VECTOR_O_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(13),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(13)
    );
\SDC_VECTOR_O_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(14),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(14)
    );
\SDC_VECTOR_O_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(15),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(15)
    );
\SDC_VECTOR_O_reg[16]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(16),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(16)
    );
\SDC_VECTOR_O_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(1),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(1)
    );
\SDC_VECTOR_O_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(2),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(2)
    );
\SDC_VECTOR_O_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(3),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(3)
    );
\SDC_VECTOR_O_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(4),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(4)
    );
\SDC_VECTOR_O_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(5),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(5)
    );
\SDC_VECTOR_O_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(6),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(6)
    );
\SDC_VECTOR_O_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(7),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(7)
    );
\SDC_VECTOR_O_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(8),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(8)
    );
\SDC_VECTOR_O_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => D(9),
      G => startup_delay_1sec,
      GE => '1',
      Q => SDC_VECTOR_O(9)
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(0),
      O => p_1_in(0)
    );
\counter[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \counter[30]_i_3_n_0\,
      I1 => \counter[30]_i_4_n_0\,
      I2 => \counter[30]_i_5_n_0\,
      I3 => \counter[30]_i_6_n_0\,
      O => counter_reg0
    );
\counter[30]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => counter(8),
      I1 => counter(3),
      I2 => counter(26),
      I3 => counter(19),
      O => \counter[30]_i_10_n_0\
    );
\counter[30]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => startup_delay_1sec,
      O => \counter[30]_i_2_n_0\
    );
\counter[30]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => startup_delay_1sec,
      I1 => counter(0),
      I2 => counter(17),
      I3 => counter(28),
      I4 => \counter[30]_i_7_n_0\,
      O => \counter[30]_i_3_n_0\
    );
\counter[30]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => counter(7),
      I1 => counter(6),
      I2 => counter(16),
      I3 => counter(29),
      I4 => \counter[30]_i_8_n_0\,
      O => \counter[30]_i_4_n_0\
    );
\counter[30]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => counter(5),
      I1 => counter(4),
      I2 => counter(20),
      I3 => counter(22),
      I4 => \counter[30]_i_9_n_0\,
      O => \counter[30]_i_5_n_0\
    );
\counter[30]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFBFF"
    )
        port map (
      I0 => counter(10),
      I1 => counter(14),
      I2 => counter(25),
      I3 => counter(23),
      I4 => \counter[30]_i_10_n_0\,
      O => \counter[30]_i_6_n_0\
    );
\counter[30]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => counter(9),
      I1 => counter(2),
      I2 => counter(21),
      I3 => counter(18),
      O => \counter[30]_i_7_n_0\
    );
\counter[30]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => counter(30),
      I1 => counter(12),
      I2 => counter(24),
      I3 => counter(13),
      O => \counter[30]_i_8_n_0\
    );
\counter[30]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => counter(11),
      I1 => counter(1),
      I2 => counter(15),
      I3 => counter(27),
      O => \counter[30]_i_9_n_0\
    );
\counter_reg0_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg0_inferred__0/i__carry_n_0\,
      CO(2) => \counter_reg0_inferred__0/i__carry_n_1\,
      CO(1) => \counter_reg0_inferred__0/i__carry_n_2\,
      CO(0) => \counter_reg0_inferred__0/i__carry_n_3\,
      CYINIT => counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(4 downto 1),
      S(3 downto 0) => counter(4 downto 1)
    );
\counter_reg0_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg0_inferred__0/i__carry_n_0\,
      CO(3) => \counter_reg0_inferred__0/i__carry__0_n_0\,
      CO(2) => \counter_reg0_inferred__0/i__carry__0_n_1\,
      CO(1) => \counter_reg0_inferred__0/i__carry__0_n_2\,
      CO(0) => \counter_reg0_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(8 downto 5),
      S(3 downto 0) => counter(8 downto 5)
    );
\counter_reg0_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg0_inferred__0/i__carry__0_n_0\,
      CO(3) => \counter_reg0_inferred__0/i__carry__1_n_0\,
      CO(2) => \counter_reg0_inferred__0/i__carry__1_n_1\,
      CO(1) => \counter_reg0_inferred__0/i__carry__1_n_2\,
      CO(0) => \counter_reg0_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(12 downto 9),
      S(3 downto 0) => counter(12 downto 9)
    );
\counter_reg0_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg0_inferred__0/i__carry__1_n_0\,
      CO(3) => \counter_reg0_inferred__0/i__carry__2_n_0\,
      CO(2) => \counter_reg0_inferred__0/i__carry__2_n_1\,
      CO(1) => \counter_reg0_inferred__0/i__carry__2_n_2\,
      CO(0) => \counter_reg0_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(16 downto 13),
      S(3 downto 0) => counter(16 downto 13)
    );
\counter_reg0_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg0_inferred__0/i__carry__2_n_0\,
      CO(3) => \counter_reg0_inferred__0/i__carry__3_n_0\,
      CO(2) => \counter_reg0_inferred__0/i__carry__3_n_1\,
      CO(1) => \counter_reg0_inferred__0/i__carry__3_n_2\,
      CO(0) => \counter_reg0_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(20 downto 17),
      S(3 downto 0) => counter(20 downto 17)
    );
\counter_reg0_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg0_inferred__0/i__carry__3_n_0\,
      CO(3) => \counter_reg0_inferred__0/i__carry__4_n_0\,
      CO(2) => \counter_reg0_inferred__0/i__carry__4_n_1\,
      CO(1) => \counter_reg0_inferred__0/i__carry__4_n_2\,
      CO(0) => \counter_reg0_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(24 downto 21),
      S(3 downto 0) => counter(24 downto 21)
    );
\counter_reg0_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg0_inferred__0/i__carry__4_n_0\,
      CO(3) => \counter_reg0_inferred__0/i__carry__5_n_0\,
      CO(2) => \counter_reg0_inferred__0/i__carry__5_n_1\,
      CO(1) => \counter_reg0_inferred__0/i__carry__5_n_2\,
      CO(0) => \counter_reg0_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(28 downto 25),
      S(3 downto 0) => counter(28 downto 25)
    );
\counter_reg0_inferred__0/i__carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg0_inferred__0/i__carry__5_n_0\,
      CO(3 downto 1) => \NLW_counter_reg0_inferred__0/i__carry__6_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counter_reg0_inferred__0/i__carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counter_reg0_inferred__0/i__carry__6_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => p_1_in(30 downto 29),
      S(3 downto 2) => B"00",
      S(1 downto 0) => counter(30 downto 29)
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(0),
      Q => counter(0),
      R => counter_reg0
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(10),
      Q => counter(10),
      R => counter_reg0
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(11),
      Q => counter(11),
      R => counter_reg0
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(12),
      Q => counter(12),
      R => counter_reg0
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(13),
      Q => counter(13),
      R => counter_reg0
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(14),
      Q => counter(14),
      R => counter_reg0
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(15),
      Q => counter(15),
      R => counter_reg0
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(16),
      Q => counter(16),
      R => counter_reg0
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(17),
      Q => counter(17),
      R => counter_reg0
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(18),
      Q => counter(18),
      R => counter_reg0
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(19),
      Q => counter(19),
      R => counter_reg0
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(1),
      Q => counter(1),
      R => counter_reg0
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(20),
      Q => counter(20),
      R => counter_reg0
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(21),
      Q => counter(21),
      R => counter_reg0
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(22),
      Q => counter(22),
      R => counter_reg0
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(23),
      Q => counter(23),
      R => counter_reg0
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(24),
      Q => counter(24),
      R => counter_reg0
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(25),
      Q => counter(25),
      R => counter_reg0
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(26),
      Q => counter(26),
      R => counter_reg0
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(27),
      Q => counter(27),
      R => counter_reg0
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(28),
      Q => counter(28),
      R => counter_reg0
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(29),
      Q => counter(29),
      R => counter_reg0
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(2),
      Q => counter(2),
      R => counter_reg0
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(30),
      Q => counter(30),
      R => counter_reg0
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(3),
      Q => counter(3),
      R => counter_reg0
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(4),
      Q => counter(4),
      R => counter_reg0
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(5),
      Q => counter(5),
      R => counter_reg0
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(6),
      Q => counter(6),
      R => counter_reg0
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(7),
      Q => counter(7),
      R => counter_reg0
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(8),
      Q => counter(8),
      R => counter_reg0
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_I,
      CE => \counter[30]_i_2_n_0\,
      D => p_1_in(9),
      Q => counter(9),
      R => counter_reg0
    );
startup_delay_1sec_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888888F8888"
    )
        port map (
      I0 => startup_delay_1sec,
      I1 => startup_delay_1sec,
      I2 => \counter[30]_i_6_n_0\,
      I3 => \counter[30]_i_5_n_0\,
      I4 => \counter[30]_i_4_n_0\,
      I5 => \counter[30]_i_3_n_0\,
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
      Q => startup_delay_1sec,
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
    SDC_VECTOR_O : out STD_LOGIC_VECTOR ( 16 downto 0 )
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
      CLK_I => CLK_I,
      D(16) => TSMS_I,
      D(15) => TSMP_I,
      D(14) => HVD_I,
      D(13) => BSPD_I,
      D(12) => TSAC_AMS_ENABLE_I,
      D(11) => TSAC_IMD_I,
      D(10) => TSAC_HV_CONNECTOR_I,
      D(9) => RL_WHEEL_I,
      D(8) => RR_WHEEL_I,
      D(7) => FL_WHEEL_I,
      D(6) => FR_WHEEL_I,
      D(5) => R_EMERGENCY_BUTTON_I,
      D(4) => L_EMERGENCY_BUTTON_I,
      D(3) => INERTIA_I,
      D(2) => BOTS_I,
      D(1) => COCKPIT_EMERGENCY_I,
      D(0) => SDC_SUPPLY_I,
      SDC_VECTOR_O(16 downto 0) => SDC_VECTOR_O(16 downto 0)
    );
end STRUCTURE;
