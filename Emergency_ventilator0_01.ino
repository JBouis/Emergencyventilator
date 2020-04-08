/*
 * No copyright
 * Just use it
 * Jonathan Bouis
 * 
 * Note : This code is a "template" only
 * This is not a fully fonctionning code 
 * hoping peoples can use some part of the code 
 * to create their own fonctionning Emergency ventilator
 *  Breathing cycle phase 
 *   - Setup
 *   Cycle :
     - Inhale phase
     - Plateau phase
     - Exhale phase
 *    
 *   more info on : https://e-vent.mit.edu/
 */
// Include Libraries
#include "Arduino.h"
#include <LiquidCrystal.h>
#include <avr/wdt.h>
#include <Servo.h>


// # define watchdog       // DO not enable while debuging

#ifdef  watchdog
#define watchdogProtect          // This prevents the watchdog from being fired before watchdogDelay  
                                 // To allow an new software to be uploaded     
#define watchdogDelay      1000  // Maximum time before the watchdog times out and resets 
#define watchdogStartDelay 8000  // Delay before the watchdog becomes active (used to have the time
                                 // to reload the program if it hangs the controller. Only for development.
#endif


// Pin Definitions
#define BUZZER_AND_LED_ALARM_PIN_SIG  4

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
#define DEG_0  0 //  or 544ms  depends of the servo motor you use
#define DEG_180 180 // 2400ms  

#define Pressure_Max 20  // 2kPa
#define Period_plateau 150  // 0,15sec
// potentiometer variable 


struct Potentiometer 
{
int BPM_POT;   // variable to store the value coming from the potentiometer BPM_POT 
int Tidal_POT ;   // variable to store the value coming from the potentiometer Tidal_POT
int I_E_POT ;   // variable to store the value coming from the potentiometer I_E_POT
int Threshold_POT ;   // variable to store the value coming from the potentiometer Threshold_POT
int Angle_POT ;  // variable to store the value coming from the potentiometer Angle_POT
};

struct Potentiometer  potentiometer ;
struct Potentiometer  saved ;
// saved variable if we are not in the specific phase

bool saving_flag = false ;

unsigned long startTime;  //
unsigned long currentTime;
unsigned long previous_Alarm_Millis;

// Setting Buzzer mode to False
boolean buzzer_mode = false;
boolean setup_done = false;
// For LED
int ledState = LOW;
long alarm_interval = 500;  // Interval at which LED blinks

// variable for interrupt? 
const byte ledPin = 6;
const byte interruptPin = 3;
volatile byte state = LOW;
//
#ifdef  watchdog
bool watchdog_start
#endif
//******************************************
// variable for auto or manual mode
// Variables will change:
long previousMillis = 0;        // will store pressed timing
long interval = 3000;           // interval for on time (milliseconds)
int currState;
int prevState = HIGH; // Assumes LOW means pressed
//*******************************************

Servo Servo1;  // create servo object to control a servo
Servo Servo2;  // create servo object to control a servo

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin

enum state{
  WAITING,  // during setup or at the end of the exhale process or if in sleep mode ( to do : !)
  INHALE,   // during inhale phase of the breathing cycle
  PLATEAU,  // during plateau phase of the breathing cycle
  EXHALE,   // during exhale phase of the breathing cycle 
  ERR,      // error during the process
};

 enum ErrorIdTypeDef{
  FW_OK,
  FW_ERROR,
  FM_BUSY, // if timing too long
};
/*
 * 
// Getter
ErrorIdTypeDef GetErrorCode(void)
{
  return ErrorCode;
}

// Setter
void SetErrorCode(ErrorIdTypeDef code)
{
  ErrorCode = code;
}
 */

enum ErrorIdTypeDef ErrorCode;

enum state current_state ;

LiquidCrystal lcd(13, 11, 10, 9, 8, 7); // Creates an LC object. Parameters: (rs, enable, d4, d5, d6, d7) 



void (* resetFunction)(void) = 0;  // Self reset (to be used with watchdog)

void blink() {
  state = !state;
  // ccall BUZZER_AND_LED_ALARM too? 
}

//read button state.
bool Button_read( )
{
  return digitalRead(ACCEPT_BUTTON);

}

/*
 * To do  
 *  MANUAL OR AUTO MODE
 */

 int Move_servos(enum state current_state )
 {
    if ( current_state == INHALE)
    {
       Servo1.write(potentiometer.Angle_POT ); 
       Servo2.write(potentiometer.Angle_POT ); 
    }
    else
    {
      Servo1.write(DEG_0); 
      Servo2.write(DEG_0); 
    }
 }

bool Get_mode(){
   
   bool mode = false;
   currState = digitalRead(ACCEPT_BUTTON);
   if(currState == HIGH)
   {
     return false;
   }
   
   prevState = currState;
   
   unsigned long currentMillis = millis();

   if(currentMillis - previousMillis > alarm_interval) {
    previousMillis = currentMillis;
    mode = true;
   }
  
   return mode;
}


/*
 * not recommanded ( yet)but can be use to automatically
 * get the BPM by getting the time delay between a
 * low temperature ( breath in) and the high temperature
 * ( breathe out)
 * temp = ADCval * AREF / 1024.0 * 100 - 50
 * here AREF is 5V
 */
int Temp_Sensor(){
  
   return (analogRead(TEMPERATURE_SENSOR) * 5 / 1024.0 * 100 -50) ;
}


/*
 * Nominal Transfer Value: VOUT = VS x (0.009 x P - 0.095)
   ± (Pressure Error x Temp. Factor x 0.009 x VS)
   VS = 5.0 ± 0.25 Vdc
    20 cmH20 = 1961.3300000000002 pascal  
    from the datasheet range is from 0 kPa to 12kPa
 */

int Pressure_Sensor(){
  
  return (map( analogRead(PRESSURE_SENSOR),0,1023,0,120));
}

int readPotentiometer() {
  
   static int temp_BPM_POT ;
   static int temp_Tidal_POT ;
   static int temp_I_E_POT ;
   static int temp_Threshold_POT ;
   static int temp_Angle_POT ;
   
   temp_BPM_POT = map( analogRead(BPM_POT_SIG),0,1023,0,60) ; // from 10 bit adc range to 0:60 BPM
  
   temp_Tidal_POT  = map(  analogRead(Tidal_POT_SIG),0,1023,0,100); // tidla value form 0% to 100%
    
   temp_I_E_POT  = map( analogRead(I_E_POT_SIG),0,1023,2,4); // I_E ratio from 1/2 to 1/4
   
   temp_Threshold_POT  = map(  analogRead(Threshold_POT_SIG),0,1023,0,100); // plateau thresold value
     
   temp_Angle_POT  = map(  analogRead(Angle_POT_SIG),0,1023,0,180); // angle of servo desired.

   if (Button_read()!= true)
   {
     if( (current_state ==INHALE)|| (current_state== WAITING)){
       potentiometer .BPM_POT  = temp_BPM_POT ;
       potentiometer .Tidal_POT  = temp_Tidal_POT ;
       potentiometer .I_E_POT  = temp_I_E_POT  ;
     }
     else{
        saved .BPM_POT  = temp_BPM_POT ;
        saved .Tidal_POT  = temp_Tidal_POT ;
        saved .I_E_POT  = temp_I_E_POT  ;
        saving_flag = true ;
      
      }  
     
     potentiometer .Threshold_POT  = temp_Threshold_POT ;
     potentiometer .Angle_POT  = temp_Angle_POT ;
          
   }
  
   return 0 ;
  
}

void Saved_Pot(){
  
    potentiometer .BPM_POT  = saved .BPM_POT ;
    potentiometer .Tidal_POT  = saved .Tidal_POT ;
    potentiometer .I_E_POT  = saved .I_E_POT  ;
    saving_flag = false; 
  
}



/*
 * ring BUZZER_AND_LED_ALARM 
 */
 
void BUZZER_AND_LED_ALARM (void){


  // If alarm mode is on,blink our LED
  if (buzzer_mode){
   long current_Alarm_Millis = millis();
    if( current_Alarm_Millis  - previous_Alarm_Millis > interval) {
      previous_Alarm_Millis = current_Alarm_Millis;   
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;
    // Switch the LED
    digitalWrite(LEDRGB_PIN_DIN, LOW);
    }
    tone(BUZZER_AND_LED_ALARM_PIN_SIG, 1000); // Send 1KHz sound signal...
    if (Button_read()!= true)
   {
    buzzer_mode == false;
   }
  }

  // If alarm is off
  if (buzzer_mode == false) {
  
    // No tone & LED off
     noTone(BUZZER_AND_LED_ALARM_PIN_SIG);     // Stop sound...
     digitalWrite(LEDRGB_PIN_DIN, LOW);
  }



  while(Button_read()!= true){
  tone(BUZZER_AND_LED_ALARM_PIN_SIG, 1000); // Send 1KHz sound signal...
  digitalWrite(LEDRGB_PIN_DIN, HIGH);
  delay(1000);        // ...for 1 sec
  noTone(BUZZER_AND_LED_ALARM_PIN_SIG);     // Stop sound...
  digitalWrite(LEDRGB_PIN_DIN, LOW);
  delay(1000);        // ...for 1sec
  }
}


/*
 * add an interrupt system while BUZZER_AND_LED_ALARM and led are on
 */
//void handler()
//{
//  interrupted = true;
//}


void setup() {

  pinMode(BUZZER_AND_LED_ALARM_PIN_SIG, OUTPUT);   // Set BUZZER_AND_LED_ALARM - pin 4 as an output
  pinMode(LEDRGB_PIN_DIN,OUTPUT); // set led -pin 12 as an output
  
  pinMode(ACCEPT_BUTTON,INPUT);
  digitalWrite(ACCEPT_BUTTON, HIGH);
  
  Servo1.attach(SERVO_1_SIG,DEG_0,DEG_180);  // attaches the servo on pin 9 to the servo object degree from 0 to 180
  Servo1.write(DEG_0);  // set servo to starting point
  Servo2.attach(SERVO_2_SIG,DEG_0,DEG_180);  // attaches the servo on pin 10 to the servo object degree from 0 to 180
  Servo2.write(DEG_0);  // set servo to starting point

  Serial.begin(9600); // set serial monitor to this value
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("Ventilator on");

   potentiometer .BPM_POT  = 0;  // variable to store the value coming from the potentiometer BPM_POT 
   potentiometer .Tidal_POT  = 0;  // variable to store the value coming from the potentiometer Tidal_POT
   potentiometer .I_E_POT  = 0;  // variable to store the value coming from the potentiometer I_E_POT
   potentiometer .Threshold_POT  = 0;  // variable to store the value coming from the potentiometer Threshold_POT
   potentiometer .Angle_POT  = 0;  // variable to store the value coming from the potentiometer Angle_POT
  
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
 bool auto_mode = false ; // false means manual 
 
 //auto_mode =Get_mode(); // TO DO a more reliable get mode ( auto or manual)
 BUZZER_AND_LED_ALARM();
//if (MANUAL_MODE == TRUE ) {
 if ( (current_pos_servo_1 != DEG_0) || (current_pos_servo_2 !=DEG_0))
 {
      buzzer_mode = true;
 }
 else
 {
  current_state = INHALE;
 }   
 time_T = millis();
 
//// breath
 if ( current_state == INHALE)
 {
   PERIOD_T = 60000 / potentiometer .BPM_POT  ;
   cycle_breathe_threshold = PERIOD_T / ( 1 + potentiometer .I_E_POT  )  ; // 60 sec divided by BPM and ratio
   unsigned long cycle_breathe = 0.0 ;
   Move_servos(current_state);
 

   do{
       // read pressudre 
       // read pot
       BUZZER_AND_LED_ALARM();
       ret = readPotentiometer();
       ret = Pressure_Sensor();
       cycle_breathe = millis();
   } while ( ((cycle_breathe - time_T) <= (cycle_breathe_threshold))|| (ret >=Pressure_Max) ); // 2 is for max pressure sensor  max is 1.9kPA
   if (ret >=Pressure_Max)
    {
      current_state = ERR;
      Move_servos(current_state);
      buzzer_mode = true;
      current_state = INHALE;
    }
    else{
      current_state = PLATEAU;
    }  
 }
 else
 {    
      buzzer_mode = true;    
 }

 BUZZER_AND_LED_ALARM(); 
// plateau state
 if ( current_state == PLATEAU)
 {
     unsigned long cycle_plateau = 0.0;
     do
     {
       ret =readPotentiometer();
       ret = Pressure_Sensor();
       cycle_plateau = millis();
  
       current_pos_servo_1 = Servo1.read();
       current_pos_servo_2 = Servo2.read();

       if ( (current_pos_servo_1 != potentiometer .Angle_POT ) || (current_pos_servo_2 !=potentiometer .Angle_POT ))
       {
         while(Button_read()!=true)
          {
            buzzer_mode = true;
          }
       }        
     } while ( (cycle_plateau <= Period_plateau)||(ret >=Pressure_Max));
     if (ret >=Pressure_Max)
     {
       Move_servos(current_state);
       buzzer_mode = true;
       current_state = INHALE;
     }
     else{
       current_state = EXHALE;
     }
 }
  else
 {  
     buzzer_mode = true;
 }

BUZZER_AND_LED_ALARM(); 
// exhale state
 if ( current_state==EXHALE)
 {
   unsigned long cycle_exhale_threshold = PERIOD_T -  cycle_breathe_threshold  ; // 
   unsigned long cycle_exhale = 0.0 ;
   Move_servos(current_state);

   do{
       // read pressudre 
       // read pot
       ret =readPotentiometer();
       ret = Pressure_Sensor();
       cycle_exhale = millis();
    } while (( cycle_exhale <= (time_T - cycle_exhale_threshold) )||(ret >=Pressure_Max));
    if (ret >=Pressure_Max)
    {
      Move_servos(current_state);
      buzzer_mode = true;
    }
   
 }
 else
 {  
      buzzer_mode = true;
 }
 
 current_state= WAITING;
 BUZZER_AND_LED_ALARM();
 
 if ( saving_flag== true){
  Saved_Pot();
 }
      
}
