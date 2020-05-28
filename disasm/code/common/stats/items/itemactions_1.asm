
; ASM FILE code\common\stats\items\itemactions_1.asm :
; 0x229CA..0x229E2 : Item functions

; =============== S U B R O U T I N E =======================================

sub_229CA:
                
                moveq   #0,d2
                lea     UsableOutsideBattleItems(pc), a0
                nop
loc_229D2:
                
                cmp.b   (a0)+,d1
                beq.w   return_229E0
                cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
                bne.s   loc_229D2
                moveq   #$FFFFFFFF,d2
return_229E0:
                
                rts

    ; End of function sub_229CA

