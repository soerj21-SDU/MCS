
# UART pins
set_property PACKAGE_PIN T11 [get_ports UART0_CTSN]
set_property IOSTANDARD LVCMOS33 [get_ports UART0_CTSN]
set_property PACKAGE_PIN T10 [get_ports UART0_RTSN]
set_property IOSTANDARD LVCMOS33 [get_ports UART0_RTSN]
set_property PACKAGE_PIN T12 [get_ports UART0_RX]
set_property IOSTANDARD LVCMOS33 [get_ports UART0_RX]
set_property PACKAGE_PIN U12 [get_ports UART0_TX]
set_property IOSTANDARD LVCMOS33 [get_ports UART0_TX]

# CAN pins
set_property PACKAGE_PIN V13 [get_ports CAN_0_rx]
set_property IOSTANDARD LVCMOS33 [get_ports CAN_0_rx]
set_property PACKAGE_PIN U13 [get_ports CAN_0_tx]
set_property IOSTANDARD LVCMOS33 [get_ports CAN_0_tx]
set_property PACKAGE_PIN T15 [get_ports CAN_1_rx]
set_property IOSTANDARD LVCMOS33 [get_ports CAN_1_rx]
set_property PACKAGE_PIN T14 [get_ports CAN_1_tx]
set_property IOSTANDARD LVCMOS33 [get_ports CAN_1_tx]

# set_property PACKAGE_PIN V10 [get_ports {nvsram_hsb_tri_i[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {nvsram_hsb_tri_i[0]}]
set_property PACKAGE_PIN W6 [get_ports SPI0_MISO_I]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MISO_I]
set_property PACKAGE_PIN V6 [get_ports SPI0_MOSI_O]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MOSI_O]
set_property PACKAGE_PIN Y13 [get_ports SPI0_SCLK_O]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SCLK_O]
set_property PACKAGE_PIN Y12 [get_ports SPI0_SS_O]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SS_O]

# ProFET control for LV distribution
# set_property PACKAGE_PIN K18 [get_ports {gpio_fet_poe_tri_o[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_fet_poe_tri_o[0]}]


# xADC Pins
set_property PACKAGE_PIN B20 [get_ports Vaux0_BP1_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux0_BP1_v_n]
set_property PACKAGE_PIN C20 [get_ports Vaux0_BP1_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux0_BP1_v_p]

set_property PACKAGE_PIN M20 [get_ports Vaux1_NetINV34C_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux1_NetINV34C_v_n]
set_property PACKAGE_PIN M19 [get_ports Vaux1_NetINV34C_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux1_NetINV34C_v_p]

set_property PACKAGE_PIN D18 [get_ports Vaux2_TP0_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux2_TP0_v_n]
set_property PACKAGE_PIN E17 [get_ports Vaux2_TP0_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux2_TP0_v_p]

set_property PACKAGE_PIN L20 [get_ports Vaux3_SW_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux3_SW_v_n]
set_property PACKAGE_PIN L19 [get_ports Vaux3_SW_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux3_SW_v_p]

set_property PACKAGE_PIN H18 [get_ports Vaux4_DASHAMSC_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux4_DASHAMSC_v_n]
set_property PACKAGE_PIN J18 [get_ports Vaux4_DASHAMSC_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux4_DASHAMSC_v_p]

set_property PACKAGE_PIN H20 [get_ports Vaux5_LVSV_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux5_LVSV_v_n]
set_property PACKAGE_PIN J20 [get_ports Vaux5_LVSV_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux5_LVSV_v_p]

set_property PACKAGE_PIN J14 [get_ports Vaux6_BrakeC_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux6_BrakeC_v_n]
set_property PACKAGE_PIN K14 [get_ports Vaux6_BrakeC_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux6_BrakeC_v_p]

set_property PACKAGE_PIN L15 [get_ports Vaux7_PoEC_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux7_PoEC_v_n]
set_property PACKAGE_PIN L14 [get_ports Vaux7_PoEC_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux7_PoEC_v_p]

set_property PACKAGE_PIN A20 [get_ports Vaux8_BP0_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux8_BP0_v_n]
set_property PACKAGE_PIN B19 [get_ports Vaux8_BP0_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux8_BP0_v_p]

set_property PACKAGE_PIN E19 [get_ports Vaux9_TP1_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux9_TP1_v_n]
set_property PACKAGE_PIN E18 [get_ports Vaux9_TP1_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux9_TP1_v_p]

set_property PACKAGE_PIN M18 [get_ports Vaux10_TSCINV12C_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux10_TSCINV12C_v_n]
set_property PACKAGE_PIN M17 [get_ports Vaux10_TSCINV12C_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux10_TSCINV12C_v_p]

set_property PACKAGE_PIN J19 [get_ports Vaux11_RTDSC_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux11_RTDSC_v_n]
set_property PACKAGE_PIN K19 [get_ports Vaux11_RTDSC_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux11_RTDSC_v_p]

set_property PACKAGE_PIN F20 [get_ports Vaux12_CoolC_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux12_CoolC_v_n]
set_property PACKAGE_PIN F19 [get_ports Vaux12_CoolC_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux12_CoolC_v_p]

set_property PACKAGE_PIN G20 [get_ports Vaux13_LVSC_v_n]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux13_LVSC_v_n]
set_property PACKAGE_PIN G19 [get_ports Vaux13_LVSC_v_p]
set_property IOSTANDARD LVCMOS18 [get_ports Vaux13_LVSC_v_p]

# NEEDS TO BE ADDED TO PCB! Modify pins!
# set_property PACKAGE_PIN G15 [get_ports BSPD_I]
# set_property IOSTANDARD LVCMOS33 [get_ports BSPD_I]
# set_property PACKAGE_PIN M15 [get_ports HVD_I]
# set_property IOSTANDARD LVCMOS33 [get_ports HVD_I]
# set_property PACKAGE_PIN M14 [get_ports TSMP_I]
# set_property IOSTANDARD LVCMOS33 [get_ports TSMP_I]


# set_property PACKAGE_PIN G18 [get_ports {gpio_pl_sc_tri_i[10]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[10]}]
# set_property PACKAGE_PIN G17 [get_ports {gpio_pl_sc_tri_i[9]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[9]}]
# set_property PACKAGE_PIN H16 [get_ports {gpio_pl_sc_tri_i[8]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[8]}]
# set_property PACKAGE_PIN H17 [get_ports {gpio_pl_sc_tri_i[7]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[7]}]
# set_property PACKAGE_PIN H15 [get_ports {gpio_pl_sc_tri_i[6]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[6]}]
# set_property PACKAGE_PIN G15 [get_ports {gpio_pl_sc_tri_i[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[5]}]
# set_property PACKAGE_PIN M15 [get_ports {gpio_pl_sc_tri_i[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[4]}]
# set_property PACKAGE_PIN M14 [get_ports {gpio_pl_sc_tri_i[3]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[3]}]
# set_property PACKAGE_PIN K16 [get_ports {gpio_pl_sc_tri_i[2]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[2]}]
# set_property PACKAGE_PIN J16 [get_ports {gpio_pl_sc_tri_i[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[1]}]
# set_property PACKAGE_PIN V11 [get_ports {gpio_pl_sc_tri_i[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {gpio_pl_sc_tri_i[0]}]

# Indicator LEDs
set_property PACKAGE_PIN T5 [get_ports {PL_ALIVE_LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PL_ALIVE_LED[0]}]


# set_property PACKAGE_PIN U5 [get_ports PL_USER_LED]
# set_property IOSTANDARD LVCMOS33 [get_ports PL_USER_LED]

# set_property PACKAGE_PIN U5 [get_ports {PL_USER_LED_tri_o[0]}];  # "U5.BANK13_LVDS_3_N"
# set_property IOSTANDARD LVCMOS33 [get_ports {PL_USER_LED_tri_o[0]}];


# set_property PACKAGE_PIN B20 [get_ports Vaux0_v_n]

# set_property IOSTANDARD LVCMOS33 [get_ports PL_ALIVE_LED]
# set_property IOSTANDARD LVCMOS33 [get_ports PL_USER_LED]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux0_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux0_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux1_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux1_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux2_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux2_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux3_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux3_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux4_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux4_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux5_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux5_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux6_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux6_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux7_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux7_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux8_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux8_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux9_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux9_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux10_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux10_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux11_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux11_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux12_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux12_v_p]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux13_v_n]
# set_property IOSTANDARD LVCMOS33 [get_ports Vaux13_v_p]
