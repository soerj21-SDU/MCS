
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:032

00:00:082	
613.8122	
199.750Z17-268h px� 
e
-IPCACHE: Running cache check for IP inst: %s
2546*coregen2
MC_xadc_wiz_0_0Z19-6924h px� 
�
Command: %s
53*	vivadotcl2d
bsynth_design -top MC_xadc_wiz_0_0 -part xc7z020clg400-1 -incremental_mode off -mode out_of_contextZ4-113h px� 
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
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
20816Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:06 . Memory (MB): peak = 1502.867 ; gain = 446.902
h px� 
�
synthesizing module '%s'638*oasys2
MC_xadc_wiz_0_02u
qc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0.vhd2
1318@Z8-638h px� 
c
%s
*synth2K
I	Parameter C_INSTANCE bound to: MC_xadc_wiz_0_0_axi_xadc - type: string 
h p
x
� 
P
%s
*synth28
6	Parameter C_FAMILY bound to: virtex7 - type: string 
h p
x
� 
V
%s
*synth2>
<	Parameter C_S_AXI_ADDR_WIDTH bound to: 11 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter C_S_AXI_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter C_INCLUDE_INTR bound to: 1 - type: integer 
h p
x
� 
]
%s
*synth2E
C	Parameter C_SIM_MONITOR_FILE bound to: design.txt - type: string 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_xadc_wiz_0_0_axi_xadc2|
zc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_axi_xadc.vhd2
1432
U02
MC_xadc_wiz_0_0_axi_xadc2u
qc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0.vhd2
2388@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_xadc_wiz_0_0_axi_xadc2~
zc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_axi_xadc.vhd2
2638@Z8-638h px� 
c
%s
*synth2K
I	Parameter C_INSTANCE bound to: MC_xadc_wiz_0_0_axi_xadc - type: string 
h p
x
� 
P
%s
*synth28
6	Parameter C_FAMILY bound to: virtex7 - type: string 
h p
x
� 
V
%s
*synth2>
<	Parameter C_S_AXI_ADDR_WIDTH bound to: 11 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter C_S_AXI_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter C_INCLUDE_INTR bound to: 1 - type: integer 
h p
x
� 
]
%s
*synth2E
C	Parameter C_SIM_MONITOR_FILE bound to: design.txt - type: string 
h p
x
� 
�
synthesizing module '%s'638*oasys2
MC_xadc_wiz_0_0_axi_lite_ipif2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_axi_lite_ipif.vhd2
2418@Z8-638h px� 
V
%s
*synth2>
<	Parameter C_S_AXI_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter C_S_AXI_ADDR_WIDTH bound to: 11 - type: integer 
h p
x
� 
f
%s
*synth2N
L	Parameter C_S_AXI_MIN_SIZE bound to: 32'b00000000000000000000001111111111 
h p
x
� 
N
%s
*synth26
4	Parameter C_USE_WSTRB bound to: 1 - type: integer 
h p
x
� 
T
%s
*synth2<
:	Parameter C_DPHASE_TIMEOUT bound to: 64 - type: integer 
h p
x
� 
�
%s
*synth2�
�	Parameter C_ARD_ADDR_RANGE_ARRAY bound to: 384'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111110000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000111111100000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001111111111 
h p
x
� 
�
%s
*synth2�
�	Parameter C_ARD_NUM_CE_ARRAY bound to: 96'b000000000000000000000000000010000000000000000000000000000001000000000000000000000000000000000001 
h p
x
� 
P
%s
*synth28
6	Parameter C_FAMILY bound to: virtex7 - type: string 
h p
x
� 
�
synthesizing module '%s'638*oasys2"
 MC_xadc_wiz_0_0_slave_attachment2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_slave_attachment.vhd2
2278@Z8-638h px� 
�
%s
*synth2�
�	Parameter C_ARD_ADDR_RANGE_ARRAY bound to: 384'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111110000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000111111100000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001111111111 
h p
x
� 
�
%s
*synth2�
�	Parameter C_ARD_NUM_CE_ARRAY bound to: 96'b000000000000000000000000000010000000000000000000000000000001000000000000000000000000000000000001 
h p
x
� 
U
%s
*synth2=
;	Parameter C_IPIF_ABUS_WIDTH bound to: 11 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter C_IPIF_DBUS_WIDTH bound to: 32 - type: integer 
h p
x
� 
f
%s
*synth2N
L	Parameter C_S_AXI_MIN_SIZE bound to: 32'b00000000000000000000001111111111 
h p
x
� 
N
%s
*synth26
4	Parameter C_USE_WSTRB bound to: 1 - type: integer 
h p
x
� 
T
%s
*synth2<
:	Parameter C_DPHASE_TIMEOUT bound to: 64 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter C_FAMILY bound to: virtex7 - type: string 
h p
x
� 
�
synthesizing module '%s'638*oasys2!
MC_xadc_wiz_0_0_address_decoder2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_address_decoder.vhd2
1768@Z8-638h px� 
P
%s
*synth28
6	Parameter C_BUS_AWIDTH bound to: 10 - type: integer 
h p
x
� 
f
%s
*synth2N
L	Parameter C_S_AXI_MIN_SIZE bound to: 32'b00000000000000000000001111111111 
h p
x
� 
�
%s
*synth2�
�	Parameter C_ARD_ADDR_RANGE_ARRAY bound to: 384'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111110000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000111111100000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001111111111 
h p
x
� 
�
%s
*synth2�
�	Parameter C_ARD_NUM_CE_ARRAY bound to: 96'b000000000000000000000000000010000000000000000000000000000001000000000000000000000000000000000001 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
synthesizing module '%s'638*oasys2
MC_xadc_wiz_0_0_pselect_f2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 5 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter C_AW bound to: 10 - type: integer 
h p
x
� 
E
%s
*synth2-
+	Parameter C_BAR bound to: 10'b0000000000 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC_xadc_wiz_0_0_pselect_f2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized02�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b000 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized02
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b001 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized12
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized22�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b010 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized22
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized32�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b011 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized32
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized42�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b100 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized42
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized52�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b101 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized52
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized62�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b110 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized62
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized72�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 3 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 3 - type: integer 
h p
x
� 
=
%s
*synth2%
#	Parameter C_BAR bound to: 3'b111 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized72
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized82�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter C_AW bound to: 10 - type: integer 
h p
x
� 
E
%s
*synth2-
+	Parameter C_BAR bound to: 10'b0001000000 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized82
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized92�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0000 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
)MC_xadc_wiz_0_0_pselect_f__parameterized92
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized102�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0001 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized102
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized112�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0010 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized112
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized122�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0011 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized122
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized132�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0100 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized132
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized142�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0101 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized142
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized152�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0110 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized152
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized162�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b0111 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized162
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized172�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1000 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized172
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized182�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1001 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized182
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized192�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1010 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized192
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized202�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1011 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized202
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized212�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1100 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized212
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized222�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1101 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized222
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized232�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1110 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized232
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized242�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 4 - type: integer 
h p
x
� 
G
%s
*synth2/
-	Parameter C_AW bound to: 4 - type: integer 
h p
x
� 
>
%s
*synth2&
$	Parameter C_BAR bound to: 4'b1111 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized242
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
synthesizing module '%s'638*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized252�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-638h px� 
G
%s
*synth2/
-	Parameter C_AB bound to: 1 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter C_AW bound to: 10 - type: integer 
h p
x
� 
E
%s
*synth2-
+	Parameter C_BAR bound to: 10'b1000000000 
h p
x
� 
Q
%s
*synth29
7	Parameter C_FAMILY bound to: nofamily - type: string 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
*MC_xadc_wiz_0_0_pselect_f__parameterized252
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_pselect_f.vhd2
1678@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
MC_xadc_wiz_0_0_address_decoder2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_address_decoder.vhd2
1768@Z8-256h px� 
�
default block is never used226*oasys2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_slave_attachment.vhd2
3818@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
 MC_xadc_wiz_0_0_slave_attachment2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_slave_attachment.vhd2
2278@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC_xadc_wiz_0_0_axi_lite_ipif2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_axi_lite_ipif.vhd2
2418@Z8-256h px� 
V
%s
*synth2>
<	Parameter C_S_AXI_ADDR_WIDTH bound to: 11 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter C_S_AXI_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter C_FAMILY bound to: virtex7 - type: string 
h p
x
� 
M
%s
*synth25
3	Parameter CE_NUMBERS bound to: 9 - type: integer 
h p
x
� 
O
%s
*synth27
5	Parameter IP_INTR_NUM bound to: 17 - type: integer 
h p
x
� 
]
%s
*synth2E
C	Parameter C_SIM_MONITOR_FILE bound to: design.txt - type: string 
h p
x
� 
N
%s
*synth26
4	Parameter MUX_ADDR_NO bound to: 5 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MC_xadc_wiz_0_0_xadc_core_drp2�
c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_xadc_core_drp.vhd2
1412
AXI_XADC_CORE_I2
MC_xadc_wiz_0_0_xadc_core_drp2~
zc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_axi_xadc.vhd2
7458@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
MC_xadc_wiz_0_0_xadc_core_drp2�
c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_xadc_core_drp.vhd2
2148@Z8-638h px� 
V
%s
*synth2>
<	Parameter C_S_AXI_ADDR_WIDTH bound to: 11 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter C_S_AXI_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter C_FAMILY bound to: virtex7 - type: string 
h p
x
� 
M
%s
*synth25
3	Parameter CE_NUMBERS bound to: 9 - type: integer 
h p
x
� 
O
%s
*synth27
5	Parameter IP_INTR_NUM bound to: 17 - type: integer 
h p
x
� 
]
%s
*synth2E
C	Parameter C_SIM_MONITOR_FILE bound to: design.txt - type: string 
h p
x
� 
N
%s
*synth26
4	Parameter MUX_ADDR_NO bound to: 5 - type: integer 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_40 bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_41 bound to: 16'b0010000110100000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_42 bound to: 16'b0000010000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_48 bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_49 bound to: 16'b0011111111111111 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_4A bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_4B bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_4C bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_4D bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_4E bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_4F bound to: 16'b0000000000000000 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_50 bound to: 16'b1011010111101101 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_51 bound to: 16'b0101011111100100 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_52 bound to: 16'b1010000101000111 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_53 bound to: 16'b1100101000110011 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_54 bound to: 16'b1010100100111010 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_55 bound to: 16'b0101001011000110 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_56 bound to: 16'b1001010101010101 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_57 bound to: 16'b1010111001001110 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_58 bound to: 16'b0101100110011001 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_59 bound to: 16'b0101010101010101 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_5A bound to: 16'b1001100110011001 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_5B bound to: 16'b0110101010101010 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_5C bound to: 16'b0101000100010001 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_5D bound to: 16'b0101000100010001 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_5E bound to: 16'b1001000111101011 
h p
x
� 
M
%s
*synth25
3	Parameter INIT_5F bound to: 16'b0110011001100110 
h p
x
� 
O
%s
*synth27
5	Parameter SIM_DEVICE bound to: ZYNQ - type: string 
h p
x
� 
[
%s
*synth2C
A	Parameter SIM_MONITOR_FILE bound to: design.txt - type: string 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	XADC_INST2
XADC2�
c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_xadc_core_drp.vhd2
9978@Z8-113h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC_xadc_wiz_0_0_xadc_core_drp2
02
12�
c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_xadc_core_drp.vhd2
2148@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
MC_xadc_wiz_0_0_soft_reset2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
1428@Z8-638h px� 
R
%s
*synth2:
8	Parameter C_SIPIF_DWIDTH bound to: 32 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter C_RESET_WIDTH bound to: 16 - type: integer 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	RST_FLOPS2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2738@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2

FF_WRACK2
FDRSE2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
2968@Z8-113h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC_xadc_wiz_0_0_soft_reset2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/MC_xadc_wiz_0_0_soft_reset.vhd2
1428@Z8-256h px� 
�
synthesizing module '%s'638*oasys2#
!MC_xadc_wiz_0_0_interrupt_control2�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_interrupt_control.vhd2
2408@Z8-638h px� 
L
%s
*synth24
2	Parameter C_NUM_CE bound to: 16 - type: integer 
h p
x
� 
V
%s
*synth2>
<	Parameter C_NUM_IPIF_IRPT_SRC bound to: 1 - type: integer 
h p
x
� 
�
%s
*synth2�
�	Parameter C_IP_INTR_MODE_ARRAY bound to: 544'b0000000000000000000000000000010100000000000000000000000000000101000000000000000000000000000001010000000000000000000000000000010100000000000000000000000000000101000000000000000000000000000001010000000000000000000000000000010100000000000000000000000000000101000000000000000000000000000001010000000000000000000000000000010100000000000000000000000000000101000000000000000000000000000001010000000000000000000000000000010100000000000000000000000000000101000000000000000000000000000001010000000000000000000000000000010100000000000000000000000000000101 
h p
x
� 
V
%s
*synth2>
<	Parameter C_INCLUDE_DEV_PENCODER bound to: 0 - type: bool 
h p
x
� 
Q
%s
*synth29
7	Parameter C_INCLUDE_DEV_ISC bound to: 0 - type: bool 
h p
x
� 
Q
%s
*synth29
7	Parameter C_IPIF_DWIDTH bound to: 32 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2#
!MC_xadc_wiz_0_0_interrupt_control2
02
12�
�c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/MC_xadc_wiz_0_0_interrupt_control.vhd2
2408@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC_xadc_wiz_0_0_axi_xadc2
02
12~
zc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_axi_xadc.vhd2
2638@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
MC_xadc_wiz_0_02
02
12u
qc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0.vhd2
1318@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
convst_reg_input_reg2�
c:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_xadc_core_drp.vhd2
5268@Z8-6014h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[1]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[2]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[3]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[4]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[5]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[6]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[7]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[8]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[9]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[10]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[11]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[12]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[13]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[14]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_BE[1]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_BE[2]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_BE[3]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[0]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[1]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[2]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[3]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[4]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[5]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[6]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[9]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[11]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[12]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[13]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[14]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_RdCE[15]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[0]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[1]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[2]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[3]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[4]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[5]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[6]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[9]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[11]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[12]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[13]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[14]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Interrupt_WrCE[15]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
IPIF_Reg_Interrupts[0]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
IPIF_Reg_Interrupts[1]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
IPIF_Lvl_Interrupts[0]2#
!MC_xadc_wiz_0_0_interrupt_controlZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[0]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[1]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[2]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[3]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[4]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[5]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[6]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[7]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[8]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[9]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[10]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[11]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[12]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[13]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[14]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[15]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[16]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[17]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[18]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[19]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[20]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[21]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[22]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[23]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[24]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[25]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[26]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[27]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_BE[0]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_BE[1]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_BE[2]2
MC_xadc_wiz_0_0_soft_resetZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_RdCE[0]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_RdCE[5]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_RdCE[6]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_RdCE[7]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_WrCE[0]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_WrCE[5]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_WrCE[6]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_WrCE[7]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Addr[0]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Addr[1]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Addr[9]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Addr[10]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[0]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[1]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[2]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[3]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[4]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[5]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[6]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[7]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[8]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[9]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
Bus2IP_Data[10]2
MC_xadc_wiz_0_0_xadc_core_drpZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-71292
100Z17-14h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 1661.602 ; gain = 605.637
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 1661.602 ; gain = 605.637
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 1661.602 ; gain = 605.637
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
00:00:00.0122

1661.6022
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
18Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2y
uc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_ooc.xdc2
U0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2y
uc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0_ooc.xdc2
U0	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2u
qc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0.xdc2
U0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2u
qc:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xadc_wiz_0_0/MC_xadc_wiz_0_0.xdc2
U0	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2f
bC:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.runs/MC_xadc_wiz_0_0_synth_1/dont_touch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2f
bC:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.runs/MC_xadc_wiz_0_0_synth_1/dont_touch.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1751.6762
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2_
]  A total of 17 instances were transformed.
  FDRSE => FDRSE (FDRE, LUT4, VCC): 17 instances
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0352

1751.7502
0.074Z17-268h px� 
Q
!Incremental synthesis strategy %s2274*designutils2
offZ20-5008h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:17 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:08 ; elapsed = 00:00:17 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:17 . Memory (MB): peak = 1751.750 ; gain = 695.785
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2"
 MC_xadc_wiz_0_0_slave_attachmentZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                 sm_idle |                             0010 |                               00
h p
x
� 
y
%s
*synth2a
_                 sm_read |                             1000 |                               01
h p
x
� 
y
%s
*synth2a
_                sm_write |                             0100 |                               10
h p
x
� 
y
%s
*synth2a
_                 sm_resp |                             0001 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2	
one-hot2"
 MC_xadc_wiz_0_0_slave_attachmentZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:17 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 17    
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               17 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               11 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 124   
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   4 Input   18 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 53    
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 1     
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
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:27 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
}Finished Timing Optimization : Time (s): cpu = 00:00:14 ; elapsed = 00:00:28 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
|Finished Technology Mapping : Time (s): cpu = 00:00:14 ; elapsed = 00:00:28 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
vFinished IO Insertion : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|      |Cell |Count |
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|1     |LUT1 |     2|
h px� 
0
%s*synth2
|2     |LUT2 |    35|
h px� 
0
%s*synth2
|3     |LUT3 |    25|
h px� 
0
%s*synth2
|4     |LUT4 |    19|
h px� 
0
%s*synth2
|5     |LUT5 |    54|
h px� 
0
%s*synth2
|6     |LUT6 |    61|
h px� 
0
%s*synth2
|7     |XADC |     1|
h px� 
0
%s*synth2
|8     |FDRE |   206|
h px� 
0
%s*synth2
|9     |FDSE |    31|
h px� 
0
%s*synth2
+------+-----+------+
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 17 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:12 ; elapsed = 00:00:30 . Memory (MB): peak = 1751.750 ; gain = 605.637
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:17 ; elapsed = 00:00:32 . Memory (MB): peak = 1751.750 ; gain = 695.785
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
00:00:00.0102

1751.7502
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
1Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
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

1751.7502
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

9e61e23aZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1132
1022
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

00:00:202

00:00:392

1751.7502

1122.004Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0032

1751.7502
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2i
gC:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.runs/MC_xadc_wiz_0_0_synth_1/MC_xadc_wiz_0_0.dcpZ17-1381h px� 
�
<Added synthesis output to IP cache for IP %s, cache-ID = %s
485*coretcl2
MC_xadc_wiz_0_02
925559046e6a7d54Z2-1648h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1751.7502
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2i
gC:/Git/GitHub/MCS/MC/MC_state_machine/V1/Vivado/Vivado.runs/MC_xadc_wiz_0_0_synth_1/MC_xadc_wiz_0_0.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2i
greport_utilization -file MC_xadc_wiz_0_0_utilization_synth.rpt -pb MC_xadc_wiz_0_0_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Nov 12 11:14:00 2024Z17-206h px� 


End Record