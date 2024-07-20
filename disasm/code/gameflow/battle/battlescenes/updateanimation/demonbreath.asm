
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\demonbreath.asm :
; 0x1D0FE..0x1D2E6 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_DemonBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #$26,d0 
                moveq   #$18,d1
loc_1D10E:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D288
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1D15E
                move.w  #$80,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$80,d7 
                move.w  d7,4(a5)
                move.w  #$500,d6
                jsr     (GenerateRandomNumber).w
                subi.w  #$300,d7
                move.w  d7,6(a5)
                clr.l   8(a5)
                lea     graphic_DemonbreathSpirit(pc), a0
                bsr.w   sub_19F5E
                move.w  (a3),VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),(a4)
                sndCom  SFX_DEMON_BREATH
                bra.w   loc_1D288
loc_1D15E:
                
                cmpi.w  #$1C,(a5)
                bcc.w   loc_1D208
                move.w  4(a5),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D17C
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D18A
loc_1D17C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D18A:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),d0
                add.w   $A(a5),d0
                tst.w   d0
                bmi.s   loc_1D1A8
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D1B6
loc_1D1A8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D1B6:
                
                move.w  d1,$A(a5)
                add.w   d0,(a4)
                cmpi.w  #$E,(a5)
                bne.s   loc_1D1C8
                move.w  #VDPTILE_SPELLTILE17|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
loc_1D1C8:
                
                move.w  VDPSPRITE_OFFSET_TILE(a4),d0
                move.w  d0,d1
                addi.w  #$800,d0
                andi.w  #VDPTILE_MIRROR|VDPTILE_FLIP,d0
                andi.w  #VDPTILE_MASK|VDPTILE_PALETTE4|VDPTILE_PRIORITY,d1
                or.w    d1,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                cmpi.w  #$C,(a5)
                bne.w   loc_1D288
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1D288
                cmpi.b  #$19,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1D288
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1D288
loc_1D208:
                
                bne.w   loc_1D22E
                move.w  #$20,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$40,d7 
                move.w  d7,2(a5)
                clr.w   4(a5)
                clr.l   8(a5)
                move.w  #VDPTILE_SPELLTILE33|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
                bra.w   loc_1D288
loc_1D22E:
                
                move.w  4(a5),d0
                add.w   2(a5),d0
                move.w  d0,4(a5)
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D24C
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D25A
loc_1D24C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D25A:
                
                move.w  d1,8(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                tst.w   4(a3)
                beq.s   loc_1D272
                lea     table_1D2AA(pc), a0
                moveq   #$A,d0
                bsr.w   sub_1B884
loc_1D272:
                
                cmpi.w  #$45,(a5) 
                bcs.w   loc_1D288
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1D288:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D10E
				
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_DemonBreath

graphic_DemonbreathSpirit:
                vdpSpell 0, 0, SPELLTILE1, V4|H4|32
				
table_1D2AA:    dc.w $20
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b $24
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $28
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b $2C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $30
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $34
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $38
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $3C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $40
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $44
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $50
