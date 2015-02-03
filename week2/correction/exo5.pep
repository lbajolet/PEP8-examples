; Simple Pep/8 program, reads two chars and compares their values
; Then, prints a message stating how the two relate to each other.
;
; NOTE: The program will only work when inputting the two chars
;	on the same line.
;	Failure to comply will consider char2 as the '\n' character
;	or as a runtime error in batch mode.
main:		CHARI	chr1, d
		CHARI	chr2, d
		LDA	grd1, d
		CPA	grd2, d
		BRLT	ltchr
		BRGT	gtchr
eqchr:		STRO	eqcmsg, d
		BR	out
ltchr:		STRO	ltcmsg, d
		BR	out
gtchr:		STRO	gtcmsg, d
out:		STOP

; Guard for char 1, ensures the padding to 0 when working on 16-bit
; instructions and chars (stuff like LDx, CPx, etc.)
grd1:		.BYTE 0
; Char 1, left operand of the comparisons to come
chr1:		.BYTE 0
; Guard for char 2
grd2:		.BYTE 0
; Char 2, right operand of the comparisons to come
chr2:		.BYTE 0

; Message when chr1 == chr2
eqcmsg:		.ASCII "chr1 == chr2\x00"
; Message when chr1 < chr2
ltcmsg:		.ASCII "chr1 < chr2\x00"
; Message when chr1 > chr2
gtcmsg:		.ASCII "chr1 > chr2\x00"

		.END
