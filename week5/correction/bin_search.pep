; Simple Pep/8 program, does a binary search of an element in an Array
main:		SUBSP	2, i ; Stack sz + 2
		STRO	welcmsg, d
		DECI	0, s
		LDA	0, s
		ASLA
		STA	0, s
		SUBSP	0, s ; Stack sz + 2 + arrsz
		SUBSP	2, i ; Stack sz + 4 + arrsz
		ASRA
		STA	0, s
		MOVSPA
		ADDA	2, i
		SUBSP	2, i ; Stack sz + 6 + arrsz
		STA	0, s
		LDX	0, s
		ADDSP	2, i ; Stack sz + 4 + arrsz
		LDA	0, s
		CALL	fillarr
		MOVSPA
		ADDA	2, i
		SUBSP	2, i ; Stack sz + 6 + arrsz
		STA	0, s
		LDX	0, s
		ADDSP	2, i ; Stack sz + 4 + arrsz
		LDA	0, s
		CALL	printarr
		STRO	fndelms, d
		SUBSP	2, i ; Stack sz + 6 + arrsz
inlp:		DECI	0, s
		LDA	0, s
		CPA	-1, i
		BREQ	olp
		BRLT	inlp
		SUBSP	8, i ; Stack sz + 14 + arrsz
		STA	4, s
		LDA	0, i
		STA	2, s
		LDA	10, s
		SUBA	1, i
		STA	0, s
		MOVSPA
		ADDA	12, i
		STA	6, s
		CALL	binsrch
		ADDSP	8, i ; Stack sz + 6 + arrsz
		STA	0, s
		STRO	fndinmsg, d
		DECO	0, s
		CHARO	'\n', i
		BR	inlp
olp:		STOP

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

; Binary search of an element in an array
; Returns the index of the element searched or -1 if not found
;
; Parameters:
;	* SP + 2: Right bound of the search
;	* SP + 4: Left bound of the search
;	* SP + 6: Element to seek
;	* SP + 8: Address of the array
;
; Return:
;	* Register A: Index of the element
binsrch:	LDA	4, s
		CPA	2, s
		BRGT	sgte
		SUBSP	2, i ; Stack sz + 2
		LDA	4, s
		SUBA	6, s
		ASRA
		ADDA	6, s
		STA	0, s
		LDX	0, s
		ASLX
		ADDX	10, s
		LDA	0, x
		CPA	8, s
		BRGT	dmidgtel
		BRLT	dmidltel
		LDA	0, s
		RET2	; Stack sz + 0
; Start greater than end, return -1
sgte:		LDA	-1, i
		RET0
; If arr[mid] > toFind
dmidgtel:	SUBSP	8, i ; Stack sz + 10
		LDA	8, s
		SUBA	1, i
		STA	0, s
		LDA	14, s
		STA	2, s
		LDA	16, s
		STA	4, s
		LDA	18, s
		STA	6, s
		CALL	binsrch
		ADDSP	10, i ; Stack sz + 0
		RET0
; If arr[mid] < toFind
dmidltel:	SUBSP	8, i ; Stack sz + 10
		LDA	12, s
		STA	0, s
		LDA	8, s
		ADDA	1, i
		STA	2, s
		LDA	16, s
		STA	4, s
		LDA	18, s
		STA	6, s
		CALL	binsrch
		ADDSP	10, i ; Stack sz + 0
		RET0

welcmsg:	.ASCII "Input an array, size first, then the elements in the array, one by one (integers only)\n\x00"
divzmsg:	.ASCII "SIGFPE - Division by 0, aborting\n\x00"
fndelms:	.ASCII "Please enter the element you search\nThe search will end when you enter -1\n\x00"
fndinmsg:	.ASCII "Found element at index \x00"
		.END
