
; ASM FILE code\gameflow\battle\battlescenes\animation\update\snowbreath.asm :
; 0x1E7B2..0x1E958 : 

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_SnowBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                addq.b  #1,2(a3)
                move.b  2(a3),3(a3)
                moveq   #$18,d1
                moveq   #$26,d0 
loc_1E7CC:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1E8AA
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1E806
                lea     table_1E8E2(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1E7EE
                addq.w  #8,a0
loc_1E7EE:
                
                bsr.w   sub_19F5E
                move.w  (a4),8(a5)
                moveq   #$28,d6 
                jsr     (GenerateRandomNumber).w
                add.w   (a3),d7
                move.w  d7,2(a5)
                bra.w   loc_1E8AA
loc_1E806:
                
                move.w  2(a5),d0
                jsr     (sub_179C).w    
                asl.w   #2,d1
                add.w   4(a5),d1
                tst.w   d1
                bmi.s   loc_1E822
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1E830
loc_1E822:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1E830:
                
                move.w  d0,4(a5)
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                swap    d1
                asl.w   #2,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1E84E
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1E85C
loc_1E84E:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1E85C:
                
                move.w  d0,6(a5)
                add.w   d1,8(a5)
                cmpi.w  #5,(a5)
                bne.w   loc_1E88A
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1E8AA
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1E8AA
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1E8AA
loc_1E88A:
                
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E8AA
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1E8AA:
                
                move.w  8(a5),(a4)
                moveq   #$10,d0
                lea     table_1E8F2(pc), a0
                bsr.w   sub_1B884
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1E7CC
                move.b  2(a3),d0
                andi.w  #3,d0
                bne.s   loc_1E8D6
                sndCom  SFX_TINKLING
loc_1E8D6:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                bra.w   loc_1D45C

    ; End of function spellanimationUpdate_SnowBreath

table_1E8E2:    dc.b 1
                dc.b $1C
                dc.b 0
                dc.b $DE
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $E0
                dc.b 0
                dc.b $DF
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $20
table_1E8F2:    dc.b 0
                dc.b 2
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b 4
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 6
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $C
                dc.b 0
                dc.b 8
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $A
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $14
                dc.b 0
                dc.b $D
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $F
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $21
                dc.b 0
                dc.b $11
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $13
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $33
                dc.b 0
                dc.b $15
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $3C
                dc.b 0
                dc.b $17
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $45
                dc.b 0
                dc.b $1A
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $4E
                dc.b 0
                dc.b $1C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $5E
                dc.b 0
                dc.b $1E
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $6E
                dc.b 0
                dc.b $20
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $7E
                dc.b 0
                dc.b $22
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $8E
                dc.b 0
                dc.b $24
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $9E
