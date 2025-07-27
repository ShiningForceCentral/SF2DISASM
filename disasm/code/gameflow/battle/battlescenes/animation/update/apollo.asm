
; ASM FILE code\gameflow\battle\battlescenes\animation\update\apollo.asm :
; 0x1DE24..0x1DFD4 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Apollo:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                tst.w   (a5)
                beq.w   loc_1DE80
                addq.w  #1,(a5)
                cmpi.w  #$28,(a5) 
                bne.s   loc_1DE3E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DE3E:
                
                subq.w  #1,4(a5)
                bne.w   loc_1DE6E
                move.w  #6,4(a5)
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                lea     table_1DFA2(pc), a0
                bchg    #0,3(a5)
                bne.s   loc_1DE64
                addq.w  #8,a0
loc_1DE64:
                
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                move.w  (a4),6(a5)
loc_1DE6E:
                
                cmpi.w  #3,4(a5)
                bcc.s   loc_1DE7C
                move.w  6(a5),(a4)
                bra.s   loc_1DE80
loc_1DE7C:
                
                move.w  #1,(a4)
loc_1DE80:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                moveq   #$27,d0 
                moveq   #$13,d1
loc_1DE8A:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1DF7E
                addq.w  #1,(a5)
                tst.b   6(a5)
                beq.s   loc_1DEA0
                subq.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1DEA0:
                
                move.w  2(a5),d1
                bne.w   loc_1DEFC
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d1
                andi.w  #1,d1
                move.b  d1,6(a5)
                andi.w  #$18,d7
                move.b  d7,7(a5)
                lea     table_1DFB2(pc), a0
                tst.b   d1
                beq.s   loc_1DECE
                addq.w  #8,a0
                sndCom  SFX_BATTLEFIELD_DEATH
loc_1DECE:
                
                jsr     sub_19F5E
                or.b    d7,VDPSPRITE_OFFSET_TILE(a4)
                move.w  #$80,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$A0,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,(a4)
                addq.w  #1,2(a5)
                move.w  #3,4(a5)
                bra.w   loc_1DF7E
loc_1DEFC:
                
                cmpi.w  #3,(a5)
                bne.w   loc_1DF24
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1DF7E
                cmpi.b  #$15,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1DF7E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1DF7E
loc_1DF24:
                
                subq.w  #1,4(a5)
                bne.w   loc_1DF7E
                move.w  #3,4(a5)
                move.w  2(a5),d1
                cmpi.w  #4,d1
                bcc.w   loc_1DF6A
                lea     table_1DFC0(pc), a0
                tst.b   6(a5)
                beq.s   loc_1DF4A
                addq.w  #6,a0
loc_1DF4A:
                
                add.w   d1,d1
                move.w  (a0,d1.w),d1
                addi.w  #-$4000,d1
                clr.w   d2
                move.b  7(a5),d2
                lsl.w   #BYTE_SHIFT_COUNT,d2
                or.w    d2,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1DF7E
loc_1DF6A:
                
                clr.l   (a5)
                clr.l   4(a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1DF7E:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1DE8A
                
                lea     table_1DFCE(pc), a0
                bsr.w   sub_1B8B2
                cmpi.b  #2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcs.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Apollo

table_1DFA2:    vdpSpell 274, 203, TILE1920, V2|H2|32
                vdpSpell 286, 204, TILE1924, V2|H2|32
                
table_1DFB2:    dc.b 0
                dc.b $80
                dc.b 0
                dc.b $90
                dc.b 7
                dc.b $94
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $90
                dc.b 6
                dc.b $F0
table_1DFC0:    dc.b $F
                dc.b $20
                dc.b 7
                dc.b $90
                dc.b 7
                dc.b $8C
                dc.b 7
                dc.b $88
                dc.b 5
                dc.b $A0
                dc.b 2
                dc.b $10
                dc.b 1
                dc.b $80
table_1DFCE:    dc.b 0
                dc.b $F
                dc.b 0
                dc.b 8
                dc.b 0
                dc.b 1
