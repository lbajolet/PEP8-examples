; Simple Pep/8 Program, reads a number from stdin, and prints if it is either > or <= 10.
main:		DECI	nb, d
		LDA	nb, d
		CPA	10, i
		BRLT	lt10
		STRO	ge10msg, d
		BR	out
lt10:		STRO	lt10msg, d
out:		STOP

; Number to be read
nb:		.BLOCK 2

; Greater or equal to 10 message
ge10msg:	.ASCII ">= 10\x00"
; Lesser than 10 message
lt10nsg:	.ASCII "< 10\x00"

		.END
