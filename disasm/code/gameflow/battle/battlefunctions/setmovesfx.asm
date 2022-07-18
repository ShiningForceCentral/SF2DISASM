
; ASM FILE code\gameflow\battle\battlefunctions\setmovesfx.asm :
; 0x25790..0x257C0 : Set Move Sfx function

; =============== S U B R O U T I N E =======================================


SetMoveSfx:
                
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s   @Continue
                
                clr.w   ((MOVE_SFX-$1000000)).w ; no move sfx outside battle
                bra.s   @CheckEquipment
@Continue:
                
                move.w  #SFX_WALKING,((MOVE_SFX-$1000000)).w
@CheckEquipment:
                
                movem.w d0-d7,-(sp)
                jsr     j_GetEquippedRing
                cmpi.w  #ITEM_CHIRRUP_SANDALS,d1 ; HARDCODED chirrup sandals item index for specific sfx
                bne.s   @Done
                move.w  #SFX_BLOAB,((MOVE_SFX-$1000000)).w
@Done:
                
                movem.w (sp)+,d0-d7
                rts

    ; End of function SetMoveSfx

