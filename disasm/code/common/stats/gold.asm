
; ASM FILE code\common\stats\gold.asm :
; 0x898E..0x89CE : Gold management functions

; =============== S U B R O U T I N E =======================================


SetGold:
                
                move.l  d1,((CURRENT_GOLD-$1000000)).w
                rts

    ; End of function SetGold


; =============== S U B R O U T I N E =======================================


GetGold:
                
                move.l  ((CURRENT_GOLD-$1000000)).w,d1
                rts

    ; End of function GetGold


; =============== S U B R O U T I N E =======================================


IncreaseGold:
                
                add.l   ((CURRENT_GOLD-$1000000)).w,d1
                bcs.s   @CapGoldAmount
                cmpi.l  #FORCE_MAX_GOLD,d1
                bls.s   @Continue
@CapGoldAmount:
                
                move.l  #FORCE_MAX_GOLD,d1
@Continue:
                
                move.l  d1,((CURRENT_GOLD-$1000000)).w
                rts

    ; End of function IncreaseGold


; =============== S U B R O U T I N E =======================================


DecreaseGold:
                
                movem.l d0,-(sp)
                move.l  ((CURRENT_GOLD-$1000000)).w,d0
                sub.l   d1,d0
                bcc.s   @Continue
                moveq   #0,d0
@Continue:
                
                move.l  d0,((CURRENT_GOLD-$1000000)).w
                move.l  d0,d1
                movem.l (sp)+,d0
                rts

    ; End of function DecreaseGold

