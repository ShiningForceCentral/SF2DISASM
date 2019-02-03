
; ASM FILE code\common\scripting\text\headquartersquotes.asm :
; 0x4790E..0x47948 : Headquarters quote function

; =============== S U B R O U T I N E =======================================

DisplayHeadquartersQuote:
                
                jsr     sub_100AC
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_47924
                move.w  #1,d0
                bra.s   loc_4793C       
loc_47924:
                
                move.w  d0,d1
                addi.w  #$20,d1 ; "in active party" flags
                jsr     j_CheckFlag
                beq.s   loc_47938       
                addi.w  #$DC3,d0        ; 0DC3={W1}
                bra.s   loc_4793C       ; start of headquarters quotes
loc_47938:
                
                addi.w  #$DE1,d0        ; 0DE1={W1}
loc_4793C:
                
                jsr     (DisplayText).w ; alternate quotes ?
                jsr     sub_100B0
                rts

	; End of function DisplayHeadquartersQuote

