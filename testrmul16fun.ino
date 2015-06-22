// code to test the Russian peasant multiplication
// Implemented by Jose Gama, June 2015
#include <Arduino.h>
#include "rmulfun.h"

void setup()
 {
 Serial.begin(9600);
 Serial.println("Start");
 }

void loop()
 {
 uint32_t a, b;
 uint16_t i, j;

 for (i=1110;i<65535;i++) 
 {
 for (j=1110;j<65535;j++){
 // The Arduino compiler returns a 16 bit value for 16x16 unsigned bit multiplication  
   a = rmul16u(i, j);
b = i * j;
  if (a != b)
  {
   Serial.print(i);Serial.print(" * ");Serial.print(j);Serial.print(" = ");
   Serial.print(a);Serial.print("   ");Serial.println(b);
  }

 }}
 Serial.println("Done");
 
 
 }
