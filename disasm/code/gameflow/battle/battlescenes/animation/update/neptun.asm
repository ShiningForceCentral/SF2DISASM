
; ASM FILE code\gameflow\battle\battlescenes\animation\update\neptun.asm :
; 0x1DFD4..0x1E134 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Neptun:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                tst.w   (a5)
                beq.w   loc_1E010
                addq.w  #1,(a5)
                cmpi.w  #$28,(a5) 
                bne.s   loc_1DFEA
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DFEA:
                
                subq.b  #1,4(a5)
                bne.w   loc_1E010
                move.b  #3,4(a5)
                lea     table_1E10E(pc), a0
                lea     ((SPRITE_01-$1000000)).w,a4
                moveq   #7,d0
                bsr.w   sub_1E0DA
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #$A,d0
                bsr.w   sub_1E0DA
loc_1E010:
                
                lea     $C(a5),a5
                lea     ((SPRITE_60-$1000000)).w,a4
                moveq   #$3C,d0 
                moveq   #2,d1
loc_1E01C:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1E0C0
                addq.w  #1,(a5)
                move.w  2(a5),d2
                bne.w   loc_1E05E
                subq.w  #1,4(a5)
                bne.w   loc_1E0C0
                lea     graphic_NeptuneSizzle(pc), a0
                bsr.w   sub_19F5E
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,VDPSPRITE_OFFSET_X(a4)
                addq.w  #1,2(a5)
                move.w  #5,4(a5)
                sndCom  SFX_WING_FLAP
                bra.w   loc_1E0C0
loc_1E05E:
                
                cmpi.w  #3,d2
                bcc.w   loc_1E090
                subq.w  #1,4(a5)
                bne.w   loc_1E0C0
                addi.w  #4,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                cmpi.w  #2,d2
                bcc.s   loc_1E086
                move.w  #5,4(a5)
                bra.s   loc_1E08C
loc_1E086:
                
                move.w  #$C,4(a5)
loc_1E08C:
                
                bra.w   loc_1E0C0
loc_1E090:
                
                subq.w  #1,4(a5)
                beq.w   loc_1E0AE
                btst    #0,5(a5)
                bne.s   loc_1E0A6
                move.w  #$100,(a4)
                bra.s   loc_1E0AA
loc_1E0A6:
                
                move.w  #1,(a4)
loc_1E0AA:
                
                bra.w   loc_1E0C0
loc_1E0AE:
                
                clr.w   2(a5)
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #4,d7
                move.w  d7,4(a5)
loc_1E0C0:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                lea     $C(a5),a5
                addq.w  #8,a4
                dbf     d1,loc_1E01C
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Neptun


; =============== S U B R O U T I N E =======================================


sub_1E0DA:
                
                moveq   #$70,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$98,d7 
                move.w  d7,(a4)+
                move.w  #VDPGRAPHICDIMENSION_V4|VDPGRAPHICDIMENSION_H2,(a4)+
                move.w  #VDPTILE_SPELLTILE19|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a4)+
                move.w  (a0),(a4)+
                addi.w  #$20,d7 
                move.w  d7,(a4)+
                move.w  #VDPGRAPHICDIMENSION_V2|VDPGRAPHICDIMENSION_H2,(a4)+
                move.w  #VDPTILE_SPELLTILE27|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a4)+
                move.w  (a0)+,(a4)+
                dbf     d0,sub_1E0DA
                rts

    ; End of function sub_1E0DA

graphic_NeptuneSizzle:
                vdpSpell 128, 256, SPELLTILE31, V2|H2|32
                
table_1E10E:    dc.b 0
                dc.b $88
                dc.b 0
                dc.b $95
                dc.b 0
                dc.b $A2
                dc.b 0
                dc.b $AE
                dc.b 0
                dc.b $BD
                dc.b 0
                dc.b $C9
                dc.b 0
                dc.b $D6
                dc.b 0
                dc.b $E3
                dc.b 0
                dc.b $F1
                dc.b 0
                dc.b $FD
                dc.b 1
                dc.b $B
                dc.b 1
                dc.b $17
                dc.b 1
                dc.b $25
                dc.b 1
                dc.b $32
                dc.b 1
                dc.b $3F
                dc.b 1
                dc.b $4B
                dc.b 1
                dc.b $5A
                dc.b 1
                dc.b $66
                dc.b 1
                dc.b $78
