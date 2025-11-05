
; ASM FILE code\gameflow\battle\battlefield\populatetargetslist.asm :
; 0xC5D6..0xC71A : Populate targets list functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = actor combatant index
;     d1.w = item index


PopulateTargetsListForItemUse:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #-1,d1
                beq.s   @Done
                
                bsr.w   PopulateTargetsListForSpell
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetsListForItemUse


; =============== S U B R O U T I N E =======================================

; unused


unusedsub_C5FA:
                
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #-1,d1
                beq.s   @Done
                
                bsr.w   PopulateTargetsList
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function unusedsub_C5FA


; =============== S U B R O U T I N E =======================================

; In: d0.w = actor combatant index
;     d1.w = spell index


PopulateTargetsListForSpell:
                
                cmpi.b  #SPELL_B_ROCK,d1 ; HARDCODED spell index
                bne.s   @Continue
                
                bsr.w   BuildTargetsArrayWithAllCombatants
                bra.s   PopulateTargetsList
@Continue:
                
                bsr.w   BuildTargetsArrayWithOpponents

    ; End of function PopulateTargetsListForSpell


; =============== S U B R O U T I N E =======================================

; Populate a list of targets positioned within a spell's area of effect.
;
; In: d1.b = spell entry


PopulateTargetsList:
                
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlefield\populatetargetslist-standard.asm"
            else
                movem.l d0-a6,-(sp)
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                jsr     GetSpellDefinitionAddress
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
            endif

    ; End of function PopulateTargetsList


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

