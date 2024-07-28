
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\healingfairy.asm :
; 0x1C53E..0x1C7F6 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_HealingFairy:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                move.w  $A(a3),d1
                subq.w  #1,d1
loc_1C552:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1C73E
                addq.w  #1,(a5)
                move.w  2(a5),d1
                andi.w  #3,d1
                cmpi.w  #3,d1
                bne.w   loc_1C5B6
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1C57E
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1C73E
loc_1C57E:
                
                subq.w  #1,8(a5)
                bne.w   loc_1C73E
                move.w  #2,(a5)
                move.w  2(a5),d1
                addq.w  #1,d1
                andi.w  #7,d1
                move.w  d1,2(a5)
                moveq   #$10,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$E6,d7 
                lsl.w   #NIBBLE_SHIFT_COUNT,d7
                move.w  d7,4(a5)
                move.w  #$F0,6(a5) 
                clr.l   8(a5)
                bra.w   loc_1C73E
loc_1C5B6:
                
                cmpi.w  #$2C,(a5) 
                bne.s   loc_1C5D6
                addq.w  #1,2(a5)
                move.w  (a3),d3
                addi.w  #-$3AE0,d3
                btst    #2,3(a5)
                beq.s   loc_1C5D2
                bset    #$B,d3
loc_1C5D2:
                
                move.w  d3,VDPSPRITE_OFFSET_TILE(a4)
loc_1C5D6:
                
                cmpi.w  #$48,(a5) 
                bne.s   loc_1C5F8
                addq.w  #1,2(a5)
                move.w  2(a3),d3
                addi.w  #-$3AE0,d3
                btst    #2,3(a5)
                beq.s   loc_1C5F4
                bset    #$B,d3
loc_1C5F4:
                
                move.w  d3,VDPSPRITE_OFFSET_TILE(a4)
loc_1C5F8:
                
                move.w  2(a5),d1
                move.w  4(a5),d0
                move.w  6(a5),d2
                btst    #0,d1
                bne.s   loc_1C61A
                addi.w  #$14,d2
                addq.w  #6,d0
                andi.w  #$FFF,d0
                move.w  d0,4(a5)
                bra.s   loc_1C622
loc_1C61A:
                
                subi.w  #$14,d2
                bpl.s   loc_1C622
                clr.w   d2
loc_1C622:
                
                move.w  d2,6(a5)
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                jsr     (sub_179C).w    
                move.w  d1,d0
                muls.w  d2,d0
                asr.l   #BYTE_SHIFT_COUNT,d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1C644
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1C652
loc_1C644:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1C652:
                
                move.w  d1,8(a5)
                btst    #2,3(a5)
                bne.s   loc_1C660
                neg.w   d0
loc_1C660:
                
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                add.w   d0,NEXTVDPSPRITE_OFFSET_X(a4)
                swap    d1
                muls.w  d2,d1
                asr.l   #BYTE_SHIFT_COUNT,d1
                add.w   $A(a5),d1
                tst.w   d1
                bmi.s   loc_1C680
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C68E
loc_1C680:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C68E:
                
                move.w  d0,$A(a5)
                add.w   d1,(a4)
                add.w   d1,8(a4)
                addq.b  #1,$E(a5)
                cmpi.b  #4,$E(a5)
                bcs.s   loc_1C6CC
                clr.b   $E(a5)
                bchg    #0,$F(a5)
                beq.s   loc_1C6B6
                move.w  4(a3),d1
                bra.s   loc_1C6BA
loc_1C6B6:
                
                move.w  6(a3),d1
loc_1C6BA:
                
                addi.w  #-$3AE0,d1
                move.w  $C(a4),d3
                andi.w  #$800,d3
                or.w    d3,d1
                move.w  d1,$C(a4)
loc_1C6CC:
                
                cmpi.w  #$60,VDPSPRITE_OFFSET_X(a4) 
                bcs.w   loc_1C6E0
                cmpi.w  #384,VDPSPRITE_OFFSET_X(a4)
                bls.w   loc_1C720
loc_1C6E0:
                
                addq.w  #1,2(a5)
                lea     table_1C7EE(pc), a0
                btst    #2,3(a5)
                beq.s   loc_1C6F2
                addq.w  #4,a0
loc_1C6F2:
                
                moveq   #$1C,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,8(a5)
                move.w  (a0),VDPSPRITE_OFFSET_X(a4)
                move.w  (a0)+,NEXTVDPSPRITE_OFFSET_X(a4)
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                add.w   (a0),d7
                move.w  d7,(a4)
                move.w  d7,NEXTVDPSPRITE_OFFSET_Y(a4)
                bchg    #3,VDPSPRITE_OFFSET_TILE(a4)
                bchg    #3,$C(a4)
loc_1C720:
                
                subq.w  #1,$10(a5)
                bne.w   loc_1C73E
                moveq   #$C,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #3,d7
                move.w  d7,$10(a5)
                move.w  VDPSPRITE_OFFSET_X(a4),$C(a3)
                move.w  (a4),$E(a3)
loc_1C73E:
                
                movem.w (sp)+,d0-d1
                addq.w  #2,d0
                lea     $10(a4),a4
                lea     $18(a5),a5
                dbf     d1,loc_1C552
				
                moveq   #$18,d1
                move.w  $A(a3),d2
                add.w   d2,d2
                sub.w   d2,d1
loc_1C75A:
                
                tst.w   (a5)
                bne.w   loc_1C7A4
                tst.w   $E(a3)
                beq.w   loc_1C7D8
                move.w  #1,(a5)
                clr.w   2(a5)
                move.w  #6,4(a5)
                move.w  $E(a3),d2
                addi.w  #$C,d2
                move.w  d2,(a4)
                clr.w   VDPSPRITE_OFFSET_SIZE(a4) ; clear size and link
                move.w  8(a3),d2
                addi.w  #-$3AE0,d2
                move.w  d2,VDPSPRITE_OFFSET_TILE(a4)
                move.w  $C(a3),d2
                addi.w  #$C,d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                clr.l   $C(a3)
                bra.w   loc_1C7D8
loc_1C7A4:
                
                addq.w  #1,(a5)
                addq.w  #1,(a4)
                subq.w  #1,4(a5)
                bne.w   loc_1C7D8
                move.w  #6,4(a5)
                subq.w  #1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                cmpi.w  #4,2(a5)
                bls.w   loc_1C7D8
                clr.l   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1C7D8:
                
                addq.w  #1,d0
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                lea     $C(a5),a5
                dbf     d1,loc_1C75A
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_HealingFairy

table_1C7EE:    dc.w $60
                dc.w $80
				
                dc.w $180
                dc.w $80
