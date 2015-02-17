; Simple Pep/8 program, inputs 10 ints to an array and print it afterwards
main:	LDX	0, i
; Input loop
inlp:	DECI	arr, x
	ADDX	2, i
	CPX	18, i
	BRLE	inlp
	LDX	0, i
; Print loop
prlp:	DECO	arr, x
	CHARO	' ', i
	ADDX	2, i
	CPX	18, i
	BRLE	prlp
	STOP
; Array of 10 values, to be entered by user
arr:	.BLOCK 20
	.END
