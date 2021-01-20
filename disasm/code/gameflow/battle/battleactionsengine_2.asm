
; ASM FILE code\gameflow\battle\battleactionsengine_2.asm :
; 0x9F28..0xA200 : Battle actions engine

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

InitBattlesceneProperties:
                
                movem.l d0-d3/a0,-(sp)
                lea     allCombatantsCurrentHpTable(a2),a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   @CreateListOfAlliesCurrentHP
@CreateListOfAlliesCurrentHP_Loop:
                
                addq.w  #1,d0
@CreateListOfAlliesCurrentHP:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   @Break1
                jsr     GetCurrentHP
                move.w  d1,-(a0)
                bra.s   @CreateListOfAlliesCurrentHP_Loop
@Break1:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                bra.s   @CreateListOfEnemiesCurrentHP
@CreateListOfEnemiesCurrentHP_Loop:
                
                addq.w  #1,d0
@CreateListOfEnemiesCurrentHP:
                
                cmpi.w  #COMBATANT_ENEMIES_END,d0
                bgt.s   @Break2
                jsr     GetCurrentHP
                move.w  d1,-(a0)
                bra.s   @CreateListOfEnemiesCurrentHP_Loop
@Break2:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   @CheckAttack
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   @CheckAttack
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE2,d1
                beq.s   @CheckSameSide
                move.b  #$FF,muddledActor(a2)
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
                jsr     GetDistanceBetweenEntities
                cmpi.w  #2,d2           ; check if block distance between actor and target is >= 2
                bcs.s   @CheckInactionCurse
                tst.b   muddledActor(a2)
                bne.s   @CheckInactionCurse
                move.b  #$FF,rangedAttack(a2)
@CheckInactionCurse:
                
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_CURSE,d1
                beq.s   @CheckInactionStun
                moveq   #INACTION_CHANCE_CURSE,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                seq     curseInaction(a2)
@CheckInactionStun:
                
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_STUN,d1
                beq.s   @Skip1
                moveq   #INACTION_CHANCE_STUN,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                seq     stunInaction(a2)
@Skip1:
                
                bra.s   @Done
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckUseItem
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d0
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d0
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                andi.w  #SPELLENTRY_LOWERMASK_LV,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
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
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),((CURRENT_BATTLE_ITEM-$1000000)).w
                bra.w   @Done
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @CheckNoAction
                bra.w   @Done
@CheckNoAction:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.s   @CheckPrismLaser
                bra.w   @Done
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   *+4
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function InitBattlesceneProperties


; =============== S U B R O U T I N E =======================================

; Load proper battlescene message script depending on action
; 
; In: A3 = action type index in RAM
;     A4 = actor index in RAM
; 
; <HARDCODED> enemy and message indexes


CreateBattlesceneMessage:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @CheckSpellcast ; HARDCODED attack lines
                move.w  ((BATTLESCENE_ATTACK_TYPE-$1000000)).w,d2
                move.w  #MESSAGE_BATTLE_ATTACK,d1 ; {NAME}'s attack!
                tst.w   d2
                beq.w   @Message_Attack 
                move.w  #MESSAGE_BATTLE_SECOND_ATTACK,d1 ; {NAME}'s second{N}attack!
                cmpi.w  #BATTLEACTION_ATTACKTYPE_SECOND,d2
                beq.w   @Message_Attack 
                move.w  #MESSAGE_BATTLE_COUNTER_ATTACK,d1 ; {NAME}'s counter{N}attack!
@Message_Attack:
                
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckSpellcast:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.w   @CheckUseItem
                
                ; HARDCODED spell text indexes !
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d2
                move.w  #MESSAGE_SPELLCAST_PUT_ON_A_DEMON_SMILE,d1 ; {NAME} put on{N}a demon's smile.
                cmpi.w  #SPELL_SPOIT,d2
                beq.w   @SpellcastMessage
                move.w  #MESSAGE_SPELLCAST_BELCHED_OUT_FLAMES,d1 ; {NAME} belched{N}out flames!
                cmpi.w  #SPELL_FLAME,d2
                beq.w   @SpellcastMessage
                cmpi.w  #SPELL_KIWI,d2
                beq.w   @SpellcastMessage
                move.w  #MESSAGE_SPELLCAST_BLEW_OUT_A_SNOWSTORM,d1 ; {NAME} blew out{N}a snowstorm!
                cmpi.w  #SPELL_SNOW,d2
                beq.w   @SpellcastMessage
                move.w  #MESSAGE_SPELLCAST_CAST_DEMON_BREATH,d1 ; {NAME} cast{N}demon breath!
                cmpi.w  #SPELL_DEMON,d2
                beq.w   @SpellcastMessage
                move.w  #MESSAGE_SPELLCAST_ODD_EYE_BEAM,d1 ; Odd-eye beam!
                cmpi.w  #SPELL_ODDEYE,d2
                beq.w   @SpellcastMessage
                move.w  #MESSAGE_SPELLCAST_SUMMONED,d1 ; {NAME} summoned{N}{SPELL}!{D1}
                cmpi.w  #SPELL_DAO,d2
                beq.w   @SpellcastMessage
                cmpi.w  #SPELL_APOLLO,d2
                beq.w   @SpellcastMessage
                cmpi.w  #SPELL_NEPTUN,d2
                beq.w   @SpellcastMessage
                cmpi.w  #SPELL_ATLAS,d2
                beq.w   @SpellcastMessage
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d2
                move.w  #MESSAGE_SPELLCAST_BLEW_OUT_AQUA_BREATH,d1 ; {NAME} blew out{N}aqua-breath!
                cmpi.w  #SPELL_AQUA,d2
                beq.w   @SpellcastMessage
                move.w  #MESSAGE_SPELLCAST_BLEW_OUT_BUBBLE_BREATH,d1 
                                                        ; {NAME} blew out{N}bubble-breath!
                cmpi.w  #SPELL_AQUA|SPELL_LV2,d2
                beq.w   @SpellcastMessage
                move.w  #MESSAGE_SPELLCAST_DEFAULT,d1 ; {NAME} cast{N}{SPELL} level {#}!
@SpellcastMessage:
                
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d2
                move.w  ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w,d3
                addq.w  #1,d3
                displayMessage d1,d0,d2,d3 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @CheckBurstRock
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d2
                displayMessage #MESSAGE_BATTLE_USED_ITEM,d0,d2,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @CheckMuddled
                displayMessage #MESSAGE_BATTLE_EXPLODED,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.s   @Done
@CheckMuddled:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.w   @CheckPrismLaser
                move.w  d0,d2           ; random MUDDLE lines
                move.w  #MESSAGE_BATTLE_MUDDLED_ACTIONS_START,d1 ; HARDCODED Muddle line start index
                moveq   #$10,d0
                jsr     (GetRandomOrDebugValue).w
                cmpi.w  #9,d0           ; HARDCODED number of available Muddle lines
                bls.s   @Message_Muddled
                clr.w   d0
@Message_Muddled:
                
                add.w   d0,d1
                move.w  d2,d0
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.s   @Done
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   @Done
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                bne.s   @PrismFlower    
                move.w  #MESSAGE_BATTLE_DEMON_LASER,d1 ; 0141=Demon laser!
                bra.s   @BattleMessage_PrismLaser
@PrismFlower:
                
                move.w  #MESSAGE_BATTLE_PRISM_LASER,d1 ; 013F=Prism laser!
@BattleMessage_PrismLaser:
                
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CreateBattlesceneMessage

