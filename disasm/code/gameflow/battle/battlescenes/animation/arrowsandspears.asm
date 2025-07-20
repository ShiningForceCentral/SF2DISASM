
; ASM FILE code\gameflow\battle\battlescenes\animation\arrowsandspears.asm :
; 0x1ADA4..0x1AEB0 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_ArrowsAndSpears:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_ARROWS_AND_SPEARS,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                clr.w   d1
                lea     table_1AE40(pc), a0
                lea     (loc_1AE16+2)(pc), a1
                bclr    #7,d0
                beq.s   loc_1ADCA
                lea     $30(a0),a0
                lea     $18(a1),a1
loc_1ADCA:
                
                cmpi.b  #2,d0
                bcs.s   loc_1ADDA
                addq.w  #1,d1
                cmpi.b  #3,d0
                bcs.s   loc_1ADDA
                moveq   #3,d0
loc_1ADDA:
                
                lsl.w   #3,d0
                adda.w  d0,a1
                add.w   d0,d0
                adda.w  d0,a0
                lea     ((byte_FFB532-$1000000)).w,a2
                move.w  d1,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)
                moveq   #$26,d0 
                addq.w  #1,d1
                clr.w   d2
                clr.w   d3
                bsr.w   sub_19FAA       
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$72,((byte_FFB404-$1000000)).w 
                move.b  #SPELLANIMATION_ARROWS_AND_SPEARS,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1AE16:
                
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_ArrowsAndSpears

table_1AE20:    dc.b $F2
                dc.b 0
                dc.b 1
                dc.b $90
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $E8
                dc.b $F2
                dc.b 0
                dc.b 1
                dc.b $90
                dc.b 1
                dc.b $98
                dc.b 0
                dc.b $E8
                dc.b $F2
                dc.b 0
                dc.b 1
                dc.b $90
                dc.b 1
                dc.b $B0
                dc.b 0
                dc.b $E8
                dc.b $E
                dc.b 0
                dc.b 0
                dc.b $60
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $F0
table_1AE40:    dc.b $E
                dc.b 0
                dc.b 0
                dc.b $58
                dc.b 0
                dc.b $78
                dc.b 0
                dc.b $F0
                dc.b $E
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $60
                dc.b 0
                dc.b $F0
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $6C
                dc.b 5
                dc.b $20
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $6C
                dc.b 5
                dc.b $28
                dc.b 0
                dc.b $11
                dc.b 0
                dc.b $A0
                dc.b 0
                dc.b $6C
                dc.b 5
                dc.b $24
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b $68
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $2D
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b $88
                dc.b 0
                dc.b $60
                dc.b 5
                dc.b $29
                dc.b $C
                dc.b $11
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $64
                dc.b 5
                dc.b $20
                dc.b $C
                dc.b $10
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $64
                dc.b 5
                dc.b $24
                dc.b $C
                dc.b $10
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $64
                dc.b 5
                dc.b $28
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $62
                dc.b 5
                dc.b $29
                dc.b $C
                dc.b $10
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $62
                dc.b 5
                dc.b $2D
                dc.b $C
                dc.b $10
