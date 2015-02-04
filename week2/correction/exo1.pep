; Simple Pep/8 program, reads a number from stdin, and prints if it is either > or <= 10.
main:	DECI	nb, d
	LDA	nb, d 		; We first load the left operand of the substraction
	CPA	10, i 		; CPA does nb - 10 in memory, the result is discarded.
	BRLE	le10  		; However, NZVC are changed by the operation, which are then
	STRO	gt10msg, d	; used by BR(L|G)(E|T) to determine if branching is necessary or not
	BR	out
le10:	STRO	le10msg, d
out:	STOP

; Number to be read
nb:		.BLOCK 2

; Greater than 10 message
gt10msg:	.ASCII "> 10\x00"
; Lesser or equal to 10 message
le10msg:	.ASCII "<= 10\x00"

		.END
