// code to test the Russian peasant multiplication
// Implemented by Jose Gama, June 2015
#include <Arduino.h>
#include "rmulfun.h"

#define maxlenarray 50

void setup()
 {
 Serial.begin(9600);
 Serial.println("Start");
 }

void loop()
 {
 uint16_t a, b;
 uint8_t i, j;

 for (i=0;i<255;i++) 
 {
 for (j=0;j<255;j++){

   b = i * j;
   a = rmut8u(i, j);

  if (a != b)
  {
   Serial.print(i);Serial.print(" * ");Serial.print(j);Serial.print(" = ");
   Serial.print(a);Serial.print("   ");Serial.println(b);
  }
 }}
 Serial.println("Done");
 
 
 }
