
; ASM FILE code\common\stats-standard\gold.asm :
; Gold management functions

; =============== S U B R O U T I N E =======================================


SetGold:
                
                move.l  a0,-(sp)
                loadSavedDataAddress CURRENT_GOLD, a0
                setSavedLong d1, a0
                movea.l (sp)+,a0
                rts

    ; End of function SetGold


; =============== S U B R O U T I N E =======================================


GetGold:
                
                move.l  a0,-(sp)
                loadSavedDataAddress CURRENT_GOLD, a0
                getSavedLong a0, d1
                movea.l (sp)+,a0
                rts

    ; End of function GetGold


; =============== S U B R O U T I N E =======================================


IncreaseGold:
                
                move.l  d0,-(sp)
                move.l  d1,d0
                bsr.s   GetGold
                add.l   d0,d1
                blo.s   @CapGoldAmount
                
                cmpi.l  #FORCE_MAX_GOLD,d1
                bls.s   @Continue
@CapGoldAmount:
                
                move.l  #FORCE_MAX_GOLD,d1
@Continue:
                
                bsr.s   SetGold
                move.l  (sp)+,d0
                rts

    ; End of function IncreaseGold


; =============== S U B R O U T I N E =======================================


DecreaseGold:
                
                move.l  d0,-(sp)
                move.l  d1,d0
                bsr.s   GetGold
                sub.l   d0,d1
                bhs.s   @Continue
                
                moveq   #0,d1
@Continue:
                
                bsr.s   SetGold
                move.l  (sp)+,d0
                rts

    ; End of function DecreaseGold

