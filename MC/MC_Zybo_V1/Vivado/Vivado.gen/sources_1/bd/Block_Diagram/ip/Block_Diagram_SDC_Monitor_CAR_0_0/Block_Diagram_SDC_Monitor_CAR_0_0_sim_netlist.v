// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 16 09:48:58 2024
// Host        : mikkelsPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/B_Git/MCS/MC/MC_Zybo_V1/Vivado/Vivado.gen/sources_1/bd/Block_Diagram/ip/Block_Diagram_SDC_Monitor_CAR_0_0/Block_Diagram_SDC_Monitor_CAR_0_0_sim_netlist.v
// Design      : Block_Diagram_SDC_Monitor_CAR_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Block_Diagram_SDC_Monitor_CAR_0_0,SDC_Monitor_CAR,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "SDC_Monitor_CAR,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module Block_Diagram_SDC_Monitor_CAR_0_0
   (CLK_I,
    COCKPIT_EMERGENCY_I,
    BOTS_I,
    Inertia_I,
    L_emergency_button_I,
    R_emergency_button_I,
    FR_wheel_I,
    FL_wheel_I,
    RR_wheel_I,
    RL_wheel_I,
    TSAC_HV_Connector_I,
    TSAC_IMD_I,
    TSAC_AMS_Enable_I,
    BSPD_I,
    HVD_I,
    TSMP_I,
    TSMS_I,
    IS_SDC_CLOSED_VECTOR_O);
  input CLK_I;
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

  wire BOTS_I;
  wire BSPD_I;
  wire CLK_I;
  wire COCKPIT_EMERGENCY_I;
  wire FL_wheel_I;
  wire FR_wheel_I;
  wire HVD_I;
  wire [15:0]IS_SDC_CLOSED_VECTOR_O;
  wire Inertia_I;
  wire L_emergency_button_I;
  wire RL_wheel_I;
  wire RR_wheel_I;
  wire R_emergency_button_I;
  wire TSAC_AMS_Enable_I;
  wire TSAC_HV_Connector_I;
  wire TSAC_IMD_I;
  wire TSMP_I;
  wire TSMS_I;

  Block_Diagram_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR U0
       (.BOTS_I(BOTS_I),
        .BSPD_I(BSPD_I),
        .CLK_I(CLK_I),
        .COCKPIT_EMERGENCY_I(COCKPIT_EMERGENCY_I),
        .FL_wheel_I(FL_wheel_I),
        .FR_wheel_I(FR_wheel_I),
        .HVD_I(HVD_I),
        .IS_SDC_CLOSED_VECTOR_O(IS_SDC_CLOSED_VECTOR_O),
        .Inertia_I(Inertia_I),
        .L_emergency_button_I(L_emergency_button_I),
        .RL_wheel_I(RL_wheel_I),
        .RR_wheel_I(RR_wheel_I),
        .R_emergency_button_I(R_emergency_button_I),
        .TSAC_AMS_Enable_I(TSAC_AMS_Enable_I),
        .TSAC_HV_Connector_I(TSAC_HV_Connector_I),
        .TSAC_IMD_I(TSAC_IMD_I),
        .TSMP_I(TSMP_I),
        .TSMS_I(TSMS_I));
endmodule

(* ORIG_REF_NAME = "SDC_Monitor_CAR" *) 
module Block_Diagram_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR
   (IS_SDC_CLOSED_VECTOR_O,
    TSMS_I,
    TSMP_I,
    HVD_I,
    BSPD_I,
    TSAC_AMS_Enable_I,
    TSAC_IMD_I,
    TSAC_HV_Connector_I,
    RL_wheel_I,
    RR_wheel_I,
    FL_wheel_I,
    FR_wheel_I,
    R_emergency_button_I,
    L_emergency_button_I,
    Inertia_I,
    BOTS_I,
    COCKPIT_EMERGENCY_I,
    CLK_I);
  output [15:0]IS_SDC_CLOSED_VECTOR_O;
  input TSMS_I;
  input TSMP_I;
  input HVD_I;
  input BSPD_I;
  input TSAC_AMS_Enable_I;
  input TSAC_IMD_I;
  input TSAC_HV_Connector_I;
  input RL_wheel_I;
  input RR_wheel_I;
  input FL_wheel_I;
  input FR_wheel_I;
  input R_emergency_button_I;
  input L_emergency_button_I;
  input Inertia_I;
  input BOTS_I;
  input COCKPIT_EMERGENCY_I;
  input CLK_I;

  wire BOTS_I;
  wire BSPD_I;
  wire CLK_I;
  wire COCKPIT_EMERGENCY_I;
  wire FL_wheel_I;
  wire FR_wheel_I;
  wire HVD_I;
  wire [15:0]IS_SDC_CLOSED_VECTOR_O;
  wire Inertia_I;
  wire L_emergency_button_I;
  wire RL_wheel_I;
  wire RR_wheel_I;
  wire R_emergency_button_I;
  wire TSAC_AMS_Enable_I;
  wire TSAC_HV_Connector_I;
  wire TSAC_IMD_I;
  wire TSMP_I;
  wire TSMS_I;
  wire [30:0]counter;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__2_n_0;
  wire counter0_carry__2_n_1;
  wire counter0_carry__2_n_2;
  wire counter0_carry__2_n_3;
  wire counter0_carry__3_n_0;
  wire counter0_carry__3_n_1;
  wire counter0_carry__3_n_2;
  wire counter0_carry__3_n_3;
  wire counter0_carry__4_n_0;
  wire counter0_carry__4_n_1;
  wire counter0_carry__4_n_2;
  wire counter0_carry__4_n_3;
  wire counter0_carry__5_n_0;
  wire counter0_carry__5_n_1;
  wire counter0_carry__5_n_2;
  wire counter0_carry__5_n_3;
  wire counter0_carry__6_n_3;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire \counter[30]_i_2_n_0 ;
  wire \counter[30]_i_3_n_0 ;
  wire \counter[30]_i_4_n_0 ;
  wire \counter[30]_i_5_n_0 ;
  wire \counter[30]_i_6_n_0 ;
  wire \counter[30]_i_7_n_0 ;
  wire \counter[30]_i_8_n_0 ;
  wire \counter[30]_i_9_n_0 ;
  wire p_0_in;
  wire [30:0]p_1_in;
  wire startup_delay_1sec_i_1_n_0;
  wire startup_delay_1sec_reg_n_0;
  wire [3:1]NLW_counter0_carry__6_CO_UNCONNECTED;
  wire [3:2]NLW_counter0_carry__6_O_UNCONNECTED;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[0] 
       (.CLR(1'b0),
        .D(COCKPIT_EMERGENCY_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[10] 
       (.CLR(1'b0),
        .D(TSAC_IMD_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[11] 
       (.CLR(1'b0),
        .D(TSAC_AMS_Enable_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[12] 
       (.CLR(1'b0),
        .D(BSPD_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[13] 
       (.CLR(1'b0),
        .D(HVD_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[14] 
       (.CLR(1'b0),
        .D(TSMP_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[15] 
       (.CLR(1'b0),
        .D(TSMS_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[1] 
       (.CLR(1'b0),
        .D(BOTS_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[2] 
       (.CLR(1'b0),
        .D(Inertia_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[3] 
       (.CLR(1'b0),
        .D(L_emergency_button_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[4] 
       (.CLR(1'b0),
        .D(R_emergency_button_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[5] 
       (.CLR(1'b0),
        .D(FR_wheel_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[6] 
       (.CLR(1'b0),
        .D(FL_wheel_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[7] 
       (.CLR(1'b0),
        .D(RR_wheel_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[8] 
       (.CLR(1'b0),
        .D(RL_wheel_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IS_SDC_CLOSED_VECTOR_O_reg[9] 
       (.CLR(1'b0),
        .D(TSAC_HV_Connector_I),
        .G(startup_delay_1sec_reg_n_0),
        .GE(1'b1),
        .Q(IS_SDC_CLOSED_VECTOR_O[9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({counter0_carry__2_n_0,counter0_carry__2_n_1,counter0_carry__2_n_2,counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[16:13]),
        .S(counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__3
       (.CI(counter0_carry__2_n_0),
        .CO({counter0_carry__3_n_0,counter0_carry__3_n_1,counter0_carry__3_n_2,counter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[20:17]),
        .S(counter[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__4
       (.CI(counter0_carry__3_n_0),
        .CO({counter0_carry__4_n_0,counter0_carry__4_n_1,counter0_carry__4_n_2,counter0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[24:21]),
        .S(counter[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__5
       (.CI(counter0_carry__4_n_0),
        .CO({counter0_carry__5_n_0,counter0_carry__5_n_1,counter0_carry__5_n_2,counter0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[28:25]),
        .S(counter[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__6
       (.CI(counter0_carry__5_n_0),
        .CO({NLW_counter0_carry__6_CO_UNCONNECTED[3:1],counter0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__6_O_UNCONNECTED[3:2],p_1_in[30:29]}),
        .S({1'b0,1'b0,counter[30:29]}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .O(p_1_in[0]));
  LUT3 #(
    .INIT(8'h02)) 
    \counter[30]_i_1 
       (.I0(\counter[30]_i_2_n_0 ),
        .I1(\counter[30]_i_3_n_0 ),
        .I2(\counter[30]_i_4_n_0 ),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \counter[30]_i_2 
       (.I0(\counter[30]_i_5_n_0 ),
        .I1(\counter[30]_i_6_n_0 ),
        .I2(\counter[30]_i_7_n_0 ),
        .I3(counter[1]),
        .I4(counter[11]),
        .I5(counter[2]),
        .O(\counter[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \counter[30]_i_3 
       (.I0(counter[9]),
        .I1(counter[25]),
        .I2(counter[17]),
        .I3(counter[22]),
        .I4(\counter[30]_i_8_n_0 ),
        .O(\counter[30]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \counter[30]_i_4 
       (.I0(counter[0]),
        .I1(counter[3]),
        .I2(counter[28]),
        .I3(counter[8]),
        .I4(\counter[30]_i_9_n_0 ),
        .O(\counter[30]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \counter[30]_i_5 
       (.I0(counter[30]),
        .I1(counter[4]),
        .I2(counter[15]),
        .I3(counter[24]),
        .O(\counter[30]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \counter[30]_i_6 
       (.I0(counter[12]),
        .I1(counter[23]),
        .I2(counter[21]),
        .I3(counter[10]),
        .O(\counter[30]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \counter[30]_i_7 
       (.I0(counter[14]),
        .I1(counter[7]),
        .I2(counter[13]),
        .I3(counter[29]),
        .O(\counter[30]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \counter[30]_i_8 
       (.I0(counter[18]),
        .I1(counter[20]),
        .I2(counter[26]),
        .I3(counter[6]),
        .O(\counter[30]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \counter[30]_i_9 
       (.I0(counter[19]),
        .I1(counter[5]),
        .I2(counter[16]),
        .I3(counter[27]),
        .O(\counter[30]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[0]),
        .Q(counter[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[10]),
        .Q(counter[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[11]),
        .Q(counter[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[12]),
        .Q(counter[12]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[13]),
        .Q(counter[13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[14]),
        .Q(counter[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[15]),
        .Q(counter[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[16]),
        .Q(counter[16]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[17]),
        .Q(counter[17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[18]),
        .Q(counter[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[19]),
        .Q(counter[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[1]),
        .Q(counter[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[20]),
        .Q(counter[20]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[21]),
        .Q(counter[21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[22]),
        .Q(counter[22]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[23]),
        .Q(counter[23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[24]),
        .Q(counter[24]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[25]),
        .Q(counter[25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[26]),
        .Q(counter[26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[27] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[27]),
        .Q(counter[27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[28] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[28]),
        .Q(counter[28]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[29] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[29]),
        .Q(counter[29]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[2]),
        .Q(counter[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[30] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[30]),
        .Q(counter[30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[3]),
        .Q(counter[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[4]),
        .Q(counter[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[5]),
        .Q(counter[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[6]),
        .Q(counter[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[7]),
        .Q(counter[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[8]),
        .Q(counter[8]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(p_1_in[9]),
        .Q(counter[9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'hABAA)) 
    startup_delay_1sec_i_1
       (.I0(startup_delay_1sec_reg_n_0),
        .I1(\counter[30]_i_4_n_0 ),
        .I2(\counter[30]_i_3_n_0 ),
        .I3(\counter[30]_i_2_n_0 ),
        .O(startup_delay_1sec_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    startup_delay_1sec_reg
       (.C(CLK_I),
        .CE(1'b1),
        .D(startup_delay_1sec_i_1_n_0),
        .Q(startup_delay_1sec_reg_n_0),
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
