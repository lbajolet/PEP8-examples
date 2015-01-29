; Simple PEP-8 program, adds 10 to a user inputted number.
main:	DECI	nbr, d	; DECI cannot write into a register directly, as such, we store
			; it into the memory to be read later.
	LDA	nbr, d	; We then load it into a register for arithmetic calculation (can
			; only be done in a register), A is chosen arbitrarily, X could be used too
	ADDA	10, i	; 10 is added to the register A, which contained the pre-loaded number
	STA	nbr, d	; Since DECO has the same behaviour as DECI in that it can only read
	DECO	nbr, d	; from the memory directly, we store ther result of the arithmetical operation
			; in RAM, to be used by DECO afterwards.
	STOP

; The number to be read, declared as a .BLOCK 2 since no predefined value is
; necessary, we could as well declare it as .WORD 0, that's up to the programmer
; to choose.
nbr:	.BLOCK 2
	.END
