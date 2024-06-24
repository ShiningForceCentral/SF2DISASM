
; ASM FILE code\gameflow\battle\battlefunctions\handleafterturneffects-standard.asm :
; 

; =============== S U B R O U T I N E =======================================

; Handle after-turn effects (status effects, HP/MP regen/degen, etc.)
; 
;       In: d0.w = combatant index

statusEffects = -4
combatant = -2

ProcessAfterTurnEffects:
                
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                jsr     GetCurrentHP
                bne.s   @Continue
                rts                     ; skip everything if combatant is dead
                
@Continue:      link    a6,#-4
                move.w  d0,combatant(a6)
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                
                ; Check Stun
                jsr     GetStatusEffects
                move.w  d1,statusEffects(a6)
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
@Stunned:       txt     309             ; "{NAME} is stunned.{D3}"
@UpdateStun:    or.w    d2,d1
                move.w  d1,statusEffects(a6)
                
@CheckSleep:    move.w  statusEffects(a6),d1
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLEEP,d1
                beq.s   @CheckMuddle
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                
                ; Randomly wake early
                move.w  d1,d6
                jsr     (GenerateRandomNumber).w
                andi.w  #STATUSEFFECT_SLEEP,d7  ; Chance to wake early is determined by the sleep counter :
                                                ;   - 1/4 on the first turn
                                                ;   - 1/3 on the second
                                                ;   - 1/2 on the third
                bne.s   @Sleeping       
                txt     354             ; "{CLEAR}{NAME} has awakened.{D3}"
                clr.w   d1
                bra.s   @UpdateSleep
@Sleeping:      txt     306             ; "{NAME} is sleeping.{D3}"
                subi.w  #STATUSEFFECTCOUNTER_SLEEP,d1 ; decrement sleep counter
@UpdateSleep:   or.w    d2,d1
                move.w  d1,statusEffects(a6)
                
@CheckMuddle:   move.w  statusEffects(a6),d1
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
@Muddled:       subi.w  #STATUSEFFECTCOUNTER_MUDDLE,d1 ; randomly decrement muddle counter
@UpdateMuddle:  or.w    d2,d1
                move.w  d1,statusEffects(a6)
                
@CheckSilence:  move.w  statusEffects(a6),d1
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
@Silenced:      subi.w  #STATUSEFFECTCOUNTER_SILENCE,d1 ; randomly decrement silence counter
@UpdateSilence: or.w    d2,d1
                move.w  d1,statusEffects(a6)
                
@CheckSlow:     move.w  statusEffects(a6),d1
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLOW,d1
                beq.s   @CheckAttack
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                subi.w  #STATUSEFFECTCOUNTER_SLOW,d1 ; decrement slow counter
                bne.s   @UpdateSlow
                move.w  #SPELL_SLOW,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     349             ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
@UpdateSlow:    or.w    d2,d1
                move.w  d1,statusEffects(a6)
                
@CheckAttack:   move.w  statusEffects(a6),d1
                move.w  d1,d2
                andi.w  #STATUSEFFECT_ATTACK,d1
                beq.s   @CheckBoost
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST,d2
                subi.w  #STATUSEFFECTCOUNTER_ATTACK,d1 ; decrement attack counter
                bne.s   @UpdateAttack
                move.w  #SPELL_ATTACK,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     350             ; "{CLEAR}{SPELL} expired.{N}Attack returns to normal.{D3}"
@UpdateAttack:  or.w    d2,d1
                move.w  d1,statusEffects(a6)
                
@CheckBoost:    move.w  statusEffects(a6),d1
                move.w  d1,d2
                andi.w  #STATUSEFFECT_BOOST,d1
                beq.s   @SetStatus
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_ATTACK,d2
                subi.w  #STATUSEFFECTCOUNTER_BOOST,d1 ; decrement boost counter
                bne.s   @UpdateBoost
                move.w  #SPELL_BOOST,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     348             ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
@UpdateBoost:   or.w    d2,d1
                move.w  d1,statusEffects(a6)
                
@SetStatus:     move.w  statusEffects(a6),d1
                jsr     SetStatusEffects
                bsr.s   ApplyAfterTurnRecovery
                
                ; Apply poison damage
                andi.w  #STATUSEFFECT_POISON,d1
                beq.s   @UpdateStats
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
            if (PERCENT_POISON_DAMAGE>=1)
                jsr     GetMaxHP
                mulu.w  #PERCENT_POISON_DAMAGE,d1
                divu.w  #100,d1
                andi.l  #$FFFF,d1
            else
                moveq   #POISON_DAMAGE,d1 ; constant poison damage
            endif
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     307             ; "{CLEAR}{NAME} gets damaged{N}by {#} because of the poison.{D3}"
                jsr     DecreaseCurrentHP
                tst.w   d1
                bne.s   @UpdateStats
                txt     308             ; "{NAME} is exhausted.{D3}"
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                move.b  d0,((DEAD_COMBATANTS_LIST-$1000000)).w
@UpdateStats:   jsr     ApplyStatusEffectsAndItemsOnStats
                clsTxt
                unlk    a6
                rts

    ; End of function ProcessAfterTurnEffects


; =============== S U B R O U T I N E =======================================

; Apply HP and MP recovery for equipped weapon and ring.
;
;       In: d0.w = combatant index

ApplyAfterTurnRecovery:
                
                movem.l d1-d6/a0,-(sp)
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                clr.w   d5                  ; d5.w = recovery amount
                jsr     GetEquippedRing
                move.w  d1,d4               ; d4.w = copy of equipped ring
                jsr     GetEquippedWeapon
                move.w  d1,d3               ; d3.w = copy of equipped weapon
                moveq   #1,d2               ; d2.w = properties bytesize per item
                
                ; Check HP recovery for weapon
                tst.w   d1
                bmi.s   @CheckRingHp        ; skip if no equipped weapon
                lea     table_AfterTurnHpRecoveryForWeapons(pc), a0
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @CheckRingHp
                clr.w   d1
                move.b  (a0),d1
                add.w   d1,d5
                
@CheckRingHp:   move.w  d4,d1
                bmi.s   @RecoverHp          ; skip if no equipped ring
                lea     table_AfterTurnHpRecoveryForRings(pc), a0
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @RecoverHp
                clr.w   d1
                move.b  (a0),d1
                add.w   d1,d5
                
@RecoverHp:     tst.w   d5
                beq.s   @CheckWeaponMp
                jsr     GetCurrentHP
                move.w  d1,d6
                move.w  d5,d1
                jsr     IncreaseCurrentHP
                sub.w   d6,d1
                ble.s   @CheckWeaponMp
                ext.l   d1
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     356                 ; "{CLEAR}{NAME} recovered{N}{#} hit points.{D3}"
                
@CheckWeaponMp: clr.w   d5
                move.w  d3,d1
                bmi.s   @CheckRingMp        ; skip if no equipped weapon
                lea     table_AfterTurnMpRecoveryForWeapons(pc), a0
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @CheckRingMp
                clr.w   d1
                move.b  (a0),d1
                add.w   d1,d5
                
@CheckRingMp:   move.w  d4,d1
                bmi.s   @RecoverMp          ; skip if no equipped ring
                lea     table_AfterTurnMpRecoveryForRings(pc), a0
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @RecoverMp
                clr.w   d1
                move.b  (a0),d1
                add.w   d1,d5
                
@RecoverMp:     tst.w   d5
                beq.s   @Done
                jsr     GetCurrentMP
                move.w  d1,d6
                move.w  d5,d1
                jsr     IncreaseCurrentMP
                sub.w   d6,d1
                ble.s   @Done
                ext.l   d1
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     357                 ; "{CLEAR}{NAME} recovered{N}{#} magic points.{D3}"
                
@Done:          movem.l (sp)+,d1-d6/a0
                rts

    ; End of function ApplyAfterTurnRecovery

