; Simple Pep/8 program, prints the content of `matrix` line by line
;
; The matrix is defined here as a simple array which lines have a pre-determined length.
main:	LDX	0, i
; Line loops
lnlp:	LDA	currln, d
	CPA	3, i
	BRGE	lnlpout
	LDX	0, i
; Multiply loop for line shifting
; Repeatedly adds linelen => 8
lnmul:	CPA	0, i
	BREQ	cllp
	ADDX	8, i
	SUBA	1, i
	BR	lnmul
	LDA	0, i
; Column loops
cllp:	CPA	4, i
	BRGE	cllpout
	DECO	matrix, x
	CHARO	' ', i
	ADDX	2, i
	ADDA	1, i
	BR	cllp
cllpout:CHARO	'\n', i
	LDA	currln, d
	ADDA	1, i
	STA	currln, d
	BR	lnlp
lnlpout:STOP

; Current line to be printed
currln:	.WORD	0
; Matrix of 3 * 4 integers
; Each line is of length 4 ints => 8
matrix:	.WORD	1
	.WORD	2
	.WORD	3
	.WORD	4
	.WORD	5
	.WORD	6
	.WORD	7
	.WORD	8
	.WORD	9
	.WORD	10
	.WORD	11
	.WORD	12

	.END
