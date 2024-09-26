EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Master Controller ADC Expansion"
Date "2020-11-05"
Rev "1.0"
Comp "JFH & SRM"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Vikings_actives:MCP3208-CI_SL U1
U 1 1 5F6E943B
P 1100 6500
F 0 "U1" H 1750 6765 50  0000 C CNN
F 1 "MCP6L02x-xSN" H 1750 6674 50  0000 C CNN
F 2 "Vikings_devices:SOIC127P600X175-16N" H 2250 6600 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21298e.pdf" H 2250 6500 50  0001 L CNN
F 4 "12bit A-Dconverter,MCP3208-CI/SL TSSOP16" H 2250 6400 50  0001 L CNN "Description"
F 5 "1.75" H 2250 6300 50  0001 L CNN "Height"
F 6 "Microchip" H 2250 6200 50  0001 L CNN "Manufacturer_Name"
F 7 "MCP3208-CI/SL" H 2250 6100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "MCP3208-CI/SL" H 2250 6000 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/mcp3208-cisl/microchip-technology" H 2250 5900 50  0001 L CNN "Arrow Price/Stock"
F 10 "579-MCP3208CISL" H 2250 5800 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/Microchip-Technology/MCP3208-CI-SL?qs=BYQkrObauitTKFi1HLZPqw%3D%3D" H 2250 5700 50  0001 L CNN "Mouser Price/Stock"
	1    1100 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5F6E9441
P 2850 6700
F 0 "#PWR019" H 2850 6450 50  0001 C CNN
F 1 "GND" V 2855 6572 50  0000 R CNN
F 2 "" H 2850 6700 50  0001 C CNN
F 3 "" H 2850 6700 50  0001 C CNN
	1    2850 6700
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5F6E9447
P 2500 6300
F 0 "#PWR018" H 2500 6150 50  0001 C CNN
F 1 "+5V" H 2515 6473 50  0000 C CNN
F 2 "" H 2500 6300 50  0001 C CNN
F 3 "" H 2500 6300 50  0001 C CNN
	1    2500 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6600 2500 6600
Wire Wire Line
	2500 6500 2400 6500
$Comp
L Device:C C1
U 1 1 5F6E944F
P 2650 6300
F 0 "C1" V 2600 6450 50  0000 C CNN
F 1 "100 nF" V 2700 6500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2688 6150 50  0001 C CNN
F 3 "~" H 2650 6300 50  0001 C CNN
	1    2650 6300
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5F6E9455
P 2650 6500
F 0 "C2" V 2600 6650 50  0000 C CNN
F 1 "4.7 µF" V 2700 6700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2688 6350 50  0001 C CNN
F 3 "~" H 2650 6500 50  0001 C CNN
	1    2650 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 6700 2850 6700
Connection ~ 2850 6700
Connection ~ 2500 6500
Wire Wire Line
	2500 6500 2500 6600
Wire Wire Line
	2500 6300 2500 6500
Wire Wire Line
	2800 6500 2850 6500
Connection ~ 2850 6500
Wire Wire Line
	2850 6500 2850 6700
Wire Wire Line
	2850 6300 2800 6300
Wire Wire Line
	2850 6300 2850 6500
Connection ~ 2500 6300
$Comp
L power:GND #PWR09
U 1 1 5F6E9466
P 2450 7200
F 0 "#PWR09" H 2450 6950 50  0001 C CNN
F 1 "GND" H 2455 7027 50  0000 C CNN
F 2 "" H 2450 7200 50  0001 C CNN
F 3 "" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7200 2450 7200
Wire Wire Line
	2400 7100 2850 7100
Wire Wire Line
	2850 7000 2400 7000
Wire Wire Line
	2400 6900 2850 6900
Wire Wire Line
	2850 6800 2400 6800
Text Notes 700  6000 0    50   ~ 0
Dedicated ADC for auxiliary sensor signals
Text Notes 5150 650  0    50   ~ 0
Sensor supply and signal filtering
Text Label 900  6700 0    50   ~ 0
CS1_P
Text Label 900  6500 0    50   ~ 0
CS0_P
Text Label 10800 2500 0    50   ~ 0
CS1_P
Wire Notes Line
	5150 650  11050 650 
Wire Notes Line
	11050 1900 5150 1900
Text Notes 8250 3150 2    50   ~ 0
5 V working voltage
Text Notes 8250 1850 2    50   ~ 0
5 V working voltage
$Comp
L Vikings_passives:ESD5Z5.0T1G D1
U 1 1 5FA15419
P 8100 1350
F 0 "D1" V 8200 1100 50  0000 L CNN
F 1 "ESD5Z5.0T1G" V 8295 1478 50  0001 L CNN
F 2 "Vikings_devices:SODFL1608X70N" H 8550 1150 50  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/ESD5Z2.5T1-D.PDF" H 8250 1650 50  0001 L CNN
F 4 "0.7" H 8550 1050 50  0001 L CNN "Height"
F 5 "ON Semiconductor" H 8550 950 50  0001 L CNN "Manufacturer_Name"
F 6 "ESD5Z12T1G" H 8550 850 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "ESD5Z12T1G" H 8550 750 50  0001 L CNN "Arrow Part Number"
F 8 "https://www.arrow.com/en/products/esd5z12t1g/on-semiconductor" H 8550 650 50  0001 L CNN "Arrow Price/Stock"
F 9 "863-ESD5Z12T1G" H 8550 550 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.co.uk/ProductDetail/ON-Semiconductor/ESD5Z12T1G?qs=2OtswVQKCOGXcPEz0%252Bii5A%3D%3D" H 8550 450 50  0001 L CNN "Mouser Price/Stock"
	1    8100 1350
	0    1    1    0   
$EndComp
Connection ~ 8350 1300
Wire Wire Line
	8500 1300 8350 1300
Wire Wire Line
	10550 1600 10550 1700
Wire Wire Line
	9250 1650 9250 1700
Wire Wire Line
	8350 1700 9250 1700
Text Label 10800 1200 0    50   ~ 0
CS0_P
Connection ~ 8350 1700
Wire Wire Line
	8350 1700 8350 1650
Connection ~ 8100 1700
Wire Wire Line
	8100 1650 8100 1700
Wire Wire Line
	8100 1300 8100 1350
Wire Wire Line
	8350 1300 8350 1350
Wire Wire Line
	8100 1300 8350 1300
Connection ~ 8100 1300
Wire Wire Line
	8000 1300 8100 1300
$Comp
L Device:R R5
U 1 1 5F8A2FD6
P 8350 1500
F 0 "R5" H 8400 1550 50  0000 L CNN
F 1 "6.98k" H 8400 1450 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8280 1500 50  0001 C CNN
F 3 "~" H 8350 1500 50  0001 C CNN
	1    8350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1700 8350 1700
Connection ~ 9350 900 
Wire Wire Line
	8850 1300 8900 1300
Connection ~ 8850 1300
Wire Wire Line
	8800 1300 8850 1300
Wire Wire Line
	9250 900  9350 900 
Wire Wire Line
	8850 900  8850 1300
Wire Wire Line
	8950 900  8850 900 
Wire Wire Line
	9250 1300 9250 1350
Wire Wire Line
	9250 1300 9350 1300
Connection ~ 9250 1300
Wire Wire Line
	9200 1300 9250 1300
$Comp
L Device:C C?
U 1 1 5F8A2FC4
P 9100 900
AR Path="/5F94DFD6/5F8A2FC4" Ref="C?"  Part="1" 
AR Path="/5F8A2FC4" Ref="C11"  Part="1" 
F 0 "C11" V 8950 750 50  0000 C CNN
F 1 "56 nF" V 9050 700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9138 750 50  0001 C CNN
F 3 "~" H 9100 900 50  0001 C CNN
	1    9100 900 
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F8A2FBE
P 9250 1500
AR Path="/5F94DFD6/5F8A2FBE" Ref="C?"  Part="1" 
AR Path="/5F8A2FBE" Ref="C15"  Part="1" 
F 0 "C15" H 9350 1500 50  0000 L CNN
F 1 "33 nF" H 9350 1400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9288 1350 50  0001 C CNN
F 3 "~" H 9250 1500 50  0001 C CNN
	1    9250 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F8A2FB8
P 9050 1300
AR Path="/5F94DFD6/5F8A2FB8" Ref="R?"  Part="1" 
AR Path="/5F8A2FB8" Ref="R13"  Part="1" 
F 0 "R13" V 8843 1300 50  0000 C CNN
F 1 "8.66k" V 8934 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8980 1300 50  0001 C CNN
F 3 "~" H 9050 1300 50  0001 C CNN
	1    9050 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F8A2FB2
P 8650 1300
AR Path="/5F94DFD6/5F8A2FB2" Ref="R?"  Part="1" 
AR Path="/5F8A2FB2" Ref="R9"  Part="1" 
F 0 "R9" V 8443 1300 50  0000 C CNN
F 1 "8.66k" V 8534 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8580 1300 50  0001 C CNN
F 3 "~" H 8650 1300 50  0001 C CNN
	1    8650 1300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8A2FAC
P 8100 1700
AR Path="/5F94DFD6/5F8A2FAC" Ref="#PWR?"  Part="1" 
AR Path="/5F8A2FAC" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 8100 1450 50  0001 C CNN
F 1 "GND" V 8100 1500 50  0000 C CNN
F 2 "" H 8100 1700 50  0001 C CNN
F 3 "" H 8100 1700 50  0001 C CNN
	1    8100 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 1200 10150 1200
Connection ~ 10050 1200
Wire Wire Line
	9350 900  10050 900 
Wire Wire Line
	10050 1200 10050 900 
Wire Wire Line
	9950 1200 10050 1200
Wire Wire Line
	9350 1100 9350 900 
Wire Wire Line
	10550 1200 10800 1200
Connection ~ 10550 1200
Wire Wire Line
	10550 1200 10550 1300
Wire Wire Line
	10450 1200 10550 1200
$Comp
L Device:C C?
U 1 1 5F8A2F85
P 10550 1450
AR Path="/5F94DFD6/5F8A2F85" Ref="C?"  Part="1" 
AR Path="/5F8A2F85" Ref="C19"  Part="1" 
F 0 "C19" H 10665 1496 50  0000 L CNN
F 1 "15 nF" H 10665 1405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10588 1300 50  0001 C CNN
F 3 "~" H 10550 1450 50  0001 C CNN
	1    10550 1450
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:MCP6L02x-xSN U?
U 1 1 5F87E777
P 9650 1200
AR Path="/5F94DFD6/5F87E777" Ref="U?"  Part="1" 
AR Path="/5F87E777" Ref="U2"  Part="1" 
F 0 "U2" H 9850 1050 50  0000 C CNN
F 1 "MCP6L02x-xSN" H 9850 950 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9750 1200 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/22140b.pdf" H 9900 1350 50  0001 C CNN
	1    9650 1200
	1    0    0    1   
$EndComp
Wire Notes Line
	700  6000 700  7550
$Comp
L Amplifier_Operational:MCP6L02x-xSN U2
U 3 1 5FBF0C2F
P 4250 6800
F 0 "U2" H 4300 6800 50  0000 L CNN
F 1 "MCP6L02x-xSN" H 4308 6755 50  0001 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4350 6800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/22140b.pdf" H 4500 6950 50  0001 C CNN
	3    4250 6800
	1    0    0    -1  
$EndComp
Wire Notes Line
	5150 3200 11050 3200
Text Notes 8250 4400 2    50   ~ 0
5 V working voltage
Text Notes 8250 5700 2    50   ~ 0
5 V working voltage
Wire Notes Line
	11050 4450 5150 4450
$Comp
L power:+5V #PWR?
U 1 1 5FC30FE2
P 6900 3700
AR Path="/5F94DFD6/5FC30FE2" Ref="#PWR?"  Part="1" 
AR Path="/5FC30FE2" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 6900 3550 50  0001 C CNN
F 1 "+5V" H 6915 3873 50  0000 C CNN
F 2 "" H 6900 3700 50  0001 C CNN
F 3 "" H 6900 3700 50  0001 C CNN
	1    6900 3700
	1    0    0    -1  
$EndComp
Text Label 10800 3750 0    50   ~ 0
A2_P
Text Label 10800 5050 0    50   ~ 0
A3_P
Text Label 900  6900 0    50   ~ 0
A2_P
Text Label 900  7100 0    50   ~ 0
A3_P
Text Label 6200 3700 2    50   ~ 0
AuxSensor2Supply
$Comp
L power:GND #PWR033
U 1 1 5FDD51D5
P 6900 4050
F 0 "#PWR033" H 6900 3800 50  0001 C CNN
F 1 "GND" H 6905 3877 50  0000 C CNN
F 2 "" H 6900 4050 50  0001 C CNN
F 3 "" H 6900 4050 50  0001 C CNN
	1    6900 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FDECA23
P 6550 3700
F 0 "R1" V 6450 3650 50  0000 L CNN
F 1 "0R" V 6550 3650 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6480 3700 50  0001 C CNN
F 3 "~" H 6550 3700 50  0001 C CNN
	1    6550 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 3700 6700 3700
Wire Wire Line
	6400 3700 6200 3700
Wire Wire Line
	6900 4050 6700 4050
Wire Wire Line
	6400 4050 6200 4050
Text Label 6200 4050 2    50   ~ 0
AuxSensor2Ground
$Comp
L power:+5V #PWR?
U 1 1 5FEB9D83
P 6900 5000
AR Path="/5F94DFD6/5FEB9D83" Ref="#PWR?"  Part="1" 
AR Path="/5FEB9D83" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 6900 4850 50  0001 C CNN
F 1 "+5V" H 6915 5173 50  0000 C CNN
F 2 "" H 6900 5000 50  0001 C CNN
F 3 "" H 6900 5000 50  0001 C CNN
	1    6900 5000
	1    0    0    -1  
$EndComp
Text Label 6200 5000 2    50   ~ 0
AuxSensor3Supply
$Comp
L power:GND #PWR035
U 1 1 5FEB9D8A
P 6900 5350
F 0 "#PWR035" H 6900 5100 50  0001 C CNN
F 1 "GND" H 6905 5177 50  0000 C CNN
F 2 "" H 6900 5350 50  0001 C CNN
F 3 "" H 6900 5350 50  0001 C CNN
	1    6900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5000 6700 5000
Wire Wire Line
	6400 5000 6200 5000
Wire Wire Line
	6900 5350 6700 5350
Wire Wire Line
	6400 5350 6200 5350
Text Label 6200 5350 2    50   ~ 0
AuxSensor3Ground
Text Label 8000 1300 2    50   ~ 0
CoolSensor0
Text Label 8000 2600 2    50   ~ 0
CoolSensor1
Text Label 8000 3850 2    50   ~ 0
AuxSensor2
Text Label 8000 5150 2    50   ~ 0
AuxSensor3
$Comp
L Vikings_passives:ESD5Z5.0T1G D2
U 1 1 5FF8F6BE
P 8100 2650
F 0 "D2" V 8200 2400 50  0000 L CNN
F 1 "ESD5Z5.0T1G" V 8295 2778 50  0001 L CNN
F 2 "Vikings_devices:SODFL1608X70N" H 8550 2450 50  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/ESD5Z2.5T1-D.PDF" H 8250 2950 50  0001 L CNN
F 4 "0.7" H 8550 2350 50  0001 L CNN "Height"
F 5 "ON Semiconductor" H 8550 2250 50  0001 L CNN "Manufacturer_Name"
F 6 "ESD5Z12T1G" H 8550 2150 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "ESD5Z12T1G" H 8550 2050 50  0001 L CNN "Arrow Part Number"
F 8 "https://www.arrow.com/en/products/esd5z12t1g/on-semiconductor" H 8550 1950 50  0001 L CNN "Arrow Price/Stock"
F 9 "863-ESD5Z12T1G" H 8550 1850 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.co.uk/ProductDetail/ON-Semiconductor/ESD5Z12T1G?qs=2OtswVQKCOGXcPEz0%252Bii5A%3D%3D" H 8550 1750 50  0001 L CNN "Mouser Price/Stock"
	1    8100 2650
	0    1    1    0   
$EndComp
Connection ~ 8350 2600
Wire Wire Line
	8500 2600 8350 2600
Wire Wire Line
	10550 2900 10550 3000
Wire Wire Line
	9250 2950 9250 3000
Wire Wire Line
	8350 3000 9250 3000
Connection ~ 8350 3000
Wire Wire Line
	8350 3000 8350 2950
Connection ~ 8100 3000
Wire Wire Line
	8100 2950 8100 3000
Wire Wire Line
	8100 2600 8100 2650
Wire Wire Line
	8350 2600 8350 2650
Wire Wire Line
	8100 2600 8350 2600
Connection ~ 8100 2600
Wire Wire Line
	8000 2600 8100 2600
$Comp
L Device:R R6
U 1 1 5FF8F6D4
P 8350 2800
F 0 "R6" H 8400 2850 50  0000 L CNN
F 1 "6.98k" H 8400 2750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8280 2800 50  0001 C CNN
F 3 "~" H 8350 2800 50  0001 C CNN
	1    8350 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3000 8350 3000
Connection ~ 9350 2200
Wire Wire Line
	8850 2600 8900 2600
Connection ~ 8850 2600
Wire Wire Line
	8800 2600 8850 2600
Wire Wire Line
	9250 2200 9350 2200
Wire Wire Line
	8850 2200 8850 2600
Wire Wire Line
	8950 2200 8850 2200
Wire Wire Line
	9250 2600 9250 2650
Wire Wire Line
	9250 2600 9350 2600
Connection ~ 9250 2600
Wire Wire Line
	9200 2600 9250 2600
$Comp
L Device:C C?
U 1 1 5FF8F6E6
P 9100 2200
AR Path="/5F94DFD6/5FF8F6E6" Ref="C?"  Part="1" 
AR Path="/5FF8F6E6" Ref="C12"  Part="1" 
F 0 "C12" V 8950 2050 50  0000 C CNN
F 1 "56 nF" V 9050 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9138 2050 50  0001 C CNN
F 3 "~" H 9100 2200 50  0001 C CNN
	1    9100 2200
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FF8F6EC
P 9250 2800
AR Path="/5F94DFD6/5FF8F6EC" Ref="C?"  Part="1" 
AR Path="/5FF8F6EC" Ref="C16"  Part="1" 
F 0 "C16" H 9350 2800 50  0000 L CNN
F 1 "33 nF" H 9350 2700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9288 2650 50  0001 C CNN
F 3 "~" H 9250 2800 50  0001 C CNN
	1    9250 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF8F6F2
P 9050 2600
AR Path="/5F94DFD6/5FF8F6F2" Ref="R?"  Part="1" 
AR Path="/5FF8F6F2" Ref="R14"  Part="1" 
F 0 "R14" V 8843 2600 50  0000 C CNN
F 1 "8.66k" V 8934 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8980 2600 50  0001 C CNN
F 3 "~" H 9050 2600 50  0001 C CNN
	1    9050 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FF8F6F8
P 8650 2600
AR Path="/5F94DFD6/5FF8F6F8" Ref="R?"  Part="1" 
AR Path="/5FF8F6F8" Ref="R10"  Part="1" 
F 0 "R10" V 8443 2600 50  0000 C CNN
F 1 "8.66k" V 8534 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8580 2600 50  0001 C CNN
F 3 "~" H 8650 2600 50  0001 C CNN
	1    8650 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF8F6FE
P 8100 3000
AR Path="/5F94DFD6/5FF8F6FE" Ref="#PWR?"  Part="1" 
AR Path="/5FF8F6FE" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 8100 2750 50  0001 C CNN
F 1 "GND" V 8100 2800 50  0000 C CNN
F 2 "" H 8100 3000 50  0001 C CNN
F 3 "" H 8100 3000 50  0001 C CNN
	1    8100 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 2500 10150 2500
Connection ~ 10050 2500
Wire Wire Line
	9350 2200 10050 2200
Wire Wire Line
	10050 2500 10050 2200
Wire Wire Line
	9950 2500 10050 2500
Wire Wire Line
	9350 2400 9350 2200
Wire Wire Line
	10550 2500 10800 2500
Connection ~ 10550 2500
Wire Wire Line
	10550 2500 10550 2600
Wire Wire Line
	10450 2500 10550 2500
$Comp
L Device:C C?
U 1 1 5FF8F70E
P 10550 2750
AR Path="/5F94DFD6/5FF8F70E" Ref="C?"  Part="1" 
AR Path="/5FF8F70E" Ref="C20"  Part="1" 
F 0 "C20" H 10665 2796 50  0000 L CNN
F 1 "15 nF" H 10665 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10588 2600 50  0001 C CNN
F 3 "~" H 10550 2750 50  0001 C CNN
	1    10550 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF8F714
P 10300 2500
AR Path="/5F94DFD6/5FF8F714" Ref="R?"  Part="1" 
AR Path="/5FF8F714" Ref="R19"  Part="1" 
F 0 "R19" V 10093 2500 50  0000 C CNN
F 1 "147 R" V 10184 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 2500 50  0001 C CNN
F 3 "~" H 10300 2500 50  0001 C CNN
	1    10300 2500
	0    1    1    0   
$EndComp
$Comp
L Vikings_passives:ESD5Z5.0T1G D3
U 1 1 5FFE2248
P 8100 3900
F 0 "D3" V 8200 3650 50  0000 L CNN
F 1 "ESD5Z5.0T1G" V 8295 4028 50  0001 L CNN
F 2 "Vikings_devices:SODFL1608X70N" H 8550 3700 50  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/ESD5Z2.5T1-D.PDF" H 8250 4200 50  0001 L CNN
F 4 "0.7" H 8550 3600 50  0001 L CNN "Height"
F 5 "ON Semiconductor" H 8550 3500 50  0001 L CNN "Manufacturer_Name"
F 6 "ESD5Z12T1G" H 8550 3400 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "ESD5Z12T1G" H 8550 3300 50  0001 L CNN "Arrow Part Number"
F 8 "https://www.arrow.com/en/products/esd5z12t1g/on-semiconductor" H 8550 3200 50  0001 L CNN "Arrow Price/Stock"
F 9 "863-ESD5Z12T1G" H 8550 3100 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.co.uk/ProductDetail/ON-Semiconductor/ESD5Z12T1G?qs=2OtswVQKCOGXcPEz0%252Bii5A%3D%3D" H 8550 3000 50  0001 L CNN "Mouser Price/Stock"
	1    8100 3900
	0    1    1    0   
$EndComp
Connection ~ 8350 3850
Wire Wire Line
	8500 3850 8350 3850
Wire Wire Line
	10550 4150 10550 4250
Wire Wire Line
	9250 4200 9250 4250
Wire Wire Line
	8350 4250 9250 4250
Connection ~ 8350 4250
Wire Wire Line
	8350 4250 8350 4200
Connection ~ 8100 4250
Wire Wire Line
	8100 4200 8100 4250
Wire Wire Line
	8100 3850 8100 3900
Wire Wire Line
	8350 3850 8350 3900
Wire Wire Line
	8100 3850 8350 3850
Connection ~ 8100 3850
Wire Wire Line
	8000 3850 8100 3850
$Comp
L Device:R R7
U 1 1 5FFE225E
P 8350 4050
F 0 "R7" H 8400 4100 50  0000 L CNN
F 1 "NC" H 8400 4000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8280 4050 50  0001 C CNN
F 3 "~" H 8350 4050 50  0001 C CNN
	1    8350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4250 8350 4250
Connection ~ 9350 3450
Wire Wire Line
	8850 3850 8900 3850
Connection ~ 8850 3850
Wire Wire Line
	8800 3850 8850 3850
Wire Wire Line
	9250 3450 9350 3450
Wire Wire Line
	8850 3450 8850 3850
Wire Wire Line
	8950 3450 8850 3450
Wire Wire Line
	9250 3850 9250 3900
Wire Wire Line
	9250 3850 9350 3850
Connection ~ 9250 3850
Wire Wire Line
	9200 3850 9250 3850
$Comp
L Device:C C?
U 1 1 5FFE2270
P 9100 3450
AR Path="/5F94DFD6/5FFE2270" Ref="C?"  Part="1" 
AR Path="/5FFE2270" Ref="C13"  Part="1" 
F 0 "C13" V 8950 3300 50  0000 C CNN
F 1 "56 nF" V 9050 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9138 3300 50  0001 C CNN
F 3 "~" H 9100 3450 50  0001 C CNN
	1    9100 3450
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FFE2276
P 9250 4050
AR Path="/5F94DFD6/5FFE2276" Ref="C?"  Part="1" 
AR Path="/5FFE2276" Ref="C17"  Part="1" 
F 0 "C17" H 9350 4050 50  0000 L CNN
F 1 "33 nF" H 9350 3950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9288 3900 50  0001 C CNN
F 3 "~" H 9250 4050 50  0001 C CNN
	1    9250 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FFE227C
P 9050 3850
AR Path="/5F94DFD6/5FFE227C" Ref="R?"  Part="1" 
AR Path="/5FFE227C" Ref="R15"  Part="1" 
F 0 "R15" V 8843 3850 50  0000 C CNN
F 1 "8.66k" V 8934 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8980 3850 50  0001 C CNN
F 3 "~" H 9050 3850 50  0001 C CNN
	1    9050 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FFE2282
P 8650 3850
AR Path="/5F94DFD6/5FFE2282" Ref="R?"  Part="1" 
AR Path="/5FFE2282" Ref="R11"  Part="1" 
F 0 "R11" V 8443 3850 50  0000 C CNN
F 1 "8.66k" V 8534 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8580 3850 50  0001 C CNN
F 3 "~" H 8650 3850 50  0001 C CNN
	1    8650 3850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FFE2288
P 8100 4250
AR Path="/5F94DFD6/5FFE2288" Ref="#PWR?"  Part="1" 
AR Path="/5FFE2288" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 8100 4000 50  0001 C CNN
F 1 "GND" V 8100 4050 50  0000 C CNN
F 2 "" H 8100 4250 50  0001 C CNN
F 3 "" H 8100 4250 50  0001 C CNN
	1    8100 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 3750 10150 3750
Connection ~ 10050 3750
Wire Wire Line
	9350 3450 10050 3450
Wire Wire Line
	10050 3750 10050 3450
Wire Wire Line
	9950 3750 10050 3750
Wire Wire Line
	9350 3650 9350 3450
Wire Wire Line
	10550 3750 10800 3750
Connection ~ 10550 3750
Wire Wire Line
	10550 3750 10550 3850
Wire Wire Line
	10450 3750 10550 3750
$Comp
L Device:C C?
U 1 1 5FFE2298
P 10550 4000
AR Path="/5F94DFD6/5FFE2298" Ref="C?"  Part="1" 
AR Path="/5FFE2298" Ref="C21"  Part="1" 
F 0 "C21" H 10665 4046 50  0000 L CNN
F 1 "15 nF" H 10665 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10588 3850 50  0001 C CNN
F 3 "~" H 10550 4000 50  0001 C CNN
	1    10550 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FFE229E
P 10300 3750
AR Path="/5F94DFD6/5FFE229E" Ref="R?"  Part="1" 
AR Path="/5FFE229E" Ref="R21"  Part="1" 
F 0 "R21" V 10093 3750 50  0000 C CNN
F 1 "147 R" V 10184 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 3750 50  0001 C CNN
F 3 "~" H 10300 3750 50  0001 C CNN
	1    10300 3750
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:MCP6L02x-xSN U?
U 1 1 5FFE22A4
P 9650 3750
AR Path="/5F94DFD6/5FFE22A4" Ref="U?"  Part="1" 
AR Path="/5FFE22A4" Ref="U3"  Part="1" 
F 0 "U3" H 9850 3600 50  0000 C CNN
F 1 "MCP6L02x-xSN" H 9850 3500 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9750 3750 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/22140b.pdf" H 9900 3900 50  0001 C CNN
	1    9650 3750
	1    0    0    1   
$EndComp
$Comp
L Vikings_passives:ESD5Z5.0T1G D4
U 1 1 60035EC3
P 8100 5200
F 0 "D4" V 8200 4950 50  0000 L CNN
F 1 "ESD5Z5.0T1G" V 8295 5328 50  0001 L CNN
F 2 "Vikings_devices:SODFL1608X70N" H 8550 5000 50  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/ESD5Z2.5T1-D.PDF" H 8250 5500 50  0001 L CNN
F 4 "0.7" H 8550 4900 50  0001 L CNN "Height"
F 5 "ON Semiconductor" H 8550 4800 50  0001 L CNN "Manufacturer_Name"
F 6 "ESD5Z12T1G" H 8550 4700 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "ESD5Z12T1G" H 8550 4600 50  0001 L CNN "Arrow Part Number"
F 8 "https://www.arrow.com/en/products/esd5z12t1g/on-semiconductor" H 8550 4500 50  0001 L CNN "Arrow Price/Stock"
F 9 "863-ESD5Z12T1G" H 8550 4400 50  0001 L CNN "Mouser Part Number"
F 10 "https://www.mouser.co.uk/ProductDetail/ON-Semiconductor/ESD5Z12T1G?qs=2OtswVQKCOGXcPEz0%252Bii5A%3D%3D" H 8550 4300 50  0001 L CNN "Mouser Price/Stock"
	1    8100 5200
	0    1    1    0   
$EndComp
Connection ~ 8350 5150
Wire Wire Line
	8500 5150 8350 5150
Wire Wire Line
	10550 5450 10550 5550
Wire Wire Line
	9250 5500 9250 5550
Wire Wire Line
	8350 5550 9250 5550
Connection ~ 8350 5550
Wire Wire Line
	8350 5550 8350 5500
Connection ~ 8100 5550
Wire Wire Line
	8100 5500 8100 5550
Wire Wire Line
	8100 5150 8100 5200
Wire Wire Line
	8350 5150 8350 5200
Wire Wire Line
	8100 5150 8350 5150
Connection ~ 8100 5150
Wire Wire Line
	8000 5150 8100 5150
$Comp
L Device:R R8
U 1 1 60035ED9
P 8350 5350
F 0 "R8" H 8400 5400 50  0000 L CNN
F 1 "NC" H 8400 5300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8280 5350 50  0001 C CNN
F 3 "~" H 8350 5350 50  0001 C CNN
	1    8350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 5550 8350 5550
Connection ~ 9350 4750
Wire Wire Line
	8850 5150 8900 5150
Connection ~ 8850 5150
Wire Wire Line
	8800 5150 8850 5150
Wire Wire Line
	9250 4750 9350 4750
Wire Wire Line
	8850 4750 8850 5150
Wire Wire Line
	8950 4750 8850 4750
Wire Wire Line
	9250 5150 9250 5200
Wire Wire Line
	9250 5150 9350 5150
Connection ~ 9250 5150
Wire Wire Line
	9200 5150 9250 5150
$Comp
L Device:C C?
U 1 1 60035EEB
P 9100 4750
AR Path="/5F94DFD6/60035EEB" Ref="C?"  Part="1" 
AR Path="/60035EEB" Ref="C14"  Part="1" 
F 0 "C14" V 8950 4600 50  0000 C CNN
F 1 "56 nF" V 9050 4550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9138 4600 50  0001 C CNN
F 3 "~" H 9100 4750 50  0001 C CNN
	1    9100 4750
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60035EF1
P 9250 5350
AR Path="/5F94DFD6/60035EF1" Ref="C?"  Part="1" 
AR Path="/60035EF1" Ref="C18"  Part="1" 
F 0 "C18" H 9350 5350 50  0000 L CNN
F 1 "33 nF" H 9350 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9288 5200 50  0001 C CNN
F 3 "~" H 9250 5350 50  0001 C CNN
	1    9250 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60035EF7
P 9050 5150
AR Path="/5F94DFD6/60035EF7" Ref="R?"  Part="1" 
AR Path="/60035EF7" Ref="R16"  Part="1" 
F 0 "R16" V 8843 5150 50  0000 C CNN
F 1 "8.66k" V 8934 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8980 5150 50  0001 C CNN
F 3 "~" H 9050 5150 50  0001 C CNN
	1    9050 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60035EFD
P 8650 5150
AR Path="/5F94DFD6/60035EFD" Ref="R?"  Part="1" 
AR Path="/60035EFD" Ref="R12"  Part="1" 
F 0 "R12" V 8443 5150 50  0000 C CNN
F 1 "8.66k" V 8534 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8580 5150 50  0001 C CNN
F 3 "~" H 8650 5150 50  0001 C CNN
	1    8650 5150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60035F03
P 8100 5550
AR Path="/5F94DFD6/60035F03" Ref="#PWR?"  Part="1" 
AR Path="/60035F03" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 8100 5300 50  0001 C CNN
F 1 "GND" V 8100 5350 50  0000 C CNN
F 2 "" H 8100 5550 50  0001 C CNN
F 3 "" H 8100 5550 50  0001 C CNN
	1    8100 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 5050 10150 5050
Connection ~ 10050 5050
Wire Wire Line
	9350 4750 10050 4750
Wire Wire Line
	10050 5050 10050 4750
Wire Wire Line
	9950 5050 10050 5050
Wire Wire Line
	9350 4950 9350 4750
Wire Wire Line
	10550 5050 10800 5050
Connection ~ 10550 5050
Wire Wire Line
	10550 5050 10550 5150
Wire Wire Line
	10450 5050 10550 5050
$Comp
L Device:C C?
U 1 1 60035F13
P 10550 5300
AR Path="/5F94DFD6/60035F13" Ref="C?"  Part="1" 
AR Path="/60035F13" Ref="C22"  Part="1" 
F 0 "C22" H 10665 5346 50  0000 L CNN
F 1 "15 nF" H 10665 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10588 5150 50  0001 C CNN
F 3 "~" H 10550 5300 50  0001 C CNN
	1    10550 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60035F19
P 10300 5050
AR Path="/5F94DFD6/60035F19" Ref="R?"  Part="1" 
AR Path="/60035F19" Ref="R23"  Part="1" 
F 0 "R23" V 10093 5050 50  0000 C CNN
F 1 "147 R" V 10184 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 5050 50  0001 C CNN
F 3 "~" H 10300 5050 50  0001 C CNN
	1    10300 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 601943BC
P 6550 4050
F 0 "R2" V 6450 4000 50  0000 L CNN
F 1 "0R" V 6550 4000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6480 4050 50  0001 C CNN
F 3 "~" H 6550 4050 50  0001 C CNN
	1    6550 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 60195380
P 6550 5000
F 0 "R3" V 6450 4950 50  0000 L CNN
F 1 "0R" V 6550 4950 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6480 5000 50  0001 C CNN
F 3 "~" H 6550 5000 50  0001 C CNN
	1    6550 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 60195386
P 6550 5350
F 0 "R4" V 6450 5300 50  0000 L CNN
F 1 "0R" V 6550 5300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6480 5350 50  0001 C CNN
F 3 "~" H 6550 5350 50  0001 C CNN
	1    6550 5350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 6022C200
P 4250 6450
F 0 "#PWR020" H 4250 6300 50  0001 C CNN
F 1 "+5V" H 4250 6600 50  0000 C CNN
F 2 "" H 4250 6450 50  0001 C CNN
F 3 "" H 4250 6450 50  0001 C CNN
	1    4250 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6450 4250 6500
$Comp
L power:GND #PWR?
U 1 1 60245804
P 4250 7150
AR Path="/5F94DFD6/60245804" Ref="#PWR?"  Part="1" 
AR Path="/60245804" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 4250 6900 50  0001 C CNN
F 1 "GND" H 4250 7000 50  0000 C CNN
F 2 "" H 4250 7150 50  0001 C CNN
F 3 "" H 4250 7150 50  0001 C CNN
	1    4250 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 7150 4250 7100
$Comp
L Device:C C3
U 1 1 60292182
P 3900 6800
F 0 "C3" H 4050 6750 50  0000 C CNN
F 1 "100 nF" H 4150 6850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3938 6650 50  0001 C CNN
F 3 "~" H 3900 6800 50  0001 C CNN
	1    3900 6800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C7
U 1 1 602948A3
P 4600 6800
F 0 "C7" H 4400 6750 50  0000 C CNN
F 1 "10 µF" H 4350 6850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4638 6650 50  0001 C CNN
F 3 "~" H 4600 6800 50  0001 C CNN
	1    4600 6800
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 6650 3900 6500
Wire Wire Line
	3900 6500 4250 6500
Connection ~ 4250 6500
Wire Wire Line
	4250 6500 4600 6500
Wire Wire Line
	4600 6500 4600 6650
Wire Wire Line
	4600 6950 4600 7100
Wire Wire Line
	4600 7100 4250 7100
Connection ~ 4250 7100
Wire Wire Line
	4250 7100 3900 7100
Wire Wire Line
	3900 7100 3900 6950
$Comp
L Amplifier_Operational:MCP6L02x-xSN U3
U 3 1 6033AFE8
P 5900 6800
F 0 "U3" H 5950 6800 50  0000 L CNN
F 1 "MCP6L02x-xSN" H 5958 6755 50  0001 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6000 6800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/22140b.pdf" H 6150 6950 50  0001 C CNN
	3    5900 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 6033AFEE
P 5900 6450
F 0 "#PWR022" H 5900 6300 50  0001 C CNN
F 1 "+5V" H 5900 6600 50  0000 C CNN
F 2 "" H 5900 6450 50  0001 C CNN
F 3 "" H 5900 6450 50  0001 C CNN
	1    5900 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 6450 5900 6500
$Comp
L power:GND #PWR?
U 1 1 6033AFF5
P 5900 7150
AR Path="/5F94DFD6/6033AFF5" Ref="#PWR?"  Part="1" 
AR Path="/6033AFF5" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 5900 6900 50  0001 C CNN
F 1 "GND" H 5900 7000 50  0000 C CNN
F 2 "" H 5900 7150 50  0001 C CNN
F 3 "" H 5900 7150 50  0001 C CNN
	1    5900 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 7150 5900 7100
$Comp
L Device:C C4
U 1 1 6033AFFC
P 5550 6800
F 0 "C4" H 5700 6750 50  0000 C CNN
F 1 "100 nF" H 5800 6850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5588 6650 50  0001 C CNN
F 3 "~" H 5550 6800 50  0001 C CNN
	1    5550 6800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C8
U 1 1 6033B002
P 6250 6800
F 0 "C8" H 6050 6750 50  0000 C CNN
F 1 "10 µF" H 6000 6850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6288 6650 50  0001 C CNN
F 3 "~" H 6250 6800 50  0001 C CNN
	1    6250 6800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 6650 5550 6500
Wire Wire Line
	5550 6500 5900 6500
Connection ~ 5900 6500
Wire Wire Line
	5900 6500 6250 6500
Wire Wire Line
	6250 6500 6250 6650
Wire Wire Line
	6250 6950 6250 7100
Wire Wire Line
	6250 7100 5900 7100
Connection ~ 5900 7100
Wire Wire Line
	5900 7100 5550 7100
Wire Wire Line
	5550 7100 5550 6950
Text Notes 3200 6000 0    50   ~ 0
Power for operational amplifiers
Text Label 2850 6800 2    50   ~ 0
SPI_CLK
Text Label 2850 6900 2    50   ~ 0
SPI_OUT
Text Label 2850 7000 2    50   ~ 0
SPI_IN
Text Label 2850 7100 2    50   ~ 0
SPI_CS
Wire Notes Line
	3200 7550 3200 6000
Text Notes 700  7650 0    50   ~ 0
Place filters close to ADC
$Comp
L Amplifier_Operational:MCP6L02x-xSN U2
U 2 1 60489942
P 9650 2500
F 0 "U2" H 9900 2350 50  0000 C CNN
F 1 "MCP6L02x-xSN" H 9900 2250 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9750 2500 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/22140b.pdf" H 9900 2650 50  0001 C CNN
	2    9650 2500
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6L02x-xSN U3
U 2 1 6048B78E
P 9650 5050
F 0 "U3" H 9900 4900 50  0000 C CNN
F 1 "MCP6L02x-xSN" H 9900 4800 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9750 5050 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/22140b.pdf" H 9900 5200 50  0001 C CNN
	2    9650 5050
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 607BF713
P 6900 2450
AR Path="/5F94DFD6/607BF713" Ref="#PWR?"  Part="1" 
AR Path="/607BF713" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 6900 2300 50  0001 C CNN
F 1 "+5V" H 6915 2623 50  0000 C CNN
F 2 "" H 6900 2450 50  0001 C CNN
F 3 "" H 6900 2450 50  0001 C CNN
	1    6900 2450
	1    0    0    -1  
$EndComp
Text Label 6200 2450 2    50   ~ 0
CoolSensor1Supply
$Comp
L power:GND #PWR031
U 1 1 607BF71A
P 6900 2800
F 0 "#PWR031" H 6900 2550 50  0001 C CNN
F 1 "GND" H 6905 2627 50  0000 C CNN
F 2 "" H 6900 2800 50  0001 C CNN
F 3 "" H 6900 2800 50  0001 C CNN
	1    6900 2800
	1    0    0    -1  
$EndComp
Text Label 6200 2800 2    50   ~ 0
CoolSensor1Ground
Wire Wire Line
	6200 2450 6900 2450
Wire Wire Line
	6200 2800 6900 2800
$Comp
L power:+5V #PWR?
U 1 1 60854F6C
P 6900 1150
AR Path="/5F94DFD6/60854F6C" Ref="#PWR?"  Part="1" 
AR Path="/60854F6C" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 6900 1000 50  0001 C CNN
F 1 "+5V" H 6915 1323 50  0000 C CNN
F 2 "" H 6900 1150 50  0001 C CNN
F 3 "" H 6900 1150 50  0001 C CNN
	1    6900 1150
	1    0    0    -1  
$EndComp
Text Label 6200 1150 2    50   ~ 0
CoolSensor0Supply
$Comp
L power:GND #PWR029
U 1 1 60854F73
P 6900 1500
F 0 "#PWR029" H 6900 1250 50  0001 C CNN
F 1 "GND" H 6905 1327 50  0000 C CNN
F 2 "" H 6900 1500 50  0001 C CNN
F 3 "" H 6900 1500 50  0001 C CNN
	1    6900 1500
	1    0    0    -1  
$EndComp
Text Label 6200 1500 2    50   ~ 0
CoolSensor0Ground
Wire Wire Line
	6200 1150 6900 1150
Wire Wire Line
	6200 1500 6900 1500
Wire Wire Line
	900  7100 1100 7100
Wire Wire Line
	900  6900 1100 6900
Wire Wire Line
	900  6700 1100 6700
Wire Wire Line
	900  6500 1100 6500
$Comp
L Device:R R?
U 1 1 5FB060A0
P 10300 3000
AR Path="/5F94DFD6/5FB060A0" Ref="R?"  Part="1" 
AR Path="/5FB060A0" Ref="R20"  Part="1" 
F 0 "R20" V 10093 3000 50  0000 C CNN
F 1 "147 R" V 10184 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 3000 50  0001 C CNN
F 3 "~" H 10300 3000 50  0001 C CNN
	1    10300 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 3000 10550 3000
Wire Wire Line
	10150 3000 9250 3000
Connection ~ 9250 3000
$Comp
L Device:R R?
U 1 1 5FB3993F
P 10300 4250
AR Path="/5F94DFD6/5FB3993F" Ref="R?"  Part="1" 
AR Path="/5FB3993F" Ref="R22"  Part="1" 
F 0 "R22" V 10093 4250 50  0000 C CNN
F 1 "147 R" V 10184 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 4250 50  0001 C CNN
F 3 "~" H 10300 4250 50  0001 C CNN
	1    10300 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 4250 10550 4250
Wire Wire Line
	10150 4250 9250 4250
Connection ~ 9250 4250
Wire Wire Line
	1100 6600 900  6600
Wire Wire Line
	900  6800 1100 6800
Wire Wire Line
	1100 7000 900  7000
Wire Wire Line
	900  7200 1100 7200
Wire Notes Line
	11050 650  11050 5750
Wire Notes Line
	5150 5750 5150 650 
Wire Wire Line
	10800 1700 10550 1700
Text Label 10800 1700 0    50   ~ 0
CS0_N
Wire Wire Line
	10800 3000 10550 3000
Text Label 10800 3000 0    50   ~ 0
CS1_N
$Comp
L Device:R R?
U 1 1 5F8A2F7F
P 10300 1200
AR Path="/5F94DFD6/5F8A2F7F" Ref="R?"  Part="1" 
AR Path="/5F8A2F7F" Ref="R17"  Part="1" 
F 0 "R17" V 10093 1200 50  0000 C CNN
F 1 "147 R" V 10184 1200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 1200 50  0001 C CNN
F 3 "~" H 10300 1200 50  0001 C CNN
	1    10300 1200
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FD2D33D
P 10300 1700
AR Path="/5F94DFD6/5FD2D33D" Ref="R?"  Part="1" 
AR Path="/5FD2D33D" Ref="R18"  Part="1" 
F 0 "R18" V 10093 1700 50  0000 C CNN
F 1 "147 R" V 10184 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 1700 50  0001 C CNN
F 3 "~" H 10300 1700 50  0001 C CNN
	1    10300 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 1700 10550 1700
Connection ~ 10550 1700
Wire Wire Line
	10150 1700 9250 1700
Connection ~ 9250 1700
Wire Wire Line
	10800 4250 10550 4250
Text Label 10800 4250 0    50   ~ 0
A2_N
$Comp
L Device:R R?
U 1 1 5FD5F3A0
P 10300 5550
AR Path="/5F94DFD6/5FD5F3A0" Ref="R?"  Part="1" 
AR Path="/5FD5F3A0" Ref="R24"  Part="1" 
F 0 "R24" V 10093 5550 50  0000 C CNN
F 1 "147 R" V 10184 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 5550 50  0001 C CNN
F 3 "~" H 10300 5550 50  0001 C CNN
	1    10300 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 5550 10550 5550
Wire Wire Line
	10150 5550 9250 5550
Connection ~ 9250 5550
Wire Wire Line
	10800 5550 10550 5550
Text Label 10800 5550 0    50   ~ 0
A3_N
Text Label 900  6600 0    50   ~ 0
CS0_N
Text Label 900  6800 0    50   ~ 0
CS1_N
Text Label 900  7000 0    50   ~ 0
A2_N
Text Label 900  7200 0    50   ~ 0
A3_N
Connection ~ 10550 3000
Connection ~ 10550 4250
Connection ~ 10550 5550
NoConn ~ 1650 5150
NoConn ~ 1650 5050
NoConn ~ 1650 4850
NoConn ~ 1650 4750
NoConn ~ 1650 4650
NoConn ~ 1650 4550
NoConn ~ 1650 4150
NoConn ~ 1650 4050
NoConn ~ 1650 3750
NoConn ~ 1650 3650
NoConn ~ 2650 3650
NoConn ~ 2650 3750
NoConn ~ 2650 4050
NoConn ~ 2650 4150
NoConn ~ 2650 5150
NoConn ~ 2650 5050
NoConn ~ 2650 4850
Wire Wire Line
	1600 4950 1650 4950
$Comp
L power:GND #PWR07
U 1 1 5FC27744
P 1600 4950
F 0 "#PWR07" H 1600 4700 50  0001 C CNN
F 1 "GND" V 1605 4822 50  0000 R CNN
F 2 "" H 1600 4950 50  0001 C CNN
F 3 "" H 1600 4950 50  0001 C CNN
	1    1600 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 4950 2650 4950
$Comp
L power:GND #PWR016
U 1 1 5FC143CD
P 2700 4950
F 0 "#PWR016" H 2700 4700 50  0001 C CNN
F 1 "GND" V 2705 4822 50  0000 R CNN
F 2 "" H 2700 4950 50  0001 C CNN
F 3 "" H 2700 4950 50  0001 C CNN
	1    2700 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 4350 2700 4350
Wire Wire Line
	2700 4250 2650 4250
Wire Wire Line
	1600 3350 1650 3350
$Comp
L power:GND #PWR03
U 1 1 5FBD8A63
P 1600 3350
F 0 "#PWR03" H 1600 3100 50  0001 C CNN
F 1 "GND" V 1605 3222 50  0000 R CNN
F 2 "" H 1600 3350 50  0001 C CNN
F 3 "" H 1600 3350 50  0001 C CNN
	1    1600 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 4450 1650 4450
Wire Wire Line
	2700 4450 2650 4450
$Comp
L power:+5V #PWR015
U 1 1 5FB5945C
P 2700 4450
F 0 "#PWR015" H 2700 4300 50  0001 C CNN
F 1 "+5V" V 2700 4550 50  0000 L CNN
F 2 "" H 2700 4450 50  0001 C CNN
F 3 "" H 2700 4450 50  0001 C CNN
	1    2700 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 2050 2650 2050
Wire Wire Line
	1600 2050 1650 2050
NoConn ~ 2150 1250
NoConn ~ 2150 2750
$Comp
L Vikings_connectors:Molex_53627-0274 J1
U 1 1 5FB05D8C
P 2150 1250
F 0 "J1" V 1969 1250 50  0000 C CNN
F 1 "Molex_53627-0274" V 2060 1250 50  0000 C CNN
F 2 "Vikings_connectors:Molex_536270274_flipped" H 3500 1550 50  0001 L CNN
F 3 "http://www.molex.com/webdocs/datasheets/pdf/en-us//0536270274_PCB_HEADERS.pdf" H 3500 1450 50  0001 L CNN
F 4 "MOLEX - 53627-0274 - CONN, STACKING, HEADER, 20POS, 0.635MM" H 3500 1350 50  0001 L CNN "Description"
F 5 "9.2" H 3500 1250 50  0001 L CNN "Height"
F 6 "Molex" H 3500 1150 50  0001 L CNN "Manufacturer_Name"
F 7 "53627-0274" H 3500 1050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "538-53627-0274" H 3500 750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=538-53627-0274" H 3500 650 50  0001 L CNN "Mouser Price/Stock"
	1    2150 1250
	0    1    1    0   
$EndComp
$Comp
L Vikings_connectors:Molex_53627-0474 J2
U 1 1 5FADFAA6
P 2150 3050
F 0 "J2" V 1969 3050 50  0000 C CNN
F 1 "Molex_53627-0474" V 2060 3050 50  0000 C CNN
F 2 "Vikings_connectors:Molex_536270474_flipped" H 4500 3350 50  0001 L CNN
F 3 "http://www.mouser.com/datasheet/2/276/0550910474_PCB_HEADERS-144062.pdf" H 4500 3250 50  0001 L CNN
F 4 "Molex 55091 Series, 0.635mm Pitch 40 Way 2 Row Vertical PCB Header, Solder Termination, 0.5A" H 4500 3150 50  0001 L CNN "Description"
F 5 "5.2" H 4500 3050 50  0001 L CNN "Height"
F 6 "Molex" H 4500 2950 50  0001 L CNN "Manufacturer_Name"
F 7 "55091-0474" H 4500 2850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "538-55091-0474" H 4500 2550 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Molex/55091-0474?qs=Xc4tFFrofSrjE9u%2FRRPtAQ%3D%3D" H 4500 2450 50  0001 L CNN "Mouser Price/Stock"
	1    2150 3050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FB073A4
P 1600 2050
F 0 "#PWR02" H 1600 1800 50  0001 C CNN
F 1 "GND" V 1605 1922 50  0000 R CNN
F 2 "" H 1600 2050 50  0001 C CNN
F 3 "" H 1600 2050 50  0001 C CNN
	1    1600 2050
	0    1    1    0   
$EndComp
Text Label 1600 1750 2    50   ~ 0
AuxSensor3Ground
Text Label 1600 2250 2    50   ~ 0
AuxSensor3Supply
Text Label 2700 2250 0    50   ~ 0
AuxSensor3
Text Label 1600 1650 2    50   ~ 0
AuxSensor2Ground
Text Label 1600 1850 2    50   ~ 0
AuxSensor2Supply
Text Label 2700 1750 0    50   ~ 0
AuxSensor2
Text Label 2700 2450 0    50   ~ 0
CoolSensor1Ground
Text Label 2700 1650 0    50   ~ 0
CoolSensor1
Text Label 1600 2450 2    50   ~ 0
CoolSensor0Ground
Text Label 1600 2350 2    50   ~ 0
CoolSensor0Supply
Text Label 2700 1550 0    50   ~ 0
CoolSensor0
Text Notes 4150 2050 0    50   ~ 0
NTC Sensor outputs:\n-20 degrees = 1.55 V\n100 degrees = 4.85 V\nShort = 5 V
Wire Wire Line
	1600 4350 1650 4350
$Comp
L power:GND #PWR05
U 1 1 5FB5EAE9
P 1600 4350
F 0 "#PWR05" H 1600 4100 50  0001 C CNN
F 1 "GND" V 1605 4222 50  0000 R CNN
F 2 "" H 1600 4350 50  0001 C CNN
F 3 "" H 1600 4350 50  0001 C CNN
	1    1600 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 4250 1650 4250
$Comp
L power:GND #PWR04
U 1 1 5FB5712C
P 1600 4250
F 0 "#PWR04" H 1600 4000 50  0001 C CNN
F 1 "GND" V 1605 4122 50  0000 R CNN
F 2 "" H 1600 4250 50  0001 C CNN
F 3 "" H 1600 4250 50  0001 C CNN
	1    1600 4250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5FB4F628
P 2700 4350
F 0 "#PWR014" H 2700 4100 50  0001 C CNN
F 1 "GND" V 2705 4222 50  0000 R CNN
F 2 "" H 2700 4350 50  0001 C CNN
F 3 "" H 2700 4350 50  0001 C CNN
	1    2700 4350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5FB40475
P 2700 4250
F 0 "#PWR013" H 2700 4000 50  0001 C CNN
F 1 "GND" V 2705 4122 50  0000 R CNN
F 2 "" H 2700 4250 50  0001 C CNN
F 3 "" H 2700 4250 50  0001 C CNN
	1    2700 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 3350 2650 3350
$Comp
L power:GND #PWR012
U 1 1 5FB31E84
P 2700 3350
F 0 "#PWR012" H 2700 3100 50  0001 C CNN
F 1 "GND" V 2705 3222 50  0000 R CNN
F 2 "" H 2700 3350 50  0001 C CNN
F 3 "" H 2700 3350 50  0001 C CNN
	1    2700 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5FB15B2F
P 1600 4450
F 0 "#PWR06" H 1600 4300 50  0001 C CNN
F 1 "+5V" V 1600 4550 50  0000 L CNN
F 2 "" H 1600 4450 50  0001 C CNN
F 3 "" H 1600 4450 50  0001 C CNN
	1    1600 4450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5FB0087B
P 2700 2050
F 0 "#PWR011" H 2700 1800 50  0001 C CNN
F 1 "GND" V 2705 1922 50  0000 R CNN
F 2 "" H 2700 2050 50  0001 C CNN
F 3 "" H 2700 2050 50  0001 C CNN
	1    2700 2050
	0    -1   -1   0   
$EndComp
NoConn ~ 2150 3050
NoConn ~ 2150 5550
Text Notes 700  1000 0    50   ~ 0
SlimStack Plugs
Wire Notes Line
	700  5700 700  1000
Text Label 2700 2350 0    50   ~ 0
CoolSensor1Supply
Wire Notes Line
	6750 6000 6750 7550
Wire Notes Line
	700  7550 6750 7550
Wire Notes Line
	700  6000 6750 6000
Wire Notes Line
	11050 5750 5150 5750
Wire Notes Line
	700  5700 3500 5700
Wire Notes Line
	3500 5700 3500 1000
Wire Notes Line
	3500 1000 700  1000
NoConn ~ 2650 5250
NoConn ~ 1650 5250
NoConn ~ 2650 1950
NoConn ~ 1650 1950
Wire Wire Line
	1600 1650 1650 1650
Wire Wire Line
	1600 1750 1650 1750
Wire Wire Line
	1600 1850 1650 1850
Wire Wire Line
	2650 1550 2700 1550
Wire Wire Line
	2700 1650 2650 1650
Wire Wire Line
	2700 1750 2650 1750
NoConn ~ 2650 1850
NoConn ~ 1650 1550
Wire Wire Line
	1600 2250 1650 2250
Wire Wire Line
	1600 2350 1650 2350
Wire Wire Line
	1600 2450 1650 2450
Wire Wire Line
	2700 2250 2650 2250
Wire Wire Line
	2700 2350 2650 2350
Wire Wire Line
	2700 2450 2650 2450
NoConn ~ 2650 2150
Text Label 1200 3450 0    50   ~ 0
SPI_CS
Wire Wire Line
	1650 3450 1200 3450
Text Label 1200 3550 0    50   ~ 0
SPI_IN
Wire Wire Line
	1200 3550 1650 3550
NoConn ~ 2650 3450
NoConn ~ 2650 3550
Text Label 1200 3950 0    50   ~ 0
SPI_CLK
Wire Wire Line
	1200 3950 1650 3950
Wire Wire Line
	1650 3850 1200 3850
Text Label 1200 3850 0    50   ~ 0
SPI_OUT
NoConn ~ 2650 3850
NoConn ~ 2650 3950
NoConn ~ 2650 4550
NoConn ~ 2650 4650
NoConn ~ 2650 4750
NoConn ~ 1650 2150
$EndSCHEMATC
