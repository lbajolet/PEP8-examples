; Sample Pep/8 program, sorts an array using a Bubble-Sort

; Start of the program
; _start
; Sorting while loop
lpst:	LDA	swappd, d
	CPA	0, i
	BREQ	lpout
; Body of the loop
lpbdy:	LDA	0, i
	STA	swappd, d
; Start of the for loop on the array
forst:	LDA	1, i
	STA	pos, d
; Body of the for loop
forlp:	LDA	pos, d
	CPA	arrln, d
	BRGE	forout
	LDX	pos, d
	ASLX
	LDA	arr, x
	STA	tmp, d
	SUBX	2, i
	CPA	arr, x
	BRGE	fornxt
	LDA	arr, x
	ADDX	2, i
	STA	arr, x
	SUBX	2, i
	LDA	tmp, d
	STA	arr, x
	LDA	1, i
	STA	swappd, d
; Next element of the iterator of the for loop
fornxt:	LDA	pos, d
	ADDA	1, i
	STA	pos, d
	BR	forlp
; Out of the for loop
forout:	BR	lpst
; Out of the while loop
lpout:	LDX	0, i
; Print loop
prlp:	CPX	barrln, d
	BRGE	prout
	DECO	arr, x
	CHARO	',', i
	CHARO	' ', i
	ADDX	2, i
	BR	prlp
; Print out
prout:	DECO	arr, x
	STOP

; Flag to determine whether or not a swap was done in the last run
; Defaults to true for a first run
swappd:	.WORD	1
; Position in array to be sorted
pos:	.BLOCK	2
; Temporary value, used for swapping
tmp:	.BLOCK	2
; Length of the array being sorted
arrln:	.WORD	10
; Length of the array in bytes (-2 for the join to print correctly)
barrln: .WORD	18
; Array of values in desc order to be sorted
arr:	.WORD	9
	.WORD	8
	.WORD	7
	.WORD	6
	.WORD	5
	.WORD	4
	.WORD	3
	.WORD	2
	.WORD	1
	.WORD	0

	.END
