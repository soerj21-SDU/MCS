EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 17
Title "Zynq-Based Master Controller"
Date "2020-10-14"
Rev "1.0"
Comp "JFH & SRM"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2470 1130 0    50   Input ~ 0
SC_Supply
Text HLabel 2710 1560 0    50   Output ~ 0
SC_Cockpit_OUT
$Comp
L Device:R R902
U 1 1 5F69416B
P 3450 1530
F 0 "R902" V 3370 1530 50  0000 C CNN
F 1 "4.7k" V 3450 1530 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3380 1530 50  0001 C CNN
F 3 "~" H 3450 1530 50  0001 C CNN
	1    3450 1530
	0    1    1    0   
$EndComp
Wire Wire Line
	3130 1530 3300 1530
$Comp
L Device:R R903
U 1 1 5F696AE5
P 3450 1670
F 0 "R903" V 3370 1670 50  0000 C CNN
F 1 "4.7k" V 3450 1670 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3380 1670 50  0001 C CNN
F 3 "~" H 3450 1670 50  0001 C CNN
	1    3450 1670
	0    1    -1   0   
$EndComp
Wire Wire Line
	3700 1670 3600 1670
Wire Wire Line
	3300 1670 3130 1670
Text HLabel 2710 1670 0    50   Input ~ 0
SC_Cockpit_IN
Wire Wire Line
	2820 1870 3130 1870
Text HLabel 2710 2180 0    50   Input ~ 0
SC_BOTS_IN
Wire Wire Line
	2830 2400 2830 2180
Wire Wire Line
	2830 2180 2710 2180
Text HLabel 2720 2620 0    50   Output ~ 0
SC_Inertia_OUT
Wire Wire Line
	3710 2600 3610 2600
$Comp
L Device:R R906
U 1 1 5F6A04BE
P 3460 2600
F 0 "R906" V 3380 2600 50  0000 C CNN
F 1 "4.7k" V 3460 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3390 2600 50  0001 C CNN
F 3 "~" H 3460 2600 50  0001 C CNN
	1    3460 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	3140 2600 3310 2600
$Comp
L Device:R R907
U 1 1 5F6A04CB
P 3460 2740
F 0 "R907" V 3380 2740 50  0000 C CNN
F 1 "4.7k" V 3460 2740 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3390 2740 50  0001 C CNN
F 3 "~" H 3460 2740 50  0001 C CNN
	1    3460 2740
	0    1    -1   0   
$EndComp
Wire Wire Line
	3710 2740 3610 2740
Wire Wire Line
	3310 2740 3140 2740
Text HLabel 2720 2740 0    50   Input ~ 0
SC_Inertia_IN
Text HLabel 2720 3150 0    50   Output ~ 0
SC_Left_OUT
Wire Wire Line
	2720 3150 2830 3150
Wire Wire Line
	2830 3150 2830 2940
Wire Wire Line
	2830 2940 3130 2940
Text HLabel 2730 3270 0    50   Input ~ 0
SC_Left_IN
Text HLabel 2720 3700 0    50   Output ~ 0
SC_Right_OUT
Wire Wire Line
	3710 3670 3610 3670
$Comp
L Device:R R910
U 1 1 5F6A5203
P 3460 3670
F 0 "R910" V 3380 3670 50  0000 C CNN
F 1 "4.7k" V 3460 3670 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3390 3670 50  0001 C CNN
F 3 "~" H 3460 3670 50  0001 C CNN
	1    3460 3670
	0    1    1    0   
$EndComp
Wire Wire Line
	3140 3670 3310 3670
$Comp
L Device:R R911
U 1 1 5F6A5210
P 3460 3810
F 0 "R911" V 3380 3810 50  0000 C CNN
F 1 "4.7k" V 3460 3810 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3390 3810 50  0001 C CNN
F 3 "~" H 3460 3810 50  0001 C CNN
	1    3460 3810
	0    1    -1   0   
$EndComp
Wire Wire Line
	3710 3810 3610 3810
Wire Wire Line
	3310 3810 3140 3810
Text HLabel 2730 3810 0    50   Input ~ 0
SC_Right_IN
Text HLabel 2740 4240 0    50   Output ~ 0
SC_FR_OUT
Wire Wire Line
	2740 4240 2830 4240
Wire Wire Line
	2830 4240 2830 4010
Connection ~ 2830 4010
Wire Wire Line
	2830 4010 3130 4010
Wire Wire Line
	2830 3700 2720 3700
Wire Wire Line
	2830 3470 2830 3270
Wire Wire Line
	4300 1330 4390 1330
Connection ~ 4390 1330
$Comp
L Device:R R901
U 1 1 5F6B0006
P 4580 1250
F 0 "R901" V 4500 1250 50  0000 C CNN
F 1 "2.7k" V 4580 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4510 1250 50  0001 C CNN
F 3 "~" H 4580 1250 50  0001 C CNN
	1    4580 1250
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0323
U 1 1 5F6B12BE
P 4790 1190
F 0 "#PWR0323" H 4790 1040 50  0001 C CNN
F 1 "+3.3V" H 4920 1230 50  0000 C CNN
F 2 "" H 4790 1190 50  0001 C CNN
F 3 "" H 4790 1190 50  0001 C CNN
	1    4790 1190
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1530 4480 1530
Wire Wire Line
	4480 1530 4480 1600
$Comp
L power:GND #PWR0324
U 1 1 5F6B3EEB
P 4520 1600
F 0 "#PWR0324" H 4520 1350 50  0001 C CNN
F 1 "GND" V 4600 1620 50  0000 R CNN
F 2 "" H 4520 1600 50  0001 C CNN
F 3 "" H 4520 1600 50  0001 C CNN
	1    4520 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4520 1600 4480 1600
Connection ~ 4480 1600
Wire Wire Line
	4480 1600 4480 1670
Wire Wire Line
	4390 1250 4430 1250
Wire Wire Line
	4390 1250 4390 1330
Wire Wire Line
	4730 1250 4790 1250
Wire Wire Line
	4790 1190 4790 1250
Connection ~ 4390 1870
$Comp
L Device:R R904
U 1 1 5F6C113D
P 4580 1790
F 0 "R904" V 4500 1790 50  0000 C CNN
F 1 "2.7k" V 4580 1790 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4510 1790 50  0001 C CNN
F 3 "~" H 4580 1790 50  0001 C CNN
	1    4580 1790
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0325
U 1 1 5F6C1143
P 4790 1730
F 0 "#PWR0325" H 4790 1580 50  0001 C CNN
F 1 "+3.3V" H 4920 1770 50  0000 C CNN
F 2 "" H 4790 1730 50  0001 C CNN
F 3 "" H 4790 1730 50  0001 C CNN
	1    4790 1730
	1    0    0    -1  
$EndComp
Wire Wire Line
	4390 1790 4430 1790
Wire Wire Line
	4390 1790 4390 1870
Wire Wire Line
	4730 1790 4790 1790
Wire Wire Line
	4790 1730 4790 1790
Wire Wire Line
	4310 2400 4400 2400
Connection ~ 4400 2400
$Comp
L Device:R R905
U 1 1 5F6C5569
P 4590 2320
F 0 "R905" V 4510 2320 50  0000 C CNN
F 1 "2.7k" V 4590 2320 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4520 2320 50  0001 C CNN
F 3 "~" H 4590 2320 50  0001 C CNN
	1    4590 2320
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0326
U 1 1 5F6C556F
P 4800 2260
F 0 "#PWR0326" H 4800 2110 50  0001 C CNN
F 1 "+3.3V" H 4930 2300 50  0000 C CNN
F 2 "" H 4800 2260 50  0001 C CNN
F 3 "" H 4800 2260 50  0001 C CNN
	1    4800 2260
	1    0    0    -1  
$EndComp
Wire Wire Line
	4310 2600 4490 2600
Wire Wire Line
	4490 2600 4490 2670
Wire Wire Line
	4490 2740 4310 2740
$Comp
L power:GND #PWR0327
U 1 1 5F6C5578
P 4530 2670
F 0 "#PWR0327" H 4530 2420 50  0001 C CNN
F 1 "GND" V 4610 2690 50  0000 R CNN
F 2 "" H 4530 2670 50  0001 C CNN
F 3 "" H 4530 2670 50  0001 C CNN
	1    4530 2670
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4530 2670 4490 2670
Connection ~ 4490 2670
Wire Wire Line
	4490 2670 4490 2740
Wire Wire Line
	4400 2320 4440 2320
Wire Wire Line
	4400 2320 4400 2400
Wire Wire Line
	4740 2320 4800 2320
Wire Wire Line
	4800 2260 4800 2320
Wire Wire Line
	4310 2940 4400 2940
Connection ~ 4400 2940
$Comp
L Device:R R908
U 1 1 5F6C5589
P 4590 2860
F 0 "R908" V 4510 2860 50  0000 C CNN
F 1 "2.7k" V 4590 2860 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4520 2860 50  0001 C CNN
F 3 "~" H 4590 2860 50  0001 C CNN
	1    4590 2860
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0328
U 1 1 5F6C558F
P 4800 2800
F 0 "#PWR0328" H 4800 2650 50  0001 C CNN
F 1 "+3.3V" H 4930 2840 50  0000 C CNN
F 2 "" H 4800 2800 50  0001 C CNN
F 3 "" H 4800 2800 50  0001 C CNN
	1    4800 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2860 4440 2860
Wire Wire Line
	4400 2860 4400 2940
Wire Wire Line
	4740 2860 4800 2860
Wire Wire Line
	4800 2800 4800 2860
Wire Wire Line
	4310 3470 4400 3470
Connection ~ 4400 3470
$Comp
L Device:R R909
U 1 1 5F6C9663
P 4590 3390
F 0 "R909" V 4510 3390 50  0000 C CNN
F 1 "2.7k" V 4590 3390 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4520 3390 50  0001 C CNN
F 3 "~" H 4590 3390 50  0001 C CNN
	1    4590 3390
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0329
U 1 1 5F6C9669
P 4800 3330
F 0 "#PWR0329" H 4800 3180 50  0001 C CNN
F 1 "+3.3V" H 4930 3370 50  0000 C CNN
F 2 "" H 4800 3330 50  0001 C CNN
F 3 "" H 4800 3330 50  0001 C CNN
	1    4800 3330
	1    0    0    -1  
$EndComp
Wire Wire Line
	4310 3670 4490 3670
Wire Wire Line
	4490 3670 4490 3740
Wire Wire Line
	4490 3810 4310 3810
$Comp
L power:GND #PWR0330
U 1 1 5F6C9672
P 4530 3740
F 0 "#PWR0330" H 4530 3490 50  0001 C CNN
F 1 "GND" V 4610 3760 50  0000 R CNN
F 2 "" H 4530 3740 50  0001 C CNN
F 3 "" H 4530 3740 50  0001 C CNN
	1    4530 3740
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4530 3740 4490 3740
Connection ~ 4490 3740
Wire Wire Line
	4490 3740 4490 3810
Wire Wire Line
	4400 3390 4440 3390
Wire Wire Line
	4400 3390 4400 3470
Wire Wire Line
	4740 3390 4800 3390
Wire Wire Line
	4800 3330 4800 3390
Wire Wire Line
	4310 4010 4400 4010
Connection ~ 4400 4010
$Comp
L Device:R R912
U 1 1 5F6C9683
P 4590 3930
F 0 "R912" V 4510 3930 50  0000 C CNN
F 1 "2.7k" V 4590 3930 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4520 3930 50  0001 C CNN
F 3 "~" H 4590 3930 50  0001 C CNN
	1    4590 3930
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0331
U 1 1 5F6C9689
P 4800 3870
F 0 "#PWR0331" H 4800 3720 50  0001 C CNN
F 1 "+3.3V" H 4930 3910 50  0000 C CNN
F 2 "" H 4800 3870 50  0001 C CNN
F 3 "" H 4800 3870 50  0001 C CNN
	1    4800 3870
	1    0    0    -1  
$EndComp
Text HLabel 4890 4010 2    50   Output ~ 0
~SC_Mon_Right
Wire Wire Line
	4400 3930 4440 3930
Wire Wire Line
	4400 3930 4400 4010
Wire Wire Line
	4740 3930 4800 3930
Wire Wire Line
	4800 3870 4800 3930
Connection ~ 2830 3470
Wire Wire Line
	2830 3470 3130 3470
Text HLabel 2740 4340 0    50   Input ~ 0
SC_FR_IN
Text HLabel 2740 4750 0    50   Output ~ 0
SC_FL_OUT
Wire Wire Line
	3710 4720 3610 4720
$Comp
L Device:R R914
U 1 1 5F6E09C1
P 3460 4720
F 0 "R914" V 3380 4720 50  0000 C CNN
F 1 "4.7k" V 3460 4720 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3390 4720 50  0001 C CNN
F 3 "~" H 3460 4720 50  0001 C CNN
	1    3460 4720
	0    1    1    0   
$EndComp
Wire Wire Line
	3140 4720 3310 4720
$Comp
L Device:R R915
U 1 1 5F6E09CE
P 3460 4860
F 0 "R915" V 3380 4860 50  0000 C CNN
F 1 "4.7k" V 3460 4860 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3390 4860 50  0001 C CNN
F 3 "~" H 3460 4860 50  0001 C CNN
	1    3460 4860
	0    1    -1   0   
$EndComp
Wire Wire Line
	3710 4860 3610 4860
Wire Wire Line
	3310 4860 3140 4860
Text HLabel 2740 4860 0    50   Input ~ 0
SC_FL_IN
Text HLabel 2740 5280 0    50   Output ~ 0
SC_RR_OUT
Connection ~ 2830 5060
Wire Wire Line
	2830 5060 3130 5060
Wire Wire Line
	2830 4750 2740 4750
Wire Wire Line
	2830 4520 2830 4340
Wire Wire Line
	4310 4520 4400 4520
Connection ~ 4400 4520
$Comp
L Device:R R913
U 1 1 5F6E09E7
P 4590 4440
F 0 "R913" V 4510 4440 50  0000 C CNN
F 1 "2.7k" V 4590 4440 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4520 4440 50  0001 C CNN
F 3 "~" H 4590 4440 50  0001 C CNN
	1    4590 4440
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0332
U 1 1 5F6E09ED
P 4800 4380
F 0 "#PWR0332" H 4800 4230 50  0001 C CNN
F 1 "+3.3V" H 4930 4420 50  0000 C CNN
F 2 "" H 4800 4380 50  0001 C CNN
F 3 "" H 4800 4380 50  0001 C CNN
	1    4800 4380
	1    0    0    -1  
$EndComp
Wire Wire Line
	4310 4720 4490 4720
Wire Wire Line
	4490 4720 4490 4790
Wire Wire Line
	4490 4860 4310 4860
$Comp
L power:GND #PWR0333
U 1 1 5F6E09F6
P 4530 4790
F 0 "#PWR0333" H 4530 4540 50  0001 C CNN
F 1 "GND" V 4610 4810 50  0000 R CNN
F 2 "" H 4530 4790 50  0001 C CNN
F 3 "" H 4530 4790 50  0001 C CNN
	1    4530 4790
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4530 4790 4490 4790
Connection ~ 4490 4790
Wire Wire Line
	4490 4790 4490 4860
Text HLabel 4890 4520 2    50   Output ~ 0
~SC_Mon_FR
Wire Wire Line
	4400 4440 4440 4440
Wire Wire Line
	4400 4440 4400 4520
Wire Wire Line
	4740 4440 4800 4440
Wire Wire Line
	4800 4380 4800 4440
Wire Wire Line
	4310 5060 4400 5060
Connection ~ 4400 5060
$Comp
L Device:R R916
U 1 1 5F6E0A07
P 4590 4980
F 0 "R916" V 4510 4980 50  0000 C CNN
F 1 "2.7k" V 4590 4980 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4520 4980 50  0001 C CNN
F 3 "~" H 4590 4980 50  0001 C CNN
	1    4590 4980
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0334
U 1 1 5F6E0A0D
P 4800 4920
F 0 "#PWR0334" H 4800 4770 50  0001 C CNN
F 1 "+3.3V" H 4930 4960 50  0000 C CNN
F 2 "" H 4800 4920 50  0001 C CNN
F 3 "" H 4800 4920 50  0001 C CNN
	1    4800 4920
	1    0    0    -1  
$EndComp
Text HLabel 4890 5060 2    50   Output ~ 0
~SC_Mon_FL
Wire Wire Line
	4400 4980 4440 4980
Wire Wire Line
	4400 4980 4400 5060
Wire Wire Line
	4740 4980 4800 4980
Wire Wire Line
	4800 4920 4800 4980
Connection ~ 2830 4520
Wire Wire Line
	2830 4520 3130 4520
Text HLabel 2740 5390 0    50   Input ~ 0
SC_RR_IN
Text HLabel 2740 5820 0    50   Output ~ 0
SC_RL_OUT
Wire Wire Line
	3720 5790 3620 5790
$Comp
L Device:R R918
U 1 1 5F6E98C0
P 3470 5790
F 0 "R918" V 3390 5790 50  0000 C CNN
F 1 "4.7k" V 3470 5790 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3400 5790 50  0001 C CNN
F 3 "~" H 3470 5790 50  0001 C CNN
	1    3470 5790
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 5790 3320 5790
$Comp
L Device:R R919
U 1 1 5F6E98CD
P 3470 5930
F 0 "R919" V 3390 5930 50  0000 C CNN
F 1 "4.7k" V 3470 5930 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3400 5930 50  0001 C CNN
F 3 "~" H 3470 5930 50  0001 C CNN
	1    3470 5930
	0    1    -1   0   
$EndComp
Wire Wire Line
	3720 5930 3620 5930
Wire Wire Line
	3320 5930 3150 5930
Text HLabel 2740 5930 0    50   Input ~ 0
SC_RL_IN
Text HLabel 2740 6360 0    50   Output ~ 0
SC_TSMS_OUT
Wire Wire Line
	2740 6360 2830 6360
Wire Wire Line
	2830 6360 2830 6130
Connection ~ 2830 6130
Wire Wire Line
	2830 6130 3130 6130
Wire Wire Line
	2830 5390 2740 5390
Wire Wire Line
	2830 5590 2830 5390
Wire Wire Line
	4320 5590 4410 5590
Connection ~ 4410 5590
$Comp
L Device:R R917
U 1 1 5F6E98E6
P 4600 5510
F 0 "R917" V 4520 5510 50  0000 C CNN
F 1 "2.7k" V 4600 5510 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4530 5510 50  0001 C CNN
F 3 "~" H 4600 5510 50  0001 C CNN
	1    4600 5510
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0335
U 1 1 5F6E98EC
P 4810 5450
F 0 "#PWR0335" H 4810 5300 50  0001 C CNN
F 1 "+3.3V" H 4940 5490 50  0000 C CNN
F 2 "" H 4810 5450 50  0001 C CNN
F 3 "" H 4810 5450 50  0001 C CNN
	1    4810 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4320 5790 4500 5790
Wire Wire Line
	4500 5790 4500 5860
Wire Wire Line
	4500 5930 4320 5930
$Comp
L power:GND #PWR0336
U 1 1 5F6E98F5
P 4540 5860
F 0 "#PWR0336" H 4540 5610 50  0001 C CNN
F 1 "GND" V 4620 5880 50  0000 R CNN
F 2 "" H 4540 5860 50  0001 C CNN
F 3 "" H 4540 5860 50  0001 C CNN
	1    4540 5860
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4540 5860 4500 5860
Connection ~ 4500 5860
Wire Wire Line
	4500 5860 4500 5930
Text HLabel 4900 5590 2    50   Output ~ 0
~SC_Mon_RR
Wire Wire Line
	4410 5510 4450 5510
Wire Wire Line
	4410 5510 4410 5590
Wire Wire Line
	4750 5510 4810 5510
Wire Wire Line
	4810 5450 4810 5510
Wire Wire Line
	4320 6130 4410 6130
Connection ~ 4410 6130
$Comp
L Device:R R920
U 1 1 5F6E9906
P 4600 6050
F 0 "R920" V 4520 6050 50  0000 C CNN
F 1 "2.7k" V 4600 6050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4530 6050 50  0001 C CNN
F 3 "~" H 4600 6050 50  0001 C CNN
	1    4600 6050
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0337
U 1 1 5F6E990C
P 4810 5990
F 0 "#PWR0337" H 4810 5840 50  0001 C CNN
F 1 "+3.3V" H 4940 6030 50  0000 C CNN
F 2 "" H 4810 5990 50  0001 C CNN
F 3 "" H 4810 5990 50  0001 C CNN
	1    4810 5990
	1    0    0    -1  
$EndComp
Text HLabel 4900 6130 2    50   Output ~ 0
~SC_Mon_RL
Wire Wire Line
	4410 6050 4450 6050
Wire Wire Line
	4410 6050 4410 6130
Wire Wire Line
	4750 6050 4810 6050
Wire Wire Line
	4810 5990 4810 6050
Connection ~ 2830 5590
Wire Wire Line
	2830 5590 3130 5590
Text HLabel 2740 6490 0    50   Input ~ 0
SC_TSMS_IN
Wire Wire Line
	3720 6920 3620 6920
$Comp
L Device:R R922
U 1 1 5F72B8BF
P 3470 6920
F 0 "R922" V 3390 6920 50  0000 C CNN
F 1 "4.7k" V 3470 6920 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3400 6920 50  0001 C CNN
F 3 "~" H 3470 6920 50  0001 C CNN
	1    3470 6920
	0    1    1    0   
$EndComp
Wire Wire Line
	3320 6920 3190 6920
Wire Wire Line
	4320 6720 4410 6720
Connection ~ 4410 6720
Text HLabel 4900 6720 2    50   Output ~ 0
~SC_Mon_TSMS
$Comp
L Device:R R921
U 1 1 5F7446A0
P 4610 6630
F 0 "R921" V 4530 6630 50  0000 C CNN
F 1 "2.7k" V 4610 6630 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4540 6630 50  0001 C CNN
F 3 "~" H 4610 6630 50  0001 C CNN
	1    4610 6630
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0338
U 1 1 5F7446A6
P 4820 6570
F 0 "#PWR0338" H 4820 6420 50  0001 C CNN
F 1 "+3.3V" H 4950 6610 50  0000 C CNN
F 2 "" H 4820 6570 50  0001 C CNN
F 3 "" H 4820 6570 50  0001 C CNN
	1    4820 6570
	1    0    0    -1  
$EndComp
Wire Wire Line
	4760 6630 4820 6630
Wire Wire Line
	4820 6570 4820 6630
Wire Wire Line
	4410 6630 4460 6630
Wire Wire Line
	4410 6630 4410 6720
Wire Wire Line
	2820 2050 2820 1870
Text HLabel 2710 2050 0    50   Output ~ 0
SC_BOTS_OUT
Wire Wire Line
	2710 2050 2820 2050
Wire Wire Line
	2820 1870 2820 1670
Wire Wire Line
	2820 1670 2710 1670
Connection ~ 2820 1870
Wire Wire Line
	2820 1330 2820 1130
Wire Wire Line
	2820 1330 2820 1560
Wire Wire Line
	2820 1560 2710 1560
Connection ~ 2820 1330
Wire Wire Line
	2830 2940 2830 2740
Wire Wire Line
	2830 2740 2720 2740
Connection ~ 2830 2940
Wire Wire Line
	2830 2620 2720 2620
Wire Wire Line
	2830 2400 3130 2400
Wire Wire Line
	2830 2400 2830 2620
Connection ~ 2830 2400
Wire Wire Line
	2830 3470 2830 3700
Wire Wire Line
	2830 3270 2730 3270
Wire Wire Line
	2830 4010 2830 3810
Wire Wire Line
	2830 3810 2730 3810
Wire Wire Line
	2830 4520 2830 4750
Wire Wire Line
	2830 4340 2740 4340
Wire Wire Line
	2830 5060 2830 4860
Wire Wire Line
	2830 4860 2740 4860
Wire Wire Line
	2830 5060 2830 5280
Wire Wire Line
	2830 5280 2740 5280
Wire Wire Line
	2830 5590 2830 5820
Wire Wire Line
	2830 5820 2740 5820
Wire Wire Line
	2830 6130 2830 5930
Wire Wire Line
	2830 5930 2740 5930
Wire Wire Line
	2830 6720 2830 6490
Wire Wire Line
	2830 6490 2740 6490
Wire Wire Line
	2830 6720 3130 6720
Text Notes 3000 640  0    100  ~ 0
Shutdown Circuit Monitoring
Wire Notes Line
	4000 900  4000 7360
Text Notes 3750 860  0    50   ~ 0
Isolation Barrier
Wire Notes Line width 12 style solid
	3890 1050 3650 1050
Wire Notes Line width 12 style solid
	3650 1050 3700 1000
Wire Notes Line width 12 style solid
	3700 1100 3650 1050
Text Notes 3630 980  0    50   ~ 0
LV Side
Wire Notes Line width 12 style solid
	4110 1050 4350 1050
Wire Notes Line width 12 style solid
	4350 1050 4300 1000
Wire Notes Line width 12 style solid
	4300 1100 4350 1050
Text Notes 4420 980  2    50   ~ 0
Zynq Side
Text Notes 1760 1170 2    50   ~ 0
Shutdown Circuit Supply
Text Notes 670  1620 0    50   ~ 0
Cockpit Emergency Switch
Wire Notes Line style dash_dot
	1800 880  1800 7340
Text Notes 1660 2140 2    50   ~ 0
BOTS
Text Notes 1670 2710 2    50   ~ 0
Inertia Switch
Text Notes 1660 3230 2    50   ~ 0
Left Emergency Switch
Text Notes 1660 3780 2    50   ~ 0
Right Emergency Switch
Text Notes 1640 4320 2    50   ~ 0
FR Wheel Interlock
Text Notes 1630 4850 2    50   ~ 0
FL Wheel Interlock
Text Notes 1630 5360 2    50   ~ 0
RR Wheel Interlock
Text Notes 1620 5920 2    50   ~ 0
RL Wheel Interlock
Text Notes 5790 1360 0    50   ~ 0
Shutdown Circuit Supply Monitoring
Text Notes 7220 1890 2    50   ~ 0
Cockpit Emergency Switch Monitoring
Wire Notes Line style dash_dot
	5700 870  5700 7330
Text Notes 5790 2410 0    50   ~ 0
BOTS Monitoring
Text Notes 5790 2960 0    50   ~ 0
Inertia Switch Monitoring
Text Notes 5780 3490 0    50   ~ 0
Left Emergency Switch Monitoring
Text Notes 5790 4030 0    50   ~ 0
Right Emergency Switch Monitoring
Text Notes 5790 4560 0    50   ~ 0
FR Wheel Interlock Monitoring
Text Notes 5790 5080 0    50   ~ 0
FL Wheel Interlock Monitoring
Text Notes 5790 5600 0    50   ~ 0
RR Wheel Interlock Monitoring
Text Notes 5800 6160 0    50   ~ 0
RL Wheel Interlock Monitoring
Text Notes 5790 6730 0    50   ~ 0
TSMS Monitoring
$Comp
L Isolator:LTV-847S U901
U 1 1 5F6D7AD6
P 4010 2500
F 0 "U901" H 4010 2780 50  0000 C CNN
F 1 "LTV-847S" H 4010 2710 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4010 2200 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3410 2950 50  0001 C CNN
	1    4010 2500
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847S U901
U 2 1 5F6D83B4
P 4010 2840
F 0 "U901" H 4010 3120 50  0000 C CNN
F 1 "LTV-847S" H 4010 3050 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4010 2540 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3410 3290 50  0001 C CNN
	2    4010 2840
	1    0    0    1   
$EndComp
$Comp
L Isolator:LTV-847S U903
U 1 1 5F6E4C89
P 4020 7160
F 0 "U903" H 4020 7440 50  0000 C CNN
F 1 "LTV-847S" H 4020 7370 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4020 6860 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3420 7610 50  0001 C CNN
	1    4020 7160
	1    0    0    1   
$EndComp
$Comp
L Isolator:LTV-847S U903
U 2 1 5F6E4C8F
P 4020 6820
F 0 "U903" H 4020 7100 50  0000 C CNN
F 1 "LTV-847S" H 4020 7030 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4020 6520 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3420 7270 50  0001 C CNN
	2    4020 6820
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847S U903
U 3 1 5F6E4C95
P 4020 6030
F 0 "U903" H 4020 6300 50  0000 C CNN
F 1 "LTV-847S" H 4010 6230 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4020 5730 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3420 6480 50  0001 C CNN
F 4 "Lite-On" H 4020 6030 50  0001 C CNN "Manufacturer"
F 5 "LTV-847S" H 4020 6030 50  0001 C CNN "Man. Part No."
	3    4020 6030
	1    0    0    1   
$EndComp
$Comp
L Isolator:LTV-847S U902
U 1 1 5F70D1F7
P 4010 4620
F 0 "U902" H 4010 4900 50  0000 C CNN
F 1 "LTV-847S" H 4010 4830 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4010 4320 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3410 5070 50  0001 C CNN
	1    4010 4620
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847S U902
U 2 1 5F70D1FD
P 4010 4960
F 0 "U902" H 4010 5240 50  0000 C CNN
F 1 "LTV-847S" H 4010 5170 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4010 4660 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3410 5410 50  0001 C CNN
	2    4010 4960
	1    0    0    1   
$EndComp
$Comp
L Isolator:LTV-847S U902
U 3 1 5F70D203
P 4010 3910
F 0 "U902" H 4010 4180 50  0000 C CNN
F 1 "LTV-847S" H 4000 4110 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4010 3610 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3410 4360 50  0001 C CNN
	3    4010 3910
	1    0    0    1   
$EndComp
$Comp
L Isolator:LTV-847S U902
U 4 1 5F70D209
P 4010 3570
F 0 "U902" H 4010 3830 50  0000 C CNN
F 1 "LTV-847S" H 4010 3770 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4010 3270 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3410 4020 50  0001 C CNN
	4    4010 3570
	1    0    0    -1  
$EndComp
NoConn ~ 3720 7260
Wire Wire Line
	3720 7060 3620 7060
$Comp
L Device:R R923
U 1 1 5F75AB92
P 3470 7060
F 0 "R923" V 3390 7060 50  0000 C CNN
F 1 "4.7k" V 3470 7060 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3400 7060 50  0001 C CNN
F 3 "~" H 3470 7060 50  0001 C CNN
	1    3470 7060
	0    1    -1   0   
$EndComp
Wire Wire Line
	3320 7060 3190 7060
Wire Wire Line
	4320 6920 4500 6920
Wire Wire Line
	4500 6920 4500 6990
Wire Wire Line
	4500 7060 4320 7060
$Comp
L power:GND #PWR0339
U 1 1 5F791C2A
P 4540 6990
F 0 "#PWR0339" H 4540 6740 50  0001 C CNN
F 1 "GND" V 4620 7010 50  0000 R CNN
F 2 "" H 4540 6990 50  0001 C CNN
F 3 "" H 4540 6990 50  0001 C CNN
	1    4540 6990
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4540 6990 4500 6990
Connection ~ 4500 6990
Wire Wire Line
	4500 6990 4500 7060
$Comp
L Isolator:LTV-847S U903
U 4 1 5F6E4C9B
P 4020 5690
F 0 "U903" H 4020 5950 50  0000 C CNN
F 1 "LTV-847S" H 4020 5890 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4020 5390 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3420 6140 50  0001 C CNN
	4    4020 5690
	1    0    0    -1  
$EndComp
Wire Wire Line
	4320 7260 4410 7260
Connection ~ 4410 7260
Wire Wire Line
	4410 7260 4900 7260
$Comp
L Device:R R924
U 1 1 5F7A9BF5
P 4610 7170
F 0 "R924" V 4530 7170 50  0000 C CNN
F 1 "2.7k" V 4610 7170 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4540 7170 50  0001 C CNN
F 3 "~" H 4610 7170 50  0001 C CNN
	1    4610 7170
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0340
U 1 1 5F7A9BFB
P 4820 7110
F 0 "#PWR0340" H 4820 6960 50  0001 C CNN
F 1 "+3.3V" H 4950 7150 50  0000 C CNN
F 2 "" H 4820 7110 50  0001 C CNN
F 3 "" H 4820 7110 50  0001 C CNN
	1    4820 7110
	1    0    0    -1  
$EndComp
Wire Wire Line
	4760 7170 4820 7170
Wire Wire Line
	4820 7110 4820 7170
Wire Wire Line
	4410 7170 4460 7170
Wire Wire Line
	4410 7170 4410 7260
NoConn ~ 4900 7260
Wire Notes Line width 12 style solid
	1700 1100 1700 1000
Wire Notes Line width 12 style solid
	1700 1000 1650 900 
Wire Notes Line width 12 style solid
	1670 950  1620 950 
Wire Notes Line width 12 style solid
	1620 930  1620 970 
Wire Notes Line width 12 style solid
	1700 900  1700 800 
$Comp
L Device:Fuse_Small F901
U 1 1 5F892CDD
P 2670 1130
F 0 "F901" H 2670 1315 50  0000 C CNN
F 1 "2A" H 2670 1190 50  0000 C CNN
F 2 "Vikings_misc:LittelfuseMiniBlade01530008Z" H 2670 1130 50  0001 C CNN
F 3 "https://www.mouser.dk/datasheet/2/240/Littelfuse_MINI_Datasheet-1077557.pdf" H 2670 1130 50  0001 C CNN
F 4 "Littelfuse" H 2670 1130 50  0001 C CNN "Manufacturer"
F 5 "0297002.WXNV" H 2670 1130 50  0001 C CNN "Man. Part No."
	1    2670 1130
	1    0    0    -1  
$EndComp
Wire Wire Line
	2770 1130 2820 1130
Wire Wire Line
	2570 1130 2470 1130
Wire Notes Line width 12 style solid
	1700 1600 1700 1500
Wire Notes Line width 12 style solid
	1700 1500 1680 1400
Wire Notes Line width 12 style solid
	1700 1400 1700 1300
Wire Notes Line width 12
	1700 1400 1680 1400
Wire Notes Line width 12 style solid
	1700 4300 1700 4200
Wire Notes Line width 12 style solid
	1700 4100 1700 4000
Wire Notes Line width 12 style solid
	1740 4150 1650 4090
Wire Notes Line width 12 style solid
	1650 4090 1650 4210
Wire Notes Line width 12 style solid
	1650 4210 1740 4150
Text Notes 1370 990  0    50   ~ 0
LVMS
Wire Notes Line width 12 style solid
	1700 2100 1700 2000
Wire Notes Line width 12 style solid
	1700 2000 1680 1910
Wire Notes Line width 12 style solid
	1700 1910 1700 1810
Wire Notes Line width 12
	1700 1910 1680 1910
Wire Notes Line width 12 style solid
	1700 2700 1700 2600
Wire Notes Line width 12 style solid
	1700 2600 1680 2510
Wire Notes Line width 12 style solid
	1700 2510 1700 2410
Wire Notes Line width 12
	1700 2510 1680 2510
Wire Notes Line width 12 style solid
	1700 3200 1700 3100
Wire Notes Line width 12 style solid
	1700 3100 1680 3000
Wire Notes Line width 12 style solid
	1700 3000 1700 2910
Wire Notes Line width 12
	1700 3000 1680 3000
Wire Notes Line width 12 style solid
	1700 3800 1700 3700
Wire Notes Line width 12 style solid
	1700 3700 1680 3600
Wire Notes Line width 12 style solid
	1700 3600 1700 3510
Wire Notes Line width 12
	1700 3600 1680 3600
Wire Notes Line width 12 style solid
	1700 4800 1700 4700
Wire Notes Line width 12 style solid
	1700 4600 1700 4500
Wire Notes Line width 12 style solid
	1740 4650 1650 4590
Wire Notes Line width 12 style solid
	1650 4590 1650 4710
Wire Notes Line width 12 style solid
	1650 4710 1740 4650
Wire Notes Line width 12 style solid
	1700 5300 1700 5200
Wire Notes Line width 12 style solid
	1700 5100 1700 5000
Wire Notes Line width 12 style solid
	1740 5150 1650 5090
Wire Notes Line width 12 style solid
	1650 5090 1650 5210
Wire Notes Line width 12 style solid
	1650 5210 1740 5150
Wire Notes Line width 12 style solid
	1700 5900 1700 5800
Wire Notes Line width 12 style solid
	1700 5700 1700 5600
Wire Notes Line width 12 style solid
	1740 5750 1650 5690
Wire Notes Line width 12 style solid
	1650 5690 1650 5810
Wire Notes Line width 12 style solid
	1650 5810 1740 5750
Wire Notes Line width 12 style solid
	1700 6400 1700 6300
Wire Notes Line width 12 style solid
	1700 6300 1650 6200
Wire Notes Line width 12 style solid
	1670 6250 1620 6250
Wire Notes Line width 12 style solid
	1620 6230 1620 6270
Wire Notes Line width 12 style solid
	1700 6200 1700 6100
Text Notes 1370 6290 0    50   ~ 0
LVMS
Text Notes 1440 1490 0    50   ~ 0
N.C.
Text Notes 1450 2000 0    50   ~ 0
N.C.
Text Notes 1450 2600 0    50   ~ 0
N.C.
Text Notes 1450 3100 0    50   ~ 0
N.C.
Text Notes 1450 3690 0    50   ~ 0
N.C.
Text Notes 1290 4180 0    50   ~ 0
Interlock
Text Notes 1290 4680 0    50   ~ 0
Interlock
Text Notes 1290 5180 0    50   ~ 0
Interlock
Text Notes 1290 5780 0    50   ~ 0
Interlock
Text HLabel 4880 1330 2    50   Output ~ 0
~SC_Mon_Supply
Text HLabel 4880 1870 2    50   Output ~ 0
~SC_Mon_Cockpit
Text HLabel 4890 2400 2    50   Output ~ 0
~SC_Mon_BOTS
Text HLabel 4890 2940 2    50   Output ~ 0
~SC_Mon_Inertia
Text HLabel 4890 3470 2    50   Output ~ 0
~SC_Mon_Left
$Comp
L Isolator:LTV-847S U901
U 4 1 5F6DADD3
P 4000 1430
F 0 "U901" H 4000 1690 50  0000 C CNN
F 1 "LTV-847S" H 4000 1630 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4000 1130 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3400 1880 50  0001 C CNN
	4    4000 1430
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1530 3600 1530
Wire Wire Line
	2820 1330 3130 1330
$Comp
L Isolator:LTV-847S U901
U 3 1 5F6D95F8
P 4000 1770
F 0 "U901" H 4000 2040 50  0000 C CNN
F 1 "LTV-847S" H 3990 1970 50  0000 C CNN
F 2 "Package_DIP:SMDIP-16_W9.53mm" H 4000 1470 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 3400 2220 50  0001 C CNN
	3    4000 1770
	1    0    0    1   
$EndComp
Wire Wire Line
	4300 1670 4480 1670
Wire Wire Line
	4300 1870 4390 1870
Wire Wire Line
	3130 1530 3130 1600
Wire Wire Line
	3140 2600 3140 2670
Wire Wire Line
	3140 3670 3140 3740
Wire Wire Line
	3140 4720 3140 4790
Wire Wire Line
	3150 5790 3150 5860
Wire Wire Line
	3190 6920 3190 6990
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0341
U 1 1 5FF7A0CB
P 3190 6990
F 0 "#PWR0341" H 3190 6740 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 3540 6840 50  0000 R CNN
F 2 "" H 3190 6990 50  0001 C CNN
F 3 "" H 3190 6990 50  0001 C CNN
	1    3190 6990
	0    1    1    0   
$EndComp
Connection ~ 3190 6990
Wire Wire Line
	3190 6990 3190 7060
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0342
U 1 1 5FF7AD03
P 3150 5860
F 0 "#PWR0342" H 3150 5610 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 3510 5710 50  0000 R CNN
F 2 "" H 3150 5860 50  0001 C CNN
F 3 "" H 3150 5860 50  0001 C CNN
	1    3150 5860
	0    1    1    0   
$EndComp
Connection ~ 3150 5860
Wire Wire Line
	3150 5860 3150 5930
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0343
U 1 1 5FF7B2E7
P 3140 4790
F 0 "#PWR0343" H 3140 4540 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 3500 4640 50  0000 R CNN
F 2 "" H 3140 4790 50  0001 C CNN
F 3 "" H 3140 4790 50  0001 C CNN
	1    3140 4790
	0    1    1    0   
$EndComp
Connection ~ 3140 4790
Wire Wire Line
	3140 4790 3140 4860
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0344
U 1 1 5FF7B604
P 3140 3740
F 0 "#PWR0344" H 3140 3490 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 3500 3590 50  0000 R CNN
F 2 "" H 3140 3740 50  0001 C CNN
F 3 "" H 3140 3740 50  0001 C CNN
	1    3140 3740
	0    1    1    0   
$EndComp
Connection ~ 3140 3740
Wire Wire Line
	3140 3740 3140 3810
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0345
U 1 1 5FF7BA87
P 3140 2670
F 0 "#PWR0345" H 3140 2420 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 3500 2520 50  0000 R CNN
F 2 "" H 3140 2670 50  0001 C CNN
F 3 "" H 3140 2670 50  0001 C CNN
	1    3140 2670
	0    1    1    0   
$EndComp
Connection ~ 3140 2670
Wire Wire Line
	3140 2670 3140 2740
$Comp
L Vikings_misc:GND-LV_Unfiltered #PWR0346
U 1 1 5FF7BF2C
P 3130 1600
F 0 "#PWR0346" H 3130 1350 50  0001 C CNN
F 1 "GND-LV_Unfiltered" H 3480 1460 50  0000 R CNN
F 2 "" H 3130 1600 50  0001 C CNN
F 3 "" H 3130 1600 50  0001 C CNN
	1    3130 1600
	0    1    1    0   
$EndComp
Connection ~ 3130 1600
Wire Wire Line
	3130 1600 3130 1670
$Comp
L Vikings_passives:150060BS75000 LED905
U 1 1 5FC49504
P 3130 3470
F 0 "LED905" H 3060 3620 50  0000 C CNN
F 1 "150060BS75000" H 3340 3470 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 4070 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 4170 50  0001 L CNN
F 4 "Blue" H 3130 4270 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 4370 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 4470 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 4570 50  0001 L CNN "category"
F 8 "12518860" H 3130 4670 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 4770 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 4870 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 4970 50  0001 L CNN "package"
F 12 "1421305860" H 3130 5070 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 5170 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 5270 50  0001 L CNN "imported"
	1    3130 3470
	1    0    0    -1  
$EndComp
Wire Wire Line
	3530 3470 3710 3470
Wire Wire Line
	3530 2940 3710 2940
$Comp
L Vikings_passives:150060BS75000 LED904
U 1 1 5FC4A0AB
P 3130 2940
F 0 "LED904" H 3060 3090 50  0000 C CNN
F 1 "150060BS75000" H 3310 2940 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 3540 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 3640 50  0001 L CNN
F 4 "Blue" H 3130 3740 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 3840 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 3940 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 4040 50  0001 L CNN "category"
F 8 "12518860" H 3130 4140 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 4240 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 4340 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 4440 50  0001 L CNN "package"
F 12 "1421305860" H 3130 4540 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 4640 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 4740 50  0001 L CNN "imported"
	1    3130 2940
	1    0    0    1   
$EndComp
$Comp
L Vikings_passives:150060BS75000 LED903
U 1 1 5FC66FE2
P 3130 2400
F 0 "LED903" H 3060 2550 50  0000 C CNN
F 1 "150060BS75000" H 3310 2400 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 3000 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 3100 50  0001 L CNN
F 4 "Blue" H 3130 3200 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 3300 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 3400 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 3500 50  0001 L CNN "category"
F 8 "12518860" H 3130 3600 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 3700 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 3800 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 3900 50  0001 L CNN "package"
F 12 "1421305860" H 3130 4000 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 4100 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 4200 50  0001 L CNN "imported"
	1    3130 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3530 2400 3710 2400
$Comp
L Vikings_passives:150060BS75000 LED902
U 1 1 5FC81C57
P 3130 1870
F 0 "LED902" H 3060 2030 50  0000 C CNN
F 1 "150060BS75000" H 3310 1870 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 2470 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 2570 50  0001 L CNN
F 4 "Blue" H 3130 2670 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 2770 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 2870 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 2970 50  0001 L CNN "category"
F 8 "12518860" H 3130 3070 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 3170 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 3270 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 3370 50  0001 L CNN "package"
F 12 "1421305860" H 3130 3470 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 3570 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 3670 50  0001 L CNN "imported"
	1    3130 1870
	1    0    0    1   
$EndComp
Wire Wire Line
	3530 1870 3700 1870
$Comp
L Vikings_passives:150060BS75000 LED901
U 1 1 5FC82C42
P 3130 1330
F 0 "LED901" H 3070 1480 50  0000 C CNN
F 1 "150060BS75000" H 3310 1330 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 1930 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 2030 50  0001 L CNN
F 4 "Blue" H 3130 2130 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 2230 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 2330 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 2430 50  0001 L CNN "category"
F 8 "12518860" H 3130 2530 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 2630 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 2730 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 2830 50  0001 L CNN "package"
F 12 "1421305860" H 3130 2930 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 3030 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 3130 50  0001 L CNN "imported"
	1    3130 1330
	1    0    0    -1  
$EndComp
Wire Wire Line
	3530 1330 3700 1330
$Comp
L Vikings_passives:150060BS75000 LED906
U 1 1 5FC8444F
P 3130 4010
F 0 "LED906" H 3060 4160 50  0000 C CNN
F 1 "150060BS75000" H 3340 4010 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 4610 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 4710 50  0001 L CNN
F 4 "Blue" H 3130 4810 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 4910 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 5010 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 5110 50  0001 L CNN "category"
F 8 "12518860" H 3130 5210 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 5310 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 5410 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 5510 50  0001 L CNN "package"
F 12 "1421305860" H 3130 5610 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 5710 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 5810 50  0001 L CNN "imported"
	1    3130 4010
	1    0    0    1   
$EndComp
Wire Wire Line
	3530 4010 3710 4010
$Comp
L Vikings_passives:150060BS75000 LED907
U 1 1 5FC85426
P 3130 4520
F 0 "LED907" H 3060 4670 50  0000 C CNN
F 1 "150060BS75000" H 3340 4520 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 5120 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 5220 50  0001 L CNN
F 4 "Blue" H 3130 5320 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 5420 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 5520 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 5620 50  0001 L CNN "category"
F 8 "12518860" H 3130 5720 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 5820 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 5920 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 6020 50  0001 L CNN "package"
F 12 "1421305860" H 3130 6120 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 6220 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 6320 50  0001 L CNN "imported"
	1    3130 4520
	1    0    0    -1  
$EndComp
Wire Wire Line
	3530 4520 3710 4520
$Comp
L Vikings_passives:150060BS75000 LED908
U 1 1 5FC86367
P 3130 5060
F 0 "LED908" H 3060 5210 50  0000 C CNN
F 1 "150060BS75000" H 3340 5060 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 5660 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 5760 50  0001 L CNN
F 4 "Blue" H 3130 5860 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 5960 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 6060 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 6160 50  0001 L CNN "category"
F 8 "12518860" H 3130 6260 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 6360 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 6460 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 6560 50  0001 L CNN "package"
F 12 "1421305860" H 3130 6660 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 6760 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 6860 50  0001 L CNN "imported"
	1    3130 5060
	1    0    0    1   
$EndComp
Wire Wire Line
	3530 5060 3710 5060
$Comp
L Vikings_passives:150060BS75000 LED909
U 1 1 5FC872C8
P 3130 5590
F 0 "LED909" H 3060 5740 50  0000 C CNN
F 1 "150060BS75000" H 3340 5590 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 6190 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 6290 50  0001 L CNN
F 4 "Blue" H 3130 6390 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 6490 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 6590 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 6690 50  0001 L CNN "category"
F 8 "12518860" H 3130 6790 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 6890 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 6990 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 7090 50  0001 L CNN "package"
F 12 "1421305860" H 3130 7190 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 7290 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 7390 50  0001 L CNN "imported"
	1    3130 5590
	1    0    0    -1  
$EndComp
Wire Wire Line
	3530 5590 3720 5590
$Comp
L Vikings_passives:150060BS75000 LED910
U 1 1 5FC882F7
P 3130 6130
F 0 "LED910" H 3060 6280 50  0000 C CNN
F 1 "150060BS75000" H 3340 6130 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 6730 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 6830 50  0001 L CNN
F 4 "Blue" H 3130 6930 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 7030 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 7130 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 7230 50  0001 L CNN "category"
F 8 "12518860" H 3130 7330 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 7430 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 7530 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 7630 50  0001 L CNN "package"
F 12 "1421305860" H 3130 7730 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 7830 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 7930 50  0001 L CNN "imported"
	1    3130 6130
	1    0    0    1   
$EndComp
Wire Wire Line
	3530 6130 3720 6130
$Comp
L Vikings_passives:150060BS75000 LED911
U 1 1 5FC893B4
P 3130 6720
F 0 "LED911" H 3060 6870 50  0000 C CNN
F 1 "150060BS75000" H 3340 6720 50  0001 C CNN
F 2 "Vikings_devices:Wurth_150060BS75000" H 3130 7320 50  0001 L CNN
F 3 "https://www.mouser.dk/datasheet/2/445/150060BS75000-1714099.pdf" H 3130 7420 50  0001 L CNN
F 4 "Blue" H 3130 7520 50  0001 L CNN "Color"
F 5 "Manufacturer URL" H 3130 7620 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.we-online.com" H 3130 7720 50  0001 L CNN "Component Link 1 URL"
F 7 "UNK" H 3130 7820 50  0001 L CNN "category"
F 8 "12518860" H 3130 7920 50  0001 L CNN "ciiva ids"
F 9 "c86f0b01d77e687a" H 3130 8020 50  0001 L CNN "library id"
F 10 "Wuerth Elektronik" H 3130 8120 50  0001 L CNN "manufacturer"
F 11 "0603_A" H 3130 8220 50  0001 L CNN "package"
F 12 "1421305860" H 3130 8320 50  0001 L CNN "release date"
F 13 "5144AC10-0A10-433C-B4D0-D5D668B210EE" H 3130 8420 50  0001 L CNN "vault revision"
F 14 "yes" H 3130 8520 50  0001 L CNN "imported"
	1    3130 6720
	1    0    0    -1  
$EndComp
Wire Wire Line
	3530 6720 3720 6720
Wire Wire Line
	4390 1330 4880 1330
Wire Wire Line
	4390 1870 4880 1870
Wire Wire Line
	4400 2400 4890 2400
Wire Wire Line
	4400 2940 4890 2940
Wire Wire Line
	4400 3470 4890 3470
Wire Wire Line
	4400 4010 4890 4010
Wire Wire Line
	4400 4520 4890 4520
Wire Wire Line
	4400 5060 4890 5060
Wire Wire Line
	4410 5590 4900 5590
Wire Wire Line
	4410 6130 4900 6130
Wire Wire Line
	4410 6720 4900 6720
$EndSCHEMATC
