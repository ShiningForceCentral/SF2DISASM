
; ASM FILE code\gameflow\battle\battlescenes\animation\bubblebreath.asm :
; 0x1B488..0x1B4F6 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_BubbleBreath:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                clr.w   d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  (sp)+,d1
                andi.w  #7,d1
                cmpi.w  #2,d1
                bcs.s   loc_1B4CE
                lea     table_1B4F0(pc), a0
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a1
                lea     ((PALETTE_3_BASE-$1000000)).w,a2
                move.w  (a0),$12(a1)
                move.w  (a0)+,$12(a2)
                move.w  (a0),$1A(a1)
                move.w  (a0)+,$1A(a2)
                move.w  (a0),$1C(a1)
                move.w  (a0),$1C(a2)
                jsr     (ApplyVIntCramDma).w
loc_1B4CE:
                
                move.w  #$E4,((byte_FFB404-$1000000)).w 
                move.b  #SPELLANIMATION_BUBBLE_BREATH,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_BubbleBreath

table_1B4F0:    dc.b $C
                dc.b $BF
                dc.b $B
                dc.b $9A
                dc.b $B
                dc.b $46
                
