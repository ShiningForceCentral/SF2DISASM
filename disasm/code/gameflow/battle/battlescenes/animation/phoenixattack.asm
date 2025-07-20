
; ASM FILE code\gameflow\battle\battlescenes\animation\phoenixattack.asm :
; 0x1B6A8..0x1B6EA : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_PhoenixAttack:
                
                bsr.w   ClearSpellanimationProperties
                btst    #0,d1
                beq.s   loc_1B6B6
                moveq   #SPELLGRAPHICS_SOUND_WAVES,d0
                bra.s   loc_1B6B8
loc_1B6B6:
                
                moveq   #SPELLGRAPHICS_BLAST,d0
loc_1B6B8:
                
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$D0,4(a0) 
                move.w  #$64,((byte_FFB404-$1000000)).w 
                move.b  #SPELLANIMATION_PHOENIX_ATTACK,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_PhoenixAttack

