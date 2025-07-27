
; ASM FILE code\gameflow\battle\battlescenes\animation\update\shotfire.asm :
; 0x1D786..0x1D9FC : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_ShotFire:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   $C(a3)
                bne.w   loc_1D8AE
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1D810
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D7B8
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D7C6
loc_1D7B8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D7C6:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D7E4
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D7F2
loc_1D7E4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D7F2:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D9B2
                cmpi.w  #$14,(a5)
                bcs.s   loc_1D80C
                addq.w  #1,2(a5)
                move.w  #$1C,4(a5)
loc_1D80C:
                
                bra.w   loc_1D9A8
loc_1D810:
                
                cmpi.w  #1,2(a5)
                bne.w   loc_1D83C
                subq.w  #1,4(a5)
                bne.w   loc_1D9A8
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                move.w  6(a3),(a4)
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   loc_1D9A8
loc_1D83C:
                
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D850
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D85E
loc_1D850:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D85E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D87C
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D88A
loc_1D87C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D88A:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1D9B2
                cmpi.w  #$11,(a5)
                bcs.w   loc_1D9A8
                move.w  #1,(a5)
                clr.l   2(a5)
                move.w  #1,$C(a3)
                bra.w   loc_1D9A8
loc_1D8AE:
                
                clr.b   ((byte_FFB588-$1000000)).w
                moveq   #$26,d0 
                moveq   #$F,d1
loc_1D8B6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D998
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1D928
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                lea     table_1D9CE(pc), a0
                move.b  d7,$A(a5)
                beq.s   loc_1D8DC
                addq.w  #8,a0
loc_1D8DC:
                
                moveq   #$50,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$28,d7 
                add.w   8(a3),d7
                move.w  d7,d2
                moveq   #$50,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$28,d7 
                add.w   $A(a3),d7
                move.w  d7,d3
                moveq   #1,d1
                bsr.w   sub_19FAA       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                lsr.w   #1,d7
                bcc.s   loc_1D912
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1D912:
                
                lsr.w   #1,d7
                bcc.s   loc_1D91C
                bset    #4,VDPSPRITE_OFFSET_TILE(a4)
loc_1D91C:
                
                addq.w  #1,2(a5)
                sndCom  SFX_BATTLEFIELD_DEATH
                bra.w   loc_1D998
loc_1D928:
                
                cmpi.w  #4,(a5)
                bne.w   loc_1D954
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1D998
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1D998
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1D998
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D954:
                
                tst.b   $A(a5)
                bne.s   loc_1D96E
                lea     table_1D9DE(pc), a0
                moveq   #2,d0
                bsr.w   sub_1B884
                cmpi.w  #9,(a5)
                bcc.w   loc_1D984
                bra.s   loc_1D980
loc_1D96E:
                
                lea     table_1D9EA(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                cmpi.w  #$C,(a5)
                bcc.w   loc_1D984
loc_1D980:
                
                bra.w   loc_1D998
loc_1D984:
                
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D998:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D8B6
loc_1D9A8:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_ShotFire


; =============== S U B R O U T I N E =======================================


sub_1D9B2:
                
                move.w  4(a4),d0
                andi.w  #$F800,d0
                ori.w   #$56C,d0
                btst    #1,1(a5)
                beq.s   loc_1D9C8
                addq.w  #4,d0
loc_1D9C8:
                
                move.w  d0,4(a4)
                rts

    ; End of function sub_1D9B2

table_1D9CE:    vdpSpell 0, 0, SPELLTILE65, V2|H2|32  ; graphic Burst_Shot
                vdpSpell -8, -8, SPELLTILE1, V4|H4|32 ; graphic Burst_Explosion
                
table_1D9DE:    dc.b 0
                dc.b 3
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $44
                dc.b 0
                dc.b 6
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $48
table_1D9EA:    dc.b 0
                dc.b 3
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b 6
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 9
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
