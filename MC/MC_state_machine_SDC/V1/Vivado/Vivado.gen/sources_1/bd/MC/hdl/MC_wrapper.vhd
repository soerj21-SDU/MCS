--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Thu Nov 14 11:53:58 2024
--Host        : Soeren-Laptop running 64-bit major release  (build 9200)
--Command     : generate_target MC_wrapper.bd
--Design      : MC_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MC_wrapper is
  port (
    Actuator_tri_io : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    BOTS_I : in STD_LOGIC;
    CAN_0_rx : in STD_LOGIC;
    CAN_0_tx : out STD_LOGIC;
    CAN_1_rx : in STD_LOGIC;
    CAN_1_tx : out STD_LOGIC;
    COCKPIT_EMERGENCY_I : in STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FL_WHEEL_I : in STD_LOGIC;
    FR_WHEEL_I : in STD_LOGIC;
    INERTIA_I : in STD_LOGIC;
    L_EMERGENCY_BUTTON_I : in STD_LOGIC;
    PL_ALIVE_LED : out STD_LOGIC_VECTOR ( 0 to 0 );
    Power_Distribution_tri_io : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    RL_WHEEL_I : in STD_LOGIC;
    RR_WHEEL_I : in STD_LOGIC;
    R_EMERGENCY_BUTTON_I : in STD_LOGIC;
    SDC_SUPPLY_I : in STD_LOGIC;
    SPI0_MISO_I : in STD_LOGIC;
    SPI0_MOSI_O : out STD_LOGIC;
    SPI0_SCLK_O : out STD_LOGIC;
    SPI0_SS_O : out STD_LOGIC;
    TSMS_I : in STD_LOGIC;
    UART0_CTSN : in STD_LOGIC;
    UART0_RTSN : out STD_LOGIC;
    UART0_RX : in STD_LOGIC;
    UART0_TX : out STD_LOGIC
  );
end MC_wrapper;

architecture STRUCTURE of MC_wrapper is
  component MC is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    CAN_0_tx : out STD_LOGIC;
    CAN_0_rx : in STD_LOGIC;
    CAN_1_tx : out STD_LOGIC;
    CAN_1_rx : in STD_LOGIC;
    UART0_RTSN : out STD_LOGIC;
    UART0_TX : out STD_LOGIC;
    UART0_CTSN : in STD_LOGIC;
    UART0_RX : in STD_LOGIC;
    SPI0_SCLK_O : out STD_LOGIC;
    SPI0_MOSI_O : out STD_LOGIC;
    SPI0_MISO_I : in STD_LOGIC;
    SPI0_SS_O : out STD_LOGIC;
    SDC_SUPPLY_I : in STD_LOGIC;
    COCKPIT_EMERGENCY_I : in STD_LOGIC;
    BOTS_I : in STD_LOGIC;
    L_EMERGENCY_BUTTON_I : in STD_LOGIC;
    INERTIA_I : in STD_LOGIC;
    R_EMERGENCY_BUTTON_I : in STD_LOGIC;
    RL_WHEEL_I : in STD_LOGIC;
    FR_WHEEL_I : in STD_LOGIC;
    FL_WHEEL_I : in STD_LOGIC;
    RR_WHEEL_I : in STD_LOGIC;
    TSMS_I : in STD_LOGIC;
    PL_ALIVE_LED : out STD_LOGIC_VECTOR ( 0 to 0 );
    Actuator_tri_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Actuator_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Actuator_tri_t : out STD_LOGIC_VECTOR ( 2 downto 0 );
    Power_Distribution_tri_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Power_Distribution_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Power_Distribution_tri_t : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component MC;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal Actuator_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Actuator_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Actuator_tri_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Actuator_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Actuator_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Actuator_tri_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Actuator_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Actuator_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Actuator_tri_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Actuator_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Actuator_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Actuator_tri_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Power_Distribution_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Power_Distribution_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Power_Distribution_tri_i_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal Power_Distribution_tri_i_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal Power_Distribution_tri_i_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal Power_Distribution_tri_i_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal Power_Distribution_tri_i_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal Power_Distribution_tri_i_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal Power_Distribution_tri_i_16 : STD_LOGIC_VECTOR ( 16 to 16 );
  signal Power_Distribution_tri_i_17 : STD_LOGIC_VECTOR ( 17 to 17 );
  signal Power_Distribution_tri_i_18 : STD_LOGIC_VECTOR ( 18 to 18 );
  signal Power_Distribution_tri_i_19 : STD_LOGIC_VECTOR ( 19 to 19 );
  signal Power_Distribution_tri_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Power_Distribution_tri_i_20 : STD_LOGIC_VECTOR ( 20 to 20 );
  signal Power_Distribution_tri_i_21 : STD_LOGIC_VECTOR ( 21 to 21 );
  signal Power_Distribution_tri_i_22 : STD_LOGIC_VECTOR ( 22 to 22 );
  signal Power_Distribution_tri_i_23 : STD_LOGIC_VECTOR ( 23 to 23 );
  signal Power_Distribution_tri_i_24 : STD_LOGIC_VECTOR ( 24 to 24 );
  signal Power_Distribution_tri_i_25 : STD_LOGIC_VECTOR ( 25 to 25 );
  signal Power_Distribution_tri_i_26 : STD_LOGIC_VECTOR ( 26 to 26 );
  signal Power_Distribution_tri_i_27 : STD_LOGIC_VECTOR ( 27 to 27 );
  signal Power_Distribution_tri_i_28 : STD_LOGIC_VECTOR ( 28 to 28 );
  signal Power_Distribution_tri_i_29 : STD_LOGIC_VECTOR ( 29 to 29 );
  signal Power_Distribution_tri_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal Power_Distribution_tri_i_30 : STD_LOGIC_VECTOR ( 30 to 30 );
  signal Power_Distribution_tri_i_31 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal Power_Distribution_tri_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal Power_Distribution_tri_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal Power_Distribution_tri_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal Power_Distribution_tri_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal Power_Distribution_tri_i_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal Power_Distribution_tri_i_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal Power_Distribution_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Power_Distribution_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Power_Distribution_tri_io_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal Power_Distribution_tri_io_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal Power_Distribution_tri_io_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal Power_Distribution_tri_io_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal Power_Distribution_tri_io_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal Power_Distribution_tri_io_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal Power_Distribution_tri_io_16 : STD_LOGIC_VECTOR ( 16 to 16 );
  signal Power_Distribution_tri_io_17 : STD_LOGIC_VECTOR ( 17 to 17 );
  signal Power_Distribution_tri_io_18 : STD_LOGIC_VECTOR ( 18 to 18 );
  signal Power_Distribution_tri_io_19 : STD_LOGIC_VECTOR ( 19 to 19 );
  signal Power_Distribution_tri_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Power_Distribution_tri_io_20 : STD_LOGIC_VECTOR ( 20 to 20 );
  signal Power_Distribution_tri_io_21 : STD_LOGIC_VECTOR ( 21 to 21 );
  signal Power_Distribution_tri_io_22 : STD_LOGIC_VECTOR ( 22 to 22 );
  signal Power_Distribution_tri_io_23 : STD_LOGIC_VECTOR ( 23 to 23 );
  signal Power_Distribution_tri_io_24 : STD_LOGIC_VECTOR ( 24 to 24 );
  signal Power_Distribution_tri_io_25 : STD_LOGIC_VECTOR ( 25 to 25 );
  signal Power_Distribution_tri_io_26 : STD_LOGIC_VECTOR ( 26 to 26 );
  signal Power_Distribution_tri_io_27 : STD_LOGIC_VECTOR ( 27 to 27 );
  signal Power_Distribution_tri_io_28 : STD_LOGIC_VECTOR ( 28 to 28 );
  signal Power_Distribution_tri_io_29 : STD_LOGIC_VECTOR ( 29 to 29 );
  signal Power_Distribution_tri_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal Power_Distribution_tri_io_30 : STD_LOGIC_VECTOR ( 30 to 30 );
  signal Power_Distribution_tri_io_31 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal Power_Distribution_tri_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal Power_Distribution_tri_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal Power_Distribution_tri_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal Power_Distribution_tri_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal Power_Distribution_tri_io_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal Power_Distribution_tri_io_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal Power_Distribution_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Power_Distribution_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Power_Distribution_tri_o_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal Power_Distribution_tri_o_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal Power_Distribution_tri_o_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal Power_Distribution_tri_o_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal Power_Distribution_tri_o_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal Power_Distribution_tri_o_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal Power_Distribution_tri_o_16 : STD_LOGIC_VECTOR ( 16 to 16 );
  signal Power_Distribution_tri_o_17 : STD_LOGIC_VECTOR ( 17 to 17 );
  signal Power_Distribution_tri_o_18 : STD_LOGIC_VECTOR ( 18 to 18 );
  signal Power_Distribution_tri_o_19 : STD_LOGIC_VECTOR ( 19 to 19 );
  signal Power_Distribution_tri_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Power_Distribution_tri_o_20 : STD_LOGIC_VECTOR ( 20 to 20 );
  signal Power_Distribution_tri_o_21 : STD_LOGIC_VECTOR ( 21 to 21 );
  signal Power_Distribution_tri_o_22 : STD_LOGIC_VECTOR ( 22 to 22 );
  signal Power_Distribution_tri_o_23 : STD_LOGIC_VECTOR ( 23 to 23 );
  signal Power_Distribution_tri_o_24 : STD_LOGIC_VECTOR ( 24 to 24 );
  signal Power_Distribution_tri_o_25 : STD_LOGIC_VECTOR ( 25 to 25 );
  signal Power_Distribution_tri_o_26 : STD_LOGIC_VECTOR ( 26 to 26 );
  signal Power_Distribution_tri_o_27 : STD_LOGIC_VECTOR ( 27 to 27 );
  signal Power_Distribution_tri_o_28 : STD_LOGIC_VECTOR ( 28 to 28 );
  signal Power_Distribution_tri_o_29 : STD_LOGIC_VECTOR ( 29 to 29 );
  signal Power_Distribution_tri_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal Power_Distribution_tri_o_30 : STD_LOGIC_VECTOR ( 30 to 30 );
  signal Power_Distribution_tri_o_31 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal Power_Distribution_tri_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal Power_Distribution_tri_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal Power_Distribution_tri_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal Power_Distribution_tri_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal Power_Distribution_tri_o_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal Power_Distribution_tri_o_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal Power_Distribution_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Power_Distribution_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal Power_Distribution_tri_t_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal Power_Distribution_tri_t_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal Power_Distribution_tri_t_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal Power_Distribution_tri_t_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal Power_Distribution_tri_t_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal Power_Distribution_tri_t_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal Power_Distribution_tri_t_16 : STD_LOGIC_VECTOR ( 16 to 16 );
  signal Power_Distribution_tri_t_17 : STD_LOGIC_VECTOR ( 17 to 17 );
  signal Power_Distribution_tri_t_18 : STD_LOGIC_VECTOR ( 18 to 18 );
  signal Power_Distribution_tri_t_19 : STD_LOGIC_VECTOR ( 19 to 19 );
  signal Power_Distribution_tri_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal Power_Distribution_tri_t_20 : STD_LOGIC_VECTOR ( 20 to 20 );
  signal Power_Distribution_tri_t_21 : STD_LOGIC_VECTOR ( 21 to 21 );
  signal Power_Distribution_tri_t_22 : STD_LOGIC_VECTOR ( 22 to 22 );
  signal Power_Distribution_tri_t_23 : STD_LOGIC_VECTOR ( 23 to 23 );
  signal Power_Distribution_tri_t_24 : STD_LOGIC_VECTOR ( 24 to 24 );
  signal Power_Distribution_tri_t_25 : STD_LOGIC_VECTOR ( 25 to 25 );
  signal Power_Distribution_tri_t_26 : STD_LOGIC_VECTOR ( 26 to 26 );
  signal Power_Distribution_tri_t_27 : STD_LOGIC_VECTOR ( 27 to 27 );
  signal Power_Distribution_tri_t_28 : STD_LOGIC_VECTOR ( 28 to 28 );
  signal Power_Distribution_tri_t_29 : STD_LOGIC_VECTOR ( 29 to 29 );
  signal Power_Distribution_tri_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal Power_Distribution_tri_t_30 : STD_LOGIC_VECTOR ( 30 to 30 );
  signal Power_Distribution_tri_t_31 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal Power_Distribution_tri_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal Power_Distribution_tri_t_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal Power_Distribution_tri_t_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal Power_Distribution_tri_t_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal Power_Distribution_tri_t_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal Power_Distribution_tri_t_9 : STD_LOGIC_VECTOR ( 9 to 9 );
begin
Actuator_tri_iobuf_0: component IOBUF
     port map (
      I => Actuator_tri_o_0(0),
      IO => Actuator_tri_io(0),
      O => Actuator_tri_i_0(0),
      T => Actuator_tri_t_0(0)
    );
Actuator_tri_iobuf_1: component IOBUF
     port map (
      I => Actuator_tri_o_1(1),
      IO => Actuator_tri_io(1),
      O => Actuator_tri_i_1(1),
      T => Actuator_tri_t_1(1)
    );
Actuator_tri_iobuf_2: component IOBUF
     port map (
      I => Actuator_tri_o_2(2),
      IO => Actuator_tri_io(2),
      O => Actuator_tri_i_2(2),
      T => Actuator_tri_t_2(2)
    );
MC_i: component MC
     port map (
      Actuator_tri_i(2) => Actuator_tri_i_2(2),
      Actuator_tri_i(1) => Actuator_tri_i_1(1),
      Actuator_tri_i(0) => Actuator_tri_i_0(0),
      Actuator_tri_o(2) => Actuator_tri_o_2(2),
      Actuator_tri_o(1) => Actuator_tri_o_1(1),
      Actuator_tri_o(0) => Actuator_tri_o_0(0),
      Actuator_tri_t(2) => Actuator_tri_t_2(2),
      Actuator_tri_t(1) => Actuator_tri_t_1(1),
      Actuator_tri_t(0) => Actuator_tri_t_0(0),
      BOTS_I => BOTS_I,
      CAN_0_rx => CAN_0_rx,
      CAN_0_tx => CAN_0_tx,
      CAN_1_rx => CAN_1_rx,
      CAN_1_tx => CAN_1_tx,
      COCKPIT_EMERGENCY_I => COCKPIT_EMERGENCY_I,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      FL_WHEEL_I => FL_WHEEL_I,
      FR_WHEEL_I => FR_WHEEL_I,
      INERTIA_I => INERTIA_I,
      L_EMERGENCY_BUTTON_I => L_EMERGENCY_BUTTON_I,
      PL_ALIVE_LED(0) => PL_ALIVE_LED(0),
      Power_Distribution_tri_i(31) => Power_Distribution_tri_i_31(31),
      Power_Distribution_tri_i(30) => Power_Distribution_tri_i_30(30),
      Power_Distribution_tri_i(29) => Power_Distribution_tri_i_29(29),
      Power_Distribution_tri_i(28) => Power_Distribution_tri_i_28(28),
      Power_Distribution_tri_i(27) => Power_Distribution_tri_i_27(27),
      Power_Distribution_tri_i(26) => Power_Distribution_tri_i_26(26),
      Power_Distribution_tri_i(25) => Power_Distribution_tri_i_25(25),
      Power_Distribution_tri_i(24) => Power_Distribution_tri_i_24(24),
      Power_Distribution_tri_i(23) => Power_Distribution_tri_i_23(23),
      Power_Distribution_tri_i(22) => Power_Distribution_tri_i_22(22),
      Power_Distribution_tri_i(21) => Power_Distribution_tri_i_21(21),
      Power_Distribution_tri_i(20) => Power_Distribution_tri_i_20(20),
      Power_Distribution_tri_i(19) => Power_Distribution_tri_i_19(19),
      Power_Distribution_tri_i(18) => Power_Distribution_tri_i_18(18),
      Power_Distribution_tri_i(17) => Power_Distribution_tri_i_17(17),
      Power_Distribution_tri_i(16) => Power_Distribution_tri_i_16(16),
      Power_Distribution_tri_i(15) => Power_Distribution_tri_i_15(15),
      Power_Distribution_tri_i(14) => Power_Distribution_tri_i_14(14),
      Power_Distribution_tri_i(13) => Power_Distribution_tri_i_13(13),
      Power_Distribution_tri_i(12) => Power_Distribution_tri_i_12(12),
      Power_Distribution_tri_i(11) => Power_Distribution_tri_i_11(11),
      Power_Distribution_tri_i(10) => Power_Distribution_tri_i_10(10),
      Power_Distribution_tri_i(9) => Power_Distribution_tri_i_9(9),
      Power_Distribution_tri_i(8) => Power_Distribution_tri_i_8(8),
      Power_Distribution_tri_i(7) => Power_Distribution_tri_i_7(7),
      Power_Distribution_tri_i(6) => Power_Distribution_tri_i_6(6),
      Power_Distribution_tri_i(5) => Power_Distribution_tri_i_5(5),
      Power_Distribution_tri_i(4) => Power_Distribution_tri_i_4(4),
      Power_Distribution_tri_i(3) => Power_Distribution_tri_i_3(3),
      Power_Distribution_tri_i(2) => Power_Distribution_tri_i_2(2),
      Power_Distribution_tri_i(1) => Power_Distribution_tri_i_1(1),
      Power_Distribution_tri_i(0) => Power_Distribution_tri_i_0(0),
      Power_Distribution_tri_o(31) => Power_Distribution_tri_o_31(31),
      Power_Distribution_tri_o(30) => Power_Distribution_tri_o_30(30),
      Power_Distribution_tri_o(29) => Power_Distribution_tri_o_29(29),
      Power_Distribution_tri_o(28) => Power_Distribution_tri_o_28(28),
      Power_Distribution_tri_o(27) => Power_Distribution_tri_o_27(27),
      Power_Distribution_tri_o(26) => Power_Distribution_tri_o_26(26),
      Power_Distribution_tri_o(25) => Power_Distribution_tri_o_25(25),
      Power_Distribution_tri_o(24) => Power_Distribution_tri_o_24(24),
      Power_Distribution_tri_o(23) => Power_Distribution_tri_o_23(23),
      Power_Distribution_tri_o(22) => Power_Distribution_tri_o_22(22),
      Power_Distribution_tri_o(21) => Power_Distribution_tri_o_21(21),
      Power_Distribution_tri_o(20) => Power_Distribution_tri_o_20(20),
      Power_Distribution_tri_o(19) => Power_Distribution_tri_o_19(19),
      Power_Distribution_tri_o(18) => Power_Distribution_tri_o_18(18),
      Power_Distribution_tri_o(17) => Power_Distribution_tri_o_17(17),
      Power_Distribution_tri_o(16) => Power_Distribution_tri_o_16(16),
      Power_Distribution_tri_o(15) => Power_Distribution_tri_o_15(15),
      Power_Distribution_tri_o(14) => Power_Distribution_tri_o_14(14),
      Power_Distribution_tri_o(13) => Power_Distribution_tri_o_13(13),
      Power_Distribution_tri_o(12) => Power_Distribution_tri_o_12(12),
      Power_Distribution_tri_o(11) => Power_Distribution_tri_o_11(11),
      Power_Distribution_tri_o(10) => Power_Distribution_tri_o_10(10),
      Power_Distribution_tri_o(9) => Power_Distribution_tri_o_9(9),
      Power_Distribution_tri_o(8) => Power_Distribution_tri_o_8(8),
      Power_Distribution_tri_o(7) => Power_Distribution_tri_o_7(7),
      Power_Distribution_tri_o(6) => Power_Distribution_tri_o_6(6),
      Power_Distribution_tri_o(5) => Power_Distribution_tri_o_5(5),
      Power_Distribution_tri_o(4) => Power_Distribution_tri_o_4(4),
      Power_Distribution_tri_o(3) => Power_Distribution_tri_o_3(3),
      Power_Distribution_tri_o(2) => Power_Distribution_tri_o_2(2),
      Power_Distribution_tri_o(1) => Power_Distribution_tri_o_1(1),
      Power_Distribution_tri_o(0) => Power_Distribution_tri_o_0(0),
      Power_Distribution_tri_t(31) => Power_Distribution_tri_t_31(31),
      Power_Distribution_tri_t(30) => Power_Distribution_tri_t_30(30),
      Power_Distribution_tri_t(29) => Power_Distribution_tri_t_29(29),
      Power_Distribution_tri_t(28) => Power_Distribution_tri_t_28(28),
      Power_Distribution_tri_t(27) => Power_Distribution_tri_t_27(27),
      Power_Distribution_tri_t(26) => Power_Distribution_tri_t_26(26),
      Power_Distribution_tri_t(25) => Power_Distribution_tri_t_25(25),
      Power_Distribution_tri_t(24) => Power_Distribution_tri_t_24(24),
      Power_Distribution_tri_t(23) => Power_Distribution_tri_t_23(23),
      Power_Distribution_tri_t(22) => Power_Distribution_tri_t_22(22),
      Power_Distribution_tri_t(21) => Power_Distribution_tri_t_21(21),
      Power_Distribution_tri_t(20) => Power_Distribution_tri_t_20(20),
      Power_Distribution_tri_t(19) => Power_Distribution_tri_t_19(19),
      Power_Distribution_tri_t(18) => Power_Distribution_tri_t_18(18),
      Power_Distribution_tri_t(17) => Power_Distribution_tri_t_17(17),
      Power_Distribution_tri_t(16) => Power_Distribution_tri_t_16(16),
      Power_Distribution_tri_t(15) => Power_Distribution_tri_t_15(15),
      Power_Distribution_tri_t(14) => Power_Distribution_tri_t_14(14),
      Power_Distribution_tri_t(13) => Power_Distribution_tri_t_13(13),
      Power_Distribution_tri_t(12) => Power_Distribution_tri_t_12(12),
      Power_Distribution_tri_t(11) => Power_Distribution_tri_t_11(11),
      Power_Distribution_tri_t(10) => Power_Distribution_tri_t_10(10),
      Power_Distribution_tri_t(9) => Power_Distribution_tri_t_9(9),
      Power_Distribution_tri_t(8) => Power_Distribution_tri_t_8(8),
      Power_Distribution_tri_t(7) => Power_Distribution_tri_t_7(7),
      Power_Distribution_tri_t(6) => Power_Distribution_tri_t_6(6),
      Power_Distribution_tri_t(5) => Power_Distribution_tri_t_5(5),
      Power_Distribution_tri_t(4) => Power_Distribution_tri_t_4(4),
      Power_Distribution_tri_t(3) => Power_Distribution_tri_t_3(3),
      Power_Distribution_tri_t(2) => Power_Distribution_tri_t_2(2),
      Power_Distribution_tri_t(1) => Power_Distribution_tri_t_1(1),
      Power_Distribution_tri_t(0) => Power_Distribution_tri_t_0(0),
      RL_WHEEL_I => RL_WHEEL_I,
      RR_WHEEL_I => RR_WHEEL_I,
      R_EMERGENCY_BUTTON_I => R_EMERGENCY_BUTTON_I,
      SDC_SUPPLY_I => SDC_SUPPLY_I,
      SPI0_MISO_I => SPI0_MISO_I,
      SPI0_MOSI_O => SPI0_MOSI_O,
      SPI0_SCLK_O => SPI0_SCLK_O,
      SPI0_SS_O => SPI0_SS_O,
      TSMS_I => TSMS_I,
      UART0_CTSN => UART0_CTSN,
      UART0_RTSN => UART0_RTSN,
      UART0_RX => UART0_RX,
      UART0_TX => UART0_TX
    );
Power_Distribution_tri_iobuf_0: component IOBUF
     port map (
      I => Power_Distribution_tri_o_0(0),
      IO => Power_Distribution_tri_io(0),
      O => Power_Distribution_tri_i_0(0),
      T => Power_Distribution_tri_t_0(0)
    );
Power_Distribution_tri_iobuf_1: component IOBUF
     port map (
      I => Power_Distribution_tri_o_1(1),
      IO => Power_Distribution_tri_io(1),
      O => Power_Distribution_tri_i_1(1),
      T => Power_Distribution_tri_t_1(1)
    );
Power_Distribution_tri_iobuf_10: component IOBUF
     port map (
      I => Power_Distribution_tri_o_10(10),
      IO => Power_Distribution_tri_io(10),
      O => Power_Distribution_tri_i_10(10),
      T => Power_Distribution_tri_t_10(10)
    );
Power_Distribution_tri_iobuf_11: component IOBUF
     port map (
      I => Power_Distribution_tri_o_11(11),
      IO => Power_Distribution_tri_io(11),
      O => Power_Distribution_tri_i_11(11),
      T => Power_Distribution_tri_t_11(11)
    );
Power_Distribution_tri_iobuf_12: component IOBUF
     port map (
      I => Power_Distribution_tri_o_12(12),
      IO => Power_Distribution_tri_io(12),
      O => Power_Distribution_tri_i_12(12),
      T => Power_Distribution_tri_t_12(12)
    );
Power_Distribution_tri_iobuf_13: component IOBUF
     port map (
      I => Power_Distribution_tri_o_13(13),
      IO => Power_Distribution_tri_io(13),
      O => Power_Distribution_tri_i_13(13),
      T => Power_Distribution_tri_t_13(13)
    );
Power_Distribution_tri_iobuf_14: component IOBUF
     port map (
      I => Power_Distribution_tri_o_14(14),
      IO => Power_Distribution_tri_io(14),
      O => Power_Distribution_tri_i_14(14),
      T => Power_Distribution_tri_t_14(14)
    );
Power_Distribution_tri_iobuf_15: component IOBUF
     port map (
      I => Power_Distribution_tri_o_15(15),
      IO => Power_Distribution_tri_io(15),
      O => Power_Distribution_tri_i_15(15),
      T => Power_Distribution_tri_t_15(15)
    );
Power_Distribution_tri_iobuf_16: component IOBUF
     port map (
      I => Power_Distribution_tri_o_16(16),
      IO => Power_Distribution_tri_io(16),
      O => Power_Distribution_tri_i_16(16),
      T => Power_Distribution_tri_t_16(16)
    );
Power_Distribution_tri_iobuf_17: component IOBUF
     port map (
      I => Power_Distribution_tri_o_17(17),
      IO => Power_Distribution_tri_io(17),
      O => Power_Distribution_tri_i_17(17),
      T => Power_Distribution_tri_t_17(17)
    );
Power_Distribution_tri_iobuf_18: component IOBUF
     port map (
      I => Power_Distribution_tri_o_18(18),
      IO => Power_Distribution_tri_io(18),
      O => Power_Distribution_tri_i_18(18),
      T => Power_Distribution_tri_t_18(18)
    );
Power_Distribution_tri_iobuf_19: component IOBUF
     port map (
      I => Power_Distribution_tri_o_19(19),
      IO => Power_Distribution_tri_io(19),
      O => Power_Distribution_tri_i_19(19),
      T => Power_Distribution_tri_t_19(19)
    );
Power_Distribution_tri_iobuf_2: component IOBUF
     port map (
      I => Power_Distribution_tri_o_2(2),
      IO => Power_Distribution_tri_io(2),
      O => Power_Distribution_tri_i_2(2),
      T => Power_Distribution_tri_t_2(2)
    );
Power_Distribution_tri_iobuf_20: component IOBUF
     port map (
      I => Power_Distribution_tri_o_20(20),
      IO => Power_Distribution_tri_io(20),
      O => Power_Distribution_tri_i_20(20),
      T => Power_Distribution_tri_t_20(20)
    );
Power_Distribution_tri_iobuf_21: component IOBUF
     port map (
      I => Power_Distribution_tri_o_21(21),
      IO => Power_Distribution_tri_io(21),
      O => Power_Distribution_tri_i_21(21),
      T => Power_Distribution_tri_t_21(21)
    );
Power_Distribution_tri_iobuf_22: component IOBUF
     port map (
      I => Power_Distribution_tri_o_22(22),
      IO => Power_Distribution_tri_io(22),
      O => Power_Distribution_tri_i_22(22),
      T => Power_Distribution_tri_t_22(22)
    );
Power_Distribution_tri_iobuf_23: component IOBUF
     port map (
      I => Power_Distribution_tri_o_23(23),
      IO => Power_Distribution_tri_io(23),
      O => Power_Distribution_tri_i_23(23),
      T => Power_Distribution_tri_t_23(23)
    );
Power_Distribution_tri_iobuf_24: component IOBUF
     port map (
      I => Power_Distribution_tri_o_24(24),
      IO => Power_Distribution_tri_io(24),
      O => Power_Distribution_tri_i_24(24),
      T => Power_Distribution_tri_t_24(24)
    );
Power_Distribution_tri_iobuf_25: component IOBUF
     port map (
      I => Power_Distribution_tri_o_25(25),
      IO => Power_Distribution_tri_io(25),
      O => Power_Distribution_tri_i_25(25),
      T => Power_Distribution_tri_t_25(25)
    );
Power_Distribution_tri_iobuf_26: component IOBUF
     port map (
      I => Power_Distribution_tri_o_26(26),
      IO => Power_Distribution_tri_io(26),
      O => Power_Distribution_tri_i_26(26),
      T => Power_Distribution_tri_t_26(26)
    );
Power_Distribution_tri_iobuf_27: component IOBUF
     port map (
      I => Power_Distribution_tri_o_27(27),
      IO => Power_Distribution_tri_io(27),
      O => Power_Distribution_tri_i_27(27),
      T => Power_Distribution_tri_t_27(27)
    );
Power_Distribution_tri_iobuf_28: component IOBUF
     port map (
      I => Power_Distribution_tri_o_28(28),
      IO => Power_Distribution_tri_io(28),
      O => Power_Distribution_tri_i_28(28),
      T => Power_Distribution_tri_t_28(28)
    );
Power_Distribution_tri_iobuf_29: component IOBUF
     port map (
      I => Power_Distribution_tri_o_29(29),
      IO => Power_Distribution_tri_io(29),
      O => Power_Distribution_tri_i_29(29),
      T => Power_Distribution_tri_t_29(29)
    );
Power_Distribution_tri_iobuf_3: component IOBUF
     port map (
      I => Power_Distribution_tri_o_3(3),
      IO => Power_Distribution_tri_io(3),
      O => Power_Distribution_tri_i_3(3),
      T => Power_Distribution_tri_t_3(3)
    );
Power_Distribution_tri_iobuf_30: component IOBUF
     port map (
      I => Power_Distribution_tri_o_30(30),
      IO => Power_Distribution_tri_io(30),
      O => Power_Distribution_tri_i_30(30),
      T => Power_Distribution_tri_t_30(30)
    );
Power_Distribution_tri_iobuf_31: component IOBUF
     port map (
      I => Power_Distribution_tri_o_31(31),
      IO => Power_Distribution_tri_io(31),
      O => Power_Distribution_tri_i_31(31),
      T => Power_Distribution_tri_t_31(31)
    );
Power_Distribution_tri_iobuf_4: component IOBUF
     port map (
      I => Power_Distribution_tri_o_4(4),
      IO => Power_Distribution_tri_io(4),
      O => Power_Distribution_tri_i_4(4),
      T => Power_Distribution_tri_t_4(4)
    );
Power_Distribution_tri_iobuf_5: component IOBUF
     port map (
      I => Power_Distribution_tri_o_5(5),
      IO => Power_Distribution_tri_io(5),
      O => Power_Distribution_tri_i_5(5),
      T => Power_Distribution_tri_t_5(5)
    );
Power_Distribution_tri_iobuf_6: component IOBUF
     port map (
      I => Power_Distribution_tri_o_6(6),
      IO => Power_Distribution_tri_io(6),
      O => Power_Distribution_tri_i_6(6),
      T => Power_Distribution_tri_t_6(6)
    );
Power_Distribution_tri_iobuf_7: component IOBUF
     port map (
      I => Power_Distribution_tri_o_7(7),
      IO => Power_Distribution_tri_io(7),
      O => Power_Distribution_tri_i_7(7),
      T => Power_Distribution_tri_t_7(7)
    );
Power_Distribution_tri_iobuf_8: component IOBUF
     port map (
      I => Power_Distribution_tri_o_8(8),
      IO => Power_Distribution_tri_io(8),
      O => Power_Distribution_tri_i_8(8),
      T => Power_Distribution_tri_t_8(8)
    );
Power_Distribution_tri_iobuf_9: component IOBUF
     port map (
      I => Power_Distribution_tri_o_9(9),
      IO => Power_Distribution_tri_io(9),
      O => Power_Distribution_tri_i_9(9),
      T => Power_Distribution_tri_t_9(9)
    );
end STRUCTURE;
