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
P 6600 1250
F 0 "SW1" H 6600 1517 50  0000 C CNN
F 1 "SW_DIP_x01" H 6600 1426 50  0000 C CNN
F 2 "" H 6600 1250 50  0001 C CNN
F 3 "~" H 6600 1250 50  0001 C CNN
	1    6600 1250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6600 1550 6600 1600
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
Wire Wire Line
	6300 2400 6250 2400
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
	7200 4100 7900 4100
Wire Wire Line
	7200 4200 8350 4200
Wire Wire Line
	8750 4300 8750 4400
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
	5900 5550 5900 3900
Wire Wire Line
	5900 3900 6200 3900
$Comp
L Device:LED D1
U 1 1 5E8EBC49
P 6000 5050
F 0 "D1" V 6039 4933 50  0000 R CNN
F 1 "LED" V 5948 4933 50  0000 R CNN
F 2 "" H 6000 5050 50  0001 C CNN
F 3 "~" H 6000 5050 50  0001 C CNN
	1    6000 5050
	0    -1   -1   0   
$EndComp
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
	3150 3400 3150 3150
Connection ~ 3150 3150
Wire Wire Line
	3450 3400 3450 3150
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
Wire Wire Line
	2150 2700 1600 2700
Connection ~ 2150 2700
Wire Wire Line
	1600 5200 2750 5200
Connection ~ 2750 5200
Wire Wire Line
	5700 5000 5700 4700
Wire Wire Line
	5700 4700 6200 4700
$Comp
L Switch:SW_Push SW2
U 1 1 5E9CB359
P 1600 3400
F 0 "SW2" H 1600 3685 50  0000 C CNN
F 1 "SW_Push" H 1600 3594 50  0000 C CNN
F 2 "" H 1600 3600 50  0001 C CNN
F 3 "~" H 1600 3600 50  0001 C CNN
	1    1600 3400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E9E252E
P 1600 2850
F 0 "R2" H 1670 2896 50  0000 L CNN
F 1 "500" H 1670 2805 50  0000 L CNN
F 2 "" V 1530 2850 50  0001 C CNN
F 3 "~" H 1600 2850 50  0001 C CNN
	1    1600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3600 1600 5200
Wire Wire Line
	5700 5000 1750 5000
Wire Wire Line
	5150 2000 5900 2000
Wire Wire Line
	6100 1550 5800 1550
$Comp
L Device:C C6
U 1 1 5EA44035
P 6100 2250
F 0 "C6" H 6215 2296 50  0000 L CNN
F 1 "01uF" H 6215 2205 50  0000 L CNN
F 2 "" H 6138 2100 50  0001 C CNN
F 3 "~" H 6100 2250 50  0001 C CNN
	1    6100 2250
	1    0    0    -1  
$EndComp
Connection ~ 6100 2400
Wire Wire Line
	6100 2400 5900 2400
Wire Wire Line
	6600 2100 6100 2100
Connection ~ 6600 2100
Wire Wire Line
	6600 950  6600 1050
$Comp
L Device:C C1
U 1 1 5EA5318A
P 5800 1700
F 0 "C1" H 5915 1746 50  0000 L CNN
F 1 "0,1uF" H 5915 1655 50  0000 L CNN
F 2 "" H 5838 1550 50  0001 C CNN
F 3 "~" H 5800 1700 50  0001 C CNN
	1    5800 1700
	1    0    0    -1  
$EndComp
Connection ~ 5800 1550
Wire Wire Line
	5800 1550 5150 1550
Wire Wire Line
	5800 1850 5800 2400
Connection ~ 5800 2400
Wire Wire Line
	5800 2400 5600 2400
$Comp
L Device:C C2
U 1 1 5EA5B6E1
P 5900 2150
F 0 "C2" H 6015 2196 50  0000 L CNN
F 1 "0,1uf" H 6015 2105 50  0000 L CNN
F 2 "" H 5938 2000 50  0001 C CNN
F 3 "~" H 5900 2150 50  0001 C CNN
	1    5900 2150
	1    0    0    -1  
$EndComp
Connection ~ 5900 2000
Wire Wire Line
	5900 2000 6600 2000
Wire Wire Line
	5900 2300 5900 2400
Connection ~ 5900 2400
Wire Wire Line
	5900 2400 5800 2400
$Comp
L Device:C C7
U 1 1 5EA72D7D
P 6350 1750
F 0 "C7" H 6465 1796 50  0000 L CNN
F 1 "10uF" H 6465 1705 50  0000 L CNN
F 2 "" H 6388 1600 50  0001 C CNN
F 3 "~" H 6350 1750 50  0001 C CNN
	1    6350 1750
	1    0    0    -1  
$EndComp
Connection ~ 6600 2000
Wire Wire Line
	5700 5200 6000 5200
Wire Wire Line
	6200 4600 5650 4600
$Comp
L Device:R R3
U 1 1 5EAA7193
P 6000 4800
F 0 "R3" H 6070 4846 50  0000 L CNN
F 1 "500" H 6070 4755 50  0000 L CNN
F 2 "" V 5930 4800 50  0001 C CNN
F 3 "~" H 6000 4800 50  0001 C CNN
	1    6000 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4950 6000 4900
Wire Wire Line
	6000 4650 6000 3800
Wire Wire Line
	6100 1550 6100 1600
Wire Wire Line
	6100 1600 6350 1600
Connection ~ 6600 1600
Connection ~ 6600 950 
Wire Wire Line
	6600 1600 6600 2000
Connection ~ 6350 1600
Wire Wire Line
	6350 1600 6600 1600
Wire Wire Line
	4800 4800 5250 4800
Wire Wire Line
	6350 1900 6350 1950
Wire Wire Line
	6350 1950 6250 1950
Wire Wire Line
	6250 1950 6250 2400
Connection ~ 6250 2400
Wire Wire Line
	6250 2400 6100 2400
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5EB13762
P 6700 4100
F 0 "A1" H 6700 3011 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 6700 2920 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 6700 4100 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 6700 4100 50  0001 C CNN
	1    6700 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3100 6600 2700
Wire Wire Line
	3450 3150 5150 3150
Wire Wire Line
	5150 3150 5150 2900
Wire Wire Line
	5150 2900 7500 2900
Wire Wire Line
	7500 2900 7500 4700
Wire Wire Line
	7500 4700 7200 4700
Connection ~ 3450 3150
Wire Wire Line
	6700 5100 6700 5200
Connection ~ 6700 5200
Wire Wire Line
	7200 4300 8750 4300
Wire Wire Line
	6700 5200 8050 5200
Wire Wire Line
	8050 4250 8050 5200
Connection ~ 8050 5200
Wire Wire Line
	8050 5200 8500 5200
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
Wire Wire Line
	9400 4500 7700 4500
Wire Wire Line
	7700 4500 7700 4400
Wire Wire Line
	7700 4400 7200 4400
Wire Wire Line
	7200 4600 9900 4600
Wire Wire Line
	10050 4600 10050 4700
Wire Wire Line
	7600 4700 7600 4500
Wire Wire Line
	7600 4500 7200 4500
Wire Wire Line
	7600 4700 10050 4700
Connection ~ 6000 5200
Wire Wire Line
	6000 5200 6700 5200
Wire Wire Line
	6000 3800 6200 3800
Wire Wire Line
	1600 3000 1600 3200
Wire Wire Line
	1750 5000 1750 3600
Wire Wire Line
	1750 3600 1600 3600
Connection ~ 1600 3600
$EndSCHEMATC
