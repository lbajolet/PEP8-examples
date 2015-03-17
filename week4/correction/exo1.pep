; Simple Pep/8 program, shows how to use CALL and RET0 for functions
; Parameters are passed through registers here
main:		STRO	inmsg, d
		LDX	arr, i
		CALL	fillarr
		STRO	outmsg, d
		STOP
; The static array, 10 bytes for 5 integers
arr:		.BLOCK	10
; Message for the beginning of the program
inmsg:		.ASCII	"Please enter 5 numbers:\n\x00"
; Message for the end of the program
outmsg:		.ASCII	"Done.\x00"

; Fills an array with the input from stdin
; The array is supposed to be of length 5
;
; Parameters:
;	Register X: base address of the array
;
; Return:
;	void
fillarr:	LDA	5, i
filllp:		DECI	0, x
		ADDX	2, i
		SUBA	1, i
		BRNE	filllp
fillout:	RET0

		.END
