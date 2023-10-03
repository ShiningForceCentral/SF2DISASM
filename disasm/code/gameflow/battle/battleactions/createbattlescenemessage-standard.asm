
; ASM FILE code\gameflow\battle\battleactions\createbattlescenemessage-standard.asm :
; Standard reimplementation of battlescene message creator function.

; =============== S U B R O U T I N E =======================================

; Load proper battlescene message script depending on action.
; 
;       In: a3 = action type index in RAM
;           a4 = actor index in RAM

battlesceneScript_DisplayMessage:
                
                movem.l d0-d3/a0,-(sp)
                
                ; Jump to module for battleaction
                move.w  (a3),d1
                move.b  (a4),d0
                add.w   d1,d1
                add.w   d1,d1
                jsr     @bt_Battleactions(pc,d1.w)
                
@Done:          movem.l (sp)+,d0-d3/a0
@Return:        rts
                
    ; End of function battlesceneScript_DisplayMessage

@bt_Battleactions:
                bra.w   @Attack
                bra.w   @CastSpell
                bra.w   @UseItem
                bra.w   @Return     ; Stay
                bra.w   @BurstRock
                bra.w   @Muddle
                bra.w   @PrismLaser
; ---------------------------------------------------------------------------

@Attack:        module
                move.w  ((BATTLESCENE_ATTACK_TYPE-$1000000)).w,d2
                move.w  #MESSAGE_BATTLE_ATTACK,d1           ; {NAME}'s attack!
                tst.w   d2
                beq.s   @Message
                move.w  #MESSAGE_BATTLE_SECOND_ATTACK,d1    ; {NAME}'s second{N}attack!
                cmpi.w  #BATTLEACTION_ATTACKTYPE_SECOND,d2
                beq.s   @Message
                move.w  #MESSAGE_BATTLE_COUNTER_ATTACK,d1   ; {NAME}'s counter{N}attack!
@Message:       displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts
                modend
; ---------------------------------------------------------------------------
                
@CastSpell:     module
                move.w  #MESSAGE_SPELLCAST_DEFAULT,d3 ; {NAME} cast{N}{SPELL} level {#}!
                moveq   #2,d2
                
                lea     table_SpellcastMessagesForIndexes(pc), a0
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d1
                jsr     (FindSpecialPropertyWordsAddressForObject).w
                bcc.s   @Special
                
                lea     table_SpellcastMessagesForEntries(pc), a0
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     (FindSpecialPropertyWordsAddressForObject).w
                bcs.s   @Default
                
@Special:       move.w  (a0),d3
@Default:       move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d1
                move.w  ((BATTLESCENE_SPELL_LEVEL-$1000000)).w,d2
                addq.w  #1,d2
                displayMessage d3,d0,d1,d2 ; Message, Combatant, Item or Spell, Number
                rts
                modend
; ---------------------------------------------------------------------------

@UseItem:       module
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d2
                displayMessage #MESSAGE_BATTLE_USED_ITEM,d0,d2,#0 ; Message, Combatant, Item or Spell, Number
                rts
                modend
; ---------------------------------------------------------------------------

@BurstRock:     module
                displayMessage #MESSAGE_BATTLE_EXPLODED,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts
                modend
; ---------------------------------------------------------------------------

@Muddle:        module
                move.w  #MESSAGE_BATTLE_MUDDLED_ACTIONS_START,d1 ; HARDCODED Muddle line start index
                moveq   #16,d0
                jsr     (GenerateRandomOrDebugNumber).w
                cmpi.w  #9,d0           ; HARDCODED number of available Muddle lines
                bls.s   @Continue
                clr.w   d0
@Continue:      add.w   d0,d1
                move.b  (a4),d0
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts
                modend
; ---------------------------------------------------------------------------

@PrismLaser:    module
                bsr.w   GetEnemy  
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                bne.s   @PrismFlower    
                move.w  #MESSAGE_BATTLE_DEMON_LASER,d1 ; 0141=Demon laser!
                bra.s   @Message
@PrismFlower:   move.w  #MESSAGE_BATTLE_PRISM_LASER,d1 ; 013F=Prism laser!
@Message:       displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts
                modend
