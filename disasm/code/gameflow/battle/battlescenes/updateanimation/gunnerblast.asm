
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\gunnerblast.asm :
; 0x1D9FC..0x1DCE8 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_GunnerProjectile:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   $C(a3)
                bne.w   loc_1DB2E
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1DA86
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1DA2E
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DA3C
loc_1DA2E:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DA3C:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1DA5A
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DA68
loc_1DA5A:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DA68:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1DC14
                cmpi.w  #$12,(a5)
                bcs.s   loc_1DA82
                addq.w  #1,2(a5)
                move.w  #$26,4(a5) 
loc_1DA82:
                
                bra.w   loc_1DBF8
loc_1DA86:
                
                cmpi.w  #1,2(a5)
                bne.w   loc_1DAB2
                subq.w  #1,4(a5)
                bne.w   loc_1DBF8
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                move.w  6(a3),(a4)
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   loc_1DBF8
loc_1DAB2:
                
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1DAC6
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DAD4
loc_1DAC6:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DAD4:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1DAF2
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1DB00
loc_1DAF2:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1DB00:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   sub_1DC14
                cmpi.w  #$F,(a5)
                bcs.w   loc_1DBF8
                move.w  #1,(a5)
                clr.w   2(a5)
                move.w  #1,4(a5)
                move.w  #1,$C(a3)
                sndCom  SFX_BIG_DOOR_RUMBLE
                bra.w   loc_1DBF8
loc_1DB2E:
                
                tst.w   (a5)
                beq.w   loc_1DBF8
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.s   loc_1DB62
                bsr.w   sub_1DC36
                move.b  #OUT_TO_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.w  #1,(a4)
                bsr.w   sub_1B8FE
loc_1DB62:
                
                bsr.w   sub_1B90C       
                cmpi.w  #$20,(a5) 
                bcs.w   loc_1DBF8
                bne.s   loc_1DB8E
                bsr.w   sub_1DC48
                move.b  #IN_FROM_WHITE,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
loc_1DB8E:
                
                cmpi.w  #$36,(a5) 
                bne.s   loc_1DB9C
                bsr.w   LoadPalette1FromFFB41E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DB9C:
                
                move.w  2(a5),d4
                subq.w  #1,4(a5)
                bne.w   loc_1DBBC
                move.w  #6,4(a5)
                addq.w  #1,d4
                cmpi.w  #2,d4
                bls.s   loc_1DBB8
                clr.w   d4
loc_1DBB8:
                
                move.w  d4,2(a5)
loc_1DBBC:
                
                lsl.w   #3,d4
                move.w  d4,d0
                lsl.w   #3,d4
                add.w   d0,d4
                btst    #0,1(a5)
                beq.s   loc_1DBD6
                move.w  8(a3),d2
                move.w  $A(a3),d3
                bra.s   loc_1DBDE
loc_1DBD6:
                
                move.w  #-127,d2
                move.w  #-127,d3
loc_1DBDE:
                
                moveq   #$26,d0 
                moveq   #$C,d1  ; graphic made of 12 elements
                lea     graphic_GunnerBlast(pc), a0
                bsr.w   sub_19FAA       
                moveq   #4,d0
                moveq   #$B,d1
loc_1DBEE:
                
                add.w   d4,(a4,d0.w)
                addq.w  #VDP_SPRITE_ENTRY_SIZE,d0
                dbf     d1,loc_1DBEE
loc_1DBF8:
                
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   return_1DC12
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((byte_FFB41E-$1000000)).w,a1
                moveq   #$1F,d0
loc_1DC08:
                
                move.l  (a1)+,(a0)+
                dbf     d0,loc_1DC08
                bra.w   sub_1B82A
return_1DC12:
                
                rts

    ; End of function spellanimationUpdate_GunnerProjectile


; =============== S U B R O U T I N E =======================================


sub_1DC14:
                
                move.w  #$C520,d0
                btst    #1,1(a5)
                bne.s   loc_1DC2E
                btst    #2,1(a5)
                beq.s   loc_1DC2C
                bset    #$B,d0
loc_1DC2C:
                
                bra.s   loc_1DC30
loc_1DC2E:
                
                addq.w  #4,d0
loc_1DC30:
                
                move.w  d0,4(a4)
                rts

    ; End of function sub_1DC14


; =============== S U B R O U T I N E =======================================


sub_1DC36:
                
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a0
                lea     ((byte_FFB41E-$1000000)).w,a1
                moveq   #$1F,d0
loc_1DC40:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_1DC40
                rts

    ; End of function sub_1DC36


; =============== S U B R O U T I N E =======================================


sub_1DC48:
                
                lea     ((byte_FFB41E-$1000000)).w,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                movem.l a0-a1,-(sp)
                moveq   #$3F,d0 
loc_1DC56:
                
                move.w  (a0)+,d1
                lsr.w   #1,d1
                andi.w  #$EEE,d1
                move.w  d1,(a1)+
                dbf     d0,loc_1DC56
                movem.l (sp)+,a0-a1
                move.w  $52(a0),$52(a1)
                move.l  $5A(a0),$5A(a1)
                rts

    ; End of function sub_1DC48


; =============== S U B R O U T I N E =======================================


LoadPalette1FromFFB41E:
                
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((byte_FFB41E-$1000000)).w,a1
                moveq   #$1F,d0
loc_1DC80:
                
                move.l  (a1)+,(a0)+
                dbf     d0,loc_1DC80
                rts

    ; End of function LoadPalette1FromFFB41E

graphic_GunnerBlast:
                vdpSpell 0, 0, SPELLTILE9, V4|H4|32
				vdpSpell 0, 32, SPELLTILE25, V4|H4|32
				vdpSpell 0, 64, SPELLTILE41, V4|H4|32
				vdpSpell 32, 0, SPELLTILE57, V4|H2|32
				vdpSpell 32, 32, SPELLTILE65, V4|H2|32
				vdpSpell 32, 64, SPELLTILE73, V4|H2|32
				
				; mirror to complete image
				vdpSpell 48, 0, SPELLTILE57, V4|H2|33
				vdpSpell 48, 32, SPELLTILE65, V4|H2|33
				vdpSpell 48, 64, SPELLTILE73, V4|H2|33
				vdpSpell 64, 0, SPELLTILE9, V4|H4|33
				vdpSpell 64, 32, SPELLTILE25, V4|H4|33
				vdpSpell 64, 64, SPELLTILE41, V4|H4|33
