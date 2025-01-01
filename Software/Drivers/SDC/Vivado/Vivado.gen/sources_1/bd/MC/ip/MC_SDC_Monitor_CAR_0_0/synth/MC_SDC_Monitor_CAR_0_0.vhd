-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:SDC_Monitor_CAR:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MC_SDC_Monitor_CAR_0_0 IS
  PORT (
    CLK_I : IN STD_LOGIC;
    SDC_SUPPLY_I : IN STD_LOGIC;
    COCKPIT_EMERGENCY_I : IN STD_LOGIC;
    BOTS_I : IN STD_LOGIC;
    INERTIA_I : IN STD_LOGIC;
    L_EMERGENCY_BUTTON_I : IN STD_LOGIC;
    R_EMERGENCY_BUTTON_I : IN STD_LOGIC;
    FR_WHEEL_I : IN STD_LOGIC;
    FL_WHEEL_I : IN STD_LOGIC;
    RR_WHEEL_I : IN STD_LOGIC;
    RL_WHEEL_I : IN STD_LOGIC;
    TSAC_HV_CONNECTOR_I : IN STD_LOGIC;
    TSAC_IMD_I : IN STD_LOGIC;
    TSAC_AMS_ENABLE_I : IN STD_LOGIC;
    BSPD_I : IN STD_LOGIC;
    HVD_I : IN STD_LOGIC;
    TSMP_I : IN STD_LOGIC;
    TSMS_I : IN STD_LOGIC;
    SDC_NOT_CLOSED_VECTOR_O : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
  );
END MC_SDC_Monitor_CAR_0_0;

ARCHITECTURE MC_SDC_Monitor_CAR_0_0_arch OF MC_SDC_Monitor_CAR_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MC_SDC_Monitor_CAR_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT SDC_Monitor_CAR IS
    GENERIC (
      NO_OF_SDC_NODES : INTEGER;
      ClK_divider : INTEGER
    );
    PORT (
      CLK_I : IN STD_LOGIC;
      SDC_SUPPLY_I : IN STD_LOGIC;
      COCKPIT_EMERGENCY_I : IN STD_LOGIC;
      BOTS_I : IN STD_LOGIC;
      INERTIA_I : IN STD_LOGIC;
      L_EMERGENCY_BUTTON_I : IN STD_LOGIC;
      R_EMERGENCY_BUTTON_I : IN STD_LOGIC;
      FR_WHEEL_I : IN STD_LOGIC;
      FL_WHEEL_I : IN STD_LOGIC;
      RR_WHEEL_I : IN STD_LOGIC;
      RL_WHEEL_I : IN STD_LOGIC;
      TSAC_HV_CONNECTOR_I : IN STD_LOGIC;
      TSAC_IMD_I : IN STD_LOGIC;
      TSAC_AMS_ENABLE_I : IN STD_LOGIC;
      BSPD_I : IN STD_LOGIC;
      HVD_I : IN STD_LOGIC;
      TSMP_I : IN STD_LOGIC;
      TSMS_I : IN STD_LOGIC;
      SDC_NOT_CLOSED_VECTOR_O : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
    );
  END COMPONENT SDC_Monitor_CAR;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF MC_SDC_Monitor_CAR_0_0_arch: ARCHITECTURE IS "SDC_Monitor_CAR,Vivado 2024.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF MC_SDC_Monitor_CAR_0_0_arch : ARCHITECTURE IS "MC_SDC_Monitor_CAR_0_0,SDC_Monitor_CAR,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF MC_SDC_Monitor_CAR_0_0_arch: ARCHITECTURE IS "MC_SDC_Monitor_CAR_0_0,SDC_Monitor_CAR,{x_ipProduct=Vivado 2024.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=SDC_Monitor_CAR,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,NO_OF_SDC_NODES=17,ClK_divider=10000000}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MC_SDC_Monitor_CAR_0_0_arch: ARCHITECTURE IS "module_ref";
BEGIN
  U0 : SDC_Monitor_CAR
    GENERIC MAP (
      NO_OF_SDC_NODES => 17,
      ClK_divider => 10000000
    )
    PORT MAP (
      CLK_I => CLK_I,
      SDC_SUPPLY_I => SDC_SUPPLY_I,
      COCKPIT_EMERGENCY_I => COCKPIT_EMERGENCY_I,
      BOTS_I => BOTS_I,
      INERTIA_I => INERTIA_I,
      L_EMERGENCY_BUTTON_I => L_EMERGENCY_BUTTON_I,
      R_EMERGENCY_BUTTON_I => R_EMERGENCY_BUTTON_I,
      FR_WHEEL_I => FR_WHEEL_I,
      FL_WHEEL_I => FL_WHEEL_I,
      RR_WHEEL_I => RR_WHEEL_I,
      RL_WHEEL_I => RL_WHEEL_I,
      TSAC_HV_CONNECTOR_I => TSAC_HV_CONNECTOR_I,
      TSAC_IMD_I => TSAC_IMD_I,
      TSAC_AMS_ENABLE_I => TSAC_AMS_ENABLE_I,
      BSPD_I => BSPD_I,
      HVD_I => HVD_I,
      TSMP_I => TSMP_I,
      TSMS_I => TSMS_I,
      SDC_NOT_CLOSED_VECTOR_O => SDC_NOT_CLOSED_VECTOR_O
    );
END MC_SDC_Monitor_CAR_0_0_arch;
