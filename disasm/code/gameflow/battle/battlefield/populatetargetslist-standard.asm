
; ASM FILE code\gameflow\battle\battlefield\populatetargetslist-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; In: d0.w = target combatant index
;     d1.w = item index

                
PopulateTargetsListForItemUse:
                
                jsr     GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1

    ; End of function PopulateTargetsListForItemUse


; =============== S U B R O U T I N E =======================================

; In: d0.w = target combatant index
;     d1.w = spell entry


PopulateTargetsListForSpell:
                
                ; Find spells targeting both teammates and opponents (e.g., Burst Rock)
                lea     table_FriendlyFireSpells(pc), a0
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Continue       ; continue if not found
                
                bsr.w   BuildTargetsArrayWithAllCombatants
                bra.s   PopulateTargetsList
                
@Continue:      bsr.w   BuildTargetsArrayWithTeammatesOfTarget

    ; End of function PopulateTargetsListForSpell


; =============== S U B R O U T I N E =======================================

; Populate a list of targets positioned within a spell's area of effect.
;
; In: d0.w = target combatant index
;     d1.b = spell entry


PopulateTargetsList:
                
                movem.l d2/d5/d7-a1,-(sp)
                clr.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                
                ; Find spells targeting all allies or enemies (e.g., Aura level 4, Shine)
                lea     table_AllTargetingSpells(pc), a0
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcc.s   @TargetAll
                
                ; Get pointer to relative coordinates list for spell radius
                lea     pt_SpellRanges(pc), a1
                jsr     GetSpellDefinitionAddress
                clr.w   d7
                move.b  SPELLDEF_OFFSET_RADIUS(a0),d7
                move.w  d7,d5
                addq.w  #1,d5
                lsl.w   #INDEX_SHIFT_COUNT,d5
                movea.l (a1,d5.w),a1
                
                ; Clear obstructed spaces handling mode toggle now for later use
                moveq   #0,d5
                
                ; Find spells targeting both teammates and opponents (e.g., Burst Rock)
                lea     table_FriendlyFireSpells(pc), a0
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @PopulateTargetCoordinates_Loop ; continue if not found
                
                tst.b   (a0)
                beq.s   @AvoidSelfTarget                ; otherwise, avoid targeting self if toggle is clear
                
@PopulateTargetCoordinates_Loop:
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordinatesListToGrid  ; In: d5.b = obstructed spaces handling mode toggle (should be clear)
                
@AvoidSelfTarget:
                dbf     d7,@PopulateTargetCoordinates_Loop
                
@Done:          movem.l (sp)+,d2/d5/d7-a1
                rts
; ---------------------------------------------------------------------------

                ; In: a0 = pointer to target opponents toggle (0 = false, -1 = true)
@TargetAll:     lea     ((TARGETS_LIST-$1000000)).w,a1
                pea     @Done(pc)       ; push return address
                
                ; Is target an enemy?
                tst.b   d0
                bpl.s   @AllyTarget
                
                tst.b   (a0)
                bne.s   PopulateTargetsListWithAllAllies
                bra.s   PopulateTargetsListWithAllEnemies
                
@AllyTarget:    tst.b   (a0)
                bne.s   PopulateTargetsListWithAllEnemies

    ; End of function PopulateTargetableGrid


; =============== S U B R O U T I N E =======================================

                module

PopulateTargetsListWithAllAllies:
                
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                bra.s   @Loop

    ; End of function PopulateTargetsListWithAllAllies


; =============== S U B R O U T I N E =======================================

; In: a1 = pointer to TARGETS_LIST
;     TARGETS_LIST_LENGTH = 0


PopulateTargetsListWithAllEnemies:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                
@Loop:          jsr     GetCombatantX
                bmi.s   @Next
                
                jsr     GetCurrentHp
                beq.s   @Next
                
                move.b  d0,(a1)+
                addq.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
                
@Next:          addq.w  #1,d0
                dbf     d7,@Loop
                
                rts

    ; End of function PopulateTargetsListWithAllEnemies

                modend
