; Simple Pep/8 program, reads 3 numbers from stdin:
; * `min`: Defines the minimum bound for checks
; * `max`: Defines the maximum bound for checks
; * `nb`:  The number to compare against bounds (inclusively)
;
; A final check determines which message to print, depending of where `nb` is
; compared to the `min` and `max` bounds.
main:		DECI	min, d
		DECI	max, d
		DECI	nb, d
		LDA	nb, d
		CPA	min, d
		BRLT	ltmin
		CPA	max, d
		BRGT	gtmax
		STRO	inbmsg, d
		BR	out
ltmin:		STRO	ltmnmsg, d
		BR	out
gtmax:		STRO	gtmxmsg, d
out:		STOP

; Minimum bound
min:		.BLOCK 2
; Maximum bound
max:		.BLOCK 2
; Number to be checked
nb:		.BLOCK 2

; In bounds message
inbmsg:		.ASCII	"In bounds\x00"
; Lower than min message
ltmnmsg:	.ASCII	"Too low !\x00"
; Higher than max message
gtmxmsg:	.ASCII	"Too high !\x00"

		.END
