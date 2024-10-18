// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 16 09:48:58 2024
// Host        : mikkelsPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/B_Git/MCS/MC/MC_Zybo_V1/Vivado/Vivado.gen/sources_1/bd/Block_Diagram/ip/Block_Diagram_SDC_Monitor_CAR_0_0/Block_Diagram_SDC_Monitor_CAR_0_0_stub.v
// Design      : Block_Diagram_SDC_Monitor_CAR_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "SDC_Monitor_CAR,Vivado 2024.1" *)
module Block_Diagram_SDC_Monitor_CAR_0_0(CLK_I, COCKPIT_EMERGENCY_I, BOTS_I, Inertia_I, 
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
