main:	LDA	symbl, i ; Here, A will contain the value of Operand Specifier `symbl`
			 ; Therefore, if we refer to the pepl file, the operand specifier
			 ; is the address of symbol `symbl`
	LDA	symbl, d ; Here, the operand specifier is supposed to be an address
			 ; The value at the address of `symbl` will be read and loaded into A
	LDA	symbl, n ; This is valid in assembly, however the result of the operation is more
			 ; than shady.
			 ; Indeed, the value loaded here will be what is pointed by the address
			 ; contained at address `symbl` => 0x0002.
			 ; This means the last byte of the first instruction and the value
			 ; of LDA ,d as a 16 bit signed integer will be loaded.
	LDX	-2, i
	LDA	ptr, x	 ; Here, the value accessed will be what is contained at address `ptr + X`,
			 ; where X has a value of -2 (loaded at the previous instruction)
			 ; Therefore, the value loaded will be located at address `ptr + (-2)`
			 ; That is, at the address of `symbl` => 0x0002.
	LDA	ptr, n	 ; In this last case, what is contained at address `ptr` is supposed to be
			 ; an address, and will be used to access the RAM at this address.
			 ; Since `ptr` contains the address of `symbl`, the value of `symbl` will be
			 ; read => 0x0002.
	STOP

symbl:	.WORD	2
ptr:	.ADDRSS	symbl
