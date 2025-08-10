
; ASM FILE code\gameflow\battle\battlescenes\animation\arrowsandspears.asm :
; 0x1ADA4..0x1AEB0 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_ArrowsAndSpears:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_ARROWS_AND_SPEARS,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d0
                clr.w   d1
                lea     (table_1AE50-16)(pc), a0
                lea     (table_1AE20-8)(pc), a1
                bclr    #SPELLANIMATION_BIT_MIRRORED,d0
                beq.s   @Mirrored
                lea     $30(a0),a0
                lea     $18(a1),a1
@Mirrored:
                
                cmpi.b  #2,d0
                bcs.s   loc_1ADDA
                addq.w  #1,d1 ; uses 2 sprites
                cmpi.b  #3,d0
                bcs.s   loc_1ADDA
                moveq   #3,d0
loc_1ADDA:
                
                lsl.w   #3,d0
                adda.w  d0,a1 ; offset 8x variation #
                add.w   d0,d0
                adda.w  d0,a0 ; offset 16x variation #
                lea     ((byte_FFB532-$1000000)).w,a2
                move.w  d1,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)
                moveq   #38,d0 ; offset to sprite_38
                addq.w  #1,d1
                clr.w   d2
                clr.w   d3
                bsr.w   ConstructComplexGraphic       
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$72,((byte_FFB404-$1000000)).w 
                move.b  #SPELLANIMATION_ARROWS_AND_SPEARS,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_ArrowsAndSpears

table_1AE20:    ; Variation 1
                dc.w -$E00
                dc.w $190  ; first sprite x start
                dc.w $1    ; second sprite x start
                dc.w $E8   ; y offset

                ; Variation 2
                dc.w -$E00
                dc.w $190
                dc.w $198
                dc.w $E8

                ; Variation 3
                dc.w -$E00
                dc.w $190
                dc.w $1B0
                dc.w $E8

                ; Variation 1
                dc.w $E00
                dc.w $60
                dc.w $1
                dc.w $F0
                
                ; Variation 2
                dc.w $E00
                dc.w $58
                dc.w $78
                dc.w $F0
                
                ; Variation 3
                dc.w $E00
                dc.w $40
                dc.w $60
                dc.w $F0
                
                
table_1AE50:    ; arrow 1
                vdpSpell 152, 108, SPELLTILE1, V1|H4|VALUE1|MIRRORED
                vdpSpell 1, 1, 0, V1|H1|VALUE0
                
                ; arrow 2; 
                vdpSpell 152, 108, SPELLTILE9, V1|H1|VALUE1|MIRRORED
                vdpSpell 160, 108, SPELLTILE5, V1|H4|VALUE1|MIRRORED
                
                ; spear
                vdpSpell 104, 96, SPELLTILE14, V1|H4|VALUE1|MIRRORED
                vdpSpell 136, 96, SPELLTILE10, V1|H4|VALUE1|MIRRORED
                
                ; arrow 1 mirror
                vdpSpell 80, 100, SPELLTILE1, V1|H4|VALUE1
                vdpSpell 1, 1, 0, V1|H1|VALUE0
                
                ; arrow 2 mirror
                vdpSpell 80, 100, SPELLTILE5, V1|H4|VALUE1
                vdpSpell 112, 100, SPELLTILE9, V1|H1|VALUE1
                
                ; spear mirror
                vdpSpell 80, 98, SPELLTILE10, V1|H4|VALUE1
                vdpSpell 112, 98, SPELLTILE14, V1|H4|VALUE1
