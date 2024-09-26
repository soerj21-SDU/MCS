EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
Title "Zynq-Based Master Controller"
Date "2020-10-14"
Rev "1.0"
Comp "JFH & SRM"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1850 1500 0    50   ~ 0
Expansion Headers
Text Notes 1800 3400 2    98   ~ 0
CMC connections\nNot high-speed.
Text Notes 1850 5650 0    98   ~ 0
Receptacles:\nMolex SlimStack 52885-0474\n40 pins, 0.635mm pitch, 100 V, 0.5 A\n\n24 total CMC\n32 total Zynq
Text Notes 4600 1450 0    98   ~ 0
All Zynq connections with same denomination should have same length.\nP/N pairs should be differentially routed.\n100 Ohm differential impedance\n50 Ohm single-ended impedance
Text HLabel 4900 3750 0    50   BiDi ~ 0
PL_9
Text HLabel 5900 2750 2    50   BiDi ~ 0
PL_15
Text HLabel 5900 2650 2    50   BiDi ~ 0
PL_14
Text HLabel 5900 2550 2    50   BiDi ~ 0
PL_13
Text HLabel 5900 2450 2    50   BiDi ~ 0
PL_12
Text HLabel 5900 2350 2    50   BiDi ~ 0
PL_11
Text HLabel 4900 3650 0    50   BiDi ~ 0
PL_8
Text HLabel 3550 3150 2    50   BiDi ~ 0
CMC_2x8
Text HLabel 3550 3050 2    50   BiDi ~ 0
CMC_2x7
Text HLabel 3550 2950 2    50   BiDi ~ 0
CMC_2x6
Text HLabel 3550 2850 2    50   BiDi ~ 0
CMC_2x5
Text HLabel 3550 2550 2    50   BiDi ~ 0
CMC_2x4
Text HLabel 3550 2450 2    50   BiDi ~ 0
CMC_2x3
Text HLabel 3550 2350 2    50   BiDi ~ 0
CMC_2x2
Text HLabel 2550 3150 0    50   BiDi ~ 0
CMC_1x8
Text HLabel 2550 3050 0    50   BiDi ~ 0
CMC_1x7
Text HLabel 2550 2950 0    50   BiDi ~ 0
CMC_1x6
Text HLabel 2550 2850 0    50   BiDi ~ 0
CMC_1x5
Text HLabel 2550 2550 0    50   BiDi ~ 0
CMC_1x4
Text HLabel 2550 2450 0    50   BiDi ~ 0
CMC_1x3
Text HLabel 2550 2350 0    50   BiDi ~ 0
CMC_1x2
Text HLabel 4900 3050 0    50   BiDi ~ 0
PL_6
Text HLabel 4900 2950 0    50   BiDi ~ 0
PL_5
Text HLabel 4900 2650 0    50   BiDi ~ 0
PL_3
Text HLabel 4900 2550 0    50   BiDi ~ 0
PL_2
Text HLabel 4900 4050 0    50   BiDi ~ 0
PL_10N
Text HLabel 4900 3950 0    50   BiDi ~ 0
PL_10P
$Comp
L power:+5V #PWR0316
U 1 1 5F8B6FA7
P 5900 3350
F 0 "#PWR0316" H 5900 3200 50  0001 C CNN
F 1 "+5V" V 5900 3600 50  0000 C CNN
F 2 "" H 5900 3350 50  0001 C CNN
F 3 "" H 5900 3350 50  0001 C CNN
	1    5900 3350
	0    1    1    0   
$EndComp
$Comp
L Vikings_connectors:Molex_52885-0474 J1402
U 1 1 5F80618B
P 5400 1950
F 0 "J1402" V 5219 1950 50  0000 C CNN
F 1 "Molex_52885-0474" V 5310 1950 50  0000 C CNN
F 2 "Vikings_connectors:Molex_528850474" H 7750 2250 50  0001 L CNN
F 3 "http://www.mouser.com/datasheet/2/276/0528850474_PCB_RECEPTACLES-170826.pdf" H 7750 2150 50  0001 L CNN
F 4 "Molex SLIMSTACK Series 0.635mm 40 Way 2 Row Straight PCB Socket Surface Mount Board to Board" H 7750 2050 50  0001 L CNN "Description"
F 5 "4.4" H 7750 1950 50  0001 L CNN "Height"
F 6 "Molex" H 7750 1850 50  0001 L CNN "Manufacturer_Name"
F 7 "52885-0474" H 7750 1750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "52885-0474" H 7750 1650 50  0001 L CNN "Arrow Part Number"
F 9 "538-52885-0474" H 7750 1450 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.co.uk/ProductDetail/Molex/52885-0474?qs=XMKc5qFqEO1F75enjbOFmQ%3D%3D" H 7750 1350 50  0001 L CNN "Mouser Price/Stock"
	1    5400 1950
	0    1    1    0   
$EndComp
NoConn ~ 5400 1950
NoConn ~ 5400 4450
NoConn ~ 3050 3450
NoConn ~ 3050 1950
Text HLabel 4900 2350 0    50   BiDi ~ 0
PL_1P
Text HLabel 4900 2450 0    50   BiDi ~ 0
PL_1N
Text HLabel 4900 2750 0    50   BiDi ~ 0
PL_4P
Text HLabel 4900 2850 0    50   BiDi ~ 0
PL_4N
Text HLabel 4900 3450 0    50   BiDi ~ 0
PL_7P
Text HLabel 4900 3550 0    50   BiDi ~ 0
PL_7N
Text HLabel 5900 2850 2    50   BiDi ~ 0
PL_16
$Comp
L power:+5V #PWR0419
U 1 1 5F8205B1
P 4900 3350
F 0 "#PWR0419" H 4900 3200 50  0001 C CNN
F 1 "+5V" V 4900 3600 50  0000 C CNN
F 2 "" H 4900 3350 50  0001 C CNN
F 3 "" H 4900 3350 50  0001 C CNN
	1    4900 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0420
U 1 1 5F823233
P 2550 2650
F 0 "#PWR0420" H 2550 2500 50  0001 C CNN
F 1 "+3.3V" V 2550 2900 50  0000 C CNN
F 2 "" H 2550 2650 50  0001 C CNN
F 3 "" H 2550 2650 50  0001 C CNN
	1    2550 2650
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0421
U 1 1 5F823839
P 3550 2650
F 0 "#PWR0421" H 3550 2500 50  0001 C CNN
F 1 "+3.3V" V 3550 2900 50  0000 C CNN
F 2 "" H 3550 2650 50  0001 C CNN
F 3 "" H 3550 2650 50  0001 C CNN
	1    3550 2650
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR0422
U 1 1 5F83085C
P 4900 4150
F 0 "#PWR0422" H 4900 4000 50  0001 C CNN
F 1 "+12V" V 4900 4400 50  0000 C CNN
F 2 "" H 4900 4150 50  0001 C CNN
F 3 "" H 4900 4150 50  0001 C CNN
	1    4900 4150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0425
U 1 1 5F84038E
P 4900 3150
F 0 "#PWR0425" H 4900 2900 50  0001 C CNN
F 1 "GND" V 4905 3022 50  0000 R CNN
F 2 "" H 4900 3150 50  0001 C CNN
F 3 "" H 4900 3150 50  0001 C CNN
	1    4900 3150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0427
U 1 1 5F840A89
P 4900 3250
F 0 "#PWR0427" H 4900 3000 50  0001 C CNN
F 1 "GND" V 4905 3122 50  0000 R CNN
F 2 "" H 4900 3250 50  0001 C CNN
F 3 "" H 4900 3250 50  0001 C CNN
	1    4900 3250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0428
U 1 1 5F841788
P 5900 3850
F 0 "#PWR0428" H 5900 3600 50  0001 C CNN
F 1 "GND" V 5905 3722 50  0000 R CNN
F 2 "" H 5900 3850 50  0001 C CNN
F 3 "" H 5900 3850 50  0001 C CNN
	1    5900 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0429
U 1 1 5F845D00
P 5900 3250
F 0 "#PWR0429" H 5900 3000 50  0001 C CNN
F 1 "GND" V 5905 3122 50  0000 R CNN
F 2 "" H 5900 3250 50  0001 C CNN
F 3 "" H 5900 3250 50  0001 C CNN
	1    5900 3250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0430
U 1 1 5F8413DB
P 5900 2250
F 0 "#PWR0430" H 5900 2000 50  0001 C CNN
F 1 "GND" V 5905 2122 50  0000 R CNN
F 2 "" H 5900 2250 50  0001 C CNN
F 3 "" H 5900 2250 50  0001 C CNN
	1    5900 2250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0431
U 1 1 5F85C3A7
P 4900 3850
F 0 "#PWR0431" H 4900 3600 50  0001 C CNN
F 1 "GND" V 4905 3722 50  0000 R CNN
F 2 "" H 4900 3850 50  0001 C CNN
F 3 "" H 4900 3850 50  0001 C CNN
	1    4900 3850
	0    1    1    0   
$EndComp
Wire Notes Line
	1850 1500 1850 4650
Wire Notes Line
	1850 4650 6450 4650
Wire Notes Line
	6450 4650 6450 1500
Wire Notes Line
	1850 1500 6450 1500
$Comp
L power:+12V #PWR0432
U 1 1 5F82C9BF
P 5900 4150
F 0 "#PWR0432" H 5900 4000 50  0001 C CNN
F 1 "+12V" V 5900 4400 50  0000 C CNN
F 2 "" H 5900 4150 50  0001 C CNN
F 3 "" H 5900 4150 50  0001 C CNN
	1    5900 4150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0435
U 1 1 5F86715A
P 3550 2750
F 0 "#PWR0435" H 3550 2500 50  0001 C CNN
F 1 "GND" V 3555 2622 50  0000 R CNN
F 2 "" H 3550 2750 50  0001 C CNN
F 3 "" H 3550 2750 50  0001 C CNN
	1    3550 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0436
U 1 1 5F8673CB
P 2550 2750
F 0 "#PWR0436" H 2550 2500 50  0001 C CNN
F 1 "GND" V 2555 2622 50  0000 R CNN
F 2 "" H 2550 2750 50  0001 C CNN
F 3 "" H 2550 2750 50  0001 C CNN
	1    2550 2750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0437
U 1 1 5F87D639
P 4900 2250
F 0 "#PWR0437" H 4900 2000 50  0001 C CNN
F 1 "GND" V 4905 2122 50  0000 R CNN
F 2 "" H 4900 2250 50  0001 C CNN
F 3 "" H 4900 2250 50  0001 C CNN
	1    4900 2250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0438
U 1 1 5F8DAE83
P 5900 3150
F 0 "#PWR0438" H 5900 2900 50  0001 C CNN
F 1 "GND" V 5905 3022 50  0000 R CNN
F 2 "" H 5900 3150 50  0001 C CNN
F 3 "" H 5900 3150 50  0001 C CNN
	1    5900 3150
	0    -1   -1   0   
$EndComp
Text HLabel 5900 3750 2    50   BiDi ~ 0
CMC_3x4
Text HLabel 5900 3450 2    50   BiDi ~ 0
CMC_3x1
Text HLabel 5900 3550 2    50   BiDi ~ 0
CMC_3x2
Text HLabel 5900 3650 2    50   BiDi ~ 0
CMC_3x3
Text HLabel 5900 3950 2    50   BiDi ~ 0
CMC_3x5
Text HLabel 5900 4050 2    50   BiDi ~ 0
CMC_3x6
$Comp
L Vikings_connectors:Molex_52885-0274 J1401
U 1 1 5FAF4A7F
P 3050 1950
F 0 "J1401" V 2869 1950 50  0000 C CNN
F 1 "Molex_52885-0274" V 2960 1950 50  0000 C CNN
F 2 "Vikings_connectors:Molex_528850274" H 4400 2250 50  0001 L CNN
F 3 "https://www.molex.com/webdocs/datasheets/pdf/en-us/0528850274_PCB_RECEPTACLES.pdf" H 4400 2150 50  0001 L CNN
F 4 "Molex SLIMSTACK Series 0.64mm 20 Way 2 Row Straight PCB Socket Surface Mount Board to Board" H 4400 2050 50  0001 L CNN "Description"
F 5 "4" H 4400 1950 50  0001 L CNN "Height"
F 6 "Molex" H 4400 1850 50  0001 L CNN "Manufacturer_Name"
F 7 "52885-0274" H 4400 1750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "538-52885-0274" H 4400 1450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Molex/52885-0274?qs=%252BPJ3Ll1xQNYiQig4hWY5jQ%3D%3D" H 4400 1350 50  0001 L CNN "Mouser Price/Stock"
	1    3050 1950
	0    1    1    0   
$EndComp
Text HLabel 5900 2950 2    50   BiDi ~ 0
PL_17
Text HLabel 5900 3050 2    50   BiDi ~ 0
PL_18
Text HLabel 3550 2250 2    50   BiDi ~ 0
CMC_2x1
Text HLabel 2550 2250 0    50   BiDi ~ 0
CMC_1x1
$EndSCHEMATC
