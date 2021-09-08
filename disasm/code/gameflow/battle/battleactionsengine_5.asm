
; ASM FILE code\gameflow\battle\battleactionsengine_5.asm :
; 0xA872..0xACCA : Battle actions engine

; =============== S U B R O U T I N E =======================================


CalculateHealingEXP:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   @Skip           ; skip if enemy
                
                ; Check if healer class
                jsr     GetClass        
                cmpi.b  #CLASS_PRST,d1  ; HARDCODED healer class indexes
                beq.w   @Continue
                cmpi.b  #CLASS_VICR,d1
                beq.w   @Continue
                cmpi.b  #CLASS_MMNK,d1
                beq.w   @Continue
                bra.w   @Skip           ; skip if not a healer class
@Continue:
                
                move.b  (a5),d0
                jsr     GetMaxHP
                tst.w   d1
                beq.w   @Skip           ; safety measure to prevent division by 0
                move.w  #25,d5
                mulu.w  d6,d5
                divu.w  d1,d5
                cmpi.w  #10,d5
                bcc.s   @GiveEXP
                moveq   #10,d5
@GiveEXP:
                
                bsr.w   GiveEXPandHealingCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CalculateHealingEXP


; =============== S U B R O U T I N E =======================================


CalculateDamageEXP:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Skip           ; skip function if actor is an enemy
                move.b  (a5),d0
                jsr     GetMaxHP
                tst.w   d1
                beq.w   @Skip           ; skip function to prevent division by zero error
                bsr.w   GetAmountOfEXPforEncounter
                mulu.w  d6,d5
                divu.w  d1,d5
                bsr.w   GiveEXPandCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CalculateDamageEXP


; =============== S U B R O U T I N E =======================================


GiveStatusEffectSpellsEXP:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done
                moveq   #STATUSEFFECT_SPELLS_EXP,d5
                bsr.w   GiveEXPandCap
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function GiveStatusEffectSpellsEXP


; =============== S U B R O U T I N E =======================================


GiveEXPandGoldForKill:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Skip           ; skip if actor is an enemy
                bsr.w   GetAmountOfEXPforEncounter
                bsr.w   GiveEXPandCap
                move.b  (a5),d0
                bpl.s   @Skip
                jsr     GetEnemyIndex   
                add.w   d1,d1
                lea     tbl_EnemyGold(pc), a0
                adda.w  d1,a0
                move.w  (a0),d0
                add.w   d0,((BATTLESCENE_GOLD-$1000000)).w
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function GiveEXPandGoldForKill


; =============== S U B R O U T I N E =======================================


GiveEXPandCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #49,((BATTLESCENE_EXP-$1000000)).w
                ble.s   @Return
                move.w  #49,((BATTLESCENE_EXP-$1000000)).w
@Return:
                
                rts

    ; End of function GiveEXPandCap


; =============== S U B R O U T I N E =======================================


GiveEXPandHealingCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #HEALING_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
                ble.s   @Return
                move.w  #HEALING_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
@Return:
                
                rts

    ; End of function GiveEXPandHealingCap


; =============== S U B R O U T I N E =======================================

; Get amount of EXP gained from encounter based on level difference between actor and target
; 
;       In: A4 = pointer to actor index in RAM
;           A5 = pointer to target index in RAM
; 
;       Out: D5 = amount of EXP


GetAmountOfEXPforEncounter:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a5),d0
                jsr     GetCurrentLevel 
                move.w  d1,d2
                move.b  (a4),d0
                jsr     GetClass        
                move.w  d1,d3
                jsr     GetCurrentLevel 
                cmpi.b  #CHAR_CLASS_FIRSTPROMOTED,d3
                bcs.s   @Continue
                addi.w  #CHAR_CLASS_EXTRALEVEL,d1
@Continue:
                
                sub.w   d2,d1
                moveq   #50,d5          ; HARDCODED EXP amounts
                cmpi.b  #3,d1
                bmi.w   @Done
                moveq   #40,d5
                cmpi.b  #3,d1
                beq.w   @Done
                moveq   #30,d5
                cmpi.b  #4,d1
                beq.w   @Done
                moveq   #20,d5
                cmpi.b  #5,d1
                beq.w   @Done
                moveq   #10,d5
                cmpi.b  #6,d1
                beq.w   @Done
                moveq   #0,d5
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function GetAmountOfEXPforEncounter


; =============== S U B R O U T I N E =======================================


SortTargets:
                
                movem.l d0-d2/d6-a0,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bls.w   loc_AA92
loc_A9DE:
                
                move.b  (a0,d7.w),d0
                bpl.s   loc_A9F8
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_BURST_ROCK,d1
                bne.s   loc_A9F8
                ori.b   #COMBATANT_MASK_SORT_BIT,d0
                move.b  d0,(a0,d7.w)
loc_A9F8:
                
                dbf     d7,loc_A9DE
                lea     ((TARGETS_LIST-$1000000)).w,a0
                moveq   #0,d0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
loc_AA0A:
                
                move.w  d0,d1
                addq.w  #1,d1
loc_AA0E:
                
                move.b  (a0,d0.w),d2
                cmp.b   (a0,d1.w),d2
                bcs.s   loc_AA22
                move.b  (a0,d1.w),(a0,d0.w)
                move.b  d2,(a0,d1.w)
loc_AA22:
                
                addq.w  #1,d1
                cmp.w   ((TARGETS_LIST_LENGTH-$1000000)).w,d1
                bcs.w   loc_AA0E
                addq.w  #1,d0
                dbf     d7,loc_AA0A
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
                moveq   #0,d6
loc_AA40:
                
                btst    #COMBATANT_BIT_SORT,(a0,d6.w)
                beq.s   loc_AA78
                move.b  (a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
                jsr     GetCurrentHP
                move.w  d1,d2
                move.b  1(a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
                jsr     GetCurrentHP
                cmp.w   d1,d2
                bcc.s   loc_AA78
                move.b  (a0,d6.w),d0
                move.b  1(a0,d6.w),(a0,d6.w)
                move.b  d0,1(a0,d6.w)
loc_AA78:
                
                addq.w  #1,d6
                dbf     d7,loc_AA40
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
loc_AA88:
                
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,(a0,d7.w)
loc_AA8E:
                
                dbf     d7,loc_AA88
loc_AA92:
                
                movem.l (sp)+,d0-d2/d6-a0
                rts

    ; End of function SortTargets


; =============== S U B R O U T I N E =======================================


OneSecondSleep:
                
                move.l  d0,-(sp)
                moveq   #60,d0
                jsr     (Sleep).w       
                move.l  (sp)+,d0
                rts

    ; End of function OneSecondSleep


; =============== S U B R O U T I N E =======================================


NopOnce:
                
                nop
                rts

    ; End of function NopOnce


; =============== S U B R O U T I N E =======================================


NopTwice:
                
                nop
                nop
                rts

    ; End of function NopTwice


; =============== S U B R O U T I N E =======================================


NopThrice:
                
                nop
                nop
                nop
                rts

    ; End of function NopThrice


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

WriteBattlesceneScript_Attack:
                
                bsr.w   WriteBattlesceneScript_DodgeAttack
                tst.b   dodge(a2)
                bne.w   loc_AAF6
                bsr.w   CalculateDamage 
                bsr.w   DetermineCriticalHit
                bsr.w   WriteBattlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   loc_AADC
                bsr.w   WriteBattlesceneScript_DeathMessage
                bra.w   return_AAFA
loc_AADC:
                
                bsr.w   WriteBattlesceneScript_InflictAilment
                bsr.w   WriteBattlesceneScript_InflictCurseDamage
                tst.b   targetDies(a2)
                beq.s   loc_AAF6
                exg     a4,a5
                bsr.w   WriteBattlesceneScript_DeathMessage
                exg     a4,a5
                bra.w   return_AAFA
loc_AAF6:
                
                bsr.w   DetermineDoubleAndCounter
return_AAFA:
                
                rts

    ; End of function WriteBattlesceneScript_Attack


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     A4 = pointer to actor index in RAM
;     A5 = pointer to target index in RAM

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

WriteBattlesceneScript_DodgeAttack:
                
                move.b  (a5),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_SLEEP,d1
                bne.w   @Return
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_STUN,d1
                bne.w   @Return
                moveq   #CHANCE_TO_DODGE_MUDDLED_ATTACKER,d2 ; 1/2 chance to dodge if attacker is muddled
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE,d1
                bne.w   @CheckDebugDodge
                moveq   #CHANCE_TO_DODGE_DEFAULT,d2 ; 1/32 chance to miss otherwise ?
                move.b  (a5),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1 ; check if target is either flying or hovering
                beq.w   @CheckIfAttackerIsAnArcher
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                bra.w   @CheckDebugDodge
@CheckIfAttackerIsAnArcher:
                
                move.b  (a4),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_BRASS_GUNNER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_ARCHER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_CENTAUR_ARCHER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_STEALTH_ARCHER,d1
                beq.w   @CheckDebugDodge
                moveq   #CHANCE_TO_DODGE_FOR_AIRBORNE_TARGET,d2 ; 1/8 chance to dodge if target is flying or hovering, and if attacker is not an archer
@CheckDebugDodge:
                
                tst.b   debugDodge(a2)
                beq.s   @DetermineDodge
                moveq   #0,d2
@DetermineDodge:
                
                move.w  d2,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.w   @Return
                move.w  #$FFFF,d4
                move.w  #1,d5
                exg     a4,a5
                bsr.w   WriteBattlesceneScript_AnimateAction
                displayMessage #MESSAGE_BATTLE_DODGE,(a4),#0,#0 ; Message, Combatant, Item or Spell, Number
                bsr.w   WriteBattlesceneScript_IdleSprite
                exg     a4,a5
                move.b  #$FF,dodge(a2)
@Return:
                
                rts

    ; End of function WriteBattlesceneScript_DodgeAttack


; =============== S U B R O U T I N E =======================================

; In: A4 = attacker index in RAM
;     A5 = defender index in RAM
; 
; Out: D6 = damage


CalculateDamage:
                
                move.b  (a4),d0
                jsr     GetCurrentATT
                move.w  d1,d2
                move.b  (a5),d0
                jsr     GetCurrentDEF
                sub.w   d1,d2
                bhi.s   @BaseDamage     
                moveq   #1,d2           ; minimum base damage = 1
@BaseDamage:
                
                move.w  d2,d6           ; D6 = base damage
                
                ; Evaluate land effect's damage reduction
                move.b  (a5),d0
                jsr     GetLandEffectSetting
                move.w  #256,d3         ; if land effect displays "0%", do not reduce damage
                tst.b   d1
                beq.w   @ApplyLandEffectToDamage
                move.w  #230,d3         ; else if land effect displays "15%", reduce damage to 230/256
                cmpi.b  #1,d1
                beq.w   @ApplyLandEffectToDamage
                move.w  #205,d3         ; otherwise, reduce damage to 205/256
@ApplyLandEffectToDamage:
                
                mulu.w  d3,d6
                lsr.w   #8,d6
                
                ; Check if defender is flying or hovering
                move.b  (a5),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                bra.w   @Return
@CheckIfAttackerIsAnArcher:
                
                move.b  (a4),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_BRASS_GUNNER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_CENTAUR_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_STEALTH_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                bra.w   @Return
@ApplyArcherDamageBonus:
                
                move.w  d6,d0
                lsr.w   #2,d0
                add.w   d0,d6           ; inflict an additional 25% of damage if an archer is attacking a flying or hovering combatant
@Return:
                
                rts

    ; End of function CalculateDamage


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     D6 = damage

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

DetermineCriticalHit:
                
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #PROWESS_MASK_CRITICAL,d1
                move.w  d1,d2
                lsl.w   #1,d2
                lea     tbl_CriticalHitSettings(pc,d2.w),a0
                clr.w   d0
                move.b  (a0),d0
                beq.s   @Return
                tst.b   specialCritical(a2)
                beq.s   @CheckDebugCritical
                moveq   #1,d0
@CheckDebugCritical:
                
                tst.b   debugCritical(a2)
                beq.s   @DetermineSuccess
                moveq   #0,d0
@DetermineSuccess:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   @Return
                move.b  1(a0),d0        ; success !
                beq.s   @CheckInflictAilment
                move.w  d6,d2
                lsr.w   d0,d2
                add.w   d2,d6
@CheckInflictAilment:
                
                cmpi.w  #PROWESS_INFLICT_AILMENTS_START,d1
                bcc.s   @SetInflictAilment
                move.b  #$FF,criticalHit(a2)
                move.b  (a4),d0
                jsr     GetEquippedWeapon
                cmpi.w  #ITEM_GISARME,d1
                bne.s   @Skip
                move.b  (a5),d0
                move.w  #SPELL_DESOUL,d1
                bsr.w   GetResistanceToSpell
                cmpi.w  #RESISTANCESETTING_STATUSEFFECT_IMMUNITY,d2
                beq.s   @Skip           ; skip if target is immune to desoul
                move.b  #$FF,cutoff(a2)
                clr.b   criticalHit(a2)
@Skip:
                
                bra.s   @Return
@SetInflictAilment:
                
                move.b  #$FF,inflictAilment(a2)
@Return:
                
                rts

    ; End of function DetermineCriticalHit

