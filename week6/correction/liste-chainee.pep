main:    SUBSP 6, i
         LDA 0, i
         STA cpt, s
         STA list, s
         STA obj_addr, s

rloop:   LDA cpt, s
         CPA sz, i
         BREQ rout
         STA cpt, s

         LDA list, s
         LDX cpt, s
         CALL insert
         STA list, s
         STX obj_addr, s

         LDA cpt, s
         ADDA 1,i
         STA cpt, s

         BR rloop

rout:    LDA list, s
         CALL print

         ADDSP 6, i
         STOP
list:    .EQUATE 6
obj_addr:.EQUATE 4
cpt:     .EQUATE 2
sz:      .EQUATE 10

; Prints all values in list as decimals
; Params:
;        A - List
print:   SUBSP 4, i
         STA plist, s
pchck:   CPA 0, i
         BREQ pout
         CALL get_v
         STA pval, s
         DECO pval, s
         LDA plist, s
         CALL get_o
         STA plist, s
         BR pchck

pout:    RET4
plist:   .EQUATE 0
pval:    .EQUATE 2

; Returns obj with both fields init to 0
; Params:
;        A - obj
init:    SUBSP 2, i
         STA init_obj, s
         LDX 0, i
         CALL set_v
         LDA init_obj, s
         CALL set_o
         RET2
init_obj: .EQUATE 0

; Inserts value in list
; Params:
;        A - List
;        X - value
; Returns:
;        A - List
;        X - New obj
insert:  SUBSP 8, i
         STX val, s
         STA ilist, s

         LDA obj_size, i
         CALL malloc
         STX maillon, s

         LDA maillon, s
         CALL init

         LDA maillon, s
         LDX val, s
         CALL set_v

         LDA ilist, s
         CPA 0, i            ; list == null?
         BRNE add_m
         LDA maillon, s
         STA ilist, s
         BR ins_out

add_m:   LDA ilist, s
inext:   STA curr_m, s
         CALL get_o
         CPA 0, i
         BRNE inext
         LDA curr_m, s
         LDX maillon, s
         CALL set_o

ins_out: LDA ilist, s
         LDX maillon, s
         ADDSP 8, i
         RET0
; Local vars
curr_m:  .EQUATE 6
ilist:   .EQUATE 4
val:     .EQUATE 2
maillon: .EQUATE 0

; Returns obj->value
; Params:
;        A - obj
; Returns:
;        A - obj->val
;
get_v:   SUBSP   2,i
         STA     gv_obj,s
         LDX     obj_v,i
         LDA     gv_obj,sxf
         RET2
; local vars
gv_obj:  .EQUATE 0
; Returns obj->other
; Params:
; A - obj
; Returns:
; A - obj->other
;
get_o:   NOP0
         SUBSP   2,i
         STA     gv_obj,s
         LDX     obj_o,i
         LDA     gv_obj,sxf
         RET2
; local vars
go_obj:  .EQUATE 2
; Sets obj->value to new value
; Params:
; A - obj
; X - new value
;
set_v:   NOP0
         SUBSP   4,i
         STA     sv_obj,s
         STX     sv_value,s
         LDA     sv_value,s
         LDX     obj_v,i
         STA     sv_obj,sxf
         RET4
; local vars
sv_obj:  .EQUATE 0
sv_value:.EQUATE 2
; Sets obj->other to new value
; Params:
; A - obj
; X - new value
;
set_o:   NOP0
         SUBSP   4,i
         STA     so_obj,s
         STX     so_other,s
         LDA     so_other,s
         LDX     obj_o,i
         STA     so_obj,sxf
         RET4
; local vars
so_obj:  .EQUATE 0
so_other:.EQUATE 2
; Struct def
obj_size:.EQUATE 4
obj_v:   .EQUATE 0
obj_o:   .EQUATE 2
; Allocates `n` bytes in the Heap
;
; Params:
;   * Register A: `n` bytes to allocate
; Returns:
;   * Register X: Address of the allocated block
malloc:  LDX     heap_ptr,d
         ADDA    heap_ptr,d
         STA     heap_ptr,d
         RET0
heap_ptr:.ADDRSS heap
heap:    .BYTE   0
         .END
