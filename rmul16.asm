; Russian peasant multiplication
; Implemented by Jose Gama, June 2015
.org 0
.def       result3 = r12
.def       result2 = r13
.def       result1 = r14
.def       result0 = r15
.def       multiplicandH = r16
.def       multiplicandL = r17
.def       multiplier1 = r18
.def       multiplier0 = r19
.def       multiplier3 = r20
.def       multiplier2 = r21
   ldi multiplicandH, 0xFF
   ldi multiplicandL, 0xFF
   ldi multiplier1, 0xFF
   ldi multiplier0, 0xFF
   clr r1

	clr result3
	clr result2
	clr result1
	clr result0
	clr multiplier3
	clr multiplier2
	cp multiplicandL, r1 ; if multiplicand==0
	cpc multiplicandH, r1
	breq ENDMULT ; then return 0	
	cp multiplier0, r1 ; if multiplier==0
	cpc multiplier1, r1
	breq ENDMULT ; then return 0
	bst multiplicandL, 0
	brtc SPLITLOOP ; if the multiplicand is odd then add the multiplier
	add result0, multiplier0
	adc result1, multiplier1	
	adc result2, multiplier2	
	adc result3, multiplier3	
SPLITLOOP:
	lsl multiplier0  ; multiplier=multiplier*2
	rol multiplier1
	rol multiplier2
	rol multiplier3
	lsr multiplicandH ; multiplicand=multiplicand/2
	ror multiplicandL
	bst multiplicandL, 0
	brtc NOADD ; if the multiplicand is odd then add the multiplier
	add result0, multiplier0
	adc result1, multiplier1	
	adc result2, multiplier2	
	adc result3, multiplier3
NOADD:	
	cpi multiplicandL, 1
	cpc multiplicandH, r1
	breq ENDMULT ;  stop when multiplicand == 1
	rjmp SPLITLOOP
ENDMULT:






