
; ASM FILE code\gameflow\battle\getcombatantstartingposition.asm :
; 0x1B169E..0x1B16FE : Combatant starting position getter function

; =============== S U B R O U T I N E =======================================

; Get starting X, Y for combatant d0.b -> d1.w, d2.w


GetCombatantStartingPosition:
                
                movem.l d0/d3-a6,-(sp)
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                move.w  #BATTLESPRITESET_SUBSECTION_ALLIES,d1
                bsr.s   GetBattleSpritesetSubsection
                cmp.b   d0,d1
                bge.s   @GetAllyEntryAddress
                move.w  #-1,d1          ; reset positions
                move.w  #-1,d2
                bra.w   @Done
@GetAllyEntryAddress:
                
                andi.w  #COMBATANT_MASK_ALL,d0
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d0
                adda.w  d0,a0
                bra.s   @GetStartingPositions
@Enemy:
                
                move.w  #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpritesetSubsection
                cmp.b   d0,d1
                bge.s   @GetEnemyEntryAddress
                move.w  #-1,d1          ; reset positions
                move.w  #-1,d2
                bra.w   @Done
@GetEnemyEntryAddress:
                
                andi.w  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d0
                adda.w  d0,a0
@GetStartingPositions:
                
                clr.w   d1
                clr.w   d2
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetCombatantStartingPosition

