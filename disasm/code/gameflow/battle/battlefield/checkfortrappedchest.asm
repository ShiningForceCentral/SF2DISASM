
; ASM FILE code\gameflow\battle\battlefield\checkfortrappedchest.asm :
; 0x1B16FE..0x1B1780 : Battlefield : Trapped chest checker function

; =============== S U B R O U T I N E =======================================

; In: d1.w, d2.w = x, y


CheckForTrappedChest:
                
                movem.l d1-a6,-(sp)
                move.w  d2,d7
                move.w  d1,d6
                move.w  #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpritesetSubsection
                move.w  d1,d5
                subi.w  #1,d5
                move.w  #COMBATANT_ENEMIES_START,d0
                tst.w   d1
                bne.s   loc_1B1724
                move.w  #-1,d0
                bra.w   loc_1B177A
loc_1B1724:
                
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d2
                cmp.b   d1,d6
                bne.s   loc_1B176A
                cmp.b   d2,d7
                bne.s   loc_1B176A
                jsr     j_GetActivationBitfield
                cmpi.w  #AIBITFIELD_HIDDEN|AIBITFIELD_PRIORITYMOD_0,d1 
                                                        ; $200 - region-triggered spawn
                bne.s   loc_1B176A
                jsr     j_GetAiRegion
                cmpi.w  #15,d1
                bne.s   loc_1B176A
                cmpi.w  #15,d2
                bne.s   loc_1B176A
                jsr     j_GetMaxHp
                tst.w   d1
                bne.s   loc_1B176A
                jsr     j_GetActivationBitfield
                bsr.w   ResetSpawningEnemyStats
                bra.w   loc_1B177A
loc_1B176A:
                
                addi.w  #1,d0
                adda.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,a0
                dbf     d5,loc_1B1724
                move.w  #-1,d0
loc_1B177A:
                
                movem.l (sp)+,d1-a6
                rts

    ; End of function CheckForTrappedChest

