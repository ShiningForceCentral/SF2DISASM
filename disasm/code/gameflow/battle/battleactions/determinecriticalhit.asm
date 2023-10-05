
; ASM FILE code\gameflow\battle\battleactions\determinecriticalhit.asm :
; 0xAC4E..0xACCA : Determine critical hit function

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d6.w = damage

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

battlesceneScript_DetermineCriticalHit:
                
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #PROWESS_MASK_CRITICAL,d1
                move.w  d1,d2
                lsl.w   #1,d2
                lea     table_CriticalHitDefinitions(pc,d2.w),a0
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
                
                jsr     (GenerateRandomOrDebugNumber).w
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
                move.b  #-1,criticalHit(a2)
                move.b  (a4),d0
                jsr     GetEquippedWeapon
            if (STANDARD_BUILD=1)
                bmi.s   @Return
                lea     table_CutOffWeapons(pc), a0
                clr.w   d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Return
            else
                cmpi.w  #ITEM_GISARME,d1
                bne.s   @Skip
            endif
                move.b  (a5),d0
                move.w  #SPELL_DESOUL,d1
                bsr.w   GetResistanceToSpell
                cmpi.w  #RESISTANCESETTING_STATUSEFFECT_IMMUNITY,d2
                beq.s   @Skip           ; skip if target is immune to desoul
                move.b  #-1,cutoff(a2)
                clr.b   criticalHit(a2)
@Skip:
                
                bra.s   @Return
@SetInflictAilment:
                
                move.b  #-1,inflictAilment(a2)
@Return:
                
                rts

    ; End of function battlesceneScript_DetermineCriticalHit

