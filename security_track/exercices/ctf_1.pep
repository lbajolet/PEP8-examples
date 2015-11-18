main:    SUBSP   2, i
         CALL    replace
         STX     0, s
         STRO    0, sf
         STOP

; Reads a line from user and replaces all occurences of 'a' by 'A' from it
;
; Return:
;        X: Address of the read String
replace: CALL    stri
         SUBSP   2, i
         STX     0, s
         LDX     0, i
         LDA     0, i
repllp:  LDBYTEA 0, sxf
         CPA     'a', i
         BREQ    replchr
         CPA     0, i
         BREQ    replout
         ADDX    1, i
         BR      repllp
replchr: LDBYTEA 'A', i
         STBYTEA 0, sxf
         ADDX    1, i
         BR      repllp
replout: LDX     0, s
         RET2

; Reads a string from stdin, stops at the first occurence of \n
;
; Return
;        X: Address of the String
stri:    SUBSP   52, i
         LDX     0, i
         LDA     0, i
strilp:  CPA     '\n', i
         BREQ    striout
         CHARI   buf, sx
         LDBYTEA buf, sx
         ADDX    1, i
         BR      strilp
striout: LDBYTEA 0, i
         SUBX    1, i
         STBYTEA buf, sx
         MOVSPA
         STA     buflen, s
         LDX     buflen, s
         ADDX    2, i
         ADDSP   52, i
         RET0
buf:     .EQUATE 2
buflen:  .EQUATE 0

code:    STRO    flag, d
         STOP
flag:    .ASCII  "flag{good_job_you_got_intel!}\n\x00"
         .END
