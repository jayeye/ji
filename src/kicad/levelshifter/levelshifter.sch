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
Text GLabel 2250 2300 0    50   Input ~ 0
TTL_IN
Text GLabel 1950 2700 0    50   Output ~ 0
TTL_OUT
Text GLabel 4300 2700 2    50   Input ~ 0
PMOS_IN
Text GLabel 4300 2250 2    50   Output ~ 0
PMOS_OUT
$Comp
L power:VSS #PWR?
U 1 1 5CFC6BCC
P 3100 3000
F 0 "#PWR?" H 3100 2850 50  0001 C CNN
F 1 "VSS" H 3117 3173 50  0000 C CNN
F 2 "" H 3100 3000 50  0001 C CNN
F 3 "" H 3100 3000 50  0001 C CNN
	1    3100 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CFC6C2D
P 3450 3050
F 0 "#PWR?" H 3450 2800 50  0001 C CNN
F 1 "GND" H 3455 2877 50  0000 C CNN
F 2 "" H 3450 3050 50  0001 C CNN
F 3 "" H 3450 3050 50  0001 C CNN
	1    3450 3050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5CFC6C8E
P 3850 3200
F 0 "#PWR?" H 3850 3050 50  0001 C CNN
F 1 "VCC" H 3867 3373 50  0000 C CNN
F 2 "" H 3850 3200 50  0001 C CNN
F 3 "" H 3850 3200 50  0001 C CNN
	1    3850 3200
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR?
U 1 1 5CFC6CEF
P 4150 3200
F 0 "#PWR?" H 4150 3050 50  0001 C CNN
F 1 "VDD" H 4167 3373 50  0000 C CNN
F 2 "" H 4150 3200 50  0001 C CNN
F 3 "" H 4150 3200 50  0001 C CNN
	1    4150 3200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
