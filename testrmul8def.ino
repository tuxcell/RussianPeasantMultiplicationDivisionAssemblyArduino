// code to test the Russian peasant multiplication
// Implemented by Jose Gama, June 2015
#include <Arduino.h>
#include "rmultdef.h"

void setup()
 {
 Serial.begin(9600);
 Serial.println("Start");
 }

void loop()
 {
 uint16_t a, b,c=0;
 uint8_t i, j;

 for (i=0;i<255;i++) 
 {
 for (j=0;j<255;j++){

   b = i * j;
   rmult8u(a, (i), (j));
c++;
  if (a != b)
  {
   Serial.print(i);Serial.print(" * ");Serial.print(j);Serial.print(" = ");
   Serial.print(a);Serial.print("   ");Serial.print(b);Serial.print("  c= ");Serial.println(c);
  }
 }}
 Serial.println("Done");
 delay(10000);
 }
