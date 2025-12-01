
; ASM FILE code\gameflow\battle\battlefield\checkfortrappedchest.asm :
; 0x1B16FE..0x1B1780 : Battlefield : Trapped chest checker function

; =============== S U B R O U T I N E =======================================

; In: d1.w, d2.w = X, Y  Out: d0.w = -1 if chest is not trapped


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
                bne.s   @Loop
                
                move.w  #-1,d0
                bra.w   @Done
@Loop:
                
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d2
                cmp.b   d1,d6
                bne.s   @Next
                
                cmp.b   d2,d7
                bne.s   @Next
                
                jsr     j_GetActivationBitfield
                cmpi.w  #AIBITFIELD_HIDDEN,d1   ; $200 - region-triggered spawn
                bne.s   @Next
                
                jsr     j_GetTriggerRegions
                cmpi.w  #AI_TRIGGER_REGION_NONE,d1
                bne.s   @Next
                
                cmpi.w  #AI_TRIGGER_REGION_NONE,d2
                bne.s   @Next
                
                jsr     j_GetMaxHp
                tst.w   d1
                bne.s   @Next
                
                jsr     j_GetActivationBitfield
                bsr.w   ResetSpawningEnemyStats
                bra.w   @Done
@Next:
                
                addi.w  #1,d0
                adda.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,a0
                dbf     d5,@Loop
                
                move.w  #-1,d0
@Done:
                
                movem.l (sp)+,d1-a6
                rts

    ; End of function CheckForTrappedChest

