; Simple PEP-8 program, adds two user inputted numbers and prints the result of the operation.
main:	DECI	lop, d
	DECI	rop, d
	LDA	lop, d
	ADDA	rop, d
	STA	rslt, d
	DECO	rslt, d
	STOP

; Left operand of the addition
lop:	.BLOCK 2
; Right operand of the addition
rop:	.BLOCK 2
; Result of the addition (Note: since lop and rop are never used after reading, we could
; use either of them to store the result for optimization purposes, however this is very minimal and
; should not be done unless under critical memory requirements since it hinders program comprehension)
rslt:	.BLOCK 2
	.END
