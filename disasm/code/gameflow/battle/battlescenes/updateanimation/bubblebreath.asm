
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\bubblebreath.asm :
; 0x1E5D0..0x1E7B2 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_BubbleBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$F,d7
                moveq   #$26,d6 
loc_1E5DC:
                
                tst.w   (a5)
                beq.w   loc_1E75A
                cmpi.w  #1,(a5)
                bne.s   loc_1E622
                movem.w d6-d7,-(sp)
                move.w  #$200,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$140,d7
                move.w  d7,2(a5)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                subi.w  #$200,d7
                move.w  d7,4(a5)
                movem.w (sp)+,d6-d7
                lea     graphic_Bubble(pc), a0
                move.w  d6,d0
                bsr.w   sub_19F5E
                sndCom  SFX_SPAWN
                bra.w   loc_1E730
loc_1E622:
                
                cmpi.w  #$28,(a5) 
                bcc.w   loc_1E68C
                move.w  2(a5),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1E640
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E64E
loc_1E640:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E64E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  4(a5),d0
                addi.w  #$1C,d0
                move.w  d0,4(a5)
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1E674
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E682
loc_1E674:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E682:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bra.w   loc_1E730
loc_1E68C:
                
                bne.w   loc_1E6B4
                movem.w d6-d7,-(sp)
                clr.w   2(a5)
                move.w  #$20,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #$40,d7 
                move.w  d7,4(a5)
                clr.l   6(a5)
                movem.w (sp)+,d6-d7
                bra.w   loc_1E730
loc_1E6B4:
                
                cmpi.w  #$50,(a5) 
                bcc.w   loc_1E716
                addq.w  #1,2(a5)
                move.w  2(a5),d0
                lsr.w   #1,d0
                andi.w  #3,d0
                cmpi.w  #3,d0
                bcs.s   loc_1E6D2
                moveq   #2,d0
loc_1E6D2:
                
                btst    #3,3(a5)
                beq.s   loc_1E6DC
                neg.w   d0
loc_1E6DC:
                
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  4(a5),d0
                subi.w  #$20,d0 
                move.w  d0,4(a5)
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1E6FE
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E70C
loc_1E6FE:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E70C:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bra.w   loc_1E730
loc_1E716:
                
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.s   loc_1E75A
loc_1E730:
                
                addq.w  #1,(a5)
                lea     table_1E78E(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$A,(a5)
                bne.s   loc_1E75A
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.s   loc_1E75A
                tst.w   ((byte_FFB404-$1000000)).w
                beq.s   loc_1E75A
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1E75A:
                
                btst    #2,1(a5)
                bne.s   loc_1E76A
                bclr    #3,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1E770
loc_1E76A:
                
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1E770:
                
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                lea     $C(a5),a5
                addq.w  #1,d6
                dbf     d7,loc_1E5DC
				
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_BubbleBreath

graphic_Bubble: vdpSpell 212, 248, SPELLTILE1, V1|H1|32
				
table_1E78E:    ; bubble 2
                dc.b 0
                dc.b $A
                dc.b 0   ; dimensions 1x1
                dc.b 0
                dc.b 0
                dc.b 1  ; spell tile # offset
				
                ; bubble 3
                dc.b 0
                dc.b $14
                dc.b 0   ; dimensions 1x1
                dc.b 0
                dc.b 0
                dc.b 2  ; spell tile # offset
				
                ; bubble 4
                dc.b 0
                dc.b $1E
                dc.b 0   ; dimensions 1x1
                dc.b 0
                dc.b 0
                dc.b 3  ; spell tile # offset
				
                ; bubble 5
                dc.b 0
                dc.b $28
                dc.b 5  ; dimensions 2x2
                dc.b 0
                dc.b 0
                dc.b 4  ; spell tile # offset
				
                ; bubble 6
                dc.b 0
                dc.b $32
                dc.b $A  ; dimensions 3x3
                dc.b 0
                dc.b 0
                dc.b 8  ; spell tile # offset
				
                ; bubble 7
                dc.b 0
                dc.b $3C
                dc.b $F  ; dimensions 4x4
                dc.b 0
                dc.b 0
                dc.b 17  ; spell tile # offset
