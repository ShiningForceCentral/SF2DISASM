
; ASM FILE code\gameflow\battle\battleactionsengine_3.asm :
; 0xA34E..0xA54E : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

WriteBattlesceneScript_End:
                
                movem.l d0-d3/a0,-(sp)
                endAnimation
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                moveq   #3,d6
                bsr.w   WriteBattlesceneScript_SwitchTargets
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGETS_LIST-$1000000)).w,a5
                tst.b   curseInaction(a2)
                bne.w   loc_A3B2
                tst.b   silencedActor(a2)
                bne.w   loc_A3B2
                tst.b   stunInaction(a2)
                bne.w   loc_A3B2
                move.b  (a4),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_A396
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A3B2
                bra.s   loc_A3AE
loc_A396:
                
                cmpi.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                bne.w   loc_A3B2
                move.b  (a5),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A3B2
loc_A3AE:
                
                bsr.w   WriteBattlesceneScript_EXPandGold
loc_A3B2:
                
                lea     allCombatantsCurrentHpTable(a2),a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   loc_A3BE
loc_A3BC:
                
                addq.w  #1,d0
loc_A3BE:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   loc_A3CE
                move.w  -(a0),d1
                jsr     SetCurrentHP
                bra.s   loc_A3BC
loc_A3CE:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                bra.s   loc_A3D6
loc_A3D4:
                
                addq.w  #1,d0
loc_A3D6:
                
                cmpi.w  #COMBATANT_ENEMIES_END,d0
                bgt.s   byte_A3E6
                move.w  -(a0),d1
                jsr     SetCurrentHP
                bra.s   loc_A3D4
byte_A3E6:
                
                bscHideTextBox
                bscEnd
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteBattlesceneScript_End


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of actor index
;     A5 = address in RAM of target index

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

WriteBattlesceneScript_DoAction:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   loc_A404
                bsr.w   WriteBattlesceneScript_Attack
                bra.s   loc_A458
loc_A404:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   loc_A410
                bsr.w   WriteBattlesceneScript_CastSpell
                bra.s   loc_A458
loc_A410:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   loc_A41C
                bsr.w   WriteBattlesceneScript_UseItem
                bra.s   loc_A458
loc_A41C:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   loc_A436
                move.w  #BATTLEACTION_BURST_ROCK_POWER,d6
                bsr.w   WriteBattlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   loc_A434
                bsr.w   WriteBattlesceneScript_DeathMessage
loc_A434:
                
                bra.s   loc_A458
loc_A436:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.w   loc_A440
                bra.s   loc_A458
loc_A440:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   loc_A458
                move.w  #BATTLEACTION_PRISM_LASER_POWER,d6
                bsr.w   WriteBattlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   loc_A458
                bsr.w   WriteBattlesceneScript_DeathMessage
loc_A458:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteBattlesceneScript_DoAction


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

FinalDoubleAttackCheck:
                
                movem.l d0-d3/a0,-(sp)
                tst.b   doubleAttack(a2)
                beq.w   @ClearDoubleAttack
                tst.b   targetDies(a2)
                bne.w   @ClearDoubleAttack
                tst.b   muddledActor(a2)
                bne.w   @ClearDoubleAttack
                tst.b   targetIsOnSameSide(a2)
                bne.w   @ClearDoubleAttack
                bra.w   @CheckDebugDouble
@ClearDoubleAttack:
                
                clr.b   doubleAttack(a2)
@CheckDebugDouble:
                
                tst.b   debugDouble(a2)
                beq.s   @Done
                move.b  #$FF,doubleAttack(a2)
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function FinalDoubleAttackCheck


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
; 
; Out: -12(A2) = 0 if false, otherwise true

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

IsAbleToCounterAttack:
                
                movem.l d0-d3/a0,-(sp)
                tst.b   counterAttack(a2)
                beq.w   @ClearCounter
                tst.b   targetDies(a2)
                bne.w   @ClearCounter
                tst.b   muddledActor(a2)
                bne.w   @ClearCounter
                tst.b   targetIsOnSameSide(a2)
                bne.w   @ClearCounter
                move.b  (a4),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_SLEEP,d1
                bne.w   @ClearCounter
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_STUN,d1
                bne.w   @ClearCounter
                
                ; Enemies that cannot counter
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_TAROS,d1 ; HARDCODED enemy indexes
                beq.w   @ClearCounter
                
                ; Enemies that cannot be countered
                move.b  (a4),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_BURST_ROCK,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_KRAKEN_HEAD,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_PRISM_FLOWER,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                beq.w   @ClearCounter
                move.b  (a4),d0
                move.b  (a5),d1
                jsr     GetDistanceBetweenEntities
                move.b  (a4),d0
                jsr     GetAttackRange  
                cmp.b   d3,d2
                bhi.w   @ClearCounter
                cmp.b   d4,d2
                bcs.w   @ClearCounter
                bra.w   @CheckDebugCounter
@ClearCounter:
                
                clr.b   counterAttack(a2)
@CheckDebugCounter:
                
                tst.b   debugCounter(a2)
                beq.s   @Done
                move.b  #$FF,counterAttack(a2)
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function IsAbleToCounterAttack

