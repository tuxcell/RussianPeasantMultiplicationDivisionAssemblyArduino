; Russian peasant division
; Implemented by Jose Gama, June 2015
.org 0
.def       resultH = r16
.def       resultL = r17
.def       remainderH = r18
.def       remainderL = r19
.def       dividendH = r20
.def       dividendL = r21
.def       divisorH = r22
.def       divisorL = r23
   ldi dividendH, high(12649)
   ldi dividendL, low(12649)
   ldi divisorH,high(1800)
   ldi divisorL, low(1800)
	ser resultH
	ser resultL
	cp divisorL, r1
	cpc divisorH, r1  ; if divisor==0
	breq ENDEXIT ; then return 0xFFFF
	cp dividendL, divisorL ; if dividend<divisor
	cpc dividendH, divisorH ; if dividend<divisor
	brcc SPLIT	
	clr resultH
	clr resultL
	rjmp ENDEXIT; then return 0
SPLIT: clr r0
SPLITLOOP:	inc r0
	bst divisorH, 7 ; to avoid an overflow
	brts ENDSPLIT ; Skip if bit 15 in divisor==1
	lsl divisorL ; divisor=divisor*2
	rol divisorH
	cp dividendL, divisorL
	cpc dividendH, divisorH
	brcc SPLITLOOP
	lsr divisorH ; divisor=divisor/2
	ror divisorL	
ENDSPLIT: clr resultH
   clr resultL
DIVLOOP:	lsl resultL ; quotient=quotient*2
	rol resultH
	cp dividendL, divisorL
	cpc dividendH, divisorH
	brcs DIVNEXT
	inc resultL
	brne INCNEXT
	inc resultH
INCNEXT:	sub dividendL, divisorL ; dividend -= divisor
	sbc dividendH, divisorH
DIVNEXT: lsr divisorH ; divisor=divisor/2
	ror divisorL
	dec r0
	brne DIVLOOP
ENDEXIT: movw remainderL:remainderH, dividendL:dividendH ; remainder = last subtraction






