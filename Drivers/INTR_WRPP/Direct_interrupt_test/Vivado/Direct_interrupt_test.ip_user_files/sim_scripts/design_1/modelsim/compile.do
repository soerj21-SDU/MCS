vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_15
vlib modelsim_lib/msim/processing_system7_vip_v1_0_17
vlib modelsim_lib/msim/xil_defaultlib

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_15 modelsim_lib/msim/axi_vip_v1_1_15
vmap processing_system7_vip_v1_0_17 modelsim_lib/msim/processing_system7_vip_v1_0_17
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_15  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/5753/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_17  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xilinx_vip "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ip/design_1_ila_0_0/sim/design_1_ila_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

