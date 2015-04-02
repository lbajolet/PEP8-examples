; Simple Pep/8 program, divides 2 numbers while passing parameters through the stack
main:	SUBSP	8, i
	STRO	welcomsg, d
	DECI	6, s
	DECI	4, s
	CALL	div
	STRO	quomsg, d
	DECO	0, s
	CHARO	'\n', i
	STRO	remmsg, d
	DECO	2, s
	CHARO	'\n', i
	ADDSP	8, i
	STOP

; Integer division between two numbers
;
; NOTE: Will only work with positive non-zero integers
; Other use cases will result in undefined behaviour
;
; Parameters:
;	* SP + 6: Divider
;	* SP + 8: Dividend
;
; Return:
;	* SP + 2: Quotient
;	* SP + 4: Remain
div:	LDA	8, s
	LDX	0, i
divlp:	CPA	6, s
	BRLT	divout
	SUBA	6, s
	ADDX	1, i
	BR	divlp
divout:	STA	4, s
	STX	2, s
	RET0

; .rodata (Read-Only data, in ELF files, this is the section in which every non-writable
;          data is stored. As we're in assembly / real-mode, there is no such thing as
;          OS/HW protected memory, but we'll act as if)
welcomsg:	.ASCII "Enter two numbers for division (dividend, then divider)\n\x00"
quomsg:		.ASCII "Quotient = \x00"
remmsg:		.ASCII "Remain = \x00"

		.END
