; Russian peasant division
; Implemented by Jose Gama, June 2015
.org 0
.def       result = r16
.def       remainder = r17
.def       dividend = r18
.def       divisor = r19
   ldi dividend, 130
   ldi divisor, 7
	ser result
	tst divisor ; if divisor==0
	breq ENDEXIT ; then return 255
	cp dividend, divisor ; if dividend<divisor
	brcc SPLIT
	clr result
	rjmp ENDEXIT; then return 0
SPLIT: clr r0
SPLITLOOP:	inc r0
	bst divisor, 7 ; to avoid an overflow
	brts ENDSPLIT ; Skip if bit 7 in divisor==1
	lsl divisor
	cp dividend, divisor
	brcc SPLITLOOP
ROTSPLIT: lsr divisor ; divisor=divisor/2
ENDSPLIT: clr result
DIVLOOP:	 lsl result ; quotient=quotient*2
	cp dividend, divisor
	brcs DIVNEXT
	inc result
	sub dividend, divisor ; dividend -= divisor
DIVNEXT: lsr divisor ; divisor=divisor/2
	dec r0
	brne DIVLOOP
ENDEXIT: mov remainder, dividend ; last subtraction == remainder



