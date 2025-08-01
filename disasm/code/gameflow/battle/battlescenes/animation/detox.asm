
; ASM FILE code\gameflow\battle\battlescenes\animation\detox.asm :
; 0x1AA40..0x1AA90 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Detox:
                
                 
                sndCom  SFX_SPELL_CAST
                move.w  #DETOX_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_DETOX,d0
                bsr.w   LoadSpellTileset
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                lea     table_1AA88(pc), a0
                moveq   #$26,d0   ; offset to sprite_38
                bsr.w   ConstructSimpleGraphic
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DETOX,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Detox

table_1AA88:    vdpSpell 0, 0, SPELLTILE28, V1|H1|VALUE2
