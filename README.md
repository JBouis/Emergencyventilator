# Emergencyventilator

Almost every bed in a hospital has a manual resuscitator (Ambu-Bag) nearby,
available in the event of a rapid response or code where healthcare workers maintain 
oxygenation by squeezing the bag. Automating this appears to be the simplest strategy
that satisfies the need for low-cost mechanical ventilation, with the ability to be
rapidly manufactured in large quantities. 

Here a schematic and a firmware that I started to do one Arduino Nano : 
it needs to be reviewed and tested.

more info on :
https://e-vent.mit.edu/

MCU :Arduino Nano
http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf

Voltage Regulator:
https://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf

Temperature sensor ( TMP35):
https://www.analog.com/media/en/technical-documentation/data-sheets/TMP35_36_37.pdf

Pressure sensor ( MPXA6115A):
http://www.nxp.com/files/sensors/doc/data_sheet/MPXA6115A.pdf

LCD display (LCD-016N002L1):
http://www.vishay.com/docs/37299/37299.pdf

5 *  10K OHM Potentiometer

3 resistor ( 2*500ohm , 51kohm)

8 capacitor ( 5 * 0,1pf , 1 * 10uf , 1 * 100nf , 1 * 47uf)

2 servo motor( ind the one with required specification)
