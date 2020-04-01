/** \addtogroup Potentiometer
 *  @{
 */
 
#ifndef POTENTIOMETER_H
#define POTENTIOMETER_H

//#include "AnalogReader.h"

class Potentiometer {
  public:
    Potentiometer(byte potPin);
//    Potentiometer(byte potPin, uint16_t sectors);
    uint16_t getValue();
    uint16_t getSector();
    uint16_t FilterValue( int pin);
  //  void setSectors(uint16_t sectors);
  private:
    byte pin;
    uint16_t sectors;
};
#endif
