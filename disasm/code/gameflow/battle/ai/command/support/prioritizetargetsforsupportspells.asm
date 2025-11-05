
; ASM FILE code\gameflow\battle\ai\command\support\prioritizetargetsforsupportspells.asm :
; 0xD460..0xD824 : Targets prioritization for Support AI command functions

            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
                include "code\gameflow\battle\battlefield\populateprioritieslistsforspells-aienhancements.asm"
            else

; =============== S U B R O U T I N E =======================================


; AI: cast ATTACK spell


PrioritizeTargetsForSupportSpell_Attack:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_ATTACK,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   @Continue
                bra.w   @Skip           ; skip if no reachable target
@Continue:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
@CopyReachableTargetsList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d5,@CopyReachableTargetsList_Loop
                
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a4
                clr.w   d4
                clr.w   d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a3
                move.w  (a3),d6
                subi.w  #1,d6
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a1,d4.w),d0
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   PopulateTargetsList
                bsr.w   CalculateTargetPriorityForSpell_Attack
                tst.w   d1
                beq.s   @Next
                move.b  d1,(a0,d5.w)
                move.b  d0,(a4,d5.w)
                addi.w  #1,d5
@Next:
                
                addi.w  #1,d4
                dbf     d6,@GetTargetsPriority_Loop
                
                move.w  d5,(a3)
@Skip:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PrioritizeTargetsForSupportSpell_Attack


; =============== S U B R O U T I N E =======================================

; AI: cast BOOST 2 spell


PrioritizeTargetsForSupportSpell_Boost2:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   @Continue
                bra.w   @Skip           ; skip if no reachable target
@Continue:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
@CopyReachableTargetsList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d5,@CopyReachableTargetsList_Loop
                
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a4
                clr.w   d4
                clr.w   d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a3
                move.w  (a3),d6
                subi.w  #1,d6
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a1,d4.w),d0
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   PopulateTargetsList
                bsr.w   CalculateTargetPriorityForSpell_Boost
                tst.w   d1
                beq.s   @Next
                move.b  d1,(a0,d5.w)
                move.b  d0,(a4,d5.w)
                addi.w  #1,d5
@Next:
                
                addi.w  #1,d4
                dbf     d6,@GetTargetsPriority_Loop
                
                move.w  d5,(a3)
@Skip:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PrioritizeTargetsForSupportSpell_Boost2


; =============== S U B R O U T I N E =======================================

; AI: cast DISPEL spell


PrioritizeTargetsForSupportSpell_Dispel:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_DISPEL,d1
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
                lea     ((TARGETS_LIST-$1000000)).w,a4
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  #SPELL_DISPEL,d1
                bsr.w   PopulateTargetsList
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
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a5
                clr.w   d4
                clr.w   d3
@CheckTargetsNumber_Loop:
                
                clr.w   d0
                move.b  (a2,d3.w),d0
                cmpi.b  #2,d0
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

    ; End of function PrioritizeTargetsForSupportSpell_Dispel


; =============== S U B R O U T I N E =======================================

; AI: cast MUDDLE 2 spell


PrioritizeTargetsForSupportSpell_Muddle2:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_MUDDLE|SPELL_LV2,d1
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
                move.w  #SPELL_MUDDLE|SPELL_LV2,d1
                bsr.w   PopulateTargetsList
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
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a5
                clr.w   d4
                clr.w   d3
@CheckTargetsNumber_Loop:
                
                clr.w   d0
                move.b  (a2,d3.w),d0
                cmpi.b  #3,d0           ; check number of targets in area of effect
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

    ; End of function PrioritizeTargetsForSupportSpell_Muddle2

            endif

; =============== S U B R O U T I N E =======================================

; Returns priority for the AI to cast DISPEL.
; +1 point for each target within the area of effect that knows at least
;  one attack or healing spell.
; 
; Out: d1.w = target priority


CalculateTargetPriorityForSpell_Dispel:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                lea     ((TARGETS_LIST-$1000000)).w,a1
                move.w  (a0),d7
                subi.w  #1,d7
                clr.w   d6
                clr.w   d5
@Loop:
                
                clr.w   d0
                move.b  (a1,d5.w),d0
                
                ; Check attack spell
                clr.w   d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   @CheckHealingSpell
                addi.w  #1,d6
                bra.w   @Next
@CheckHealingSpell:
                
                clr.w   d3
                bsr.w   GetNextHealingSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   @Next
                addi.w  #1,d6
@Next:
                
                addi.w  #1,d5
                dbf     d7,@Loop
                
                move.w  d6,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CalculateTargetPriorityForSpell_Dispel


; =============== S U B R O U T I N E =======================================

; Returns priority for the AI to cast BOOST.
; 
; Out: d1.w = target priority


CalculateTargetPriorityForSpell_Boost:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                clr.w   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                clr.w   d5
                move.w  (a3),d6
                tst.w   d6
                bne.s   @Continue
                bra.w   @Skip
@Continue:
                
                subi.w  #1,d6
@Loop:
                
                clr.w   d0
                move.b  (a0,d4.w),d0
                clr.w   d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.b  #SPELL_NOTHING,d1
                bne.s   @Next
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                move.b  (a2,d0.w),d2
                cmpi.b  #-1,d2
                beq.s   @Next
                
                move.w  d2,d0
                bsr.w   GetCurrentHp
                tst.w   d1
                beq.s   @Next
                addi.w  #1,d5
@Next:
                
                addi.w  #1,d4
                dbf     d6,@Loop
                
                cmpi.w  #2,d5           ; check if there are at least 2 valid targets in area of effect
                bge.s   @Skip
                clr.w   d5
@Skip:
                
                move.w  d5,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CalculateTargetPriorityForSpell_Boost


; =============== S U B R O U T I N E =======================================

; Returns priority for the AI to cast ATTACK.
; 
; Out: d1.w = target priority


CalculateTargetPriorityForSpell_Attack:
                
                movem.l d0/d2-a6,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                clr.w   d4
                clr.w   d5
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a3
                move.w  (a3),d6
                tst.w   d6
                bne.s   @Continue
                bra.w   @Skip
@Continue:
                
                subi.w  #1,d6
@Loop:
                
                clr.w   d0
                move.b  (a0,d4.w),d0    ; d0.b = target
                
                ; Check if target knows at least one attack spell
                clr.w   d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.b  #SPELL_NOTHING,d1
                bne.s   @Next
                
                ; Check if target has already targeted anyone
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                move.b  (a2,d0.w),d2    ; d2.b = target's last target
                cmpi.b  #-1,d2
                beq.s   @Next
                
                ; Check if target's last target is still alive
                move.w  d2,d0
                bsr.w   GetCurrentHp
                tst.w   d1
                beq.s   @Next
                
                ; 
                move.b  (a0,d4.w),d0
                bsr.w   GetCurrentAtt
                move.w  #255,d0
                sub.w   d1,d0
                add.w   d0,d5
                cmpi.w  #255,d5         ; unnecessary
                addi.w  #1,d5
                ble.s   @Next
                move.w  #255,d5
@Next:
                
                addi.w  #1,d4
                dbf     d6,@Loop
@Skip:
                
                move.w  d5,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CalculateTargetPriorityForSpell_Attack

