-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Oct 15 10:28:59 2024
-- Host        : mikkelsPC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/B_Git/MCS/MC/MC_V1_Zybo/Vivado/project_1.gen/sources_1/bd/Block_DIagram/ip/Block_DIagram_SDC_Monitor_CAR_0_1/Block_DIagram_SDC_Monitor_CAR_0_1_stub.vhdl
-- Design      : Block_DIagram_SDC_Monitor_CAR_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Block_DIagram_SDC_Monitor_CAR_0_1 is
  Port ( 
    CLK_I : in STD_LOGIC;
    COCKPIT_EMERGENCY_I : in STD_LOGIC;
    BOTS_I : in STD_LOGIC;
    Inertia_I : in STD_LOGIC;
    L_emergency_button_I : in STD_LOGIC;
    R_emergency_button_I : in STD_LOGIC;
    FR_wheel_I : in STD_LOGIC;
    FL_wheel_I : in STD_LOGIC;
    RR_wheel_I : in STD_LOGIC;
    RL_wheel_I : in STD_LOGIC;
    TSAC_HV_Connector_I : in STD_LOGIC;
    TSAC_IMD_I : in STD_LOGIC;
    TSAC_AMS_Enable_I : in STD_LOGIC;
    BSPD_I : in STD_LOGIC;
    HVD_I : in STD_LOGIC;
    TSMP_I : in STD_LOGIC;
    TSMS_I : in STD_LOGIC;
    IS_SDC_CLOSED_VECTOR_O : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end Block_DIagram_SDC_Monitor_CAR_0_1;

architecture stub of Block_DIagram_SDC_Monitor_CAR_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_I,COCKPIT_EMERGENCY_I,BOTS_I,Inertia_I,L_emergency_button_I,R_emergency_button_I,FR_wheel_I,FL_wheel_I,RR_wheel_I,RL_wheel_I,TSAC_HV_Connector_I,TSAC_IMD_I,TSAC_AMS_Enable_I,BSPD_I,HVD_I,TSMP_I,TSMS_I,IS_SDC_CLOSED_VECTOR_O[15:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "SDC_Monitor_CAR,Vivado 2023.2";
begin
end;
