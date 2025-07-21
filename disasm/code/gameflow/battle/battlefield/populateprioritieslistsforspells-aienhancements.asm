
; ASM FILE code\gameflow\battle\battlefield\populateprioritieslistsforspells-aienhancements.asm :

; =============== S U B R O U T I N E =======================================

; AI: cast DISPEL spell


PopulatePrioritiesListForSpell_Dispel:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w    d1,d3
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   @Continue
                bra.w   @Skip
@Continue:
                
                move.w  d0,d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w    d3,d1
                bsr.w   PopulateTargetableGrid
                bsr.w   CalculateTargetPriorityForSpell_Dispel
                move.b  d1,(a2)+
                dbf     d5,@GetTargetsPriority_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_LIST-$1000000)).w,a1
@CopyReachableTargetsList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d5,@CopyReachableTargetsList_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a5
                clr.w   d4
                clr.w   d3
@CheckTargetsNumber_Loop:
                
                clr.w   d0
                move.b  (a2,d3.w),d0
                cmpi.b  #1,d0
                blt.s   @Next
                move.b  d0,(a5,d4.w)
                move.b  (a4,d3.w),d0
                move.b  d0,(a1,d4.w)
                addi.w  #1,d4
@Next:
                
                addi.w  #1,d3
                dbf     d5,@CheckTargetsNumber_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  d4,(a0)
                tst.w   d4
                bne.s   @UpdatePrioritiesList
                bra.w   @Skip
@UpdatePrioritiesList:
                
                subi.w  #1,d4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
@UpdatePrioritiesList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d4,@UpdatePrioritiesList_Loop
@Skip:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulatePrioritiesListForSpell_Dispel


; =============== S U B R O U T I N E =======================================

; AI: cast MUDDLE 2 spell


MakePrioritiesListForSpell_Muddle2:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w    d1,d3
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   @Continue
                bra.w   @Skip
@Continue:
                
                move.w  d0,d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w    d3,d1
                bsr.w   PopulateTargetableGrid
                move.w  (a3),d2         ; d2.w = number of targets in area of effect
                move.b  d2,(a2)+
                dbf     d5,@GetTargetsPriority_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_LIST-$1000000)).w,a1
@CopyReachableTargetsList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d5,@CopyReachableTargetsList_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a5
                clr.w   d4
                clr.w   d3
@CheckTargetsNumber_Loop:
                
                clr.w   d0
                move.b  (a2,d3.w),d0
                cmpi.b  #2,d0           ; check number of targets in area of effect
                blt.s   @Next
                move.b  d0,(a5,d4.w)    ; add target if targeting at least 3 units
                move.b  (a4,d3.w),d0
                move.b  d0,(a1,d4.w)
                addi.w  #1,d4
@Next:
                
                addi.w  #1,d3
                dbf     d5,@CheckTargetsNumber_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  d4,(a0)
                tst.w   d4
                bne.s   @UpdatePrioritiesList
                bra.w   @Skip
@UpdatePrioritiesList:
                
                subi.w  #1,d4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
@UpdatePrioritiesList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d4,@UpdatePrioritiesList_Loop
@Skip:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function MakePrioritiesListForSpell_Muddle2

