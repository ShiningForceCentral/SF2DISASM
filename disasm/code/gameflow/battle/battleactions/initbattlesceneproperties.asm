
; ASM FILE code\gameflow\battle\battleactions\initbattlesceneproperties.asm :
; 0x9F28..0xA05C : Init Battlescene Properties function

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a3 = battleaction data pointer
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

battlesceneScript_InitializeBattlesceneProperties:
                
                movem.l d0-d3/a0,-(sp)
                lea     allCombatantsCurrentHpTable(a2),a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   @PopulateAlliesCurrentHp
@PopulateAlliesCurrentHp_Loop:
                
                addq.w  #1,d0
@PopulateAlliesCurrentHp:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   @Break1
                jsr     GetCurrentHp
                move.w  d1,-(a0)
                bra.s   @PopulateAlliesCurrentHp_Loop
@Break1:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                bra.s   @PopulateEnemiesCurrentHp
@PopulateEnemiesCurrentHp_Loop:
                
                addq.w  #1,d0
@PopulateEnemiesCurrentHp:
                
                cmpi.w  #COMBATANT_ENEMIES_END,d0
                bgt.s   @Break2
                jsr     GetCurrentHp
                move.w  d1,-(a0)
                bra.s   @PopulateEnemiesCurrentHp_Loop
@Break2:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   @CheckAttack
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   @CheckAttack
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE2,d1
                beq.s   @CheckSameSide
                move.b  #-1,muddledActor(a2)
                bra.s   @CheckAttack
@CheckSameSide:
                
                move.b  (a5),d1
                eor.b   d1,d0
                spl     targetIsOnSameSide(a2)
@CheckAttack:
                
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @CheckCastSpell
                move.b  (a4),d0
                move.b  (a5),d1
                jsr     GetDistanceBetweenBattleEntities
                cmpi.w  #2,d2           ; check if block distance between actor and target is >= 2
                bcs.s   @CheckInactionCurse
                tst.b   muddledActor(a2)
                bne.s   @CheckInactionCurse
                move.b  #-1,rangedAttack(a2)
@CheckInactionCurse:
                
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_CURSE,d1
                beq.s   @CheckInactionStun
                moveq   #INACTION_CHANCE_CURSE,d0
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                seq     curseInaction(a2)
@CheckInactionStun:
                
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_STUN,d1
                beq.s   @Skip1
                moveq   #INACTION_CHANCE_STUN,d0
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                seq     stunInaction(a2)
@Skip1:
                
                bra.s   @Done
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckUseItem
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d0
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                move.w  d0,((BATTLESCENE_SPELL_INDEX-$1000000)).w
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d0
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                andi.w  #SPELLENTRY_LOWERMASK_LV,d0
                move.w  d0,((BATTLESCENE_SPELL_LEVEL-$1000000)).w
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   @Skip2
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_SILENCE,d1
                sne     silencedActor(a2)
@Skip2:
                
                bra.s   @Done
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   @CheckBurstRock
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),((BATTLESCENE_ITEM-$1000000)).w
                bra.w   @Done
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @CheckNoAction
                bra.w   @Done
@CheckNoAction:
                
                cmpi.w  #BATTLEACTION_MUDDLED,(a3)
                bne.s   @CheckPrismLaser
                bra.w   @Done
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   *+4
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_InitializeBattlesceneProperties

