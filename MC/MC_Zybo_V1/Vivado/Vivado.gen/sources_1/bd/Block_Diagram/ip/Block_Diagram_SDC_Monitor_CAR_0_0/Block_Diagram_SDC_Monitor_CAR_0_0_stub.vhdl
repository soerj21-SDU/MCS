-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Oct 16 09:48:58 2024
-- Host        : mikkelsPC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/B_Git/MCS/MC/MC_Zybo_V1/Vivado/Vivado.gen/sources_1/bd/Block_Diagram/ip/Block_Diagram_SDC_Monitor_CAR_0_0/Block_Diagram_SDC_Monitor_CAR_0_0_stub.vhdl
-- Design      : Block_Diagram_SDC_Monitor_CAR_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Block_Diagram_SDC_Monitor_CAR_0_0 is
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

end Block_Diagram_SDC_Monitor_CAR_0_0;

architecture stub of Block_Diagram_SDC_Monitor_CAR_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_I,COCKPIT_EMERGENCY_I,BOTS_I,Inertia_I,L_emergency_button_I,R_emergency_button_I,FR_wheel_I,FL_wheel_I,RR_wheel_I,RL_wheel_I,TSAC_HV_Connector_I,TSAC_IMD_I,TSAC_AMS_Enable_I,BSPD_I,HVD_I,TSMP_I,TSMS_I,IS_SDC_CLOSED_VECTOR_O[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "SDC_Monitor_CAR,Vivado 2024.1";
begin
end;
