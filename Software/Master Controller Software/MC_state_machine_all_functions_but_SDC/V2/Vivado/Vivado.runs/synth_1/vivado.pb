
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:032

00:00:072	
613.5272	
199.664Z17-268h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
j
"Loaded Vivado IP repository '%s'.
1332*coregen2!
C:/Xilinx/Vivado/2024.1/data/ipZ19-2313h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/utils_1/imports/synth_1/MC_wrapper.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2r
pC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/utils_1/imports/synth_1/MC_wrapper.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
e
Command: %s
53*	vivadotcl24
2synth_design -top MC_wrapper -part xc7z020clg400-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7z020Z17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7z020Z17-349h px� 
D
Loading part %s157*device2
xc7z020clg400-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7z020clg400-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
28484Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:06 . Memory (MB): peak = 1522.523 ; gain = 448.707
h px� 
�
synthesizing module '%s'638*oasys2

MC_wrapper2o
kC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/hdl/MC_wrapper.vhd2
938@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC2g
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
13652
MC_i2
MC2o
kC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/hdl/MC_wrapper.vhd2
1728@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC2i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
14478@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_SDC_Monitor_CAR_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_SDC_Monitor_CAR_0_0_stub.vhdl2
62
SDC_Monitor_CAR_02
MC_SDC_Monitor_CAR_0_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
19888@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_SDC_Monitor_CAR_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_SDC_Monitor_CAR_0_0_stub.vhdl2
318@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_axi_gpio_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_axi_gpio_0_0_stub.vhdl2
62

axi_gpio_02
MC_axi_gpio_0_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
20108@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_axi_gpio_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_axi_gpio_0_0_stub.vhdl2
338@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_processing_system7_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_processing_system7_0_0_stub.vhdl2
62
processing_system7_02
MC_processing_system7_0_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
20348@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_processing_system7_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_processing_system7_0_0_stub.vhdl2
1048@Z8-638h px� 
�
synthesizing module '%s'638*oasys2
MC_ps7_0_axi_periph_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
7508@Z8-638h px� 
�
synthesizing module '%s'638*oasys2
m00_couplers_imp_1OUIXXC2i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
588@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
m00_couplers_imp_1OUIXXC2
02
12i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
588@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
m01_couplers_imp_I0E1BJ2i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
1598@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
m01_couplers_imp_I0E1BJ2
02
12i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
1598@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
m02_couplers_imp_FE1AE72i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
2648@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
m02_couplers_imp_FE1AE72
02
12i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
2648@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
s00_couplers_imp_WUMUUK2i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
3948@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_auto_pc_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_auto_pc_0_stub.vhdl2
62	
auto_pc2
MC_auto_pc_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
5778@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_auto_pc_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_auto_pc_0_stub.vhdl2
718@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
s00_couplers_imp_WUMUUK2
02
12i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
3948@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	MC_xbar_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_xbar_0_stub.vhdl2
62
xbar2
	MC_xbar_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
12478@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	MC_xbar_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_xbar_0_stub.vhdl2
528@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC_ps7_0_axi_periph_02
02
12i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
7508@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_rst_ps7_0_100M_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_rst_ps7_0_100M_0_stub.vhdl2
62
rst_ps7_0_100M2
MC_rst_ps7_0_100M_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
22338@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_rst_ps7_0_100M_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_rst_ps7_0_100M_0_stub.vhdl2
228@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_xadc_wiz_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_xadc_wiz_0_0_stub.vhdl2
62

xadc_wiz_02
MC_xadc_wiz_0_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
22468@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_xadc_wiz_0_02�
�C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/.Xil/Vivado-7416-Soeren-Laptop/realtime/MC_xadc_wiz_0_0_stub.vhdl2
748@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_xlconstant_2_02�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_2_0/synth/MC_xlconstant_2_0.v2
532

xlconstant2
MC_xlconstant_2_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
23118@Z8-3491h px� 
�
synthesizing module '%s'%s4497*oasys2
MC_xlconstant_2_02
 2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_2_0/synth/MC_xlconstant_2_0.v2
538@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
xlconstant_v1_1_9_xlconstant2
 2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v2
688@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
xlconstant_v1_1_9_xlconstant2
 2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v2
688@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MC_xlconstant_2_02
 2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_2_0/synth/MC_xlconstant_2_0.v2
538@Z8-6155h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_xlconstant_0_02�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_0_0/synth/MC_xlconstant_0_0.v2
532
xlconstant_02
MC_xlconstant_0_02i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
23158@Z8-3491h px� 
�
synthesizing module '%s'%s4497*oasys2
MC_xlconstant_0_02
 2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_0_0/synth/MC_xlconstant_0_0.v2
538@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MC_xlconstant_0_02
 2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_0_0/synth/MC_xlconstant_0_0.v2
538@Z8-6155h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_xlconstant_1_12�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_1_1/synth/MC_xlconstant_1_1.v2
532
xlconstant_12
MC_xlconstant_1_12i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
23198@Z8-3491h px� 
�
synthesizing module '%s'%s4497*oasys2
MC_xlconstant_1_12
 2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_1_1/synth/MC_xlconstant_1_1.v2
538@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MC_xlconstant_1_12
 2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_1_1/synth/MC_xlconstant_1_1.v2
538@Z8-6155h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC2
02
12i
ec:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd2
14478@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

MC_wrapper2
02
12o
kC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/hdl/MC_wrapper.vhd2
938@Z8-256h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M_ACLK2
s00_couplers_imp_WUMUUKZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	M_ARESETN2
s00_couplers_imp_WUMUUKZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M_ACLK2
m02_couplers_imp_FE1AE7Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	M_ARESETN2
m02_couplers_imp_FE1AE7Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_ACLK2
m02_couplers_imp_FE1AE7Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	S_ARESETN2
m02_couplers_imp_FE1AE7Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M_ACLK2
m01_couplers_imp_I0E1BJZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	M_ARESETN2
m01_couplers_imp_I0E1BJZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_ACLK2
m01_couplers_imp_I0E1BJZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	S_ARESETN2
m01_couplers_imp_I0E1BJZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M_ACLK2
m00_couplers_imp_1OUIXXCZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	M_ARESETN2
m00_couplers_imp_1OUIXXCZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_ACLK2
m00_couplers_imp_1OUIXXCZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	S_ARESETN2
m00_couplers_imp_1OUIXXCZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

M00_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M00_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

M01_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M01_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

M02_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M02_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

S00_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S00_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:09 . Memory (MB): peak = 1642.094 ; gain = 568.277
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1642.094 ; gain = 568.277
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1642.094 ; gain = 568.277
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0182

1642.0942
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_processing_system7_0_0/MC_processing_system7_0_0/MC_processing_system7_0_0_in_context.xdc2
MC_i/processing_system7_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_processing_system7_0_0/MC_processing_system7_0_0/MC_processing_system7_0_0_in_context.xdc2
MC_i/processing_system7_0	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_axi_gpio_0_0/MC_axi_gpio_0_0/MC_axi_gpio_0_0_in_context.xdc2
MC_i/axi_gpio_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_axi_gpio_0_0/MC_axi_gpio_0_0/MC_axi_gpio_0_0_in_context.xdc2
MC_i/axi_gpio_0	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xbar_0/MC_xbar_0/MC_xbar_0_in_context.xdc2
MC_i/ps7_0_axi_periph/xbar	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xbar_0/MC_xbar_0/MC_xbar_0_in_context.xdc2
MC_i/ps7_0_axi_periph/xbar	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_auto_pc_0/MC_auto_pc_0/MC_auto_pc_0_in_context.xdc2.
*MC_i/ps7_0_axi_periph/s00_couplers/auto_pc	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_auto_pc_0/MC_auto_pc_0/MC_auto_pc_0_in_context.xdc2.
*MC_i/ps7_0_axi_periph/s00_couplers/auto_pc	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_rst_ps7_0_100M_0/MC_rst_ps7_0_100M_0/MC_rst_ps7_0_100M_0_in_context.xdc2
MC_i/rst_ps7_0_100M	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_rst_ps7_0_100M_0/MC_rst_ps7_0_100M_0/MC_rst_ps7_0_100M_0_in_context.xdc2
MC_i/rst_ps7_0_100M	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0_in_context.xdc2
MC_i/SDC_Monitor_CAR_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0/MC_SDC_Monitor_CAR_0_0_in_context.xdc2
MC_i/SDC_Monitor_CAR_0	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_in_context.xdc2
MC_i/xadc_wiz_0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_in_context.xdc2
MC_i/xadc_wiz_0	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
Vaux1_NetINV34C_v_n2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
678@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
Vaux1_NetINV34C_v_n2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
688@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
Vaux1_NetINV34C_v_p2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
698@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
Vaux1_NetINV34C_v_p2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
708@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
Vaux2_TP0_v_n2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
728@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
Vaux2_TP0_v_n2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
738@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
Vaux2_TP0_v_p2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
748@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
Vaux2_TP0_v_p2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
758@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2k
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2i
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
.Xil/MC_wrapper_propImpl.xdcZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2i
gC:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.srcs/constrs_1/new/Constraints.xdc2
.Xil/MC_wrapper_propImpl.xdcZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2d
`C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/dont_touch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2d
`C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/dont_touch.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1655.2422
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0092

1655.2422
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:07 ; elapsed = 00:00:17 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7z020clg400-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:07 ; elapsed = 00:00:17 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:18 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:18 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 220 (col length:60)
BRAMs: 280 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

M00_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M00_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

M01_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M01_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

M02_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M02_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

S00_ACLK2
MC_ps7_0_axi_periph_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S00_ARESETN2
MC_ps7_0_axi_periph_0Z8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:09 ; elapsed = 00:00:20 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:12 ; elapsed = 00:00:27 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:12 ; elapsed = 00:00:27 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:12 ; elapsed = 00:00:27 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
I
%s
*synth21
/+------+--------------------------+----------+
h p
x
� 
I
%s
*synth21
/|      |BlackBox name             |Instances |
h p
x
� 
I
%s
*synth21
/+------+--------------------------+----------+
h p
x
� 
I
%s
*synth21
/|1     |MC_xbar_0                 |         1|
h p
x
� 
I
%s
*synth21
/|2     |MC_auto_pc_0              |         1|
h p
x
� 
I
%s
*synth21
/|3     |MC_SDC_Monitor_CAR_0_0    |         1|
h p
x
� 
I
%s
*synth21
/|4     |MC_axi_gpio_0_0           |         1|
h p
x
� 
I
%s
*synth21
/|5     |MC_processing_system7_0_0 |         1|
h p
x
� 
I
%s
*synth21
/|6     |MC_rst_ps7_0_100M_0       |         1|
h p
x
� 
I
%s
*synth21
/|7     |MC_xadc_wiz_0_0           |         1|
h p
x
� 
I
%s
*synth21
/+------+--------------------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
J
%s*synth22
0+------+-------------------------------+------+
h px� 
J
%s*synth22
0|      |Cell                           |Count |
h px� 
J
%s*synth22
0+------+-------------------------------+------+
h px� 
J
%s*synth22
0|1     |MC_SDC_Monitor_CAR_0_0_bbox    |     1|
h px� 
J
%s*synth22
0|2     |MC_auto_pc_0_bbox              |     1|
h px� 
J
%s*synth22
0|3     |MC_axi_gpio_0_0_bbox           |     1|
h px� 
J
%s*synth22
0|4     |MC_processing_system7_0_0_bbox |     1|
h px� 
J
%s*synth22
0|5     |MC_rst_ps7_0_100M_0_bbox       |     1|
h px� 
J
%s*synth22
0|6     |MC_xadc_wiz_0_0_bbox           |     1|
h px� 
J
%s*synth22
0|7     |MC_xbar_0_bbox                 |     1|
h px� 
J
%s*synth22
0|8     |IBUF                           |    44|
h px� 
J
%s*synth22
0|9     |OBUF                           |     8|
h px� 
J
%s*synth22
0+------+-------------------------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 9 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:10 ; elapsed = 00:00:29 . Memory (MB): peak = 1655.242 ; gain = 568.277
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1655.242 ; gain = 581.426
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0182

1655.2422
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1655.2422
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

c018bba9Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
632
402
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:182

00:00:392

1655.2422

1011.477Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0052

1655.2422
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2b
`C:/Git/GitHub/MCS/MC/MC_state_machine_all_functions/V2/Vivado/Vivado.runs/synth_1/MC_wrapper.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2_
]report_utilization -file MC_wrapper_utilization_synth.rpt -pb MC_wrapper_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Mon Dec  9 08:52:17 2024Z17-206h px� 


End Record