; Simple Pep/8 program, prints the content of an array
main:		LDX	arr, i
		CALL	printarr
		STOP
; Statically-defined array of integers, contains the values 5, 4, 3, 2, 1
arr:		.WORD	5
		.WORD	4
		.WORD	3
		.WORD	2
		.WORD	1

; Prints an array given as parameter
; The array must contain integers only for the function to work
; The array is supposed to be of length 5
;
; Parameters:
;	Register X: Base address of the array
;
; Return:
;	void.
printarr:	LDA	4, i
parrlp:		DECO	0, x
		CHARO	',', i
		CHARO	' ', i
		ADDX	2, i
		SUBA	1, i
		BRNE	parrlp
parrout:	DECO	0, x
		CHARO	'\n', i
		RET0

		.END
