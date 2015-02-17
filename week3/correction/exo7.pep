; Simple Pep/8 program that shows how to handle real-world like matrices
;
; In low-level programming, matrices are often described as pointer arrays
; Each area pointed by the first-level array is an array of values
; Depending on how it is modelized, it will represent either a line or a column
;
; In our case, each pointer of `matrix` will represent a line
; These lines are stored elsewhere in memory and can be accessed using `x` addressing.
main:	LDX	0, i
; Matrix lines loop
mtrlp:	LDA	currln, d
	CPA	3, i
	BRGE	mtrout
	LDX	currln, d
	ASLX
	LDX	matrix, x
	ADDX	8, i
	STX	mxlnadr, d
	SUBX	8, i
; Line print loop
lnplp:	CPX	mxlnadr, d
	BRGE	lnplout
	DECO	0, x
	CHARO	' ', i
	ADDX	2, i
	BR	lnplp
; Line print out
lnplout:LDA	currln, d
	ADDA	1, i
	STA	currln, d
	CHARO	'\n', i
	BR	mtrlp
; Program out
mtrout:	STOP


; Current line index
currln:	.WORD	0
; Max line address = line start + 8
mxlnadr:.WORD	0

; Matrix containing pointers to lines
matrix:	.ADDRSS	mln1
	.ADDRSS	mln2
	.ADDRSS	mln3

; Line 1 of the matrix
mln1:	.WORD	1
	.WORD	2
	.WORD	3
	.WORD	4

; Line 2 of the matrix
mln2:	.WORD	5
	.WORD	6
	.WORD	7
	.WORD	8

; Line 3 of the matrix
mln3:	.WORD	9
	.WORD	1
	.WORD	2
	.WORD	3

	.END
