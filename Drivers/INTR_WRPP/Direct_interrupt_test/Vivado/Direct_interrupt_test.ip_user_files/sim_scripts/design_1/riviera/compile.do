transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_15
vlib riviera/processing_system7_vip_v1_0_17
vlib riviera/xil_defaultlib

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_15 riviera/axi_vip_v1_1_15
vmap processing_system7_vip_v1_0_17 riviera/processing_system7_vip_v1_0_17
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xilinx_vip  -incr "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib \
"../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_15  -incr "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib \
"../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/5753/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_17  -incr "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib \
"../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/e2ba/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/a29c/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/ae90/hdl/verilog" "+incdir+../../../../Direct_interrupt_test.gen/sources_1/bd/design_1/ipshared/0e59/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ip/design_1_ila_0_0/sim/design_1_ila_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

