
; ASM FILE code\gameflow\battle\battlescenes\animation\update\arrowsandspears.asm :
; 0x1D4E6..0x1D5C6 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_ArrowsAndSpears:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1D5C4
                addq.w  #1,(a5)
                move.w  2(a5),d0
                bne.w   loc_1D54A
                move.w  2(a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D518
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D526
loc_1D518:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D526:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                tst.w   (a3) ; arrow or spear?
                beq.s   loc_1D536
                add.w   d0,NEXTVDPSPRITE_OFFSET_X(a4)
loc_1D536:
                
                cmpi.w  #18,(a5)
                bcs.s   loc_1D546
                addq.w  #1,2(a5)
                move.w  #34,4(a5) 
loc_1D546:
                
                bra.w   return_1D5C4
loc_1D54A:
                
                subq.w  #1,d0
                bne.w   loc_1D582
                subq.w  #1,4(a5)
                bne.w   return_1D5C4
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                move.w  8(a3),(a4)
                tst.w   (a3)
                beq.s   loc_1D572
                move.w  6(a3),NEXTVDPSPRITE_OFFSET_X(a4)
                move.w  8(a3),NEXTVDPSPRITE_OFFSET_Y(a4)
loc_1D572:
                
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   return_1D5C4
loc_1D582:
                
                move.w  2(a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D598
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D5A6
loc_1D598:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D5A6:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                tst.w   (a3)
                beq.s   loc_1D5B6
                add.w   d0,NEXTVDPSPRITE_OFFSET_X(a4)
loc_1D5B6:
                
                cmpi.w  #16,(a5)
                bcs.s   return_1D5C4
                clr.b   ((byte_FFB588-$1000000)).w
                bra.w   ReinitializeSceneAfterSpell
return_1D5C4:
                
                rts

    ; End of function spellanimationUpdate_ArrowsAndSpears

