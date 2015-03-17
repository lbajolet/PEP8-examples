; Pep/8 program, fetches an element in a matrix using coordinated entered by a user
main:		LDX	bimat, i
		DECI	xpos, d
		DECI	ypos, d
		LDA	xpos, d
		STA	getx, d
		LDA	ypos, d
		STA	gety, d
		CALL	getmat
		STA	prel, d
		DECO	prel, d
		STOP
; x-position to get in matrix
xpos:		.BLOCK	2
; y-position to get in matrix
ypos:		.BLOCK	2
; Element fetched, used to print
prel:		.BLOCK	2

; Matrix of 3 * 5 integers
;
; Done in C-style, a matrix is a pointer array to lines
bimat:		.ADDRSS	line1
		.ADDRSS	line2
		.ADDRSS	line3
; Line 1 of the matrix
line1:          .WORD   1
                .WORD   2
                .WORD   3
                .WORD   4
                .WORD   5
; Line 2 of the matrix
line2:          .WORD   6
                .WORD   7
                .WORD   8
                .WORD   9
                .WORD   10
; Line 3 of the matrix
line3:          .WORD   11
                .WORD   12
                .WORD   13
                .WORD   14
                .WORD   15

; Gets the element at position `x`, `y` in the matrix `m`
; The matrix is supposed to be filled with integers
; `x` and `y` must be 0-indexed
; No bounds checking is done in this method
;
; Parameters:
;	Register X: Base address of the matrix
;	`getx`:     Position of the element in x
;	`gety`:     Position of the element in y
;
; Returns:
;	Register A: Element fetched in the matrix
getmat:		LDA	getx, d
		ASLA
		STA	getx, d
		ADDX	getx, d
		LDX	0, x
		LDA	gety, d
		ASLA
		STA	gety, d
		ADDX	gety, d
		LDA	0, x
		RET0
; X position in matrix
getx:		.BLOCK	2
; Y position in matrix
gety:		.BLOCK	2

		.END
