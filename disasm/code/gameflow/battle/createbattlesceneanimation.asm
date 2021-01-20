
; ASM FILE code\gameflow\battle\createbattlesceneanimation.asm :
; 0xA200..0xA34E : Create battlescene animation function

; =============== S U B R O U T I N E =======================================

; Load proper battlescene sprite/magic animation properties
; 
;       In: A2 = battlescene script stack frame
;           A3 = pointer to action data in RAM
;           A4 = battlescene actor index in RAM

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

CreateBattlesceneAnimation:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckMuddled
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     GetSpellCost    
                move.w  d1,d2
                neg.w   d2
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,d2,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @CheckMuddled
@EnemyReaction:
                
                executeEnemyReaction #0,d2,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
@CheckMuddled:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                beq.w   @Skip           ; skip if action type is "muddled"
                bscHideTextBox
                bsr.w   GetSpellAnimation
                moveq   #BATTLEANIMATION_ATTACK,d5
                tst.w   (a3)
                bne.s   @CheckCastSpell
                
                ; Determine attack animation
                move.b  (a4),d0
                jsr     GetClass        
                moveq   #ALLYBATTLEANIMATION_SPECIAL_MMNK,d5 ; HARDCODED class and battle animation indexes
                cmpi.w  #CLASS_MMNK,d1  ; MMNK
                beq.w   @DetermineSpecialCritical
                moveq   #ALLYBATTLEANIMATION_SPECIAL_RBT,d5
                cmpi.w  #CLASS_RBT,d1   ; RBT
                beq.w   @DetermineSpecialCritical
                moveq   #ALLYBATTLEANIMATION_SPECIAL_BRGN,d5
                cmpi.w  #CLASS_BRGN,d1  ; BRGN
                bne.s   @RegularAttackAnimation
                jsr     GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                bne.s   @RegularAttackAnimation
                moveq   #ALLYBATTLEANIMATION_SPECIAL_BRGN,d5
                moveq   #SPELLANIMATION_NONE,d4
                beq.w   @AnimateSprite
@RegularAttackAnimation:
                
                moveq   #BATTLEANIMATION_ATTACK,d5
                bra.w   @AnimateSprite
@DetermineSpecialCritical:
                
                moveq   #CHANCE_TO_PERFORM_SPECIAL_ATTACK,d0 ; 1/16 chance to perform special MMNK or RBT attack animation (which also forces a critical hit)
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   @RegularAttackAnimation_0
                move.b  #$FF,specialCritical(a2)
                bra.w   @AnimateSprite
@RegularAttackAnimation_0:
                
                moveq   #BATTLEANIMATION_ATTACK,d5
                bra.w   @AnimateSprite
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckUseItem
                
                ; Determine spellcasting animation
                move.b  (a4),d0
                jsr     GetClass        
                moveq   #ALLYBATTLEANIMATION_SPECIAL_MNST,d5
                cmpi.w  #CLASS_MNST,d1  ; MNST
                beq.w   @AnimateSprite
                jsr     GetEnemyIndex   
                moveq   #ENEMYBATTLEANIMATION_SPECIAL_HELL_HOUND,d5
                cmpi.w  #ENEMY_HELL_HOUND,d1 ; HARDCODED enemy indexes
                beq.w   @AnimateSprite
                cmpi.w  #ENEMY_CERBERUS,d1
                beq.w   @AnimateSprite
                moveq   #ENEMYBATTLEANIMATION_SPECIAL_DEVIL_GRIFFIN,d5
                cmpi.w  #ENEMY_DEVIL_GRIFFIN,d1
                beq.w   @AnimateSprite
                moveq   #ENEMYBATTLEANIMATION_SPECIAL_ODD_EYE,d5
                cmpi.w  #ENEMY_ODD_EYE,d1
                beq.w   @AnimateSprite
                moveq   #BATTLEANIMATION_ATTACK,d5
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   @AnimateSprite
                moveq   #BATTLEANIMATION_USE_ITEM,d5
@AnimateSprite:
                
                bsr.w   WriteBattlesceneScript_AnimateAction
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @Skip           ; skip if action type is NOT "burst rock"
                move.w  #$8000,d2
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction_BurstRock
                executeAllyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BurstRockSelfDestruction
@EnemyReaction_BurstRock:
                
                executeEnemyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BurstRockSelfDestruction:
                
                moveq   #0,d1           ; Burst Rock is killed when it explodes
                jsr     SetCurrentHP
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CreateBattlesceneAnimation

