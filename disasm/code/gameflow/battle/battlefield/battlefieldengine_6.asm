
; ASM FILE code\gameflow\battle\battlefield\battlefieldengine_6.asm :
; 0xD3CA..0xD824 : Battlefield engine

; =============== S U B R O U T I N E =======================================

; unused


sub_D3CA:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentMp
                move.w  d1,d2
                jsr     GetMaxMp
                bra.w   loc_D3FC

    ; End of function sub_D3CA


; =============== S U B R O U T I N E =======================================

; unused


sub_D3E0:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxMp
                bra.w   loc_D3FC

    ; End of function sub_D3E0


; =============== S U B R O U T I N E =======================================

; unused


sub_D3F0:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentMp
loc_D3FC:
                
                mulu.w  #3,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D3F0


; =============== S U B R O U T I N E =======================================

; Out: D1 = 0 if normal, 1 if hard, 2 if super, 3 if ouch


GetDifficulty:
                
                movem.l d0/d2-a6,-(sp)
                clr.w   d2
                move.w  #FLAG_INDEX_DIFFICULTY1,d1
                bsr.w   CheckFlag
                beq.s   loc_D41C
                move.w  #1,d2
loc_D41C:
                
                move.w  #FLAG_INDEX_DIFFICULTY2,d1
                bsr.w   CheckFlag
                beq.s   loc_D428
                addq.w  #2,d2
loc_D428:
                
                move.w  d2,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetDifficulty


; =============== S U B R O U T I N E =======================================

var_2 = -2
var_1 = -1

sub_D430:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-2
                move.b  d0,var_1(a6)
                move.b  d1,var_2(a6)
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   GetCurrentTerrainType
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                clr.w   d1
                bra.s   @Done
@Enemy:
                
                move.b  #-1,d1
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_D430

            if (STANDARD_BUILD&SUPPORT_AI_ENHANCEMENTS=1)
                include "code\gameflow\battle\battlefield\populateprioritieslistsforspells-aienhancements.asm"
            else

; =============== S U B R O U T I N E =======================================


; AI: cast ATTACK spell


PopulatePrioritiesListForSpell_Attack:
                
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
                bsr.w   PopulateTargetableGrid
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

    ; End of function PopulatePrioritiesListForSpell_Attack


; =============== S U B R O U T I N E =======================================

; AI: cast BOOST 2 spell


PopulatePrioritiesListForSpell_Boost2:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   GetTargetsReachableBySpell
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                bne.s   loc_D4FC
                bra.w   loc_D55A
loc_D4FC:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
loc_D50E:
                
                move.b  (a0)+,(a1)+
                dbf     d5,loc_D50E
                
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a4
                clr.w   d4
                clr.w   d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a3
                move.w  (a3),d6
                subi.w  #1,d6
loc_D52E:
                
                clr.w   d0
                move.b  (a1,d4.w),d0
                move.w  #SPELL_DISPEL|SPELL_LV2,d1
                bsr.w   PopulateTargetableGrid
                bsr.w   CalculateTargetPriorityForSpell_Boost
                tst.w   d1
                beq.s   loc_D550
                move.b  d1,(a0,d5.w)
                move.b  d0,(a4,d5.w)
                addi.w  #1,d5
loc_D550:
                
                addi.w  #1,d4
                dbf     d6,loc_D52E
                
                move.w  d5,(a3)
loc_D55A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulatePrioritiesListForSpell_Boost2


; =============== S U B R O U T I N E =======================================

; AI: cast DISPEL spell


PopulatePrioritiesListForSpell_Dispel:
                
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

    ; End of function PopulatePrioritiesListForSpell_Dispel


; =============== S U B R O U T I N E =======================================

; AI: cast MUDDLE 2 spell


PopulatePrioritiesListForSpell_Muddle2:
                
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

    ; End of function PopulatePrioritiesListForSpell_Muddle2

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

