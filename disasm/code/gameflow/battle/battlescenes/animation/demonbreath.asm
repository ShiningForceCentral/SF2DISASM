
; ASM FILE code\gameflow\battle\battlescenes\animation\demonbreath.asm :
; 0x1ACE4..0x1AD3E : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_DemonBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_DEMON_BREATH,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a1
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   loc_1AD0C
                move.l  #$B000EA,(a1)
                move.w  #1,4(a1)
                bra.s   loc_1AD16
loc_1AD0C:
                
                move.l  #$C000D0,(a1)
                clr.w   4(a1)
loc_1AD16:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DEMON_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_DemonBreath

