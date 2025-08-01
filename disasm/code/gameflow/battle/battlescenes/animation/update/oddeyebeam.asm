
; ASM FILE code\gameflow\battle\battlescenes\animation\update\oddeyebeam.asm :
; 0x1ECC8..0x1EE2C : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_OddEyeBeam:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1EDDA
                addq.w  #1,(a5)
                move.b  2(a5),d0
                bne.w   loc_1ED06
                move.w  6(a5),d0
                move.w  (a4),d1
                move.w  d1,6(a5)
                move.w  d0,(a4)
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                addq.b  #1,2(a5)
                move.b  #2,3(a5)
                bra.w   return_1EDDA
loc_1ED06:
                
                subq.b  #1,d0
                bne.w   loc_1ED64
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                move.b  #2,3(a5)
                tst.w   4(a5)
                bne.s   loc_1ED42
                move.w  2(a3),(a4)
                move.w  #VDPSPRITESIZE_V1|VDPSPRITESIZE_H4,VDPSPRITE_OFFSET_SIZE(a4)
                move.w  #VDPTILE_SPELLTILE5|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                or.w    4(a3),d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                move.w  (a3),VDPSPRITE_OFFSET_X(a4)
                addq.w  #1,4(a5)
                bra.w   return_1EDDA
loc_1ED42:
                
                move.w  (a3),d2
                bsr.w   sub_1EDDC
                cmpi.w  #6,4(a5)
                bcs.w   return_1EDDA
                addq.b  #1,2(a5)
                move.b  #30,3(a5)
                clr.b   ((byte_FFB588-$1000000)).w
                bra.w   return_1EDDA
loc_1ED64:
                
                subq.b  #1,d0
                bne.w   loc_1ED84
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                addq.b  #1,2(a5)
                move.b  #2,3(a5)
                clr.w   4(a5)
                bra.w   return_1EDDA
loc_1ED84:
                
                subq.b  #1,d0
                bne.w   loc_1EDB2
                subq.b  #1,3(a5)
                bne.w   return_1EDDA
                move.b  #2,3(a5)
                bsr.w   sub_1EE1A
                cmpi.w  #6,4(a5)
                bcs.w   return_1EDDA
                addq.b  #1,2(a5)
                clr.b   ((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bra.w   return_1EDDA
loc_1EDB2:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
                cmpi.b  #3,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bne.w   return_1EDDA
                move.b  #1,((byte_FFB588-$1000000)).w
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                move.w  #258,2(a5)
                clr.w   4(a5)
return_1EDDA:
                
                rts

    ; End of function spellanimationUpdate_OddEyeBeam


; =============== S U B R O U T I N E =======================================


sub_1EDDC:
                
                move.w  4(a5),d0
                moveq   #32,d1 ; pixel width of graphic
                tst.w   4(a3)
                beq.s   loc_1EDEA
                neg.w   d1
loc_1EDEA:
                
                muls.w  d0,d1
                add.w   d2,d1
                lsl.w   #VDP_SPRITE_SHIFT_COUNT,d0
                lea     (a4,d0.w),a0
                cmpi.w  #2,4(a5)
                bcs.s   loc_1EE00
                subq.w  #4,-4(a0)
loc_1EE00:
                
                move.w  2(a3),(a0)+
                move.w  #VDPSPELLPROP_V1|VDPSPELLPROP_H4,(a0)+
                move.w  #VDPTILE_SPELLTILE13|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                or.w    4(a3),d0
                move.w  d0,(a0)+
                move.w  d1,(a0)+
                addq.w  #1,4(a5)
                rts

    ; End of function sub_1EDDC


; =============== S U B R O U T I N E =======================================


sub_1EE1A:
                
                move.w  4(a5),d0
                lsl.w   #VDP_SPRITE_SHIFT_COUNT,d0
                move.w  #1,(a4,d0.w)
                addq.w  #1,4(a5)
                rts

    ; End of function sub_1EE1A

