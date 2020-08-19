EESchema Schematic File Version 4
EELAYER 26 0
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
L jicad:ILI9341-LCD U1
U 1 1 5E607651
P 4500 2700
F 0 "U1" H 4431 2865 50  0000 C CNN
F 1 "ILI9341-LCD" H 4431 2774 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x09_P2.54mm_Vertical" H 4400 2750 50  0001 C CNN
F 3 "" H 4400 2750 50  0001 C CNN
	1    4500 2700
	1    0    0    -1  
$EndComp
$Comp
L jicad:ILI9341-SD U3
U 1 1 5E607723
P 4600 5100
F 0 "U3" H 4431 5265 50  0000 C CNN
F 1 "ILI9341-SD" H 4431 5174 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4600 5100 50  0001 C CNN
F 3 "" H 4600 5100 50  0001 C CNN
	1    4600 5100
	1    0    0    -1  
$EndComp
$Comp
L jicad:ILI9341-TS U2
U 1 1 5E6077AC
P 4600 4400
F 0 "U2" H 4431 4865 50  0000 C CNN
F 1 "ILI9341-TS" H 4431 4774 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 4600 4400 50  0001 C CNN
F 3 "" H 4600 4400 50  0001 C CNN
	1    4600 4400
	1    0    0    -1  
$EndComp
$Comp
L jicad:RPi-Connector J1
U 1 1 5E6078DC
P 6100 950
F 0 "J1" V 7383 2000 50  0000 C CNN
F 1 "RPi-Connector" V 7474 2000 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 10550 2950 50  0001 C CNN
F 3 "" H 10550 2950 50  0001 C CNN
	1    6100 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 3400 5950 3400
Text Label 5950 3400 0    50   ~ 0
MOSI
Wire Wire Line
	6350 3500 5950 3500
Text Label 5950 3500 0    50   ~ 0
MISO
Wire Wire Line
	6350 3600 5950 3600
Text Label 5950 3600 0    50   ~ 0
SCLK
Wire Wire Line
	7950 3600 8350 3600
Text Label 8350 3600 2    50   ~ 0
~CE0
Wire Wire Line
	7950 3300 8350 3300
Text Label 8350 3300 2    50   ~ 0
RST
Wire Wire Line
	7950 3200 8350 3200
Text Label 8350 3200 2    50   ~ 0
D~C
Wire Wire Line
	6350 3200 5950 3200
Text Label 5950 3200 0    50   ~ 0
IRQ
Wire Wire Line
	6350 3100 5950 3100
Text Label 5950 3100 0    50   ~ 0
~TSCS
Wire Wire Line
	6350 3000 5950 3000
Text Label 5950 3000 0    50   ~ 0
~SDCS
Wire Wire Line
	4600 5400 5000 5400
Text Label 5000 5400 2    50   ~ 0
MISO
Wire Wire Line
	4600 3000 5000 3000
Text Label 5000 3000 2    50   ~ 0
~CE0
Wire Wire Line
	4600 3100 5000 3100
Text Label 5000 3100 2    50   ~ 0
RST
Wire Wire Line
	4600 3200 5000 3200
Text Label 5000 3200 2    50   ~ 0
D~C
Wire Wire Line
	4600 3300 5000 3300
Text Label 5000 3300 2    50   ~ 0
MOSI
Wire Wire Line
	4600 4400 5000 4400
Text Label 5000 4400 2    50   ~ 0
MOSI
Wire Wire Line
	4600 5300 5000 5300
Text Label 5000 5300 2    50   ~ 0
MOSI
Wire Wire Line
	4600 4500 5000 4500
Text Label 5000 4500 2    50   ~ 0
MISO
Wire Wire Line
	4600 4600 5000 4600
Text Label 5000 4600 2    50   ~ 0
IRQ
Wire Wire Line
	4600 4300 5000 4300
Text Label 5000 4300 2    50   ~ 0
~TSCS
Wire Wire Line
	4600 5200 5000 5200
Text Label 5000 5200 2    50   ~ 0
~SDCS
Wire Wire Line
	4600 5500 5000 5500
Text Label 5000 5500 2    50   ~ 0
SCLK
Wire Wire Line
	4600 4200 5000 4200
Text Label 5000 4200 2    50   ~ 0
SCLK
Wire Wire Line
	4600 3400 5000 3400
Text Label 5000 3400 2    50   ~ 0
SCLK
Wire Wire Line
	6350 2900 6250 2900
Wire Wire Line
	6250 2900 6250 3700
Wire Wire Line
	6250 3700 6350 3700
Wire Wire Line
	6250 3700 6250 4400
Wire Wire Line
	6250 4400 6350 4400
Connection ~ 6250 3700
Wire Wire Line
	6250 4400 6250 4900
Wire Wire Line
	6250 4900 8050 4900
Wire Wire Line
	8050 4900 8050 4100
Wire Wire Line
	8050 4100 7950 4100
Connection ~ 6250 4400
Wire Wire Line
	8050 4100 8050 3900
Wire Wire Line
	8050 3900 7950 3900
Connection ~ 8050 4100
Wire Wire Line
	8050 3900 8050 3400
Wire Wire Line
	8050 3400 7950 3400
Connection ~ 8050 3900
Wire Wire Line
	8050 3400 8050 3100
Wire Wire Line
	8050 3100 7950 3100
Connection ~ 8050 3400
Wire Wire Line
	8050 3100 8050 2700
Wire Wire Line
	8050 2700 7950 2700
Connection ~ 8050 3100
Wire Wire Line
	4600 2900 5600 2900
Wire Wire Line
	5600 2900 5600 4900
Wire Wire Line
	5600 4900 6250 4900
Connection ~ 6250 4900
Wire Wire Line
	6250 4900 6250 5050
$Comp
L power:GND #PWR01
U 1 1 5E612255
P 6250 5050
F 0 "#PWR01" H 6250 4800 50  0001 C CNN
F 1 "GND" H 6255 4877 50  0000 C CNN
F 2 "" H 6250 5050 50  0001 C CNN
F 3 "" H 6250 5050 50  0001 C CNN
	1    6250 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2600 8050 2500
Wire Wire Line
	8050 2500 7950 2500
Wire Wire Line
	7950 2600 8050 2600
Wire Wire Line
	8050 2500 8050 1850
Wire Wire Line
	8050 1850 5600 1850
Wire Wire Line
	5600 1850 5600 2800
Wire Wire Line
	5600 2800 5350 2800
Connection ~ 8050 2500
NoConn ~ 4600 3600
Wire Wire Line
	4600 3500 5350 3500
Wire Wire Line
	5350 3500 5350 2800
Connection ~ 5350 2800
Wire Wire Line
	5350 2800 4600 2800
$EndSCHEMATC
