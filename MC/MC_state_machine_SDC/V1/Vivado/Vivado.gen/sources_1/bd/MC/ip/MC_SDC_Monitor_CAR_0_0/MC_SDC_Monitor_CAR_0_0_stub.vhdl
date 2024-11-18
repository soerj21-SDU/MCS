-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Nov 18 14:06:24 2024
-- Host        : Soeren-Laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Git/GitHub/MCS/MC/MC_state_machine_SDC/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0_stub.vhdl
-- Design      : MC_SDC_Monitor_CAR_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MC_SDC_Monitor_CAR_0_0 is
  Port ( 
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

end MC_SDC_Monitor_CAR_0_0;

architecture stub of MC_SDC_Monitor_CAR_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_I,SDC_SUPPLY_I,COCKPIT_EMERGENCY_I,BOTS_I,INERTIA_I,L_EMERGENCY_BUTTON_I,R_EMERGENCY_BUTTON_I,FR_WHEEL_I,FL_WHEEL_I,RR_WHEEL_I,RL_WHEEL_I,TSAC_HV_CONNECTOR_I,TSAC_IMD_I,TSAC_AMS_ENABLE_I,BSPD_I,HVD_I,TSMP_I,TSMS_I,SDC_VECTOR_O[16:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "SDC_Monitor_CAR,Vivado 2024.1";
begin
end;
