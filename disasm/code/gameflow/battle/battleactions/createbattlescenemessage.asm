
; ASM FILE code\gameflow\battle\battleactions\createbattlescenemessage.asm :
; 0xA05C..0xA200 : Create Battlescene Message function

; =============== S U B R O U T I N E =======================================

; Load proper battlescene message script depending on action.
; 
;       In: a3 = action type index in RAM
;           a4 = actor index in RAM
; 
; <HARDCODED> enemy and message indexes


CreateBattlesceneMessage:
                
                module
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
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d2
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
                
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d2
                move.w  ((BATTLESCENE_SPELL_LEVEL-$1000000)).w,d3
                addq.w  #1,d3
                displayMessage d1,d0,d2,d3 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @CheckBurstRock
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d2
                displayMessage #MESSAGE_BATTLE_USED_ITEM,d0,d2,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @CheckMuddled
                displayMessage #MESSAGE_BATTLE_EXPLODED,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.s   @Done
@CheckMuddled:
                
                cmpi.w  #BATTLEACTION_MUDDLE,(a3)
                bne.w   @CheckPrismLaser
                move.w  d0,d2           ; random MUDDLE lines
                move.w  #MESSAGE_BATTLE_MUDDLED_ACTIONS_START,d1 ; HARDCODED Muddle line start index
                moveq   #16,d0
                jsr     (GenerateRandomOrDebugNumber).w
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
                jsr     GetEnemy        
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                bne.s   @PrismFlower    
                move.w  #MESSAGE_BATTLE_DEMON_LASER,d1 ; 0141=Demon laser!
                bra.s   byte_A1E6       
@PrismFlower:
                
                move.w  #MESSAGE_BATTLE_PRISM_LASER,d1 ; 013F=Prism laser!
byte_A1E6:
                
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CreateBattlesceneMessage

                modend
