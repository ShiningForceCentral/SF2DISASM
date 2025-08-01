
; ASM FILE code\gameflow\battle\battlescenes\animation\attackspell.asm :
; 0x1B618..0x1B660 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_AttackSpell:
                
                 
                sndCom  SFX_SPELL_CAST
                move.w  #ATTACK_SPELL_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_DETOX,d0
                bsr.w   LoadSpellTileset
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                lea     table_1AA88(pc), a0
                moveq   #38,d0 
                bsr.w   ConstructSimpleGraphic
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ATTACK_SPELL,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_AttackSpell

