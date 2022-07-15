
; ASM FILE code\common\stats\items\itemactions_1.asm :
; 0x229CA..0x229E2 : Item functions

; =============== S U B R O U T I N E =======================================

; Out: D2 = 0 if true, $FFFFFFFF if false


FindUsableOutsideBattleItem:
                
                moveq   #0,d2
                lea     tbl_UsableOutsideBattleItems(pc), a0
                nop
@Loop:
                
                cmp.b   (a0)+,d1
                beq.w   @Return
                cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
                bne.s   @Loop
                moveq   #$FFFFFFFF,d2
@Return:
                
                rts

    ; End of function FindUsableOutsideBattleItem

