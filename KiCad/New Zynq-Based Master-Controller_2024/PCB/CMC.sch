EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 17
Title "Zynq-Based Master Controller"
Date "2020-10-14"
Rev "1.0"
Comp "JFH & SRM"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Vikings_connectors:MolexCMC_643330100 J601
U 2 1 5F771F3C
P 5900 3250
F 0 "J601" H 6128 2460 60  0000 L CNN
F 1 "MolexCMC_643330100" H 6128 2354 60  0000 L CNN
F 2 "Vikings_connectors:Molex_CMC_643330100_32+48+32pin" H 6000 1250 60  0001 C CNN
F 3 "https://www.molex.com/molex/products/datasheet.jsp;jsessionid=1zTEUM-rhXL3iVCZ02GIuzBxWo32a1tNvQ98evBT.molex1?part=active/0643330100_PCB_HEADERS.xml" H 6000 1250 60  0001 C CNN
	2    5900 3250
	1    0    0    -1  
$EndComp
$Comp
L Vikings_connectors:MolexCMC_643330100 J601
U 3 1 5F7735A3
P 8800 3900
F 0 "J601" H 9028 3910 60  0000 L CNN
F 1 "MolexCMC_643330100" H 9028 3804 60  0000 L CNN
F 2 "Vikings_connectors:Molex_CMC_643330100_32+48+32pin" H 8900 1900 60  0001 C CNN
F 3 "https://www.molex.com/molex/products/datasheet.jsp;jsessionid=1zTEUM-rhXL3iVCZ02GIuzBxWo32a1tNvQ98evBT.molex1?part=active/0643330100_PCB_HEADERS.xml" H 8900 1900 60  0001 C CNN
	3    8800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4600 2470 4600
Wire Wire Line
	2550 4700 2470 4700
Wire Wire Line
	2190 5050 2220 5050
$Comp
L Device:Fuse_Small F601
U 1 1 5FA27D4E
P 2400 5000
F 0 "F601" H 2430 5050 50  0000 C CNN
F 1 "10A" H 2400 5000 33  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 2400 5000 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 2400 5000 50  0001 C CNN
F 4 "Littelfuse" H 2400 5000 50  0001 C CNN "Manufacturer"
F 5 "0157010.DR" H 2400 5000 50  0001 C CNN "Man. Part No."
	1    2400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5100 2500 5100
Wire Wire Line
	2550 5000 2500 5000
Wire Wire Line
	2300 5100 2220 5100
Connection ~ 2220 5050
Wire Wire Line
	2300 5000 2220 5000
Wire Wire Line
	2220 5000 2220 5050
$Comp
L Device:Fuse_Small F602
U 1 1 5FA305C8
P 2400 5100
F 0 "F602" H 2440 5160 50  0000 C CNN
F 1 "10A" H 2400 5100 33  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 2400 5100 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 2400 5100 50  0001 C CNN
F 4 "Littelfuse" H 2400 5100 50  0001 C CNN "Manufacturer"
F 5 "0157010.DR" H 2400 5100 50  0001 C CNN "Man. Part No."
	1    2400 5100
	1    0    0    1   
$EndComp
Wire Wire Line
	2550 4400 2470 4400
Wire Wire Line
	2550 4500 2470 4500
Wire Wire Line
	5350 3500 5270 3500
Wire Wire Line
	5270 3500 5270 3450
Wire Wire Line
	5270 3400 5350 3400
Wire Wire Line
	5270 3450 5200 3450
Connection ~ 5270 3450
Wire Wire Line
	5270 3450 5270 3400
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0290
U 1 1 5FA3779C
P 5200 3450
F 0 "#PWR0290" H 5200 3200 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 5200 3350 50  0000 R CNN
F 2 "" H 5200 3450 50  0001 C CNN
F 3 "" H 5200 3450 50  0001 C CNN
	1    5200 3450
	0    1    -1   0   
$EndComp
Wire Wire Line
	5350 3100 5270 3100
Wire Wire Line
	5270 3100 5270 3050
Wire Wire Line
	5270 3000 5350 3000
Wire Wire Line
	5270 3050 5200 3050
Connection ~ 5270 3050
Wire Wire Line
	5270 3050 5270 3000
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0291
U 1 1 5FA3838A
P 5200 3050
F 0 "#PWR0291" H 5200 2800 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 5200 2950 50  0000 R CNN
F 2 "" H 5200 3050 50  0001 C CNN
F 3 "" H 5200 3050 50  0001 C CNN
	1    5200 3050
	0    1    -1   0   
$EndComp
Wire Wire Line
	5350 2700 5270 2700
Wire Wire Line
	5270 2700 5270 2650
Wire Wire Line
	5270 2600 5350 2600
Wire Wire Line
	5270 2650 5200 2650
Connection ~ 5270 2650
Wire Wire Line
	5270 2650 5270 2600
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0292
U 1 1 5FA39016
P 5200 2650
F 0 "#PWR0292" H 5200 2400 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 5200 2550 50  0000 R CNN
F 2 "" H 5200 2650 50  0001 C CNN
F 3 "" H 5200 2650 50  0001 C CNN
	1    5200 2650
	0    1    -1   0   
$EndComp
Wire Wire Line
	5350 2300 5270 2300
Wire Wire Line
	5270 2300 5270 2250
Wire Wire Line
	5270 2200 5350 2200
Wire Wire Line
	5270 2250 5200 2250
Connection ~ 5270 2250
Wire Wire Line
	5270 2250 5270 2200
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0293
U 1 1 5FA39AA3
P 5200 2250
F 0 "#PWR0293" H 5200 2000 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 5200 2150 50  0000 R CNN
F 2 "" H 5200 2250 50  0001 C CNN
F 3 "" H 5200 2250 50  0001 C CNN
	1    5200 2250
	0    1    -1   0   
$EndComp
Wire Wire Line
	5350 3600 5260 3600
Text HLabel 5260 3600 0    50   Input ~ 0
BrakeLight_Supply
Wire Wire Line
	5350 2400 5270 2400
Text HLabel 5270 2400 0    50   Input ~ 0
RTDS_Supply
Wire Wire Line
	5350 2100 5270 2100
Text HLabel 5270 2100 0    50   Input ~ 0
SensorNet_Supply
Wire Wire Line
	5350 2500 5270 2500
Text HLabel 5270 2500 0    50   Input ~ 0
INV34_Supply
Wire Wire Line
	5350 3300 5270 3300
Text HLabel 5270 3300 0    50   Input ~ 0
INV12_Supply
Wire Wire Line
	5350 2000 5270 2000
Text HLabel 5270 2000 0    50   Input ~ 0
Dashboard_Supply
Wire Wire Line
	5350 2900 5270 2900
Text HLabel 5270 2900 0    50   Input ~ 0
TSC_Supply
Wire Wire Line
	5350 2800 5270 2800
Text HLabel 5270 2800 0    50   Input ~ 0
Cooling_Supply
Wire Wire Line
	5350 3200 5270 3200
Text HLabel 5270 3200 0    50   Input ~ 0
Cooling_Supply
Wire Wire Line
	5350 1700 5270 1700
Text HLabel 5270 1700 0    50   Input ~ 0
AMS_Supply
Wire Wire Line
	5350 1900 5270 1900
Wire Wire Line
	5270 1900 5270 1850
Wire Wire Line
	5350 1800 5270 1800
Wire Wire Line
	5270 1850 5200 1850
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0294
U 1 1 5FA4A49F
P 5200 1850
F 0 "#PWR0294" H 5200 1600 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 5200 1750 50  0000 R CNN
F 2 "" H 5200 1850 50  0001 C CNN
F 3 "" H 5200 1850 50  0001 C CNN
	1    5200 1850
	0    1    -1   0   
$EndComp
Wire Wire Line
	2550 4900 2310 4900
Text HLabel 2310 4900 0    50   Input ~ 0
Cooling_Supply
Wire Wire Line
	2550 4800 2310 4800
Text HLabel 2310 4800 0    50   Input ~ 0
Cooling_Supply
Wire Wire Line
	2550 2500 2460 2500
Text HLabel 2460 2500 0    50   Output ~ 0
SC0_I
Wire Wire Line
	2550 2400 2460 2400
Text HLabel 2460 2400 0    50   Input ~ 0
SC1_O
Wire Wire Line
	2550 2300 2460 2300
Text HLabel 2460 2300 0    50   Output ~ 0
SC1_I
Wire Wire Line
	2550 2200 2460 2200
Text HLabel 2460 2200 0    50   Input ~ 0
SC2_O
Wire Wire Line
	2550 2600 2460 2600
Text HLabel 2460 2600 0    50   Output ~ 0
SC2_I
Wire Wire Line
	2550 2700 2460 2700
Text HLabel 2460 2700 0    50   Input ~ 0
SC3_O
Wire Wire Line
	2550 2800 2460 2800
Text HLabel 2460 2800 0    50   Output ~ 0
SC3_I
Wire Wire Line
	2550 2900 2460 2900
Text HLabel 2460 2900 0    50   Input ~ 0
SC4_O
Wire Wire Line
	2550 3400 2460 3400
Text HLabel 2460 3400 0    50   Output ~ 0
SC6_I
Wire Wire Line
	2550 3500 2460 3500
Text HLabel 2460 3500 0    50   Input ~ 0
SC7_O
Wire Wire Line
	2550 3600 2460 3600
Text HLabel 2460 3600 0    50   Output ~ 0
SC7_I
Wire Wire Line
	2550 3700 2460 3700
Text HLabel 2460 3700 0    50   Input ~ 0
SC8_O
Wire Wire Line
	2550 4100 2460 4100
Text HLabel 2460 4100 0    50   Output ~ 0
SC8_I
Wire Wire Line
	2550 4000 2460 4000
Text HLabel 2460 4000 0    50   Input ~ 0
SC9_O
Wire Wire Line
	2550 3900 2460 3900
Text HLabel 2460 3900 0    50   Output ~ 0
SC9_I
Wire Wire Line
	2550 3800 2460 3800
Text HLabel 2460 3800 0    50   Input ~ 0
SC10_O
Wire Wire Line
	2550 4200 2460 4200
Text HLabel 2460 4200 0    50   Output ~ 0
SC10_I
Text HLabel 5260 6000 0    50   BiDi ~ 0
EXP_1
Text HLabel 5260 5500 0    50   BiDi ~ 0
EXP_2
Wire Wire Line
	5350 3700 5260 3700
Text HLabel 5260 5600 0    50   BiDi ~ 0
EXP_3
Wire Wire Line
	5350 4200 5260 4200
Text HLabel 5260 5900 0    50   BiDi ~ 0
EXP_4
Wire Wire Line
	5350 4100 5260 4100
Text HLabel 5260 5200 0    50   BiDi ~ 0
EXP_5
Wire Wire Line
	5350 4300 5260 4300
Text HLabel 5260 5100 0    50   BiDi ~ 0
EXP_6
Wire Wire Line
	5350 4400 5260 4400
Text HLabel 5260 4800 0    50   BiDi ~ 0
EXP_7
Wire Wire Line
	5350 4500 5260 4500
Text HLabel 5260 4700 0    50   BiDi ~ 0
EXP_8
Wire Wire Line
	5350 6100 5260 6100
Text HLabel 5260 5000 0    50   BiDi ~ 0
EXP_9
Wire Wire Line
	5350 4900 5260 4900
Text HLabel 5260 5800 0    50   BiDi ~ 0
EXP_10
Wire Wire Line
	5350 5700 5260 5700
Text HLabel 5260 4600 0    50   BiDi ~ 0
EXP_11
Wire Wire Line
	5350 5300 5260 5300
Text HLabel 5260 5400 0    50   BiDi ~ 0
EXP_12
Wire Wire Line
	5350 5000 5260 5000
Text HLabel 5260 5300 0    50   BiDi ~ 0
EXP_13
Wire Wire Line
	5350 4600 5260 4600
Text HLabel 5260 5700 0    50   BiDi ~ 0
EXP_14
Wire Wire Line
	5350 5400 5260 5400
Text HLabel 5260 4900 0    50   BiDi ~ 0
EXP_15
Wire Wire Line
	5350 5800 5260 5800
Text HLabel 5260 6100 0    50   BiDi ~ 0
EXP_16
Wire Wire Line
	5350 4700 5260 4700
Text HLabel 5260 4500 0    50   BiDi ~ 0
EXP_17
Wire Wire Line
	5350 4800 5260 4800
Text HLabel 5260 4400 0    50   BiDi ~ 0
EXP_18
Wire Wire Line
	5350 5100 5260 5100
Text HLabel 5260 4300 0    50   BiDi ~ 0
EXP_19
Wire Wire Line
	5350 5200 5260 5200
Text HLabel 5260 4100 0    50   BiDi ~ 0
EXP_20
Wire Wire Line
	5350 5500 5260 5500
Text HLabel 5260 4200 0    50   BiDi ~ 0
EXP_21
Wire Wire Line
	5350 5600 5260 5600
Text HLabel 5260 3700 0    50   BiDi ~ 0
EXP_22
Wire Wire Line
	5350 5900 5260 5900
Wire Wire Line
	5350 6000 5260 6000
Wire Wire Line
	5350 6200 5260 6200
Text HLabel 5260 6200 0    50   Input ~ 0
SW_Supply
Wire Wire Line
	5350 6300 5260 6300
Text HLabel 5260 6300 0    50   Output ~ 0
SW_Sig
Wire Wire Line
	5350 6400 5260 6400
Text HLabel 5260 6400 0    50   Input ~ 0
SW_Ground
Wire Wire Line
	8250 2350 8160 2350
Text HLabel 8160 2350 0    50   Input ~ 0
TP0_Supply
Wire Wire Line
	8250 2450 8160 2450
Text HLabel 8160 2450 0    50   Input ~ 0
TP0_Ground
Wire Wire Line
	8250 2550 8160 2550
Text HLabel 8160 2650 0    50   Input ~ 0
TP1_Supply
Wire Wire Line
	8250 2650 8160 2650
Wire Wire Line
	8250 2750 8160 2750
Text HLabel 8160 2750 0    50   Output ~ 0
TP0_Sig
Wire Wire Line
	8250 2850 8160 2850
Text HLabel 8160 2850 0    50   Output ~ 0
TP1_Sig
Wire Wire Line
	8250 2950 8160 2950
Text HLabel 8160 2950 0    50   Input ~ 0
BP0_Ground
Wire Wire Line
	8250 3050 8160 3050
Text HLabel 8160 3050 0    50   Input ~ 0
BP0_Supply
Text HLabel 8160 2550 0    50   Input ~ 0
TP1_Ground
Wire Wire Line
	8250 3350 8160 3350
Text HLabel 8160 3350 0    50   Input ~ 0
BP1_Ground
Wire Wire Line
	8250 3450 8160 3450
Text HLabel 8160 3450 0    50   Input ~ 0
BP1_Supply
Wire Wire Line
	8250 3150 8160 3150
Text HLabel 8160 3150 0    50   Output ~ 0
BP0_Sig
Wire Wire Line
	8250 3250 8160 3250
Text HLabel 8160 3250 0    50   Output ~ 0
BP1_Sig
Wire Wire Line
	8250 3850 8160 3850
Text HLabel 8160 3850 0    50   Input ~ 0
INS_Ground
Wire Wire Line
	8250 3550 8160 3550
Text HLabel 8160 3550 0    50   Input ~ 0
INS_RS232TX
Wire Wire Line
	8250 3650 8160 3650
Text HLabel 8160 3650 0    50   Output ~ 0
INS_PPS
Wire Wire Line
	8250 3750 8160 3750
Text HLabel 8160 3750 0    50   Input ~ 0
INS_RESTORE
Wire Wire Line
	8250 4250 8160 4250
Text HLabel 8160 4250 0    50   Input ~ 0
INS_SUPPLY
Wire Wire Line
	8250 3950 8160 3950
Text HLabel 8160 3950 0    50   Output ~ 0
INS_RS232RX
Wire Wire Line
	8250 4050 8160 4050
Text HLabel 8160 4050 0    50   Output ~ 0
INS_SYNC_I
Wire Wire Line
	8250 4150 8160 4150
Text HLabel 8160 4150 0    50   Input ~ 0
INS_SYNC_O
Wire Wire Line
	8250 4550 8200 4550
Wire Wire Line
	8200 4550 8200 4600
Wire Wire Line
	8200 4650 8250 4650
Wire Wire Line
	8250 4350 8200 4350
Wire Wire Line
	8200 4350 8200 4400
Wire Wire Line
	8200 4450 8250 4450
Text HLabel 8150 4600 0    50   BiDi ~ 0
CANBUS1_H
Wire Wire Line
	8150 4600 8200 4600
Connection ~ 8200 4600
Wire Wire Line
	8200 4600 8200 4650
Text HLabel 8150 4400 0    50   BiDi ~ 0
CANBUS1_L
Wire Wire Line
	8150 4400 8200 4400
Connection ~ 8200 4400
Wire Wire Line
	8200 4400 8200 4450
Wire Wire Line
	8250 5150 8200 5150
Wire Wire Line
	8200 5150 8200 5200
Wire Wire Line
	8200 5250 8250 5250
Text HLabel 8150 5200 0    50   BiDi ~ 0
CANBUS0_H
Wire Wire Line
	8150 5200 8200 5200
Connection ~ 8200 5200
Wire Wire Line
	8200 5200 8200 5250
Wire Wire Line
	8250 4750 8200 4750
Wire Wire Line
	8200 4750 8200 4800
Wire Wire Line
	8200 4850 8250 4850
Text HLabel 8150 4800 0    50   BiDi ~ 0
CANBUS0_L
Wire Wire Line
	8150 4800 8200 4800
Connection ~ 8200 4800
Wire Wire Line
	8200 4800 8200 4850
Wire Wire Line
	8250 4950 8200 4950
Wire Wire Line
	8200 4950 8200 5000
Wire Wire Line
	8200 5050 8250 5050
Wire Wire Line
	8150 5000 8200 5000
Connection ~ 8200 5000
Wire Wire Line
	8200 5000 8200 5050
Wire Wire Line
	8250 5350 8200 5350
Wire Wire Line
	8200 5350 8200 5400
Wire Wire Line
	8200 5450 8250 5450
Wire Wire Line
	8150 5400 8200 5400
Connection ~ 8200 5400
Wire Wire Line
	8200 5400 8200 5450
$Comp
L power:GND #PWR0295
U 1 1 5FBA33F5
P 8150 5000
F 0 "#PWR0295" H 8150 4750 50  0001 C CNN
F 1 "GND" V 8155 4872 50  0000 R CNN
F 2 "" H 8150 5000 50  0001 C CNN
F 3 "" H 8150 5000 50  0001 C CNN
	1    8150 5000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0296
U 1 1 5FBA361E
P 8150 5400
F 0 "#PWR0296" H 8150 5150 50  0001 C CNN
F 1 "GND" V 8155 5272 50  0000 R CNN
F 2 "" H 8150 5400 50  0001 C CNN
F 3 "" H 8150 5400 50  0001 C CNN
	1    8150 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	2220 5050 2220 5100
Wire Wire Line
	2550 5200 2390 5200
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0499
U 1 1 60037AAF
P 2390 5200
F 0 "#PWR0499" H 2390 4950 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 2390 5100 50  0000 R CNN
F 2 "" H 2390 5200 50  0001 C CNN
F 3 "" H 2390 5200 50  0001 C CNN
	1    2390 5200
	0    1    1    0   
$EndComp
$Comp
L Vikings_misc:LV_Unfiltered #PWR0287
U 1 1 5FA827EE
P 2190 5050
F 0 "#PWR0287" H 2190 4850 50  0001 C CNN
F 1 "LV_Unfiltered" V 2205 5178 50  0000 L CNN
F 2 "" H 2190 5100 50  0001 C CNN
F 3 "" H 2190 5100 50  0001 C CNN
	1    2190 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 3300 2460 3300
Text HLabel 2460 3300 0    50   Output ~ 0
SC4_I
Wire Wire Line
	2550 3200 2460 3200
Text HLabel 2460 3200 0    50   Input ~ 0
SC5_O
Wire Wire Line
	2550 3100 2460 3100
Text HLabel 2460 3100 0    50   Output ~ 0
SC5_I
Wire Wire Line
	2550 3000 2460 3000
Text HLabel 2460 3000 0    50   Input ~ 0
SC6_O
Wire Wire Line
	2470 4400 2470 4500
Wire Wire Line
	2470 4600 2470 4700
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0289
U 1 1 5FA34708
P 2420 4500
F 0 "#PWR0289" H 2420 4250 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 2420 4400 50  0000 R CNN
F 2 "" H 2420 4500 50  0001 C CNN
F 3 "" H 2420 4500 50  0001 C CNN
	1    2420 4500
	0    1    1    0   
$EndComp
Connection ~ 5270 1850
Wire Wire Line
	5270 1850 5270 1800
Wire Wire Line
	2470 4400 2470 4300
Wire Wire Line
	2470 4300 2550 4300
Connection ~ 2470 4400
Wire Wire Line
	2470 4600 2470 4500
Connection ~ 2470 4600
Connection ~ 2470 4500
Wire Wire Line
	2420 4500 2470 4500
Wire Wire Line
	5350 4000 5280 4000
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0288
U 1 1 5FBC81A0
P 5280 3900
F 0 "#PWR0288" H 5280 3650 50  0001 C CNN
F 1 "GND-LV_Unfiltered" V 5280 3800 50  0000 R CNN
F 2 "" H 5280 3900 50  0001 C CNN
F 3 "" H 5280 3900 50  0001 C CNN
	1    5280 3900
	0    1    -1   0   
$EndComp
Wire Wire Line
	5280 4000 5280 3900
Wire Wire Line
	5280 3800 5350 3800
Wire Wire Line
	5350 3900 5280 3900
Connection ~ 5280 3900
Wire Wire Line
	5280 3900 5280 3800
$Comp
L Vikings_misc:LV_Unfiltered #PWR0348
U 1 1 5FA82D72
P 1710 5300
F 0 "#PWR0348" H 1710 5100 50  0001 C CNN
F 1 "LV_Unfiltered" V 1725 5428 50  0000 L CNN
F 2 "" H 1710 5350 50  0001 C CNN
F 3 "" H 1710 5350 50  0001 C CNN
	1    1710 5300
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse_Small F603
U 1 1 5FA30866
P 2220 5300
F 0 "F603" H 2220 5360 50  0000 C CNN
F 1 "10A" H 2220 5300 33  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 2220 5300 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 2220 5300 50  0001 C CNN
F 4 "Littelfuse" H 2220 5300 50  0001 C CNN "Manufacturer"
F 5 "0157010.DR" H 2220 5300 50  0001 C CNN "Man. Part No."
	1    2220 5300
	1    0    0    1   
$EndComp
Wire Wire Line
	1710 5300 2120 5300
$Comp
L Vikings_connectors:MolexCMC_643330100 J601
U 1 1 5F77018E
P 3100 3750
F 0 "J601" H 3328 3760 60  0000 L CNN
F 1 "MolexCMC_643330100" H 3328 3654 60  0000 L CNN
F 2 "Vikings_connectors:Molex_CMC_643330100_32+48+32pin" H 3200 1750 60  0001 C CNN
F 3 "https://www.molex.com/molex/products/datasheet.jsp;jsessionid=1zTEUM-rhXL3iVCZ02GIuzBxWo32a1tNvQ98evBT.molex1?part=active/0643330100_PCB_HEADERS.xml" H 3200 1750 60  0001 C CNN
	1    3100 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2320 5300 2550 5300
$EndSCHEMATC
