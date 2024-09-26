EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 17
Title "Zynq-Based Master Controller"
Date "2020-10-14"
Rev "1.0"
Comp "JFH & SRM"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 900  4800 0    138  ~ 0
All differential routes must be same length on PCB.\nDifferential Impedance matching: 100 Ω\nDo not put ground under the magnetics IC.\nPut shield ground under M12.
$Comp
L Vikings_passives:Wurth_7490120110 T?
U 1 1 5F762539
P 2200 1200
AR Path="/5F762539" Ref="T?"  Part="1" 
AR Path="/5F5A48E4/5F762539" Ref="T201"  Part="1" 
F 0 "T201" H 2900 300 50  0000 C CNN
F 1 "Wurth_7490120110" H 2900 200 50  0000 C CNN
F 2 "Vikings_devices:Wurth_7490120110" H 3450 1300 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/7490120110.pdf" H 3450 1200 50  0001 L CNN
F 4 "Audio Transformers / Signal Transformers WE-LAN 10/100 Base-T 1Port SMD Transfrmer" H 3450 1100 50  0001 L CNN "Description"
F 5 "5.8" H 3450 1000 50  0001 L CNN "Height"
F 6 "Wurth Elektronik / Midcom" H 3450 900 50  0001 L CNN "Manufacturer_Name"
F 7 "7490120110" H 3450 800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "7490120110" H 3450 700 50  0001 L CNN "Arrow Part Number"
F 9 "710-7490120110" H 3450 500 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.co.uk/ProductDetail/Wurth-Elektronik-Midcom/7490120110?qs=2sV1BwmkawS544uMhsm03Q%3D%3D" H 3450 400 50  0001 L CNN "Mouser Price/Stock"
	1    2200 1200
	1    0    0    -1  
$EndComp
Text HLabel 2050 1400 0    50   BiDi ~ 0
RDP
Wire Wire Line
	2200 1400 2050 1400
Text HLabel 2050 1200 0    50   BiDi ~ 0
RDN
Wire Wire Line
	2050 1200 2200 1200
NoConn ~ 3600 1500
NoConn ~ 3600 1600
NoConn ~ 2200 1500
NoConn ~ 2200 1600
Wire Wire Line
	1650 1800 2200 1800
Wire Wire Line
	1250 1800 1350 1800
$Comp
L power:GND #PWR0102
U 1 1 5F77ED27
P 1250 1800
F 0 "#PWR0102" H 1250 1550 50  0001 C CNN
F 1 "GND" V 1255 1672 50  0000 R CNN
F 2 "" H 1250 1800 50  0001 C CNN
F 3 "" H 1250 1800 50  0001 C CNN
	1    1250 1800
	0    1    -1   0   
$EndComp
$Comp
L Device:C C202
U 1 1 5F77ED2D
P 1500 1800
F 0 "C202" V 1620 1800 50  0000 C CNN
F 1 "100nF" V 1680 1800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1538 1650 50  0001 C CNN
F 3 "~" H 1500 1800 50  0001 C CNN
	1    1500 1800
	0    -1   1    0   
$EndComp
Text HLabel 7650 2000 0    50   Output ~ 0
GRN_LED
Text HLabel 8700 2000 0    50   Output ~ 0
YLW_LED
$Comp
L power:+3.3V #PWR0103
U 1 1 5F78ABAF
P 8400 1250
F 0 "#PWR0103" H 8400 1100 50  0001 C CNN
F 1 "+3.3V" H 8300 1450 50  0000 L CNN
F 2 "" H 8400 1250 50  0001 C CNN
F 3 "" H 8400 1250 50  0001 C CNN
	1    8400 1250
	1    0    0    -1  
$EndComp
$Comp
L Vikings_passives:150060VS75000 D202
U 1 1 5F7AEF91
P 7900 1550
F 0 "D202" V 7800 1290 50  0000 L CNN
F 1 "150060VS75000" V 8000 900 50  0000 L CNN
F 2 "Vikings_devices:Wurth_150060VS75000" H 7900 2150 50  0001 L CNN
F 3 "https://www.we-online.com/catalog/datasheet/150060VS75000.pdf" H 7900 2250 50  0001 L CNN
F 4 "No" H 7900 2350 50  0001 L CNN "automotive"
F 5 "Diode" H 7900 2450 50  0001 L CNN "category"
F 6 "Green" H 7900 2550 50  0001 L CNN "colour"
F 7 "Optoelectronics" H 7900 2650 50  0001 L CNN "device class L1"
F 8 "LEDs" H 7900 2750 50  0001 L CNN "device class L2"
F 9 "unset" H 7900 2850 50  0001 L CNN "device class L3"
F 10 "LED GREEN CLEAR 0603 SMD" H 7900 2950 50  0001 L CNN "digikey description"
F 11 "732-4980-1-ND" H 7900 3050 50  0001 L CNN "digikey part number"
F 12 "20mA" H 7900 3150 50  0001 L CNN "forward current"
F 13 "2V" H 7900 3250 50  0001 L CNN "forward voltage"
F 14 "0.8mm" H 7900 3350 50  0001 L CNN "height"
F 15 "Yes" H 7900 3450 50  0001 L CNN "lead free"
F 16 "Top View" H 7900 3550 50  0001 L CNN "led orientation"
F 17 "31412359902cf5d2" H 7900 3650 50  0001 L CNN "library id"
F 18 "40mcd" H 7900 3750 50  0001 L CNN "luminous intensity"
F 19 "Wurth" H 7900 3850 50  0001 L CNN "manufacturer"
F 20 "+95°C" H 7900 3950 50  0001 L CNN "max junction temp"
F 21 "LED, Green, 570 nm, 2 V, 30 mA, 40 mcd" H 7900 4050 50  0001 L CNN "mouser description"
F 22 "710-150060VS75000" H 7900 4150 50  0001 L CNN "mouser part number"
F 23 "0603" H 7900 4250 50  0001 L CNN "package"
F 24 "572nm" H 7900 4350 50  0001 L CNN "peak emmision wavelength"
F 25 "72mW" H 7900 4450 50  0001 L CNN "power dissipation"
F 26 "5V" H 7900 4550 50  0001 L CNN "reverse voltage"
F 27 "Yes" H 7900 4650 50  0001 L CNN "rohs"
F 28 "+85°C" H 7900 4750 50  0001 L CNN "temperature range high"
F 29 "-40°C" H 7900 4850 50  0001 L CNN "temperature range low"
F 30 "140°" H 7900 4950 50  0001 L CNN "viewing angle"
F 31 "570nm" H 7900 5050 50  0001 L CNN "wavelength"
	1    7900 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 1250 7900 1400
Wire Wire Line
	7900 1800 7900 2000
Wire Wire Line
	7900 2000 7650 2000
Wire Wire Line
	8950 1800 8950 2000
Wire Wire Line
	8950 2000 8700 2000
Wire Wire Line
	7900 1250 8400 1250
Connection ~ 8400 1250
Wire Wire Line
	8400 1250 8950 1250
Wire Wire Line
	8950 1400 8950 1250
$Comp
L power:GND #PWR0104
U 1 1 5F7EE708
P 3600 2450
F 0 "#PWR0104" H 3600 2200 50  0001 C CNN
F 1 "GND" V 3605 2322 50  0000 R CNN
F 2 "" H 3600 2450 50  0001 C CNN
F 3 "" H 3600 2450 50  0001 C CNN
	1    3600 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 1800 4050 1800
Wire Wire Line
	3600 1300 4300 1300
Wire Wire Line
	4050 2850 4050 2900
$Comp
L Device:R R201
U 1 1 5F7F3F63
P 4050 3050
F 0 "R201" H 3800 3050 50  0000 L CNN
F 1 "75" H 4550 2950 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3980 3050 50  0001 C CNN
F 3 "~" H 4050 3050 50  0001 C CNN
	1    4050 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1800 4050 2450
Wire Wire Line
	3600 2450 4050 2450
Wire Wire Line
	4300 2850 4300 2900
$Comp
L Device:R R202
U 1 1 5F7F0C86
P 4300 3050
F 0 "R202" H 4370 3050 50  0000 L CNN
F 1 "75" H 4370 3005 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 3050 50  0001 C CNN
F 3 "~" H 4300 3050 50  0001 C CNN
	1    4300 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C204
U 1 1 5F7F06DE
P 4300 2700
F 0 "C204" H 4415 2700 50  0000 L CNN
F 1 "22nF" H 4415 2655 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4338 2550 50  0001 C CNN
F 3 "~" H 4300 2700 50  0001 C CNN
F 4 "22 nF, 100 V" H 4300 2700 50  0001 C CNN "Description"
	1    4300 2700
	1    0    0    -1  
$EndComp
Connection ~ 4300 2300
Wire Wire Line
	4300 1300 4300 2300
Wire Wire Line
	3600 2300 4300 2300
$Comp
L Device:C C203
U 1 1 5F7F3F5D
P 4050 2700
F 0 "C203" H 3750 2700 50  0000 L CNN
F 1 "22nF" H 4400 2550 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4088 2550 50  0001 C CNN
F 3 "~" H 4050 2700 50  0001 C CNN
F 4 "22nF, 100V" H 4050 2700 50  0001 C CNN "Description"
	1    4050 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5F807942
P 4950 2450
F 0 "#PWR0106" H 4950 2200 50  0001 C CNN
F 1 "GND" V 4955 2322 50  0000 R CNN
F 2 "" H 4950 2450 50  0001 C CNN
F 3 "" H 4950 2450 50  0001 C CNN
	1    4950 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 2850 5200 2900
$Comp
L Device:R R203
U 1 1 5F8097AF
P 5200 3050
F 0 "R203" H 4950 3050 50  0000 L CNN
F 1 "75" H 5000 3000 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5130 3050 50  0001 C CNN
F 3 "~" H 5200 3050 50  0001 C CNN
	1    5200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2850 5450 2900
$Comp
L Device:R R204
U 1 1 5F8097B6
P 5450 3050
F 0 "R204" H 5520 3050 50  0000 L CNN
F 1 "75" H 5520 3005 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5380 3050 50  0001 C CNN
F 3 "~" H 5450 3050 50  0001 C CNN
	1    5450 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C206
U 1 1 5F8097BC
P 5450 2700
F 0 "C206" H 5565 2700 50  0000 L CNN
F 1 "22nF" H 5565 2655 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5488 2550 50  0001 C CNN
F 3 "~" H 5450 2700 50  0001 C CNN
F 4 "22 nF, 100 V" H 5450 2700 50  0001 C CNN "Description"
	1    5450 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C205
U 1 1 5F8097C2
P 5200 2700
F 0 "C205" H 4900 2700 50  0000 L CNN
F 1 "22nF" H 4950 2650 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5238 2550 50  0001 C CNN
F 3 "~" H 5200 2700 50  0001 C CNN
F 4 "22 nF, 100 V" H 5200 2700 50  0001 C CNN "Description"
	1    5200 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2550 4050 2450
Connection ~ 4050 2450
Wire Wire Line
	4300 2300 4300 2550
Wire Wire Line
	4950 2450 5450 2450
Wire Wire Line
	5450 2550 5450 2450
Connection ~ 5450 2450
Wire Wire Line
	5200 2550 5200 2300
Wire Wire Line
	5200 2300 4950 2300
Connection ~ 5200 2300
Wire Wire Line
	4050 3200 4050 3300
Wire Wire Line
	4050 3300 4300 3300
Wire Wire Line
	4300 3300 4300 3200
Wire Wire Line
	4300 3300 4750 3300
Wire Wire Line
	5200 3300 5200 3200
Connection ~ 4300 3300
Wire Wire Line
	5450 3200 5450 3300
Wire Wire Line
	5450 3300 5200 3300
Connection ~ 5200 3300
$Comp
L Device:C C211
U 1 1 5F81B150
P 4750 3450
F 0 "C211" H 4865 3496 50  0000 L CNN
F 1 "1nF" H 4865 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4788 3300 50  0001 C CNN
F 3 "~" H 4750 3450 50  0001 C CNN
F 4 "1nF, 2000V" H 4750 3450 50  0001 C CNN "Description"
	1    4750 3450
	1    0    0    -1  
$EndComp
Connection ~ 4750 3300
Wire Wire Line
	4750 3300 5200 3300
Wire Wire Line
	5430 2300 5430 1800
Wire Wire Line
	5200 2300 5430 2300
Wire Wire Line
	5450 2450 5500 2450
Wire Notes Line
	900  950  900  3850
Wire Notes Line
	900  3850 6950 3850
Wire Notes Line
	6950 3850 6950 950 
Wire Notes Line
	6950 950  900  950 
Text Notes 900  950  0    50   ~ 0
Ethernet magnetics, Bob Smith termination, and M12 connector
Wire Notes Line
	7100 2150 7100 950 
Text Notes 7100 950  0    50   ~ 0
Power and activity LEDs
Wire Wire Line
	4750 3600 4750 3650
Wire Wire Line
	4750 3650 5950 3650
Wire Wire Line
	5950 3650 5950 2000
$Comp
L Device:R R?
U 1 1 5FBBD5FE
P 4450 3650
AR Path="/5F5BCF4D/5FBBD5FE" Ref="R?"  Part="1" 
AR Path="/5F5A48E4/5FBBD5FE" Ref="R205"  Part="1" 
F 0 "R205" V 4350 3650 50  0000 C CNN
F 1 "0" V 4450 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 4380 3650 50  0001 C CNN
F 3 "~" H 4450 3650 50  0001 C CNN
	1    4450 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 3650 4600 3650
Connection ~ 4750 3650
Wire Wire Line
	4300 3650 4150 3650
$Comp
L power:GND #PWR0108
U 1 1 5FBC1AB2
P 4150 3650
F 0 "#PWR0108" H 4150 3400 50  0001 C CNN
F 1 "GND" V 4155 3522 50  0000 R CNN
F 2 "" H 4150 3650 50  0001 C CNN
F 3 "" H 4150 3650 50  0001 C CNN
	1    4150 3650
	0    1    1    0   
$EndComp
Text Notes 5950 2200 0    50   ~ 0
Shield
$Comp
L Vikings_passives:150060YS75000 D201
U 1 1 5F76190F
P 8950 1500
F 0 "D201" V 8900 1550 50  0000 L CNN
F 1 "150060YS75000" H 8760 1360 50  0000 L CNN
F 2 "Vikings_devices:Wurth_150060YS75000" H 8950 2100 50  0001 L CNN
F 3 "http://katalog.we-online.com/led/datasheet/150060SS75000.pdf" H 8950 2200 50  0001 L CNN
F 4 "Yellow" H 8950 2300 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 8950 2400 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 8950 2500 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 8950 2600 50  0001 L CNN "category"
F 8 "12518860" H 8950 2700 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 8950 2800 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 8950 2900 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 8950 3000 50  0001 L CNN "package"
F 12 "1421305860" H 8950 3100 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 8950 3200 50  0001 L CNN "vault revision"
F 14 "yes" H 8950 3300 50  0001 L CNN "imported"
	1    8950 1500
	0    1    1    0   
$EndComp
Text Notes 7100 2250 0    50   ~ 0
Current limited by PicoZed.
$Comp
L Vikings_actives:PDQE15-Q24-S24-D PS201
U 1 1 5F8EE0B7
P 8720 2850
F 0 "PS201" H 9320 3115 50  0000 C CNN
F 1 "PDQE15-Q24-S24-D" H 9320 3024 50  0000 C CNN
F 2 "Vikings_devices:CUI_PDQE15-Q24-S24-D" H 9320 2650 50  0001 L BNN
F 3 "Manufacturer Recommendations" H 9320 2650 50  0001 L BNN
F 4 "CUI Inc." H 9320 2650 50  0001 L BNN "Field4"
F 5 "11.70mm" H 9320 2650 50  0001 L BNN "Field5"
F 6 "1.0" H 9320 2650 50  0001 L BNN "Field6"
	1    8720 2850
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:LV #PWR0105
U 1 1 5F8EF78F
P 7250 2850
F 0 "#PWR0105" H 7250 2700 50  0001 C CNN
F 1 "LV" H 7265 3023 50  0000 C CNN
F 2 "" H 7250 2850 50  0001 C CNN
F 3 "" H 7250 2850 50  0001 C CNN
	1    7250 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5F8F1103
P 7400 3400
F 0 "#PWR0107" H 7400 3150 50  0001 C CNN
F 1 "GND" V 7405 3272 50  0000 R CNN
F 2 "" H 7400 3400 50  0001 C CNN
F 3 "" H 7400 3400 50  0001 C CNN
	1    7400 3400
	0    1    1    0   
$EndComp
$Comp
L Device:CP C208
U 1 1 5F8F4FA5
P 10310 3050
F 0 "C208" H 10425 3096 50  0000 L CNN
F 1 "47uF" H 10425 3005 50  0000 L CNN
F 2 "Vikings_devices:CP_Elec_Wurth_WCAP-PSLP_6.6x6.6mm" H 10348 2900 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/865080645012.pdf" H 10310 3050 50  0001 C CNN
F 4 "Würth Elektronik" H 10310 3050 50  0001 C CNN "Manufacturer"
F 5 "865080645012" H 10310 3050 50  0001 C CNN "Man. Part No."
F 6 "50V, 47uF, Aluminium Polymer Capacitor, 20% tol" H 10310 3050 50  0001 C CNN "Description"
	1    10310 3050
	1    0    0    -1  
$EndComp
NoConn ~ 9920 3050
Wire Wire Line
	9920 2850 10100 2850
Wire Wire Line
	10310 2850 10310 2900
Connection ~ 10310 2850
$Comp
L power:+24V #PWR0109
U 1 1 5F8FF9B8
P 10890 2850
F 0 "#PWR0109" H 10890 2700 50  0001 C CNN
F 1 "+24V" H 10910 3000 50  0000 C CNN
F 2 "" H 10890 2850 50  0001 C CNN
F 3 "" H 10890 2850 50  0001 C CNN
	1    10890 2850
	1    0    0    -1  
$EndComp
Connection ~ 8310 2850
NoConn ~ 8720 3050
Wire Notes Line
	7100 3500 7100 2450
Text Notes 7100 2450 0    50   ~ 0
9 - 36 Vin to 24 Vout isolated converter
$Comp
L Vikings_actives:BTT6010-1EKB U?
U 1 1 5F93586D
P 8400 4150
AR Path="/603DCCC0/5F93586D" Ref="U?"  Part="1" 
AR Path="/5F5A48E4/5F93586D" Ref="U201"  Part="1" 
F 0 "U201" H 8650 3377 50  0000 C CNN
F 1 "BTT6010-1EKB" H 8650 3286 50  0000 C CNN
F 2 "Vikings_devices:PG-DSO-14-47" H 8735 4640 50  0001 C CNN
F 3 "https://docs.rs-online.com/1df8/0900766b815790fa.pdf" H 8735 4640 50  0001 C CNN
	1    8400 4150
	1    0    0    -1  
$EndComp
Text HLabel 8000 4500 0    50   Input ~ 0
Zynq_3V3_PL_1
Wire Wire Line
	8000 4500 8085 4500
$Comp
L power:+3.3V #PWR?
U 1 1 5F935875
P 7500 4600
AR Path="/5F7F5CD4/5F935875" Ref="#PWR?"  Part="1" 
AR Path="/603DCCC0/5F935875" Ref="#PWR?"  Part="1" 
AR Path="/5F5A48E4/5F935875" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 7500 4450 50  0001 C CNN
F 1 "+3.3V" V 7500 4700 50  0000 L CNN
F 2 "" H 7500 4600 50  0001 C CNN
F 3 "" H 7500 4600 50  0001 C CNN
	1    7500 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 4600 8300 4600
Text Notes 7100 3800 0    50   ~ 0
PROFET 5: Power-over-Ethernet (max. 0.5 A)
Wire Wire Line
	9000 4400 9050 4400
Wire Wire Line
	9050 4400 9050 4500
Wire Wire Line
	9050 4500 9000 4500
Wire Wire Line
	9000 4600 9050 4600
Wire Wire Line
	9050 4600 9050 4500
Connection ~ 9050 4500
Wire Wire Line
	9050 4500 9190 4500
$Comp
L power:GND #PWR?
U 1 1 5F935885
P 7900 5800
AR Path="/5F7F5CD4/5F935885" Ref="#PWR?"  Part="1" 
AR Path="/603DCCC0/5F935885" Ref="#PWR?"  Part="1" 
AR Path="/5F5A48E4/5F935885" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 7900 5550 50  0001 C CNN
F 1 "GND" H 7900 5650 50  0000 C CNN
F 2 "" H 7900 5800 50  0001 C CNN
F 3 "" H 7900 5800 50  0001 C CNN
	1    7900 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_ALT Z?
U 1 1 5F93588B
P 8150 5400
AR Path="/5F7F5CD4/5F93588B" Ref="Z?"  Part="1" 
AR Path="/603DCCC0/5F93588B" Ref="Z?"  Part="1" 
AR Path="/5F5A48E4/5F93588B" Ref="Z201"  Part="1" 
F 0 "Z201" V 8104 5480 50  0000 L CNN
F 1 "MMSZ5V6T3G" V 8195 5480 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 8150 5400 50  0001 C CNN
F 3 "https://docs.rs-online.com/d102/0900766b80dad80e.pdf" H 8150 5400 50  0001 C CNN
	1    8150 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F935891
P 7900 5200
AR Path="/5F7F5CD4/5F935891" Ref="R?"  Part="1" 
AR Path="/603DCCC0/5F935891" Ref="R?"  Part="1" 
AR Path="/5F5A48E4/5F935891" Ref="R208"  Part="1" 
F 0 "R208" H 7650 5250 50  0000 L CNN
F 1 "33k" H 7700 5150 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7830 5200 50  0001 C CNN
F 3 "~" H 7900 5200 50  0001 C CNN
	1    7900 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F935897
P 7900 5600
AR Path="/5F7F5CD4/5F935897" Ref="R?"  Part="1" 
AR Path="/603DCCC0/5F935897" Ref="R?"  Part="1" 
AR Path="/5F5A48E4/5F935897" Ref="R209"  Part="1" 
F 0 "R209" H 7600 5650 50  0000 L CNN
F 1 "7.15k" H 7650 5550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7830 5600 50  0001 C CNN
F 3 "~" H 7900 5600 50  0001 C CNN
	1    7900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5750 7900 5800
Wire Wire Line
	8150 5550 8150 5800
Wire Wire Line
	8150 5800 7900 5800
Connection ~ 7900 5800
Wire Wire Line
	7900 5050 7900 4950
Wire Wire Line
	7900 4950 8150 4950
Wire Wire Line
	8150 4950 8150 5250
Text HLabel 7550 5400 0    50   Output ~ 0
PoEC_V
Wire Wire Line
	7900 5350 7900 5400
Wire Wire Line
	7550 5400 7900 5400
Connection ~ 7900 5400
Wire Wire Line
	7900 5400 7900 5450
Wire Wire Line
	8150 4950 8150 4700
Wire Wire Line
	8150 4700 8300 4700
Connection ~ 8150 4950
Wire Notes Line
	7100 3800 7100 6000
Wire Notes Line
	7100 6000 9750 6000
Wire Notes Line
	9750 6000 9750 3800
Wire Notes Line
	7100 3800 9750 3800
Wire Wire Line
	8300 4400 8250 4400
Wire Wire Line
	8250 4400 8250 4250
$Comp
L Device:R R?
U 1 1 5F9358B2
P 8100 4250
AR Path="/5F7F5CD4/5F9358B2" Ref="R?"  Part="1" 
AR Path="/603DCCC0/5F9358B2" Ref="R?"  Part="1" 
AR Path="/5F5A48E4/5F9358B2" Ref="R206"  Part="1" 
F 0 "R206" V 8000 4250 50  0000 C CNN
F 1 "33" V 8100 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8030 4250 50  0001 C CNN
F 3 "~" H 8100 4250 50  0001 C CNN
	1    8100 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 4250 7900 4250
Wire Wire Line
	7600 4250 7500 4250
Wire Wire Line
	7500 4250 7500 4300
$Comp
L Diode:BAS21 D?
U 1 1 5F9358C1
P 7750 4250
AR Path="/5F7F5CD4/5F9358C1" Ref="D?"  Part="1" 
AR Path="/603DCCC0/5F9358C1" Ref="D?"  Part="1" 
AR Path="/5F5A48E4/5F9358C1" Ref="D203"  Part="1" 
F 0 "D203" H 7750 4467 50  0000 C CNN
F 1 "BAS21T-7-F" H 7750 4376 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7750 4075 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/Ds12004.pdf" H 7750 4250 50  0001 C CNN
	1    7750 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F9358C7
P 7850 4600
AR Path="/5F7F5CD4/5F9358C7" Ref="R?"  Part="1" 
AR Path="/603DCCC0/5F9358C7" Ref="R?"  Part="1" 
AR Path="/5F5A48E4/5F9358C7" Ref="R207"  Part="1" 
F 0 "R207" V 7950 4500 50  0000 L CNN
F 1 "4.7k" V 7850 4500 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7780 4600 50  0001 C CNN
F 3 "~" H 7850 4600 50  0001 C CNN
	1    7850 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 4600 7700 4600
$Comp
L power:+24V #PWR0130
U 1 1 5F93E231
P 8650 4050
F 0 "#PWR0130" H 8650 3900 50  0001 C CNN
F 1 "+24V" H 8665 4223 50  0000 C CNN
F 2 "" H 8650 4050 50  0001 C CNN
F 3 "" H 8650 4050 50  0001 C CNN
	1    8650 4050
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:GND-24V #PWR0132
U 1 1 5F94686D
P 7500 4300
F 0 "#PWR0132" H 7500 4050 50  0001 C CNN
F 1 "GND-24V" H 7750 4200 50  0000 C CNN
F 2 "" H 7500 4300 50  0001 C CNN
F 3 "" H 7500 4300 50  0001 C CNN
	1    7500 4300
	1    0    0    -1  
$EndComp
Text Label 9260 4500 0    50   ~ 0
24V_PoE
Text Label 3600 2300 2    50   ~ 0
24V_PoE
Text Label 4950 2300 2    50   ~ 0
24V_PoE
Wire Wire Line
	10310 3200 10310 3250
$Comp
L Device:C C209
U 1 1 5FDE2400
P 8080 3100
F 0 "C209" H 7750 3150 50  0000 L CNN
F 1 "4.7uF" H 7730 3050 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8118 2950 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012208094.pdf" H 8080 3100 50  0001 C CNN
F 4 "Würth Elektronik" H 8080 3100 50  0001 C CNN "Manufacturer"
F 5 "885012208094" H 8080 3100 50  0001 C CNN "Man. Part No."
F 6 "50V, 4.7uF MLCC X7R Capacitor, 10% tol, 1206 package" H 8080 3100 50  0001 C CNN "Description"
	1    8080 3100
	1    0    0    -1  
$EndComp
Connection ~ 8080 2850
$Comp
L Device:Ferrite_Bead_Small FB201
U 1 1 5FDEBDF3
P 7800 2850
F 0 "FB201" V 7563 2850 50  0000 C CNN
F 1 "100R @ 100 MHz" V 7654 2850 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 7730 2850 50  0001 C CNN
F 3 "https://www.mouser.dk/ProductDetail/TDK/MPZ2012S101AT000?qs=sGAEpiMZZMt1hubY80%2Fs8Hp09N5ImNkmxVgtQbJATBs%3D" H 7800 2850 50  0001 C CNN
F 4 "MPZ2012S101AT000" V 7800 2850 50  0001 C CNN "Name"
	1    7800 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 2850 8080 2850
Wire Notes Line
	11020 3500 11020 2450
Wire Notes Line
	7100 2450 11020 2450
Wire Notes Line
	7100 3500 11020 3500
$Comp
L Connector:TestPoint TP201
U 1 1 5FB5FABC
P 10310 2850
F 0 "TP201" H 10100 3060 50  0000 L CNN
F 1 "TestPoint" H 10368 2877 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 10510 2850 50  0001 C CNN
F 3 "~" H 10510 2850 50  0001 C CNN
	1    10310 2850
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5FB64B50
P 8085 4500
AR Path="/5F94DFD6/5FB64B50" Ref="TP?"  Part="1" 
AR Path="/5F5A48E4/5FB64B50" Ref="TP202"  Part="1" 
F 0 "TP202" H 8110 4560 50  0000 L CNN
F 1 "TestPoint" H 8143 4527 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8285 4500 50  0001 C CNN
F 3 "~" H 8285 4500 50  0001 C CNN
	1    8085 4500
	1    0    0    -1  
$EndComp
Connection ~ 8085 4500
Wire Wire Line
	8085 4500 8300 4500
Wire Wire Line
	8080 2850 8080 2950
Wire Wire Line
	8080 3250 8080 3400
Connection ~ 8080 3400
Wire Wire Line
	8310 2850 8310 2950
Wire Wire Line
	8310 3250 8310 3400
Connection ~ 8310 3400
Wire Wire Line
	8720 3250 8670 3250
Wire Wire Line
	8670 3250 8670 3400
Connection ~ 8670 3400
Wire Wire Line
	7250 2850 7700 2850
Wire Wire Line
	7400 3400 8080 3400
Text Notes 7700 2550 0    50   ~ 0
4 A
Wire Wire Line
	8670 3400 10310 3400
$Comp
L Vikings_misc:GND-24V #PWR0133
U 1 1 5F904A42
P 10400 3400
F 0 "#PWR0133" H 10400 3150 50  0001 C CNN
F 1 "GND-24V" V 10400 3250 50  0000 R CNN
F 2 "" H 10400 3400 50  0001 C CNN
F 3 "" H 10400 3400 50  0001 C CNN
	1    10400 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10310 3250 10310 3400
Connection ~ 10310 3250
Connection ~ 10310 3400
Wire Wire Line
	10310 3400 10400 3400
$Comp
L Device:Fuse_Small F201
U 1 1 5F8EA2BC
P 10570 2850
F 0 "F201" H 10570 2790 50  0000 C CNN
F 1 "1A" H 10570 2910 50  0000 C CNN
F 2 "Vikings_devices:Littlefuse_Nano_Clip" H 10570 2850 50  0001 C CNN
F 3 "https://m.littelfuse.com/~/media/electronics/datasheets/fuses/littelfuse_fuse_157_datasheet.pdf.pdf" H 10570 2850 50  0001 C CNN
F 4 "Littelfuse" H 10570 2850 50  0001 C CNN "Manufacturer"
F 5 "0157001.DR" H 10570 2850 50  0001 C CNN "Man. Part No."
	1    10570 2850
	1    0    0    -1  
$EndComp
$Comp
L Vikings_misc:GND-2 #PWR0134
U 1 1 5FBB5649
P 5950 3650
F 0 "#PWR0134" H 5950 3400 50  0001 C CNN
F 1 "GND-2" V 5955 3522 50  0000 R CNN
F 2 "" H 5950 3650 50  0001 C CNN
F 3 "" H 5950 3650 50  0001 C CNN
	1    5950 3650
	0    -1   -1   0   
$EndComp
Connection ~ 5950 3650
$Comp
L Device:CP C210
U 1 1 5FBC96B3
P 8310 3100
F 0 "C210" H 8428 3146 50  0000 L CNN
F 1 "100uF" H 8428 3055 50  0000 L CNN
F 2 "Vikings_devices:CP_Elec_Wurth_WCAP-ASLL_8.3x8.3mm" H 8348 2950 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/865060653010.pdf" H 8310 3100 50  0001 C CNN
F 4 "Würth Elektronik" H 8310 3100 50  0001 C CNN "Manufacturer"
F 5 "865060653010" H 8310 3100 50  0001 C CNN "Man. Part No."
F 6 "50V, 100uF Aluminium Polymer Capacitor, 20% tol" H 8310 3100 50  0001 C CNN "Description"
	1    8310 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8080 2850 8310 2850
Wire Wire Line
	8080 3400 8310 3400
Wire Wire Line
	8310 2850 8720 2850
Wire Wire Line
	8310 3400 8670 3400
$Comp
L Device:C C207
U 1 1 5FBEC828
P 10100 3050
F 0 "C207" H 9990 3130 50  0000 L CNN
F 1 "1uF" H 9950 2970 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10138 2900 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012208093.pdf" H 10100 3050 50  0001 C CNN
F 4 "Würth Elektronik" H 10100 3050 50  0001 C CNN "Manufacturer"
F 5 "885012208093" H 10100 3050 50  0001 C CNN "Man. Part No."
F 6 "50V, 1uF MLCC X7R Capacitor, 10% tol, 1206 package" H 10100 3050 50  0001 C CNN "Description"
	1    10100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2900 10100 2850
Connection ~ 10100 2850
Wire Wire Line
	10100 2850 10310 2850
Wire Wire Line
	10100 3200 10100 3250
Wire Wire Line
	9920 3250 10100 3250
Connection ~ 10100 3250
Wire Wire Line
	10100 3250 10310 3250
Text Label 8310 2850 0    50   ~ 0
Vin_24V_PoE
Text Label 9940 2850 0    50   ~ 0
Vo_24V_PoE
Text Label 4010 1900 2    50   ~ 0
ETH0_TX_P
Text Label 4030 1700 2    50   ~ 0
ETH0_TX_N
Text Label 4030 1400 2    50   ~ 0
ETH0_RX_P
Text Label 4030 1200 2    50   ~ 0
ETH0_RX_N
Text HLabel 2050 1900 0    50   BiDi ~ 0
TDP
Wire Wire Line
	2200 1900 2050 1900
Text HLabel 2050 1700 0    50   BiDi ~ 0
TDN
Wire Wire Line
	2050 1700 2200 1700
Wire Wire Line
	1650 1300 2200 1300
Wire Wire Line
	1250 1300 1350 1300
$Comp
L power:GND #PWR0101
U 1 1 5F77E5CD
P 1250 1300
F 0 "#PWR0101" H 1250 1050 50  0001 C CNN
F 1 "GND" V 1255 1172 50  0000 R CNN
F 2 "" H 1250 1300 50  0001 C CNN
F 3 "" H 1250 1300 50  0001 C CNN
	1    1250 1300
	0    1    -1   0   
$EndComp
$Comp
L Device:C C201
U 1 1 5F77E5D3
P 1500 1300
F 0 "C201" V 1690 1300 50  0000 C CNN
F 1 "100nF" V 1620 1300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1538 1150 50  0001 C CNN
F 3 "~" H 1500 1300 50  0001 C CNN
	1    1500 1300
	0    -1   1    0   
$EndComp
Wire Wire Line
	5560 1700 5950 1700
Wire Wire Line
	3600 1700 4030 1700
Wire Wire Line
	3600 1200 4030 1200
Wire Wire Line
	3600 1900 4010 1900
Wire Wire Line
	3600 1400 4030 1400
Text Label 5560 1700 0    50   ~ 0
ETH0_TX_P
Wire Wire Line
	5950 1600 5560 1600
Wire Wire Line
	5950 1500 5560 1500
Text Label 5560 1500 0    50   ~ 0
ETH0_TX_N
Text Label 5560 1600 0    50   ~ 0
ETH0_RX_P
Wire Wire Line
	5950 1900 5550 1900
Text Label 5550 1900 0    50   ~ 0
ETH0_RX_N
$Comp
L Vikings_connectors:Phoenix_1437009_M12_8pin_A_Female_Angled J201
U 1 1 5F75F112
P 5950 1200
F 0 "J201" H 6228 851 50  0000 L CNN
F 1 "Phoenix_1437009" H 6228 760 50  0000 L CNN
F 2 "Vikings_connectors:Phoenix_1437009_M12_8pin_A_Female_Angled" H 6600 1300 50  0001 L CNN
F 3 "http://www.phoenixcontact.com/us/products/1437009/pdf" H 6600 1200 50  0001 L CNN
F 4 "Circular Metric Connectors SACC-CI-M12FS-8CON- L90 SH SCO" H 6600 1100 50  0001 L CNN "Description"
F 5 "15.9" H 6600 1000 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 6600 900 50  0001 L CNN "Manufacturer_Name"
F 7 "1437009" H 6600 800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "1437009" H 6600 700 50  0001 L CNN "Arrow Part Number"
F 9 "651-1437009" H 6600 500 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1437009?qs=MfVUZiz0Pxb27kS8b3m0cw%3D%3D" H 6600 400 50  0001 L CNN "Mouser Price/Stock"
	1    5950 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1800 5430 1800
Connection ~ 5430 1800
Wire Wire Line
	5430 1200 5950 1200
Wire Wire Line
	5430 1200 5430 1800
Wire Wire Line
	5500 1350 5870 1350
Wire Wire Line
	5870 1350 5870 1300
Wire Wire Line
	5870 1300 5950 1300
Wire Wire Line
	5500 1350 5500 2450
Wire Wire Line
	5950 1400 5870 1400
Wire Wire Line
	5870 1400 5870 1350
Connection ~ 5870 1350
Text Notes 4540 3220 0    50   ~ 0
4 x 75 R
Text Notes 4420 2880 0    50   ~ 0
4 x 22 nF, 100 V
$Comp
L Device:C C212
U 1 1 5FC9427F
P 9190 4670
F 0 "C212" H 9230 4750 50  0000 L CNN
F 1 "1uF" H 9240 4590 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9228 4520 50  0001 C CNN
F 3 "https://www.we-online.com/katalog/en/datasheet/885012208093.pdf" H 9190 4670 50  0001 C CNN
F 4 "Würth Elektronik" H 9190 4670 50  0001 C CNN "Manufacturer"
F 5 "885012208093" H 9190 4670 50  0001 C CNN "Man. Part No."
F 6 "50V, 1uF MLCC X7R Capacitor, 10% tol, 1206 package" H 9190 4670 50  0001 C CNN "Description"
	1    9190 4670
	1    0    0    -1  
$EndComp
Wire Wire Line
	9190 4520 9190 4500
Connection ~ 9190 4500
Wire Wire Line
	9190 4500 9260 4500
$Comp
L power:GND #PWR?
U 1 1 5FC9CC79
P 9190 4820
AR Path="/5F7F5CD4/5FC9CC79" Ref="#PWR?"  Part="1" 
AR Path="/603DCCC0/5FC9CC79" Ref="#PWR?"  Part="1" 
AR Path="/5F5A48E4/5FC9CC79" Ref="#PWR0423"  Part="1" 
F 0 "#PWR0423" H 9190 4570 50  0001 C CNN
F 1 "GND" H 9190 4670 50  0000 C CNN
F 2 "" H 9190 4820 50  0001 C CNN
F 3 "" H 9190 4820 50  0001 C CNN
	1    9190 4820
	1    0    0    -1  
$EndComp
Wire Wire Line
	10670 2850 10890 2850
Wire Wire Line
	10310 2850 10470 2850
Wire Notes Line
	7100 2150 9250 2150
Wire Notes Line
	9250 2150 9250 950 
Wire Notes Line
	9250 950  7100 950 
$EndSCHEMATC
