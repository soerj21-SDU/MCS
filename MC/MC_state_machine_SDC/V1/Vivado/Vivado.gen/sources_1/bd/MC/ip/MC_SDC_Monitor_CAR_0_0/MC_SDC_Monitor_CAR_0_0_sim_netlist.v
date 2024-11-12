// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Tue Nov 12 11:15:40 2024
// Host        : Soeren-Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0_sim_netlist.v
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
    SDC_VECTOR_O);
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
  output [16:0]SDC_VECTOR_O;

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
  wire SDC_SUPPLY_I;
  wire [16:0]SDC_VECTOR_O;
  wire TSAC_AMS_ENABLE_I;
  wire TSAC_HV_CONNECTOR_I;
  wire TSAC_IMD_I;
  wire TSMP_I;
  wire TSMS_I;

  MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR U0
       (.CLK_I(CLK_I),
        .D({TSMS_I,TSMP_I,HVD_I,BSPD_I,TSAC_AMS_ENABLE_I,TSAC_IMD_I,TSAC_HV_CONNECTOR_I,RL_WHEEL_I,RR_WHEEL_I,FL_WHEEL_I,FR_WHEEL_I,R_EMERGENCY_BUTTON_I,L_EMERGENCY_BUTTON_I,INERTIA_I,BOTS_I,COCKPIT_EMERGENCY_I,SDC_SUPPLY_I}),
        .SDC_VECTOR_O(SDC_VECTOR_O));
endmodule

(* ORIG_REF_NAME = "SDC_Monitor_CAR" *) 
module MC_SDC_Monitor_CAR_0_0_SDC_Monitor_CAR
   (SDC_VECTOR_O,
    D,
    CLK_I);
  output [16:0]SDC_VECTOR_O;
  input [16:0]D;
  input CLK_I;

  wire CLK_I;
  wire [16:0]D;
  wire [16:0]SDC_VECTOR_O;
  (* MARK_DEBUG *) wire [30:0]counter;
  wire \counter[30]_i_10_n_0 ;
  wire \counter[30]_i_2_n_0 ;
  wire \counter[30]_i_3_n_0 ;
  wire \counter[30]_i_4_n_0 ;
  wire \counter[30]_i_5_n_0 ;
  wire \counter[30]_i_6_n_0 ;
  wire \counter[30]_i_7_n_0 ;
  wire \counter[30]_i_8_n_0 ;
  wire \counter[30]_i_9_n_0 ;
  wire counter_reg0;
  wire \counter_reg0_inferred__0/i__carry__0_n_0 ;
  wire \counter_reg0_inferred__0/i__carry__0_n_1 ;
  wire \counter_reg0_inferred__0/i__carry__0_n_2 ;
  wire \counter_reg0_inferred__0/i__carry__0_n_3 ;
  wire \counter_reg0_inferred__0/i__carry__1_n_0 ;
  wire \counter_reg0_inferred__0/i__carry__1_n_1 ;
  wire \counter_reg0_inferred__0/i__carry__1_n_2 ;
  wire \counter_reg0_inferred__0/i__carry__1_n_3 ;
  wire \counter_reg0_inferred__0/i__carry__2_n_0 ;
  wire \counter_reg0_inferred__0/i__carry__2_n_1 ;
  wire \counter_reg0_inferred__0/i__carry__2_n_2 ;
  wire \counter_reg0_inferred__0/i__carry__2_n_3 ;
  wire \counter_reg0_inferred__0/i__carry__3_n_0 ;
  wire \counter_reg0_inferred__0/i__carry__3_n_1 ;
  wire \counter_reg0_inferred__0/i__carry__3_n_2 ;
  wire \counter_reg0_inferred__0/i__carry__3_n_3 ;
  wire \counter_reg0_inferred__0/i__carry__4_n_0 ;
  wire \counter_reg0_inferred__0/i__carry__4_n_1 ;
  wire \counter_reg0_inferred__0/i__carry__4_n_2 ;
  wire \counter_reg0_inferred__0/i__carry__4_n_3 ;
  wire \counter_reg0_inferred__0/i__carry__5_n_0 ;
  wire \counter_reg0_inferred__0/i__carry__5_n_1 ;
  wire \counter_reg0_inferred__0/i__carry__5_n_2 ;
  wire \counter_reg0_inferred__0/i__carry__5_n_3 ;
  wire \counter_reg0_inferred__0/i__carry__6_n_3 ;
  wire \counter_reg0_inferred__0/i__carry_n_0 ;
  wire \counter_reg0_inferred__0/i__carry_n_1 ;
  wire \counter_reg0_inferred__0/i__carry_n_2 ;
  wire \counter_reg0_inferred__0/i__carry_n_3 ;
  wire [30:0]p_1_in;
  (* MARK_DEBUG *) wire startup_delay_1sec;
  wire startup_delay_1sec_i_1_n_0;
  wire [3:1]\NLW_counter_reg0_inferred__0/i__carry__6_CO_UNCONNECTED ;
  wire [3:2]\NLW_counter_reg0_inferred__0/i__carry__6_O_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[0] 
       (.CLR(1'b0),
        .D(D[0]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[10] 
       (.CLR(1'b0),
        .D(D[10]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[10]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[11] 
       (.CLR(1'b0),
        .D(D[11]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[11]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[12] 
       (.CLR(1'b0),
        .D(D[12]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[12]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[13] 
       (.CLR(1'b0),
        .D(D[13]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[13]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[14] 
       (.CLR(1'b0),
        .D(D[14]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[14]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[15] 
       (.CLR(1'b0),
        .D(D[15]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[15]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[16] 
       (.CLR(1'b0),
        .D(D[16]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[16]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[1] 
       (.CLR(1'b0),
        .D(D[1]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[2] 
       (.CLR(1'b0),
        .D(D[2]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[3] 
       (.CLR(1'b0),
        .D(D[3]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[4] 
       (.CLR(1'b0),
        .D(D[4]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[5] 
       (.CLR(1'b0),
        .D(D[5]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[5]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[6] 
       (.CLR(1'b0),
        .D(D[6]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[6]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[7] 
       (.CLR(1'b0),
        .D(D[7]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[7]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[8] 
       (.CLR(1'b0),
        .D(D[8]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[8]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \SDC_VECTOR_O_reg[9] 
       (.CLR(1'b0),
        .D(D[9]),
        .G(startup_delay_1sec),
        .GE(1'b1),
        .Q(SDC_VECTOR_O[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .O(p_1_in[0]));
  LUT4 #(
    .INIT(16'h0004)) 
    \counter[30]_i_1 
       (.I0(\counter[30]_i_3_n_0 ),
        .I1(\counter[30]_i_4_n_0 ),
        .I2(\counter[30]_i_5_n_0 ),
        .I3(\counter[30]_i_6_n_0 ),
        .O(counter_reg0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \counter[30]_i_10 
       (.I0(counter[8]),
        .I1(counter[3]),
        .I2(counter[26]),
        .I3(counter[19]),
        .O(\counter[30]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[30]_i_2 
       (.I0(startup_delay_1sec),
        .O(\counter[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter[30]_i_3 
       (.I0(startup_delay_1sec),
        .I1(counter[0]),
        .I2(counter[17]),
        .I3(counter[28]),
        .I4(\counter[30]_i_7_n_0 ),
        .O(\counter[30]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \counter[30]_i_4 
       (.I0(counter[7]),
        .I1(counter[6]),
        .I2(counter[16]),
        .I3(counter[29]),
        .I4(\counter[30]_i_8_n_0 ),
        .O(\counter[30]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFEFFF)) 
    \counter[30]_i_5 
       (.I0(counter[5]),
        .I1(counter[4]),
        .I2(counter[20]),
        .I3(counter[22]),
        .I4(\counter[30]_i_9_n_0 ),
        .O(\counter[30]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \counter[30]_i_6 
       (.I0(counter[10]),
        .I1(counter[14]),
        .I2(counter[25]),
        .I3(counter[23]),
        .I4(\counter[30]_i_10_n_0 ),
        .O(\counter[30]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \counter[30]_i_7 
       (.I0(counter[9]),
        .I1(counter[2]),
        .I2(counter[21]),
        .I3(counter[18]),
        .O(\counter[30]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \counter[30]_i_8 
       (.I0(counter[30]),
        .I1(counter[12]),
        .I2(counter[24]),
        .I3(counter[13]),
        .O(\counter[30]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \counter[30]_i_9 
       (.I0(counter[11]),
        .I1(counter[1]),
        .I2(counter[15]),
        .I3(counter[27]),
        .O(\counter[30]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\counter_reg0_inferred__0/i__carry_n_0 ,\counter_reg0_inferred__0/i__carry_n_1 ,\counter_reg0_inferred__0/i__carry_n_2 ,\counter_reg0_inferred__0/i__carry_n_3 }),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry__0 
       (.CI(\counter_reg0_inferred__0/i__carry_n_0 ),
        .CO({\counter_reg0_inferred__0/i__carry__0_n_0 ,\counter_reg0_inferred__0/i__carry__0_n_1 ,\counter_reg0_inferred__0/i__carry__0_n_2 ,\counter_reg0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry__1 
       (.CI(\counter_reg0_inferred__0/i__carry__0_n_0 ),
        .CO({\counter_reg0_inferred__0/i__carry__1_n_0 ,\counter_reg0_inferred__0/i__carry__1_n_1 ,\counter_reg0_inferred__0/i__carry__1_n_2 ,\counter_reg0_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry__2 
       (.CI(\counter_reg0_inferred__0/i__carry__1_n_0 ),
        .CO({\counter_reg0_inferred__0/i__carry__2_n_0 ,\counter_reg0_inferred__0/i__carry__2_n_1 ,\counter_reg0_inferred__0/i__carry__2_n_2 ,\counter_reg0_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[16:13]),
        .S(counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry__3 
       (.CI(\counter_reg0_inferred__0/i__carry__2_n_0 ),
        .CO({\counter_reg0_inferred__0/i__carry__3_n_0 ,\counter_reg0_inferred__0/i__carry__3_n_1 ,\counter_reg0_inferred__0/i__carry__3_n_2 ,\counter_reg0_inferred__0/i__carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[20:17]),
        .S(counter[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry__4 
       (.CI(\counter_reg0_inferred__0/i__carry__3_n_0 ),
        .CO({\counter_reg0_inferred__0/i__carry__4_n_0 ,\counter_reg0_inferred__0/i__carry__4_n_1 ,\counter_reg0_inferred__0/i__carry__4_n_2 ,\counter_reg0_inferred__0/i__carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[24:21]),
        .S(counter[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry__5 
       (.CI(\counter_reg0_inferred__0/i__carry__4_n_0 ),
        .CO({\counter_reg0_inferred__0/i__carry__5_n_0 ,\counter_reg0_inferred__0/i__carry__5_n_1 ,\counter_reg0_inferred__0/i__carry__5_n_2 ,\counter_reg0_inferred__0/i__carry__5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[28:25]),
        .S(counter[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg0_inferred__0/i__carry__6 
       (.CI(\counter_reg0_inferred__0/i__carry__5_n_0 ),
        .CO({\NLW_counter_reg0_inferred__0/i__carry__6_CO_UNCONNECTED [3:1],\counter_reg0_inferred__0/i__carry__6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg0_inferred__0/i__carry__6_O_UNCONNECTED [3:2],p_1_in[30:29]}),
        .S({1'b0,1'b0,counter[30:29]}));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[0]),
        .Q(counter[0]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[10]),
        .Q(counter[10]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[11]),
        .Q(counter[11]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[12]),
        .Q(counter[12]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[13]),
        .Q(counter[13]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[14]),
        .Q(counter[14]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[15]),
        .Q(counter[15]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[16]),
        .Q(counter[16]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[17]),
        .Q(counter[17]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[18]),
        .Q(counter[18]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[19]),
        .Q(counter[19]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[1]),
        .Q(counter[1]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[20]),
        .Q(counter[20]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[21]),
        .Q(counter[21]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[22]),
        .Q(counter[22]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[23]),
        .Q(counter[23]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[24]),
        .Q(counter[24]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[25]),
        .Q(counter[25]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[26]),
        .Q(counter[26]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[27] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[27]),
        .Q(counter[27]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[28] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[28]),
        .Q(counter[28]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[29] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[29]),
        .Q(counter[29]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[2]),
        .Q(counter[2]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[30] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[30]),
        .Q(counter[30]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[3]),
        .Q(counter[3]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[4]),
        .Q(counter[4]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[5]),
        .Q(counter[5]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[6]),
        .Q(counter[6]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[7]),
        .Q(counter[7]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[8]),
        .Q(counter[8]),
        .R(counter_reg0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(CLK_I),
        .CE(\counter[30]_i_2_n_0 ),
        .D(p_1_in[9]),
        .Q(counter[9]),
        .R(counter_reg0));
  LUT6 #(
    .INIT(64'h88888888888F8888)) 
    startup_delay_1sec_i_1
       (.I0(startup_delay_1sec),
        .I1(startup_delay_1sec),
        .I2(\counter[30]_i_6_n_0 ),
        .I3(\counter[30]_i_5_n_0 ),
        .I4(\counter[30]_i_4_n_0 ),
        .I5(\counter[30]_i_3_n_0 ),
        .O(startup_delay_1sec_i_1_n_0));
  (* KEEP = "yes" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    startup_delay_1sec_reg
       (.C(CLK_I),
        .CE(1'b1),
        .D(startup_delay_1sec_i_1_n_0),
        .Q(startup_delay_1sec),
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
