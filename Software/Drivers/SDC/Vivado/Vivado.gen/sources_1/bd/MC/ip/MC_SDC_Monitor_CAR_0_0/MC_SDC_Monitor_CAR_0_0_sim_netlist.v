// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Thu Dec 26 16:48:46 2024
// Host        : mikkelsPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0_sim_netlist.v
// Design      : MC_SDC_Monitor_CAR_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MC_SDC_Monitor_CAR_0_0,SDC_Monitor_CAR,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "SDC_Monitor_CAR,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module MC_SDC_Monitor_CAR_0_0
   (CLK_I,
    SDC_SUPPLY_I,
    COCKPIT_EMERGENCY_I,
    BOTS_I,
    INERTIA_I,
    L_EMERGENCY_BUTTON_I,
    R_EMERGENCY_BUTTON_I,
    FR_WHEEL_I,
    FL_WHEEL_I,
    RR_WHEEL_I,
    RL_WHEEL_I,
    TSAC_HV_CONNECTOR_I,
    TSAC_IMD_I,
    TSAC_AMS_ENABLE_I,
    BSPD_I,
    HVD_I,
    TSMP_I,
    TSMS_I,
    SDC_NOT_CLOSED_VECTOR_O);
  input CLK_I;
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
  output [16:0]SDC_NOT_CLOSED_VECTOR_O;

  wire BOTS_I;
  wire BSPD_I;
  wire CLK_I;
  wire COCKPIT_EMERGENCY_I;
  wire FL_WHEEL_I;
  wire FR_WHEEL_I;
  wire HVD_I;
  wire INERTIA_I;
  wire L_EMERGENCY_BUTTON_I;
  wire RL_WHEEL_I;
  wire RR_WHEEL_I;
  wire R_EMERGENCY_BUTTON_I;
  wire [16:0]SDC_NOT_CLOSED_VECTOR_O;
  wire SDC_SUPPLY_I;
  wire TSAC_AMS_ENABLE_I;
  wire TSAC_HV_CONNECTOR_I;
  wire TSAC_IMD_I;
  wire TSMP_I;
  wire TSMS_I;

  MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR U0
       (.BOTS_I(BOTS_I),
        .BSPD_I(BSPD_I),
        .CLK_I(CLK_I),
        .COCKPIT_EMERGENCY_I(COCKPIT_EMERGENCY_I),
        .FL_WHEEL_I(FL_WHEEL_I),
        .FR_WHEEL_I(FR_WHEEL_I),
        .HVD_I(HVD_I),
        .INERTIA_I(INERTIA_I),
        .L_EMERGENCY_BUTTON_I(L_EMERGENCY_BUTTON_I),
        .RL_WHEEL_I(RL_WHEEL_I),
        .RR_WHEEL_I(RR_WHEEL_I),
        .R_EMERGENCY_BUTTON_I(R_EMERGENCY_BUTTON_I),
        .SDC_NOT_CLOSED_VECTOR_O(SDC_NOT_CLOSED_VECTOR_O),
        .SDC_SUPPLY_I(SDC_SUPPLY_I),
        .TSAC_AMS_ENABLE_I(TSAC_AMS_ENABLE_I),
        .TSAC_HV_CONNECTOR_I(TSAC_HV_CONNECTOR_I),
        .TSAC_IMD_I(TSAC_IMD_I),
        .TSMP_I(TSMP_I),
        .TSMS_I(TSMS_I));
endmodule

(* ORIG_REF_NAME = "SDC_Monitor_CAR" *) 
module MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR
   (SDC_NOT_CLOSED_VECTOR_O,
    TSMS_I,
    TSMP_I,
    HVD_I,
    BSPD_I,
    TSAC_AMS_ENABLE_I,
    TSAC_IMD_I,
    TSAC_HV_CONNECTOR_I,
    RL_WHEEL_I,
    RR_WHEEL_I,
    FL_WHEEL_I,
    FR_WHEEL_I,
    R_EMERGENCY_BUTTON_I,
    L_EMERGENCY_BUTTON_I,
    INERTIA_I,
    BOTS_I,
    COCKPIT_EMERGENCY_I,
    SDC_SUPPLY_I,
    CLK_I);
  output [16:0]SDC_NOT_CLOSED_VECTOR_O;
  input TSMS_I;
  input TSMP_I;
  input HVD_I;
  input BSPD_I;
  input TSAC_AMS_ENABLE_I;
  input TSAC_IMD_I;
  input TSAC_HV_CONNECTOR_I;
  input RL_WHEEL_I;
  input RR_WHEEL_I;
  input FL_WHEEL_I;
  input FR_WHEEL_I;
  input R_EMERGENCY_BUTTON_I;
  input L_EMERGENCY_BUTTON_I;
  input INERTIA_I;
  input BOTS_I;
  input COCKPIT_EMERGENCY_I;
  input SDC_SUPPLY_I;
  input CLK_I;

  wire BOTS_I;
  wire BSPD_I;
  wire CLK_I;
  wire COCKPIT_EMERGENCY_I;
  wire FL_WHEEL_I;
  wire FR_WHEEL_I;
  wire HVD_I;
  wire INERTIA_I;
  wire L_EMERGENCY_BUTTON_I;
  wire RL_WHEEL_I;
  wire RR_WHEEL_I;
  wire R_EMERGENCY_BUTTON_I;
  wire [16:0]SDC_NOT_CLOSED_VECTOR_O;
  wire SDC_SUPPLY_I;
  wire StartUp_Enable;
  wire StartUp_Enable1_carry__0_i_1_n_0;
  wire StartUp_Enable1_carry__0_i_2_n_0;
  wire StartUp_Enable1_carry__0_i_3_n_0;
  wire StartUp_Enable1_carry__0_i_4_n_0;
  wire StartUp_Enable1_carry__0_i_5_n_0;
  wire StartUp_Enable1_carry__0_i_6_n_0;
  wire StartUp_Enable1_carry__0_n_0;
  wire StartUp_Enable1_carry__0_n_1;
  wire StartUp_Enable1_carry__0_n_2;
  wire StartUp_Enable1_carry__0_n_3;
  wire StartUp_Enable1_carry__1_i_1_n_0;
  wire StartUp_Enable1_carry__1_i_2_n_0;
  wire StartUp_Enable1_carry__1_i_3_n_0;
  wire StartUp_Enable1_carry__1_i_4_n_0;
  wire StartUp_Enable1_carry__1_i_5_n_0;
  wire StartUp_Enable1_carry__1_i_6_n_0;
  wire StartUp_Enable1_carry__1_i_7_n_0;
  wire StartUp_Enable1_carry__1_n_0;
  wire StartUp_Enable1_carry__1_n_1;
  wire StartUp_Enable1_carry__1_n_2;
  wire StartUp_Enable1_carry__1_n_3;
  wire StartUp_Enable1_carry__2_i_1_n_0;
  wire StartUp_Enable1_carry__2_i_2_n_0;
  wire StartUp_Enable1_carry__2_i_3_n_0;
  wire StartUp_Enable1_carry__2_i_4_n_0;
  wire StartUp_Enable1_carry__2_i_5_n_0;
  wire StartUp_Enable1_carry__2_i_6_n_0;
  wire StartUp_Enable1_carry__2_i_7_n_0;
  wire StartUp_Enable1_carry__2_i_8_n_0;
  wire StartUp_Enable1_carry__2_n_0;
  wire StartUp_Enable1_carry__2_n_1;
  wire StartUp_Enable1_carry__2_n_2;
  wire StartUp_Enable1_carry__2_n_3;
  wire StartUp_Enable1_carry_i_1_n_0;
  wire StartUp_Enable1_carry_i_2_n_0;
  wire StartUp_Enable1_carry_i_3_n_0;
  wire StartUp_Enable1_carry_i_4_n_0;
  wire StartUp_Enable1_carry_i_5_n_0;
  wire StartUp_Enable1_carry_i_6_n_0;
  wire StartUp_Enable1_carry_i_7_n_0;
  wire StartUp_Enable1_carry_i_8_n_0;
  wire StartUp_Enable1_carry_n_0;
  wire StartUp_Enable1_carry_n_1;
  wire StartUp_Enable1_carry_n_2;
  wire StartUp_Enable1_carry_n_3;
  wire StartUp_Enable_i_1_n_0;
  wire TSAC_AMS_ENABLE_I;
  wire TSAC_HV_CONNECTOR_I;
  wire TSAC_IMD_I;
  wire TSMP_I;
  wire TSMS_I;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_3_n_0 ;
  wire [31:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_1 ;
  wire \counter_reg[0]_i_2_n_2 ;
  wire \counter_reg[0]_i_2_n_3 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_1 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_1 ;
  wire \counter_reg[28]_i_1_n_2 ;
  wire \counter_reg[28]_i_1_n_3 ;
  wire \counter_reg[28]_i_1_n_4 ;
  wire \counter_reg[28]_i_1_n_5 ;
  wire \counter_reg[28]_i_1_n_6 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire [3:0]NLW_StartUp_Enable1_carry_O_UNCONNECTED;
  wire [3:0]NLW_StartUp_Enable1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_StartUp_Enable1_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_StartUp_Enable1_carry__2_O_UNCONNECTED;
  wire [3:3]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[0] 
       (.CLR(1'b0),
        .D(SDC_SUPPLY_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[10] 
       (.CLR(1'b0),
        .D(TSAC_HV_CONNECTOR_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[11] 
       (.CLR(1'b0),
        .D(TSAC_IMD_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[12] 
       (.CLR(1'b0),
        .D(TSAC_AMS_ENABLE_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[13] 
       (.CLR(1'b0),
        .D(BSPD_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[14] 
       (.CLR(1'b0),
        .D(HVD_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[15] 
       (.CLR(1'b0),
        .D(TSMP_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[16] 
       (.CLR(1'b0),
        .D(TSMS_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[1] 
       (.CLR(1'b0),
        .D(COCKPIT_EMERGENCY_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[2] 
       (.CLR(1'b0),
        .D(BOTS_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[3] 
       (.CLR(1'b0),
        .D(INERTIA_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[4] 
       (.CLR(1'b0),
        .D(L_EMERGENCY_BUTTON_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[5] 
       (.CLR(1'b0),
        .D(R_EMERGENCY_BUTTON_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[6] 
       (.CLR(1'b0),
        .D(FR_WHEEL_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[7] 
       (.CLR(1'b0),
        .D(FL_WHEEL_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[8] 
       (.CLR(1'b0),
        .D(RR_WHEEL_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_NOT_CLOSED_VECTOR_O_reg[9] 
       (.CLR(1'b0),
        .D(RL_WHEEL_I),
        .G(StartUp_Enable),
        .GE(1'b1),
        .Q(SDC_NOT_CLOSED_VECTOR_O[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 StartUp_Enable1_carry
       (.CI(1'b0),
        .CO({StartUp_Enable1_carry_n_0,StartUp_Enable1_carry_n_1,StartUp_Enable1_carry_n_2,StartUp_Enable1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({StartUp_Enable1_carry_i_1_n_0,StartUp_Enable1_carry_i_2_n_0,StartUp_Enable1_carry_i_3_n_0,StartUp_Enable1_carry_i_4_n_0}),
        .O(NLW_StartUp_Enable1_carry_O_UNCONNECTED[3:0]),
        .S({StartUp_Enable1_carry_i_5_n_0,StartUp_Enable1_carry_i_6_n_0,StartUp_Enable1_carry_i_7_n_0,StartUp_Enable1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 StartUp_Enable1_carry__0
       (.CI(StartUp_Enable1_carry_n_0),
        .CO({StartUp_Enable1_carry__0_n_0,StartUp_Enable1_carry__0_n_1,StartUp_Enable1_carry__0_n_2,StartUp_Enable1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({StartUp_Enable1_carry__0_i_1_n_0,counter_reg[13],counter_reg[11],StartUp_Enable1_carry__0_i_2_n_0}),
        .O(NLW_StartUp_Enable1_carry__0_O_UNCONNECTED[3:0]),
        .S({StartUp_Enable1_carry__0_i_3_n_0,StartUp_Enable1_carry__0_i_4_n_0,StartUp_Enable1_carry__0_i_5_n_0,StartUp_Enable1_carry__0_i_6_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    StartUp_Enable1_carry__0_i_1
       (.I0(counter_reg[14]),
        .I1(counter_reg[15]),
        .O(StartUp_Enable1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    StartUp_Enable1_carry__0_i_2
       (.I0(counter_reg[8]),
        .I1(counter_reg[9]),
        .O(StartUp_Enable1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__0_i_3
       (.I0(counter_reg[15]),
        .I1(counter_reg[14]),
        .O(StartUp_Enable1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__0_i_4
       (.I0(counter_reg[12]),
        .I1(counter_reg[13]),
        .O(StartUp_Enable1_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__0_i_5
       (.I0(counter_reg[10]),
        .I1(counter_reg[11]),
        .O(StartUp_Enable1_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__0_i_6
       (.I0(counter_reg[9]),
        .I1(counter_reg[8]),
        .O(StartUp_Enable1_carry__0_i_6_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 StartUp_Enable1_carry__1
       (.CI(StartUp_Enable1_carry__0_n_0),
        .CO({StartUp_Enable1_carry__1_n_0,StartUp_Enable1_carry__1_n_1,StartUp_Enable1_carry__1_n_2,StartUp_Enable1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({StartUp_Enable1_carry__1_i_1_n_0,counter_reg[21],StartUp_Enable1_carry__1_i_2_n_0,StartUp_Enable1_carry__1_i_3_n_0}),
        .O(NLW_StartUp_Enable1_carry__1_O_UNCONNECTED[3:0]),
        .S({StartUp_Enable1_carry__1_i_4_n_0,StartUp_Enable1_carry__1_i_5_n_0,StartUp_Enable1_carry__1_i_6_n_0,StartUp_Enable1_carry__1_i_7_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    StartUp_Enable1_carry__1_i_1
       (.I0(counter_reg[22]),
        .I1(counter_reg[23]),
        .O(StartUp_Enable1_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    StartUp_Enable1_carry__1_i_2
       (.I0(counter_reg[18]),
        .I1(counter_reg[19]),
        .O(StartUp_Enable1_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable1_carry__1_i_3
       (.I0(counter_reg[16]),
        .I1(counter_reg[17]),
        .O(StartUp_Enable1_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__1_i_4
       (.I0(counter_reg[23]),
        .I1(counter_reg[22]),
        .O(StartUp_Enable1_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__1_i_5
       (.I0(counter_reg[20]),
        .I1(counter_reg[21]),
        .O(StartUp_Enable1_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__1_i_6
       (.I0(counter_reg[19]),
        .I1(counter_reg[18]),
        .O(StartUp_Enable1_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry__1_i_7
       (.I0(counter_reg[16]),
        .I1(counter_reg[17]),
        .O(StartUp_Enable1_carry__1_i_7_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 StartUp_Enable1_carry__2
       (.CI(StartUp_Enable1_carry__1_n_0),
        .CO({StartUp_Enable1_carry__2_n_0,StartUp_Enable1_carry__2_n_1,StartUp_Enable1_carry__2_n_2,StartUp_Enable1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({StartUp_Enable1_carry__2_i_1_n_0,StartUp_Enable1_carry__2_i_2_n_0,StartUp_Enable1_carry__2_i_3_n_0,StartUp_Enable1_carry__2_i_4_n_0}),
        .O(NLW_StartUp_Enable1_carry__2_O_UNCONNECTED[3:0]),
        .S({StartUp_Enable1_carry__2_i_5_n_0,StartUp_Enable1_carry__2_i_6_n_0,StartUp_Enable1_carry__2_i_7_n_0,StartUp_Enable1_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry__2_i_1
       (.I0(counter_reg[30]),
        .I1(counter_reg[31]),
        .O(StartUp_Enable1_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable1_carry__2_i_2
       (.I0(counter_reg[28]),
        .I1(counter_reg[29]),
        .O(StartUp_Enable1_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable1_carry__2_i_3
       (.I0(counter_reg[26]),
        .I1(counter_reg[27]),
        .O(StartUp_Enable1_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable1_carry__2_i_4
       (.I0(counter_reg[24]),
        .I1(counter_reg[25]),
        .O(StartUp_Enable1_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry__2_i_5
       (.I0(counter_reg[30]),
        .I1(counter_reg[31]),
        .O(StartUp_Enable1_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry__2_i_6
       (.I0(counter_reg[28]),
        .I1(counter_reg[29]),
        .O(StartUp_Enable1_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry__2_i_7
       (.I0(counter_reg[26]),
        .I1(counter_reg[27]),
        .O(StartUp_Enable1_carry__2_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry__2_i_8
       (.I0(counter_reg[24]),
        .I1(counter_reg[25]),
        .O(StartUp_Enable1_carry__2_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    StartUp_Enable1_carry_i_1
       (.I0(counter_reg[6]),
        .I1(counter_reg[7]),
        .O(StartUp_Enable1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable1_carry_i_2
       (.I0(counter_reg[4]),
        .I1(counter_reg[5]),
        .O(StartUp_Enable1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable1_carry_i_3
       (.I0(counter_reg[2]),
        .I1(counter_reg[3]),
        .O(StartUp_Enable1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable1_carry_i_4
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(StartUp_Enable1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    StartUp_Enable1_carry_i_5
       (.I0(counter_reg[7]),
        .I1(counter_reg[6]),
        .O(StartUp_Enable1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry_i_6
       (.I0(counter_reg[4]),
        .I1(counter_reg[5]),
        .O(StartUp_Enable1_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry_i_7
       (.I0(counter_reg[2]),
        .I1(counter_reg[3]),
        .O(StartUp_Enable1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    StartUp_Enable1_carry_i_8
       (.I0(counter_reg[0]),
        .I1(counter_reg[1]),
        .O(StartUp_Enable1_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    StartUp_Enable_i_1
       (.I0(StartUp_Enable),
        .I1(StartUp_Enable1_carry__2_n_0),
        .O(StartUp_Enable_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    StartUp_Enable_reg
       (.C(CLK_I),
        .CE(1'b1),
        .D(StartUp_Enable_i_1_n_0),
        .Q(StartUp_Enable),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \counter[0]_i_1 
       (.I0(StartUp_Enable),
        .I1(StartUp_Enable1_carry__2_n_0),
        .O(\counter[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_3 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\counter_reg[0]_i_2_n_1 ,\counter_reg[0]_i_2_n_2 ,\counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\counter_reg[24]_i_1_n_1 ,\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(counter_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[27] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[28] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(counter_reg[28]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO({\NLW_counter_reg[28]_i_1_CO_UNCONNECTED [3],\counter_reg[28]_i_1_n_1 ,\counter_reg[28]_i_1_n_2 ,\counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[28]_i_1_n_4 ,\counter_reg[28]_i_1_n_5 ,\counter_reg[28]_i_1_n_6 ,\counter_reg[28]_i_1_n_7 }),
        .S(counter_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[29] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(counter_reg[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[30] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(counter_reg[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[31] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(counter_reg[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(CLK_I),
        .CE(\counter[0]_i_1_n_0 ),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
