
; ASM FILE code\gameflow\battle\battleactions\attack-standard.asm :

; =============== S U B R O U T I N E =======================================

; In: a2 = Battlescene script stack frame
;     a4 = Pointer to attacker index in RAM
;     a5 = Pointer to target index in RAM

; Attack action variables
currentHpTableSize = 2*(COMBATANT_ALLIES_SPACE_END+COMBATANT_ENEMIES_NUMBER)

finalDamage = -28-currentHpTableSize
leechAmountCap = -26-currentHpTableSize

; Battlescene script variables
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

battlesceneScript_Attack:
                
                move.b  (a5),d0
                jsr     GetCurrentHp
                move.w  d1,leechAmountCap(a2)   ; lifesteal weapons leech amount is capped to target's current HP prior to suffering damage
                
                bsr.w   battlesceneScript_DetermineDodge
                tst.b   dodge(a2)
                bne.s   @DoubleAndCounter
                
                bsr.w   battlesceneScript_CalculateDamage
                bsr.w   battlesceneScript_DetermineCriticalHit
                bsr.w   battlesceneScript_InflictDamage
                move.w  d6,finalDamage(a2)
                tst.b   targetDies(a2)
                beq.s   @AilmentAndCurse
                
                bsr.w   battlesceneScript_DisplayDeathMessage
                bra.s   AttackEffect_Lifesteal
@AilmentAndCurse:      
                
                bsr.w   battlesceneScript_InflictAilment
                bsr.s   AttackEffect_Lifesteal
                move.w  finalDamage(a2),d6
                bsr.w   battlesceneScript_InflictCurseDamage
                tst.b   targetDies(a2)
                bne.s   @Death
@DoubleAndCounter:
                
                bra.w   battlesceneScript_DetermineDoubleAndCounter
@Death:
                
                exg     a4,a5
                bsr.w   battlesceneScript_DisplayDeathMessage
                exg     a4,a5
                rts

    ; End of function battlesceneScript_Attack


; =============== S U B R O U T I N E =======================================

; In: a2 = Battlescene script stack frame
;     d6.w = Inflicted damage

AttackEffect_Lifesteal:    
                
                move.b  (a5),d0
                jsr     GetCurrentHp
                bne.s   @IsLifestealWeapon
                
                ; If target was killed, apply leech amount cap
                move.w  leechAmountCap(a2),d6
@IsLifestealWeapon:
                
                ; Is attacker using a lifesteal weapon?
                lea     table_LifestealWeapons(pc), a0
                move.b  (a4),d0                             ; d0.b = attacker
                jsr     GetEquippedWeapon
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Return
                
                ; Calculate leeched HP amount -> d6.w
                clr.w   d1
                move.b  (a0),d1
                beq.s   @MissingHpCap
                
                muls.w  d1,d6
                asr.l   #8,d6
                
@MissingHpCap:  jsr     GetMaxHp
                move.w  d1,d2
                jsr     GetCurrentHp
                sub.w   d1,d2
                cmp.w   d6,d2
                bhs.s   @CheckLeechAmount
                
                ; Cap recovery amount if missing HP is lower than leech amount
                move.w  d2,d6
@CheckLeechAmount:
                
                tst.w   d6
                beq.s   @Return             ; return if leech amount equals 0
                
                ; In: d0.b = attacker index, d6.w = leeched HP amount
                exg     a4,a5               ; a4 = pointer to target, a5 = pointer to attacker
                move.w    d6,d1
                jsr        IncreaseCurrentHp   ; second attack compensates the HP leeched on first hit (for missing HP recovery cap calculation)
                jsr     GetStatusEffects
                tst.b   d0
                bmi.s   @EnemyReaction
                
                executeAllyReaction d6,#0,d1,#2
                bra.s   @DisplayMessage
@EnemyReaction: executeEnemyReaction d6,#0,d1,#2
@DisplayMessage:
                
                bscCloseDialogueWindow
                displayMessage #MESSAGE_BATTLE_RECOVERED_HIT_POINTS,d0,#0,d6
                exg     a4,a5
                
@Return:        rts

    ; End of function AttackEffect_Lifesteal
