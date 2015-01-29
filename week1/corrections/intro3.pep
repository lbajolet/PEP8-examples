; Simple PEP-8 program exposing the internals of the handling of Strings in PEP-8
main:	STRO	str1, d	; This STRO will print not only the first string, but the second too
			; The reason for that is that STRO is coded without
			; any kind of length information. Because of that,
			; it searches the first 0 byte to stop reading (materialized as \x00
			; in a String), since it is located at the end of str2, it only stops reading
			; when encountered.
	STRO	str2, d	; This one on the other hand prints only "String2", since it is correctly
			; NULL-terminated.
	STOP

str1: 	.ASCII "String1 "
str2:	.ASCII "String2\x00"
	.END
