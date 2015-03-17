; Pep/8 program, fetches an element in a matrix using coordinated entered by a user
main:		LDX	unimat, i
		DECI	xpos, d
		DECI	ypos, d
		LDA	xpos, d
		STA	getx, d
		LDA	ypos, d
		STA	gety, d
		LDA	5, i
		CALL	getmat
		STA	prel, d
		DECO	prel, d
		STOP

; Matrix of 3 * 5 integers
; A line is 10 bytes long
unimat:		.WORD	1
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
		.WORD	13
		.WORD	14
		.WORD	15
; x-position to get in matrix
xpos:		.BLOCK	2
; y-position to get in matrix
ypos:		.BLOCK	2
; Element fetched, used to print
prel:		.BLOCK	2

; Gets the element at position `x`, `y` in the matrix `m`
; The matrix is supposed to be filled with integers
; `x` and `y` must be 0-indexed
; No bounds checking is done in this method
;
; Parameters:
;	Register X: Base address of the matrix
;	Register A: Length of a line of the matrix
;	`getx`:     Position of the element in x
;	`gety`:     Position of the element in y
;
; Returns:
;	Register A: Element fetched in the matrix
getmat:		STX	matbaddr, d
		LDX	getx, d
		CALL	mul
		ADDA	gety, d
		ASLA
		ADDA	matbaddr, d
		STA	matbaddr, d
		LDX	matbaddr, d
		LDA	0, x
		RET0
; X position in matrix
getx:		.BLOCK	2
; Y position in matrix
gety:		.BLOCK	2
; Matrix base address
matbaddr:	.BLOCK	2

; Multiply sub-program
; NOTE: Only works with positive integers
;
; Parameters:
;   Register A: Multiplicand
;   Register X: Multiplier
;
; Return:
;   Register A: Product
;
; Symbol `inc` can and will be mutated and is
; supposed to be private to this function.
mul:		STA inc, d
		LDA 0, i
mullp:		CPX 0, i
		BRLE    mulout
		ADDA    inc, d
		SUBX    1, i
		BR  mullp
mulout:		RET0
; Increment, is equal to the multiplicand
inc:    	.BLOCK  2

		.END
