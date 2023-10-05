
; ASM FILE code\gameflow\battle\battlefield\battlefieldengine_3.asm :
; 0xC380..0xCD68 : Battlefield engine

; =============== S U B R O U T I N E =======================================

; In: D1 = spell index
; Out: D3 = max range, D4 = min range


GetSpellRange:
                
                movem.l d0-d2/d5-a6,-(sp)
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
                movem.l (sp)+,d0-d2/d5-a6
                rts

    ; End of function GetSpellRange


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; Out: D3 = max range, D4 = min range


GetItemRange:
                
                movem.l d0-d2/d5-a6,-(sp)
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
                movem.l (sp)+,d0-d2/d5-a6
                rts

    ; End of function GetItemRange


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; Out: D1 = whether combatant is inflicted with MUDDLE 2 (0=no, 1=yes)


CheckMuddled2:
                
                movem.l d0/d2-a6,-(sp)
                bsr.w   GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d1
                tst.w   d1
                beq.s   @NotMuddled1
                move.w  d2,d1
                andi.w  #STATUSEFFECT_MUDDLE2,d1
                tst.w   d1
                beq.s   @NotMuddled2
                move.w  #1,d1
                bra.s   @BothMuddled1and2
@NotMuddled2:
                
                clr.w   d1
@BothMuddled1and2:
                
                bra.s   @Done
@NotMuddled1:
                
                clr.w   d1
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CheckMuddled2


; =============== S U B R O U T I N E =======================================


CreateMovementRangeGrid:
                
                movem.l d0-a6,-(sp)
                move.w  #-1,d3          ; set occupied flags
                bsr.w   UpdateBattleTerrainOccupiedByOpponents
                move.l  d0,-(sp)
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                move.l  (sp)+,d0
                move.w  #0,d3           ; clear occupied flags
                bsr.w   UpdateBattleTerrainOccupiedByOpponents
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateMovementRangeGrid


; =============== S U B R O U T I N E =======================================


CreateAttackRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                eori.w  #$FFFF,d0
                bsr.w   PopulateTargetsArrayWithOpponents
                eori.w  #$FFFF,d0
                bsr.w   GetAttackRange  
                move.w  d3,d2
                move.w  d4,d3
                moveq   #-1,d5
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                nop
                move.w  d2,d4
                lsl.w   #2,d4
                adda.w  d4,a1
                sub.b   d3,d2
@Loop:
                
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordinatesListToGrid
                subq.w  #1,d2
                bne.s   @Loop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateAttackRangeGrid


; =============== S U B R O U T I N E =======================================

; In: D0 = user combatant index
;     D1 = item index


CreateItemRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #SPELL_NOTHING,d1
                beq.s   @Done
                bsr.w   CreateSpellRangeGrid
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateItemRangeGrid


; =============== S U B R O U T I N E =======================================

; Clear and update target/movable grids based on spell properties
; 
;       In: D0 = caster combatant index
;           D1 = spell index


CreateSpellRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     FindSpellDefAddress
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_C4AA
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   loc_C4A4
                bsr.w   PopulateTargetsArrayWithAllies
                bra.s   loc_C4A8
loc_C4A4:
                
                bsr.w   PopulateTargetsArrayWithEnemies
loc_C4A8:
                
                bra.s   loc_C4BC
loc_C4AA:
                
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   loc_C4B8
                bsr.w   PopulateTargetsArrayWithEnemies
                bra.s   loc_C4BC
loc_C4B8:
                
                bsr.w   PopulateTargetsArrayWithAllies
loc_C4BC:
                
                moveq   #-1,d5
                moveq   #0,d2
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d2
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d3
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                nop
                move.w  d2,d4
                lsl.w   #2,d4
                adda.w  d4,a1
                sub.b   d3,d2
loc_C4D8:
                
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordinatesListToGrid
                subq.w  #1,d2
                bne.s   loc_C4D8
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateSpellRangeGrid


; =============== S U B R O U T I N E =======================================


PopulateTargetableGrid_GiveItem:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetsArray
                bsr.w   ClearTotalMovecostsAndMovableGridArrays
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                bsr.w   PopulateTargetsArrayWithOpponents
                moveq   #-1,d5
                lea     SpellRange1(pc), a0
                nop
                bsr.w   ApplyRelativeCoordinatesListToGrid
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetableGrid_GiveItem


; =============== S U B R O U T I N E =======================================

; Apply relative coordinates list to movable grid and add any targets to target list.
; 
;   In: a0 = address of relative coordinates list
;       d0.b = battle entity index
;       d5.b = ignore obstructed terrain if = 0


ApplyRelativeCoordinatesListToGrid:
                
                movem.l d0-a6,-(sp)
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
                
                move.w  d4,d2
                add.b   1(a0),d2
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @NextCoordinates
                move.w  d3,d1
                add.b   (a0),d1
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @NextCoordinates
                tst.b   d5
                beq.s   @Continue
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
                lea     ((TARGETS_LIST-$1000000)).w,a1
                adda.w  ((TARGETS_LIST_LENGTH-$1000000)).w,a1
                move.b  d0,(a1)
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
@NextCoordinates:
                
                addq.l  #2,a0
                dbf     d7,@Loop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ApplyRelativeCoordinatesListToGrid

pt_SpellRanges: dc.l SpellRange0
                dc.l SpellRange1
                dc.l SpellRange2
                dc.l SpellRange3
            if (STANDARD_BUILD&EXPANDED_RANGES=1)
                dc.l SpellRange4
                dc.l SpellRange5
                dc.l SpellRange6
                dc.l SpellRange7
            endif
            
SpellRange0:    dc.b 1
                dc.b  0,  0
                
SpellRange1:    dc.b 4
                dc.b  0,  1
                dc.b  1,  0
                dc.b  0, -1
                dc.b -1,  0
                
SpellRange2:    dc.b 8
                dc.b  0, -2
                dc.b -1, -1
                dc.b -2,  0
                dc.b -1,  1
                dc.b  0,  2
                dc.b  1,  1
                dc.b  2,  0
                dc.b  1, -1
                
SpellRange3:    dc.b 12
                dc.b  0,  3
                dc.b  1,  2
                dc.b  2,  1
                dc.b  3,  0
                dc.b  2, -1
                dc.b  1, -2
                dc.b  0, -3
                dc.b -1, -2
                dc.b -2, -1
                dc.b -3,  0
                dc.b -2,  1
                dc.b -1,  2
                
            if (STANDARD_BUILD&EXPANDED_RANGES=1)
SpellRange4:    dc.b 16
                dc.b  0, -4
                dc.b -1, -3
                dc.b -2, -2
                dc.b -3, -1
                dc.b -4,  0
                dc.b -3,  1
                dc.b -2,  2
                dc.b -1,  3
                dc.b  0,  4
                dc.b  1,  3
                dc.b  2,  2
                dc.b  3,  1
                dc.b  4,  0
                dc.b  3, -1
                dc.b  2, -2
                dc.b  1, -3
                
SpellRange5:    dc.b 20
                dc.b  0, -5
                dc.b -1, -4
                dc.b -2, -3
                dc.b -3, -2
                dc.b -4, -1
                dc.b -5,  0
                dc.b -4,  1
                dc.b -3,  2
                dc.b -2,  3
                dc.b -1,  4
                dc.b  0,  5
                dc.b  1,  4
                dc.b  2,  3
                dc.b  3,  2
                dc.b  4,  1
                dc.b  5,  0
                dc.b  4, -1
                dc.b  3, -2
                dc.b  2, -3
                dc.b  1, -4
                
SpellRange6:    dc.b 24
                dc.b  0, -6
                dc.b -1, -5
                dc.b -2, -4
                dc.b -3, -3
                dc.b -4, -2
                dc.b -5, -1
                dc.b -6,  0
                dc.b -5,  1
                dc.b -4,  2
                dc.b -3,  3
                dc.b -2,  4
                dc.b -1,  5
                dc.b  0,  6
                dc.b  1,  5
                dc.b  2,  4
                dc.b  3,  3
                dc.b  4,  2
                dc.b  5,  1
                dc.b  6,  0
                dc.b  5, -1
                dc.b  4, -2
                dc.b  3, -3
                dc.b  2, -4
                dc.b  1, -5
                
SpellRange7:    dc.b 28
                dc.b  0, -7
                dc.b -1, -6
                dc.b -2, -5
                dc.b -3, -4
                dc.b -4, -3
                dc.b -5, -2
                dc.b -6, -1
                dc.b -7,  0
                dc.b -6,  1
                dc.b -5,  2
                dc.b -4,  3
                dc.b -3,  4
                dc.b -2,  5
                dc.b -1,  6
                dc.b  0,  7
                dc.b  1,  6
                dc.b  2,  5
                dc.b  3,  4
                dc.b  4,  3
                dc.b  5,  2
                dc.b  6,  1
                dc.b  7,  0
                dc.b  6, -1
                dc.b  5, -2
                dc.b  4, -3
                dc.b  3, -4
                dc.b  2, -5
                dc.b  1, -6
            endif

; =============== S U B R O U T I N E =======================================

; In: d0.w = actor combatant index
;     d1.w = item index


PopulateTargetableGrid_UseItem:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #-1,d1
                beq.s   @Done
                
                bsr.w   PopulateTargetableGrid_CastSpell
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetableGrid_UseItem


; =============== S U B R O U T I N E =======================================

; unused


sub_C5FA:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #-1,d1
                beq.s   @Done
                
                bsr.w   PopulateTargetableGrid
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_C5FA


; =============== S U B R O U T I N E =======================================

; In: d0.w = actor combatant index
;     d1.w = spell index


PopulateTargetableGrid_CastSpell:
                
                cmpi.b  #SPELL_B_ROCK,d1
                bne.s   @Continue
                bsr.w   PopulateTargetsArrayWithAllCombatants
                bra.s   PopulateTargetableGrid
@Continue:
                
                bsr.w   PopulateTargetsArrayWithOpponents

    ; End of function PopulateTargetableGrid_CastSpell


; =============== S U B R O U T I N E =======================================

; In: d1.b = spell entry


PopulateTargetableGrid:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     FindSpellDefAddress
                cmpi.b  #SPELL_AURA|SPELL_LV4,d1
                beq.w   @ChooseTargets
                cmpi.b  #SPELL_SHINE,d1
                beq.w   @ChooseTargets
                moveq   #0,d2
                move.b  SPELLDEF_OFFSET_RADIUS(a0),d2
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                move.w  d2,d4
                lsl.w   #2,d4
                adda.w  d4,a1
                cmpi.b  #SPELL_B_ROCK,d1
                bne.s   @AvoidSelfTarget
                subq.b  #1,d2
@AvoidSelfTarget:
                
                moveq   #0,d5
@PopulateTargetCoordinates_Loop:
                
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordinatesListToGrid
                subq.w  #1,d2
                bne.s   @PopulateTargetCoordinates_Loop
                bra.w   @Done
@ChooseTargets:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @TargetEnemies
                bsr.w   PopulateTargetsListWithAllies
                bra.s   @Done
@TargetEnemies:
                
                bsr.w   PopulateTargetsListWithEnemies
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetableGrid


; =============== S U B R O U T I N E =======================================


PopulateTargetsListWithAllies:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   @Continue
@Loop:
                
                addq.w  #1,d0
@Continue:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   @Done
                jsr     GetCombatantX
                cmpi.b  #-1,d1
                beq.w   @Next
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Next
                move.b  d0,(a0)
                addq.l  #1,a0
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
@Next:
                
                bra.s   @Loop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetsListWithAllies


; =============== S U B R O U T I N E =======================================


PopulateTargetsListWithEnemies:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  #COMBATANT_ENEMIES_START,d0
                bra.s   @Continue
@Loop:
                
                addq.w  #1,d0
@Continue:
                
                cmpi.w  #COMBATANT_ENEMIES_END,d0
                bgt.s   @Done
                jsr     GetCombatantX
                cmpi.b  #-1,d1
                beq.w   @Next
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Next
                move.b  d0,(a0)
                addq.l  #1,a0
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
@Next:
                
                bra.s   @Loop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetsListWithEnemies


; =============== S U B R O U T I N E =======================================

; In: d1.b,d2.b = current X,Y
;     d3.b,d4.b = max,min range
; 
; Out: d1.b,d2.b = destination X,Y (-1 if no position is available)

movecost = -5
destinationY = -4
destinationX = -3
currentY = -2
currentX = -1

GetClosestAttackPosition:
                
                module
                movem.l d0/d3-a6,-(sp)
                link    a6,#-6
                move.b  d1,currentX(a6)
                move.b  d2,currentY(a6)
                move.b  #-1,destinationX(a6)
                move.b  #-1,destinationY(a6)
                move.b  #-1,movecost(a6)
                cmpi.b  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   loc_C7E2
                cmpi.b  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   loc_C7E2
                move.b  d3,d6
                neg.b   d6              ; d6.b = negative max range
@Start:
                
                move.b  d3,d5
                move.b  d6,d0
                or.b    d0,d0
                bge.s   loc_C75A
                neg.b   d0
loc_C75A:
                
                sub.b   d0,d5
                neg.b   d5
                move.b  d3,d0
loc_C760:
                
                cmp.b   d4,d0
                bcs.w   loc_C7BE
                move.b  currentX(a6),d1
                add.b   d5,d1
                cmpi.b  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   loc_C7BE
                move.b  currentY(a6),d2
                add.b   d6,d2
                cmpi.b  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   loc_C7BE
                bsr.w   GetMoveCostToDestination
                tst.w   d0
                beq.w   @Done           ; already in range, so end because it can't get cheaper
                btst    #15,d0
                bne.w   loc_C7BE
                cmp.b   movecost(a6),d0
                bcc.w   loc_C7BE
                move.b  d0,d7
                andi.w  #BYTE_MASK,d1
                andi.w  #BYTE_MASK,d2
                bsr.w   GetCombatantOccupyingSpace
                cmpi.b  #-1,d0
                bne.w   loc_C7BE        ; already someone there, so it can't be chosen
                move.b  d7,movecost(a6)
                move.b  d1,destinationX(a6)
                move.b  d2,destinationY(a6)
loc_C7BE:
                
                addq.b  #1,d5
                move.b  d5,d1
                or.b    d1,d1
                bge.s   loc_C7C8
                neg.b   d1
loc_C7C8:
                
                move.b  d6,d0
                or.b    d0,d0
                bge.s   loc_C7D0
                neg.b   d0
loc_C7D0:
                
                add.b   d1,d0
                cmp.b   d3,d0
                bls.s   loc_C760
                cmp.b   d3,d6
                beq.w   loc_C7E2
                addq.b  #1,d6
                bra.w   @Start
loc_C7E2:
                
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetClosestAttackPosition

                modend

; =============== S U B R O U T I N E =======================================

; Populate array of targets with alignment opposite to d0.w
; (Note: enemy bit is flipped prior to calling this routine.)


PopulateTargetsArrayWithOpponents:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   PopulateTargetsArrayWithEnemies

    ; End of function PopulateTargetsArrayWithOpponents


; =============== S U B R O U T I N E =======================================


PopulateTargetsArrayWithAllies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetsArray
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   PopulateTargetsArray

    ; End of function PopulateTargetsArrayWithAllies


; =============== S U B R O U T I N E =======================================


PopulateTargetsArrayWithEnemies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetsArray
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                bra.w   PopulateTargetsArray

    ; End of function PopulateTargetsArrayWithEnemies


; =============== S U B R O U T I N E =======================================

; Populate an array containing all combatants present on the battlefield.


PopulateTargetsArrayWithAllCombatants:
                
                movem.l d0-a0,-(sp)
                bsr.s   PopulateTargetsArrayWithAllies
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7

    ; End of function PopulateTargetsArrayWithAllCombatants


; =============== S U B R O U T I N E =======================================


PopulateTargetsArray:
                
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Next
                
                jsr     GetActivationBitfield
                btst    #3,d1
                beq.s   @Continue
                bra.w   @Next
@Continue:
                
                jsr     GetCombatantY
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d1
                bcc.w   @Next
                move.w  d1,d2
                jsr     GetCombatantX
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @Next
                
                ; d1.w,d2.w = X,Y
                lea     (FF5600_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  d0,(a0)
@Next:
                
                addq.b  #1,d0
                dbf     d7,PopulateTargetsArray
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function PopulateTargetsArray


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant
;     d3.w = 0 to clear flag, set otherwise


UpdateBattleTerrainOccupiedByOpponents:
                
                module
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.w   UpdateBattleTerrainOccupiedByEnemies

    ; End of function UpdateBattleTerrainOccupiedByOpponents


; =============== S U B R O U T I N E =======================================


UpdateBattleTerrainOccupiedByAllies:
                
                movem.l d0-a0,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   UpdateBattleTerrainOccupiedFlag

    ; End of function UpdateBattleTerrainOccupiedByAllies


; =============== S U B R O U T I N E =======================================


UpdateBattleTerrainOccupiedByEnemies:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7

    ; End of function UpdateBattleTerrainOccupiedByEnemies


; =============== S U B R O U T I N E =======================================

; In: d3.w = 0 to clear flag, set otherwise


UpdateBattleTerrainOccupiedFlag:
                
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Next
                jsr     GetCombatantY
                move.w  d1,d2
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @Next
                jsr     GetCombatantX
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @Next
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                bsr.w   ConvertCoordinatesToAddress
                move.b  (a0),d4
                cmpi.b  #TERRAIN_OBSTRUCTED,d4
                bne.s   loc_C8D8
                bra.w   @Next           ; move on if space is obstructed
loc_C8D8:
                
                btst    #6,d4
                beq.s   loc_C8E6
                tst.w   d3
                bne.s   loc_C8E6
                bra.w   @Next
loc_C8E6:
                
                tst.w   d3
                bne.s   loc_C8F0
                bclr    #7,(a0)
                bra.s   @Next
loc_C8F0:
                
                bset    #7,(a0)
@Next:
                
                addq.b  #1,d0
                dbf     d7,UpdateBattleTerrainOccupiedFlag
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function UpdateBattleTerrainOccupiedFlag

                modend

; =============== S U B R O U T I N E =======================================

; In: d3.w = clear bit 7 if = 0, set otherwise


UpdateMovableGridArray:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   @Next
                jsr     GetCombatantY
                move.w  d1,d2
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @Next
                jsr     GetCombatantX
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @Next
                lea     (FF4D00_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordinatesToAddress
                tst.w   d3
                bne.s   @Set
                bclr    #7,(a0)
                bra.s   @Next
@Set:
                
                bset    #7,(a0)
@Next:
                
                addq.b  #1,d0
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function UpdateMovableGridArray


; =============== S U B R O U T I N E =======================================

; Populate lists of targets reachable by item, spell, and regular attack,
;  then give each target a priority value.
; 
; To allow AI to cast more than one spell, this must be adjusted.
; 
;       In: D0, D7 = character index
;           D1, D6 = extra AI variable (values of 0-3)


PrioritizeReachableTargets:
                
                movem.l d1-a2,-(sp)
                move.l  d0,-(sp)
                moveq   #-1,d3          ; If d3<0 then clear bit 7 when calling UpdateTargetsList
                bsr.w   UpdateBattleTerrainOccupiedByOpponents ; List all living opponents (enemies or allies, depending upon the character index)
                                        ;  and clear bit 7 of the map data.
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                
                ; Check Item Use
                moveq   #0,d3
                bsr.w   UpdateBattleTerrainOccupiedByOpponents
                clr.w   ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w
                clr.w   ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w
                clr.w   ((FF8804_LOADING_SPACE-$1000000)).w ; # targets reachable by attack
                move.l  (sp)+,d0
                moveq   #0,d3
                bsr.w   GetNextUsableAttackItem
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   @CheckSpellCast
                bsr.w   PopulateTargetsArrayWithAllCombatants
                bsr.w   GetTargetsReachableByItem
                move.w  ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @CheckSpellCast ; if no targets are reachable by item, skip ahead to check for targets reachable by spell
                move.l  d1,-(sp)        ; store the attack item since it has valid targets
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyItemUser
                
                ; Ally item user
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledAllyItemUser
                bsr.w   PopulateTargetsArrayWithEnemies
                bra.s   @Goto_PopulateItemPrioritiesList
@MuddledAllyItemUser:
                
                bsr.w   PopulateTargetsArrayWithAllies
@Goto_PopulateItemPrioritiesList:
                
                bra.s   @PopulateItemPrioritiesList
@EnemyItemUser:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledEnemyItemUser
                bsr.w   PopulateTargetsArrayWithAllies
                bra.s   @PopulateItemPrioritiesList
@MuddledEnemyItemUser:
                
                bsr.w   PopulateTargetsArrayWithEnemies
                
                ; At this point (FF5600_LOADING_SPACE) has the list of all opposing combatants that could be selected as a target, if they were in range
@PopulateItemPrioritiesList:
                
                move.l  (sp)+,d1        ; d1 = attack item index
                lea     (ATTACK_COMMAND_ITEM_SLOT).l,a0
                move.w  d2,(a0)
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                lea     ((TARGETS_REACHABLE_BY_ITEM_LIST-$1000000)).w,a0
                lea     ((ITEM_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a1
                lea     ((ITEM_TARGET_PRIORITIES_LIST-$1000000)).w,a2
@PopulateItemPrioritiesList_Loop:
                
                move.b  (a0,d7.w),d2    ; d2 = defender
                move.b  (a1,d7.w),d5    ; d5 = movement to reach target
                bsr.w   CalculateAttackTargetPriority
                move.b  d6,(a2,d7.w)    ; d6 = target priority from using the item (or attacking if the item has no spell to use)
                dbf     d7,@PopulateItemPrioritiesList_Loop
@CheckSpellCast:
                
                moveq   #0,d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.w   @CheckAttack    ; if no attack spell, skip this step
                bsr.w   PopulateTargetsArrayWithAllCombatants
                bsr.w   GetTargetsReachableBySpell
                move.w  ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @CheckAttack    ; if no targets are reachable by spell, skip ahead to check for targets reachable by physical attack
                move.l  d1,-(sp)        ; store the attack spell
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemySpellCaster
                
                ; Ally spell caster
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledAllySpellCaster
                bsr.w   PopulateTargetsArrayWithEnemies
                bra.s   @Goto_PopulateSpellPrioritiesList
@MuddledAllySpellCaster:
                
                bsr.w   PopulateTargetsArrayWithAllies
@Goto_PopulateSpellPrioritiesList:
                
                bra.s   @PopulateSpellPrioritiesList
@EnemySpellCaster:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledEnemySpellCaster
                bsr.w   PopulateTargetsArrayWithAllies
                bra.s   @PopulateSpellPrioritiesList
@MuddledEnemySpellCaster:
                
                bsr.w   PopulateTargetsArrayWithEnemies
                
                ; At this point (FF5600_LOADING_SPACE) has the list of all opposing combatants that could be selected as a target, if they were in range
@PopulateSpellPrioritiesList:
                
                move.l  (sp)+,d1        ; d1 = spell index
                lea     (ATTACK_COMMAND_SPELL).l,a0
                move.w  d1,(a0)
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((SPELL_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
@PopulateSpellPrioritiesList_Loop:
                
                move.b  (a0,d7.w),d2    ; d2 = defender
                move.b  (a1,d7.w),d5    ; d5 = movement to reach target
                bsr.w   CalculateAttackTargetPriority
                move.b  d6,(a2,d7.w)    ; d6 = target priority (higher is better)
                dbf     d7,@PopulateSpellPrioritiesList_Loop
@CheckAttack:
                
                bsr.w   PopulateTargetsArrayWithAllCombatants
                bsr.w   GetTargetsReachableByAttack
                move.w  ((FF8804_LOADING_SPACE-$1000000)).w,d7 ; # targets reachable
                subq.w  #1,d7
                bcs.w   @Done           ; if no targets are reachable by physical attack, skip to end
                move.l  d1,-(sp)        ; unnecessary
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyAttacker
                
                ; Ally attacker
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledAllyAttacker
                bsr.w   PopulateTargetsArrayWithEnemies
                bra.s   @Goto_PopulateAttackPrioritiesList
@MuddledAllyAttacker:
                
                bsr.w   PopulateTargetsArrayWithAllies
@Goto_PopulateAttackPrioritiesList:
                
                bra.s   @PopulateAttackPrioritiesList
@EnemyAttacker:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledEnemyAttacker
                bsr.w   PopulateTargetsArrayWithAllies
                bra.s   @PopulateAttackPrioritiesList
@MuddledEnemyAttacker:
                
                bsr.w   PopulateTargetsArrayWithEnemies
@PopulateAttackPrioritiesList:
                
                move.l  (sp)+,d1        ; unnecessary
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a0
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a1
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a2
@PopulateAttackPrioritiesList_Loop:
                
                move.b  (a0,d7.w),d2    ; d2 = defender
                move.b  (a1,d7.w),d5    ; d5 = movement to reach target
                move.b  #SPELL_NOTHING,d1
                bsr.w   CalculateAttackTargetPriority
                move.b  d6,(a2,d7.w)    ; d6 = target priority (higher is better)
                dbf     d7,@PopulateAttackPrioritiesList_Loop
                
                bsr.w   PopulateTargetsArrayWithAllCombatants
@Done:
                
                movem.l (sp)+,d1-a2
                rts

    ; End of function PrioritizeReachableTargets


; =============== S U B R O U T I N E =======================================

; In: A0 = list of reachable targets
;     A1 = movement to each reachable target
;     A2 = 
;     D0 = caster index
;     D1 = spell index
;     D2 = target of the spell
; 
; Out: D6 = target priority (higher is better)


CalculateAttackTargetPriority:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #0,d6           ; d6 = that weird extra AI value, so this just clears it
                cmpi.b  #SPELL_NOTHING,d1
                bne.s   @Spell
                
                ; Regular attack
                move.b  d2,d1           ; d1 = target
                bsr.w   AdjustAttackTargetPriorityForDifficulty
                bra.s   @Done
@Spell:
                
                move.b  d0,d3           ; d3 = caster
                move.b  d2,d0           ; d0 = target
                bsr.w   PopulateTargetableGrid ; insert the list of all who would be affected by the spell in TARGETS_LIST
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                beq.s   @Done
                move.b  d3,d0           ; d0 = caster
                bsr.w   AdjustSpellTargetPriorityForDifficulty
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function CalculateAttackTargetPriority


; =============== S U B R O U T I N E =======================================

; This first calculates expected max damage from a physical attack
;  and places that value into d6.
; 
; This then calls one of the difficulty-based subroutines,
;  which sets d6 = target priority value instead (using the
;  "remaining HP of target" as a key part of the target priority).
; 
;       In:  D0 = attacker, D1 = defender
;       Out: D6 = target priority (higher number = better target)


AdjustAttackTargetPriorityForDifficulty:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.b  d1,d3           ; d3 = defender
                move.b  d0,d4           ; d4 = attacker
                bsr.w   CalculatePotentialDamage
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @Ally
                jsr     GetActivationBitfield
                move.w  d1,d2
                rol.w   #4,d2
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                bra.s   @Continue
@Ally:
                
                move.w  #2,d2
@Continue:
                
                move.l  d1,-(sp)
                bsr.w   GetDifficulty   
                mulu.w  #4,d1
                add.w   d1,d2
                move.l  (sp)+,d1
                lsl.w   #INDEX_SHIFT_COUNT,d2
                movea.l pt_TargetPriorityScripts(pc,d2.w),a0
                move.b  d3,d0
                bsr.w   CalculatePotentialRemainingHp
                clr.w   d7
                jsr     (a0)            ; Execute target priority adjustment script
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AdjustAttackTargetPriorityForDifficulty

pt_TargetPriorityScripts:
                
; In: D0 = defender index
;     D1 = defenders remaining HP after taking theoretical max damage from an attack (prior routines)
;     D4 = attacker index (the one attacking or casting the offensive spell)
;     D7 = 0 if physical attack, 1 if magical
;
; Out: D6 = priority of the action
                
                dc.l TargetPriorityScript1
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript3
                dc.l TargetPriorityScript4
                dc.l TargetPriorityScript1
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript1
                dc.l TargetPriorityScript4
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript2
                dc.l TargetPriorityScript2

; =============== S U B R O U T I N E =======================================

; This first calculates expected spell damage and then calls one of the
;  difficulty-based subroutines to calculate target priority.
; 
; It then sums these priority values for each enemy in the AOE and returns the result.
; 
;       In:  d0 = attacker, d1 = spell index
;       Out: d6 = sum of target priority of all targets in the AOE


AdjustSpellTargetPriorityForDifficulty:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.w  d0,d4
                move.b  d1,d3
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @Ally
                jsr     GetActivationBitfield
                move.w  d1,d2
                rol.w   #4,d2
                andi.w  #3,d2
                bra.s   @Continue
@Ally:
                
                move.w  #2,d2
@Continue:
                
                move.l  d1,-(sp)
                bsr.w   GetDifficulty   
                mulu.w  #4,d1
                add.w   d1,d2
                move.l  (sp)+,d1
                lsl.w   #INDEX_SHIFT_COUNT,d2
                movea.l pt_TargetPriorityScripts(pc,d2.w),a0
                move.b  d3,d1
                moveq   #0,d3
                lea     ((TARGETS_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_CC04
loc_CBEA:
                
                move.b  (a1)+,d0
                bsr.w   GetSpellPowerAdjustedForResistance
                bsr.w   CalculatePotentialRemainingHp
                move.l  d7,-(sp)
                move.w  #1,d7
                jsr     (a0)            ; Execute target priority adjustment script
                move.l  (sp)+,d7
                add.w   d6,d3
                dbf     d7,loc_CBEA
loc_CC04:
                
                move.w  d3,d6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AdjustSpellTargetPriorityForDifficulty


; =============== S U B R O U T I N E =======================================

; In: D0 = attacker, D1 = defender
; Out: D6 = max potential physical damage value, adjusted for land effect


CalculatePotentialDamage:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.b  d1,d2
                jsr     GetCurrentAtt
                move.b  d2,d0
                move.w  d1,d2
                jsr     GetCurrentDef
                sub.w   d1,d2
                bhi.s   @Continue
                moveq   #1,d2           ; min damage = 1
@Continue:
                
                move.w  d2,d6
                jsr     GetLandEffectSetting
                move.w  #256,d2         ; if land effect displays "0%", do not reduce damage
                tst.b   d1
                beq.w   @ApplyLandEffect
                move.w  #230,d2         ; else if land effect displays "15%", reduce damage to 230/256
                cmpi.b  #1,d1
                beq.w   @ApplyLandEffect
                move.w  #205,d2         ; otherwise, reduce damage to 205/256
@ApplyLandEffect:
                
                mulu.w  d2,d6
                lsr.w   #BYTE_SHIFT_COUNT,d6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function CalculatePotentialDamage


; =============== S U B R O U T I N E =======================================

; In: D0 = target combatant index
;     D1 = spell index
; 
; Out: D6 = adjusted power


GetSpellPowerAdjustedForResistance:
                
                movem.l d0-d5/d7-a0,-(sp)
                bsr.w   GetResistanceToSpell
                jsr     FindSpellDefAddress
                moveq   #0,d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                move.w  d6,d3
                lsr.w   #2,d3           ; D3 = spellPower/4
                cmpi.b  #RESISTANCESETTING_MINOR,d2 ; check if target has minor resistance
                bne.s   @CheckMajorResistance
                sub.w   d3,d6           ; -25% spell power
@CheckMajorResistance:
                
                cmpi.b  #RESISTANCESETTING_MAJOR,d2
                bne.s   @CheckWeakness
                lsr.w   #1,d6           ; -50% spell power
@CheckWeakness:
                
                cmpi.b  #RESISTANCESETTING_WEAKNESS,d2
                bne.s   @Done
                add.w   d3,d6           ; +25% spell power
@Done:
                
                movem.l (sp)+,d0-d5/d7-a0
                rts

    ; End of function GetSpellPowerAdjustedForResistance


; =============== S U B R O U T I N E =======================================

; In: D0 = target index, D6 = potential damage
; Out: D1 = target's potential remaining HP


CalculatePotentialRemainingHp:
                
                movem.l d0/d2-a6,-(sp)
                jsr     GetCurrentHp
                sub.w   d6,d1
                bcc.s   @Continue
                moveq   #0,d1           ; min remaining HP = 0
@Continue:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CalculatePotentialRemainingHp


; =============== S U B R O U T I N E =======================================

; +1 base priority
; +15 if target is expected to die
; +2 if target is the same as last turn's target


TargetPriorityScript1:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6           ; minimum damage is 1
                tst.w   d1
                bne.s   loc_CCAE
                addi.w  #15,d6          ; if the defender is expected to die from the attack, +15 priority
loc_CCAE:
                
                lea     (AI_LAST_TARGET_TABLE).l,a1
                clr.w   d5
                move.b  d4,d5
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d5
                clr.w   d7
                move.b  (a1,d5.w),d7    ; d7 = who the enemy targeted last
                cmp.b   d0,d7
                bne.s   loc_CCCA
                addi.w  #2,d6           ; if the defender is the same that the monster targeted on the monster's prior turn, add 2 to priority (this is how targets become "sticky")
loc_CCCA:
                
                bsr.w   AdjustTargetPriorityForAlly
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function TargetPriorityScript1


; =============== S U B R O U T I N E =======================================

; +1 base priority
; +15 if target is expected to die
; +1 if target loses more than 2/3 of remaining health
; +1 if target is brought under 20% health
; +2 if target is the same as last turn's target


TargetPriorityScript2:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6           ; minimum damage is 1
                tst.w   d1
                bne.s   loc_CCE2
                addi.w  #15,d6          ; if the defender is expected to die from the attack, +15 priority
loc_CCE2:
                
                bsr.w   sub_D2F8
                bcs.s   loc_CCEA
                addq.w  #1,d6           ; +1 target priority if the attack does more than 2/3rds of defenders remaining health
loc_CCEA:
                
                bsr.w   sub_D362
                bcs.s   loc_CCF2
                addq.w  #1,d6           ; +1 target priority if defender is expected to be left with less than 20% of max health.
loc_CCF2:
                
                lea     (AI_LAST_TARGET_TABLE).l,a1
                clr.w   d5
                move.b  d4,d5           ; d5 = attacker index
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d5
                clr.w   d7
                move.b  (a1,d5.w),d7    ; d7 = who the enemy targeted last
                cmp.b   d0,d7
                bne.s   loc_CD0E
                addi.w  #2,d6           ; if the defender is the same that the monster targeted on the monster's prior turn, +2 priority
loc_CD0E:
                
                bsr.w   AdjustTargetPriorityForAlly
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function TargetPriorityScript2


; =============== S U B R O U T I N E =======================================

; +1 base priority
; 1/3rd of the time, +15 priority if target is expected to die
; 2/3rd of the time, +18 minus 2x +1 the move required to attack target (prioritize closer targets)


TargetPriorityScript3:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #3,d6
                jsr     j_GenerateRandomNumberUnderD6
                tst.b   d7
                beq.w   loc_CD3C        ; If d7=0, then check for death of target
                move.b  d5,d0           ; Otherwise, prioritize closer targets
                add.b   d0,d0
                moveq   #18,d6          ; Add 18 to priority
                sub.b   d0,d6           ; Subtract 2x the move required to attack target from priority
                bcc.s   loc_CD36        
                moveq   #0,d6           ; If priority is negative, set to zero
loc_CD36:
                
                addq.w  #1,d6           ; +1 priority just because
                bra.w   loc_CD46
loc_CD3C:
                
                moveq   #1,d6
                tst.w   d1
                bne.s   loc_CD46
                addi.w  #15,d6          ; if the defender is expected to die from the attack, +15 priority
loc_CD46:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function TargetPriorityScript3


; =============== S U B R O U T I N E =======================================

; +1 base priority
; +15 if target is expected to die
; +1 if target is brought under 20% health


TargetPriorityScript4:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6
                tst.w   d1
                bne.s   loc_CD5A
                addi.w  #15,d6          ; if the defender is expected to die from the attack, +15 priority
loc_CD5A:
                
                bsr.w   sub_D362
                bcs.s   loc_CD62
                addq.w  #1,d6           ; +1 target priority if defender is expected to be left with less than 20% of max health
loc_CD62:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function TargetPriorityScript4

