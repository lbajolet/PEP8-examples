; Simple Pep/8 program, loops on i until `loops` has been reached
main:		DECI	loops, d
; First do the comparison block of the While statement
; We try to validate the comparison statement (that is `i < loops`)
; before executing the code of the loop.
lpcp:		LDA	i, d
		CPA	loops, d
		BRGE	outlp
		; Once the out cas has been dismissed, we execute the code
		STRO	itrmsg, d
		DECO	i, d
		CHARO	'\n', i
		; NOTE: No LDA is done here since no instruction modifies the value of A
		; However, if you like safety, you may add an `LDA i, d` to ensure that
		; there's no corruption and future-proofness.
		ADDA	1, i
		STA	i, d
		BR	lpcp
outlp:		STOP

; Number of loops to accomplish
loops:		.BLOCK 2
; Iterator, since it is a .BLOCK, it is always initialized at 0
i:		.BLOCK 2

; Message for the loop
itrmsg:		.ASCII	"Iteration \x00"

		.END
