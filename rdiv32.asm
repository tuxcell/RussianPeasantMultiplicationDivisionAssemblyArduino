; Russian peasant division
; Implemented by Jose Gama, June 2015
.org 0
.def       result3 = r8
.def       result2 = r9
.def       result1 = r10
.def       result0 = r11
.def       remainder3 = r12
.def       remainder2 = r13
.def       remainder1 = r14
.def       remainder0 = r15
.def       dividend3 = r16
.def       dividend2 = r17
.def       dividend1 = r18
.def       dividend0 = r19
.def       divisor3 = r20
.def       divisor2 = r21
.def       divisor1 = r22
.def       divisor0 = r23
   ldi dividend3, 0
   ldi dividend2, 1
   ldi dividend1, high(79807)
   ldi dividend0, low(79807)
   ldi divisor3,0
   ldi divisor2, 0
   ldi divisor1,0
   ldi divisor0, 34
	and result3, r1
	and result2, r1
	and result1, r1
	and result0, r1
	cp divisor0, r1
	cpc divisor1, r1
	cpc divisor2, r1
	cpc divisor3, r1  ; if divisor==0
	breq ENDEXIT ; then return 0xFFFF
	cp dividend0, divisor0 ; if dividend<divisor
	cpc dividend1, divisor1
	cpc dividend2, divisor2
	cpc dividend3, divisor3 ; if dividend<divisor
	brcc SPLIT	
	clr result0
	clr result1
	clr result2
	clr result3
	rjmp ENDEXIT; then return 0
SPLIT: clr r0
SPLITLOOP:	inc r0
	bst divisor3, 7 ; to avoid an overflow
	brts ENDSPLIT ; Skip if bit 15 in divisor==1
	lsl divisor0 ; divisor=divisor*2
	rol divisor1
	rol divisor2
	rol divisor3
	cp dividend0, divisor0
	cpc dividend1, divisor1
	cpc dividend2, divisor2
	cpc dividend3, divisor3
	brcc SPLITLOOP
	lsr divisor3 ; divisor=divisor/2
	ror divisor2	
	ror divisor1	
	ror divisor0	
ENDSPLIT: clr result0
   clr result1
   clr result2
   clr result3
DIVLOOP:	lsl result0 ; quotient=quotient*2
	rol result1
	rol result2
	rol result3
	cp dividend0, divisor0
	cpc dividend1, divisor1
	cpc dividend2, divisor2
	cpc dividend3, divisor3
	brcs DIVNEXT
	inc result0
	brne INCNEXT
	inc result1
	brne INCNEXT
	inc result2
	brne INCNEXT
	inc result3
INCNEXT:	sub dividend0, divisor0 ; dividend -= divisor
	sbc dividend1, divisor1
	sbc dividend2, divisor2
	sbc dividend3, divisor3
DIVNEXT: lsr divisor3 ; divisor=divisor/2
	ror divisor2
	ror divisor1
	ror divisor0
	dec r0
	brne DIVLOOP
ENDEXIT: movw remainder0:remainder1, dividend0:dividend1 ; remainder = last subtraction
   movw remainder2:remainder3, dividend2:dividend3







