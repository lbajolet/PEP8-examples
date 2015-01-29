; Simple PEP-8 program, exposes the basics of addressing modes `i` and `d`
main:	DECO wrd, i	; Prints the value of the symbol `word` (address) itself => 6
	DECO wrd, d	; Prints the value contained at address `word` => 15
	STOP		; The STOP instruction is not to be forgotten, since it marks the
			; end of the code flow, if forgotten, the following data will be interpreted
			; as code, leading to undefined behaviour until normal or erroneous
			; termination of the program.

; A word (16 bits) initialized at value 15 (Hex representation 0x000F)
wrd: 	.WORD 15
	.END
