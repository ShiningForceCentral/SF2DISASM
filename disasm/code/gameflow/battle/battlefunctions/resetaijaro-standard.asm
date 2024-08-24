
; ASM FILE code\gameflow\battle\battlefunctions\resetaijaro-standard :
; 

; =============== S U B R O U T I N E =======================================

; Resets Jaro's stats, makes him leave the battle party and the Force,
;  and clears the flag indicating that he switched sides when leaving
;  battle 32 (en route to Moun) before completing it.

ResetAiJaro:      
                
                movem.w d0-d1,-(sp)
                checkSavedByte #BATTLE_TO_MOUN, CURRENT_BATTLE
                bne.s   @Done
                
                move.w  #BATTLE_COMPLETED_FLAGS_START+BATTLE_TO_MOUN,d1
                jsr     CheckFlag
                bne.s   @Done
                
                move.w  #386,d1         ; Set during battle 32, after Jaro switches sides
                jsr     ClearFlag
                move.w  #ALLY_JARO,d0
                clr.w   d1
                
                pea     @Done(pc)
                pea     LeaveForce
                pea     LeaveBattleParty
                pea     ApplyStatusEffectsAndItemsOnStats
                pea     SetCurrentMp
                pea     GetMaxMp
                pea     SetCurrentHp
                pea     GetMaxHp
                jmp     SetStatusEffects
                
@Done:          movem.w (sp)+,d0-d1
                rts

    ; End of function ResetJaro

