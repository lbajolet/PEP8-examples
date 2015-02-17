; Pep/8 program, takes a matrix `bmatrix` and inverts its lines and columns into `matrix`
;
; The matrix is defined here as a simple array which lines have a pre-determined length.
main:	LDX	0, i
	LDA	0, i
	STA	bcol, d
; External for loop
;
; for bcol in [0 .. 4[
extflp:	LDA	bcol, d
	CPA	4, i
	BRGE	outxtf
	LDA	0, i
	STA	bln, d
; Internal for loop
;
; for bln in [0 .. 3[
inflp:	LDA	bln, d
	CPA	3, i
	BRGE	extfinc
	LDA	bln, d
	LDX	0, i
; Resolve access to bmatrix[bcol][bln] => bcol * sizeof(bmatrix line length) + bln * sizeof(WORD)
; Multiplies sizeof(bmatrix line length) => 8 * bln
bmblnml:CPA	0, i
	BRLE	mlcl
	ADDX	8, i
	SUBA	1, i
	BR	bmblnml
mlcl:	LDA	bcol, d
; Multiplies sizeof(WORD) => 2 * bcol
bmmlcol:CPA	0, i
	BRLE	tmpsv
	ADDX	2, i
	SUBA	1, i
	BR	bmmlcol
; Keeps a temporary cache of bmatrix[bln][bcol]
; Reset index register
tmpsv:	LDA	bmatrix, x
	STA	tmpbm, d
	LDA	bcol, d
	LDX	0, i
; Resolve access to matrix[bln][bcol] => bln * sizeof(matrix line length) + bcol * sizeof(WORD)
; Multiplies sizeof(matrix line length) => 6 * bcol
fmmlcol:CPA	0, i
	BRLE	fmln
	ADDX	6, i
	SUBA	1, i
	BR	fmmlcol
fmln:	LDA	bln, d
; Mutliplies sizeof(WORD) => 2 * bln
fmmlbln:CPA	0, i
	BRLE	strtmp
	ADDX	2, i
	SUBA	1, i
	BR	fmmlbln
; Stores bmatrix[bln][bcol] => matrix[bcol][bln]
strtmp:	LDA	tmpbm, d
	STA	matrix, x
; Increments bln for internal for loop
infinc:	LDA	bln, d
	ADDA	1, i
	STA	bln, d
	BR	inflp
; Increments bcol for external for loop
extfinc:LDA	bcol, d
	ADDA	1, i
	STA	bcol, d
	BR	extflp
; Out of the external for loop, starts printing the contents of matrix
outxtf:	LDX	0, i
; Line loops
lnlp:	LDA	currln, d
	CPA	4, i
	BRGE	lnlpout
	LDX	0, i
; Multiply loop for line shifting
; Repeatedly adds linelen => 6
lnmul:	CPA	0, i
	BREQ	clbt
	ADDX	6, i
	SUBA	1, i
	BR	lnmul
; Column loops
clbt:	LDA	0, i
cllp:	CPA	3, i
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
; Base column index
bcol:	.WORD	0
; Base line index
bln:	.WORD	0
; Temporarily contains the value of bmatrix[bln][bcol]
tmpbm:	.WORD	0
; Base matrix
bmatrix:.WORD	0
	.WORD	1
	.WORD	2
	.WORD	3
	.WORD	4
	.WORD	5
	.WORD	6
	.WORD	7
	.WORD	8
	.WORD	9
	.WORD	1
	.WORD	2
; Final Matrix
matrix:	.BLOCK	24

	.END
