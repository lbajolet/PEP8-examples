; Simple PEP-8 program, reads a char from the user and prints it back
main:	CHARI	chr, d
	CHARO	chr, d
	STOP

; Since the value is to be read at runtime, no value whatsoever is presetted
; Therefore, a .BLOCK 1 is declared (Note: a .BYTE 0 is semantically equivalent)
chr: 	.BLOCK 1
	.END
