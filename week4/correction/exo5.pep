; Simple Pep/8 program, reads a string from standard input of a length of 100 maximum and prints it.
main:		LDX	str, i
		LDA	100, i
		CALL	stri
		STA	charsrd, d
		DECO	charsrd, d
		CHARO	'\n', i
		STRO	str, d
		STOP
; String to read, 100 bytes maximum, +1 byte for the \x00
str:		.BLOCK	101
; Number of chars read by STRI
charsrd:	.BLOCK	2

; Reads a string from stdin, limits the size of the input.
; Stops reading when either a \n is encountered or when
; `maxchar` chars have been read.
;
; Parameters:
;	Register X: Address of the final String
;	Register A: Maximum size of the String
;
; Return:
;	Register A: Number of characters read
stri:		STA	maxchar, d
strilp:		CHARI	0, x
		LDBYTEA	0, x
		ADDX	1, i
		ANDA	255, i
		CPA	'\n', i
		BREQ	striout
		LDA	charcpt, d
		ADDA	1, i
		STA	charcpt, d
		CPA	maxchar, d
		BRNE	strilp
		LDA	0, i
		STBYTEA	0, x
striout:	LDA	charcpt, d
		RET0
; Counter of chars read
charcpt:	.BLOCK	2
; Maximum number of chars to read
maxchar:	.BLOCK	2

		.END
