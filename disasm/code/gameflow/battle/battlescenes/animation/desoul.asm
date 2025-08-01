
; ASM FILE code\gameflow\battle\battlescenes\animation\desoul.asm :
; 0x1A73A..0x1A848 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Desoul:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DESOUL_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                bsr.w   ClearSpellGraphics
                moveq   #SPELLTILESET_DESOUL,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a0
                bclr    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   loc_1A778
                move.w  #192,(a0) 
                move.w  #152,2(a0) 
                move.w  #128,d2 
                moveq   #2,d3
                bra.s   loc_1A786
loc_1A778:
                
                move.w  #272,(a0)
                move.w  #168,2(a0) 
                clr.w   d2
                clr.b   d3
loc_1A786:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  d2,2(a0)
                move.w  #$8000,4(a0)
                move.b  d3,6(a0)
                moveq   #1,d2
                cmpi.b  #2,d1
                bcs.s   loc_1A7E2
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #32,2(a0) 
                move.w  #30,4(a0)
                move.w  #3,6(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #32,2(a0) 
                move.w  #20,4(a0)
                move.w  #$301,6(a0)
                moveq   #42,d0   ; offset to sprite_42
                lea     table_1A810(pc), a0
                bsr.w   ConstructSimpleGraphic
                bsr.w   ConstructSimpleGraphic
                addq.w  #2,d2
loc_1A7E2:
                
                move.l  #table_DesoulBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DESOUL,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  d2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Desoul

table_1A810:    vdpSpell 1, 1, SPELLTILE97, V2|H2|VALUE2
                
                vdpSpell 1, 1, SPELLTILE101, V2|H2|VALUE2|MIRRORED
                
table_DesoulBackgroundModification:
                dc.b 0
                dc.b $38
                dc.b 16  ; number of entries
                dc.b $60
                dc.l table_1A828
table_1A828:
                dc.w 5
                dc.w 0
                dc.w 3
                dc.w 0
                dc.w -3
                dc.w 0
                dc.w -5
                dc.w 0
                dc.w -5
                dc.w 0
                dc.w -3
                dc.w 0
                dc.w 3
                dc.w 0
                dc.w 5
                dc.w 0
