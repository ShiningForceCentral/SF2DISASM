
; ASM FILE code\gameflow\battle\battlescenes\animation\update\dao.asm :
; 0x1DCE8..0x1DE24 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Dao:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                subq.w  #1,((byte_FFB532-$1000000)).w
                bne.s   loc_1DCFA
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DCFA:
                
                moveq   #$F,d0
loc_1DCFC:
                
                move.w  d0,-(sp)
                tst.w   (a5)
                beq.w   loc_1DDE8
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1DD74
                move.w  #$300,d6
                jsr     (GenerateRandomNumber).w
                subi.w  #$700,d7
                move.w  d7,2(a5)
                moveq   #$35,d1 
                sub.w   d0,d1
                move.w  d1,d0
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                lsl.w   #3,d7
                lea     table_1DE06(pc), a0
                adda.w  d7,a0
                bsr.w   sub_19F5E
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$80,d7 
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #$40,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$100,d7
                move.w  d7,(a4)
                btst    #0,d7
                beq.s   loc_1DD60
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1DD60:
                
                btst    #1,d7
                beq.s   byte_1DD6C
                bset    #4,VDPSPRITE_OFFSET_TILE(a4)
byte_1DD6C:
                
                sndCom  SFX_BIG_DOOR_RUMBLE
                bra.w   loc_1DDE8
loc_1DD74:
                
                move.w  2(a5),d1
                add.w   4(a5),d1
                tst.w   d1
                bmi.s   loc_1DD8A
                move.w  d1,d2
                andi.w  #BYTE_MASK,d2
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1DD98
loc_1DD8A:
                
                neg.w   d1
                move.w  d1,d2
                andi.w  #BYTE_MASK,d2
                neg.w   d2
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1DD98:
                
                move.w  d2,4(a5)
                add.w   d1,(a4)
                addi.w  #6,2(a5)
                cmpi.w  #8,(a5)
                bne.w   loc_1DDCC
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1DDE8
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1DDE8
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1DDE8
loc_1DDCC:
                
                cmpi.w  #$60,(a4) 
                bhi.w   loc_1DDE8
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1DDE8:
                
                move.w  (sp)+,d0
                addq.w  #8,a4
                lea     $C(a5),a5
                dbf     d0,loc_1DCFC
                lea     table_1DE1E(pc), a0
                bsr.w   sub_1B8B2
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Dao

table_1DE06:    ; small rock
                vdpSpell 0, 0, VDPTILE_SPELLTILE1, V1|H1|32
                
                ; medium rock
                vdpSpell 0, 0, VDPTILE_SPELLTILE2, V3|H2|32
                
                ; large rock
                vdpSpell 0, 0, VDPTILE_SPELLTILE8, V4|H3|32
                
table_1DE1E:    dc.b 2
                dc.b $48
                dc.b 0
                dc.b $1E
                dc.b 0
                dc.b 1
