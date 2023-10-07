
; ASM FILE code\gameflow\battle\battleactions\createbattlescenemessage.asm :
; 0xA05C..0xA200 : Create Battlescene Message function

; =============== S U B R O U T I N E =======================================

; Load display message command depending on action.
; 
;       In: a3 = battleaction data pointer
;           a4 = actor index pointer
; 
; HARDCODED enemy and message indexes


battlesceneScript_DisplayMessage:
                
                module
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @IsCastSpell    ; HARDCODED attack lines
                
                ; Attack
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
@IsCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.w   @IsUseItem
                
                ; HARDCODED spell text indexes
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d2
                move.w  #MESSAGE_SPELLCAST_PUT_ON_A_DEMON_SMILE,d1 ; {NAME} put on{N}a demon's smile.
                cmpi.w  #SPELL_SPOIT,d2
                beq.w   @Message_CastSpell
                move.w  #MESSAGE_SPELLCAST_BELCHED_OUT_FLAMES,d1 ; {NAME} belched{N}out flames!
                cmpi.w  #SPELL_FLAME,d2
                beq.w   @Message_CastSpell
                cmpi.w  #SPELL_KIWI,d2
                beq.w   @Message_CastSpell
                move.w  #MESSAGE_SPELLCAST_BLEW_OUT_A_SNOWSTORM,d1 ; {NAME} blew out{N}a snowstorm!
                cmpi.w  #SPELL_SNOW,d2
                beq.w   @Message_CastSpell
                move.w  #MESSAGE_SPELLCAST_CAST_DEMON_BREATH,d1 ; {NAME} cast{N}demon breath!
                cmpi.w  #SPELL_DEMON,d2
                beq.w   @Message_CastSpell
                move.w  #MESSAGE_SPELLCAST_ODD_EYE_BEAM,d1 ; Odd-eye beam!
                cmpi.w  #SPELL_ODDEYE,d2
                beq.w   @Message_CastSpell
                move.w  #MESSAGE_SPELLCAST_SUMMONED,d1 ; {NAME} summoned{N}{SPELL}!{D1}
                cmpi.w  #SPELL_DAO,d2
                beq.w   @Message_CastSpell
                cmpi.w  #SPELL_APOLLO,d2
                beq.w   @Message_CastSpell
                cmpi.w  #SPELL_NEPTUN,d2
                beq.w   @Message_CastSpell
                cmpi.w  #SPELL_ATLAS,d2
                beq.w   @Message_CastSpell
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d2
                move.w  #MESSAGE_SPELLCAST_BLEW_OUT_AQUA_BREATH,d1 ; {NAME} blew out{N}aqua-breath!
                cmpi.w  #SPELL_AQUA,d2
                beq.w   @Message_CastSpell
                move.w  #MESSAGE_SPELLCAST_BLEW_OUT_BUBBLE_BREATH,d1 
                                                        ; {NAME} blew out{N}bubble-breath!
                cmpi.w  #SPELL_AQUA|SPELL_LV2,d2
                beq.w   @Message_CastSpell
                move.w  #MESSAGE_SPELLCAST_DEFAULT,d1 ; {NAME} cast{N}{SPELL} level {#}!
@Message_CastSpell:
                
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d2
                move.w  ((BATTLESCENE_SPELL_LEVEL-$1000000)).w,d3
                addq.w  #1,d3
                displayMessage d1,d0,d2,d3 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@IsUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @IsBurstRock
                
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d2
                displayMessage #MESSAGE_BATTLE_USED_ITEM,d0,d2,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@IsBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @IsMuddled
                
                displayMessage #MESSAGE_BATTLE_EXPLODED,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.s   @Done
@IsMuddled:
                
                cmpi.w  #BATTLEACTION_MUDDLED,(a3)
                bne.w   @IsPrismLaser
                
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
@IsPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   @Done
                
                jsr     GetEnemy        
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                bne.s   @PrismFlower    
                move.w  #MESSAGE_BATTLE_DEMON_LASER,d1 ; 0141=Demon laser!
                bra.s   byte_A1E6       ; @Message_PrismLaser
@PrismFlower:
                
                move.w  #MESSAGE_BATTLE_PRISM_LASER,d1 ; 013F=Prism laser!
byte_A1E6:
                
                @Message_PrismLaser:
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_DisplayMessage

                modend
