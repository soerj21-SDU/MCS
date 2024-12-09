--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Mon Dec  9 08:50:03 2024
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
    UART0_TX : out STD_LOGIC;
    Vaux0_BP1_v_n : in STD_LOGIC;
    Vaux0_BP1_v_p : in STD_LOGIC;
    Vaux10_TSCINV12C_v_n : in STD_LOGIC;
    Vaux10_TSCINV12C_v_p : in STD_LOGIC;
    Vaux11_RTDSC_v_n : in STD_LOGIC;
    Vaux11_RTDSC_v_p : in STD_LOGIC;
    Vaux12_CoolC_v_n : in STD_LOGIC;
    Vaux12_CoolC_v_p : in STD_LOGIC;
    Vaux13_LVSC_v_n : in STD_LOGIC;
    Vaux13_LVSC_v_p : in STD_LOGIC;
    Vaux1_TP0_v_n : in STD_LOGIC;
    Vaux1_TP0_v_p : in STD_LOGIC;
    Vaux2_NetINV34C_v_n : in STD_LOGIC;
    Vaux2_NetINV34C_v_p : in STD_LOGIC;
    Vaux3_SW_v_n : in STD_LOGIC;
    Vaux3_SW_v_p : in STD_LOGIC;
    Vaux4_DASHAMSC_v_n : in STD_LOGIC;
    Vaux4_DASHAMSC_v_p : in STD_LOGIC;
    Vaux5_LVSV_v_n : in STD_LOGIC;
    Vaux5_LVSV_v_p : in STD_LOGIC;
    Vaux6_BrakeC_v_n : in STD_LOGIC;
    Vaux6_BrakeC_v_p : in STD_LOGIC;
    Vaux7_PoEC_v_n : in STD_LOGIC;
    Vaux7_PoEC_v_p : in STD_LOGIC;
    Vaux8_BP0_v_n : in STD_LOGIC;
    Vaux8_BP0_v_p : in STD_LOGIC;
    Vaux9_TP1_v_n : in STD_LOGIC;
    Vaux9_TP1_v_p : in STD_LOGIC
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
    Vaux0_BP1_v_n : in STD_LOGIC;
    Vaux0_BP1_v_p : in STD_LOGIC;
    Vaux1_TP0_v_n : in STD_LOGIC;
    Vaux1_TP0_v_p : in STD_LOGIC;
    Vaux2_NetINV34C_v_n : in STD_LOGIC;
    Vaux2_NetINV34C_v_p : in STD_LOGIC;
    Vaux3_SW_v_n : in STD_LOGIC;
    Vaux3_SW_v_p : in STD_LOGIC;
    Vaux4_DASHAMSC_v_n : in STD_LOGIC;
    Vaux4_DASHAMSC_v_p : in STD_LOGIC;
    Vaux5_LVSV_v_n : in STD_LOGIC;
    Vaux5_LVSV_v_p : in STD_LOGIC;
    Vaux6_BrakeC_v_n : in STD_LOGIC;
    Vaux6_BrakeC_v_p : in STD_LOGIC;
    Vaux7_PoEC_v_n : in STD_LOGIC;
    Vaux7_PoEC_v_p : in STD_LOGIC;
    Vaux8_BP0_v_n : in STD_LOGIC;
    Vaux8_BP0_v_p : in STD_LOGIC;
    Vaux9_TP1_v_n : in STD_LOGIC;
    Vaux9_TP1_v_p : in STD_LOGIC;
    Vaux10_TSCINV12C_v_n : in STD_LOGIC;
    Vaux10_TSCINV12C_v_p : in STD_LOGIC;
    Vaux11_RTDSC_v_n : in STD_LOGIC;
    Vaux11_RTDSC_v_p : in STD_LOGIC;
    Vaux12_CoolC_v_n : in STD_LOGIC;
    Vaux12_CoolC_v_p : in STD_LOGIC;
    Vaux13_LVSC_v_n : in STD_LOGIC;
    Vaux13_LVSC_v_p : in STD_LOGIC
  );
  end component MC;
begin
MC_i: component MC
     port map (
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
      UART0_TX => UART0_TX,
      Vaux0_BP1_v_n => Vaux0_BP1_v_n,
      Vaux0_BP1_v_p => Vaux0_BP1_v_p,
      Vaux10_TSCINV12C_v_n => Vaux10_TSCINV12C_v_n,
      Vaux10_TSCINV12C_v_p => Vaux10_TSCINV12C_v_p,
      Vaux11_RTDSC_v_n => Vaux11_RTDSC_v_n,
      Vaux11_RTDSC_v_p => Vaux11_RTDSC_v_p,
      Vaux12_CoolC_v_n => Vaux12_CoolC_v_n,
      Vaux12_CoolC_v_p => Vaux12_CoolC_v_p,
      Vaux13_LVSC_v_n => Vaux13_LVSC_v_n,
      Vaux13_LVSC_v_p => Vaux13_LVSC_v_p,
      Vaux1_TP0_v_n => Vaux1_TP0_v_n,
      Vaux1_TP0_v_p => Vaux1_TP0_v_p,
      Vaux2_NetINV34C_v_n => Vaux2_NetINV34C_v_n,
      Vaux2_NetINV34C_v_p => Vaux2_NetINV34C_v_p,
      Vaux3_SW_v_n => Vaux3_SW_v_n,
      Vaux3_SW_v_p => Vaux3_SW_v_p,
      Vaux4_DASHAMSC_v_n => Vaux4_DASHAMSC_v_n,
      Vaux4_DASHAMSC_v_p => Vaux4_DASHAMSC_v_p,
      Vaux5_LVSV_v_n => Vaux5_LVSV_v_n,
      Vaux5_LVSV_v_p => Vaux5_LVSV_v_p,
      Vaux6_BrakeC_v_n => Vaux6_BrakeC_v_n,
      Vaux6_BrakeC_v_p => Vaux6_BrakeC_v_p,
      Vaux7_PoEC_v_n => Vaux7_PoEC_v_n,
      Vaux7_PoEC_v_p => Vaux7_PoEC_v_p,
      Vaux8_BP0_v_n => Vaux8_BP0_v_n,
      Vaux8_BP0_v_p => Vaux8_BP0_v_p,
      Vaux9_TP1_v_n => Vaux9_TP1_v_n,
      Vaux9_TP1_v_p => Vaux9_TP1_v_p
    );
end STRUCTURE;
