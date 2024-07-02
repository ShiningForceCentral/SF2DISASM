
; ASM FILE code\common\scripting\entity\entityfunctions_4.asm :
; 0x45858..0x45E44 : Entity functions

; =============== S U B R O U T I N E =======================================

; In: a0, a1 = pointer to mapsprite decompressed pixel data in RAM


OrientSpriteLeft:
                
                movem.l d0-d1/d5-a0,-(sp)
                link    a6,#-576
                move.w  #1,d7
loc_45864:
                
                move.w  #8,d6
loc_45868:
                
                move.w  #3,d5
loc_4586C:
                
                move.b  3(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  7(a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  11(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  15(a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  19(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  23(a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  27(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  31(a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                move.l  d0,-(a6)
                move.b  3(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  7(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  11(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  15(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  19(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  23(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  27(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  31(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                move.l  d0,-(a6)
                subq.l  #1,a0
                dbf     d5,loc_4586C
                
                adda.l  #36,a0
                dbf     d6,loc_45868
                dbf     d7,loc_45864
                
                move.w  #1,d7
loc_45914:
                
                move.l  #$E0,d0 
                bsr.w   sub_45B0E
                move.l  #$80,d0 
                bsr.w   sub_45B0E
                moveq   #$20,d0 
                bsr.w   sub_45B0E
                move.l  #$100,d0
                bsr.w   sub_45B0E
                move.l  #$A0,d0 
                bsr.w   sub_45B0E
                moveq   #$40,d0 
                bsr.w   sub_45B0E
                move.l  #$120,d0
                bsr.w   sub_45B0E
                move.l  #$C0,d0 
                bsr.w   sub_45B0E
                moveq   #$60,d0 
                bsr.w   sub_45B0E
                adda.l  #$120,a6
                dbf     d7,loc_45914
                
                unlk    a6
                movem.l (sp)+,d0-d1/d5-a0
                rts

    ; End of function OrientSpriteLeft


; =============== S U B R O U T I N E =======================================

; In: a0, a1 = pointer to mapsprite decompressed pixel data in RAM


OrientSpriteRight:
                
                movem.l d0-d1/d5-a0,-(sp)
                link    a6,#-576
                move.w  #1,d7
loc_45980:
                
                move.w  #8,d6
loc_45984:
                
                move.w  #3,d5
loc_45988:
                
                move.b  28(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  24(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  20(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  16(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  12(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  8(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  4(a0),d0
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d0
                move.b  (a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                or.b    d1,d0
                move.l  d0,-(a6)
                move.b  28(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  24(a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                move.b  20(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  16(a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  12(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  8(a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                lsl.l   #BYTE_SHIFT_COUNT,d0
                move.b  4(a0),d0
                lsl.b   #NIBBLE_SHIFT_COUNT,d0
                move.b  (a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                or.b    d1,d0
                move.l  d0,-(a6)
                addq.l  #1,a0
                dbf     d5,loc_45988
                
                adda.l  #28,a0
                dbf     d6,loc_45984
                dbf     d7,loc_45980
                
                move.w  #1,d7
loc_45A2C:
                
                moveq   #$60,d0 
                bsr.w   sub_45B0E
                move.l  #$C0,d0 
                bsr.w   sub_45B0E
                move.l  #$120,d0
                bsr.w   sub_45B0E
                moveq   #$40,d0 
                bsr.w   sub_45B0E
                move.l  #$A0,d0 
                bsr.w   sub_45B0E
                move.l  #$100,d0
                bsr.w   sub_45B0E
                moveq   #$20,d0 
                bsr.w   sub_45B0E
                move.l  #$80,d0 
                bsr.w   sub_45B0E
                move.l  #$E0,d0 
                bsr.w   sub_45B0E
                adda.l  #$120,a6
                dbf     d7,loc_45A2C
                
                unlk    a6
                movem.l (sp)+,d0-d1/d5-a0
                rts

    ; End of function OrientSpriteRight


; =============== S U B R O U T I N E =======================================


sub_45A8C:
                
                movem.l d0-a0,-(sp)
                link    a6,#-576
                move.w  #143,d7
loc_45A98:
                
                move.l  (a0)+,-(a6)
                dbf     d7,loc_45A98
                
                move.w  #1,d7
loc_45AA2:
                
                moveq   #$20,d0 
                bsr.w   sub_45B0E
                bsr.w   sub_45B30
                moveq   #$40,d0 
                bsr.w   sub_45B0E
                moveq   #$60,d0 
                bsr.w   sub_45B0E
                move.l  #$80,d0 
                bsr.w   sub_45B0E
                bsr.w   sub_45B64
                move.l  #$A0,d0 
                bsr.w   sub_45B0E
                move.l  #$C0,d0 
                bsr.w   sub_45B0E
                move.l  #$E0,d0 
                bsr.w   sub_45B0E
                bsr.w   sub_45B30
                move.l  #$100,d0
                bsr.w   sub_45B0E
                move.l  #$120,d0
                bsr.w   sub_45B0E
                adda.l  #$120,a6
                dbf     d7,loc_45AA2
                
                unlk    a6
                movem.l (sp)+,d0-a0
                rts

    ; End of function sub_45A8C


; =============== S U B R O U T I N E =======================================


sub_45B0E:
                
                move.l  -$20(a6,d0.l),-(a0)
                move.l  -$1C(a6,d0.l),-(a0)
                move.l  -$18(a6,d0.l),-(a0)
                move.l  -$14(a6,d0.l),-(a0)
                move.l  -$10(a6,d0.l),-(a0)
                move.l  -$C(a6,d0.l),-(a0)
                move.l  -8(a6,d0.l),-(a0)
                move.l  -4(a6,d0.l),-(a0)
                rts

    ; End of function sub_45B0E


; =============== S U B R O U T I N E =======================================


sub_45B30:
                
                movem.l a0,-(sp)
                move.w  #$1F,d6
loc_45B38:
                
                move.b  (a0),d1
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d1
                cmpi.b  #$20,d1 
                bne.s   loc_45B48
                andi.b  #BYTE_LOWER_NIBBLE_MASK,(a0)
loc_45B48:
                
                move.b  (a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                cmpi.b  #2,d1
                bne.s   loc_45B58
                andi.b  #BYTE_UPPER_NIBBLE_MASK,(a0)
loc_45B58:
                
                addq.l  #1,a0
                dbf     d6,loc_45B38
                
                movem.l (sp)+,a0
                rts

    ; End of function sub_45B30


; =============== S U B R O U T I N E =======================================


sub_45B64:
                
                movem.l a0,-(sp)
                move.w  #$F,d6
loc_45B6C:
                
                move.w  (a0),d1
                cmpi.w  #$2222,d1
                bne.s   loc_45B78
                andi.w  #0,(a0)
loc_45B78:
                
                addq.l  #2,a0
                dbf     d6,loc_45B6C
                
                movem.l (sp)+,a0
                rts

    ; End of function sub_45B64


; =============== S U B R O U T I N E =======================================

; In: a0, a1 = pointer to mapsprite decompressed pixel data in RAM


ApplySpriteGhostEffect:
                
                movem.l d0-d1/d7-a0,-(sp)
                move.w  #GFX_MAPSPRITE_PIXELS_COUNTER,d7
loc_45B8C:
                
                move.b  (a0),d0
                move.b  d0,d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.b  #2,d0
                bne.s   loc_45B9E
                moveq   #1,d0
                bra.s   loc_45BA0
loc_45B9E:
                
                clr.w   d0
loc_45BA0:
                
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d1
                cmpi.b  #$20,d1 
                bne.s   loc_45BAE
                moveq   #$10,d1
                bra.s   loc_45BB0
loc_45BAE:
                
                clr.w   d1
loc_45BB0:
                
                move.b  d0,(a0)
                or.b    d1,(a0)+
                dbf     d7,loc_45B8C
                
                movem.l (sp)+,d0-d1/d7-a0
                rts

    ; End of function ApplySpriteGhostEffect


; =============== S U B R O U T I N E =======================================

; In: a0, a1 = pointer to mapsprite decompressed pixel data in RAM


ResizeSprite:
                
                movem.l d0-a5,-(sp)
                link    a6,#64960
                movea.l a6,a1
                move.w  #$8F,d7 
                moveq   #0,d1
loc_45BCE:
                
                move.l  d1,-(a1)
                dbf     d7,loc_45BCE
                
                movea.l a0,a4
                movea.l a1,a5
                tst.w   d0
                bne.s   loc_45BDE
                addq.w  #1,d0
loc_45BDE:
                
                move.l  #$1800,d4
                divu.w  d0,d4
                move.w  #$18,d5
                sub.w   d0,d5
                lsr.w   #1,d5
                move.w  d5,d6
                add.w   d0,d6
                lea     table_45C6A(pc), a0
                moveq   #1,d7
loc_45BF8:
                
                move.w  d5,d2
loc_45BFA:
                
                move.w  d2,d0
                sub.w   d5,d0
                mulu.w  d4,d0
                lsr.w   #6,d0
                andi.w  #$FFFC,d0
                movea.l a4,a2
                adda.w  d0,a2
                move.w  d2,d0
                add.w   d5,d0
                lsl.w   #2,d0
                movea.l a5,a3
                adda.w  d0,a3
                clr.w   d0
                move.w  d5,d1
loc_45C18:
                
                move.w  d1,d3
                sub.w   d5,d3
                mulu.w  d4,d3
                lsr.w   #BYTE_SHIFT_COUNT,d3
                move.b  (a0,d3.w),d3
                move.b  (a0,d1.w),d0
                move.b  (a2,d3.w),d3
                btst    #0,d1
                bne.s   loc_45C38
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d3
                bra.s   loc_45C3C
loc_45C38:
                
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d3
loc_45C3C:
                
                or.b    d3,(a3,d0.w)
                addq.w  #1,d1
                cmp.w   d6,d1
                bcs.s   loc_45C18
                addq.w  #1,d2
                cmp.w   d6,d2
                bcs.s   loc_45BFA
                adda.w  #$120,a4
                adda.w  #$120,a5
                dbf     d7,loc_45BF8
                
                move.w  #$8F,d7 
loc_45C5C:
                
                move.l  -(a5),-(a4)
                dbf     d7,loc_45C5C
                
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function ResizeSprite

table_45C6A:    dc.b 0
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 3
                dc.b $60
                dc.b $60
                dc.b $61
                dc.b $61
                dc.b $62
                dc.b $62
                dc.b $63
                dc.b $63
                dc.b $C0
                dc.b $C0
                dc.b $C1
                dc.b $C1
                dc.b $C2
                dc.b $C2
                dc.b $C3
                dc.b $C3

; =============== S U B R O U T I N E =======================================

; In: a0, a1 = pointer to mapsprite decompressed pixel data in RAM


ApplySpriteImmersedEffect:
                
                movem.l d0-d1,-(sp)
                moveq   #$A,d0
                moveq   #$B,d1
                bsr.w   ApplySpriteCropEffect
                movem.l (sp)+,d0-d1
                rts

    ; End of function ApplySpriteImmersedEffect


; =============== S U B R O U T I N E =======================================


ApplyMinorSpriteCropEffect:
                
                movem.l d0-d1,-(sp)
                moveq   #1,d0
                moveq   #$B,d1
                bsr.w   ApplySpriteCropEffect
                movem.l (sp)+,d0-d1
                rts

    ; End of function ApplyMinorSpriteCropEffect


; =============== S U B R O U T I N E =======================================


ApplySpriteCropEffect:
                
                movem.l d7-a1,-(sp)
                move.w  d1,d7
                lsl.w   #2,d7
                adda.w  d7,a0
                movea.l a0,a1
                move.w  d0,d7
                lsl.w   #2,d7
                adda.w  d7,a1
                move.w  d1,d7
                bmi.w   loc_45D16
loc_45CBE:
                
                move.l  (a0),(a1)
                move.l  $60(a0),$60(a1)
                move.l  $C0(a0),$C0(a1)
                move.l  $120(a0),$120(a1)
                move.l  $180(a0),$180(a1)
                move.l  $1E0(a0),$1E0(a1)
                suba.l  #4,a0
                suba.l  #4,a1
                dbf     d7,loc_45CBE
                
                move.w  d0,d7
                subq.w  #1,d7
                bcs.w   loc_45D16
loc_45CF6:
                
                clr.l   (a1)
                clr.l   $60(a1)
                clr.l   $C0(a1)
                clr.l   $120(a1)
                clr.l   $180(a1)
                clr.l   $1E0(a1)
                suba.l  #4,a1
                dbf     d7,loc_45CF6
loc_45D16:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function ApplySpriteCropEffect


; =============== S U B R O U T I N E =======================================


sub_45D1C:
                
                movem.l d1-d7,-(sp)
                moveq   #0,d2
                moveq   #0,d4
                moveq   #$B,d7
loc_45D26:
                
                moveq   #8,d1
                moveq   #7,d3
                moveq   #7,d6
loc_45D2C:
                
                bsr.w   sub_45DA4
                addq.w  #1,d1
                addq.w  #1,d3
                dbf     d6,loc_45D2C
                
                addq.w  #1,d2
                addq.w  #1,d4
                dbf     d7,loc_45D26
                
                movem.l (sp)+,d1-d7
                rts

    ; End of function sub_45D1C


; =============== S U B R O U T I N E =======================================


sub_45D46:
                
                movem.l d1-d7,-(sp)
                moveq   #0,d2
                moveq   #0,d4
                moveq   #$B,d7
loc_45D50:
                
                moveq   #$F,d1
                moveq   #$10,d3
                moveq   #7,d6
loc_45D56:
                
                bsr.w   sub_45DA4
                subq.w  #1,d1
                subq.w  #1,d3
                dbf     d6,loc_45D56
                
                addq.w  #1,d2
                addq.w  #1,d4
                dbf     d7,loc_45D50
                
                movem.l (sp)+,d1-d7
                rts

    ; End of function sub_45D46


; =============== S U B R O U T I N E =======================================


sub_45D70:
                
                movem.l d1-d7,-(sp)
                moveq   #$B,d2
                moveq   #$C,d4
                moveq   #$B,d7
loc_45D7A:
                
                moveq   #7,d1
                moveq   #7,d3
                moveq   #9,d6
loc_45D80:
                
                bsr.w   sub_45DA4
                addq.w  #1,d1
                addq.w  #1,d3
                dbf     d6,loc_45D80
                
                subq.w  #1,d2
                subq.w  #1,d4
                dbf     d7,loc_45D7A
                
                clr.l   (a0)
                clr.l   $60(a0)
                clr.l   $C0(a0)
                movem.l (sp)+,d1-d7
                rts

    ; End of function sub_45D70


; =============== S U B R O U T I N E =======================================


sub_45DA4:
                
                movem.l d1-d4/a1-a3,-(sp)
                lea     table_45C6A(pc), a3
                movea.l a0,a1
                lsl.w   #2,d2
                adda.w  d2,a1
                move.b  (a3,d1.w),d2
                adda.w  d2,a1
                movea.l a0,a2
                lsl.w   #2,d4
                adda.w  d4,a2
                move.b  (a3,d3.w),d4
                adda.w  d4,a2
                move.b  (a1),d2
                move.b  $120(a1),d4
                btst    #0,d1
                bne.s   loc_45DD6
                lsr.w   #NIBBLE_SHIFT_COUNT,d2
                lsr.w   #NIBBLE_SHIFT_COUNT,d4
                bra.s   loc_45DDE
loc_45DD6:
                
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d4
loc_45DDE:
                
                btst    #0,d3
                bne.s   loc_45DFA
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                andi.b  #BYTE_LOWER_NIBBLE_MASK,(a2)
                add.b   d2,(a2)
                lsl.w   #NIBBLE_SHIFT_COUNT,d4
                andi.b  #BYTE_LOWER_NIBBLE_MASK,$120(a2)
                add.b   d4,$120(a2)
                bra.s   loc_45E0A
loc_45DFA:
                
                andi.b  #BYTE_UPPER_NIBBLE_MASK,(a2)
                add.b   d2,(a2)
                andi.b  #BYTE_UPPER_NIBBLE_MASK,$120(a2)
                add.b   d4,$120(a2)
loc_45E0A:
                
                movem.l (sp)+,d1-d4/a1-a3
                rts

    ; End of function sub_45DA4


; =============== S U B R O U T I N E =======================================


sub_45E10:
                
                movem.l d0-d3/d7-a0,-(sp)
                moveq   #-1,d1
                moveq   #-1,d2
                move.l  #$FFFFFFF,d3
loc_45E1E:
                
                lsr.w   #1,d0
                bcc.s   loc_45E24
                and.l   d3,d1
loc_45E24:
                
                btst    #7,d0
                beq.s   loc_45E2C
                and.l   d3,d2
loc_45E2C:
                
                ror.l   #4,d3
                tst.w   d0
                bne.s   loc_45E1E
                move.w  #$8F,d7 
loc_45E36:
                
                and.l   d1,(a0)+
                and.l   d2,(a0)+
                dbf     d7,loc_45E36
                
                movem.l (sp)+,d0-d3/d7-a0
                rts

    ; End of function sub_45E10

