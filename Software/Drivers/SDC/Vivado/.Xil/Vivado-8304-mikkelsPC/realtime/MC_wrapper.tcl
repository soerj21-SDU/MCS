# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/B_Git/MCS/MC/MC_V1/Vivado/.Xil/Vivado-8304-mikkelsPC/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    rt::set_parameter datapathDensePacking false
    set rt::partid xc7z020clg400-1
    source $::env(HRT_TCL_PATH)/rtSynthParallelPrep.tcl
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib
    rt::set_parameter defaultVhdlWorkLib xil_defaultlib

    rt::set_parameter loadVhdl2008Libs false
    rt::set_parameter loadVhdl2019Libs false
    rt::set_parameter deferParseUntilElab true
    rt::set_parameter sortHdlCommandLine true
    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv -include {
    c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ipshared/b28c/hdl
    c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ipshared/ec67/hdl
  } {
      C:/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv
      C:/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv
    }
      rt::read_verilog -include {
    c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ipshared/b28c/hdl
    c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ipshared/ec67/hdl
  } {
      c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v
      c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_0_0/synth/MC_xlconstant_0_0.v
      c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_1_1/synth/MC_xlconstant_1_1.v
      c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/ip/MC_xlconstant_2_0/synth/MC_xlconstant_2_0.v
    }
      rt::read_vhdl -lib xil_defaultlib {
      C:/B_Git/MCS/MC/MC_V1/Vivado/.Xil/Vivado-8304-mikkelsPC/realtime/MC_processing_system7_0_0_stub.vhdl
      C:/B_Git/MCS/MC/MC_V1/Vivado/.Xil/Vivado-8304-mikkelsPC/realtime/MC_axi_gpio_0_0_stub.vhdl
      C:/B_Git/MCS/MC/MC_V1/Vivado/.Xil/Vivado-8304-mikkelsPC/realtime/MC_auto_pc_0_stub.vhdl
      C:/B_Git/MCS/MC/MC_V1/Vivado/.Xil/Vivado-8304-mikkelsPC/realtime/MC_rst_ps7_0_100M_0_stub.vhdl
      C:/B_Git/MCS/MC/MC_V1/Vivado/.Xil/Vivado-8304-mikkelsPC/realtime/MC_SDC_Monitor_CAR_0_0_stub.vhdl
      C:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.srcs/sources_1/new/SDC_Monitor_CAR.vhd
      c:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/synth/MC.vhd
      C:/B_Git/MCS/MC/MC_V1/Vivado/Vivado.gen/sources_1/bd/MC/hdl/MC_wrapper.vhd
    }
      rt::read_vhdl -lib xpm C:/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top MC_wrapper
    rt::set_parameter enableIncremental true
    rt::set_parameter markDebugPreservationLevel "enable"
    set rt::reportTiming false
    rt::set_parameter lint_verbosity true
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter dataflowBusHighlighting false
    rt::set_parameter generateDataflowBusNetlist false
    rt::set_parameter dataFlowViewInElab false
    rt::set_parameter busViewFixBrokenConnections false
    rt::set_parameter elaborateRtlOnlyFlow true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter synthDebugLog false
    rt::set_parameter printModuleName false
    rt::set_parameter enableSplitFlowPath "C:/B_Git/MCS/MC/MC_V1/Vivado/.Xil/Vivado-8304-mikkelsPC/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
