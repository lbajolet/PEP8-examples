; Simple Pep/8 program, shows the factorization of work on arrays
main:		LDX	arr, i
		LDA	5, i
		CALL	fillarr
		LDX	arr, i
		LDA	5, i
		CALL	printarr
		LDX	arr1, i
		LDA	10, i
		CALL	fillarr
		LDX	arr1, i
		LDA	10, i
		CALL	printarr
		STOP
; Simple array of 5 integers
arr:		.BLOCK	10
; Simple array of 10 integers
arr1:		.BLOCK	20

; Fills an array with the input from stdin
;
; Parameters:
;	Register X: base address of the array
;	Register A: length of the array
;
; Return:
;	void
fillarr:	DECI	0, x
		ADDX	2, i
		SUBA	1, i
		BRNE	fillarr
fillout:	RET0

; Prints an array given as parameter
; The array must contain integers only for the function to work
;
; Parameters:
;	Register X: Base address of the array
;	Register A: Length of the array
;
; Return:
;	void.
printarr:	SUBA	1, i
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
