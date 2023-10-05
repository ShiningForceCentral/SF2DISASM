
; ASM FILE code\gameflow\battle\battlefunctions\setmovesfx-standard.asm :
; 

; =============== S U B R O U T I N E =======================================


SetMoveSfx:
                
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s   @Continue
                clr.w   ((MOVE_SFX-$1000000)).w ; no move sfx outside battle
                bra.s   @FindMoveSfx
@Continue:      move.w  #SFX_WALKING,((MOVE_SFX-$1000000)).w
                
@FindMoveSfx:   movem.l d1-d2/a0,-(sp)
                lea     table_MoveSfxForEquippedRing(pc), a0
                jsr     GetEquippedRing
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                move.b  (a0),((MOVE_SFX+1-$1000000)).w
@Done:          movem.l (sp)+,d1-d2/a0
                rts

    ; End of function SetMoveSfx

