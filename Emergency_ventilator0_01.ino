// Include Libraries
#include "Arduino.h"
#include "Buzzer.h"
#include "LiquidCrystal_PCF8574.h"
#include "Potentiometer.h"
#include "Button.h"
#include <Servo.h>
// Pin Definitions
#define BUZZER_PIN_SIG  4

#define LEDRGB_PIN_DIN  12

#define BPM_POT_SIG A0
#define Tidal_POT_SIG A1
#define I_E_POT_SIG A2
#define Threshold_POT_SIG A3
#define Angle_POT_SIG A4
#define SURFACETRANSDUCER_PIN_POS 13
#define TOGGLESWITCH_PIN_2  9

// potentiometer variable 

int BPM_POT_value = 0;  // variable to store the value coming from the potentiometer BPM_POT 
int Tidal_POT_value = 0;  // variable to store the value coming from the potentiometer Tidal_POT
int I_E_POT_value = 0;  // variable to store the value coming from the potentiometer I_E_POT
int Threshold_POT_value = 0;  // variable to store the value coming from the potentiometer Threshold_POT
int Angle_POT_value = 0;  // variable to store the value coming from the potentiometer Angle_POT


// object initialization

Potentiometer BPM_POT = Potentiometer(BPM_POT_SIG); //a Potentiometer at analog in 
Potentiometer Tidal_POT = Potentiometer(Tidal_POT_SIG); //a Potentiometer at analog in 
Potentiometer I_E_POT = Potentiometer(I_E_POT_SIG); //a Potentiometer at analog in 
Potentiometer Threshold_POT = Potentiometer(Threshold_POT_SIG); //a Potentiometer at analog in 
Potentiometer Angle_POT = Potentiometer(Angle_POT_SIG); //a Potentiometer at analog in 


// define vars for testing menu
const int timeout = 10000;       //define timeout of 10 sec
char menuOption = 0;
long time0;
Servo Servo1;  // create servo object to control a servo
Servo Servo2;  // create servo object to control a servo

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin


//read button state.
bool Button_read( int m_pin)
{
  return digitalRead(m_pin);

}


void setup() {
  // put your setup code here, to run once:
 BPM_POT_value=   BPM_POT.getValue();
   Servo1.attach(9);  // attaches the servo on pin 9 to the servo object
  Servo2.attach(10);  // attaches the servo on pin 9 to the servo object
//  myservo.write(val);  

}

void loop() {
 
//if (MANUAL_MODE == TRUE ) {
//// read potentiometers and update values
//readPotentiometer_value();
//
//// read pressure sensor in a regular interval
//
//// 
// read_pressure_Sensors();
//}
//
//// 
//// start cycle breath cycle 
//
//// breath
//if ((breath == TRUE )  {
//     current_angle == pot_angle ;
//  if (angle != TRUE) {
//        digitalWrite(Buzzer, HIGH);       
//   }
//     else {
//            digitalWrite(Buzzer, LOW);
//           }
//   Mode servo 1 and 2 in the specify angle 
//}
//
//   exhale process
//
//// delay(200);
//  read temeprature sensor to get the breath time from nose 
// breathe in low temp  ,exchale : high temp , 
// get timing aftr few second transpose in a minute

}
