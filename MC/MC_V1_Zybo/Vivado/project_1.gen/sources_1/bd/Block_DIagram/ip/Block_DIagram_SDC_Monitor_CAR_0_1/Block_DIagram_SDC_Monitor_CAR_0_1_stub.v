// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Oct 15 10:28:59 2024
// Host        : mikkelsPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/B_Git/MCS/MC/MC_V1_Zybo/Vivado/project_1.gen/sources_1/bd/Block_DIagram/ip/Block_DIagram_SDC_Monitor_CAR_0_1/Block_DIagram_SDC_Monitor_CAR_0_1_stub.v
// Design      : Block_DIagram_SDC_Monitor_CAR_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "SDC_Monitor_CAR,Vivado 2023.2" *)
module Block_DIagram_SDC_Monitor_CAR_0_1(CLK_I, COCKPIT_EMERGENCY_I, BOTS_I, Inertia_I, 
  L_emergency_button_I, R_emergency_button_I, FR_wheel_I, FL_wheel_I, RR_wheel_I, RL_wheel_I, 
  TSAC_HV_Connector_I, TSAC_IMD_I, TSAC_AMS_Enable_I, BSPD_I, HVD_I, TSMP_I, TSMS_I, 
  IS_SDC_CLOSED_VECTOR_O)
/* synthesis syn_black_box black_box_pad_pin="COCKPIT_EMERGENCY_I,BOTS_I,Inertia_I,L_emergency_button_I,R_emergency_button_I,FR_wheel_I,FL_wheel_I,RR_wheel_I,RL_wheel_I,TSAC_HV_Connector_I,TSAC_IMD_I,TSAC_AMS_Enable_I,BSPD_I,HVD_I,TSMP_I,TSMS_I,IS_SDC_CLOSED_VECTOR_O[15:0]" */
/* synthesis syn_force_seq_prim="CLK_I" */;
  input CLK_I /* synthesis syn_isclock = 1 */;
  input COCKPIT_EMERGENCY_I;
  input BOTS_I;
  input Inertia_I;
  input L_emergency_button_I;
  input R_emergency_button_I;
  input FR_wheel_I;
  input FL_wheel_I;
  input RR_wheel_I;
  input RL_wheel_I;
  input TSAC_HV_Connector_I;
  input TSAC_IMD_I;
  input TSAC_AMS_Enable_I;
  input BSPD_I;
  input HVD_I;
  input TSMP_I;
  input TSMS_I;
  output [15:0]IS_SDC_CLOSED_VECTOR_O;
endmodule
