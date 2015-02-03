; Simple Pep/8 program, loops on i until `loops` has been reached
main:		DECI	loops, d
; The for starts with a prelude to the loop, where the iterator is initialized
forst:		LDA	0, i
		STA	i, d
; Then do the comparison block of the For statement
; We try to validate the comparison statement (that is `i <= loops`)
; before executing the code of the loop.
forcp:		LDA	i, d
		CPA	loops, d
		BRGT	forout
		STRO	itrmsg, d
		DECO	i, d
		CHARO	'\n', i
; The increment is supposed to always be done, since we're dealing with
; assembly here, don't expect any kind of automation :)
; So yes, a for loop in a higher-level language is pretty much equivalent to a While.
forinc:		LDA	i, d
		ADDA	1, i
		STA	i, d
		BR	forcp
forout:		STOP

; Number of loops to accomplish
loops:		.BLOCK 2
; Iterator, since it is a .BLOCK, it is always initialized at 0
i:		.BLOCK 2

; Message for the loop
itrmsg:		.ASCII	"Iteration \x00"

		.END
