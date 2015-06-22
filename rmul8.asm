; Russian peasant multiplication
; Implemented by Jose Gama, June 2015
.org 0
.def       resultH = r16
.def       resultL = r17
.def       multiplicandL = r18
.def       multiplierL = r19
.def       multiplierH = r0
   ldi multiplicandL, 0xff
   ldi multiplierL, 0x1
   clr r1

	clr resultH
	clr resultL
	cp multiplicandL, r1 ; if multiplicand==0 or
	breq ENDMULT ; then return 0	
	cp multiplierL, r1 ; if multiplier==0
	breq ENDMULT ; then return 0
	clr multiplierH	
	bst multiplicandL, 0
	brtc SPLITLOOP ; if the multiplicand is odd then add the multiplier
	add resultL, multiplierL
	adc resultH, multiplierH	
SPLITLOOP:
	lsl multiplierL  ; multiplier=multiplier*2
	rol multiplierH
	lsr multiplicandL ; multiplicand=multiplicand/2
	bst multiplicandL, 0
	brtc NOADD ; if the multiplicand is odd then add the multiplier
	add resultL, multiplierL
	adc resultH, multiplierH
NOADD:	
	cpi multiplicandL, 2
	brlo ENDMULT ;  stop when multiplicand <= 1
	rjmp SPLITLOOP
ENDMULT:
