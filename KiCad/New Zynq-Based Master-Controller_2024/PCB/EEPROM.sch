EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 17
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
L Vikings_actives:CY14B256PA U1001
U 1 1 5F731A69
P 2290 1350
F 0 "U1001" H 2690 1515 50  0000 C CNN
F 1 "CY14B256PA" H 2690 1424 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 2290 1350 50  0001 C CNN
F 3 "https://www.cypress.com/file/45216/download" H 2290 1350 50  0001 C CNN
	1    2290 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1001
U 1 1 5F733C5F
P 1460 1480
F 0 "Y1001" V 1630 1370 50  0000 L CNN
F 1 "32.768 kHz" H 1240 1640 50  0000 L CNN
F 2 "Vikings_devices:Crystal_SMD_Fox_FK161" H 1460 1480 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/160/K161-1153986.pdf" H 1460 1480 50  0001 C CNN
F 4 "Fox" V 1460 1480 50  0001 C CNN "Manufacturer"
F 5 "FK161EIHM0.032768" V 1460 1480 50  0001 C CNN "Man. Part No."
F 6 "32.768 kHz Crystal Oscillator, 20 ppm tol., 12.5pF Load Capacitance, -0.04 PPM freq. stability, 90kOhm ESR, 0.1uW Drive Level" V 1460 1480 50  0001 C CNN "Description"
	1    1460 1480
	0    1    1    0   
$EndComp
Wire Wire Line
	2190 1650 1700 1650
Wire Wire Line
	1700 1650 1700 1210
Wire Wire Line
	1700 1210 1460 1210
Wire Wire Line
	1460 1210 1460 1330
$Comp
L Device:C_Small C1003
U 1 1 5F734E31
P 1190 1620
F 0 "C1003" H 1070 1690 50  0000 L CNN
F 1 "68pF" H 990 1560 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1190 1620 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012006007.pdf" H 1190 1620 50  0001 C CNN
F 4 "Würth Elektronik" H 1190 1620 50  0001 C CNN "Manufacturer"
F 5 "885012006007" H 1190 1620 50  0001 C CNN "Man. Part No."
F 6 "68pF, 5% tol, 10V, C0G MLCC, 0603, -55-125 deg" H 1190 1620 50  0001 C CNN "Description"
	1    1190 1620
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1001
U 1 1 5F7354AD
P 1190 1330
F 0 "C1001" H 1070 1400 50  0000 L CNN
F 1 "12pF" H 1000 1270 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1190 1330 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/40/C0GNP0-Dielectric-951274.pdf" H 1190 1330 50  0001 C CNN
F 4 "AVX" H 1190 1330 50  0001 C CNN "Manufacturer"
F 5 "06036A120JAT2A" H 1190 1330 50  0001 C CNN "Man. Part No."
F 6 "12pF, 5% tol, 6.3V, C0G MLCC, 0603, -55-125 deg" H 1190 1330 50  0001 C CNN "Description"
	1    1190 1330
	1    0    0    -1  
$EndComp
Wire Wire Line
	1460 1210 1190 1210
Wire Wire Line
	1190 1210 1190 1230
Connection ~ 1460 1210
Wire Wire Line
	1190 1430 1190 1480
Wire Wire Line
	1190 1720 1190 1750
Wire Wire Line
	1190 1750 1460 1750
Wire Wire Line
	1460 1750 1460 1630
Connection ~ 1460 1750
Wire Wire Line
	1190 1480 860  1480
Wire Wire Line
	860  1480 860  1760
Connection ~ 1190 1480
Wire Wire Line
	1190 1480 1190 1520
$Comp
L power:GND #PWR0347
U 1 1 5F737C6F
P 860 1760
F 0 "#PWR0347" H 860 1510 50  0001 C CNN
F 1 "GND" H 865 1587 50  0000 C CNN
F 2 "" H 860 1760 50  0001 C CNN
F 3 "" H 860 1760 50  0001 C CNN
	1    860  1760
	1    0    0    -1  
$EndComp
Wire Wire Line
	1460 1750 2190 1750
$Comp
L Device:Battery_Cell BT1001
U 1 1 5F73CF59
P 10110 1930
F 0 "BT1001" H 10228 2026 50  0000 L CNN
F 1 "Battery_Cell" H 10228 1935 50  0000 L CNN
F 2 "Vikings_misc:Battery_VL2020_20x3.2mm" V 10110 1990 50  0001 C CNN
F 3 "~" V 10110 1990 50  0001 C CNN
	1    10110 1930
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0349
U 1 1 5F73F95B
P 8880 2090
F 0 "#PWR0349" H 8880 1840 50  0001 C CNN
F 1 "GND" H 9040 2010 50  0000 C CNN
F 2 "" H 8880 2090 50  0001 C CNN
F 3 "" H 8880 2090 50  0001 C CNN
	1    8880 2090
	1    0    0    -1  
$EndComp
Wire Wire Line
	2190 1550 1950 1550
Wire Wire Line
	1950 1550 1950 1430
$Comp
L power:+BATT #PWR0350
U 1 1 5F74226B
P 1950 1430
F 0 "#PWR0350" H 1950 1280 50  0001 C CNN
F 1 "+BATT" H 1965 1603 50  0000 C CNN
F 2 "" H 1950 1430 50  0001 C CNN
F 3 "" H 1950 1430 50  0001 C CNN
	1    1950 1430
	1    0    0    -1  
$EndComp
Wire Wire Line
	3190 1450 3250 1450
Wire Wire Line
	3250 1450 3250 1410
$Comp
L power:+3.3V #PWR0351
U 1 1 5F743051
P 3250 1410
F 0 "#PWR0351" H 3250 1260 50  0001 C CNN
F 1 "+3.3V" H 3250 1560 50  0000 C CNN
F 2 "" H 3250 1410 50  0001 C CNN
F 3 "" H 3250 1410 50  0001 C CNN
	1    3250 1410
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0352
U 1 1 5F7648B4
P 2100 2210
F 0 "#PWR0352" H 2100 1960 50  0001 C CNN
F 1 "GND" H 1980 2130 50  0000 C CNN
F 2 "" H 2100 2210 50  0001 C CNN
F 3 "" H 2100 2210 50  0001 C CNN
	1    2100 2210
	1    0    0    -1  
$EndComp
Wire Wire Line
	2190 2150 2100 2150
Wire Wire Line
	2100 2150 2100 2210
NoConn ~ 2190 2050
$Comp
L Device:CP_Small C1004
U 1 1 5F767910
P 3480 1650
F 0 "C1004" V 3380 1530 50  0000 L CNN
F 1 "68uF" V 3510 1690 50  0000 L CNN
F 2 "Vikings_devices:C_2312_6032-28_Metric" H 3480 1650 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/40/noj-776783.pdf" H 3480 1650 50  0001 C CNN
F 4 "AVX" V 3480 1650 50  0001 C CNN "Manufacturer"
F 5 "NOJC686M010SWJ" V 3480 1650 50  0001 C CNN "Man. Part No."
F 6 "68 uF, 10V, 20% tol., max. 0.5 Ohm ESR" V 3480 1650 50  0001 C CNN "Description"
	1    3480 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 1650 3580 1650
Wire Wire Line
	3190 2050 4470 2050
Wire Wire Line
	3190 1950 4470 1950
Wire Wire Line
	3190 1850 4470 1850
Wire Wire Line
	3190 1750 4470 1750
Text HLabel 4470 1750 2    50   Output ~ 0
SO_NVSRAM
Text HLabel 4470 1850 2    50   Input ~ 0
SI_NVSRAM
Text HLabel 4470 1950 2    50   Input ~ 0
SCK_NVSRAM
Text HLabel 4470 2050 2    50   Input ~ 0
~CS_NVSRAM
Wire Wire Line
	3190 2150 4470 2150
Text HLabel 4470 2150 2    50   BiDi ~ 0
~HSB_NVSRAM
Text HLabel 4470 1550 2    50   Output ~ 0
NVSRAM_INT_SQW
Wire Wire Line
	3190 1550 4470 1550
Text Notes 3670 1730 0    50   ~ 0
NOJC686M010SWJ\n68 uF, 10V, 20% tol
Text Notes 500  1110 0    50   ~ 0
FK161EIHM0.032768\n12.5 pF Load Cap.\n-0.04 PPM freq. stability
Wire Notes Line
	1250 1110 1370 1390
Wire Notes Line
	1370 1390 1320 1370
Wire Notes Line
	1370 1390 1390 1350
$Comp
L Device:C_Small C1002
U 1 1 5F773A97
P 3480 1450
F 0 "C1002" V 3440 1480 50  0000 L CNN
F 1 "100nF" V 3360 1340 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3480 1450 50  0001 C CNN
F 3 "~" H 3480 1450 50  0001 C CNN
	1    3480 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	3580 1450 3650 1450
$Comp
L power:GND #PWR0353
U 1 1 5F774D96
P 3690 1450
F 0 "#PWR0353" H 3690 1200 50  0001 C CNN
F 1 "GND" V 3690 1330 50  0000 R CNN
F 2 "" H 3690 1450 50  0001 C CNN
F 3 "" H 3690 1450 50  0001 C CNN
	1    3690 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0354
U 1 1 5F7EEE31
P 1750 1900
F 0 "#PWR0354" H 1750 1750 50  0001 C CNN
F 1 "+3.3V" H 1765 2073 50  0000 C CNN
F 2 "" H 1750 1900 50  0001 C CNN
F 3 "" H 1750 1900 50  0001 C CNN
	1    1750 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1790 1850 1790 1900
Wire Wire Line
	1750 1900 1790 1900
Connection ~ 1790 1900
Wire Wire Line
	1790 1900 1790 1950
Wire Wire Line
	10110 1640 10110 1730
$Comp
L Device:D_Schottky_ALT D1001
U 1 1 5F8129EA
P 9410 1640
F 0 "D1001" H 9570 1600 50  0000 C CNN
F 1 "RB500VM-40TE-17" H 9310 1530 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323F" H 9410 1640 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/348/rb500vm-40te-17-e-1870204.pdf" H 9410 1640 50  0001 C CNN
F 4 "V_F = 300mV @ I_F = 1,5mA" H 9410 1640 50  0001 C CNN "Description"
	1    9410 1640
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1002
U 1 1 5F8150EE
P 8880 1410
F 0 "R1002" H 8810 1364 50  0000 R CNN
F 1 "200" V 8880 1500 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8810 1410 50  0001 C CNN
F 3 "~" H 8880 1410 50  0001 C CNN
	1    8880 1410
	1    0    0    1   
$EndComp
$Comp
L Device:R R1004
U 1 1 5F815A0E
P 8880 1880
F 0 "R1004" H 8811 1834 50  0000 R CNN
F 1 "510" V 8880 1940 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8810 1880 50  0001 C CNN
F 3 "~" H 8880 1880 50  0001 C CNN
	1    8880 1880
	1    0    0    1   
$EndComp
Wire Wire Line
	8880 1640 8880 1560
Wire Wire Line
	8880 1730 8880 1640
Connection ~ 8880 1640
Wire Wire Line
	8880 1260 8880 1220
$Comp
L power:+5V #PWR0355
U 1 1 5F81FFCE
P 8880 880
F 0 "#PWR0355" H 8880 730 50  0001 C CNN
F 1 "+5V" H 8895 1053 50  0000 C CNN
F 2 "" H 8880 880 50  0001 C CNN
F 3 "" H 8880 880 50  0001 C CNN
	1    8880 880 
	1    0    0    -1  
$EndComp
Connection ~ 3250 1450
Wire Wire Line
	3250 1450 3380 1450
Text Notes 9030 1770 0    50   ~ 0
RB500VM-40TE-17
Connection ~ 10110 1640
Wire Notes Line
	8270 2350 8270 460 
Text Notes 9040 1940 0    50   ~ 0
V_F ~~= 300mV \n@ IF = 1.5 mA
Wire Wire Line
	8880 1640 9260 1640
Wire Wire Line
	8880 2030 8880 2090
$Comp
L power:GND #PWR0356
U 1 1 5F83C660
P 10110 2190
F 0 "#PWR0356" H 10110 1940 50  0001 C CNN
F 1 "GND" H 10250 2110 50  0000 C CNN
F 2 "" H 10110 2190 50  0001 C CNN
F 3 "" H 10110 2190 50  0001 C CNN
	1    10110 2190
	1    0    0    -1  
$EndComp
Text Notes 8890 1620 0    50   ~ 0
3.59V
Text Notes 10170 1720 0    50   ~ 0
V(charge) = 3.4V +-0.2V\nV(nom) = 3V
Text Notes 9840 1620 0    50   ~ 0
3.29V
Wire Notes Line
	470  2360 11220 2360
Text Notes 490  610  0    100  ~ 0
NVSRAM
Text Notes 1090 580  0    50   ~ 0
- Infinite Access SRAM and 1M stores to NVSRAM
Text Notes 1600 1110 0    50   ~ 0
Battery Backup for RTC
Wire Wire Line
	3190 1650 3380 1650
Wire Wire Line
	3650 1650 3650 1450
Connection ~ 3650 1450
Wire Wire Line
	3650 1450 3690 1450
Text Notes 5250 1590 0    50   ~ 0
Interrupt: Programmable to drive output at interrupt\nSquare Wave: Drives programmable Square Wave\nCalibration Output: Drives ~~512 Hz Square used for calibration
Text Notes 5250 1790 0    50   ~ 0
SPI OUT
Text Notes 5250 1880 0    50   ~ 0
SPI IN
Text Notes 5250 1980 0    50   ~ 0
SPI CLOCK
Text Notes 5250 2080 0    50   ~ 0
SPI CHIP SELECT, ACTIVE-LOW
Text Notes 5250 2270 0    50   ~ 0
Hardware Store Busy. Indicates busy status of nvSRAM\nWhen driven LOW starts Hardware STORE
Text Notes 8290 650  0    100  ~ 0
Battery Charging Circuit
$Comp
L Device:R R1001
U 1 1 5FBFD053
P 8880 1070
F 0 "R1001" H 9030 1200 50  0000 R CNN
F 1 "0" V 8880 1100 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8810 1070 50  0001 C CNN
F 3 "~" H 8880 1070 50  0001 C CNN
	1    8880 1070
	-1   0    0    -1  
$EndComp
Text Notes 9470 1140 0    50   ~ 0
Optional:\nConnect if battery is rechargable,\notherwise leave unconnected
Wire Notes Line style solid
	9000 1040 9420 1040
Wire Notes Line style solid
	9000 1040 9040 990 
Wire Notes Line style solid
	9040 1090 9000 1040
Text Notes 490  1460 0    50   ~ 0
Must have\n<5% tol.
Wire Notes Line
	920  1350 1080 1330
Wire Notes Line
	1080 1330 1040 1320
Wire Notes Line
	1080 1330 1040 1360
Wire Notes Line
	820  1410 1070 1600
Wire Notes Line
	1070 1600 1020 1590
Wire Notes Line
	1070 1600 1050 1550
$Comp
L Device:R R1003
U 1 1 5F9316BF
P 2020 1850
F 0 "R1003" V 1950 1850 50  0000 C CNN
F 1 "10k" V 2020 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1950 1850 50  0001 C CNN
F 3 "~" H 2020 1850 50  0001 C CNN
	1    2020 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2190 1850 2170 1850
Wire Wire Line
	1790 1850 1870 1850
$Comp
L Device:R R1005
U 1 1 5F935871
P 2020 1950
F 0 "R1005" V 1940 1950 50  0000 C CNN
F 1 "10k" V 2020 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1950 1950 50  0001 C CNN
F 3 "~" H 2020 1950 50  0001 C CNN
	1    2020 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1870 1950 1790 1950
Wire Wire Line
	2190 1950 2170 1950
Wire Wire Line
	9560 1640 10110 1640
Wire Wire Line
	8880 920  8880 880 
Wire Wire Line
	10110 1380 10110 1440
$Comp
L power:+BATT #PWR0357
U 1 1 5F73DFF5
P 10110 1380
F 0 "#PWR0357" H 10110 1230 50  0001 C CNN
F 1 "+BATT" H 10125 1553 50  0000 C CNN
F 2 "" H 10110 1380 50  0001 C CNN
F 3 "" H 10110 1380 50  0001 C CNN
	1    10110 1380
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5F8BC50F
P 10110 1440
AR Path="/5F94DFD6/5F8BC50F" Ref="TP?"  Part="1" 
AR Path="/5F72B32C/5F8BC50F" Ref="TP1001"  Part="1" 
F 0 "TP1001" V 10110 1610 50  0000 L CNN
F 1 "TestPoint" H 10168 1467 50  0001 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 10310 1440 50  0001 C CNN
F 3 "~" H 10310 1440 50  0001 C CNN
	1    10110 1440
	0    1    1    0   
$EndComp
Connection ~ 10110 1440
Wire Wire Line
	10110 1440 10110 1640
Wire Wire Line
	10110 2030 10110 2190
$EndSCHEMATC
