
; ASM FILE code\gameflow\battle\battleactions\displaydeathmessage.asm :
; 0xB080..0xB0A8 : Write Battlescene Command : Display Death Message function

; =============== S U B R O U T I N E =======================================


battlesceneScript_DisplayDeathMessage:
                
                move.b  (a5),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                move.w  #MESSAGE_BATTLE_IS_EXHAUSTED,d1
                bra.s   @WriteBattleMessageCommand
@Enemy:
                
                move.w  #MESSAGE_BATTLE_WAS_DEFEATED,d1
@WriteBattleMessageCommand:
                
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function battlesceneScript_DisplayDeathMessage

