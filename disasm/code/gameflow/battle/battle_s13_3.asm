
; ASM FILE code\gameflow\battle\battle_s13_3.asm :
; 0x1B15F8..0x1B1780 : Battle init, terrain, AI stuff to split more properly

; =============== S U B R O U T I N E =======================================

; Get coordinates for AI special move order d0.w -> d1.w, d2.w


GetAiSpecialMoveOrderCoordinates:
                
                movem.l d0/a0,-(sp)
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   @GetAiPointCoordinates
                
                ; Get position of combatant to follow
                jsr     j_GetCombatantY
                move.w  d1,d2
                jsr     j_GetCombatantX
                bra.s   @Done
@GetAiPointCoordinates:
                
                moveq   #BATTLESPRITESET_SUBSECTION_AI_POINTS,d1
                bsr.w   GetBattleSpritesetSubsection
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                add.w   d0,d0
                adda.w  d0,a0
                clr.w   d1
                clr.w   d2
                move.b  (a0),d1
                move.b  1(a0),d2
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetAiSpecialMoveOrderCoordinates


; =============== S U B R O U T I N E =======================================

; In: d1.w = subsection index
; Out: a0 = subsection address, d1.w = subsection size


GetBattleSpritesetSubsection:
                
                movem.l d0/d2/a1,-(sp)
                move.b  d1,d2
                clr.w   d1
                clr.w   d0
                getSavedByte CURRENT_BATTLE, d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
            if (STANDARD_BUILD=1)
                getPointer p_pt_BattleSpritesets, a0
            else
                lea     pt_BattleSpritesets(pc), a0
                nop
            endif
                movea.l (a0,d0.w),a0
                tst.b   d2
                beq.w   @ReturnInfo     ; 0 = Section sizes
                
                movea.l a0,a1           ; a1 = pointer to section sizes
                move.b  (a1),d1         ; allies size
                lea     BATTLESPRITESET_OFFSET_ALLY_ENTRIES(a0),a0
                subq.b  #1,d2
                beq.w   @ReturnInfo     ; 1 = Allies
                
                clr.l   d0
                move.b  BATTLESPRITESET_SIZEOFFSET_ENEMIES(a1),d1
                move.b  (a1),d0
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d0 ; allies number * entry size
                adda.l  d0,a0
                subq.b  #1,d2
                beq.w   @ReturnInfo     ; 2 = Enemies
                
                clr.l   d0
                move.b  BATTLESPRITESET_SIZEOFFSET_REGIONS(a1),d1
                move.b  BATTLESPRITESET_SIZEOFFSET_ENEMIES(a1),d0
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d0 ; enemies number * entry size
                adda.l  d0,a0
                subq.b  #1,d2
                beq.w   @ReturnInfo     ; 3 = AI-regions
                
                clr.l   d0
                move.b  BATTLESPRITESET_SIZEOFFSET_AI_POINTS(a1),d1
                move.b  BATTLESPRITESET_SIZEOFFSET_REGIONS(a1),d0
                mulu.w  #BATTLESPRITESET_REGION_ENTRY_SIZE,d0 ; regions number * entry size
                adda.l  d0,a0           ; 4 = AI-points
@ReturnInfo:
                
                movem.l (sp)+,d0/d2/a1
                rts

    ; End of function GetBattleSpritesetSubsection


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


; =============== S U B R O U T I N E =======================================

; related to player controlled movement on the battlefield
; 
; In: d1.w, d2.w = x, y


RegionTriggeredSpawn:
                
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
                cmpi.w  #$200,d1
                bne.s   loc_1B176A
                jsr     j_GetAiRegion
                cmpi.w  #$F,d1
                bne.s   loc_1B176A
                cmpi.w  #$F,d2
                bne.s   loc_1B176A
                jsr     j_GetMaxHp
                tst.w   d1
                bne.s   loc_1B176A
                jsr     j_GetActivationBitfield
            if (STANDARD_BUILD=1)
                jsr     ResetSpawningEnemyStats
            else
                bsr.w   ResetSpawningEnemyStats
            endif
                bra.w   loc_1B177A
loc_1B176A:
                
                addi.w  #1,d0
                adda.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,a0
                dbf     d5,loc_1B1724
                move.w  #-1,d0
loc_1B177A:
                
                movem.l (sp)+,d1-a6
                rts

    ; End of function RegionTriggeredSpawn

