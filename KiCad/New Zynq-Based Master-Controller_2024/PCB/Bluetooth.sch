EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 17
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
L power:+3.3V #PWR0131
U 1 1 5F605CF3
P 5350 1600
F 0 "#PWR0131" H 5350 1450 50  0001 C CNN
F 1 "+3.3V" V 5350 1750 50  0000 L CNN
F 2 "" H 5350 1600 50  0001 C CNN
F 3 "" H 5350 1600 50  0001 C CNN
	1    5350 1600
	0    1    1    0   
$EndComp
Text HLabel 1200 1900 0    50   Input ~ 0
Reset
Wire Wire Line
	2750 2200 2800 2200
Text HLabel 2750 2200 0    50   Input ~ 0
RXD
Text HLabel 2750 2300 0    50   Output ~ 0
TXD
$Comp
L Device:C C501
U 1 1 5F60A5FA
P 4550 1350
F 0 "C501" H 4600 1150 50  0000 L CNN
F 1 "100nF" H 4600 1250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4588 1200 50  0001 C CNN
F 3 "~" H 4550 1350 50  0001 C CNN
	1    4550 1350
	-1   0    0    1   
$EndComp
Connection ~ 4550 1600
Wire Wire Line
	4550 1600 4400 1600
Text Notes 800  850  0    50   ~ 0
Bluetooth Module
$Comp
L Connector:Conn_Coaxial J501
U 1 1 5FE8D3A0
P 2150 2600
F 0 "J501" H 2100 2750 50  0000 L CNN
F 1 "Conn_Coaxial" H 1900 2850 50  0000 L CNN
F 2 "Connector_Coaxial:U.FL_Hirose_U.FL-R-SMT-1_Vertical" H 2150 2600 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/U.FL/category/Catalog/doc_file_id/31697/?file_category_id=4&item_id=15&is_series=1" H 2150 2600 50  0001 C CNN
	1    2150 2600
	-1   0    0    1   
$EndComp
$Comp
L Vikings_actives:RN4871U-V_RM118 U?
U 1 1 5FEAACAC
P 2800 1800
AR Path="/5FEAACAC" Ref="U?"  Part="1" 
AR Path="/5F604B68/5FEAACAC" Ref="U501"  Part="1" 
F 0 "U501" H 3600 2265 50  0000 C CNN
F 1 "RN4871U-V_RM118" H 3600 2174 50  0000 C CNN
F 2 "Vikings_devices:RN4871U" H 3600 1450 50  0001 L BNN
F 3 "MICROCHIP" H 3600 1400 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 3600 1450 50  0001 L BNN "Field4"
	1    2800 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2300 2800 2300
$Comp
L power:GND #PWR0206
U 1 1 5FEB70E9
P 4500 2800
F 0 "#PWR0206" H 4500 2550 50  0001 C CNN
F 1 "GND" H 4505 2627 50  0000 C CNN
F 2 "" H 4500 2800 50  0001 C CNN
F 3 "" H 4500 2800 50  0001 C CNN
	1    4500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2700 4500 2700
Wire Wire Line
	4500 2700 4500 2800
Wire Wire Line
	4500 2800 4400 2800
Connection ~ 4500 2800
$Comp
L power:GND #PWR0208
U 1 1 5F88F67B
P 2150 2400
F 0 "#PWR0208" H 2150 2150 50  0001 C CNN
F 1 "GND" H 2200 2250 50  0000 R CNN
F 2 "" H 2150 2400 50  0001 C CNN
F 3 "" H 2150 2400 50  0001 C CNN
	1    2150 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 1600 4550 1500
Wire Wire Line
	4550 1200 4550 1150
$Comp
L power:GND #PWR0210
U 1 1 5F892929
P 4750 1150
F 0 "#PWR0210" H 4750 900 50  0001 C CNN
F 1 "GND" H 4755 977 50  0000 C CNN
F 2 "" H 4750 1150 50  0001 C CNN
F 3 "" H 4750 1150 50  0001 C CNN
	1    4750 1150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C502
U 1 1 5F899236
P 4950 1350
F 0 "C502" H 4950 1550 50  0000 L CNN
F 1 "10uF" H 4950 1450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4988 1200 50  0001 C CNN
F 3 "~" H 4950 1350 50  0001 C CNN
	1    4950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1600 4950 1600
Wire Wire Line
	4950 1600 4950 1500
Connection ~ 4950 1600
Wire Wire Line
	4950 1600 5050 1600
Wire Wire Line
	4950 1200 4950 1150
Wire Wire Line
	4950 1150 4750 1150
Wire Wire Line
	5250 1600 5350 1600
Wire Wire Line
	4400 2350 4500 2350
Text HLabel 4500 2350 2    50   Input ~ 0
Config_Sel
Text Notes 5400 1300 0    50   ~ 0
2.2 A
$Comp
L power:+3.3V #PWR0213
U 1 1 5F8B81A3
P 5350 1850
F 0 "#PWR0213" H 5350 1700 50  0001 C CNN
F 1 "+3.3V" V 5350 2000 50  0000 L CNN
F 2 "" H 5350 1850 50  0001 C CNN
F 3 "" H 5350 1850 50  0001 C CNN
	1    5350 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F8C6C60
P 5150 1850
AR Path="/5F4637A7/5F8C6C60" Ref="R?"  Part="1" 
AR Path="/5F604B68/5F8C6C60" Ref="R501"  Part="1" 
F 0 "R501" V 5050 1800 50  0000 L CNN
F 1 "300" V 5150 1770 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5080 1850 50  0001 C CNN
F 3 "~" H 5150 1850 50  0001 C CNN
	1    5150 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 1850 5000 1850
$Comp
L Vikings_passives:150060SS75000 D?
U 1 1 5F8C6C72
P 4850 1850
AR Path="/5F4637A7/5F8C6C72" Ref="D?"  Part="1" 
AR Path="/5F604B68/5F8C6C72" Ref="D501"  Part="1" 
F 0 "D501" H 4700 2050 50  0000 L CNN
F 1 "150060SS75000" H 4550 2150 50  0000 L CNN
F 2 "Vikings_devices:Wurth_150060SS75000" H 4850 2450 50  0001 L CNN
F 3 "http://katalog.we-online.com/led/datasheet/150060SS75000.pdf" H 4850 2550 50  0001 L CNN
F 4 "Red" H 4850 2650 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 4850 2750 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 4850 2850 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 4850 2950 50  0001 L CNN "category"
F 8 "12518860" H 4850 3050 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 4850 3150 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 4850 3250 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 4850 3350 50  0001 L CNN "package"
F 12 "1421305860" H 4850 3450 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 4850 3550 50  0001 L CNN "vault revision"
F 14 "yes" H 4850 3650 50  0001 L CNN "imported"
	1    4850 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 1850 4550 1850
Wire Wire Line
	5300 1850 5350 1850
NoConn ~ 4400 1750
NoConn ~ 4400 1950
NoConn ~ 4400 2050
NoConn ~ 4400 2150
NoConn ~ 4400 2250
NoConn ~ 4400 2450
NoConn ~ 4400 2550
$Comp
L Vikings_actives:MIC826TYMT-TR U?
U 1 1 5F8D3B23
P 2250 2000
AR Path="/5F5FC96C/5F8D3B23" Ref="U?"  Part="1" 
AR Path="/5F604B68/5F8D3B23" Ref="U502"  Part="1" 
F 0 "U502" H 3300 1550 50  0000 C CNN
F 1 "MIC826TYMT-TR" H 3300 1450 50  0000 C CNN
F 2 "Vikings_devices:MIC826TYMT-TR" H 3300 2100 50  0001 L CNN
F 3 "http://www.microchip.com/wwwproducts/en/MIC826" H 3300 2000 50  0001 L CNN
F 4 "Supervisory Circuits .5% Single Voltage Supervisor" H 3300 1900 50  0001 L CNN "Description"
F 5 "0.6" H 3300 1800 50  0001 L CNN "Height"
F 6 "Microchip" H 3300 1700 50  0001 L CNN "Manufacturer_Name"
F 7 "MIC826TYMT-TR" H 3300 1600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "MIC826TYMT-TR" H 3300 1500 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/mic826tymt-tr/microchip-technology" H 3300 1400 50  0001 L CNN "Arrow Price/Stock"
F 10 "998-MIC826TYMTTR" H 3300 1300 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/Microchip-Technology-Micrel/MIC826TYMT-TR?qs=Y3Q3JoKAO1SXo3ASLVuS1w%3D%3D" H 3300 1200 50  0001 L CNN "Mouser Price/Stock"
	1    2250 2000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8D3B2B
P 2300 1900
AR Path="/5F5FC96C/5F8D3B2B" Ref="#PWR?"  Part="1" 
AR Path="/5F604B68/5F8D3B2B" Ref="#PWR0285"  Part="1" 
F 0 "#PWR0285" H 2300 1650 50  0001 C CNN
F 1 "GND" V 2305 1772 50  0000 R CNN
F 2 "" H 2300 1900 50  0001 C CNN
F 3 "" H 2300 1900 50  0001 C CNN
	1    2300 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8D3B31
P 1775 1175
AR Path="/5F5FC96C/5F8D3B31" Ref="#PWR?"  Part="1" 
AR Path="/5F604B68/5F8D3B31" Ref="#PWR0286"  Part="1" 
F 0 "#PWR0286" H 1775 925 50  0001 C CNN
F 1 "GND" H 1780 1002 50  0000 C CNN
F 2 "" H 1775 1175 50  0001 C CNN
F 3 "" H 1775 1175 50  0001 C CNN
	1    1775 1175
	-1   0    0    1   
$EndComp
Wire Wire Line
	1325 2000 1225 2000
NoConn ~ 2250 1800
NoConn ~ 1325 1800
Wire Wire Line
	1325 1900 1200 1900
Wire Wire Line
	2250 2000 2800 2000
Wire Notes Line
	800  850  5900 850 
Wire Wire Line
	2350 2600 2800 2600
Wire Notes Line
	5900 850  5900 3050
Wire Notes Line
	5900 3050 800  3050
Wire Notes Line
	800  3050 800  850 
Text Label 4400 1600 0    50   ~ 0
3V3_BT
Text Label 1225 2000 2    50   ~ 0
3V3_BT
Text Label 2750 1800 2    50   ~ 0
3V3_BT
Wire Wire Line
	2750 1800 2800 1800
Wire Wire Line
	2250 1900 2300 1900
Text Notes 800  3200 0    67   ~ 0
Antenna impedance matching: 50 Ω
Connection ~ 4750 1150
Wire Wire Line
	4750 1150 4550 1150
$Comp
L Device:Ferrite_Bead_Small FB?
U 1 1 5F99D852
P 5150 1600
AR Path="/5F5FC96C/5F99D852" Ref="FB?"  Part="1" 
AR Path="/5F604B68/5F99D852" Ref="FB501"  Part="1" 
F 0 "FB501" V 4900 1950 50  0000 C CNN
F 1 "220R @ 100 MHz" V 5000 2000 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" V 5080 1600 50  0001 C CNN
F 3 "https://www.mouser.dk/ProductDetail/TDK/MPZ1608S221ATA00?qs=sGAEpiMZZMt1hubY80%2Fs8Hp09N5ImNkmPGZEpzSBQSs%3D" H 5150 1600 50  0001 C CNN
F 4 "MPZ1608S221ATA00" V 5150 1600 50  0001 C CNN "Name"
	1    5150 1600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0402
U 1 1 5FC3BC45
P 6550 1660
F 0 "#PWR0402" H 6550 1410 50  0001 C CNN
F 1 "GND" H 6750 1590 50  0000 R CNN
F 2 "" H 6550 1660 50  0001 C CNN
F 3 "" H 6550 1660 50  0001 C CNN
	1    6550 1660
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0403
U 1 1 5FC3394B
P 7850 1960
F 0 "#PWR0403" H 7850 1710 50  0001 C CNN
F 1 "GND" H 7900 1810 50  0000 R CNN
F 2 "" H 7850 1960 50  0001 C CNN
F 3 "" H 7850 1960 50  0001 C CNN
	1    7850 1960
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J502
U 1 1 5FC33945
P 7850 1760
F 0 "J502" H 7800 1910 50  0000 L CNN
F 1 "Conn_Coaxial" H 7600 2010 50  0000 L CNN
F 2 "Connector_Coaxial:U.FL_Hirose_U.FL-R-SMT-1_Vertical" H 7850 1760 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/U.FL/category/Catalog/doc_file_id/31697/?file_category_id=4&item_id=15&is_series=1" H 7850 1760 50  0001 C CNN
	1    7850 1760
	1    0    0    -1  
$EndComp
$Comp
L Device:Antenna_Shield AE1
U 1 1 5FC34413
P 6350 1760
F 0 "AE1" H 6400 1750 50  0000 L CNN
F 1 "Antenna_Shield" H 5770 1620 50  0000 L CNN
F 2 "RF_Antenna:Texas_SWRA117D_2.4GHz_Right" H 6350 1860 50  0001 C CNN
F 3 "~" H 6350 1860 50  0001 C CNN
	1    6350 1760
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R503
U 1 1 5FC43938
P 6950 1930
F 0 "R503" V 7030 1880 50  0000 L CNN
F 1 "R" V 6950 1910 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 6880 1930 50  0001 C CNN
F 3 "~" H 6950 1930 50  0001 C CNN
	1    6950 1930
	1    0    0    -1  
$EndComp
$Comp
L Device:R R502
U 1 1 5FC43E3A
P 7140 1760
F 0 "R502" V 7060 1760 50  0000 C CNN
F 1 "R" V 7140 1760 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 7070 1760 50  0001 C CNN
F 3 "~" H 7140 1760 50  0001 C CNN
	1    7140 1760
	0    1    1    0   
$EndComp
$Comp
L Device:R R504
U 1 1 5FC444E1
P 7330 1930
F 0 "R504" V 7410 1880 50  0000 L CNN
F 1 "R" V 7330 1900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 7260 1930 50  0001 C CNN
F 3 "~" H 7330 1930 50  0001 C CNN
	1    7330 1930
	1    0    0    -1  
$EndComp
Wire Wire Line
	7290 1760 7330 1760
Wire Wire Line
	7330 1780 7330 1760
Connection ~ 7330 1760
Wire Wire Line
	7330 1760 7650 1760
Wire Wire Line
	6950 1780 6950 1760
Wire Wire Line
	6990 1760 6950 1760
Connection ~ 6950 1760
$Comp
L power:GND #PWR0417
U 1 1 5FC464E0
P 6950 2080
F 0 "#PWR0417" H 6950 1830 50  0001 C CNN
F 1 "GND" H 7000 1930 50  0000 R CNN
F 2 "" H 6950 2080 50  0001 C CNN
F 3 "" H 6950 2080 50  0001 C CNN
	1    6950 2080
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0418
U 1 1 5FC46843
P 7330 2080
F 0 "#PWR0418" H 7330 1830 50  0001 C CNN
F 1 "GND" H 7380 1930 50  0000 R CNN
F 2 "" H 7330 2080 50  0001 C CNN
F 3 "" H 7330 2080 50  0001 C CNN
	1    7330 2080
	1    0    0    -1  
$EndComp
Wire Notes Line
	6090 850  8320 850 
Wire Notes Line
	8320 850  8320 3060
Wire Notes Line
	8320 3060 6090 3060
Wire Notes Line
	6090 3060 6090 850 
Text Notes 6150 1010 0    100  ~ 0
PCB (Inverted F) Antenna 
Text Notes 6130 1370 0    50   ~ 0
Impedance matching PI Network\nfor 50 Ohm impedance\nWhen bypassing, place 10-100pF cap on place of R502\nand don't solder R503 and R504
Wire Wire Line
	6550 1760 6950 1760
Text Label 6880 1760 2    50   ~ 0
BT_IFA
Text Label 7650 1760 2    50   ~ 0
BT_CONN
$EndSCHEMATC
