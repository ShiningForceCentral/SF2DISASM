
; ASM FILE code\gameflow\battle\battlefield\populatetargetablegrid-standard.asm :

; =============== S U B R O U T I N E =======================================

; In: d1.b = spell entry

targetOpponentsToggle = -2
allTargetingToggle = -1

;PopulateTargetableGrid:
                
                movem.l d0-a6,-(sp)
                link    a6,#-2
                clr.w   targetOpponentsToggle(a6)
                clr.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                
                ; Find spells targeting all allies or enemies (e.g., Aura level 4, Shine)
                lea     table_AllTargetingSpells(pc), a0
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @RegularTargeting
                st      allTargetingToggle(a6)
@RegularTargeting:
                
                move.b  (a0),targetOpponentsToggle(a6)
                tst.b   allTargetingToggle(a6)
                beq.s   @Continue
                
                ; Choose targets
                pea     @Done(pc)
                tst.w   d0 ; actor is an enemy?
                bmi.s   @TargetEnemies
                
                ; Target allies
                tst.b   targetOpponentsToggle(a6)
                bne.s   @JumpToEnemies
@JumpToAllies:  jmp     PopulateTargetsListWithAllies(pc)
                
                ; Target enemies
@TargetEnemies: tst.b   targetOpponentsToggle(a6)
                bne.s   @JumpToAllies
@JumpToEnemies: jmp     PopulateTargetsListWithEnemies(pc)
                
@Continue:      jsr     FindSpellDefAddress
                moveq   #0,d2
                move.b  SPELLDEF_OFFSET_RADIUS(a0),d2
                addq.b  #1,d2
                lea     pt_SpellRanges(pc), a1
                move.w  d2,d4
                lsl.w   #2,d4
                adda.w  d4,a1
                
                ; Find self-targeting spells (e.g., Burst Rock)
                movem.l d2/a0,-(sp)
                lea     table_SelfTargetingSpells(pc), a0
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                movem.l (sp)+,d2/a0
                bcs.s   @AvoidSelfTarget ; if not found
                subq.b  #1,d2
@AvoidSelfTarget:
                
                moveq   #0,d5
@PopulateTargetCoordinates_Loop:
                
                movea.l -(a1),a0
                bsr.w   ApplyRelativeCoordinatesListToGrid
                subq.w  #1,d2
                bne.s   @PopulateTargetCoordinates_Loop
                
@Done:          unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetableGrid

