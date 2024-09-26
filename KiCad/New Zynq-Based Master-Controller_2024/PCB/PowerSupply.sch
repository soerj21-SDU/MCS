EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 17
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
L Vikings_misc:GND-LV_Unfiltered #PWR0443
U 1 1 5F7E1368
P 640 1800
F 0 "#PWR0443" H 640 1550 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 1270 1660 50  0000 R CNN
F 2 "" H 640 1800 50  0001 C CNN
F 3 "" H 640 1800 50  0001 C CNN
	1    640  1800
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:LV_Unfiltered #PWR0444
U 1 1 5F7E1D1D
P 640 1440
F 0 "#PWR0444" H 640 1240 50  0001 C CNN
F 1 "LV_Unfiltered" V 550 1400 50  0000 L CNN
F 2 "" H 640 1490 50  0001 C CNN
F 3 "" H 640 1490 50  0001 C CNN
	1    640  1440
	1    0    0    -1  
$EndComp
Wire Notes Line
	2360 2360 2360 470 
$Comp
L Vikings_misc:LV #PWR0445
U 1 1 5F7EE36C
P 2795 1150
F 0 "#PWR0445" H 2795 1000 50  0001 C CNN
F 1 "LV" H 2785 1305 50  0000 C CNN
F 2 "" H 2795 1150 50  0001 C CNN
F 3 "" H 2795 1150 50  0001 C CNN
	1    2795 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3275 1470 3275 1150
$Comp
L Vikings_actives:Wurth_171050601 U1601
U 1 1 5F7F179C
P 4665 1450
F 0 "U1601" H 4665 2015 50  0000 C CNN
F 1 "Wurth_171050601" H 4665 1924 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-7_TabPin8" H 4665 2000 50  0001 C CNN
F 3 "http://katalog.we-online.com/pbs/datasheet/171050601.pdf" H 4665 2000 50  0001 C CNN
F 4 "Würth Elektronik" H 4665 1450 50  0001 C CNN "Manufacturer"
F 5 "171050601" H 4665 1450 50  0001 C CNN "Man. Part No."
F 6 "30W Buck DC/DC Converter, 6-36V in, 0.8-6V out, max 5A out" H 4665 1450 50  0001 C CNN "Description"
	1    4665 1450
	1    0    0    -1  
$EndComp
Connection ~ 4615 2100
Wire Wire Line
	4615 2100 4715 2100
Wire Wire Line
	3275 2100 3515 2100
Wire Wire Line
	5295 1750 5265 1750
Connection ~ 4715 2100
Wire Wire Line
	5265 1450 5435 1450
Wire Wire Line
	5825 1440 5825 1150
Wire Wire Line
	6735 2100 6415 2100
Wire Wire Line
	6735 2130 6735 2100
Wire Wire Line
	6755 1150 6755 1130
$Comp
L power:+5V #PWR0446
U 1 1 5F7FEF3B
P 6755 1130
F 0 "#PWR0446" H 6755 980 50  0001 C CNN
F 1 "+5V" H 6760 1270 50  0000 C CNN
F 2 "" H 6755 1130 50  0001 C CNN
F 3 "" H 6755 1130 50  0001 C CNN
	1    6755 1130
	1    0    0    -1  
$EndComp
Text Notes 480  920  0    100  ~ 0
Common-Mode Choke \nfor filtering LV \nBattery Supply
Text Notes 2380 630  0    100  ~ 0
5V Supply - up to 25W output (at 5A)
$Comp
L Device:CP C1604
U 1 1 5F801450
P 3275 1620
F 0 "C1604" H 2940 1630 50  0000 L CNN
F 1 "39uF" H 3070 1530 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x11.9" H 3313 1470 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/875075855005.pdf" H 3275 1620 50  0001 C CNN
F 4 "Würth" H 3275 1620 50  0001 C CNN "Manufacturer"
F 5 "875075855005" H 3275 1620 50  0001 C CNN "Man. Part no."
F 6 "63V, 20%, Alu. Polymer Capacitor, max 3.5 A ripple" H 3275 1620 50  0001 C CNN "Description"
	1    3275 1620
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1605
U 1 1 5F8037B5
P 3515 1620
F 0 "C1605" H 3530 1700 50  0000 L CNN
F 1 "680nF" H 3530 1540 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3553 1470 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012209046.pdf" H 3515 1620 50  0001 C CNN
F 4 "Würth" H 3515 1620 50  0001 C CNN "Manufacturer"
F 5 "885012209046" H 3515 1620 50  0001 C CNN "Man. Part. No"
F 6 "50V, 10%, MLCC, X7R, Class 2" H 3515 1620 50  0001 C CNN "Description"
	1    3515 1620
	1    0    0    -1  
$EndComp
Wire Wire Line
	3515 1470 3515 1150
Connection ~ 3515 1150
Connection ~ 3515 2100
Connection ~ 5825 1150
Connection ~ 5825 2100
Wire Wire Line
	5825 1150 6135 1150
$Comp
L Device:CP C1601
U 1 1 5F80BA3D
P 5825 1590
F 0 "C1601" H 5845 1670 50  0000 L CNN
F 1 "220uF" H 5835 1500 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x11.9" H 5863 1440 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/875115350002.pdf" H 5825 1590 50  0001 C CNN
F 4 "Würth" H 5825 1590 50  0001 C CNN "Manufacturer"
F 5 "875115350002" H 5825 1590 50  0001 C CNN "Man. Part no."
F 6 "16V, 20%, Alu. Polymer Capacitor, max 3.5 A ripple, ESR 20mOhm" H 5825 1590 50  0001 C CNN "Description"
	1    5825 1590
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1602
U 1 1 5F80C6B2
P 6135 1590
F 0 "C1602" H 6140 1670 50  0000 L CNN
F 1 "22uF" H 6150 1510 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6173 1440 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012108018.pdf" H 6135 1590 50  0001 C CNN
F 4 "Würth" H 6135 1590 50  0001 C CNN "Manufacturer"
F 5 "885012108018" H 6135 1590 50  0001 C CNN "Man. Part. No"
F 6 "16V, 20%, MLCC, X5R, Class 2" H 6135 1590 50  0001 C CNN "Description"
	1    6135 1590
	1    0    0    -1  
$EndComp
Wire Wire Line
	6135 1440 6135 1150
Connection ~ 6135 1150
Connection ~ 6135 2100
Wire Wire Line
	6135 2100 5825 2100
Wire Wire Line
	6415 1440 6415 1150
Wire Wire Line
	6415 1740 6415 2100
Connection ~ 6415 2100
Wire Wire Line
	6415 2100 6135 2100
$Comp
L Device:C C1603
U 1 1 5F813473
P 6415 1590
F 0 "C1603" H 6445 1670 50  0000 L CNN
F 1 "22uF" H 6445 1510 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6453 1440 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012108018.pdf" H 6415 1590 50  0001 C CNN
F 4 "Würth" H 6415 1590 50  0001 C CNN "Manufacturer"
F 5 "885012108018" H 6415 1590 50  0001 C CNN "Man. Part. No"
F 6 "16V, 20%, MLCC, X5R, Class 2" H 6415 1590 50  0001 C CNN "Description"
	1    6415 1590
	1    0    0    -1  
$EndComp
Wire Wire Line
	6135 1740 6135 2100
Wire Wire Line
	5825 1740 5825 2100
Wire Wire Line
	4715 1950 4715 2100
Wire Wire Line
	4615 1950 4615 2100
Wire Wire Line
	3515 1770 3515 2100
Wire Wire Line
	3275 1770 3275 2100
Wire Wire Line
	4715 2100 5295 2100
$Comp
L Device:C C1611
U 1 1 5F8223E7
P 5295 1920
F 0 "C1611" H 4950 1940 50  0000 L CNN
F 1 "470nF" H 5040 1840 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5333 1770 50  0001 C CNN
F 3 "~" H 5295 1920 50  0001 C CNN
	1    5295 1920
	1    0    0    -1  
$EndComp
Wire Wire Line
	5295 1750 5295 1770
Wire Wire Line
	5295 2070 5295 2100
Connection ~ 5295 2100
Wire Wire Line
	3515 2100 3995 2100
$Comp
L Device:R_Small R1605
U 1 1 5F8261F9
P 3995 1930
F 0 "R1605" V 4070 1800 50  0000 L CNN
F 1 "1k" V 3995 1880 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3995 1930 50  0001 C CNN
F 3 "~" H 3995 1930 50  0001 C CNN
	1    3995 1930
	1    0    0    -1  
$EndComp
Wire Wire Line
	3995 1750 3995 1830
Wire Wire Line
	3995 1750 4065 1750
Wire Wire Line
	3995 2030 3995 2100
Connection ~ 3995 2100
Wire Wire Line
	3995 2100 4615 2100
$Comp
L Vikings_misc:LV #PWR0447
U 1 1 5F82E0E7
P 7120 1210
F 0 "#PWR0447" H 7120 1060 50  0001 C CNN
F 1 "LV" H 7115 1365 50  0000 C CNN
F 2 "" H 7120 1210 50  0001 C CNN
F 3 "" H 7120 1210 50  0001 C CNN
	1    7120 1210
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1530 7500 1210
Connection ~ 8840 2160
Wire Wire Line
	8840 2160 8940 2160
Wire Wire Line
	8290 1510 8250 1510
Text HLabel 8250 1510 0    50   Input ~ 0
3V3_EN
Wire Wire Line
	7500 2160 7740 2160
Wire Wire Line
	7500 1210 7740 1210
Wire Wire Line
	9520 1810 9490 1810
Connection ~ 8940 2160
Wire Wire Line
	9490 1510 9660 1510
Wire Wire Line
	10050 1500 10050 1210
Wire Wire Line
	10980 2160 10640 2160
Text Notes 6905 670  0    100  ~ 0
3V3 Supply - up to 16.8W output (at 5A)
$Comp
L Device:CP C1609
U 1 1 5F82E12E
P 7500 1680
F 0 "C1609" H 7160 1680 50  0000 L CNN
F 1 "39uF" H 7310 1590 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x11.9" H 7538 1530 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/875075855005.pdf" H 7500 1680 50  0001 C CNN
F 4 "Würth" H 7500 1680 50  0001 C CNN "Manufacturer"
F 5 "875075855005" H 7500 1680 50  0001 C CNN "Man. Part no."
F 6 "63V, 20%, Alu. Polymer Capacitor, max 3.5 A ripple" H 7500 1680 50  0001 C CNN "Description"
	1    7500 1680
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1610
U 1 1 5F82E137
P 7740 1680
F 0 "C1610" H 7750 1760 50  0000 L CNN
F 1 "680nF" H 7760 1600 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 7778 1530 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012209046.pdf" H 7740 1680 50  0001 C CNN
F 4 "Würth" H 7740 1680 50  0001 C CNN "Manufacturer"
F 5 "885012209046" H 7740 1680 50  0001 C CNN "Man. Part. No"
F 6 "50V, 10%, MLCC, X7R, Class 2" H 7740 1680 50  0001 C CNN "Description"
	1    7740 1680
	1    0    0    -1  
$EndComp
Wire Wire Line
	7740 1530 7740 1210
Connection ~ 7740 1210
Wire Wire Line
	7740 1210 8290 1210
Connection ~ 7740 2160
Connection ~ 10050 1210
Connection ~ 10050 2160
Wire Wire Line
	10050 1210 10360 1210
$Comp
L Device:CP C1606
U 1 1 5F82E148
P 10050 1650
F 0 "C1606" H 10070 1730 50  0000 L CNN
F 1 "220uF" H 10060 1560 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x11.9" H 10088 1500 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/875115350002.pdf" H 10050 1650 50  0001 C CNN
F 4 "Würth" H 10050 1650 50  0001 C CNN "Manufacturer"
F 5 "875115350002" H 10050 1650 50  0001 C CNN "Man. Part no."
F 6 "16V, 20%, Alu. Polymer Capacitor, max 3.5 A ripple, ESR 20mOhm" H 10050 1650 50  0001 C CNN "Description"
	1    10050 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1607
U 1 1 5F82E151
P 10360 1650
F 0 "C1607" H 10390 1730 50  0000 L CNN
F 1 "22uF" H 10390 1570 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10398 1500 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012108018.pdf" H 10360 1650 50  0001 C CNN
F 4 "Würth" H 10360 1650 50  0001 C CNN "Manufacturer"
F 5 "885012108018" H 10360 1650 50  0001 C CNN "Man. Part. No"
F 6 "16V, 20%, MLCC, X5R, Class 2" H 10360 1650 50  0001 C CNN "Description"
	1    10360 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10360 1500 10360 1210
Connection ~ 10360 1210
Connection ~ 10360 2160
Wire Wire Line
	10360 2160 10050 2160
Wire Wire Line
	10640 1500 10640 1210
Wire Wire Line
	10640 1800 10640 2160
Connection ~ 10640 2160
Wire Wire Line
	10640 2160 10360 2160
$Comp
L Device:C C1608
U 1 1 5F82E165
P 10640 1650
F 0 "C1608" H 10670 1730 50  0000 L CNN
F 1 "22uF" H 10670 1570 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10678 1500 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012108018.pdf" H 10640 1650 50  0001 C CNN
F 4 "Würth" H 10640 1650 50  0001 C CNN "Manufacturer"
F 5 "885012108018" H 10640 1650 50  0001 C CNN "Man. Part. No"
F 6 "16V, 20%, MLCC, X5R, Class 2" H 10640 1650 50  0001 C CNN "Description"
	1    10640 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10360 1800 10360 2160
Wire Wire Line
	10050 1800 10050 2160
Wire Wire Line
	8940 2010 8940 2160
Wire Wire Line
	8840 2010 8840 2160
Wire Wire Line
	7740 1830 7740 2160
Wire Wire Line
	8940 2160 9520 2160
Wire Wire Line
	9520 1810 9520 1830
Wire Wire Line
	9520 2130 9520 2160
Connection ~ 9520 2160
Wire Wire Line
	7740 2160 8220 2160
$Comp
L Device:R_Small R1606
U 1 1 5F82E17E
P 8220 1990
F 0 "R1606" V 8300 1870 50  0000 L CNN
F 1 "1k" V 8220 1940 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8220 1990 50  0001 C CNN
F 3 "~" H 8220 1990 50  0001 C CNN
	1    8220 1990
	1    0    0    -1  
$EndComp
Wire Wire Line
	8220 1810 8220 1890
Wire Wire Line
	8220 1810 8290 1810
Wire Wire Line
	8220 2090 8220 2160
Connection ~ 8220 2160
Wire Wire Line
	8220 2160 8840 2160
Wire Notes Line
	470  2360 11220 2360
$Comp
L Vikings_actives:LMS33460 U1604
U 1 1 5F8338EA
P 9510 3980
AR Path="/5F8338EA" Ref="U1604"  Part="1" 
AR Path="/5F8AF573/5F8338EA" Ref="U1604"  Part="1" 
F 0 "U1604" H 9510 4355 50  0000 C CNN
F 1 "LMS33460" H 9510 4264 50  0000 C CNN
F 2 "Vikings_devices:SC70-5" H 9410 3780 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lms33460.pdf" H 9410 3780 50  0001 C CNN
	1    9510 3980
	1    0    0    -1  
$EndComp
Wire Wire Line
	9860 3830 10270 3830
Text HLabel 10270 3830 2    50   BiDi ~ 0
PG_MODULE
Wire Wire Line
	9160 4030 9100 4030
Wire Wire Line
	9100 4030 9100 4129
Wire Wire Line
	9100 4130 9160 4130
Wire Wire Line
	9160 3830 9100 3830
Wire Wire Line
	9100 3830 9100 3810
Text Notes 8280 3390 0    100  ~ 0
Voltage Supervisor for \n"Power Good" Monitoring
Text Notes 9240 3520 0    50   ~ 0
Triggers on Vin<3V
Text Notes 480  2510 0    100  ~ 0
12V Supply - Boost Converter from 5V supply
$Comp
L Vikings_actives:MCP1663 U1603
U 1 1 5F8781D7
P 1960 3040
F 0 "U1603" H 2410 2160 100 0000 L CNN
F 1 "MCP1663" H 1610 2150 100 0000 L CNN
F 2 "Vikings_devices:TDFN-8-1EP_3x2mm_P0.5mm_EP1.80x1.65mm_ThermalVias" H 1960 3040 100 0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/268/20005406A-738982.pdf" H 1960 3040 100 0001 C CNN
F 4 "Microchip" H 1960 3040 100 0001 C CNN "Manufacturer"
F 5 "MCP1663" H 1960 3040 100 0001 C CNN "Man. Part No."
	1    1960 3040
	1    0    0    -1  
$EndComp
Wire Wire Line
	1860 3190 1710 3190
$Comp
L power:+5V #PWR0448
U 1 1 5F87C9A0
P 830 2900
F 0 "#PWR0448" H 830 2750 50  0001 C CNN
F 1 "+5V" H 710 2975 50  0000 C CNN
F 2 "" H 830 2900 50  0001 C CNN
F 3 "" H 830 2900 50  0001 C CNN
	1    830  2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	830  3330 830  3190
Wire Wire Line
	830  3630 830  3778
Wire Wire Line
	830  3780 1070 3780
Wire Wire Line
	2210 3780 2210 3690
Wire Wire Line
	2210 3780 2310 3780
Wire Wire Line
	2310 3780 2310 3690
Connection ~ 2210 3780
Wire Wire Line
	2310 3780 2410 3780
Wire Wire Line
	2410 3780 2410 3690
Connection ~ 2310 3780
Connection ~ 2410 3780
$Comp
L Device:C C1616
U 1 1 5F8B7929
P 1070 3480
F 0 "C1616" H 1150 3460 50  0000 L CNN
F 1 "10uF" H 1080 3390 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1108 3330 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012209005.pdf" H 1070 3480 50  0001 C CNN
F 4 "Würth" H 1070 3480 50  0001 C CNN "Manufacturer"
F 5 "885012209005" H 1070 3480 50  0001 C CNN "Man. Part. No"
F 6 "10V, 10%, MLCC, X7R, Class 2" H 1070 3480 50  0001 C CNN "Description"
	1    1070 3480
	1    0    0    -1  
$EndComp
Wire Wire Line
	1070 3330 1070 3190
Connection ~ 1070 3190
Wire Wire Line
	1070 3190 830  3190
Wire Wire Line
	1070 3630 1070 3780
Connection ~ 1070 3780
$Comp
L Device:R R1608
U 1 1 5F8CCC3D
P 3100 3550
F 0 "R1608" V 3180 3420 50  0000 L CNN
F 1 "187k" V 3100 3450 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3030 3550 50  0001 C CNN
F 3 "~" H 3100 3550 50  0001 C CNN
	1    3100 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1607
U 1 1 5F8CD7DE
P 3100 3140
F 0 "R1607" V 3180 3020 50  0000 L CNN
F 1 "1.65M" V 3100 3030 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3030 3140 50  0001 C CNN
F 3 "~" H 3100 3140 50  0001 C CNN
	1    3100 3140
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3340 3100 3290
Wire Wire Line
	3100 3400 3100 3340
Connection ~ 3100 3340
Wire Wire Line
	2410 3780 3100 3780
Wire Wire Line
	3100 3700 3100 3780
Connection ~ 3100 3780
Wire Wire Line
	3100 3780 3560 3780
Wire Wire Line
	2760 3340 3100 3340
$Comp
L Device:C C1615
U 1 1 5F8FF3F0
P 830 3480
F 0 "C1615" H 580 3560 50  0000 L CNN
F 1 "10uF" H 630 3400 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 868 3330 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012209005.pdf" H 830 3480 50  0001 C CNN
F 4 "Würth" H 830 3480 50  0001 C CNN "Manufacturer"
F 5 "885012209005" H 830 3480 50  0001 C CNN "Man. Part. No"
F 6 "10V, 10%, MLCC, X7R, Class 2" H 830 3480 50  0001 C CNN "Description"
	1    830  3480
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1613
U 1 1 5F900E4C
P 3560 3310
F 0 "C1613" H 3310 3390 50  0000 L CNN
F 1 "10uF" H 3380 3230 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3598 3160 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012209014.pdf" H 3560 3310 50  0001 C CNN
F 4 "Würth" H 3560 3310 50  0001 C CNN "Manufacturer"
F 5 "885012209014" H 3560 3310 50  0001 C CNN "Man. Part. No"
F 6 "16V, 10%, MLCC, X7R, Class 2" H 3560 3310 50  0001 C CNN "Description"
	1    3560 3310
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1614
U 1 1 5F90604F
P 3800 3310
F 0 "C1614" H 3810 3390 50  0000 L CNN
F 1 "10uF" H 3800 3220 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3838 3160 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012209014.pdf" H 3800 3310 50  0001 C CNN
F 4 "Würth" H 3800 3310 50  0001 C CNN "Manufacturer"
F 5 "885012209014" H 3800 3310 50  0001 C CNN "Man. Part. No"
F 6 "16V, 10%, MLCC, X7R, Class 2" H 3800 3310 50  0001 C CNN "Description"
	1    3800 3310
	1    0    0    -1  
$EndComp
Wire Wire Line
	3560 3460 3560 3780
Connection ~ 3560 3780
Wire Wire Line
	3560 3780 3800 3780
Wire Wire Line
	3560 3160 3560 2880
Wire Wire Line
	3560 2880 3100 2880
Wire Wire Line
	3100 2880 3100 2990
Wire Wire Line
	3800 2880 3800 3160
Connection ~ 3560 2880
Wire Wire Line
	3100 2770 3100 2880
Connection ~ 3100 2880
$Comp
L Device:L L1601
U 1 1 5F958AA4
P 1990 2770
F 0 "L1601" V 2120 2770 50  0000 C CNN
F 1 "4.7uH" V 2050 2770 50  0000 C CNN
F 2 "Vikings_devices:Wurth_LQS_4018" H 1990 2770 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/74404042047.pdf" H 1990 2770 50  0001 C CNN
F 4 "Würth" V 1990 2770 50  0001 C CNN "Manufacturer"
F 5 "74404042047" V 1990 2770 50  0001 C CNN "Man. Part No."
F 6 "I_sat = 2.2A, I_R = 1.7A, 70 mOhm RDC" V 1990 2770 50  0001 C CNN "Description"
	1    1990 2770
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2980 2770 3100 2770
$Comp
L Vikings_passives:MBRM120 D1602
U 1 1 5F951C44
P 2880 2770
F 0 "D1602" H 3000 2900 50  0000 C CNN
F 1 "MBRM120" H 2880 2650 50  0000 C CNN
F 2 "Diode_SMD:D_Powermite_AK" H 2880 2770 100 0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/308/MBRM120L-D-1810779.pdf" H 2880 2770 100 0001 C CNN
F 4 "ON Semiconductor" H 3030 3170 100 0001 C CNN "Manufacturer"
F 5 "MBRM120" H 2980 3170 100 0001 C CNN "Man. Part No."
	1    2880 2770
	-1   0    0    1   
$EndComp
Wire Wire Line
	2630 2770 2310 2770
Wire Wire Line
	1840 2770 1710 2770
Wire Wire Line
	1710 2770 1710 3190
Wire Wire Line
	2310 2940 2310 2770
Connection ~ 2310 2770
Wire Wire Line
	2310 2770 2140 2770
$Comp
L power:+12V #PWR0449
U 1 1 5F97EDBD
P 4200 2860
F 0 "#PWR0449" H 4200 2710 50  0001 C CNN
F 1 "+12V" H 4160 3020 50  0000 C CNN
F 2 "" H 4200 2860 50  0001 C CNN
F 3 "" H 4200 2860 50  0001 C CNN
	1    4200 2860
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1609
U 1 1 5F98F552
P 1750 3590
F 0 "R1609" V 1830 3470 50  0000 L CNN
F 1 "1k" V 1750 3540 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1680 3590 50  0001 C CNN
F 3 "~" H 1750 3590 50  0001 C CNN
	1    1750 3590
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3440 1750 3390
Wire Wire Line
	1750 3390 1860 3390
Wire Wire Line
	1750 3740 1750 3780
Wire Wire Line
	1750 3780 2210 3780
Wire Wire Line
	1070 3190 1710 3190
Connection ~ 1710 3190
Wire Wire Line
	1070 3780 1750 3780
Connection ~ 1750 3780
$Comp
L Device:R R1601
U 1 1 5F9B3409
P 5435 1300
F 0 "R1601" V 5520 1180 50  0000 L CNN
F 1 "11.3k" V 5435 1190 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5365 1300 50  0001 C CNN
F 3 "~" H 5435 1300 50  0001 C CNN
	1    5435 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5265 1150 5435 1150
Connection ~ 5435 1150
Wire Wire Line
	5435 1150 5825 1150
Connection ~ 5435 1450
$Comp
L Device:R R1603
U 1 1 5F9C05F1
P 5435 1750
F 0 "R1603" V 5520 1630 50  0000 L CNN
F 1 "2.15k" V 5435 1640 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5365 1750 50  0001 C CNN
F 3 "~" H 5435 1750 50  0001 C CNN
	1    5435 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5295 2100 5435 2100
Wire Wire Line
	5435 1450 5435 1600
Wire Wire Line
	5435 1900 5435 2100
Connection ~ 5435 2100
Wire Wire Line
	5435 2100 5825 2100
$Comp
L Device:R R1602
U 1 1 5F9D3CEE
P 9660 1360
F 0 "R1602" V 9750 1230 50  0000 L CNN
F 1 "10.7k" V 9660 1250 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9590 1360 50  0001 C CNN
F 3 "~" H 9660 1360 50  0001 C CNN
	1    9660 1360
	1    0    0    -1  
$EndComp
Wire Wire Line
	9490 1210 9660 1210
Connection ~ 9660 1210
Wire Wire Line
	9660 1210 10050 1210
Connection ~ 9660 1510
Wire Wire Line
	9660 1510 9660 1640
$Comp
L Device:R R1604
U 1 1 5F9FB804
P 9660 1790
F 0 "R1604" V 9750 1660 50  0000 L CNN
F 1 "3.4k" V 9660 1720 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9590 1790 50  0001 C CNN
F 3 "~" H 9660 1790 50  0001 C CNN
	1    9660 1790
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1612
U 1 1 5F82E173
P 9520 1980
F 0 "C1612" H 9150 2010 50  0000 L CNN
F 1 "470nF" H 9280 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9558 1830 50  0001 C CNN
F 3 "~" H 9520 1980 50  0001 C CNN
	1    9520 1980
	1    0    0    -1  
$EndComp
Wire Wire Line
	9520 2160 9660 2160
Wire Wire Line
	9660 1940 9660 2160
Connection ~ 9660 2160
Wire Wire Line
	9660 2160 10050 2160
Wire Wire Line
	1700 3390 1750 3390
Connection ~ 1750 3390
Wire Wire Line
	1500 3390 1470 3390
Text HLabel 1470 3390 0    50   Input ~ 0
3V3_EN
Text Notes 2670 3430 0    50   ~ 0
1.227V Ref
$Comp
L Device:Jumper_NC_Small JP1601
U 1 1 5FA2BBDC
P 1600 3390
F 0 "JP1601" H 1560 3320 50  0000 C CNN
F 1 "Jumper" H 1600 3480 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1600 3390 50  0001 C CNN
F 3 "~" H 1600 3390 50  0001 C CNN
	1    1600 3390
	1    0    0    -1  
$EndComp
Text Notes 870  2720 0    50   ~ 0
Opportunity to disable, if\nno 12V supply is needed
Wire Notes Line
	1510 2830 1590 3280
Wire Notes Line
	1590 3280 1610 3250
Wire Notes Line
	1590 3280 1550 3270
Text Notes 5165 1610 0    50   ~ 0
0.796V \nRef
Text Notes 9390 1690 0    50   ~ 0
0.796V \nRef
$Comp
L power:+3.3V #PWR0450
U 1 1 601E6698
P 9100 3810
F 0 "#PWR0450" H 9100 3660 50  0001 C CNN
F 1 "+3.3V" H 9115 3983 50  0000 C CNN
F 2 "" H 9100 3810 50  0001 C CNN
F 3 "" H 9100 3810 50  0001 C CNN
	1    9100 3810
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0451
U 1 1 60203716
P 6735 2130
F 0 "#PWR0451" H 6735 1880 50  0001 C CNN
F 1 "GND" H 6736 1989 50  0000 C CNN
F 2 "" H 6735 2130 50  0001 C CNN
F 3 "" H 6735 2130 50  0001 C CNN
	1    6735 2130
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0452
U 1 1 6020E902
P 10980 2160
F 0 "#PWR0452" H 10980 1910 50  0001 C CNN
F 1 "GND" H 10981 2019 50  0000 C CNN
F 2 "" H 10980 2160 50  0001 C CNN
F 3 "" H 10980 2160 50  0001 C CNN
	1    10980 2160
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0453
U 1 1 6020FDA0
P 9100 4129
F 0 "#PWR0453" H 9100 3879 50  0001 C CNN
F 1 "GND" H 9101 3988 50  0000 C CNN
F 2 "" H 9100 4129 50  0001 C CNN
F 3 "" H 9100 4129 50  0001 C CNN
	1    9100 4129
	1    0    0    -1  
$EndComp
Connection ~ 9100 4129
Wire Wire Line
	9100 4129 9100 4130
$Comp
L power:GND #PWR0454
U 1 1 60210B74
P 4210 3790
F 0 "#PWR0454" H 4210 3540 50  0001 C CNN
F 1 "GND" H 4211 3649 50  0000 C CNN
F 2 "" H 4210 3790 50  0001 C CNN
F 3 "" H 4210 3790 50  0001 C CNN
	1    4210 3790
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0455
U 1 1 602136CB
P 830 3778
F 0 "#PWR0455" H 830 3528 50  0001 C CNN
F 1 "GND" H 831 3637 50  0000 C CNN
F 2 "" H 830 3778 50  0001 C CNN
F 3 "" H 830 3778 50  0001 C CNN
	1    830  3778
	1    0    0    -1  
$EndComp
Connection ~ 830  3778
Wire Wire Line
	830  3778 830  3780
NoConn ~ 4065 1450
$Comp
L Vikings_misc:GND-LV #PWR0456
U 1 1 5F867C05
P 3275 2100
F 0 "#PWR0456" H 3275 1850 50  0001 C CNN
F 1 "GND-LV" H 3280 1927 50  0000 C CNN
F 2 "" H 3275 2100 50  0001 C CNN
F 3 "" H 3275 2100 50  0001 C CNN
	1    3275 2100
	1    0    0    -1  
$EndComp
Connection ~ 3275 2100
$Comp
L Vikings_misc:GND-LV #PWR0457
U 1 1 5F869A13
P 7500 2160
F 0 "#PWR0457" H 7500 1910 50  0001 C CNN
F 1 "GND-LV" H 7505 2015 50  0000 C CNN
F 2 "" H 7500 2160 50  0001 C CNN
F 3 "" H 7500 2160 50  0001 C CNN
	1    7500 2160
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1830 7500 2160
Connection ~ 7500 2160
$Comp
L Vikings_passives:SMA4F31AY D1601
U 1 1 5F8D95CB
P 640 1570
F 0 "D1601" V 570 1510 50  0000 R CNN
F 1 "SMA4F31AY" V 500 1510 50  0000 R CNN
F 2 "Vikings_devices:D_SMA_Small-Pads" H 640 1570 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/389/dm00488081-1799419.pdf" H 640 1570 50  0001 C CNN
F 4 "Vishay" V 640 1570 50  0001 C CNN "Manufacturer"
F 5 "SMA4F31AY" V 640 1570 50  0001 C CNN "Man. Part No."
F 6 "ESD Protection Diode, 36V Breakdown, 31V Working Voltage" V 640 1570 50  0001 C CNN "Description"
	1    640  1570
	0    -1   -1   0   
$EndComp
Text Notes 3005 1265 2    50   ~ 0
9V < LV < 36V
Text Notes 7025 1420 1    50   ~ 0
9V < LV < 36V
Text Notes 3915 920  0    50   ~ 0
6V < Vin < 36V
Text Notes 8150 985  0    50   ~ 0
6V < Vin < 36V
Text Notes 5100 1010 0    50   ~ 0
Vout = (RFBT/RFBB + 1)VFB
Wire Notes Line
	8270 2360 8270 4340
Wire Wire Line
	6485 1150 6415 1150
Connection ~ 6415 1150
Wire Wire Line
	10730 1210 10640 1210
Connection ~ 10640 1210
Wire Wire Line
	3890 2880 3800 2880
Connection ~ 3800 2880
Wire Wire Line
	4200 2880 4200 2860
Wire Wire Line
	3800 3460 3800 3780
Wire Wire Line
	3800 3780 4210 3780
Wire Wire Line
	4210 3780 4210 3790
Connection ~ 3800 3780
$Comp
L Vikings_actives:Wurth_171050601 U1602
U 1 1 5F858DFC
P 8890 1510
F 0 "U1602" H 8890 2075 50  0000 C CNN
F 1 "Wurth_171050601" H 8890 1984 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-7_TabPin8" H 8890 2060 50  0001 C CNN
F 3 "http://katalog.we-online.com/pbs/datasheet/171050601.pdf" H 8890 2060 50  0001 C CNN
F 4 "Würth Elektronik" H 8890 1510 50  0001 C CNN "Manufacturer"
F 5 "171050601" H 8890 1510 50  0001 C CNN "Man. Part No."
F 6 "30W Buck DC/DC Converter, 6-36V in, 0.8-6V out, max 5A out" H 8890 1510 50  0001 C CNN "Description"
	1    8890 1510
	1    0    0    -1  
$EndComp
Wire Wire Line
	640  1770 640  1800
Connection ~ 1750 1470
Wire Wire Line
	1750 1470 1860 1470
Wire Wire Line
	640  1770 1270 1770
Connection ~ 1270 1770
$Comp
L Vikings_misc:GND-LV #PWR0459
U 1 1 5F865B4E
P 1830 1790
F 0 "#PWR0459" H 1830 1540 50  0001 C CNN
F 1 "GND-LV" H 1830 1650 50  0000 C CNN
F 2 "" H 1830 1790 50  0001 C CNN
F 3 "" H 1830 1790 50  0001 C CNN
	1    1830 1790
	1    0    0    -1  
$EndComp
Connection ~ 1750 1770
Wire Wire Line
	1830 1770 1830 1790
Wire Wire Line
	1750 1770 1830 1770
Wire Wire Line
	1270 1720 1270 1770
Wire Wire Line
	1270 1470 1270 1520
Wire Wire Line
	1750 1770 1710 1770
Wire Wire Line
	1750 1720 1750 1770
Wire Wire Line
	1710 1720 1750 1720
Wire Wire Line
	1750 1520 1710 1520
Wire Wire Line
	1750 1470 1750 1520
Wire Wire Line
	1710 1470 1750 1470
Wire Wire Line
	1270 1770 1310 1770
Wire Wire Line
	1310 1720 1270 1720
Wire Wire Line
	1270 1520 1310 1520
Wire Wire Line
	1310 1470 1270 1470
$Comp
L Vikings_passives:Wuerth_744290560 FL1601
U 1 1 5F7DBA37
P 1510 1620
F 0 "FL1601" H 1510 1440 50  0000 C CNN
F 1 "Wuerth_744290560" H 1580 1880 50  0000 C CNN
F 2 "Vikings_devices:WE-UCF_1712_16.6x12.5mm" H 1510 1370 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/744290560.pdf" V 1510 1660 50  0001 C CNN
F 4 "Würth Elektronik" H 1510 1620 50  0001 C CNN "Manufacturer"
F 5 "744290560" H 1510 1620 50  0001 C CNN "Man. Part No."
F 6 "Common Mode Choke, 80V, 7A, 56uH, 4.7mOhm DC Resistance" H 1510 1620 50  0001 C CNN "Description"
	1    1510 1620
	1    0    0    -1  
$EndComp
Connection ~ 1270 1470
$Comp
L Device:Fuse_Small F1601
U 1 1 5F8EFA09
P 6585 1150
F 0 "F1601" H 6580 1090 50  0000 C CNN
F 1 "5A" H 6580 1210 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 6585 1150 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 6585 1150 50  0001 C CNN
F 4 "Littelfuse" H 6585 1150 50  0001 C CNN "Manufacturer"
F 5 "0157005.DR" H 6585 1150 50  0001 C CNN "Man. Part No."
	1    6585 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F1602
U 1 1 5F8F0A03
P 10830 1210
F 0 "F1602" H 10830 1270 50  0000 C CNN
F 1 "5A" H 10830 1160 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 10830 1210 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 10830 1210 50  0001 C CNN
F 4 "Littelfuse" H 10830 1210 50  0001 C CNN "Manufacturer"
F 5 "0157005.DR" H 10830 1210 50  0001 C CNN "Man. Part No."
	1    10830 1210
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F1604
U 1 1 5F8F151B
P 3990 2880
F 0 "F1604" H 3990 2830 50  0000 C CNN
F 1 "375 mA" H 3990 2940 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 3990 2880 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 3990 2880 50  0001 C CNN
F 4 "Littelfuse" H 3990 2880 50  0001 C CNN "Manufacturer"
F 5 "0157.375DR" H 3990 2880 50  0001 C CNN "Man. Part No."
	1    3990 2880
	1    0    0    -1  
$EndComp
Wire Notes Line
	480  4330 11220 4330
$Comp
L Device:Fuse_Small F1606
U 1 1 5F930430
P 9480 2810
F 0 "F1606" H 9480 2750 50  0000 C CNN
F 1 "1A" H 9480 2870 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 9480 2810 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 9480 2810 50  0001 C CNN
F 4 "Littelfuse" H 9480 2810 50  0001 C CNN "Manufacturer"
F 5 "0157001.DR" H 9480 2810 50  0001 C CNN "Man. Part No."
	1    9480 2810
	1    0    0    -1  
$EndComp
Wire Wire Line
	9070 2810 9070 2790
Wire Wire Line
	9900 2810 9900 2790
$Comp
L power:+5V #PWR0463
U 1 1 5F942296
P 9070 2790
F 0 "#PWR0463" H 9070 2640 50  0001 C CNN
F 1 "+5V" H 9070 2930 50  0000 C CNN
F 2 "" H 9070 2790 50  0001 C CNN
F 3 "" H 9070 2790 50  0001 C CNN
	1    9070 2790
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:+5V_Sensor #PWR0464
U 1 1 5F94275A
P 9900 2790
F 0 "#PWR0464" H 9900 2640 50  0001 C CNN
F 1 "+5V_Sensor" H 9900 2930 50  0000 C CNN
F 2 "" H 9900 2790 50  0001 C CNN
F 3 "" H 9900 2790 50  0001 C CNN
	1    9900 2790
	1    0    0    -1  
$EndComp
Text Notes 9240 2590 0    50   ~ 0
Sensor Supply
Wire Wire Line
	640  1440 640  1470
Text Notes 510  2140 0    50   ~ 0
36V Breakdown\nVoltage
$Comp
L Connector:TestPoint TP?
U 1 1 5FAE7498
P 6755 1150
AR Path="/5F94DFD6/5FAE7498" Ref="TP?"  Part="1" 
AR Path="/5F8AF573/5FAE7498" Ref="TP1602"  Part="1" 
F 0 "TP1602" H 6790 1350 50  0000 L CNN
F 1 "TestPoint" H 6813 1177 50  0001 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 6955 1150 50  0001 C CNN
F 3 "~" H 6955 1150 50  0001 C CNN
	1    6755 1150
	-1   0    0    1   
$EndComp
Connection ~ 6755 1150
$Comp
L Connector:TestPoint TP?
U 1 1 5FAF2E33
P 4200 2880
AR Path="/5F94DFD6/5FAF2E33" Ref="TP?"  Part="1" 
AR Path="/5F8AF573/5FAF2E33" Ref="TP1604"  Part="1" 
F 0 "TP1604" H 4255 3025 50  0000 L CNN
F 1 "TestPoint" H 4258 2907 50  0001 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 4400 2880 50  0001 C CNN
F 3 "~" H 4400 2880 50  0001 C CNN
	1    4200 2880
	-1   0    0    1   
$EndComp
Connection ~ 4200 2880
$Comp
L Connector:TestPoint TP?
U 1 1 5FAF8C1A
P 3610 1150
AR Path="/5F94DFD6/5FAF8C1A" Ref="TP?"  Part="1" 
AR Path="/5F8AF573/5FAF8C1A" Ref="TP1601"  Part="1" 
F 0 "TP1601" H 3400 1360 50  0000 L CNN
F 1 "TestPoint" H 3668 1177 50  0001 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 3810 1150 50  0001 C CNN
F 3 "~" H 3810 1150 50  0001 C CNN
	1    3610 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3275 1150 3515 1150
$Comp
L Device:Ferrite_Bead_Small FB1602
U 1 1 5FA17E3F
P 7250 1210
F 0 "FB1602" V 7035 1240 50  0000 C CNN
F 1 "56R @ 100 MHz" V 7125 1485 50  0000 C CNN
F 2 "Vikings_devices:Wurth_78279223560" V 7180 1210 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/78279223560.pdf" H 7250 1210 50  0001 C CNN
F 4 "78279223560" V 7250 1210 50  0001 C CNN "Name"
	1    7250 1210
	0    1    1    0   
$EndComp
Text Notes 7205 940  0    50   ~ 0
10 A
Wire Wire Line
	7350 1210 7500 1210
Connection ~ 7500 1210
Wire Wire Line
	7120 1210 7150 1210
Wire Notes Line
	6865 2360 6865 475 
$Comp
L Device:Ferrite_Bead_Small FB1601
U 1 1 5FAA9043
P 3085 1150
F 0 "FB1601" V 2870 1105 50  0000 C CNN
F 1 "56R @ 100 MHz" V 2950 1360 50  0000 C CNN
F 2 "Vikings_devices:Wurth_78279223560" V 3015 1150 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/78279223560.pdf" H 3085 1150 50  0001 C CNN
F 4 "78279223560" V 3085 1150 50  0001 C CNN "Name"
	1    3085 1150
	0    1    1    0   
$EndComp
Text Notes 2970 880  0    50   ~ 0
10 A
Wire Wire Line
	3185 1150 3275 1150
Connection ~ 3275 1150
Wire Wire Line
	2795 1150 2985 1150
Wire Wire Line
	830  2940 830  2900
Wire Wire Line
	830  3140 830  3190
Connection ~ 830  3190
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5FB00952
P 830 3040
AR Path="/5F5A48E4/5FB00952" Ref="FB?"  Part="1" 
AR Path="/5F8AF573/5FB00952" Ref="FB1603"  Part="1" 
F 0 "FB1603" H 975 3105 50  0000 C CNN
F 1 "100R @ 100 MHz" H 1235 3025 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 760 3040 50  0001 C CNN
F 3 "https://www.mouser.dk/ProductDetail/TDK/MPZ2012S101AT000?qs=sGAEpiMZZMt1hubY80%2Fs8Hp09N5ImNkmxVgtQbJATBs%3D" H 830 3040 50  0001 C CNN
F 4 "MPZ2012S101AT000" V 830 3040 50  0001 C CNN "Name"
	1    830  3040
	1    0    0    -1  
$EndComp
Text Notes 900  2935 0    50   ~ 0
4 A
Connection ~ 640  1470
Connection ~ 640  1770
$Comp
L Device:Fuse_Small F1603
U 1 1 5FA33D49
P 860 1470
F 0 "F1603" H 860 1420 50  0000 C CNN
F 1 "7A" H 860 1520 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 860 1470 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 860 1470 50  0001 C CNN
F 4 "Littelfuse" H 860 1470 50  0001 C CNN "Manufacturer"
F 5 "0157007.DR" H 860 1470 50  0001 C CNN "Man. Part No."
	1    860  1470
	1    0    0    -1  
$EndComp
Text GLabel 1860 1470 2    50   Input ~ 0
CHOKE_OUT
$Comp
L Vikings_actives:TSC2012IDT IC?
U 1 1 5F985886
P 6820 3360
AR Path="/5F7F5CD4/5F985886" Ref="IC?"  Part="1" 
AR Path="/5F8AF573/5F985886" Ref="IC1601"  Part="1" 
F 0 "IC1601" H 7420 2810 50  0000 C CNN
F 1 "TSC2012IDT" H 7420 2910 50  0000 C CNN
F 2 "Vikings_devices:TSC2012IDT" H 7870 3460 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/389/dm00630955-1799526.pdf" H 7870 3360 50  0001 L CNN
F 4 "Current Sense Amplifiers CONDITIONING & INTERFACES" H 7870 3260 50  0001 L CNN "Description"
F 5 "1.75" H 7870 3160 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 7870 3060 50  0001 L CNN "Manufacturer_Name"
F 7 "TSC2012IDT" H 7870 2960 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "TSC2012IDT" H 7870 2860 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/tsc2012idt/stmicroelectronics" H 7870 2760 50  0001 L CNN "Arrow Price/Stock"
F 10 "511-TSC2012IDT" H 7870 2660 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/TSC2012IDT?qs=%252B6g0mu59x7KSqOHhuXDI4w%3D%3D" H 7870 2560 50  0001 L CNN "Mouser Price/Stock"
	1    6820 3360
	-1   0    0    1   
$EndComp
$Comp
L Vikings_passives:R_Shunt R?
U 1 1 5F98588D
P 6190 3810
AR Path="/5F7F5CD4/5F98588D" Ref="R?"  Part="1" 
AR Path="/5F8AF573/5F98588D" Ref="R1610"  Part="1" 
F 0 "R1610" V 6110 3860 50  0000 C CNN
F 1 "0.01" V 6190 3860 50  0000 C CNN
F 2 "Resistor_SMD:R_Shunt_Ohmite_LVK12" V 6120 3810 50  0001 C CNN
F 3 "https://www.ohmite.com/assets/docs/res_lvk.pdf?r=false" H 6190 3810 50  0001 C CNN
F 4 "LVK12R010CER" V 6190 3810 50  0001 C CNN "Name"
	1    6190 3810
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F985895
P 5220 3310
AR Path="/5F7F5CD4/5F985895" Ref="C?"  Part="1" 
AR Path="/5F8AF573/5F985895" Ref="C1617"  Part="1" 
F 0 "C1617" H 5370 3260 50  0000 L CNN
F 1 "100nF" H 5320 3360 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5258 3160 50  0001 C CNN
F 3 "~" H 5220 3310 50  0001 C CNN
	1    5220 3310
	-1   0    0    1   
$EndComp
Wire Wire Line
	5620 3160 5220 3160
Wire Wire Line
	7270 3260 6820 3260
$Comp
L power:GND #PWR?
U 1 1 5F98589D
P 7270 3160
AR Path="/5F7F5CD4/5F98589D" Ref="#PWR?"  Part="1" 
AR Path="/5F8AF573/5F98589D" Ref="#PWR0368"  Part="1" 
F 0 "#PWR0368" H 7270 2910 50  0001 C CNN
F 1 "GND" V 7275 3032 50  0000 R CNN
F 2 "" H 7270 3160 50  0001 C CNN
F 3 "" H 7270 3160 50  0001 C CNN
	1    7270 3160
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5620 3060 5520 3060
Text HLabel 5520 3010 1    50   Output ~ 0
LVSC_V
Wire Wire Line
	5520 3060 5520 3010
$Comp
L power:GND #PWR?
U 1 1 5F9858AB
P 5220 3460
AR Path="/5F7F5CD4/5F9858AB" Ref="#PWR?"  Part="1" 
AR Path="/5F8AF573/5F9858AB" Ref="#PWR0369"  Part="1" 
F 0 "#PWR0369" H 5220 3210 50  0001 C CNN
F 1 "GND" H 5320 3310 50  0000 R CNN
F 2 "" H 5220 3460 50  0001 C CNN
F 3 "" H 5220 3460 50  0001 C CNN
	1    5220 3460
	1    0    0    -1  
$EndComp
Wire Wire Line
	7270 3160 7270 3260
Wire Wire Line
	7270 3160 6820 3160
Wire Wire Line
	6820 3060 7270 3060
Wire Wire Line
	7270 3060 7270 3160
Connection ~ 7270 3160
Wire Wire Line
	5370 3260 5370 3460
Wire Wire Line
	5370 3460 5220 3460
Wire Wire Line
	5370 3260 5620 3260
Connection ~ 5220 3460
Text Notes 4370 2530 0    100  ~ 0
Current measurement of Low-Voltage System
$Comp
L power:+5V #PWR?
U 1 1 5F9858C0
P 5220 3160
AR Path="/5F7F5CD4/5F9858C0" Ref="#PWR?"  Part="1" 
AR Path="/5F8AF573/5F9858C0" Ref="#PWR0394"  Part="1" 
F 0 "#PWR0394" H 5220 3010 50  0001 C CNN
F 1 "+5V" H 5235 3333 50  0000 C CNN
F 2 "" H 5220 3160 50  0001 C CNN
F 3 "" H 5220 3160 50  0001 C CNN
	1    5220 3160
	1    0    0    -1  
$EndComp
Connection ~ 5220 3160
Text GLabel 5440 3810 0    50   Output ~ 0
CHOKE_OUT
$Comp
L Vikings_misc:LV #PWR0395
U 1 1 5F9CEBBD
P 7270 3810
F 0 "#PWR0395" H 7270 3660 50  0001 C CNN
F 1 "LV" H 7260 3965 50  0000 C CNN
F 2 "" H 7270 3810 50  0001 C CNN
F 3 "" H 7270 3810 50  0001 C CNN
	1    7270 3810
	1    0    0    -1  
$EndComp
Text Notes 8270 2490 0    100  ~ 0
Fuse for 5V sensor supply
Wire Wire Line
	5440 3810 6000 3810
Wire Wire Line
	6140 3660 6140 3620
Wire Wire Line
	6140 3620 6000 3620
Wire Wire Line
	5570 3620 5570 3360
Wire Wire Line
	5570 3360 5620 3360
Wire Wire Line
	6340 3660 6340 3620
Wire Wire Line
	6340 3620 6480 3620
Wire Wire Line
	6860 3620 6860 3360
Wire Wire Line
	6860 3360 6820 3360
Wire Wire Line
	6440 3810 6480 3810
Wire Wire Line
	6480 3810 6480 3620
Connection ~ 6480 3810
Wire Wire Line
	6480 3810 7270 3810
Connection ~ 6480 3620
Wire Wire Line
	6480 3620 6860 3620
Wire Wire Line
	6000 3810 6000 3620
Connection ~ 6000 3810
Wire Wire Line
	6000 3810 6040 3810
Connection ~ 6000 3620
Wire Wire Line
	6000 3620 5570 3620
Text Label 4060 1150 2    50   ~ 0
Buck_5V_in
Wire Wire Line
	3515 1150 3610 1150
Connection ~ 3610 1150
Wire Wire Line
	3610 1150 4065 1150
Text Label 8290 1210 2    50   ~ 0
Buck_3V3_in
Text Label 9500 1210 0    50   ~ 0
Buck_3V3_out
Text Label 5280 1150 0    50   ~ 0
Buck_5V_out
Text Label 9870 3830 0    50   ~ 0
PG_Module
Text Label 1660 3190 2    50   ~ 0
Boost_12V_in
Text Label 3670 2880 2    50   ~ 0
Boost_12V_out
Text Label 2500 2770 2    50   ~ 0
Boost_SW
Wire Wire Line
	9580 2810 9900 2810
Wire Wire Line
	9070 2810 9380 2810
Wire Wire Line
	960  1470 1270 1470
Wire Wire Line
	640  1470 760  1470
Text Label 1310 1470 2    50   ~ 0
CHOKE_IN
Wire Wire Line
	6685 1150 6755 1150
Wire Wire Line
	6135 1150 6415 1150
Text Notes 9450 1110 0    50   ~ 0
Vout = (RFBT/RFBB + 1)VFB
Wire Wire Line
	10360 1210 10640 1210
Wire Wire Line
	10930 1210 11060 1210
Connection ~ 11060 1210
$Comp
L Connector:TestPoint TP?
U 1 1 5FAEFA18
P 11060 1210
AR Path="/5F94DFD6/5FAEFA18" Ref="TP?"  Part="1" 
AR Path="/5F8AF573/5FAEFA18" Ref="TP1603"  Part="1" 
F 0 "TP1603" H 11115 1355 50  0000 L CNN
F 1 "TestPoint" H 11118 1237 50  0001 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 11260 1210 50  0001 C CNN
F 3 "~" H 11260 1210 50  0001 C CNN
	1    11060 1210
	-1   0    0    1   
$EndComp
Wire Wire Line
	11060 1210 11060 1190
$Comp
L power:+3.3V #PWR0458
U 1 1 601DDA75
P 11060 1190
F 0 "#PWR0458" H 11060 1040 50  0001 C CNN
F 1 "+3.3V" H 11075 1363 50  0000 C CNN
F 2 "" H 11060 1190 50  0001 C CNN
F 3 "" H 11060 1190 50  0001 C CNN
	1    11060 1190
	1    0    0    -1  
$EndComp
Wire Wire Line
	4090 2880 4200 2880
Wire Wire Line
	3560 2880 3800 2880
Wire Notes Line
	4330 2360 4330 4330
Text Notes 650  4200 0    50   ~ 0
When JP1601 is placed, R1609 must be REMOVED.
$EndSCHEMATC
