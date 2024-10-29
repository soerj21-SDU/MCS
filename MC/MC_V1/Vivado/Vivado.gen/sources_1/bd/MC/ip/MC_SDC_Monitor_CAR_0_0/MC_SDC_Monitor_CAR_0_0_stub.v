// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Thu Oct 24 10:22:55 2024
// Host        : mikkelsPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0_stub.v
// Design      : MC_SDC_Monitor_CAR_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "SDC_Monitor_CAR,Vivado 2024.1" *)
module MC_SDC_Monitor_CAR_0_0(CLK_I, SDC_SUPPLY_I, COCKPIT_EMERGENCY_I, 
  BOTS_I, INERTIA_I, L_EMERGENCY_BUTTON_I, R_EMERGENCY_BUTTON_I, FR_WHEEL_I, FL_WHEEL_I, 
  RR_WHEEL_I, RL_WHEEL_I, TSAC_HV_CONNECTOR_I, TSAC_IMD_I, TSAC_AMS_ENABLE_I, BSPD_I, HVD_I, 
  TSMP_I, TSMS_I, IS_SDC_CLOSED_VECTOR_O)
/* synthesis syn_black_box black_box_pad_pin="SDC_SUPPLY_I,COCKPIT_EMERGENCY_I,BOTS_I,INERTIA_I,L_EMERGENCY_BUTTON_I,R_EMERGENCY_BUTTON_I,FR_WHEEL_I,FL_WHEEL_I,RR_WHEEL_I,RL_WHEEL_I,TSAC_HV_CONNECTOR_I,TSAC_IMD_I,TSAC_AMS_ENABLE_I,BSPD_I,HVD_I,TSMP_I,TSMS_I,IS_SDC_CLOSED_VECTOR_O[16:0]" */
/* synthesis syn_force_seq_prim="CLK_I" */;
  input CLK_I /* synthesis syn_isclock = 1 */;
  input SDC_SUPPLY_I;
  input COCKPIT_EMERGENCY_I;
  input BOTS_I;
  input INERTIA_I;
  input L_EMERGENCY_BUTTON_I;
  input R_EMERGENCY_BUTTON_I;
  input FR_WHEEL_I;
  input FL_WHEEL_I;
  input RR_WHEEL_I;
  input RL_WHEEL_I;
  input TSAC_HV_CONNECTOR_I;
  input TSAC_IMD_I;
  input TSAC_AMS_ENABLE_I;
  input BSPD_I;
  input HVD_I;
  input TSMP_I;
  input TSMS_I;
  output [16:0]IS_SDC_CLOSED_VECTOR_O;
endmodule
