; Simple Pep/8 program, does the equivalent of a fgets(str, 100, stdin);
;
; NOTE: In this case, in the pseudo code, we have a pos variable
; In Pep/8, this variable becomes useless as register X can do the job
; all by itself.
; Optimization at its finest !

main:	LDX	0, i
	CHARI	tmpchr, d
	LDBYTEA	tmpchr, d
	ANDA	255, i
; Read loop start
lpst:	CPA	'\n', i
	BREQ	lpout
	CPX	100, i
	BRGE	lpout
; Read loop body
lpbdy:	STBYTEA	str, x
	ADDX	1, i
	CHARI	tmpchr, d
	LDBYTEA	tmpchr, d
	BR	lpst
; Out of the loop and termination of the program
lpout:	LDA	0, i
	STBYTEA	str, x
	STRO	str, d
	STOP

; Temporary char, used for comparison
tmpchr:	.BLOCK	1
; String with 101 bytes, 100 for chars, 1 for \0 in case of.
str:	.BLOCK	101

	.END
