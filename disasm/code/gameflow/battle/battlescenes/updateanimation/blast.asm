
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\blast.asm :
; 0x1C7F6..0x1CC56 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Blast:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #7,d1
loc_1C804:
                
                move.w  d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1C9A0
                tst.b   2(a5)
                beq.w   loc_1C8EC
                subq.b  #1,2(a5)
                bne.w   loc_1C9A0
                moveq   #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #4,d7
                bcc.s   loc_1C84C
                clr.w   2(a5)
                tst.w   6(a3)
                bne.s   loc_1C83A
                clr.w   d1
                move.w  #$C520,d2
                bra.s   loc_1C842
loc_1C83A:
                
                move.w  #$500,d1
                move.w  #$C521,d2
loc_1C842:
                
                move.w  #$680,d3
                move.w  #$680,d4
                bra.s   loc_1C872
loc_1C84C:
                
                move.w  #1,2(a5)
                tst.w   6(a3)
                bne.s   loc_1C862
                move.w  #$100,d1
                move.w  #$C537,d2
                bra.s   loc_1C86A
loc_1C862:
                
                move.w  #$500,d1
                move.w  #$C539,d2
loc_1C86A:
                
                move.w  #$780,d3
                move.w  #$FF80,d4
loc_1C872:
                
                add.w   d7,d7
                move.w  d7,d0
                add.w   d7,d7
                add.w   d0,d7
                lea     table_1CBBA(pc), a0
                adda.w  d7,a0  ; offset by 6x random value
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$10,d7
                add.w   2(a0),d7
                add.w   2(a3),d7
                move.w  d7,(a4)
                move.w  d1,VDPSPRITE_OFFSET_SIZE(a4)
                or.w    4(a0),d2
                move.w  d2,VDPSPRITE_OFFSET_TILE(a4)
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$10,d7
                add.w   (a0),d7
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                add.w   d3,d7
                tst.w   (a0)
                bmi.s   loc_1C8C2
                neg.w   d7
loc_1C8C2:
                
                move.w  d7,4(a5)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                add.w   d4,d7
                tst.w   2(a0)
                bmi.s   loc_1C8D8
                neg.w   d7
loc_1C8D8:
                
                move.w  d7,6(a5)
                move.w  #1,(a5)
                clr.l   8(a5)
                sndCom  SFX_BLAST_SPELL
                bra.w   loc_1C9A0
loc_1C8EC:
                
                addq.w  #1,(a5)
                cmpi.w  #$A,(a5)
                bcc.w   loc_1C918
                lea     table_1CBDE(pc), a0
                tst.w   6(a3)
                beq.s   loc_1C904
                lea     $18(a0),a0
loc_1C904:
                
                tst.b   3(a5)
                beq.s   loc_1C90E
                lea     $C(a0),a0
loc_1C90E:
                
                moveq   #2,d0
                bsr.w   sub_1B884
                bra.w   loc_1C9A0
loc_1C918:
                
                move.w  4(a5),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1C92E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1C93C
loc_1C92E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1C93C:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1C95A
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1C968
loc_1C95A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1C968:
                
                move.w  d1,$A(a5)
                add.w   d0,(a4)
                cmpi.w  #$12,(a5)
                bcs.w   loc_1C9A0
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1C994
                clr.w   (a5)
                bra.w   loc_1C9A0
loc_1C994:
                
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.b  d7,2(a5)
loc_1C9A0:
                
                move.w  (sp)+,d1
                lea     $C(a5),a5
                addq.w  #8,a4
                dbf     d1,loc_1C804
                tst.w   (a5)
                beq.w   loc_1CAA8
                addq.w  #1,(a5)
                subq.b  #1,3(a5)
                bne.w   loc_1CAA8
                move.b  #2,3(a5)
                move.b  2(a5),d0
                addq.w  #1,d0
                andi.w  #3,d0
                move.b  d0,2(a5)
                bne.w   loc_1CA22
                move.w  #$7FF,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,d0
                andi.w  #7,d0
                move.w  d0,4(a5)
                bsr.w   sub_1CBA6
                move.w  d7,d1
                lsr.w   #3,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                subi.w  #$10,d1
                move.b  1(a0),d2
                ext.w   d2
                add.w   d2,d1
                add.w   2(a3),d1
                move.w  d1,(a4)
                lsr.w   #7,d7
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d7
                subi.w  #$18,d7
                move.b  (a0),d2
                ext.w   d2
                add.w   d2,d7
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                lea     table_1CC44(pc), a1
                bra.w   loc_1CA76
loc_1CA22:
                
                subq.w  #1,d0
                bne.w   loc_1CA38
                lea     table_1CC46(pc), a1
                move.w  4(a5),d0
                bsr.w   sub_1CBA6
                bra.w   loc_1CA76
loc_1CA38:
                
                subq.w  #1,d0
                bne.w   loc_1CA5E
                move.w  4(a5),d0
                bsr.w   sub_1CBA6
                clr.w   d1
                move.b  4(a0),d1
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                move.b  5(a0),d1
                add.w   d1,(a4)
                lea     table_1CC48(pc), a1
                bra.w   loc_1CA76
loc_1CA5E:
                
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                move.b  #4,3(a5)
                bra.w   loc_1CAA8
loc_1CA76:
                
                clr.w   d0
                move.b  2(a0),d0
                add.w   d0,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                adda.w  d0,a1
                clr.w   d0
                move.b  (a1),d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  d0,VDPSPRITE_OFFSET_SIZE(a4)
                clr.w   d0
                move.b  1(a1),d0
                addi.w  #-$3AE0,d0
                clr.w   d1
                move.b  3(a0),d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                or.w    d1,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
loc_1CAA8:
                
                tst.w   4(a3)
                beq.w   loc_1CB94
                lea     $C(a5),a5
                addq.w  #8,a4
                tst.w   (a5)
                beq.w   loc_1CB00
                addq.w  #1,(a5)
                subq.b  #1,3(a5)
                bne.w   loc_1CB00
                move.b  #4,3(a5)
                clr.w   d0
                move.b  2(a5),d0
                addq.w  #1,d0
                cmpi.w  #4,d0
                bcs.s   loc_1CAE6
                clr.w   d0
                move.w  4(a3),d1
                addq.w  #8,d1
                move.w  d1,VDPSPRITE_OFFSET_X(a4)
loc_1CAE6:
                
                move.b  d0,2(a5)
                beq.s   loc_1CAFC
                move.w  4(a5),(a4)
                lsl.w   #2,d0
                addi.w  #-$3A59,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1CB00
loc_1CAFC:
                
                move.w  #1,(a4)
loc_1CB00:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                tst.w   (a5)
                beq.w   loc_1CB94
                addq.w  #1,(a5)
                subq.b  #1,3(a5)
                bne.w   loc_1CB42
                move.b  #4,3(a5)
                clr.w   d0
                move.b  2(a5),d0
                addq.w  #1,d0
                cmpi.w  #3,d0
                bcs.s   loc_1CB2C
                clr.w   d0
loc_1CB2C:
                
                move.b  d0,2(a5)
                lsl.w   #5,d0
                addi.w  #-$3AB5,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                addi.w  #$10,d0
                move.w  d0,$C(a4)
loc_1CB42:
                
                move.w  #$C0,d0 
                tst.b   5(a5)
                beq.s   loc_1CB4E
                neg.w   d0
loc_1CB4E:
                
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1CB60
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1CB6E
loc_1CB60:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1CB6E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                add.w   d0,$E(a4)
                move.w  VDPSPRITE_OFFSET_X(a4),4(a3)
                subq.b  #1,4(a5)
                bne.w   loc_1CB94
                move.b  #$3C,4(a5) 
                bchg    #0,5(a5)
loc_1CB94:
                
                lea     table_1CC0E(pc), a0
                bsr.w   sub_1B8B2
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Blast


; =============== S U B R O U T I N E =======================================


sub_1CBA6:
                
                move.w  d0,-(sp)
                lea     table_1CC14(pc), a0
                add.w   d0,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                adda.w  d0,a0  ; offset by 6x
                move.w  (sp)+,d0
                rts

    ; End of function sub_1CBA6

table_1CBBA:    dc.w -48     ; X
                dc.w -48     ; Y
                dc.w 0       ; tile modifier
                
                dc.w 48
                dc.w -48
                dc.w VDPTILE_MIRROR
                
                dc.w -48
                dc.w 48
                dc.w VDPTILE_FLIP
                
                dc.w 48
                dc.w 48
                dc.w VDPTILE_MIRROR|VDPTILE_FLIP
                
                ; 4&5
                dc.w -52
                dc.w 0
                dc.w 0
                
                dc.w 52
                dc.w 0
                dc.w VDPTILE_MIRROR
                
table_1CBDE:    dc.w 5
                dc.w $500
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 9
                dc.b 6
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 5
                
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $19
                dc.b 0
                dc.b 9
                dc.b 9
                dc.b 0
                dc.b 0
                dc.b $1D
                dc.b 0
                dc.b 5
                
                dc.b 6
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 9
                dc.b $B
                dc.b 0
                dc.b 0
                dc.b $B
                dc.b 0
                dc.b 5
                
                dc.b 9
                dc.b 0
                dc.b 0
                dc.b $1D
                dc.b 0
                dc.b 9
                dc.b $D
                dc.b 0
                dc.b 0
                dc.b $23
table_1CC0E:    dc.b $C
                dc.b $C4
                dc.b 0
                dc.b $A
                dc.b 0
                dc.b 1
                
table_1CC14:    dc.b $18
                dc.b $18
                dc.b 1
                dc.b VDPTILE_FLIP_BYTE  ; tile modifier byte
                dc.b 8    ; X
                dc.b 0    ; Y
                
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 8
                
                dc.b $E8
                dc.b $18
                dc.b 1
                dc.b VDPTILE_MIRROR_BYTE|VDPTILE_FLIP_BYTE
                dc.b 0
                dc.b 0
                
                dc.b $18
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 8
                dc.b 8
                
                dc.b $E8
                dc.b 0
                dc.b 2
                dc.b VDPTILE_MIRROR_BYTE
                dc.b 8
                dc.b 8
                
                dc.b $18
                dc.b $E8
                dc.b 1
                dc.b 0
                dc.b 8
                dc.b 0
                
                dc.b 0
                dc.b $E8
                dc.b 0
                dc.b VDPTILE_FLIP_BYTE
                dc.b 0
                dc.b 0
                
                dc.b $E8
                dc.b $E8
                dc.b 1
                dc.b VDPTILE_MIRROR_BYTE
                dc.b 0
                dc.b 0
                
table_1CC44:    dc.b $50
                dc.b $97
table_1CC46:    dc.b $70
                dc.b $9B
table_1CC48:    dc.b $60
                dc.b $A3
                dc.b $50
                dc.b $A9
                dc.b $D0
                dc.b $AD
                dc.b $90
                dc.b $B5
                dc.b $50
                dc.b $BB
                dc.b $F0
                dc.b $BF
                dc.b $60
                dc.b $CF
