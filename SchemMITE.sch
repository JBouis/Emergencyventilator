EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:VCC #PWR0101
U 1 1 5E81AF71
P 6600 950
F 0 "#PWR0101" H 6600 800 50  0001 C CNN
F 1 "VCC" H 6617 1123 50  0000 C CNN
F 2 "" H 6600 950 50  0001 C CNN
F 3 "" H 6600 950 50  0001 C CNN
	1    6600 950 
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5E81CF13
P 6600 1350
F 0 "SW1" H 6600 1617 50  0000 C CNN
F 1 "SW_DIP_x01" H 6600 1526 50  0000 C CNN
F 2 "" H 6600 1350 50  0001 C CNN
F 3 "~" H 6600 1350 50  0001 C CNN
	1    6600 1350
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5E82D373
P 5950 1550
F 0 "C2" V 5698 1550 50  0000 C CNN
F 1 "2200pf" V 5789 1550 50  0000 C CNN
F 2 "" H 5950 1550 50  0001 C CNN
F 3 "~" H 5950 1550 50  0001 C CNN
	1    5950 1550
	0    1    1    0   
$EndComp
$Comp
L Device:CP1 C1
U 1 1 5E82EA3D
P 5950 2000
F 0 "C1" V 5698 2000 50  0000 C CNN
F 1 "2200pf" V 5789 2000 50  0000 C CNN
F 2 "" H 5950 2000 50  0001 C CNN
F 3 "~" H 5950 2000 50  0001 C CNN
	1    5950 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 1550 6600 1650
Connection ~ 6600 1650
Wire Wire Line
	6600 1650 6600 2000
Wire Wire Line
	6100 1550 6100 1650
Wire Wire Line
	6500 3600 6650 3600
$Comp
L Motor:Motor_Servo M?
U 1 1 5E83C0FF
P 4850 2000
AR Path="/5E835C57/5E83C0FF" Ref="M?"  Part="1" 
AR Path="/5E83C0FF" Ref="M2"  Part="1" 
F 0 "M2" H 5182 2065 50  0000 L CNN
F 1 "Motor_Servo" H 5182 1974 50  0000 L CNN
F 2 "" H 4850 1810 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 4850 1810 50  0001 C CNN
	1    4850 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4850 1850 4850 2100
$Comp
L Motor:Motor_Servo M?
U 1 1 5E84C6D5
P 4850 1550
AR Path="/5E835C57/5E84C6D5" Ref="M?"  Part="1" 
AR Path="/5E84C6D5" Ref="M1"  Part="1" 
F 0 "M1" H 5182 1615 50  0000 L CNN
F 1 "Motor_Servo" H 5182 1524 50  0000 L CNN
F 2 "" H 4850 1360 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 4850 1360 50  0001 C CNN
	1    4850 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4850 1400 4850 1650
Wire Wire Line
	5150 1550 5800 1550
Connection ~ 5800 1550
Wire Wire Line
	5800 1550 5850 1550
Wire Wire Line
	5150 2000 5800 2000
Connection ~ 5800 2000
Wire Wire Line
	5800 2000 5850 2000
Wire Wire Line
	5400 1250 5400 1200
$Comp
L pspice:0 #GND01
U 1 1 5E850930
P 5250 2400
F 0 "#GND01" H 5250 2300 50  0001 C CNN
F 1 "0" H 5250 2489 50  0000 C CNN
F 2 "" H 5250 2400 50  0001 C CNN
F 3 "~" H 5250 2400 50  0001 C CNN
	1    5250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1450 5250 1450
Wire Wire Line
	5250 1450 5250 1900
Wire Wire Line
	5150 1900 5250 1900
Connection ~ 5250 1900
Wire Wire Line
	5250 1900 5250 2250
Wire Wire Line
	6100 1650 6600 1650
Wire Wire Line
	6100 2000 6600 2000
$Comp
L Regulator_Linear:L78L05_TO92 U2
U 1 1 5E85818E
P 6600 2400
F 0 "U2" H 6600 2642 50  0000 C CNN
F 1 "L78L05_TO92" H 6600 2551 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6600 2625 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 6600 2350 50  0001 C CNN
	1    6600 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 2100 6600 2000
Connection ~ 6600 2000
Wire Wire Line
	6300 2400 5600 2400
Wire Wire Line
	5600 2400 5600 2250
Wire Wire Line
	5600 2250 5250 2250
Connection ~ 5250 2250
Wire Wire Line
	5250 2250 5250 2400
$Comp
L Device:C C3
U 1 1 5E8613F2
P 5600 2850
F 0 "C3" H 5715 2896 50  0000 L CNN
F 1 "0,1uf" H 5715 2805 50  0000 L CNN
F 2 "" H 5638 2700 50  0001 C CNN
F 3 "~" H 5600 2850 50  0001 C CNN
	1    5600 2850
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND02
U 1 1 5E862513
P 5600 3150
F 0 "#GND02" H 5600 3050 50  0001 C CNN
F 1 "0" H 5600 3239 50  0000 C CNN
F 2 "" H 5600 3150 50  0001 C CNN
F 3 "~" H 5600 3150 50  0001 C CNN
	1    5600 3150
	1    0    0    -1  
$EndComp
Connection ~ 6600 2700
Wire Wire Line
	5600 3150 5600 3000
$Comp
L Device:R_POT angle_pot1
U 1 1 5E8648AA
P 10200 4600
F 0 "angle_pot1" H 10130 4554 50  0000 R CNN
F 1 "10k" H 10130 4645 50  0000 R CNN
F 2 "" H 10200 4600 50  0001 C CNN
F 3 "~" H 10200 4600 50  0001 C CNN
	1    10200 4600
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT thresold1
U 1 1 5E865D2F
P 9550 4500
F 0 "thresold1" H 9480 4454 50  0000 R CNN
F 1 "10k" H 9480 4545 50  0000 R CNN
F 2 "" H 9550 4500 50  0001 C CNN
F 3 "~" H 9550 4500 50  0001 C CNN
	1    9550 4500
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT I/E1
U 1 1 5E86661D
P 8900 4400
F 0 "I/E1" H 8830 4354 50  0000 R CNN
F 1 "10k" H 8830 4445 50  0000 R CNN
F 2 "" H 8900 4400 50  0001 C CNN
F 3 "~" H 8900 4400 50  0001 C CNN
	1    8900 4400
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT tidal_pot1
U 1 1 5E867F78
P 8500 4200
F 0 "tidal_pot1" H 8430 4154 50  0000 R CNN
F 1 "10k" H 8430 4245 50  0000 R CNN
F 2 "" H 8500 4200 50  0001 C CNN
F 3 "~" H 8500 4200 50  0001 C CNN
	1    8500 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT bpm_pot1
U 1 1 5E868683
P 8050 4100
F 0 "bpm_pot1" H 7980 4054 50  0000 R CNN
F 1 "10k" H 7980 4145 50  0000 R CNN
F 2 "" H 8050 4100 50  0001 C CNN
F 3 "~" H 8050 4100 50  0001 C CNN
	1    8050 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 3100 8050 3800
Wire Wire Line
	8050 3800 8500 3800
Wire Wire Line
	8500 3800 8500 4050
Connection ~ 8050 3800
Wire Wire Line
	8050 3800 8050 3950
Wire Wire Line
	8500 3800 8900 3800
Wire Wire Line
	8900 3800 8900 4250
Connection ~ 8500 3800
Wire Wire Line
	8900 3800 9550 3800
Wire Wire Line
	9550 3800 9550 4350
Connection ~ 8900 3800
Wire Wire Line
	9550 3800 10200 3800
Wire Wire Line
	10200 3800 10200 4450
Connection ~ 9550 3800
Wire Wire Line
	10200 4750 10200 5200
Wire Wire Line
	10200 5200 9550 5200
Wire Wire Line
	9550 4650 9550 5200
Connection ~ 9550 5200
Wire Wire Line
	8900 4550 8900 5200
Connection ~ 8900 5200
Wire Wire Line
	8900 5200 8500 5200
Wire Wire Line
	8500 4350 8500 5200
Connection ~ 8500 5200
Wire Wire Line
	8500 5200 8050 5200
Wire Wire Line
	8050 4300 8050 5200
Connection ~ 8050 5200
Wire Wire Line
	8050 5200 6800 5200
Wire Wire Line
	7200 4100 7900 4100
Wire Wire Line
	7200 4200 8350 4200
Wire Wire Line
	7200 4300 8050 4300
Wire Wire Line
	8750 4300 8750 4400
Connection ~ 8050 4300
Wire Wire Line
	8050 4300 8750 4300
Wire Wire Line
	7200 4400 8750 4400
Wire Wire Line
	9400 4400 9400 4500
Connection ~ 8750 4400
Wire Wire Line
	8750 4400 9400 4400
Wire Wire Line
	7200 4500 9400 4500
Wire Wire Line
	10050 4500 10050 4600
Connection ~ 9400 4500
Wire Wire Line
	9400 4500 10050 4500
$Comp
L Display_Character:LCD-016N002L U1
U 1 1 5E887FE0
P 4400 4300
F 0 "U1" H 4400 5281 50  0000 C CNN
F 1 "LCD-016N002L" H 4400 5190 50  0000 C CNN
F 2 "Display:LCD-016N002L" H 4420 3380 50  0001 C CNN
F 3 "http://www.vishay.com/docs/37299/37299.pdf" H 4900 4000 50  0001 C CNN
	1    4400 4300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6200 4600 5650 4600
Wire Wire Line
	5650 4600 5650 3700
Wire Wire Line
	5650 3700 4800 3700
Wire Wire Line
	4800 4600 5050 4600
Wire Wire Line
	5050 4600 5050 4500
Wire Wire Line
	4800 4700 5100 4700
Wire Wire Line
	4850 4800 5250 4800
Wire Wire Line
	5250 4800 5250 4300
Wire Wire Line
	4800 4900 5400 4900
Wire Wire Line
	5400 4900 5400 4200
Wire Wire Line
	4400 3500 4400 2700
Wire Wire Line
	4400 2700 5600 2700
Connection ~ 5600 2700
Wire Wire Line
	4000 4300 3700 4300
Wire Wire Line
	3700 4300 3700 2700
Wire Wire Line
	3700 2700 4400 2700
Connection ~ 4400 2700
Wire Wire Line
	4400 5100 4400 5200
Wire Wire Line
	4400 5200 4900 5200
Wire Wire Line
	4000 4400 3700 4400
Wire Wire Line
	3700 4400 3700 5200
Connection ~ 4400 5200
Wire Wire Line
	4800 3900 5500 3900
Wire Wire Line
	5500 3900 5500 3300
Wire Wire Line
	6100 3300 6100 3000
Wire Wire Line
	6100 3000 7400 3000
Wire Wire Line
	7400 3000 7400 3900
Wire Wire Line
	7400 3900 7200 3900
Wire Wire Line
	4800 3800 4900 3800
Wire Wire Line
	4900 3800 4900 5200
Connection ~ 4900 5200
Wire Wire Line
	5700 4000 5700 1650
Wire Wire Line
	4850 1650 5150 1650
Connection ~ 5150 1650
Wire Wire Line
	5150 1650 5700 1650
Wire Wire Line
	5450 4100 5450 2100
Wire Wire Line
	4850 2100 5150 2100
Connection ~ 5150 2100
Wire Wire Line
	5150 2100 5450 2100
$Comp
L Sensor_Temperature:TMP36xS U3
U 1 1 5E8A9A2B
P 9000 3050
F 0 "U3" H 9544 3096 50  0000 L CNN
F 1 "TMP36xS" H 9544 3005 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9000 2600 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/TMP35_36_37.pdf" H 9000 3050 50  0001 C CNN
	1    9000 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4600 9900 4600
Wire Wire Line
	9900 4600 9900 3050
Wire Wire Line
	9900 3050 9500 3050
Wire Wire Line
	9000 3450 9150 3450
Wire Wire Line
	9150 3450 9150 5200
Wire Wire Line
	8900 5200 9150 5200
Connection ~ 9150 5200
Wire Wire Line
	9150 5200 9550 5200
Wire Wire Line
	9000 2650 8300 2650
Wire Wire Line
	8100 2650 8100 3100
Wire Wire Line
	8100 3100 8050 3100
Wire Wire Line
	4900 5200 5700 5200
Wire Wire Line
	5100 4400 5100 4700
Wire Wire Line
	3700 5200 4400 5200
Connection ~ 6600 3100
Wire Wire Line
	6600 3100 6600 3200
Wire Wire Line
	6600 2700 6600 3100
Wire Wire Line
	5050 4500 6200 4500
Wire Wire Line
	5100 4400 6200 4400
Wire Wire Line
	5250 4300 6200 4300
Wire Wire Line
	5400 4200 6200 4200
Wire Wire Line
	6200 4100 5450 4100
Wire Wire Line
	6200 4000 5700 4000
Wire Wire Line
	5500 3300 6100 3300
Wire Wire Line
	6600 2700 5600 2700
$Comp
L MCU_Module:Arduino_UNO_R2 Arduinomcu1
U 1 1 5E819584
P 6700 4100
F 0 "Arduinomcu1" H 6700 5281 50  0000 C CNN
F 1 "Arduino_UNO_R2" H 6700 5190 50  0000 C CNN
F 2 "Module:Arduino_UNO_R2" H 6700 4100 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 6700 4100 50  0001 C CNN
	1    6700 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 5E8E310C
P 5800 5650
F 0 "BZ1" V 5758 5802 50  0000 L CNN
F 1 "Buzzer" V 5849 5802 50  0000 L CNN
F 2 "" V 5775 5750 50  0001 C CNN
F 3 "~" V 5775 5750 50  0001 C CNN
	1    5800 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 5550 5700 5200
Connection ~ 5700 5200
Wire Wire Line
	5700 5200 6000 5200
Wire Wire Line
	5900 5550 5900 3900
Wire Wire Line
	5900 3900 6200 3900
$Comp
L Device:LED D1
U 1 1 5E8EBC49
P 6000 4950
F 0 "D1" V 6039 4833 50  0000 R CNN
F 1 "LED" V 5948 4833 50  0000 R CNN
F 2 "" H 6000 4950 50  0001 C CNN
F 3 "~" H 6000 4950 50  0001 C CNN
	1    6000 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 5100 6000 5200
Connection ~ 6000 5200
Wire Wire Line
	6000 5200 6600 5200
Wire Wire Line
	6000 4800 6000 3800
Wire Wire Line
	6000 3800 6200 3800
$Comp
L Sensor_Pressure:MPXA6115A U4
U 1 1 5E8F5846
P 2750 3150
F 0 "U4" H 2321 3196 50  0000 R CNN
F 1 "MPXA6115A" H 2321 3105 50  0000 R CNN
F 2 "" H 2250 2800 50  0001 C CNN
F 3 "http://www.nxp.com/files/sensors/doc/data_sheet/MPXA6115A.pdf" H 2750 3750 50  0001 C CNN
	1    2750 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2700 2750 2700
Wire Wire Line
	2750 2700 2750 2850
Connection ~ 3700 2700
Wire Wire Line
	2750 3450 2750 3700
Wire Wire Line
	2750 5200 3700 5200
Connection ~ 3700 5200
$Comp
L Device:C C4
U 1 1 5E9084DA
P 2150 3150
F 0 "C4" H 2265 3196 50  0000 L CNN
F 1 "100nF" H 2265 3105 50  0000 L CNN
F 2 "" H 2188 3000 50  0001 C CNN
F 3 "~" H 2150 3150 50  0001 C CNN
	1    2150 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E909282
P 3150 3550
F 0 "C5" H 3265 3596 50  0000 L CNN
F 1 "47pF" H 3265 3505 50  0000 L CNN
F 2 "" H 3188 3400 50  0001 C CNN
F 3 "~" H 3150 3550 50  0001 C CNN
	1    3150 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E90A18C
P 3450 3550
F 0 "R1" H 3520 3596 50  0000 L CNN
F 1 "51k" H 3520 3505 50  0000 L CNN
F 2 "" V 3380 3550 50  0001 C CNN
F 3 "~" H 3450 3550 50  0001 C CNN
	1    3450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3150 3450 3150
Wire Wire Line
	4950 3150 4950 3550
Wire Wire Line
	4950 3550 5800 3550
Wire Wire Line
	5800 3550 5800 3700
Wire Wire Line
	5800 3700 6200 3700
Wire Wire Line
	3150 3400 3150 3150
Connection ~ 3150 3150
Wire Wire Line
	3450 3400 3450 3150
Connection ~ 3450 3150
Wire Wire Line
	3450 3150 4950 3150
Wire Wire Line
	3150 3700 2750 3700
Connection ~ 2750 3700
Wire Wire Line
	2750 3700 2750 5200
Wire Wire Line
	3450 3700 3150 3700
Connection ~ 3150 3700
Wire Wire Line
	2750 2700 2150 2700
Wire Wire Line
	2150 2700 2150 3000
Connection ~ 2750 2700
Wire Wire Line
	2150 3300 2150 3700
Wire Wire Line
	2150 3700 2750 3700
$Comp
L Device:C 0.1pF1
U 1 1 5E93046E
P 8300 3000
F 0 "0.1pF1" H 8415 3046 50  0000 L CNN
F 1 "C" H 8415 2955 50  0000 L CNN
F 2 "" H 8338 2850 50  0001 C CNN
F 3 "~" H 8300 3000 50  0001 C CNN
	1    8300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2850 8300 2650
Connection ~ 8300 2650
Wire Wire Line
	8300 2650 8100 2650
Wire Wire Line
	8300 3150 8300 3450
Wire Wire Line
	8300 3450 9000 3450
Connection ~ 9000 3450
Wire Wire Line
	6600 2700 7600 2700
Wire Wire Line
	7600 2700 7600 3800
Wire Wire Line
	7600 3800 8050 3800
$Comp
L Analog_Switch:ADG417BN ConfirmButton
U 1 1 5E9734FA
P 1600 3400
F 0 "ConfirmButton" V 1554 3530 50  0000 L CNN
F 1 "ADG417BN" V 1645 3530 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 1600 3300 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADG417.pdf" H 1600 3400 50  0001 C CNN
	1    1600 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 2700 1600 2700
Wire Wire Line
	1600 2700 1600 3100
Connection ~ 2150 2700
Wire Wire Line
	1600 3700 1600 5200
Wire Wire Line
	1600 5200 2750 5200
Connection ~ 2750 5200
Wire Wire Line
	1400 3400 1350 3400
Wire Wire Line
	1350 3400 1350 5000
Wire Wire Line
	1350 5000 5700 5000
Wire Wire Line
	5700 5000 5700 4700
Wire Wire Line
	5700 4700 6200 4700
$EndSCHEMATC
