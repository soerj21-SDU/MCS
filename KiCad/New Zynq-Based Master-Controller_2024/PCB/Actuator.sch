EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 17
Title "Zynq-Based Master Controller"
Date "2020-10-14"
Rev "1.0"
Comp "JFH & SRM"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 800  800  0    50   ~ 0
Relay 1: Ready-to-Drive-Sound (max. 8 mA)
Wire Notes Line
	800  800  800  3000
$Comp
L Vikings_actives:BTT6010-1EKB U1301
U 1 1 6041EDFA
P 5350 1150
F 0 "U1301" H 5600 377 50  0000 C CNN
F 1 "BTT6010-1EKB" H 5600 286 50  0000 C CNN
F 2 "Vikings_devices:PG-DSO-14-47" H 5685 1640 50  0001 C CNN
F 3 "https://docs.rs-online.com/1df8/0900766b815790fa.pdf" H 5685 1640 50  0001 C CNN
	1    5350 1150
	1    0    0    -1  
$EndComp
Text HLabel 4690 1500 0    50   Input ~ 0
Zynq_3V3_PS_1
$Comp
L power:+3.3V #PWR?
U 1 1 604279D8
P 4450 1600
AR Path="/5F7F5CD4/604279D8" Ref="#PWR?"  Part="1" 
AR Path="/603DCCC0/604279D8" Ref="#PWR0404"  Part="1" 
F 0 "#PWR0404" H 4450 1450 50  0001 C CNN
F 1 "+3.3V" V 4450 1700 50  0000 L CNN
F 2 "" H 4450 1600 50  0001 C CNN
F 3 "" H 4450 1600 50  0001 C CNN
	1    4450 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 1600 5250 1600
Text Notes 4050 800  0    50   ~ 0
PROFET 4: Cooling System (max. 7 A)
Wire Wire Line
	5950 1400 6000 1400
Wire Wire Line
	6000 1400 6000 1500
Wire Wire Line
	6000 1500 5950 1500
Wire Wire Line
	5950 1600 6000 1600
Wire Wire Line
	6000 1600 6000 1500
Connection ~ 6000 1500
Text HLabel 6480 1500 2    50   Output ~ 0
Cool_V_Out
$Comp
L power:GND #PWR?
U 1 1 6045C16B
P 4850 2800
AR Path="/5F7F5CD4/6045C16B" Ref="#PWR?"  Part="1" 
AR Path="/603DCCC0/6045C16B" Ref="#PWR0405"  Part="1" 
F 0 "#PWR0405" H 4850 2550 50  0001 C CNN
F 1 "GND" H 4850 2650 50  0000 C CNN
F 2 "" H 4850 2800 50  0001 C CNN
F 3 "" H 4850 2800 50  0001 C CNN
	1    4850 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_ALT Z?
U 1 1 6045C171
P 5100 2400
AR Path="/5F7F5CD4/6045C171" Ref="Z?"  Part="1" 
AR Path="/603DCCC0/6045C171" Ref="Z1301"  Part="1" 
F 0 "Z1301" V 5054 2480 50  0000 L CNN
F 1 "MMSZ5V6T3G" V 5145 2480 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 5100 2400 50  0001 C CNN
F 3 "https://docs.rs-online.com/d102/0900766b80dad80e.pdf" H 5100 2400 50  0001 C CNN
	1    5100 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6045C177
P 4850 2200
AR Path="/5F7F5CD4/6045C177" Ref="R?"  Part="1" 
AR Path="/603DCCC0/6045C177" Ref="R1307"  Part="1" 
F 0 "R1307" H 4570 2250 50  0000 L CNN
F 1 "2.37k" H 4600 2150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4780 2200 50  0001 C CNN
F 3 "~" H 4850 2200 50  0001 C CNN
	1    4850 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6045C17D
P 4850 2600
AR Path="/5F7F5CD4/6045C17D" Ref="R?"  Part="1" 
AR Path="/603DCCC0/6045C17D" Ref="R1308"  Part="1" 
F 0 "R1308" H 4570 2650 50  0000 L CNN
F 1 "510" H 4650 2550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4780 2600 50  0001 C CNN
F 3 "~" H 4850 2600 50  0001 C CNN
	1    4850 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2750 4850 2800
Wire Wire Line
	5100 2550 5100 2800
Wire Wire Line
	5100 2800 4850 2800
Connection ~ 4850 2800
Wire Wire Line
	4850 2050 4850 1950
Wire Wire Line
	4850 1950 5100 1950
Wire Wire Line
	5100 1950 5100 2250
Text HLabel 4500 2400 0    50   Output ~ 0
CoolC_V
Wire Wire Line
	4850 2350 4850 2400
Wire Wire Line
	4500 2400 4850 2400
Connection ~ 4850 2400
Wire Wire Line
	4850 2400 4850 2450
Wire Wire Line
	5100 1950 5100 1700
Wire Wire Line
	5100 1700 5250 1700
Connection ~ 5100 1950
Wire Notes Line
	4050 800  4050 3000
Wire Notes Line
	4050 3000 7000 3000
Wire Notes Line
	7000 3000 7000 800 
Wire Notes Line
	4050 800  7000 800 
$Comp
L Vikings_actives:CPC1017NTR K1301
U 1 1 6050F5FA
P 2400 1150
F 0 "K1301" H 2700 1375 50  0000 C CNN
F 1 "CPC1017NTR" H 2700 1284 50  0000 C CNN
F 2 "Vikings_devices:CPC1017N" H 3650 1250 50  0001 L CNN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1017N.pdf/$file/CPC1017N.pdf" H 3650 1150 50  0001 L CNN
F 4 "IXYS SEMICONDUCTOR - CPC1017NTR - IC,Normally-Open PC-Mount Solid-State Relay,1-CHANNEL,SO 09J1947" H 3650 1050 50  0001 L CNN "Description"
F 5 "2.159" H 3650 950 50  0001 L CNN "Height"
F 6 "IXYS SEMICONDUCTOR" H 3650 850 50  0001 L CNN "Manufacturer_Name"
F 7 "CPC1017NTR" H 3650 750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "CPC1017NTR" H 3650 650 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/cpc1017ntr/ixys" H 3650 550 50  0001 L CNN "Arrow Price/Stock"
F 10 "849-CPC1017NTR" H 3650 450 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/IXYS-Integrated-Circuits/CPC1017NTR?qs=h2iAtNzNjMRlYN6IF%252Bl9JA%3D%3D" H 3650 350 50  0001 L CNN "Mouser Price/Stock"
	1    2400 1150
	1    0    0    -1  
$EndComp
Text HLabel 2250 1150 0    50   Input ~ 0
Zynq_1V8_PS_10
$Comp
L Device:R R1302
U 1 1 60515B93
P 2100 1350
F 0 "R1302" V 2200 1350 50  0000 C CNN
F 1 "270" V 2100 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2030 1350 50  0001 C CNN
F 3 "~" H 2100 1350 50  0001 C CNN
	1    2100 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 1350 1800 1350
$Comp
L power:GND #PWR0406
U 1 1 6051648C
P 1800 1400
F 0 "#PWR0406" H 1800 1150 50  0001 C CNN
F 1 "GND" H 1805 1227 50  0000 C CNN
F 2 "" H 1800 1400 50  0001 C CNN
F 3 "" H 1800 1400 50  0001 C CNN
	1    1800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1350 1800 1400
Text Notes 800  5850 0    50   ~ 0
V_F max: 1.4 V\nI_F max: 1 mA\n\nV_R = 1.8 - 1.4 = 0.4 V\nR_min = 0.4 / 0.0015 = 270 R
Wire Wire Line
	2250 1150 2350 1150
Wire Wire Line
	2400 1350 2250 1350
Wire Wire Line
	3000 1150 3300 1150
Wire Wire Line
	3000 1350 3300 1350
$Comp
L Device:R R1304
U 1 1 605205FF
P 3010 1800
F 0 "R1304" V 2910 1800 50  0000 C CNN
F 1 "5.6" V 3010 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2940 1800 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/315/AOA0000C313-1141758.pdf" H 3010 1800 50  0001 C CNN
F 4 "ERJ-3RQF5R6V" H 3010 1800 50  0001 C CNN "Name"
	1    3010 1800
	0    1    1    0   
$EndComp
Text HLabel 1400 1800 0    50   Output ~ 0
RTDS_V_Out
$Comp
L Vikings_actives:TSC2012IDT IC1301
U 1 1 60527086
P 2100 2150
F 0 "IC1301" H 2750 1700 50  0000 R CNN
F 1 "TSC2012IDT" H 2900 1600 50  0000 R CNN
F 2 "Vikings_devices:TSC2012IDT" H 3150 2250 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/389/dm00630955-1799526.pdf" H 3150 2150 50  0001 L CNN
F 4 "Current Sense Amplifiers CONDITIONING & INTERFACES" H 3150 2050 50  0001 L CNN "Description"
F 5 "1.75" H 3150 1950 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 3150 1850 50  0001 L CNN "Manufacturer_Name"
F 7 "TSC2012IDT" H 3150 1750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "TSC2012IDT" H 3150 1650 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/tsc2012idt/stmicroelectronics" H 3150 1550 50  0001 L CNN "Arrow Price/Stock"
F 10 "511-TSC2012IDT" H 3150 1450 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/TSC2012IDT?qs=%252B6g0mu59x7KSqOHhuXDI4w%3D%3D" H 3150 1350 50  0001 L CNN "Mouser Price/Stock"
	1    2100 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1800 3160 1800
Wire Wire Line
	3300 1350 3300 1800
Wire Wire Line
	3300 1800 3300 2150
Connection ~ 3300 1800
Wire Wire Line
	2640 1800 2640 2000
Wire Wire Line
	2640 2000 2100 2000
Wire Wire Line
	2100 2000 2100 2150
Wire Wire Line
	2640 1800 2860 1800
Wire Wire Line
	2100 2250 2000 2250
Wire Wire Line
	2000 2250 2000 2350
Wire Wire Line
	2000 2350 2100 2350
Wire Wire Line
	2100 2450 2000 2450
Wire Wire Line
	2000 2450 2000 2350
Connection ~ 2000 2350
$Comp
L power:GND #PWR0407
U 1 1 605401F4
P 2000 2750
F 0 "#PWR0407" H 2000 2500 50  0001 C CNN
F 1 "GND" H 2000 2600 50  0000 C CNN
F 2 "" H 2000 2750 50  0001 C CNN
F 3 "" H 2000 2750 50  0001 C CNN
	1    2000 2750
	1    0    0    -1  
$EndComp
Connection ~ 2000 2450
Wire Wire Line
	3300 2350 3500 2350
Wire Wire Line
	3500 2350 3500 2550
$Comp
L Device:C C1301
U 1 1 605429C0
P 3500 2200
F 0 "C1301" H 3385 2154 50  0000 R CNN
F 1 "100nF" H 3385 2245 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3538 2050 50  0001 C CNN
F 3 "~" H 3500 2200 50  0001 C CNN
	1    3500 2200
	-1   0    0    1   
$EndComp
Connection ~ 3500 2350
Wire Wire Line
	3300 2250 3400 2250
Wire Wire Line
	3400 2250 3400 2050
Wire Wire Line
	3400 2050 3500 2050
$Comp
L power:GND #PWR0408
U 1 1 6054549E
P 3500 2050
F 0 "#PWR0408" H 3500 1800 50  0001 C CNN
F 1 "GND" H 3505 1877 50  0000 C CNN
F 2 "" H 3500 2050 50  0001 C CNN
F 3 "" H 3500 2050 50  0001 C CNN
	1    3500 2050
	-1   0    0    1   
$EndComp
Connection ~ 3500 2050
Wire Wire Line
	3300 2450 3300 2600
Text HLabel 3300 2600 3    50   Output ~ 0
RTDSC_V
Text Notes 800  3200 0    50   ~ 0
Relay 2: Brake Light (max. 60 mA)
Wire Notes Line
	800  3200 800  5400
$Comp
L Vikings_actives:CPC1017NTR K1302
U 1 1 60558436
P 2400 3500
F 0 "K1302" H 2700 3725 50  0000 C CNN
F 1 "CPC1017NTR" H 2700 3634 50  0000 C CNN
F 2 "Vikings_devices:CPC1017N" H 3650 3600 50  0001 L CNN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1017N.pdf/$file/CPC1017N.pdf" H 3650 3500 50  0001 L CNN
F 4 "IXYS SEMICONDUCTOR - CPC1017NTR - IC,Normally-Open PC-Mount Solid-State Relay,1-CHANNEL,SO 09J1947" H 3650 3400 50  0001 L CNN "Description"
F 5 "2.159" H 3650 3300 50  0001 L CNN "Height"
F 6 "IXYS SEMICONDUCTOR" H 3650 3200 50  0001 L CNN "Manufacturer_Name"
F 7 "CPC1017NTR" H 3650 3100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "CPC1017NTR" H 3650 3000 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/cpc1017ntr/ixys" H 3650 2900 50  0001 L CNN "Arrow Price/Stock"
F 10 "849-CPC1017NTR" H 3650 2800 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/IXYS-Integrated-Circuits/CPC1017NTR?qs=h2iAtNzNjMRlYN6IF%252Bl9JA%3D%3D" H 3650 2700 50  0001 L CNN "Mouser Price/Stock"
	1    2400 3500
	1    0    0    -1  
$EndComp
Text HLabel 2250 3500 0    50   Input ~ 0
Zynq_1V8_PS_11
$Comp
L Device:R R1309
U 1 1 6055843D
P 2100 3700
F 0 "R1309" V 2200 3700 50  0000 C CNN
F 1 "270" V 2100 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2030 3700 50  0001 C CNN
F 3 "~" H 2100 3700 50  0001 C CNN
	1    2100 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 3700 1800 3700
$Comp
L power:GND #PWR0409
U 1 1 60558444
P 1800 3750
F 0 "#PWR0409" H 1800 3500 50  0001 C CNN
F 1 "GND" H 1805 3577 50  0000 C CNN
F 2 "" H 1800 3750 50  0001 C CNN
F 3 "" H 1800 3750 50  0001 C CNN
	1    1800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3700 1800 3750
Wire Wire Line
	2250 3500 2350 3500
Wire Wire Line
	2400 3700 2250 3700
Wire Wire Line
	3000 3500 3300 3500
Wire Wire Line
	3000 3700 3300 3700
Text HLabel 1350 4150 0    50   Output ~ 0
Brake_V_Out
$Comp
L Vikings_actives:TSC2012IDT IC1302
U 1 1 60558465
P 2100 4500
F 0 "IC1302" H 2750 4050 50  0000 R CNN
F 1 "TSC2012IDT" H 2900 3950 50  0000 R CNN
F 2 "Vikings_devices:TSC2012IDT" H 3150 4600 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/389/dm00630955-1799526.pdf" H 3150 4500 50  0001 L CNN
F 4 "Current Sense Amplifiers CONDITIONING & INTERFACES" H 3150 4400 50  0001 L CNN "Description"
F 5 "1.75" H 3150 4300 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 3150 4200 50  0001 L CNN "Manufacturer_Name"
F 7 "TSC2012IDT" H 3150 4100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "TSC2012IDT" H 3150 4000 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/tsc2012idt/stmicroelectronics" H 3150 3900 50  0001 L CNN "Arrow Price/Stock"
F 10 "511-TSC2012IDT" H 3150 3800 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/TSC2012IDT?qs=%252B6g0mu59x7KSqOHhuXDI4w%3D%3D" H 3150 3700 50  0001 L CNN "Mouser Price/Stock"
	1    2100 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4150 3140 4150
Wire Wire Line
	3300 3700 3300 4150
Wire Wire Line
	3300 4150 3300 4500
Connection ~ 3300 4150
Wire Wire Line
	2720 4150 2720 4350
Wire Wire Line
	2720 4350 2100 4350
Wire Wire Line
	2100 4350 2100 4500
Wire Wire Line
	2720 4150 2840 4150
Wire Wire Line
	2100 4600 2000 4600
Wire Wire Line
	2000 4600 2000 4700
Wire Wire Line
	2000 4700 2100 4700
Wire Wire Line
	2100 4800 2000 4800
Wire Wire Line
	2000 4800 2000 4700
Connection ~ 2000 4700
$Comp
L power:GND #PWR0410
U 1 1 6055847B
P 2000 5100
F 0 "#PWR0410" H 2000 4850 50  0001 C CNN
F 1 "GND" H 2000 4960 50  0000 C CNN
F 2 "" H 2000 5100 50  0001 C CNN
F 3 "" H 2000 5100 50  0001 C CNN
	1    2000 5100
	1    0    0    -1  
$EndComp
Connection ~ 2000 4800
Wire Wire Line
	3300 4700 3500 4700
Wire Wire Line
	3500 4700 3500 4900
$Comp
L Device:C C1302
U 1 1 6055848B
P 3500 4550
F 0 "C1302" H 3385 4504 50  0000 R CNN
F 1 "100nF" H 3385 4595 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3538 4400 50  0001 C CNN
F 3 "~" H 3500 4550 50  0001 C CNN
	1    3500 4550
	-1   0    0    1   
$EndComp
Connection ~ 3500 4700
Wire Wire Line
	3300 4600 3400 4600
Wire Wire Line
	3400 4600 3400 4400
Wire Wire Line
	3400 4400 3500 4400
$Comp
L power:GND #PWR0411
U 1 1 60558495
P 3500 4400
F 0 "#PWR0411" H 3500 4150 50  0001 C CNN
F 1 "GND" H 3505 4227 50  0000 C CNN
F 2 "" H 3500 4400 50  0001 C CNN
F 3 "" H 3500 4400 50  0001 C CNN
	1    3500 4400
	-1   0    0    1   
$EndComp
Connection ~ 3500 4400
Wire Wire Line
	3300 4800 3300 4950
Text HLabel 3300 4950 3    50   Output ~ 0
BrakeC_V
$Comp
L Device:R R1310
U 1 1 60564E8A
P 2990 4150
F 0 "R1310" V 2890 4150 50  0000 C CNN
F 1 "0.75" V 2990 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2920 4150 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/54/CRL-764981.pdf" H 2990 4150 50  0001 C CNN
F 4 "CRL0805-FW-R750ELF" V 2990 4150 50  0001 C CNN "Name"
	1    2990 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 1400 5200 1400
Wire Wire Line
	5200 1400 5200 1250
$Comp
L Device:R R?
U 1 1 60655C31
P 5050 1250
AR Path="/5F7F5CD4/60655C31" Ref="R?"  Part="1" 
AR Path="/603DCCC0/60655C31" Ref="R1301"  Part="1" 
F 0 "R1301" V 4970 1250 50  0000 C CNN
F 1 "33" V 5050 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4980 1250 50  0001 C CNN
F 3 "~" H 5050 1250 50  0001 C CNN
	1    5050 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 1250 4850 1250
$Comp
L power:GND #PWR?
U 1 1 60655C38
P 4450 1300
AR Path="/5F7F5CD4/60655C38" Ref="#PWR?"  Part="1" 
AR Path="/603DCCC0/60655C38" Ref="#PWR0412"  Part="1" 
F 0 "#PWR0412" H 4450 1050 50  0001 C CNN
F 1 "GND" H 4300 1250 50  0000 C CNN
F 2 "" H 4450 1300 50  0001 C CNN
F 3 "" H 4450 1300 50  0001 C CNN
	1    4450 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1250 4450 1250
Wire Wire Line
	4450 1250 4450 1300
$Comp
L Diode:BAS21 D?
U 1 1 60655C40
P 4700 1250
AR Path="/5F7F5CD4/60655C40" Ref="D?"  Part="1" 
AR Path="/603DCCC0/60655C40" Ref="D1301"  Part="1" 
F 0 "D1301" H 4700 1467 50  0000 C CNN
F 1 "BAS21T-7-F" H 4700 1376 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4700 1075 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/Ds12004.pdf" H 4700 1250 50  0001 C CNN
	1    4700 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0413
U 1 1 606C1DE4
P 3500 2550
F 0 "#PWR0413" H 3500 2400 50  0001 C CNN
F 1 "+5V" H 3515 2723 50  0000 C CNN
F 2 "" H 3500 2550 50  0001 C CNN
F 3 "" H 3500 2550 50  0001 C CNN
	1    3500 2550
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0414
U 1 1 606C31E8
P 3500 4900
F 0 "#PWR0414" H 3500 4750 50  0001 C CNN
F 1 "+5V" H 3515 5073 50  0000 C CNN
F 2 "" H 3500 4900 50  0001 C CNN
F 3 "" H 3500 4900 50  0001 C CNN
	1    3500 4900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F941D5F
P 4800 1600
AR Path="/5F7F5CD4/5F941D5F" Ref="R?"  Part="1" 
AR Path="/603DCCC0/5F941D5F" Ref="R1303"  Part="1" 
F 0 "R1303" V 4890 1480 50  0000 L CNN
F 1 "4.7k" V 4800 1515 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4730 1600 50  0001 C CNN
F 3 "~" H 4800 1600 50  0001 C CNN
	1    4800 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 1600 4650 1600
$Comp
L Vikings_misc:LV_Unfiltered #PWR0415
U 1 1 5F8A3CC5
P 3300 1150
F 0 "#PWR0415" H 3300 950 50  0001 C CNN
F 1 "LV_Unfiltered" H 3300 1323 50  0000 C CNN
F 2 "" H 3300 1200 50  0001 C CNN
F 3 "" H 3300 1200 50  0001 C CNN
	1    3300 1150
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:LV_Unfiltered #PWR0416
U 1 1 5F8A46D9
P 3300 3500
F 0 "#PWR0416" H 3300 3300 50  0001 C CNN
F 1 "LV_Unfiltered" H 3300 3673 50  0000 C CNN
F 2 "" H 3300 3550 50  0001 C CNN
F 3 "" H 3300 3550 50  0001 C CNN
	1    3300 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F1301
U 1 1 60041975
P 2310 1800
F 0 "F1301" H 2310 1930 50  0000 C CNN
F 1 "375 mA" H 2310 1860 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 2310 1800 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 2310 1800 50  0001 C CNN
F 4 "Littelfuse" H 2310 1800 50  0001 C CNN "Manufacturer"
F 5 "0157.375DR" H 2310 1800 50  0001 C CNN "Man. Part No."
	1    2310 1800
	1    0    0    -1  
$EndComp
Connection ~ 2640 1800
Wire Wire Line
	2410 1800 2640 1800
Wire Wire Line
	2530 4150 2720 4150
Connection ~ 2720 4150
$Comp
L Device:Fuse_Small F1302
U 1 1 5F93A7F7
P 2430 4150
F 0 "F1302" H 2430 4280 50  0000 C CNN
F 1 "375 mA" H 2430 4210 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 2430 4150 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 2430 4150 50  0001 C CNN
F 4 "Littelfuse" H 2430 4150 50  0001 C CNN "Manufacturer"
F 5 "0157.375DR" H 2430 4150 50  0001 C CNN "Man. Part No."
	1    2430 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1500 6400 1850
Connection ~ 6400 1500
Wire Wire Line
	6400 1500 6480 1500
$Comp
L Device:R R1305
U 1 1 5F909887
P 6400 2000
F 0 "R1305" H 6470 2046 50  0000 L CNN
F 1 "4.12k" H 6470 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6330 2000 50  0001 C CNN
F 3 "~" H 6400 2000 50  0001 C CNN
	1    6400 2000
	1    0    0    -1  
$EndComp
$Comp
L Vikings_passives:150060SS75000 D1303
U 1 1 5F90A80E
P 6400 2350
F 0 "D1303" V 6700 2050 50  0000 L CNN
F 1 "150060SS75000" V 6800 1700 50  0000 L CNN
F 2 "Vikings_devices:Wurth_150060SS75000" H 6400 2950 50  0001 L CNN
F 3 "http://katalog.we-online.com/led/datasheet/150060SS75000.pdf" H 6400 3050 50  0001 L CNN
F 4 "Red" H 6400 3150 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 6400 3250 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 6400 3350 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 6400 3450 50  0001 L CNN "category"
F 8 "12518860" H 6400 3550 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 6400 3650 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 6400 3750 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 6400 3850 50  0001 L CNN "package"
F 12 "1421305860" H 6400 3950 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 6400 4050 50  0001 L CNN "vault revision"
F 14 "yes" H 6400 4150 50  0001 L CNN "imported"
	1    6400 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 2800 6400 2650
Wire Wire Line
	6400 2150 6400 2250
Text Notes 4050 3600 0    50   ~ 0
Red LED:\nVf = 2.4 V (max)\nIf = 7 mA\nR = (30 V - 2.4 V) / 7 mA = 4000 Ω\nFor 10 V, results in 2 mA.
Text Notes 4050 3750 0    50   ~ 0
Rounded up to 4120 Ω
$Comp
L Device:R R1306
U 1 1 5F93ECD7
P 1550 2050
F 0 "R1306" H 1620 2096 50  0000 L CNN
F 1 "4.12k" H 1620 2005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1480 2050 50  0001 C CNN
F 3 "~" H 1550 2050 50  0001 C CNN
	1    1550 2050
	1    0    0    -1  
$EndComp
$Comp
L Vikings_passives:150060SS75000 D1302
U 1 1 5F93ECE8
P 1550 2300
F 0 "D1302" V 1850 2000 50  0000 L CNN
F 1 "150060SS75000" V 1950 1650 50  0000 L CNN
F 2 "Vikings_devices:Wurth_150060SS75000" H 1550 2900 50  0001 L CNN
F 3 "http://katalog.we-online.com/led/datasheet/150060SS75000.pdf" H 1550 3000 50  0001 L CNN
F 4 "Red" H 1550 3100 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 1550 3200 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 1550 3300 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 1550 3400 50  0001 L CNN "category"
F 8 "12518860" H 1550 3500 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 1550 3600 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 1550 3700 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 1550 3800 50  0001 L CNN "package"
F 12 "1421305860" H 1550 3900 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 1550 4000 50  0001 L CNN "vault revision"
F 14 "yes" H 1550 4100 50  0001 L CNN "imported"
	1    1550 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 2750 1550 2600
Wire Wire Line
	2000 2450 2000 2750
Wire Wire Line
	1550 1900 1550 1800
Wire Wire Line
	1550 1800 1400 1800
Wire Wire Line
	2210 1800 1550 1800
Connection ~ 1550 1800
Wire Notes Line
	3900 3000 3900 800 
Wire Notes Line
	800  3000 3900 3000
Wire Notes Line
	800  800  3900 800 
$Comp
L Device:R R1311
U 1 1 5F98086C
P 1550 4400
F 0 "R1311" H 1620 4446 50  0000 L CNN
F 1 "4.12k" H 1620 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1480 4400 50  0001 C CNN
F 3 "~" H 1550 4400 50  0001 C CNN
	1    1550 4400
	1    0    0    -1  
$EndComp
$Comp
L Vikings_passives:150060SS75000 D1304
U 1 1 5F98087D
P 1550 4750
F 0 "D1304" V 1850 4450 50  0000 L CNN
F 1 "150060SS75000" V 1950 4100 50  0000 L CNN
F 2 "Vikings_devices:Wurth_150060SS75000" H 1550 5350 50  0001 L CNN
F 3 "http://katalog.we-online.com/led/datasheet/150060SS75000.pdf" H 1550 5450 50  0001 L CNN
F 4 "Red" H 1550 5550 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 1550 5650 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 1550 5750 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 1550 5850 50  0001 L CNN "category"
F 8 "12518860" H 1550 5950 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 1550 6050 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 1550 6150 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 1550 6250 50  0001 L CNN "package"
F 12 "1421305860" H 1550 6350 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 1550 6450 50  0001 L CNN "vault revision"
F 14 "yes" H 1550 6550 50  0001 L CNN "imported"
	1    1550 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 4550 1550 4650
Wire Wire Line
	2000 4800 2000 5100
Wire Wire Line
	1350 4150 1550 4150
Wire Wire Line
	1550 4250 1550 4150
Connection ~ 1550 4150
Wire Wire Line
	1550 4150 2330 4150
Wire Wire Line
	1550 5050 1550 5100
Wire Notes Line
	3900 3200 3900 5400
Wire Notes Line
	800  5400 3900 5400
Wire Notes Line
	800  3200 3900 3200
$Comp
L Connector:TestPoint TP?
U 1 1 5FA270F3
P 2350 1150
AR Path="/5F94DFD6/5FA270F3" Ref="TP?"  Part="1" 
AR Path="/603DCCC0/5FA270F3" Ref="TP1301"  Part="1" 
F 0 "TP1301" H 2000 1300 50  0000 L CNN
F 1 "TestPoint" H 2408 1177 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 2550 1150 50  0001 C CNN
F 3 "~" H 2550 1150 50  0001 C CNN
	1    2350 1150
	1    0    0    -1  
$EndComp
Connection ~ 2350 1150
Wire Wire Line
	2350 1150 2400 1150
$Comp
L Connector:TestPoint TP?
U 1 1 5FA2AC0F
P 2350 3500
AR Path="/5F94DFD6/5FA2AC0F" Ref="TP?"  Part="1" 
AR Path="/603DCCC0/5FA2AC0F" Ref="TP1303"  Part="1" 
F 0 "TP1303" H 2000 3650 50  0000 L CNN
F 1 "TestPoint" H 2408 3527 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 2550 3500 50  0001 C CNN
F 3 "~" H 2550 3500 50  0001 C CNN
	1    2350 3500
	1    0    0    -1  
$EndComp
Connection ~ 2350 3500
Wire Wire Line
	2350 3500 2400 3500
$Comp
L Connector:TestPoint TP?
U 1 1 5FA2CDC4
P 4800 1500
AR Path="/5F94DFD6/5FA2CDC4" Ref="TP?"  Part="1" 
AR Path="/603DCCC0/5FA2CDC4" Ref="TP1302"  Part="1" 
F 0 "TP1302" H 4490 1660 50  0000 L CNN
F 1 "TestPoint" H 4858 1527 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5000 1500 50  0001 C CNN
F 3 "~" H 5000 1500 50  0001 C CNN
	1    4800 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1500 6400 1500
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0396
U 1 1 5FE20B77
P 6400 2800
F 0 "#PWR0396" H 6400 2550 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 6400 2660 50  0000 C CNN
F 2 "" H 6400 2800 50  0001 C CNN
F 3 "" H 6400 2800 50  0001 C CNN
	1    6400 2800
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0460
U 1 1 5FE23EBB
P 1550 2750
F 0 "#PWR0460" H 1550 2500 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 1530 2610 50  0000 C CNN
F 2 "" H 1550 2750 50  0001 C CNN
F 3 "" H 1550 2750 50  0001 C CNN
	1    1550 2750
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0500
U 1 1 5FE26DAD
P 1550 5100
F 0 "#PWR0500" H 1550 4850 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 1510 4960 50  0000 C CNN
F 2 "" H 1550 5100 50  0001 C CNN
F 3 "" H 1550 5100 50  0001 C CNN
	1    1550 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FAC72EE
P 5020 1500
AR Path="/5F7F5CD4/5FAC72EE" Ref="R?"  Part="1" 
AR Path="/603DCCC0/5FAC72EE" Ref="R1312"  Part="1" 
F 0 "R1312" V 4940 1380 50  0000 L CNN
F 1 "4.7k" V 5020 1415 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4950 1500 50  0001 C CNN
F 3 "~" H 5020 1500 50  0001 C CNN
	1    5020 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	4690 1500 4800 1500
Wire Wire Line
	5170 1500 5250 1500
Connection ~ 4800 1500
Wire Wire Line
	4800 1500 4870 1500
$Comp
L Vikings_misc:LV_Fused-1 #PWR0167
U 1 1 5FC4E618
P 5600 1050
F 0 "#PWR0167" H 5600 900 50  0001 C CNN
F 1 "LV_Fused-1" H 5615 1223 50  0000 C CNN
F 2 "" H 5600 1050 50  0001 C CNN
F 3 "" H 5600 1050 50  0001 C CNN
	1    5600 1050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
