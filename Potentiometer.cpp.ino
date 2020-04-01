#include "Potentiometer.h"

//Potentiometer::Potentiometer(int pin) : AnalogReader(pin) {}


Potentiometer::Potentiometer(byte potPin){
  pin=potPin;
//  setSectors(6);
}

//Potentiometer::Potentiometer(byte potPin, uint16_t sectors){
//  pin=potPin;
//  setSectors(sectors);
//}

uint16_t Potentiometer::getValue(){
  return analogRead(pin);
}

uint16_t Potentiometer::getSector(){
  return analogRead(pin)/(1024/sectors);
}
/*
 *  exponential moving average algorithm
 *  
 */
uint16_t Potentiometer::FilterValue( int sensorValue){
    float EMA_a = 0.6;      //initialization of EMA alpha
    int EMA_S = 0;          //initialization of EMA S
     
    return (EMA_a*sensorValue) + ((1-EMA_a)*EMA_S);    //run the EMA
}

//void Potentiometer::setSectors(uint16_t newSectors){
//  if (newSectors<1024 && newSectors>0){
//    sectors=newSectors;
//  }else if (newSectors<0){
//    sectors=0;
//  }else{
//    sectors=1023;
//  }
//}
