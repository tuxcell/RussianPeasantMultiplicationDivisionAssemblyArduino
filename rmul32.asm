; Russian peasant multiplication
; Implemented by Jose Gama, June 2015
.org 0
.def       result7 = r4
.def       result6 = r5
.def       result5 = r6
.def       result4 = r7
.def       result3 = r8
.def       result2 = r9
.def       result1 = r10
.def       result0 = r11
.def       multiplicand3 = r16
.def       multiplicand2 = r17
.def       multiplicand1 = r18
.def       multiplicand0 = r19
.def       multiplier7 = r12
.def       multiplier6 = r13
.def       multiplier5 = r14
.def       multiplier4 = r15
.def       multiplier3 = r20
.def       multiplier2 = r21
.def       multiplier1 = r22
.def       multiplier0 = r23
   ldi multiplicand3, 0xD2
   ldi multiplicand2, 0xA7
   ldi multiplicand1, 0x4B
   ldi multiplicand0, 0xC7
   ldi multiplier3, 0xF5
   ldi multiplier2, 0x60
   ldi multiplier1, 0xE5
   ldi multiplier0, 0xE8
   clr r1

	clr result7
	clr result6
	clr result5
	clr result4
	clr result3
	clr result2
	clr result1
	clr result0
	clr multiplier7
	clr multiplier6
	clr multiplier5
	clr multiplier4
	cp multiplicand0, r1 ; if multiplicand==0
	cpc multiplicand1, r1
	cpc multiplicand2, r1
	cpc multiplicand3, r1
	breq ENDMULT ; then return 0	
	cp multiplier0, r1 ; if multiplier==0
	cpc multiplier1, r1
	cpc multiplier2, r1
	cpc multiplier3, r1
	breq ENDMULT ; then return 0
	bst multiplicand0, 0
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
	rol multiplier4
	rol multiplier5
	rol multiplier6
	rol multiplier7
	lsr multiplicand3 ; multiplicand=multiplicand/2
	ror multiplicand2
	ror multiplicand1
	ror multiplicand0
	bst multiplicand0, 0
	brtc NOADD ; if the multiplicand is odd then add the multiplier
	add result0, multiplier0
	adc result1, multiplier1	
	adc result2, multiplier2	
	adc result3, multiplier3
	adc result4, multiplier4	
	adc result5, multiplier5
	adc result6, multiplier6	
	adc result7, multiplier7
NOADD:
	mov r0, multiplicand1
	or r0, multiplicand2
	or r0, multiplicand3
	cpi multiplicand0, 1
	cpc r0, r1
	breq ENDMULT ;  stop when multiplicand == 1
	rjmp SPLITLOOP
ENDMULT:


