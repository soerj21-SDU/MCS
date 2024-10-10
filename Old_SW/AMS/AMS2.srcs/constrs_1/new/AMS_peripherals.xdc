#OLD SPI0 FOR LTC6813 SETUP USING EXTERNAL PORTS
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MISO_I_0];
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MOSI_O_0];
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SCLK_O_0];
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SS_O_0];
set_property PACKAGE_PIN J16 [get_ports SPI0_MISO_I_0];
set_property PACKAGE_PIN V10 [get_ports SPI0_MOSI_O_0];
set_property PACKAGE_PIN V5 [get_ports SPI0_SCLK_O_0];
set_property PACKAGE_PIN K16 [get_ports SPI0_SS_O_0];

#SPI0 for LTC6813
#set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io1_io];
#set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_io0_io];
#set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_sck_io];
#set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_ss_io];
#set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_ss1_o];
#set_property IOSTANDARD LVCMOS33 [get_ports SPI_0_ss2_o];
#set_property PACKAGE_PIN J16 [get_ports SPI_0_io1_io];
#set_property PACKAGE_PIN V10 [get_ports SPI_0_io0_io];
#set_property PACKAGE_PIN V5 [get_ports SPI_0_sck_io];
#set_property PACKAGE_PIN K16 [get_ports SPI_0_ss_io];

#THESE TWO MUST BE TIED TO SOMETHING SO I CHOSE UNUSED PORTS.
#FEEL FREE TO CHOOSE OTHER UNUSED PORTS IF YOU NEED THESE.
#set_property PACKAGE_PIN H15 [get_ports SPI_0_ss1_o];
#set_property PACKAGE_PIN V11 [get_ports SPI_0_ss2_o];

#PL_LEDS ON MASTER PCB
set_property IOSTANDARD LVCMOS33 [get_ports {pl_leds_o[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports {pl_leds_o[1]}];
set_property IOSTANDARD LVCMOS33 [get_ports {pl_leds_o[2]}];
set_property PACKAGE_PIN W10 [get_ports {pl_leds_o[0]}]; #PL_LED1
set_property PACKAGE_PIN W9  [get_ports {pl_leds_o[1]}]; #PL_LED2
set_property PACKAGE_PIN W11 [get_ports {pl_leds_o[2]}]; #PL_LED3

#RELAYS
set_property IOSTANDARD LVCMOS33 [get_ports {relay_i[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_i[1]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_i[2]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_i[3]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_i[4]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_i[5]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_o[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_o[1]}];
set_property IOSTANDARD LVCMOS33 [get_ports {relay_o[2]}];
set_property PACKAGE_PIN V18 [get_ports {relay_i[0]}]; #Precharge_AUX_Zynq
set_property PACKAGE_PIN N17 [get_ports {relay_i[1]}]; #AIR+_AUX_Zynq
set_property PACKAGE_PIN P18 [get_ports {relay_i[2]}]; #AIR-_AUX_Zynq
set_property PACKAGE_PIN V7  [get_ports {relay_i[3]}]; #TS_Indicator_Zynq
set_property PACKAGE_PIN V8  [get_ports {relay_i[4]}]; #TSAL_Acc_TS_On_Zynq
set_property PACKAGE_PIN W8  [get_ports {relay_i[5]}]; #TSAL_Relay_Detection_Zynq
set_property PACKAGE_PIN V17 [get_ports {relay_o[0]}]; #Precharge_Control
set_property PACKAGE_PIN R17 [get_ports {relay_o[1]}]; #AIR+_Control
set_property PACKAGE_PIN R16 [get_ports {relay_o[2]}]; #AIR-_Control

#SHUTDOWN CIRCUIT
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[1]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[2]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[3]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[4]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[5]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[6]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[7]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_i[8]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_o[0]}];
set_property IOSTANDARD LVCMOS33 [get_ports {shutdown_o[1]}];
set_property PACKAGE_PIN Y16 [get_ports {shutdown_i[0]}]; #IMD_Status_Zynq
set_property PACKAGE_PIN T15 [get_ports {shutdown_i[1]}]; #IMD_Latched_Zynq
set_property PACKAGE_PIN Y17 [get_ports {shutdown_i[2]}]; #IMD_Data_Zynq
set_property PACKAGE_PIN T14 [get_ports {shutdown_i[3]}]; #AMS_Latched_Zynq
set_property PACKAGE_PIN U20 [get_ports {shutdown_i[4]}]; #SC_IN_Zynq
set_property PACKAGE_PIN T20 [get_ports {shutdown_i[5]}]; #SC_HVDC_IL_Zynq
set_property PACKAGE_PIN P19 [get_ports {shutdown_i[6]}]; #SC_IN_Again_Zynq
set_property PACKAGE_PIN N18 [get_ports {shutdown_i[7]}]; #SC_END_Zynq
set_property PACKAGE_PIN U17 [get_ports {shutdown_i[8]}]; #Latch_Reset_Zynq
set_property PACKAGE_PIN U14 [get_ports {shutdown_o[0]}]; #AMS_SC_Control
set_property PACKAGE_PIN U15 [get_ports {shutdown_o[1]}]; #EN_SC_Control

#I2C 0 TO DAC
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_scl_io];
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_sda_io];
set_property PACKAGE_PIN Y7 [get_ports IIC_0_scl_io];
set_property PACKAGE_PIN Y6 [get_ports IIC_0_sda_io];

#I2C 1 TO AMBIENT TEMP
set_property IOSTANDARD LVCMOS33 [get_ports IIC_1_scl_io];
set_property IOSTANDARD LVCMOS33 [get_ports IIC_1_sda_io];
set_property PACKAGE_PIN Y18 [get_ports IIC_1_scl_io];
set_property PACKAGE_PIN Y19 [get_ports IIC_1_sda_io];

#CAN IS NOW IN MIO

#CAN 0 TO CAR CAN NETWORK
#set_property IOSTANDARD LVCMOS33 [get_ports CAN_0_tx];
#set_property IOSTANDARD LVCMOS33 [get_ports CAN_0_rx];
#set_property PACKAGE_PIN W10 [get_ports CAN_0_tx];
#set_property PACKAGE_PIN W9 [get_ports CAN_0_rx];

#CAN 0 TO CAR CAN NETWORK
#set_property IOSTANDARD LVCMOS33 [get_ports CAN0_PHY_TX_0];
#set_property IOSTANDARD LVCMOS33 [get_ports CAN0_PHY_RX_0];
#set_property PACKAGE_PIN W10 [get_ports CAN0_PHY_TX_0];
#set_property PACKAGE_PIN W9 [get_ports CAN0_PHY_RX_0];

#CAN 1 TO SHUNT
#set_property IOSTANDARD LVCMOS33 [get_ports CAN_1_tx];
#set_property IOSTANDARD LVCMOS33 [get_ports CAN_1_rx];
#set_property PACKAGE_PIN Y12 [get_ports CAN_1_tx];
#set_property PACKAGE_PIN Y13 [get_ports CAN_1_rx];

#CAN 1 TO SHUNT
#set_property IOSTANDARD LVCMOS33 [get_ports CAN1_PHY_TX_0];
#set_property IOSTANDARD LVCMOS33 [get_ports CAN1_PHY_RX_0];
#set_property PACKAGE_PIN Y12 [get_ports CAN1_PHY_TX_0];
#set_property PACKAGE_PIN Y13 [get_ports CAN1_PHY_RX_0];
