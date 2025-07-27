
; ASM FILE code\gameflow\battle\battlescenes\animation\burstrock.asm :
; 0x1B6EA..0x1B716 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_BurstRockExplosion:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_EXPLOSION,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BURST_ROCK_EXPLOSION,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_BurstRockExplosion

