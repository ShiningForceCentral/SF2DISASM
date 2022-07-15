
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


GenerateTargetRangeLists:
                
                movem.l d0-a6,-(sp)
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetsList
                move.l  d0,-(sp)
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                move.l  (sp)+,d0
                move.w  #0,d3
                bsr.w   UpdateTargetsList
                movem.l (sp)+,d0-a6
                rts

    ; End of function GenerateTargetRangeLists


; =============== S U B R O U T I N E =======================================


CreateAttackRangeGrid:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                eori.w  #$FFFF,d0
                bsr.w   MakeTargetsList
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
                bsr.w   ApplyRelativeCoordListToGrids
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
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
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
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     FindSpellDefAddress
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_C4AA
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   loc_C4A4
                bsr.w   MakeTargetsList_Allies
                bra.s   loc_C4A8
loc_C4A4:
                
                bsr.w   MakeTargetsList_Enemies
loc_C4A8:
                
                bra.s   loc_C4BC
loc_C4AA:
                
                btst    #SPELLPROPS_BIT_TARGETING,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   loc_C4B8
                bsr.w   MakeTargetsList_Enemies
                bra.s   loc_C4BC
loc_C4B8:
                
                bsr.w   MakeTargetsList_Allies
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
                bsr.w   ApplyRelativeCoordListToGrids
                subq.w  #1,d2
                bne.s   loc_C4D8
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateSpellRangeGrid


; =============== S U B R O U T I N E =======================================


sub_C4E8:
                
                movem.l d0-a6,-(sp)
                bsr.w   ClearTargetGrid 
                bsr.w   ClearMovableGrid
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                bsr.w   MakeTargetsList
                moveq   #$FFFFFFFF,d5
                lea     SpellRange1(pc), a0
                nop
                bsr.w   ApplyRelativeCoordListToGrids
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_C4E8


; =============== S U B R O U T I N E =======================================

; Apply coord list at A0 and add any targets to target list
; 
;       In: A0 = address of relative coord list
;           D0 = current entity index
;           D1 = starting X coord
;           D2 = starting Y coord


ApplyRelativeCoordListToGrids:
                
                movem.l d0-a6,-(sp)
                jsr     GetXPos
                cmpi.w  #$FFFF,d1
                beq.w   loc_C58A
                move.w  d1,d3
                jsr     GetYPos
                move.w  d1,d4
                clr.w   d7
                move.b  (a0)+,d7
                subq.w  #1,d7
loc_C532:
                
                move.w  d4,d2
                add.b   1(a0),d2
                cmpi.w  #$30,d2 
loc_C53C:
                
                bcc.w   loc_C584
                move.w  d3,d1
                add.b   (a0),d1
                cmpi.w  #$30,d1 
                bcc.w   loc_C584
                tst.b   d5
                beq.s   loc_C55E
                bsr.w   GetTerrain      
                cmpi.b  #$FF,d0
                beq.s   loc_C55E
                bsr.w   SetMovableAtCoord
loc_C55E:
                
                bsr.w   GetTargetAtCoordOffset
                cmpi.b  #$FF,d0
                beq.w   loc_C584
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C584
                lea     ((TARGETS_LIST-$1000000)).w,a1
                adda.w  ((TARGETS_LIST_LENGTH-$1000000)).w,a1
                move.b  d0,(a1)
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
loc_C584:
                
                addq.l  #2,a0
                dbf     d7,loc_C532
loc_C58A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ApplyRelativeCoordListToGrids

pt_SpellRanges: dc.l SpellRange0
                dc.l SpellRange1
                dc.l SpellRange2
                dc.l SpellRange3
SpellRange0:    dc.b 1
                dc.b 0, 0
SpellRange1:    dc.b 4
                dc.b 0, 1
                dc.b 1, 0
                dc.b 0, -1
                dc.b -1, 0
SpellRange2:    dc.b 8
                dc.b 0, -2
                dc.b -1, -1
                dc.b -2, 0
                dc.b -1, 1
                dc.b 0, 2
                dc.b 1, 1
                dc.b 2, 0
                dc.b 1, -1
SpellRange3:    dc.b 12
                dc.b 0, 3
                dc.b 1, 2
                dc.b 2, 1
                dc.b 3, 0
                dc.b 2, -1
                dc.b 1, -2
                dc.b 0, -3
                dc.b -1, -2
                dc.b -2, -1
                dc.b -3, 0
                dc.b -2, 1
                dc.b -1, 2

; =============== S U B R O U T I N E =======================================


CreateTargetGridFromUsedItem:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #$FF,d1
                beq.s   @Done
                bsr.w   CreateTargetGridFromSpell
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateTargetGridFromUsedItem


; =============== S U B R O U T I N E =======================================


sub_C5FA:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #$FF,d1
                beq.s   loc_C618
                bsr.w   CreateTargetGrid
loc_C618:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_C5FA


; =============== S U B R O U T I N E =======================================


CreateTargetGridFromSpell:
                
                cmpi.b  #SPELL_B_ROCK,d1
                bne.s   loc_C62A
                bsr.w   MakeTargetsList_Everybody
                bra.s   CreateTargetGrid
loc_C62A:
                
                bsr.w   MakeTargetsList

    ; End of function CreateTargetGridFromSpell


; =============== S U B R O U T I N E =======================================

; In: D1 = spell entry


CreateTargetGrid:
                
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
                bsr.w   ApplyRelativeCoordListToGrids
                subq.w  #1,d2
                bne.s   @PopulateTargetCoordinates_Loop
                bra.w   @Done
@ChooseTargets:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @TargetEnemies
                bsr.w   MakeTargetAllies
                bra.s   @Done
@TargetEnemies:
                
                bsr.w   MakeTargetEnemies
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreateTargetGrid


; =============== S U B R O U T I N E =======================================


MakeTargetAllies:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   loc_C6A4
loc_C6A2:
                
                addq.w  #1,d0
loc_C6A4:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   loc_C6CE
                jsr     GetXPos
                cmpi.b  #$FF,d1
                beq.w   loc_C6CC
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C6CC
                move.b  d0,(a0)
                addq.l  #1,a0
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
loc_C6CC:
                
                bra.s   loc_C6A2
loc_C6CE:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function MakeTargetAllies


; =============== S U B R O U T I N E =======================================


MakeTargetEnemies:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  #COMBATANT_ENEMIES_START,d0
                bra.s   loc_C6EA
loc_C6E8:
                
                addq.w  #1,d0
loc_C6EA:
                
                cmpi.w  #COMBATANT_ENEMIES_END,d0
                bgt.s   loc_C714
                jsr     GetXPos
                cmpi.b  #$FF,d1
                beq.w   loc_C712
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C712
                move.b  d0,(a0)
                addq.l  #1,a0
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
loc_C712:
                
                bra.s   loc_C6E8
loc_C714:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function MakeTargetEnemies


; =============== S U B R O U T I N E =======================================

; In: D1 = X pos, D2 = Y pos, D3 = max range, D4 = min range
; 
; Out: D1 = chosen X pos, return $FF if no attack position is available
;      D2 = chosen Y pos

var_5 = -5
var_4 = -4
var_3 = -3
currentY = -2
currentX = -1

GetClosestAttackPosition:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-6
                move.b  d1,currentX(a6)
                move.b  d2,currentY(a6)
                move.b  #$FF,var_3(a6)
                move.b  #$FF,var_4(a6)
                move.b  #$FF,var_5(a6)
                cmpi.b  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   loc_C7E2
                cmpi.b  #MAP_SIZE_MAXHEIGHT,d2
                bcc.w   loc_C7E2
                move.b  d3,d6
                neg.b   d6              ; D6 is now negative max range
loc_C750:
                
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
                cmpi.b  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   loc_C7BE
                move.b  currentY(a6),d2
                add.b   d6,d2
                cmpi.b  #MAP_SIZE_MAXHEIGHT,d2
                bcc.w   loc_C7BE
                bsr.w   GetDestinationMoveCost
                tst.w   d0              ; already in range, so end because it can't get cheaper
                beq.w   loc_C7EA
                btst    #$F,d0
                bne.w   loc_C7BE
                cmp.b   var_5(a6),d0
                bcc.w   loc_C7BE
                move.b  d0,d7
                andi.w  #$FF,d1
                andi.w  #$FF,d2
                bsr.w   GetTargetAtCoordOffset
                cmpi.b  #$FF,d0
                bne.w   loc_C7BE        ; already someone there, so it can't be chosen
                move.b  d7,var_5(a6)
                move.b  d1,var_3(a6)
                move.b  d2,var_4(a6)
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
                bra.w   loc_C750
loc_C7E2:
                
                move.b  var_3(a6),d1
                move.b  var_4(a6),d2
loc_C7EA:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetClosestAttackPosition


; =============== S U B R O U T I N E =======================================


MakeTargetsList:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   MakeTargetsList_Enemies ; generate list of targets: opposite alignment of D0

    ; End of function MakeTargetsList


; =============== S U B R O U T I N E =======================================

; Clear target grid, then add allies


MakeTargetsList_Allies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetGrid 
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   loc_C828

    ; End of function MakeTargetsList_Allies


; =============== S U B R O U T I N E =======================================


MakeTargetsList_Enemies:
                
                movem.l d0-a0,-(sp)
                bsr.w   ClearTargetGrid 
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                bra.w   loc_C828

    ; End of function MakeTargetsList_Enemies


; =============== S U B R O U T I N E =======================================

; Populate a list of all combatants on the battlefield


MakeTargetsList_Everybody:
                
                movem.l d0-a0,-(sp)
                bsr.s   MakeTargetsList_Allies
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
loc_C828:
                
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C86E
                jsr     GetAiActivationFlag
                btst    #3,d1
                beq.s   loc_C844
                bra.w   loc_C86E
loc_C844:
                
                jsr     GetYPos
                cmpi.w  #MAP_SIZE_MAXHEIGHT,d1
                bcc.w   loc_C86E
                move.w  d1,d2
                jsr     GetXPos
                cmpi.w  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   loc_C86E
                lea     (FF5600_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  d0,(a0)
loc_C86E:
                
                addq.b  #1,d0
                dbf     d7,loc_C828
                movem.l (sp)+,d0-a0
                rts

    ; End of function MakeTargetsList_Everybody


; =============== S U B R O U T I N E =======================================


UpdateTargetsList:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.w   UpdateTargetsList_Enemies

    ; End of function UpdateTargetsList


; =============== S U B R O U T I N E =======================================


UpdateTargetsList_Allies:
                
                movem.l d0-a0,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.w   UpdateTargetsList_Loop

    ; End of function UpdateTargetsList_Allies


; =============== S U B R O U T I N E =======================================


UpdateTargetsList_Enemies:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
UpdateTargetsList_Loop:
                
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C8F4
                jsr     GetYPos
                move.w  d1,d2
                cmpi.w  #MAP_SIZE_MAXHEIGHT,d2
                bcc.w   loc_C8F4
                jsr     GetXPos
                cmpi.w  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   loc_C8F4
                lea     (BATTLE_TERRAIN).l,a0
                bsr.w   ConvertCoordToOffset
                move.b  (a0),d4
                cmpi.b  #$FF,d4
                bne.s   loc_C8D8
                bra.w   loc_C8F4
loc_C8D8:
                
                btst    #6,d4
                beq.s   loc_C8E6
                tst.w   d3
                bne.s   loc_C8E6
                bra.w   loc_C8F4
loc_C8E6:
                
                tst.w   d3
                bne.s   loc_C8F0
                bclr    #7,(a0)
                bra.s   loc_C8F4
loc_C8F0:
                
                bset    #7,(a0)
loc_C8F4:
                
                addq.b  #1,d0
                dbf     d7,UpdateTargetsList_Loop
                movem.l (sp)+,d0-a0
                rts

    ; End of function UpdateTargetsList_Enemies


; =============== S U B R O U T I N E =======================================


sub_C900:
                
                movem.l d0-a0,-(sp)
                move.w  #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
loc_C90A:
                
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_C94C
                jsr     GetYPos
                move.w  d1,d2
                cmpi.w  #MAP_SIZE_MAXHEIGHT,d2
                bcc.w   loc_C94C
                jsr     GetXPos
                cmpi.w  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   loc_C94C
                lea     (FF4D00_LOADING_SPACE).l,a0
                bsr.w   ConvertCoordToOffset
                tst.w   d3
                bne.s   loc_C948
                bclr    #7,(a0)
                bra.s   loc_C94C
loc_C948:
                
                bset    #7,(a0)
loc_C94C:
                
                addq.b  #1,d0
                dbf     d7,loc_C90A
                movem.l (sp)+,d0-a0
                rts

    ; End of function sub_C900


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
                moveq   #$FFFFFFFF,d3   ; If d3<0 then clear bit 7 when calling UpdateTargetsList
                bsr.w   UpdateTargetsList ; List all living opponents (enemies or allies, depending upon the character index)
                                        ;  and clear bit 7 of the map data.
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                
                ; Check Item Use
                moveq   #0,d3
                bsr.w   UpdateTargetsList
                clr.w   ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w
                clr.w   ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w
                clr.w   ((FF8804_LOADING_SPACE-$1000000)).w ; # targets reachable by attack
                move.l  (sp)+,d0
                moveq   #0,d3
                bsr.w   GetNextUsableAttackItem
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   @CheckSpellCast
                bsr.w   MakeTargetsList_Everybody
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
                bsr.w   MakeTargetsList_Enemies
                bra.s   @Goto_PopulateItemPrioritiesList
@MuddledAllyItemUser:
                
                bsr.w   MakeTargetsList_Allies
@Goto_PopulateItemPrioritiesList:
                
                bra.s   @PopulateItemPrioritiesList
@EnemyItemUser:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledEnemyItemUser
                bsr.w   MakeTargetsList_Allies
                bra.s   @PopulateItemPrioritiesList
@MuddledEnemyItemUser:
                
                bsr.w   MakeTargetsList_Enemies
                
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
                bsr.w   MakeTargetsList_Everybody
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
                bsr.w   MakeTargetsList_Enemies
                bra.s   @Goto_PopulateSpellPrioritiesList
@MuddledAllySpellCaster:
                
                bsr.w   MakeTargetsList_Allies
@Goto_PopulateSpellPrioritiesList:
                
                bra.s   @PopulateSpellPrioritiesList
@EnemySpellCaster:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledEnemySpellCaster
                bsr.w   MakeTargetsList_Allies
                bra.s   @PopulateSpellPrioritiesList
@MuddledEnemySpellCaster:
                
                bsr.w   MakeTargetsList_Enemies
                
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
                
                bsr.w   MakeTargetsList_Everybody
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
                bsr.w   MakeTargetsList_Enemies
                bra.s   @Goto_PopulateAttackPrioritiesList
@MuddledAllyAttacker:
                
                bsr.w   MakeTargetsList_Allies
@Goto_PopulateAttackPrioritiesList:
                
                bra.s   @PopulateAttackPrioritiesList
@EnemyAttacker:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                bne.s   @MuddledEnemyAttacker
                bsr.w   MakeTargetsList_Allies
                bra.s   @PopulateAttackPrioritiesList
@MuddledEnemyAttacker:
                
                bsr.w   MakeTargetsList_Enemies
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
                
                bsr.w   MakeTargetsList_Everybody
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
                bsr.w   CreateTargetGrid ; insert the list of all who would be affected by the spell in TARGETS_LIST
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
                jsr     GetAiActivationFlag
                move.w  d1,d2
                rol.w   #4,d2
                andi.w  #$F,d2
                bra.s   @Continue
@Ally:
                
                move.w  #2,d2
@Continue:
                
                move.l  d1,-(sp)
                bsr.w   GetDifficulty   
                mulu.w  #4,d1
                add.w   d1,d2
                move.l  (sp)+,d1
                lsl.w   #2,d2
                movea.l pt_TargetPriorityScripts(pc,d2.w),a0
                move.b  d3,d0
                bsr.w   CalculatePotentialRemainingHP
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
                jsr     GetAiActivationFlag
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
                lsl.w   #2,d2
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
                bsr.w   CalculatePotentialRemainingHP
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
                jsr     GetCurrentATT
                move.b  d2,d0
                move.w  d1,d2
                jsr     GetCurrentDEF
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
                lsr.w   #8,d6
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


CalculatePotentialRemainingHP:
                
                movem.l d0/d2-a6,-(sp)
                jsr     GetCurrentHP
                sub.w   d6,d1
                bcc.s   @Continue
                moveq   #0,d1           ; min remaining HP = 0
@Continue:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CalculatePotentialRemainingHP


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
                jsr     j_RandomUnderD6
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

