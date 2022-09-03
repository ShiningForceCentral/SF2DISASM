
; ASM FILE code\common\stats\items\itemactions_1.asm :
; 0x229CA..0x229E2 : Item functions

; =============== S U B R O U T I N E =======================================

; In: d1.b = item index
; Out: d2.l = 0 if true, -1 if false


IsItemUsableOnField?:
                
                moveq   #0,d2
                lea     tbl_UsableOnFieldItems(pc), a0
                nop
@Loop:
                
                cmp.b   (a0)+,d1
                beq.w   @Return
                cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
                bne.s   @Loop
                
                moveq   #-1,d2
@Return:
                
                rts

    ; End of function IsItemUsableOnField?

