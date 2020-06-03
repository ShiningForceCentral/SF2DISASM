
; ASM FILE code\common\scripting\map\resetalliesstats.asm :
; 0x478C6..0x4790E : CSC 55 function

; =============== S U B R O U T I N E =======================================

ResetAlliesBattleStats:
                
                movem.l d0-d7,-(sp)
                clr.w   d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7 ; HARDCODED max number of allies
loc_478CE:
                
                jsr     j_GetCurrentHP
                jsr     j_GetMaxHP
                jsr     j_SetCurrentHP
                jsr     j_GetMaxMP
                jsr     j_SetCurrentMP
                jsr     j_GetStatus
                andi.w  #7,d1
                jsr     j_SetStatus
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                addq.w  #1,d0
                dbf     d7,loc_478CE
                movem.l (sp)+,d0-d7
                rts

    ; End of function ResetAlliesBattleStats

