; Simple Pep/8 program, determines if a user-inputted char is an ASCII-letter or not
main:		CHARI	chr, d
		LDA	0, i 	; This step is to ensure that the 8 MSB of A have a 0-value
				;
				; An alternative might be to declare a Byte before chr that we'll load
				; as LDA
				;
				; A third alternative might be used, which is to use the binary
				; ANDx instruction after loading a 8-bit value with LDBYTEx
				; Example:
				; LDBYTEA	chr, d
				; ANDA		0x00FF, i
		LDBYTEA	chr, d
		CPA	'A', i	; CPA are completely safe on constant chars, since their value
		BRLT	notlet	; can be safely padded for 16-bit operands.
		CPA	'z', i	; Working on dynamic (in-memory) chars is, however, trickier.
		BRGT	notlet	; This will be discussed in exercice 5.
		CPA	'Z', i
		BRLE	islet
		CPA	'a', i
		BRGE	islet
notlet:		STRO	nletmsg, d
		BR	out
islet:		STRO	letmsg, d
out:		STOP

; Char to compare
chr:		.BLOCK 1

; Is a letter message
letmsg:		.ASCII "It is a letter\x00"
; Is not a letter message
nletmsg:	.ASCII "Not a letter\x00"

		.END
