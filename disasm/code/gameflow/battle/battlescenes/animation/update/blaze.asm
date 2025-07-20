
; ASM FILE code\gameflow\battle\battlescenes\animation\update\blaze.asm :
; 0x1B93C..0x1BE9E : 

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Blaze:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1B9EA
                addq.w  #1,(a5)
                cmpi.w  #$28,(a5) 
                bne.s   loc_1B95A
                clr.b   ((byte_FFB588-$1000000)).w
loc_1B95A:
                
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1B982
                moveq   #1,d1
                move.w  d1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  d1,VDPSPRITE_OFFSET_X(a4)
                move.w  d1,NEXTVDPSPRITE_OFFSET_Y(a4)
                clr.l   NEXTVDPSPRITE_OFFSET_SIZE(a4)
                move.w  d1,NEXTVDPSPRITE_OFFSET_X(a4)
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1B9EA
loc_1B982:
                
                subq.w  #1,2(a5)
                bne.w   loc_1B9BC
                move.w  #5,2(a5)
                lea     table_1BE2A(pc), a0
                bchg    #0,6(a5)
                beq.s   loc_1B99E
                addq.w  #4,a0
loc_1B99E:
                
                clr.w   d1
                move.b  (a3),d1
                lsl.w   #3,d1
                move.w  (a0,d1.w),d2
                addi.w  #-$3AE0,d2
                move.w  d2,VDPSPRITE_OFFSET_TILE(a4)
                move.w  2(a0,d1.w),d2
                addi.w  #-$3AE0,d2
                move.w  d2,NEXTVDPSPRITE_OFFSET_TILE(a4)
loc_1B9BC:
                
                btst    #0,1(a5)
                bne.s   loc_1B9D0
                move.w  #1,(a4)
                move.w  #1,NEXTVDPSPRITE_OFFSET_Y(a4)
                bra.s   loc_1B9EA
loc_1B9D0:
                
                clr.w   d1
                move.b  2(a3),d1
                addi.w  #$80,d1 
                move.w  d1,(a4)
                clr.w   d1
                move.b  3(a3),d1
                addi.w  #$80,d1 
                move.w  d1,NEXTVDPSPRITE_OFFSET_Y(a4)
loc_1B9EA:
                
                lea     ((byte_FFB41E-$1000000)).w,a5
                lea     ((SPRITE_40-$1000000)).w,a4
                moveq   #$28,d0 
                clr.w   d1
                move.b  5(a3),d1
                beq.w   loc_1BC0A
                subq.w  #1,d1
loc_1BA00:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1BBFA
                addq.w  #1,(a5)
                move.b  2(a5),d1
                bne.w   loc_1BA8C
                subq.b  #1,3(a5)
                bne.w   loc_1BBFA
                move.w  #$106,2(a5)
                lea     table_1BE42(pc), a0
                tst.b   4(a3)
                beq.s   loc_1BA30
                lea     $20(a0),a0
loc_1BA30:
                
                bsr.w   sub_19F5E
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BA42
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1BA42:
                
                move.w  #$60,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$80,d7 
                clr.w   d0
                move.b  6(a3),d0
                add.w   d0,d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$300,d7
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BA70
                neg.w   d7
loc_1BA70:
                
                move.w  d7,4(a5)
                move.w  #$200,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$700,d7
                move.w  d7,6(a5)
                sndCom  SFX_DESOUL_HOVERING
                bra.w   loc_1BBFA
loc_1BA8C:
                
                subq.b  #1,d1
                bne.w   loc_1BB46
                move.w  4(a5),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1BAA8
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1BAB6
loc_1BAA8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1BAB6:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1BAD4
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1BAE2
loc_1BAD4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1BAE2:
                
                move.w  d1,$A(a5)
                add.w   d0,(a4)
                cmpi.w  #$F8,(a4) 
                bcs.s   loc_1BAF8
                move.w  #$200,2(a5)
                bra.w   loc_1BBFA
loc_1BAF8:
                
                subq.b  #1,3(a5)
                move.b  3(a5),d1
                andi.w  #$3F,d1 
                bne.w   loc_1BBFA
                lea     table_1BE46(pc), a0
                moveq   #6,d1
                btst    #6,3(a5)
                bne.s   loc_1BB1C
                bset    #6,d1
                addq.w  #8,a0
loc_1BB1C:
                
                move.b  d1,3(a5)
                tst.b   4(a3)
                beq.s   loc_1BB2A
                lea     $20(a0),a0
loc_1BB2A:
                
                move.w  (a0),d1
                addi.w  #-$4000,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BB42
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1BB42:
                
                bra.w   loc_1BBFA
loc_1BB46:
                
                subq.b  #1,d1
                bne.w   loc_1BB80
                move.w  #$300,2(a5)
                lea     table_1BE52(pc), a0
                tst.b   4(a3)
                beq.s   loc_1BB60
                lea     $20(a0),a0
loc_1BB60:
                
                move.w  (a4),d3
                move.w  VDPSPRITE_OFFSET_X(a4),d2
                bsr.w   sub_19F5E
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d3,(a4)
                move.w  d3,$A(a5)
                sndCom  SFX_BATTLEFIELD_DEATH
                bsr.w   sub_1B8FE
                bra.w   loc_1BBFA
loc_1BB80:
                
                addq.b  #1,3(a5)
                cmpi.b  #6,3(a5)
                bne.s   loc_1BBAE
                lea     table_1BE5A(pc), a0
                move.w  (a4),d3
                move.w  VDPSPRITE_OFFSET_X(a4),d2
                tst.b   4(a3)
                beq.s   loc_1BBA2
                lea     $20(a0),a0
                bra.s   loc_1BBA4
loc_1BBA2:
                
                addq.w  #8,d3
loc_1BBA4:
                
                bsr.w   sub_19F5E
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d3,(a4)
loc_1BBAE:
                
                btst    #0,1(a5)
                bne.s   loc_1BBBC
                move.w  #1,(a4)
                bra.s   loc_1BBC0
loc_1BBBC:
                
                move.w  $A(a5),(a4)
loc_1BBC0:
                
                cmpi.b  #$C,3(a5)
                bcs.w   loc_1BBFA
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1BBE8
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1BBFA
loc_1BBE8:
                
                move.w  #1,(a5)
                move.w  #$14,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,2(a5)
loc_1BBFA:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                lea     $C(a5),a5
                dbf     d1,loc_1BA00
loc_1BC0A:
                
                bsr.w   sub_1B90C       
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BC20
                rts
loc_1BC20:
                
                addq.w  #1,(a5)
                move.w  6(a5),d2
                tst.b   $F(a5)
                bne.s   loc_1BC3E
                addi.w  #$10,d2
                cmpi.w  #$300,d2
                bcs.s   loc_1BC3C
                move.b  #1,$F(a5)
loc_1BC3C:
                
                bra.s   loc_1BC4C
loc_1BC3E:
                
                subi.w  #$10,d2
                cmpi.w  #$100,d2
                bhi.s   loc_1BC4C
                clr.b   $F(a5)
loc_1BC4C:
                
                move.w  d2,6(a5)
                move.b  $E(a5),d1
                beq.w   loc_1BCEC
                move.w  2(a5),d0
                subq.b  #1,d1
                bne.s   loc_1BC64
                addq.w  #8,d0
                bra.s   loc_1BC66
loc_1BC64:
                
                subq.w  #8,d0
loc_1BC66:
                
                andi.w  #BYTE_MASK,d0
                move.w  d0,2(a5)
                cmp.w   4(a5),d0
                bne.s   loc_1BC7E
                clr.b   $E(a5)
                move.w  #6,$10(a5)
loc_1BC7E:
                
                bsr.w   sub_1BD4C
                jsr     (sub_179C).w    
                move.w  d1,d0
                muls.w  d2,d0
                asr.l   #7,d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1BC9E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1BCAC
loc_1BC9E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1BCAC:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  VDPSPRITE_OFFSET_X(a4),(a2)
                swap    d1
                muls.w  d2,d1
                asr.l   #7,d1
                add.w   $A(a5),d1
                tst.w   d1
                bmi.s   loc_1BCD0
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1BCDE
loc_1BCD0:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1BCDE:
                
                move.w  d0,$A(a5)
                add.w   d1,(a4)
                move.w  (a4),2(a2)
                bra.w   loc_1BD2E
loc_1BCEC:
                
                move.w  2(a5),d0
                move.w  6(a5),d2
                tst.w   $10(a5)
                beq.s   loc_1BD02
                subq.w  #1,$10(a5)
                bra.w   loc_1BC7E
loc_1BD02:
                
                bsr.w   sub_1BDA0
                bcc.w   loc_1BC7E
                move.w  d7,4(a5)
                move.w  2(a5),d0
                cmp.w   d7,d0
                bcc.s   loc_1BD18
                exg     d0,d7
loc_1BD18:
                
                sub.w   d7,d0
                cmpi.w  #$80,d0 
                bcc.s   loc_1BD28
                move.b  #2,$E(a5)
                bra.s   loc_1BD2E
loc_1BD28:
                
                move.b  #1,$E(a5)
loc_1BD2E:
                
                bclr    #3,VDPSPRITE_OFFSET_TILE(a4)
                cmpi.w  #$40,2(a5) 
                bcs.s   return_1BD4A
                cmpi.w  #$C0,2(a5) 
                bcc.s   return_1BD4A
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
return_1BD4A:
                
                rts

    ; End of function spellanimationUpdate_Blaze


; =============== S U B R O U T I N E =======================================


sub_1BD4C:
                
                movem.l d0-d2/a3-a4,-(sp)
                move.w  $12(a5),d0
                addq.w  #1,d0
                andi.w  #$1F,d0
                move.w  d0,$12(a5)
                lea     ((byte_FFB496-$1000000)).w,a2
                lsl.w   #2,d0
                move.w  d0,-(sp)
                lea     table_1BE82(pc), a3
                moveq   #6,d1
loc_1BD6C:
                
                addq.w  #8,a4
                sub.w   (a3)+,d0
                andi.w  #$7C,d0 
                move.w  (a2,d0.w),d2
                add.w   (a3),d2
                move.w  d2,6(a4)
                move.w  2(a2,d0.w),d2
                add.w   (a3)+,d2
                bchg    #1,$D(a5)
                bne.s   loc_1BD90
                move.w  d2,(a4)
                bra.s   loc_1BD92
loc_1BD90:
                
                clr.w   (a4)
loc_1BD92:
                
                dbf     d1,loc_1BD6C
                move.w  (sp)+,d0
                adda.w  d0,a2
                movem.l (sp)+,d0-d2/a3-a4
                rts

    ; End of function sub_1BD4C


; =============== S U B R O U T I N E =======================================


sub_1BDA0:
                
                movem.w d1-d6,-(sp)
                clr.w   d1
                move.b  7(a3),d1
                addi.w  #$80,d1 
                clr.w   d2
                move.b  8(a3),d2
                addi.w  #$80,d2 
                move.w  6(a4),d3
                move.w  (a4),d4
                clr.w   d5
                clr.w   d6
                cmp.w   d1,d3
                bge.s   loc_1BDCC
                bset    #0,d5
                addq.w  #1,d6
loc_1BDCC:
                
                cmp.w   d2,d4
                bge.s   loc_1BDD6
                bset    #1,d5
                addq.w  #1,d6
loc_1BDD6:
                
                addi.w  #$80,d1 
                cmp.w   d1,d3
                ble.s   loc_1BDE4
                bset    #2,d5
                addq.w  #1,d6
loc_1BDE4:
                
                addi.w  #$50,d2 
                cmp.w   d2,d4
                ble.s   loc_1BDF2
                bset    #3,d5
                addq.w  #1,d6
loc_1BDF2:
                
                tst.w   d6
                beq.w   loc_1BE16
                subq.w  #1,d6
                bne.s   loc_1BE00
                moveq   #$41,d6 
                bra.s   loc_1BE02
loc_1BE00:
                
                moveq   #$21,d6 
loc_1BE02:
                
                jsr     (GenerateRandomNumber).w
                clr.w   d3
                move.b  table_1BE1C(pc,d5.w),d3
                add.w   d3,d7
                andi.w  #BYTE_UPPER_NIBBLE_MASK,d7
                ori     #1,ccr
loc_1BE16:
                
                movem.w (sp)+,d1-d6
                rts

    ; End of function sub_1BDA0

table_1BE1C:    dc.b 0
                dc.b $E0
                dc.b $A0
                dc.b $D0
                dc.b $60
                dc.b 0
                dc.b $90
                dc.b 0
                dc.b $20
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b $FF
table_1BE2A:    dc.b 0
                dc.b $21
                dc.b 0
                dc.b $21
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $31
                dc.b 0
                dc.b $3D
                dc.b 0
                dc.b $43
                dc.b 0
                dc.b $4F
                dc.b 0
                dc.b $55
                dc.b 0
                dc.b $65
                dc.b 0
                dc.b $75
                dc.b 0
                dc.b $85
table_1BE42:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
table_1BE46:    dc.b 5
                dc.b $B5
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $B9
                dc.b 5
                dc.b $20
table_1BE52:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $BD
                dc.b $A
                dc.b $20
table_1BE5A:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $C6
                dc.b 9
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $CC
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $D5
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $DE
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $EE
                dc.b $F
                dc.b $20
table_1BE82:    dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w $C
                dc.w 4
                dc.w 8
                dc.w 8
                dc.w 8
                dc.w 8
