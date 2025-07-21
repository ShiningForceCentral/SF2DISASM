
; ASM FILE code\gameflow\battle\battlescenes\animation\update\prismlaser.asm :
; 0x1E2D4..0x1E5D0 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_PrismLaser:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1E452
                addq.w  #1,(a5)
                move.w  2(a5),d1
                cmpi.w  #3,d1
                bhi.w   loc_1E31A
                subq.w  #1,4(a5)
                bne.w   sub_1E4AC
                addq.w  #1,d1
                move.w  d1,2(a5)
                cmpi.w  #4,d1
                bcc.w   sub_1E4AC
                addi.w  #$10,VDPSPRITE_OFFSET_TILE(a4)
                move.w  #$28,4(a5) 
                bra.w   sub_1E4AC
loc_1E31A:
                
                subq.w  #4,d1
                bne.w   loc_1E33C
                move.b  #1,1(a3)
                bsr.w   sub_1E4AC
                tst.w   d0
                bne.w   return_1E452
                move.w  #$D4,(a4) 
                addq.w  #1,2(a5)
                bra.w   return_1E452
loc_1E33C:
                
                subq.w  #1,d1
                bne.w   loc_1E3A8
                tst.w   6(a5)
                bne.s   loc_1E36C
                move.w  #$563|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
                sndCom  SFX_PRISM_LASER_FIRING
                move.b  #OUT_TO_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
loc_1E36C:
                
                move.w  #$D8,d3 
                addq.w  #8,a4
                bsr.w   sub_1E454
                cmpi.w  #8,6(a5)
                bcs.w   return_1E452
                addq.w  #1,2(a5)
                move.w  #$1E,4(a5)
                move.b  #IN_FROM_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                bra.w   return_1E452
loc_1E3A8:
                
                subq.w  #1,d1
                bne.w   loc_1E3C2
                subq.w  #1,4(a5)
                bne.w   return_1E452
                addq.w  #1,2(a5)
                clr.w   6(a5)
                bra.w   return_1E452
loc_1E3C2:
                
                subq.w  #1,d1
                bne.w   loc_1E3E2
                bsr.w   sub_1E48A
                cmpi.w  #9,6(a5)
                bcs.w   return_1E452
                addq.w  #1,2(a5)
                clr.b   ((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bra.w   return_1E452
loc_1E3E2:
                
                subq.w  #1,d1
                bne.w   loc_1E404
                cmpi.b  #3,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bne.w   loc_1E44A
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                addq.w  #1,2(a5)
                clr.w   6(a5)
                bra.w   loc_1E44A
loc_1E404:
                
                subq.w  #1,d1
                bne.w   loc_1E432
                tst.w   6(a5)
                bne.s   loc_1E414
                sndCom  SFX_PRISM_LASER_FIRING
loc_1E414:
                
                move.w  #$80,d3 
                bsr.w   sub_1E454
                cmpi.w  #9,6(a5)
                bcs.w   loc_1E44A
                addq.w  #1,2(a5)
                clr.w   6(a5)
                bra.w   loc_1E44A
loc_1E432:
                
                bsr.w   sub_1E48A
                cmpi.w  #9,6(a5)
                bcs.w   loc_1E44A
                clr.b   ((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                move.w  #7,2(a5)
loc_1E44A:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
return_1E452:
                
                rts

    ; End of function spellanimationUpdate_PrismLaser


; =============== S U B R O U T I N E =======================================


sub_1E454:
                
                move.w  6(a5),d2
                beq.s   loc_1E476
                subq.w  #1,d2
                lsl.w   #3,d2
                adda.w  d2,a4
                move.w  #$D4,(a4)+ 
                move.w  #VDPGRAPHICDIMENSION_V4|VDPGRAPHICDIMENSION_H4,(a4)+
                move.w  #VDPTILE_SPELLTILE84|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a4)+
                lsl.w   #2,d2
                add.w   d2,d3
                move.w  d3,(a4)+
                addi.w  #$20,d3 
loc_1E476:
                
                move.w  #$D4,(a4)+ 
                move.w  #VDPGRAPHICDIMENSION_V4|VDPGRAPHICDIMENSION_H4,(a4)+
                move.w  #VDPTILE_SPELLTILE100|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a4)+
                move.w  d3,(a4)
                addq.w  #1,6(a5)
                rts

    ; End of function sub_1E454


; =============== S U B R O U T I N E =======================================


sub_1E48A:
                
                move.w  6(a5),d2
                beq.s   loc_1E4A0
                subq.w  #1,d2
                lsl.w   #3,d2
                adda.w  d2,a4
                move.w  #1,(a4)+
                clr.l   (a4)+
                move.w  #1,(a4)+
loc_1E4A0:
                
                move.w  #$CD83,4(a4)
                addq.w  #1,6(a5)
                rts

    ; End of function sub_1E48A


; =============== S U B R O U T I N E =======================================


sub_1E4AC:
                
                movem.l a4-a5,-(sp)
                bchg    #0,(a3)
                bne.s   loc_1E4BC
                move.w  #$D4,(a4) 
                bra.s   loc_1E4C0
loc_1E4BC:
                
                move.w  #1,(a4)
loc_1E4C0:
                
                moveq   #0,d0
                moveq   #4,d1
loc_1E4C4:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                tst.w   (a5)
                beq.w   loc_1E5C6
                addq.w  #1,d0
                cmpi.w  #2,(a5)
                bcc.w   loc_1E532
                subq.w  #1,2(a5)
                bne.w   loc_1E5C6
                moveq   #$38,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d2
                addi.w  #$C8,d2 
                move.w  d2,(a4)
                clr.w   2(a4)
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #-$3AE0,d7
                move.w  d7,4(a4)
                moveq   #$14,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$D4,d7 
                move.w  d7,6(a4)
                subi.w  #$C0,d7 
                asl.w   #NIBBLE_SHIFT_COUNT,d7
                neg.w   d7
                move.w  d7,4(a5)
                subi.w  #$E4,d2 
                asl.w   #NIBBLE_SHIFT_COUNT,d2
                neg.w   d2
                move.w  d2,6(a5)
                clr.l   8(a5)
                addq.w  #1,(a5)
                bra.w   loc_1E5C6
loc_1E532:
                
                addq.w  #1,(a5)
                cmpi.w  #$12,(a5)
                bcc.w   loc_1E596
                move.w  4(a5),d2
                add.w   8(a5),d2
                tst.w   d2
                bmi.s   loc_1E552
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                bra.s   loc_1E560
loc_1E552:
                
                neg.w   d2
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                neg.w   d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                neg.w   d2
loc_1E560:
                
                move.w  d3,8(a5)
                add.w   d2,6(a4)
                move.w  6(a5),d2
                add.w   $A(a5),d2
                tst.w   d2
                bmi.s   loc_1E57E
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                bra.s   loc_1E58C
loc_1E57E:
                
                neg.w   d2
                move.w  d2,d3
                andi.w  #BYTE_MASK,d3
                neg.w   d3
                asr.w   #BYTE_SHIFT_COUNT,d2
                neg.w   d2
loc_1E58C:
                
                move.w  d3,$A(a5)
                add.w   d2,(a4)
                bra.w   loc_1E5C6
loc_1E596:
                
                move.w  #1,(a4)
                clr.l   2(a4)
                move.w  #1,6(a4)
                tst.b   1(a3)
                bne.s   loc_1E5C2
                move.w  #1,(a5)
                move.w  #4,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,2(a5)
                sndCom  SFX_PRISM_LASER_LOADING
                bra.s   loc_1E5C6
loc_1E5C2:
                
                clr.l   (a5)
                subq.w  #1,d0
loc_1E5C6:
                
                dbf     d1,loc_1E4C4
                movem.l (sp)+,a4-a5
                rts

    ; End of function sub_1E4AC

