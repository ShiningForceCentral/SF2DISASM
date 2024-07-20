
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\detox.asm :
; 0x1CC56..0x1CE50 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Detox:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1CD70
                addq.w  #1,(a5)
                cmpi.w  #2,(a3)
                beq.w   loc_1CC92
                tst.w   (a3)
                bne.w   loc_1CCB2
                lea     table_1CE0C(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1CCB2
                move.w  #1,(a3)
                bra.w   loc_1CCB2
loc_1CC92:
                
                lea     table_1CE2A(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1CCB2
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1CD70
loc_1CCB2:
                
                move.w  2(a5),d0
                btst    #0,6(a5)
                bne.s   loc_1CCDA
                subq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,d1
                cmpi.w  #$88,d0 
                bne.s   loc_1CCD4
                bset    #0,6(a5)
                moveq   #8,d1
loc_1CCD4:
                
                move.w  #$130,d3
                bra.s   loc_1CCF4
loc_1CCDA:
                
                addq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,d1
                cmpi.w  #8,d0
                bne.s   loc_1CCF0
                bclr    #0,6(a5)
                moveq   #$78,d1 
loc_1CCF0:
                
                move.w  #$D0,d3 
loc_1CCF4:
                
                move.w  d1,2(a5)
                move.l  #$10003000,d1
                jsr     (sub_1812).w    
                add.w   d3,d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                addi.w  #$C0,d2 
                move.w  d2,(a4)
loc_1CD10:
                
                cmpi.w  #$80,d0 
                bcc.s   loc_1CD1A
                moveq   #1,d1
                bra.s   loc_1CD1C
loc_1CD1A:
                
                moveq   #2,d1
loc_1CD1C:
                
                move.b  d1,(byte_FFAFA0).l
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1CD36
                cmpi.w  #2,(a3)
                bcc.s   loc_1CD36
                move.w  #1,(a5)
                move.w  #2,(a3)
loc_1CD36:
                
                subq.w  #1,4(a5)
                bne.w   loc_1CD70
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                move.w  d7,4(a5)
                cmpi.b  #$19,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1CD70
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  VDPSPRITE_OFFSET_X(a4),d0
                addq.w  #8,d0
                move.w  d0,4(a0)
                move.w  (a4),d0
                addq.w  #8,d0
                move.w  d0,6(a0)
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1CD70:
                
                lea     $C(a5),a5
                addq.w  #8,a4
                moveq   #$27,d0 
                moveq   #$17,d1
loc_1CD7A:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1CDF2
                addq.w  #1,(a5)
                tst.b   2(a5)
                bne.w   loc_1CDBC
                lea     (byte_FFAFA0).l,a1
                adda.w  d0,a1
                lea     table_1CE48(pc), a0
                bsr.w   sub_19F5E
                move.w  4(a5),VDPSPRITE_OFFSET_X(a4)
                move.w  6(a5),(a4)
                move.b  (byte_FFAFA0).l,(a1)
                addq.b  #1,2(a5)
                move.b  #6,3(a5)
                bra.w   loc_1CDF2
loc_1CDBC:
                
                addq.w  #1,(a4)
                subq.b  #1,3(a5)
                bne.w   loc_1CDF2
                move.b  #6,3(a5)
                addq.b  #1,2(a5)
                addq.w  #1,VDPSPRITE_OFFSET_TILE(a4)
                cmpi.b  #5,2(a5)
                bls.w   loc_1CDF2
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1CDF2:
                
                movem.w (sp)+,d0-d1
                lea     $C(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1CD7A
				
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Detox

table_1CE0C:    dc.b 0
                dc.b 8
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $1A
                dc.b 0
                dc.b $E
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $16
                dc.b 0
                dc.b $14
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $12
                dc.b 0
                dc.b $1A
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 9
                dc.b 0
                dc.b $20
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 0
table_1CE2A:    dc.b 0
                dc.b 8
                dc.b $A
                dc.b 0
                dc.b 0
                dc.b 9
                dc.b 0
                dc.b $E
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $12
                dc.b 0
                dc.b $14
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b $16
                dc.b 0
                dc.b $1A
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $1A
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $1B
				
table_1CE48:    vdpSpell 0, 0, SPELLTILE29, V1|H1|32
