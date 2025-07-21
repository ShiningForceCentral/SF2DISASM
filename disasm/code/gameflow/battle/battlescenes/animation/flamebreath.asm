
; ASM FILE code\gameflow\battle\battlescenes\animation\flamebreath.asm :
; 0x1AD3E..0x1ADA4 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_FlameBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_FLAME_BREATH,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a1
                bclr    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   loc_1AD62
                
                move.w  #$40,(a1) 
                move.w  #$80,2(a1) 
                bra.s   loc_1AD6A
loc_1AD62:
                
                move.w  #$C0,(a1) 
                clr.w   2(a1)
loc_1AD6A:
                
                andi.w  #7,d1
                add.w   d1,d1
                addi.w  #$2C,d1 
                move.w  d1,4(a1)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  (a1),2(a0)
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_FLAME_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_FlameBreath

