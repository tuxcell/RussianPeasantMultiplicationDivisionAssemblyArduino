# RussianPeasantMultiplicationDivisionAssemblyArduino
Russian peasant multiplication and division (fixed-point) in Assembly language for the AVR/Arduino

Jose Gama June, 2015

The Russian peasant multiplication consists of multiplying the multiplier by two, while dividing the multiplicand by two, until the multiplicand is less than or equal one. If the multiplicand is odd then it is added to the multiplier.
The Assembly code was tested in VMLAB, the free AVR simulator from Atmel(r). Note that register R1 has to be initialized in this simulator.
An inline version of the Russian peasant multiplication and division code is available in github.

The Russian peasant division consists of multiplying the quotient by two, while dividing the divisor by two, if the dividend is greater than the divisor then subtract the divisor from the dividend. 
The remainder is the value of the dividend on the last subtraction.


