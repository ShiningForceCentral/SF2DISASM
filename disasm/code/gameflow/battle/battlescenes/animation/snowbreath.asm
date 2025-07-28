
; ASM FILE code\gameflow\battle\battlescenes\animation\snowbreath.asm :
; 0x1B660..0x1B6A8 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_SnowBreath:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_SNOW_BREATH,d0
                bsr.w   LoadSpellGraphics
                lea     ((byte_FFB532-$1000000)).w,a1
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   @Enemy
                move.w  #$50,(a1) 
                bra.s   @Continue
@Enemy:
                
                move.w  #$D0,(a1) 
@Continue:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_SNOW_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_SnowBreath

