
; ASM FILE code\gameflow\battle\battleactions\battleactionsengine_2.asm :
; 0xA34E..0xA49C : Battleactions Engine, part 2

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttackToggle = -14
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

battlesceneScript_End:
                
                movem.l d0-d3/a0,-(sp)
                endAnimation
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                moveq   #3,d6
                bsr.w   battlesceneScript_SwitchTargets
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
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   loc_A3B2
                bra.s   loc_A3AE
loc_A396:
                
                cmpi.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                bne.w   loc_A3B2
                move.b  (a5),d0
                jsr     GetCurrentHp
                tst.w   d1
                beq.w   loc_A3B2
loc_A3AE:
                
                bsr.w   battlesceneScript_GiveExpAndGold
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
                jsr     SetCurrentHp
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
                jsr     SetCurrentHp
                bra.s   loc_A3D4
byte_A3E6:
                
                bscCloseDialogueWindow
                bscEnd
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_End


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a3 = battleaction type pointer
;     a4 = actor index pointer
;     a5 = target index pointer

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttackToggle = -14
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

battlesceneScript_ApplyActionEffect:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @IsCastSpell
                
                bsr.w   battlesceneScript_Attack
                bra.s   @Done
@IsCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @IsUseItem
                
                bsr.w   battlesceneScript_CastSpell
                bra.s   @Done
@IsUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   @IsBurstRock
                
                bsr.w   battlesceneScript_UseItem
                bra.s   @Done
@IsBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @IsMuddled
                
                move.w  #BATTLEACTION_BURST_ROCK_POWER,d6
            if (STANDARD_BUILD&TRAP_DAMAGE_RAISES_WITH_DIFFICULTY=1)
                bsr.w   GetDifficulty
                addq.w  #4,d1
                mulu.w  d1,d6
                lsr.w   #2,d6
            endif
                bsr.w   battlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   @Goto_Done
                
                ; Burst Rock dies
                bsr.w   battlesceneScript_DisplayDeathMessage
@Goto_Done:
                
                bra.s   @Done
@IsMuddled:
                
                cmpi.w  #BATTLEACTION_MUDDLED,(a3)
                bne.w   @IsPrismLaser
                bra.s   @Done
@IsPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   @Done
                move.w  #BATTLEACTION_PRISM_LASER_POWER,d6
            if (STANDARD_BUILD&TRAP_DAMAGE_RAISES_WITH_DIFFICULTY=1)
                bsr.w   GetDifficulty
                addq.w  #4,d1
                mulu.w  d1,d6
                lsr.w   #2,d6
            endif
                bsr.w   battlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   @Done
                bsr.w   battlesceneScript_DisplayDeathMessage
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_ApplyActionEffect


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttackToggle = -14
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

battlesceneScript_ValidateDoubleAttack:
                
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
                
                move.b  #-1,doubleAttack(a2)
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_ValidateDoubleAttack

