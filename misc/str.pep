; Simple Pep/8 program, shows the different ways of initializing a String.
main:	STRO	str1, d
	STRO	str2, d
	STRO	str3, d
	STRO	str4, d
	STOP

; This is the simplest way of declaring a string, should you forget to
; null-terminate it (\x00), a STRO instruction will continue reading
; after this string, since it will not have encountered a BYTE with value 0.
str1: 	.ASCII	"This is a simple null-terminated string\x00"

; This is an alternative to the string above, no \x00 is present in the String,
; however, a .BYTE 0 is placed right after, which has the same effect of declaring
; it in the string itself.
str2:	.ASCII	"Alternative null-terminated string"
	.BYTE	0

; This is a String that has a line-feed (\n) and a \x00 character to jump to
; the next line in the terminal and correctly delimitate the string.
str3:	.ASCII	"This string has a line-feed in the end\n\x00"

; Here, a strategy akin to str2 is used, .BYTE 10 represents a line-feed (\n) character,
; and the .BYTE 0 is the null-termination of the string.
str4:	.ASCII	"Alternative to str3"
	.BYTE	10
	.BYTE	0

	.END
