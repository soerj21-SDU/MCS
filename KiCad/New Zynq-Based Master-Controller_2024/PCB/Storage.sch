EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 17
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
L Vikings_connectors:Molex47219-2001 J?
U 1 1 5F5A320F
P 5250 1700
AR Path="/5F5A320F" Ref="J?"  Part="1" 
AR Path="/5F59EC23/5F5A320F" Ref="J401"  Part="1" 
F 0 "J401" H 6150 1950 50  0000 R CNN
F 1 "Molex 47219-2001" H 6450 1850 50  0000 R CNN
F 2 "Vikings_connectors:Molex-47219-2001-0" H 5250 2200 50  0001 L CNN
F 3 "http://www.molex.com/pdm_docs/sd/472192001_sd.pdf" H 5250 2300 50  0001 L CNN
F 4 "Conn" H 5250 2400 50  0001 L CNN "category"
F 5 "CONN MICRO SD CARD HINGED TYPE" H 5250 2500 50  0001 L CNN "digikey description"
F 6 "WM6698CT-ND" H 5250 2600 50  0001 L CNN "digikey part number"
F 7 "yes" H 5250 2700 50  0001 L CNN "is connector"
F 8 "yes" H 5250 2800 50  0001 L CNN "is female"
F 9 "yes" H 5250 2900 50  0001 L CNN "lead free"
F 10 "cf639670a30b6b80" H 5250 3000 50  0001 L CNN "library id"
F 11 "Molex" H 5250 3100 50  0001 L CNN "manufacturer"
F 12 "538-47219-2001" H 5250 3200 50  0001 L CNN "mouser part number"
F 13 "SMT_SDCARD_14MM5_13MM6" H 5250 3300 50  0001 L CNN "package"
F 14 "yes" H 5250 3400 50  0001 L CNN "rohs"
F 15 "+85°C" H 5250 3500 50  0001 L CNN "temperature range high"
F 16 "-20°C" H 5250 3600 50  0001 L CNN "temperature range low"
	1    5250 1700
	1    0    0    -1  
$EndComp
NoConn ~ 2950 2900
Wire Wire Line
	2450 2900 2450 3050
Wire Wire Line
	2450 3050 2400 3050
Wire Wire Line
	2350 3050 2350 2900
$Comp
L power:GND #PWR0173
U 1 1 5F5BA016
P 2400 3050
F 0 "#PWR0173" H 2400 2800 50  0001 C CNN
F 1 "GND" H 2450 2900 50  0000 R CNN
F 2 "" H 2400 3050 50  0001 C CNN
F 3 "" H 2400 3050 50  0001 C CNN
	1    2400 3050
	1    0    0    -1  
$EndComp
Connection ~ 2400 3050
Wire Wire Line
	2400 3050 2350 3050
NoConn ~ 2250 2900
Text HLabel 1500 2500 0    50   BiDi ~ 0
CLK
Wire Wire Line
	1650 2500 1500 2500
Text HLabel 1500 2650 0    50   BiDi ~ 0
CMD
Wire Wire Line
	1650 2650 1500 2650
Wire Wire Line
	3550 2300 5250 2300
Wire Wire Line
	3550 2100 5250 2100
Wire Wire Line
	3550 1900 5250 1900
Wire Wire Line
	3550 1700 5250 1700
Wire Wire Line
	5250 2700 5100 2700
$Comp
L power:GND #PWR0174
U 1 1 5F5D1D7B
P 5100 2700
F 0 "#PWR0174" H 5100 2450 50  0001 C CNN
F 1 "GND" V 5210 2680 50  0000 R CNN
F 2 "" H 5100 2700 50  0001 C CNN
F 3 "" H 5100 2700 50  0001 C CNN
	1    5100 2700
	0    1    1    0   
$EndComp
Text HLabel 1500 1700 0    50   BiDi ~ 0
CD_DATA3
Text HLabel 1500 1900 0    50   BiDi ~ 0
DATA2
Text HLabel 1500 2300 0    50   BiDi ~ 0
DATA0
Wire Wire Line
	1650 1700 1500 1700
Wire Wire Line
	1500 1900 1650 1900
$Comp
L power:+3.3V #PWR0175
U 1 1 5F5DAE0F
P 2850 3050
F 0 "#PWR0175" H 2850 2900 50  0001 C CNN
F 1 "+3.3V" H 2865 3223 50  0000 C CNN
F 2 "" H 2850 3050 50  0001 C CNN
F 3 "" H 2850 3050 50  0001 C CNN
	1    2850 3050
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0176
U 1 1 5F5D1322
P 4050 2600
F 0 "#PWR0176" H 4050 2450 50  0001 C CNN
F 1 "+3.3V" H 3950 2750 50  0000 L CNN
F 2 "" H 4050 2600 50  0001 C CNN
F 3 "" H 4050 2600 50  0001 C CNN
	1    4050 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C401
U 1 1 5F5DD5F4
P 4750 2600
F 0 "C401" V 4700 2440 50  0000 C CNN
F 1 "100nF" V 4810 2420 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4788 2450 50  0001 C CNN
F 3 "~" H 4750 2600 50  0001 C CNN
	1    4750 2600
	0    1    1    0   
$EndComp
$Comp
L Device:C C402
U 1 1 5F5DDC71
P 4750 2400
F 0 "C402" V 4800 2240 50  0000 C CNN
F 1 "22uF" V 4700 2250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4788 2250 50  0001 C CNN
F 3 "~" H 4750 2400 50  0001 C CNN
	1    4750 2400
	0    1    1    0   
$EndComp
Text Notes 1000 1100 0    50   ~ 0
EMI Filter, ESD Protection, and SD Card Connector
Text Notes 1000 4350 0    138  ~ 0
All switching inputs must be same length on PCB.\nImpedance matching: 50 Ω\nPlace filter IC close to PS pins. 
Wire Notes Line
	7000 1150 7000 3650
Wire Notes Line
	7000 3650 1000 3650
Wire Notes Line
	1000 3650 1000 1150
Wire Notes Line
	1000 1150 7000 1150
Wire Wire Line
	1650 2100 1500 2100
Text HLabel 1500 2100 0    50   BiDi ~ 0
DATA1
$Comp
L Vikings_passives:EMIF06-MSD02N16 FL?
U 1 1 5F5A4825
P 3550 1700
AR Path="/5F5A4825" Ref="FL?"  Part="1" 
AR Path="/5F59EC23/5F5A4825" Ref="FL401"  Part="1" 
F 0 "FL401" H 2600 2000 50  0000 C CNN
F 1 "EMIF06-MSD02N16" H 2600 1900 50  0000 C CNN
F 2 "Vikings_devices:uQFN-16L" H 3550 2100 50  0001 L CNN
F 3 "https://upverter.com/datasheet/dd14abe25c102cc7fdccadb49a97a5967f087691.pdf" H 3550 2200 50  0001 L CNN
F 4 "No" H 3550 2300 50  0001 L CNN "automotive"
F 5 "5V" H 3550 2400 50  0001 L CNN "breakdown voltage"
F 6 "20pF" H 3550 2500 50  0001 L CNN "capacitance"
F 7 "Filter" H 3550 2600 50  0001 L CNN "category"
F 8 "Circuit Protection" H 3550 2700 50  0001 L CNN "device class L1"
F 9 "ESD and Circuit Protection ICs" H 3550 2800 50  0001 L CNN "device class L2"
F 10 "unset" H 3550 2900 50  0001 L CNN "device class L3"
F 11 "FILTER RC(PI) 45 OHM/20PF SMD" H 3550 3000 50  0001 L CNN "digikey description"
F 12 "497-8751-1-ND" H 3550 3100 50  0001 L CNN "digikey part number"
F 13 "0.55mm" H 3550 3200 50  0001 L CNN "height"
F 14 "Other" H 3550 3300 50  0001 L CNN "interface"
F 15 "Yes" H 3550 3400 50  0001 L CNN "lead free"
F 16 "a836ff8c15a6a3d2" H 3550 3500 50  0001 L CNN "library id"
F 17 "STMicroelectronics" H 3550 3600 50  0001 L CNN "manufacturer"
F 18 "+125°C" H 3550 3700 50  0001 L CNN "max junction temp"
F 19 "EMI Network Filter Arrays 6-line Micro QFN Lvl 4 20pF 50MHz" H 3550 3800 50  0001 L CNN "mouser description"
F 20 "511-EMIF06-MSD02N16" H 3550 3900 50  0001 L CNN "mouser part number"
F 21 "6" H 3550 4000 50  0001 L CNN "number of channels"
F 22 "uQFN16" H 3550 4100 50  0001 L CNN "package"
F 23 "Yes" H 3550 4200 50  0001 L CNN "rohs"
F 24 "0mm" H 3550 4300 50  0001 L CNN "standoff height"
F 25 "+85°C" H 3550 4400 50  0001 L CNN "temperature range high"
F 26 "-30°C" H 3550 4500 50  0001 L CNN "temperature range low"
	1    3550 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2300 1650 2300
Wire Wire Line
	2850 2900 2850 3050
Wire Wire Line
	3550 2600 3700 2600
Wire Wire Line
	3700 2600 3700 3100
Wire Wire Line
	3700 3100 5250 3100
Wire Wire Line
	3550 2500 3800 2500
Wire Wire Line
	3800 2500 3800 2900
Wire Wire Line
	3800 2900 5250 2900
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5FBB525D
P 4250 2700
AR Path="/5F5FC96C/5FBB525D" Ref="FB?"  Part="1" 
AR Path="/5F604B68/5FBB525D" Ref="FB?"  Part="1" 
AR Path="/5F650ED1/5FBB525D" Ref="FB?"  Part="1" 
AR Path="/5F59EC23/5FBB525D" Ref="FB401"  Part="1" 
F 0 "FB401" V 4200 2950 50  0000 C CNN
F 1 "220R @ 100 MHz" V 4140 2735 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 4180 2700 50  0001 C CNN
F 3 "https://www.mouser.dk/ProductDetail/TDK/MPZ1608S221ATA00?qs=sGAEpiMZZMt1hubY80%2Fs8Hp09N5ImNkmPGZEpzSBQSs%3D" H 4250 2700 50  0001 C CNN
F 4 "MPZ1608S221ATA00" V 4250 2700 50  0001 C CNN "Name"
	1    4250 2700
	0    -1   -1   0   
$EndComp
Text Notes 3850 2700 0    50   ~ 0
2.2 A
Wire Wire Line
	5700 3350 5700 3390
Wire Wire Line
	5700 3390 5740 3390
$Comp
L Device:R R401
U 1 1 5FBB2FC1
P 5890 3390
F 0 "R401" V 5810 3390 50  0000 C CNN
F 1 "0" V 5890 3390 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 5820 3390 50  0001 C CNN
F 3 "~" H 5890 3390 50  0001 C CNN
	1    5890 3390
	0    1    1    0   
$EndComp
Wire Wire Line
	6040 3390 6130 3390
Wire Wire Line
	5700 3390 5700 3420
$Comp
L Vikings_misc:GND-4 #PWR0186
U 1 1 5FBB47C1
P 5700 3420
F 0 "#PWR0186" H 5700 3170 50  0001 C CNN
F 1 "GND-4" H 5700 3270 50  0000 C CNN
F 2 "" H 5700 3420 50  0001 C CNN
F 3 "" H 5700 3420 50  0001 C CNN
	1    5700 3420
	1    0    0    -1  
$EndComp
Connection ~ 5700 3390
Wire Wire Line
	6130 3390 6130 3420
$Comp
L power:GND #PWR0204
U 1 1 5FBBD3EC
P 6130 3420
F 0 "#PWR0204" H 6130 3170 50  0001 C CNN
F 1 "GND" H 6130 3270 50  0000 C CNN
F 2 "" H 6130 3420 50  0001 C CNN
F 3 "" H 6130 3420 50  0001 C CNN
	1    6130 3420
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2500 5250 2500
Wire Wire Line
	4950 2500 4950 2400
Wire Wire Line
	4950 2400 4900 2400
Wire Wire Line
	4900 2600 4950 2600
Wire Wire Line
	4950 2600 4950 2500
Connection ~ 4950 2500
$Comp
L power:GND #PWR0183
U 1 1 5FF0648E
P 4500 2500
F 0 "#PWR0183" H 4500 2250 50  0001 C CNN
F 1 "GND" V 4500 2400 50  0000 R CNN
F 2 "" H 4500 2500 50  0001 C CNN
F 3 "" H 4500 2500 50  0001 C CNN
	1    4500 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 2400 4550 2400
Wire Wire Line
	4600 2600 4550 2600
Wire Wire Line
	4550 2400 4550 2500
Connection ~ 4550 2500
Wire Wire Line
	4550 2500 4550 2600
Wire Wire Line
	4050 2600 4050 2700
Wire Wire Line
	4050 2700 4150 2700
Wire Wire Line
	4350 2700 4950 2700
Wire Wire Line
	4950 2700 4950 2600
Connection ~ 4950 2600
Wire Wire Line
	4500 2500 4550 2500
$EndSCHEMATC
