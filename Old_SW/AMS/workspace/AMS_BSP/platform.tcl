# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/mogren18/Documents/Accumulator_Software/NewAMSSoftware/AMS/workspace/AMS_BSP/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/mogren18/Documents/Accumulator_Software/NewAMSSoftware/AMS/workspace/AMS_BSP/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {AMS_BSP}\
-hw {/home/mogren18/Documents/Accumulator_Software/NewAMSSoftware/AMS/workspace/design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {ucos} -no-boot-bsp -fsbl-target {psu_cortexa53_0} -out {/home/mogren18/Documents/Accumulator_Software/NewAMSSoftware/AMS/workspace}

platform write
platform generate -domains 
platform active {AMS_BSP}
bsp reload
bsp setlib -name ucos_can -ver 1.43
bsp setlib -name ucos_common -ver 1.43
bsp setlib -name ucos_osiii -ver 1.43
bsp setlib -name ucos_standalone -ver 1.43
bsp config STDIN_OUT "ps7_uart_1"
bsp config OS_CFG_SCHED_ROUND_ROBIN_EN "true"
bsp config OS_CFG_STAT_TASK_EN "true"
bsp setdriver -ip axi_timer_1 -driver tmrctr -ver 4.7
bsp write
bsp reload
catch {bsp regenerate}
platform clean
platform active {AMS_BSP}
platform generate
platform clean
platform generate
platform active {AMS_BSP}
platform active {AMS_BSP}
platform generate -domains 
platform active {AMS_BSP}
platform generate -domains 
platform active {AMS_BSP}
platform generate -domains 
platform clean
platform generate
platform active {AMS_BSP}
platform clean
platform generate
bsp reload
