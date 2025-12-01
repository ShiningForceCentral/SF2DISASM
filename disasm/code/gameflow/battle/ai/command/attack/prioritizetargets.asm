
; ASM FILE code\gameflow\battle\ai\command\attack\prioritizetargets.asm :
; 0xC958..0xCD68 : Targets prioritization for Attack AI command functions

; =============== S U B R O U T I N E =======================================

; Populate lists of targets reachable by item, spell, and regular attack,
;  then give each target a priority score.
; 
; To allow AI to cast more than one spell, this must be reworked.
; 
; In: d0.w, d7.w = attacker index
;     d1.w, d6.w = extra AI variable (values of 0-3)


PrioritizeTargetsForAttackAiCommand:
                
                movem.l d1-a2,-(sp)
                
                move.l  d0,-(sp)
                moveq   #-1,d3          ; set occupied terrain flags
                bsr.w   UpdateOccupiedByOpponentsTerrain
                bsr.w   InitializeMovementArrays
                bsr.w   BuildMovementArrays
                moveq   #0,d3           ; clear occupied terrain flags
                bsr.w   UpdateOccupiedByOpponentsTerrain
                clr.w   ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w
                clr.w   ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w
                clr.w   ((FF8804_LOADING_SPACE-$1000000)).w ; # targets reachable by attack
                move.l  (sp)+,d0
                
                ; Check Item Use
                moveq   #0,d3
                bsr.w   GetNextUsableAttackItem
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   @CheckSpellCast
                
                bsr.w   BuildTargetsArrayWithAllCombatants
                bsr.w   GetTargetsReachableByItem
                move.w  ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @CheckSpellCast ; if no targets are reachable by item, skip ahead to check for targets reachable by spell
                
                move.l  d1,-(sp)        ; store the attack item since it has valid targets
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyItemUser
                
                ; Ally item user
                bsr.w   IsCombatantConfused
                tst.b   d1
                bne.s   @ConfusedAllyItemUser
                
                bsr.w   BuildTargetsArrayWithEnemies
                bra.s   @Goto_PopulateItemPrioritiesList
@ConfusedAllyItemUser:
                
                bsr.w   BuildTargetsArrayWithAllies
@Goto_PopulateItemPrioritiesList:
                
                bra.s   @PopulateItemPrioritiesList
@EnemyItemUser:
                
                bsr.w   IsCombatantConfused
                tst.b   d1
                bne.s   @ConfusedEnemyItemUser
                
                bsr.w   BuildTargetsArrayWithAllies
                bra.s   @PopulateItemPrioritiesList
@ConfusedEnemyItemUser:
                
                bsr.w   BuildTargetsArrayWithEnemies
@PopulateItemPrioritiesList:
                
                ; At this point (FF5600_LOADING_SPACE) has the list of all opposing combatants that could be selected as a target, if they were in range
                move.l  (sp)+,d1        ; d1 = attack item index
                lea     (ATTACK_COMMAND_ITEM_SLOT).l,a0
                move.w  d2,(a0)
                jsr     GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                lea     ((TARGETS_REACHABLE_BY_ITEM_LIST-$1000000)).w,a0
                lea     ((ITEM_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a1
                lea     ((ITEM_TARGET_PRIORITIES_LIST-$1000000)).w,a2
@PopulateItemPrioritiesList_Loop:
                
                move.b  (a0,d7.w),d2    ; d2 = defender
                move.b  (a1,d7.w),d5    ; d5 = movement to reach target
                bsr.w   CalculateTargetPriorityForAttack
                move.b  d6,(a2,d7.w)    ; d6 = target priority from using the item (or attacking if the item has no spell to use)
                dbf     d7,@PopulateItemPrioritiesList_Loop
@CheckSpellCast:
                
                moveq   #0,d3
                bsr.w   GetNextUsableAttackSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.w   @CheckAttack    ; if no attack spell, skip this step
                
                bsr.w   BuildTargetsArrayWithAllCombatants
                bsr.w   GetTargetsReachableBySpell
                move.w  ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @CheckAttack    ; if no targets are reachable by spell, skip ahead to check for targets reachable by physical attack
                
                move.l  d1,-(sp)        ; store the attack spell
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemySpellCaster
                
                ; Ally spell caster
                bsr.w   IsCombatantConfused
                tst.b   d1
                bne.s   @ConfusedAllySpellCaster
                
                bsr.w   BuildTargetsArrayWithEnemies
                bra.s   @Goto_PopulateSpellPrioritiesList
@ConfusedAllySpellCaster:
                
                bsr.w   BuildTargetsArrayWithAllies
@Goto_PopulateSpellPrioritiesList:
                
                bra.s   @PopulateSpellPrioritiesList
@EnemySpellCaster:
                
                bsr.w   IsCombatantConfused
                tst.b   d1
                bne.s   @ConfusedEnemySpellCaster
                
                bsr.w   BuildTargetsArrayWithAllies
                bra.s   @PopulateSpellPrioritiesList
@ConfusedEnemySpellCaster:
                
                bsr.w   BuildTargetsArrayWithEnemies
@PopulateSpellPrioritiesList:
                
                ; At this point (FF5600_LOADING_SPACE) has the list of all opposing combatants that could be selected as a target, if they were in range
                move.l  (sp)+,d1        ; d1 = spell index
                lea     (ATTACK_COMMAND_SPELL).l,a0
                move.w  d1,(a0)
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((SPELL_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
@PopulateSpellPrioritiesList_Loop:
                
                move.b  (a0,d7.w),d2    ; d2 = defender
                move.b  (a1,d7.w),d5    ; d5 = movement to reach target
                bsr.w   CalculateTargetPriorityForAttack
                move.b  d6,(a2,d7.w)    ; d6 = target priority (higher is better)
                dbf     d7,@PopulateSpellPrioritiesList_Loop
@CheckAttack:
                
                bsr.w   BuildTargetsArrayWithAllCombatants
                bsr.w   GetTargetsReachableByAttack
                move.w  ((FF8804_LOADING_SPACE-$1000000)).w,d7 ; # targets reachable
                subq.w  #1,d7
                bcs.w   @Done           ; if no targets are reachable by physical attack, skip to end
                move.l  d1,-(sp)        ; unnecessary
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyAttacker
                
                ; Ally attacker
                bsr.w   IsCombatantConfused
                tst.b   d1
                bne.s   @ConfusedAllyAttacker
                
                bsr.w   BuildTargetsArrayWithEnemies
                bra.s   @Goto_PopulateAttackPrioritiesList
@ConfusedAllyAttacker:
                
                bsr.w   BuildTargetsArrayWithAllies
@Goto_PopulateAttackPrioritiesList:
                
                bra.s   @PopulateAttackPrioritiesList
@EnemyAttacker:
                
                bsr.w   IsCombatantConfused
                tst.b   d1
                bne.s   @ConfusedEnemyAttacker
                
                bsr.w   BuildTargetsArrayWithAllies
                bra.s   @PopulateAttackPrioritiesList
@ConfusedEnemyAttacker:
                
                bsr.w   BuildTargetsArrayWithEnemies
@PopulateAttackPrioritiesList:
                
                move.l  (sp)+,d1        ; unnecessary
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a0
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a1
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a2
@PopulateAttackPrioritiesList_Loop:
                
                move.b  (a0,d7.w),d2    ; d2 = defender
                move.b  (a1,d7.w),d5    ; d5 = movement to reach target
                move.b  #SPELL_NOTHING,d1
                bsr.w   CalculateTargetPriorityForAttack
                move.b  d6,(a2,d7.w)    ; d6 = target priority (higher is better)
                dbf     d7,@PopulateAttackPrioritiesList_Loop
                
                bsr.w   BuildTargetsArrayWithAllCombatants
@Done:
                
                movem.l (sp)+,d1-a2
                rts

    ; End of function PrioritizeTargetsForAttackAiCommand


; =============== S U B R O U T I N E =======================================

; Calculate a priority score for a single target for either attack or spell.
; 
; In: a0 = pointer to reachable targets list
;     a1 = pointer to movement to targets list
;     a2 = pointer to priorities list
;     d0.w = caster index
;     d1.b = spell index
;     d2.b = target of the spell
; 
; Out: d6.w = target priority (higher is better)


CalculateTargetPriorityForAttack:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #0,d6           ; d6 = that weird extra AI value, so this just clears it
                cmpi.b  #SPELL_NOTHING,d1
                bne.s   @Spell          
                
                ; Regular attack
                move.b  d2,d1           ; d1 = target
                bsr.w   AdjustTargetPriorityForAttackByDifficulty
                bra.s   @Done
@Spell:
                
                move.b  d0,d3           ; d3 = caster
                move.b  d2,d0           ; d0 = target
                bsr.w   PopulateTargetsList ; insert the list of all who would be affected by the spell in TARGETS_LIST
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                beq.s   @Done
                
                move.b  d3,d0           ; d0 = caster
                bsr.w   AdjustTargetPriorityForSpellByDifficulty
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function CalculateTargetPriorityForAttack


; =============== S U B R O U T I N E =======================================

; Calculate max potential damage from a regular attack -> d6.w
; 
; Then call one of the difficulty-based subroutines, which sets
;   d6.w = target priority score instead (using the "remaining HP of target"
;   as a key part of the target priority).
; 
; In:  d0.b = attacker, d1.b = defender
; Out: d6.w = target priority (higher number = better target)


AdjustTargetPriorityForAttackByDifficulty:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.b  d1,d3           ; d3.b = copy of defender index
                move.b  d0,d4           ; d4.b = copy of attacker index
                bsr.w   CalculatePotentialDamage
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @Ally
                
                jsr     GetActivationBitfield
                move.w  d1,d2
                rol.w   #NIBBLE_SHIFT_COUNT,d2
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                bra.s   @Continue
@Ally:
                
                move.w  #AIBITFIELD_SECONDARY_ACTIVE,d2
@Continue:
                
                move.l  d1,-(sp)
                bsr.w   GetDifficulty   
                mulu.w  #4,d1
                add.w   d1,d2
                move.l  (sp)+,d1
                lsl.w   #INDEX_SHIFT_COUNT,d2
                movea.l pt_TargetPriorityScripts(pc,d2.w),a0
                move.b  d3,d0
                bsr.w   CalculateRemainingHpAfterPotentialDamage
                clr.w   d7
                jsr     (a0)            ; execute target priority adjustment script
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AdjustTargetPriorityForAttackByDifficulty

pt_TargetPriorityScripts:
                
; In: d0.b = defender index
;     d1.b = defender's remaining HP after taking max potential damage from an attack
;     d4.b = attacker index
;     d7.w = 0 if regular attack, 1 if spell cast
;
; Out: d6.w = priority of the action
                
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

; Calculate expected spell damage and then call one of the difficulty-based
;   subroutines to calculate target priority.
; 
; Return the sum of priority scores for all enemies in the area of effect.
; 
; In:  d0 = caster index, d1 = spell index
; Out: d6 = sum of target priority of all targets


AdjustTargetPriorityForSpellByDifficulty:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.w  d0,d4
                move.b  d1,d3
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @AllyCaster
                
                jsr     GetActivationBitfield
                move.w  d1,d2
                rol.w   #NIBBLE_SHIFT_COUNT,d2
                andi.w  #AIBITFIELD_TRIGGER_REGIONS_MASK,d2
                bra.s   @Continue
@AllyCaster:
                
                move.w  #AIBITFIELD_SECONDARY_ACTIVE,d2
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
                bcs.w   @ReturnInfo
@Loop:
                
                move.b  (a1)+,d0
                bsr.w   AdjustSpellPowerForResistance
                bsr.w   CalculateRemainingHpAfterPotentialDamage
                move.l  d7,-(sp)
                move.w  #1,d7
                jsr     (a0)            ; Execute target priority adjustment script
                move.l  (sp)+,d7
                add.w   d6,d3
                dbf     d7,@Loop
@ReturnInfo:
                
                move.w  d3,d6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AdjustTargetPriorityForSpellByDifficulty


; =============== S U B R O U T I N E =======================================

; In: d0.b = attacker, d1.b = defender
; Out: d6.w = max potential regular attack damage, adjusted for land effect


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

; In: d0.b = target combatant index
;     d1.b = spell index
; 
; Out: d6.w = adjusted spell power


AdjustSpellPowerForResistance:
                
                movem.l d0-d5/d7-a0,-(sp)
                bsr.w   GetResistanceToSpell
                jsr     GetSpellDefinitionAddress
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

    ; End of function AdjustSpellPowerForResistance


; =============== S U B R O U T I N E =======================================

; In: d0.b = target index, d6.w = potential damage
; Out: d1.w = target's potential remaining HP


CalculateRemainingHpAfterPotentialDamage:
                
                movem.l d0/d2-a6,-(sp)
                jsr     GetCurrentHp
                sub.w   d6,d1
                bcc.s   @Continue
                moveq   #0,d1           ; min remaining HP = 0
@Continue:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CalculateRemainingHpAfterPotentialDamage


; =============== S U B R O U T I N E =======================================

; +1 base priority
; +15 if target is expected to die
; +2 if target is the same as last turn's target


TargetPriorityScript1:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6           ; start with 1 priority
                tst.w   d1
                bne.s   @CheckLastTarget
                
                addi.w  #15,d6          ; +15 priority if the defender is expected to die from the attack
@CheckLastTarget:
                
                lea     (AI_LAST_TARGET_TABLE).l,a1
                clr.w   d5
                move.b  d4,d5           ; d5.b = copy of attacker index
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d5
                clr.w   d7
                move.b  (a1,d5.w),d7    ; d7.b = defender index from previous turn
                cmp.b   d0,d7
                bne.s   @NewTarget
                
                addi.w  #2,d6           ; +2 priority if the defender is the same that the AI targeted on its previous turn (this is how targets become "sticky")
@NewTarget:
                
                bsr.w   AdjustTargetPriority
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function TargetPriorityScript1


; =============== S U B R O U T I N E =======================================

; +1 base priority
; +15 if target is expected to die
; +1 if target loses more than 2/3 of remaining health
; +1 if target is brought under 1/5 max HP
; +2 if target is the same as last turn's target


TargetPriorityScript2:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6           ; start with 1 priority
                tst.w   d1
                bne.s   @CheckDamageThreshold
                
                addi.w  #15,d6          ; +15 priority if the defender is expected to die from the attack
@CheckDamageThreshold:
                
                bsr.w   IsRemainingHpAboveOneThirdOfCurrent
                bcs.s   @CheckRemainingHpThreshold
                
                addq.w  #1,d6           ; +1 priority if the attack does more than 2/3 of defender's remaining HP
@CheckRemainingHpThreshold:
                
                bsr.w   IsRemainingHpAboveOneFifthOfMax
                bcs.s   @CheckLastTarget
                
                addq.w  #1,d6           ; +1 priority if defender is expected to be left with less than 1/5 of max HP
@CheckLastTarget:
                
                lea     (AI_LAST_TARGET_TABLE).l,a1
                clr.w   d5
                move.b  d4,d5           ; d5.b = attacker index
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d5
                clr.w   d7
                move.b  (a1,d5.w),d7    ; d7.b = defender index from previous turn
                cmp.b   d0,d7
                bne.s   @FinalAdjustment
                
                addi.w  #2,d6           ; +2 priority if the defender is the same that the AI targeted on its previous turn (this is how targets become "sticky")
@FinalAdjustment:
                
                bsr.w   AdjustTargetPriority
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
                beq.w   @CheckAttackLethality ; randomly branch to attack lethality check 1/3 of the time
                
                move.b  d5,d0           ; otherwise, prioritize closer targets
                add.b   d0,d0
                moveq   #18,d6          ; start with 18 priority
                sub.b   d0,d6           ; subtract 2x the move required to attack target from priority
                bcc.s   @Continue       
                
                moveq   #0,d6           ; clamp to 0
@Continue:
                
                addq.w  #1,d6           ; min priority = 1
                bra.w   @Done
@CheckAttackLethality:
                
                moveq   #1,d6           ; start with 1 priority
                tst.w   d1
                bne.s   @Done
                addi.w  #15,d6          ; +15 priority if the defender is expected to die from the attack
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function TargetPriorityScript3


; =============== S U B R O U T I N E =======================================

; +1 base priority
; +15 if target is expected to die
; +1 if target is brought under 1/5 max HP


TargetPriorityScript4:
                
                movem.l d0-d5/d7-a6,-(sp)
                moveq   #1,d6           ; start with 1 priority
                tst.w   d1
                bne.s   @CheckRemainingHpThreshold
                
                addi.w  #15,d6          ; +15 priority if the defender is expected to die from the attack
@CheckRemainingHpThreshold:
                
                bsr.w   IsRemainingHpAboveOneFifthOfMax
                bcs.s   @Done
                
                addq.w  #1,d6           ; +1 priority if defender is expected to be left with less than 1/5 of max HP
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function TargetPriorityScript4

