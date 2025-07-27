
; ASM FILE code\gameflow\battle\battlescenes\animation\oddeyebeam.asm :
; 0x1B716..0x1B7B0 : Battlescene engine

; =============== S U B R O U T I N E =======================================

; and maybe Zynk's beam too ?


spellanimationSetup_OddEyeBeam:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_ODD_EYE_BEAM,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     table_1B794(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,d1
                beq.s   @Mirrored
                lea     $E(a0),a0
@Mirrored:
                
                lea     ((byte_FFB532-$1000000)).w,a1
                move.l  (a0)+,(a1)+
                move.w  (a0)+,(a1)
                moveq   #$26,d0   ; offset to sprite_38
                bsr.w   sub_19F5E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1B756
                move.w  #$38,2(a0) 
                bra.s   loc_1B75C
loc_1B756:
                
                move.w  #$102,2(a0)
loc_1B75C:
                
                lea     (byte_FFAFC6).l,a1
                moveq   #7,d0
loc_1B764:
                
                move.b  #2,(a1)+
                dbf     d0,loc_1B764
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_ODD_EYE_BEAM,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_OddEyeBeam

table_1B794:    ; for Zynk
                dc.l $10400E9
                dc.w $800
                
                vdpSpell 284, 229, SPELLTILE1, V2|H2|33
                
                ; for Oddeye
                dc.l $D200CC
                dc.w $0
                
                vdpSpell 210, 204, SPELLTILE5, V1|H4|32
