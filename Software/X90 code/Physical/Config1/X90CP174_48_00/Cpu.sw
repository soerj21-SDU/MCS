<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="INS" Source="INS.INS.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="AMS_CAN" Source="AMS_and_Shunt.CAN.AMS_CAN.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="INV_CAN" Source="Inverters.CAN.CAN.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3">
    <Task Name="INV_CTRL" Source="Inverters.Control.Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#4">
    <Task Name="INV_SM" Source="Inverters.Inv_statemachine.Inv_statemachine.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SENSORS" Source="Sensors.Sensors.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ACTUATORS" Source="Actuators.Output.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="DASHBOARD" Source="Dashboard.Dashboard.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="COOLING" Source="CoolingSystem.COOLING.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="file" Source="File.file.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="NewLogging" Source="Misc.DataLogging.NewLogging.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5">
    <Task Name="Simulation" Source="Inverters.Simulation.Simulation.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="AMS_CTRL" Source="AMS_and_Shunt.AMS.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SC" Source="SC.SafetyChain.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SM" Source="SM.StateMachine.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SENSOR_NET" Source="SensorNet.globalSensorNet.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="ALARM_MAN" Source="Misc.AlarmManagement.AlarmManagement.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#6">
    <Task Name="sampleST" Source="Misc.DataLogging.sampleST.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="DATALOG" Source="Misc.DataLogging.DataLog.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
  </TaskClass>
  <Binaries>
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="mvLoader" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arsvcreg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="Config_1" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Config" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Config_2" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Config_3" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="DataRecord" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="OpcUaMap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="acp10cfg" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="operator" Source="Libraries.operator.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="Libraries.AsIecCon.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIODiag" Source="Libraries.AsIODiag.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asstring" Source="Libraries.asstring.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="ArCan" Source="Libraries.ArCan.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brdkSIM" Source="Libraries.brdkSIM.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="brdkUSB" Source="Libraries.brdkUSB.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="AsIO" Source="Libraries.AsIO.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsBrStr" Source="Libraries.AsBrStr.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="FileIO" Source="Libraries.FileIO.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsUSB" Source="Libraries.AsUSB.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="DataObj" Source="Libraries.DataObj.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brdkSTR" Source="Libraries.brdkSTR.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="MpAlarmX" Source="Libraries.MpAlarmX.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpBase" Source="Libraries.MpBase.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpData" Source="Libraries.MpData.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpRecipe" Source="Libraries.MpRecipe.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sduVikings" Source="Libraries.sduVikings.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="MTTypes" Source="Libraries.MTTypes.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="dvframe" Source="Libraries.dvframe.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MTFilter" Source="Libraries.MTFilter.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="brdkFile" Source="Libraries.brdkFile.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="arssl" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="areventlog" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>