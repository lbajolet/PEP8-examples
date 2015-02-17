; Simple Pep/8 program, prints the values of a statically defined array of 10 ints.
main:	LDX	0, i
; Print loop, increments X until it reaches max value => 18
prlp:	DECO	arr, x
	CHARO	' ', i
	ADDX	2, i
	CPX	18, i
	BRLE	prlp
	STOP
; The array of 10 values
arr:	.WORD	8
	.WORD	10
	.WORD	182
	.WORD	1234
	.WORD	12
	.WORD	8956
	.WORD	745
	.WORD	137
	.WORD	934
	.WORD	16
	.END
