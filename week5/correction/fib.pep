; Simple Pep/8 program, computes the nth fibonacci number.
main:	SUBSP	2, i
	DECI	0, s
	LDA	0, s
	CALL	fib
	STA	0, s
	DECO	0, s
	STOP

; Computes the nth number of fibonacci using the naïve recursive algorithm
;
; Parameters:
;	Register A: nth number to compute
;
; Returns:
;	Register A: The nth number, computed
;
fib:	SUBSP	4, i
	CPA	2, i
	BRLT	fibout
	STA	loci, s
	SUBA	1, i
	CALL	fib
	STA	locval, s
	LDA	loci, s
	SUBA	2, i
	CALL	fib
	ADDA	locval, s
fibout:	ADDSP	4, i
	RET0
; Local copy of the parameter
loci:	.EQUATE	0
; Temporary local value, holds the sum of recursive calls
locval:	.EQUATE	2

	.END
