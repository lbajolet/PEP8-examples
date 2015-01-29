; Simple PEP-8 program, exposes the internals of Word and Byte "datatypes"
; Datatypes is quoted since no real datatypes exist in assembly languages
main: 	LDX	byt, d	; When loading using LDx, 16 bits are read from the operand
	LDX	byt, i	; The addressing mode defines the way it is read, either from the
	LDA	wrd, d	; Symbol (address, `i`) itself, or the value at address Symbol (`d`)
	LDA	wrd, i	; In the case of `wrd`, the behaviour is correct, however when done on
			; `byt`, due to its BYTE nature, what will be loaded is 0x0501 since
			; the next 8 bytes, the MSB 8 bits of `wrd` will be loaded too.

	LDA	0, i	; Reset the MSB of A and X for what follows
	LDX	0, i

	LDBYTEA	byt, d	; LDBYTEx on the other hand reads only 8 bits, it sets the Least
	LDBYTEA	byt, i	; Significant Bits of the specified register to the value read.
	LDBYTEX	wrd, d	; When reading the Symbol itself (`i`), it will load the 8 LSB of the symbol
	LDBYTEX	wrd, i	; in the 8 LSB of the register, while when using `d`, it will
			; load the 8 first bits from address Symbol in the 8 LSB of the register.
			; What happens in this case will be the correct behaviour for `byt`
			; `wrd` on the other hand will not yield the correct value and the 8 first
			; bits will be loaded, yielding the value 0x01 in the register X.
	STOP

; BYTE sets the 8 bits starting from the Symbol's address to the value speicified
; Hex representation: 0x05
byt: 	.BYTE 5
; WORD sets the 16 bits starting from the Symbol's address to the value specified
; Hex representation: 0x01C3
wrd: 	.WORD 451
	.END
