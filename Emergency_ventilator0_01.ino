/*
 * No copyright
 * Just use it
 * Jonathan Bouis
 * 
 * Note : This code is a "template" only
 * This is on a fully fonctionning code 
 * hoping peoples can use some part of the code 
 * to create their own fonctionning Emergency ventilator
 */
// Include Libraries
#include "Arduino.h"
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

unsigned long startTime;  //
unsigned long currentTime;

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
bool Button_read( )
{
  return digitalRead(ACCEPT_BUTTON);

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
    20 cmH20 = 1961.3300000000002 pascal  
 */

float Pressure_Sensor(){
  static float temp_pressure ;
 // VOUT = VS x (0.009 x P - 0.095)
 // from the datashee range is from 0 kPa to 12kPa
 temp_pressure =map( analogRead(PRESSURE_SENSOR),0,1023,0,120);  // value in kPa
 
  return temp_pressure;
}

int readPotentiometer() {
   static int temp_BPM_POT_value;
   static int temp_Tidal_POT_value;
   static int temp_I_E_POT_value;
   static int temp_Threshold_POT_value;
   static int temp_Angle_POT_value;
// TO DO 
// use temp  values intead , use has to press button to validate the change
// value to the global data for safety mesure 
// need to add the value change on LCD to

   temp_BPM_POT_value= map( analogRead(BPM_POT_SIG),0,1023,0,60) ; // from 10 bit adc range to 0:60 BPM
   

   temp_Tidal_POT_value = map(  analogRead(Tidal_POT_SIG),0,1023,0,100); // tidla value form 0% to 100%
    

   temp_I_E_POT_value = map( analogRead(I_E_POT_SIG),0,1023,2,4); // I_E ratio from 1/2 to 1/4
   

   temp_Threshold_POT_value = map(  analogRead(Threshold_POT_SIG),0,1023,0,100); // plateau thresold value
   
  
   temp_Angle_POT_value = map(  analogRead(Angle_POT_SIG),0,1023,0,180); // angle of servo desired.

   if (Button_read()!= 1)
   {
     BPM_POT_value = temp_BPM_POT_value;
     Tidal_POT_value = temp_Tidal_POT_value;
     I_E_POT_value = temp_I_E_POT_value ;
     Threshold_POT_value = temp_Threshold_POT_value;
     Angle_POT_value = temp_Angle_POT_value;
     
     
   }
  


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
  Servo1.write(DEG_0);  // set servo to starting point
  Servo2.attach(SERVO_2_SIG,DEG_0,DEG_180);  // attaches the servo on pin 10 to the servo object degree from 0 to 180
  Servo2.write(DEG_0);  // set servo to starting point
// interrupt for pressure sensor 
  pinMode(interruptPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), blink, FALLING ); // interupt for pressure sensor 
  startTime = millis();
}


// TO DO timer process doesn't work at all at the moment , 
// just a concepct to get the idea
void loop() {
 float PERIOD_T ;
 unsigned long cycle_breathe_threshold;
 unsigned long time_T;
 int ret; 
 int current_pos_servo_1 = Servo1.read();
 int current_pos_servo_2 = Servo2.read();
 
//if (MANUAL_MODE == TRUE ) {
 if ( (current_pos_servo_1 != DEG_0) || (current_pos_servo_2 !=DEG_0))
 {
   while(Button_read()!=1)
    {
      BUZZER();
      BLINK_LED();
    }
 }
 else
 {
  current_state = INHALE;
 }   
 time_T = millis();
 
//// breath
 if ( current_state == INHALE)
 {
   PERIOD_T = 60000 / BPM_POT_value ;
   cycle_breathe_threshold = PERIOD_T / ( 1 +I_E_POT_value)  ; // 60 sec divided by BPM and ratio
   unsigned long cycle_breathe = 0.0 ;
   Servo1.write(Angle_POT_value); 
   Servo2.write(Angle_POT_value); 

   do{
       // read pressudre 
       // read pot
       ret = readPotentiometer();
       ret = Pressure_Sensor();
       cycle_breathe = millis();
   } while ( ((cycle_breathe - time_T) <= (cycle_breathe_threshold))|| (ret >=2) ); // 2 is for max pressure sensor 

   current_state = PLATEAU;
 }
 else
 {  
 
    while(Button_read()!=1)
    {
      BUZZER();
      BLINK_LED();
    }
 }
// plateau state
 if ( current_state == PLATEAU)
 {
     unsigned long cycle_plateau_threshold  = 150;
     unsigned long cycle_plateau = 0.0;
     do
     {
       ret =readPotentiometer();
       cycle_plateau = millis();
  
       current_pos_servo_1 = Servo1.read();
       current_pos_servo_2 = Servo2.read();

       if ( (current_pos_servo_1 != Angle_POT_value) || (current_pos_servo_2 !=Angle_POT_value))
       {
         while(Button_read()!=1)
          {
            BUZZER();
            BLINK_LED();
          }
       }        
     } while ( cycle_plateau <= cycle_plateau_threshold);

     current_state = EXHALE;
 }
  else
 {  
 
    while(Button_read()!=1)
    {
      BUZZER();
      BLINK_LED();
    }
 }
// exhale state
 if ( current_state==EXHALE)
 {
   unsigned long cycle_exhale_threshold = PERIOD_T -  cycle_breathe_threshold  ; // 60 sec divided by BPM and ratio
   unsigned long cycle_exhale = 0.0 ;
   Servo1.write(DEG_0); 
   Servo2.write(DEG_0); 

   do{
       // read pressudre 
       // read pot
       ret =readPotentiometer();
       cycle_exhale = millis();
    } while ( cycle_exhale <= (time_T - cycle_exhale_threshold) );

   
 }
 else
 {  
 
    while(Button_read()!=1)
    {
      BUZZER();
      BLINK_LED();
    }
 }
 
 

//// delay(200);
//  read temeprature sensor to get the breath time from nose 
// breathe in low temp  ,exchale : high temp , 
// get timing aftr few second transpose in a minute

}
