// Include Libraries
#include "Arduino.h"
#include "Buzzer.h"
#include "LiquidCrystal_PCF8574.h"
#include "Potentiometer.h"
#include "Button.h"
#include <Servo.h>
// Pin Definitions
#define BUZZER_PIN_SIG  4

#define LEDRGB_PIN_DIN  3

#define ACCEPT_BUTTON 12

#define SERVO_1_SIG 9 
#define SERVO_2_SIG 10

#define BPM_POT_SIG A0
#define Tidal_POT_SIG A1
#define I_E_POT_SIG A2
#define Threshold_POT_SIG A3
#define Angle_POT_SIG A4



#define TEMPERATURE_SENSOR A5

#define PRESSURE_SENSOR A6

// servo motor variable 
#define DEG_0 544
#define DEG_180 2400

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


// variable for interrupt? 
const byte ledPin = 6;
const byte interruptPin = 3;
volatile byte state = LOW;
//


Servo Servo1;  // create servo object to control a servo
Servo Servo2;  // create servo object to control a servo

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin

enum state{
  INHALE,
  PLATEAU,
  EXHALE
};

enum state current_state ;


void blink() {
  state = !state;
  // ccall buzzer too? 
}

//read button state.
bool Button_read( int m_pin)
{
  return digitalRead(m_pin);

}

/*
 * not recommanded ( yet)but can be use to automatically
 * get the BPM by getting the time delay between a
 * low temperature ( breath in) and the high temperature
 * ( breathe out)
 */
float Temp_Sensor(){
  static float temp_val  ;
   temp_val = analogRead(TEMPERATURE_SENSOR) * 5 / 1024.0 * 100 -50 ;
  // ADCval * AREF / 1024.0 * 100 - 50

  return temp_val ;
}


/*
 * Nominal Transfer Value: VOUT = VS x (0.009 x P - 0.095)
   ± (Pressure Error x Temp. Factor x 0.009 x VS)
   VS = 5.0 ± 0.25 Vdc
 */

float Pressure_Sensor(){
  static float temp_pressure ;
 // VOUT = VS x (0.009 x P - 0.095)
 // from the datashee range is from 0 kPa to 12kPa
 temp_pressure =map( analogRead(PRESSURE_SENSOR),0,1023,0,120);  // value in kPa
 
  return temp_pressure;
}


int readPotentiometer() {

   BPM_POT_value=  BPM_POT.getValue();
   BPM_POT_value= map(BPM_POT_value,0,1023,0,60) ; // from 10 bit adc range to 0:60 BPM
   
   Tidal_POT_value = Tidal_POT.getValue();
   Tidal_POT_value = map( Tidal_POT_value,0,1023,0,100); // tidla value form 0% to 100%
    
   I_E_POT_value = I_E_POT.getValue();
   I_E_POT_value = map(I_E_POT_value,0,1023,2,4); // I_E ratio from 1/2 to 1/4
   
   Threshold_POT_value = Threshold_POT.getValue();
   Angle_POT_value =  Angle_POT.getValue();


   return 0 ;
  
}
/*
 * blink led
 */
void BLINK_LED(void){

  digitalWrite(LEDRGB_PIN_DIN, HIGH);
  delay(1000);   
  digitalWrite(LEDRGB_PIN_DIN, HIGH);
  delay(1000);
}

/*
 * ring buzzer for a sec at the moment
 */
void BUZZER (void){
  
  tone(BUZZER_PIN_SIG, 1000); // Send 1KHz sound signal...
  delay(1000);        // ...for 1 sec
  noTone(BUZZER_PIN_SIG);     // Stop sound...
  delay(1000);        // ...for 1sec
}

void setup() {
  // put your setup code here, to run once:
//  pinMode(Maintenance, INPUT_PULLUP);
  pinMode(BUZZER_PIN_SIG, OUTPUT);   // Set buzzer - pin 4 as an output
  pinMode(LEDRGB_PIN_DIN,OUTPUT); // set led -pin 12 as an output
  
  Servo1.attach(SERVO_1_SIG,DEG_0,DEG_180);  // attaches the servo on pin 9 to the servo object degree from 0 to 180
  Servo1.writeMicroseconds(1500);  // set servo to mid-point
  Servo2.attach(SERVO_2_SIG,DEG_0,DEG_180);  // attaches the servo on pin 10 to the servo object degree from 0 to 180
  Servo2.writeMicroseconds(1500);  // set servo to mid-point
// interrupt for pressure sensor 
  pinMode(interruptPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), blink, FALLING ); // interupt for pressure sensor 

}



void loop() {
 
 unsigned long time_T;
 int ret; 
//if (MANUAL_MODE == TRUE ) {
//// read potentiometers and update values
 ret =readPotentiometer();
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
 time_T = millis();
 current_state = INHALE;
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
