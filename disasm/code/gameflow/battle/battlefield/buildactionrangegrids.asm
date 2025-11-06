
; ASM FILE code\gameflow\battle\battlefield\buildactionrangegrids.asm :
; 0xC3DE..0xC590 : Action range grids builder functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = moving combatant index


BuildMovementRangeGrid:
                
                movem.l d0-a6,-(sp)
                move.w  #-1,d3          ; set occupied flags
                bsr.w   UpdateOccupiedByOpponentsTerrain
                move.l  d0,-(sp)
                bsr.w   InitializeMovementArrays
                bsr.w   BuildMovementArrays
                move.l  (sp)+,d0
                move.w  #0,d3           ; clear occupied flags
                bsr.w   UpdateOccupiedByOpponentsTerrain
                movem.l (sp)+,d0-a6
                rts

    ; End of function BuildMovementRangeGrid


; =============== S U B R O U T I N E =======================================

; Build attack range grid for combatant d0.w (using spell range lists).


BuildAttackRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                eori.w  #$FFFF,d0       ; invert d0.w
                bsr.w   BuildTargetsArrayWithTeammatesOfTarget
                eori.w  #$FFFF,d0       ; revert d0.w
                bsr.w   GetAttackRange  ; d3.w, d4.w = max, min range
                move.w  d3,d2
                move.w  d4,d3
                moveq   #-1,d5
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                nop
                move.w  d2,d4
                lsl.w   #INDEX_SHIFT_COUNT,d4
                adda.w  d4,a1
                sub.b   d3,d2
@Loop:
                
                ; For each radius list from max -> min
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordinatesListToGrid
                subq.w  #1,d2
                bne.s   @Loop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function BuildAttackRangeGrid


; =============== S U B R O U T I N E =======================================

; Build range grid for item use spell.
; 
; In: d0.w = user combatant index, d1.w = item index


BuildSpellRangeGridForItemUse:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #SPELL_NOTHING,d1
                beq.s   @Done
                bsr.w   BuildSpellRangeGrid
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function BuildSpellRangeGridForItemUse


; =============== S U B R O U T I N E =======================================

; Build a grid of spaces targetable by a spell (uses spell definition and relative lists).
; 
; In: d0.w = caster combatant index, d1.w = spell index


BuildSpellRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetSpellDefinitionAddress
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyCaster
                
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   @TargetOpponentsForAllyCaster
                
                ; Target teammates for ally caster
                bsr.w   BuildTargetsArrayWithAllies
                bra.s   @Goto_Continue
@TargetOpponentsForAllyCaster:
                
                bsr.w   BuildTargetsArrayWithEnemies
@Goto_Continue:
                
                bra.s   @Continue
@EnemyCaster:
                
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   @TargetOpponentsForEnemyCaster
                
                ; Target teammates for enemy caster
                bsr.w   BuildTargetsArrayWithEnemies
                bra.s   @Continue
@TargetOpponentsForEnemyCaster:
                
                bsr.w   BuildTargetsArrayWithAllies
@Continue:
                
                moveq   #-1,d5
                moveq   #0,d2
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d2
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d3
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                nop
                move.w  d2,d4
                lsl.w   #INDEX_SHIFT_COUNT,d4
                adda.w  d4,a1
                sub.b   d3,d2
@Loop:
                
                ; For each radius list from max -> min
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordinatesListToGrid
                subq.w  #1,d2
                bne.s   @Loop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function BuildSpellRangeGrid


; =============== S U B R O U T I N E =======================================


BuildSpellRangeGridForItemGive:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                bsr.w   BuildTargetsArrayWithTeammatesOfTarget
                moveq   #-1,d5
                lea     SpellRange1(pc), a0
                nop
                bsr.w   ApplyRelativeCoordinatesListToGrid
                movem.l (sp)+,d0-a6
                rts

    ; End of function BuildSpellRangeGridForItemGive


; =============== S U B R O U T I N E =======================================

; Given a relative coordinates list and a source combatant,
;   mark movable-grid entries and add targets to TARGETS_LIST.
; 
;   In: a0 = address of relative coordinates list
;       d0.b = battle entity index
;       d5.b = ignore obstructed terrain if = 0


ApplyRelativeCoordinatesListToGrid:
                
                movem.l d0-a6,-(sp)
                
                ; Validate combatant's position
                jsr     GetCombatantX
                cmpi.w  #-1,d1
                beq.w   @Done
                
                move.w  d1,d3
                jsr     GetCombatantY
                move.w  d1,d4           ; d3.w,d4.w = X,Y
                clr.w   d7
                move.b  (a0)+,d7
                subq.w  #1,d7
@Loop:
                
                ; Compute absolute Y = baseY + relY, check < MAP_HEIGHT
                move.w  d4,d2
                add.b   1(a0),d2
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @NextCoordinates
                
                ; Compute absolute X = baseX + relX, check < MAP_WIDTH
                move.w  d3,d1
                add.b   (a0),d1
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @NextCoordinates
                
                tst.b   d5
                beq.s   @Continue
                
                ; If d5 flag indicates to respect obstructed terrain
                bsr.w   GetTerrain      
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                beq.s   @Continue
                
                bsr.w   SetMovableSpace 
@Continue:
                
                bsr.w   GetCombatantOccupyingSpace
                cmpi.b  #-1,d0
                beq.w   @NextCoordinates
                
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @NextCoordinates
                
                ; Add occupant to TARGETS_LIST if alive
                lea     ((TARGETS_LIST-$1000000)).w,a1
                adda.w  ((TARGETS_LIST_LENGTH-$1000000)).w,a1
                move.b  d0,(a1)
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
@NextCoordinates:
                
                addq.l  #BATTLEFIELD_COORDINATES_ENTRY_SIZE,a0
                dbf     d7,@Loop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ApplyRelativeCoordinatesListToGrid

