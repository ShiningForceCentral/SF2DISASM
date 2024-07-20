
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\phoenixattack.asm :
; 0x1EA0C..0x1EBBA : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_PhoenixAttack:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                btst    #0,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1EAB2
                moveq   #$26,d0 
                moveq   #2,d1
loc_1EA22:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1EA98
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1EA46
                lea     table_1EB88(pc), a0
                bsr.w   sub_19F5E
                sndCom  SFX_SPAWN
                bra.w   loc_1EA98
loc_1EA46:
                
                subq.w  #3,VDPSPRITE_OFFSET_X(a4)
                lea     table_1EB90(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                cmpi.w  #$C,(a5)
                bne.w   loc_1EA7C
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1EA98
                cmpi.b  #3,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1EA98
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1EA98
loc_1EA7C:
                
                cmpi.w  #$1A,(a5)
                bcs.w   loc_1EA98
                clr.w   (a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1EA98:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1EA22
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts
loc_1EAB2:
                
                tst.w   (a5)
                beq.w   loc_1EB7E
                addq.w  #1,(a5)
                move.w  2(a5),d0
                bne.w   loc_1EAD4
                lea     table_1EBA2(pc), a0
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                addq.w  #1,2(a5)
                bra.w   loc_1EB7E
loc_1EAD4:
                
                subq.w  #1,d0
                bne.w   loc_1EAFE
                cmpi.w  #4,(a5)
                bcs.w   loc_1EB7E
                moveq   #$27,d0 
                moveq   #2,d1
                clr.w   d2
                clr.w   d3
                lea     graphic_BlastCyclone(pc), a0
                bsr.w   sub_19FAA       
                sndCom  SFX_DESOUL_HOVERING
                addq.w  #1,2(a5)
                bra.w   loc_1EB7E
loc_1EAFE:
                
                cmpi.w  #6,(a5)
                bne.s   loc_1EB12
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1EB12:
                
                addq.w  #8,a4
                move.w  4(a5),d0
                subq.w  #2,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,4(a5)
                move.w  #$3000,d1
                jsr     (sub_17EC).w    
                addi.w  #$D8,d2 
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d2,$E(a4)
                swap    d2
                addi.w  #$A4,d2 
                move.w  d2,(a4)
                addi.w  #$20,d2 
                move.w  d2,8(a4)
                btst    #0,1(a5)
                bne.s   loc_1EB72
                move.w  6(a5),d0
                addq.w  #1,d0
                cmpi.w  #3,d0
                bcs.s   loc_1EB5C
                clr.w   d0
loc_1EB5C:
                
                move.w  d0,6(a5)
                lsl.w   #5,d0
                addi.w  #-$3AB5,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                addi.w  #$10,d0
                move.w  d0,$C(a4)
loc_1EB72:
                
                cmpi.w  #$1A,(a5)
                bne.w   loc_1EB7E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1EB7E:
                
                cmpi.w  #$22,(a5) 
                bcc.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_PhoenixAttack

table_1EB88:    vdpSpell 284, 212, SPELLTILE1, V4|H4|32
                
table_1EB90:    dc.b 0
                dc.b 8
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $E
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $14
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b $30
                
table_1EBA2:    vdpSpell 253, 221, TILE1503, V4|H4|35
                
graphic_BlastCyclone:
                vdpSpell 110, 78, SPELLTILE44, V4|H4|32
                vdpSpell 110, 110, SPELLTILE60, V4|H4|32
