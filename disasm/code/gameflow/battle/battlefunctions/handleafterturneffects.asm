
; ASM FILE code\gameflow\battle\battlefunctions\handleafterturneffects.asm :
; 0x24242..0x2448A : Handle After Turn Effects function

; =============== S U B R O U T I N E =======================================

; Handle after-turn effects (status effects, HP/MP regen/degen, etc.)
; 
;       In: d0.w = combatant index

combatant = -2

ProcessAfterTurnEffects:
                
            if (STANDARD_BUILD=1)
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
            else
                bsr.w   ClearDeadCombatantsListLength
            endif
                link    a6,#-16
                move.w  d0,combatant(a6)
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @Skip           ; skip everything if combatant is dead
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                
                ; Check Stun
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_STUN,d1
                beq.s   @CheckSleep
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                andi.w  #STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                move.w  #CHANCE_TO_NO_LONGER_BE_STUNNED,d6 ; 1/2 chance to no longer be stunned
                jsr     (GenerateRandomNumber).w
                tst.w   d7
                bne.s   @Stunned        
                txt     358             ; "{CLEAR}{NAME} is no longer stunned.{D3}"
                clr.w   d1
                bra.s   @UpdateStun
@Stunned:
                
                txt     309             ; "{NAME} is stunned.{D3}"
@UpdateStun:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckSleep:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLEEP,d1
                beq.s   @CheckMuddle
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                
                ; Randomly wake early
                move.w  d1,d6
                jsr     (GenerateRandomNumber).w
                andi.w  #STATUSEFFECT_SLEEP,d7 ; Chance to wake early is determined by the sleep counter :
                                        ;   - 1/4 on the first turn
                                        ;   - 1/3 on the second
                                        ;   - 1/2 on the third
                bne.s   @Sleeping       
                txt     354             ; "{CLEAR}{NAME} has awakened.{D3}"
                clr.w   d1
                bra.s   @UpdateSleep
@Sleeping:
                
                txt     306             ; "{NAME} is sleeping.{D3}"
                subi.w  #STATUSEFFECTCOUNTER_SLEEP,d1 ; decrement sleep counter
@UpdateSleep:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckMuddle:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d1
                beq.s   @CheckSilence
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                move.w  d1,d6
                jsr     (GenerateRandomNumber).w
                andi.w  #STATUSEFFECT_MUDDLE,d7
                bne.s   @Muddled        
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     355             ; "{CLEAR}{NAME} is fine.{D3}"
                clr.w   d1
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                bra.s   @UpdateMuddle
@Muddled:
                
                subi.w  #STATUSEFFECTCOUNTER_MUDDLE,d1 ; randomly decrement muddle counter
@UpdateMuddle:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckSilence:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SILENCE,d1
                beq.s   @CheckSlow
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                move.w  d1,d6
                jsr     (GenerateRandomNumber).w
                andi.w  #STATUSEFFECT_SILENCE,d7
                bne.s   @Silenced       
                move.w  #SPELL_DISPEL,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  d0,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     351             ; "{CLEAR}{SPELL} expired.{N}{NAME} is no longer{N}silenced.{D3}"
                clr.w   d1
                bra.s   @UpdateSilence
@Silenced:
                
                subi.w  #STATUSEFFECTCOUNTER_SILENCE,d1 ; randomly decrement silence counter
@UpdateSilence:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckSlow:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLOW,d1
                beq.s   @CheckAttack
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                subi.w  #STATUSEFFECTCOUNTER_SLOW,d1 ; decrement slow counter
                bne.s   @UpdateSlow
                move.w  #SPELL_SLOW,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     349             ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
@UpdateSlow:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckAttack:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_ATTACK,d1
                beq.s   @CheckBoost
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST,d2
                subi.w  #STATUSEFFECTCOUNTER_ATTACK,d1 ; decrement attack counter
                bne.s   @UpdateAttack
                move.w  #SPELL_ATTACK,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     350             ; "{CLEAR}{SPELL} expired.{N}Attack returns to normal.{D3}"
@UpdateAttack:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckBoost:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_BOOST,d1
                beq.s   @ApplyHolyStaffRecovery
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_ATTACK,d2
                subi.w  #STATUSEFFECTCOUNTER_BOOST,d1 ; decrement boost counter
                bne.s   @UpdateBoost
                move.w  #SPELL_BOOST,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     348             ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
@UpdateBoost:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@ApplyHolyStaffRecovery:
                
                jsr     j_GetEquippedWeapon
                cmpi.w  #ITEM_HOLY_STAFF,d1
                bne.s   @ApplyMysteryStaffRecovery
                jsr     j_GetCurrentHp
                move.w  d1,d2
                moveq   #HOLY_STAFF_HP_RECOVERY,d1
                jsr     j_IncreaseCurrentHp
                sub.w   d2,d1
                ble.s   @ApplyMysteryStaffRecovery
                ext.l   d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     356             ; "{CLEAR}{NAME} recovered{N}{#} hit points.{D3}"
@ApplyMysteryStaffRecovery:
                
                jsr     j_GetEquippedWeapon
                cmpi.w  #ITEM_MYSTERY_STAFF,d1
                bne.s   @ApplyLifeRingRecovery
                jsr     j_GetCurrentMp
                move.w  d1,d2
                moveq   #MYSTERY_STAFF_MP_RECOVERY,d1
                jsr     j_IncreaseCurrentMp
                sub.w   d2,d1
                ble.s   @ApplyLifeRingRecovery
                ext.l   d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     357             ; "{CLEAR}{NAME} recovered{N}{#} magic points.{D3}"
@ApplyLifeRingRecovery:
                
                jsr     j_GetEquippedRing
                cmpi.w  #ITEM_LIFE_RING,d1
                bne.s   @ApplyPoisonDamage
                jsr     j_GetCurrentHp
                move.w  d1,d2
                moveq   #LIFE_RING_HP_RECOVERY,d1
                jsr     j_IncreaseCurrentHp
                sub.w   d2,d1
                ble.s   @ApplyPoisonDamage
                ext.l   d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     356             ; "{CLEAR}{NAME} recovered{N}{#} hit points.{D3}"
@ApplyPoisonDamage:
                
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_POISON,d1
                beq.s   @UpdateStats
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                moveq   #POISON_DAMAGE,d1 ; constant poison damage
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     307             ; "{CLEAR}{NAME} gets damaged{N}by {#} because of the poison.{D3}"
                jsr     j_DecreaseCurrentHp
                tst.w   d1
                bne.s   @UpdateStats
                txt     308             ; "{NAME} is exhausted.{D3}"
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                move.b  d0,((DEAD_COMBATANTS_LIST-$1000000)).w
@UpdateStats:
                
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                clsTxt
@Skip:
                
                unlk    a6
                rts

    ; End of function ProcessAfterTurnEffects

