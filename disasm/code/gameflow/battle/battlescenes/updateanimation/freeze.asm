
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\freeze.asm :
; 0x1BE9E..0x1C248 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Freeze:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$26,d0 
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1BF5C
                tst.w   (a5)
                beq.w   loc_1BF54
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1BEC8
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1BF54
loc_1BEC8:
                
                subq.w  #1,(a5)
                bne.w   loc_1BF54
                move.w  #2,(a5)
                tst.w   2(a5)
                bne.w   loc_1BF1E
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BEEC
                move.w  #$B8,d1 
                move.w  #$C8,d2 
                bra.s   loc_1BEF4
loc_1BEEC:
                
                move.w  #$120,d1
                move.w  #$D8,d2 
loc_1BEF4:
                
                moveq   #$30,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d2
                move.w  d2,(a4)
                move.w  #VDPGRAPHICDIMENSION_V3|VDPGRAPHICDIMENSION_H1,VDPSPRITE_OFFSET_SIZE(a4)
                move.w  #VDPTILE_SPELLTILE81|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
                moveq   #$30,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                move.w  d1,VDPSPRITE_OFFSET_X(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1BF54
loc_1BF1E:
                
                cmpi.w  #3,2(a5)
                bcc.w   loc_1BF42
                move.w  #$C570,d1
                btst    #0,3(a5)
                beq.s   loc_1BF36
                addq.w  #3,d1
loc_1BF36:
                
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1BF54
loc_1BF42:
                
                move.w  #1,(a4)
                clr.l   2(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.w   2(a5)
loc_1BF54:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
loc_1BF5C:
                
                lea     ((byte_FFB532-$1000000)).w,a3
                addq.b  #1,$C(a3)
                move.b  $C(a3),$D(a3)
                lea     loc_1C170(pc), a2
                lea     (loc_1C184+2)(pc), a1 ; undefine operand to undo
                move.b  ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w,d2
                andi.w  #7,d2
                move.w  d2,d1
                mulu.w  #$2A,d2 
                adda.w  d2,a2
                lsl.w   #2,d1
                adda.w  d1,a1
                moveq   #$17,d1
loc_1BF88:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1C136
                addq.w  #1,(a5)
                tst.b   2(a5)
                bne.w   loc_1BFF4
                lea     (byte_FFAFA0).l,a0
                moveq   #$28,d6 
                jsr     (GenerateRandomNumber).w
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BFBC
                addi.w  #$8C,d7 
                move.b  #1,(a0,d0.w)
                bra.s   loc_1BFC6
loc_1BFBC:
                
                addi.w  #$9C,d7 
                move.b  #2,(a0,d0.w)
loc_1BFC6:
                
                move.w  d7,$A(a5)
                move.w  d7,(a4)
                move.l  (a1),VDPSPRITE_OFFSET_SIZE(a4)
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                addq.b  #1,2(a5)
                move.b  3(a3),3(a5)
                move.w  4(a3),4(a5)
                clr.l   6(a5)
                bra.w   loc_1C136
loc_1BFF4:
                
                cmpi.b  #1,2(a5)
                bne.w   loc_1C0BA
                cmpi.w  #$1C,(a5)
                bcs.s   loc_1C024
                addq.b  #1,2(a5)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                move.b  d7,3(a5)
                clr.w   6(a5)
                move.w  (a4),8(a5)
                addq.w  #8,8(a5)
                bra.w   loc_1C136
loc_1C024:
                
                clr.w   d0
                move.b  3(a5),d0
                move.b  8(a3),d1
                ext.w   d1
                add.w   d1,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,3(a5)
                jsr     (sub_179C).w    
                lsl.w   #3,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1C052
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C060
loc_1C052:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C060:
                
                move.w  d0,6(a5)
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                swap    d1
                lsl.w   #3,d1
                add.w   8(a5),d1
                tst.w   d1
                bmi.s   loc_1C07E
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C08C
loc_1C07E:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C08C:
                
                move.w  d0,8(a5)
                add.w   d1,$A(a5)
                cmpi.w  #4,(a5)
                bne.w   loc_1C136
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1C136
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1C136
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1C136
loc_1C0BA:
                
                lea     (byte_FFAFA0).l,a0
                adda.w  d0,a0
                clr.w   d0
                move.b  3(a5),d0
                move.b  9(a3),d1
                ext.w   d1
                add.w   d1,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,3(a5)
                move.w  4(a5),d1
                lsr.w   #2,d1
                swap    d1
                move.w  4(a5),d1
                jsr     (sub_1812).w    
                add.w   $A(a3),d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                subq.w  #8,8(a5)
                add.w   8(a5),d2
                move.w  d2,$A(a5)
                cmpi.b  #$80,3(a5)
                bcc.s   loc_1C10C
                move.b  #0,(a0)
                bra.s   loc_1C110
loc_1C10C:
                
                move.b  #2,(a0)
loc_1C110:
                
                move.w  6(a3),d0
                add.w   d0,4(a5)
                cmpi.w  #$2E,(a5) 
                bcs.s   loc_1C136
                clr.l   (a5)
                move.w  #1,(a4)
                clr.l   2(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1C136:
                
                bchg    #0,$D(a3)
                bne.s   loc_1C144
                move.w  #1,(a4)
                bra.s   loc_1C148
loc_1C144:
                
                move.w  $A(a5),(a4)
loc_1C148:
                
                lea     (a2),a0
                moveq   #6,d0
                bsr.w   sub_1B884
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                lea     $C(a5),a5
                addq.w  #8,a4
                dbf     d1,loc_1BF88
				
                subq.b  #1,$E(a3)
                bne.s   loc_1C178
                sndCom  SFX_TINKLING
                moveq   #$E,d6
                jsr     (GenerateRandomNumber).w
loc_1C170:
                
                addi.w  #$A,d7
                move.b  d7,$E(a3)
loc_1C178:
                
                lea     table_1C242(pc), a0
                bsr.w   sub_1B8B2
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1C184:
                
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Freeze

                dc.b 0
                dc.b 0
                dc.b $C5
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b $C5
                dc.b $21
                dc.b 5
                dc.b 0
                dc.b $C5
                dc.b $22
                dc.b $A
                dc.b 0
                dc.b $C5
                dc.b $26
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $28
                dc.b 0
                dc.b $D
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $12
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $17
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b $1C
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $22
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $28
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $29
                dc.b 0
                dc.b $D
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b $12
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $17
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $1C
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b $22
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $F
                dc.b 0
                dc.b $28
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $37
                dc.b 0
                dc.b 8
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $2A
                dc.b 0
                dc.b $D
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $12
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b $17
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $F
                dc.b 0
                dc.b $1C
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $37
                dc.b 0
                dc.b $22
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $28
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b 8
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $2E
                dc.b 0
                dc.b $D
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $F
                dc.b 0
                dc.b $12
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b $37
                dc.b 0
                dc.b $17
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $1C
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $22
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $18
                dc.b 0
                dc.b $28
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $40
table_1C242:    dc.b $E
                dc.b $44
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 1
