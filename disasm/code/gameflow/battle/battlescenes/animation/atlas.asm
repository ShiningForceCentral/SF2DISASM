
; ASM FILE code\gameflow\battle\battlescenes\animation\atlas.asm :
; 0x1B37C..0x1B406 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Atlas:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #SUMMON_ATLAS,d0
                bsr.w   LoadInvocationSpell
                moveq   #SUMMON_ATLAS,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                lea     ((byte_FFB532-$1000000)).w,a0
                move.w  #$900,(a0)+
                move.w  #$A00,(a0)+
                move.w  #$F700,(a0)+
                move.w  #$A00,(a0)+
                move.w  #$50,(a0) 
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #6,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                move.w  #1,8(a0)
                lea     (byte_FFAFB4).l,a0
                lea     (byte_FFAFC6).l,a1
                moveq   #$F,d0
loc_1B3D8:
                
                move.b  #2,(a0)+
                move.b  #2,(a1)+
                dbf     d0,loc_1B3D8
				
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ATLAS,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Atlas

