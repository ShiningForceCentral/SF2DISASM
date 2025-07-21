
; ASM FILE code\gameflow\battle\battlescenes\animation\update\cannonfire.asm :
; 0x1D5C6..0x1D786 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_CannonFire:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                moveq   #7,d1
loc_1D5D6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D748
                move.w  2(a5),d1
                bne.w   loc_1D612
                lea     graphic_CannonShots(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1D5F6
                addq.w  #8,a0
loc_1D5F6:
                
                bsr.w   sub_19F5E
                moveq   #$10,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #8,d7
                add.w   d7,(a4)
                addq.w  #1,2(a5)
                move.w  #4,4(a5)
                bra.w   loc_1D748
loc_1D612:
                
                addq.w  #1,(a5)
                subq.w  #1,d1
                bne.w   loc_1D69E
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D62E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D63C
loc_1D62E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D63C:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D65A
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D668
loc_1D65A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D668:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D762
                cmpi.w  #3,(a5)
                bne.s   loc_1D68A
                cmpi.b  #8,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.s   loc_1D68A
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D68A:
                
                cmpi.w  #$13,(a5)
                bcs.w   loc_1D748
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                bra.w   loc_1D748
loc_1D69E:
                
                subq.w  #1,d1
                bne.w   loc_1D6D0
                cmpi.w  #$20,(a5) 
                bcs.w   loc_1D748
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                moveq   #$10,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #8,d7
                add.w   6(a3),d7
                move.w  d7,(a4)
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   loc_1D748
loc_1D6D0:
                
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D6E4
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D6F2
loc_1D6E4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D6F2:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D710
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D71E
loc_1D710:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D71E:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D762
                cmpi.w  #$10,(a5)
                bcs.w   loc_1D748
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.w   (a5)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D748:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d1,loc_1D5D6
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_CannonFire


; =============== S U B R O U T I N E =======================================


sub_1D762:
                
                subq.w  #1,4(a5)
                bne.s   return_1D774
                move.w  #4,4(a5)
                bchg    #2,5(a4)
return_1D774:
                
                rts

    ; End of function sub_1D762

graphic_CannonShots:
                vdpSpell 276, 232, SPELLTILE1, V1|H4|16
                vdpSpell 208, 224, SPELLTILE1, V1|H4|17
