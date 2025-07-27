
; ASM FILE code\gameflow\battle\battlescenes\animation\freeze.asm :
; 0x1A654..0x1A73A : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Freeze:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #FREEZE_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_FREEZE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     (table_1A6DA-12)(pc), a0
                bclr    #SPELLANIMATION_BIT_MIRRORED,d1
                beq.s   loc_1A680
                lea     $30(a0),a0
loc_1A680:
                
                lsl.w   #2,d1
                move.w  d1,d0
                lsl.w   #1,d1
                add.w   d0,d1
                adda.w  d1,a0 ; offset by 12x variation #
                lea     ((byte_FFB532-$1000000)).w,a1
                move.b  #1,$E(a1)
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0),(a1)
                moveq   #1,d1
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1A6B4
                moveq   #$14,d0
                bsr.w   sub_1A2F6       
                move.b  #2,(byte_FFAFC6).l
                addq.w  #1,d1
loc_1A6B4:
                ; variation 4
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_FREEZE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
loc_1A6CC:
                
                move.b  d1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Freeze

                ; Variation 1
table_1A6DA:    dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $A0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                
                ; Variation 2
                dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $16
                dc.b 0
                dc.b 0
                dc.b $C0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                
                ; Variation 3
                dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $1C
                dc.b 0
                dc.b 0
                dc.b $E0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                
                ; Variation 4
                dc.b 1
                dc.b $70
                dc.b 0
                dc.b $9E
                dc.b $22
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b $FF
                dc.b $FA
                dc.b 0
                dc.b $C8
                
                ; Variation 1 Mirrored
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b $A0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38
                
                ; Variation 2 Mirrored
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $16
                dc.b 0
                dc.b 0
                dc.b $C0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38
                
                ; Variation 3 Mirrored
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $1C
                dc.b 0
                dc.b 0
                dc.b $E0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38
                
                ; Variation 4 Mirrored
                dc.b 0
                dc.b $80
                dc.b 0
                dc.b $E2
                dc.b $22
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 6
                dc.b 1
                dc.b $38
