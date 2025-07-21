
; ASM FILE code\gameflow\battle\battlescenes\animation\desoul.asm :
; 0x1A73A..0x1A848 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Desoul:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DESOUL_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                bsr.w   sub_1A00A
                moveq   #SPELLGRAPHICS_DESOUL,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a0
                bclr    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   loc_1A778
                move.w  #$C0,(a0) 
                move.w  #$98,2(a0) 
                move.w  #$80,d2 
                moveq   #2,d3
                bra.s   loc_1A786
loc_1A778:
                
                move.w  #$110,(a0)
                move.w  #$A8,2(a0) 
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
                move.w  #$20,2(a0) 
                move.w  #$1E,4(a0)
                move.w  #3,6(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$20,2(a0) 
                move.w  #$14,4(a0)
                move.w  #$301,6(a0)
                moveq   #$2A,d0   ; offset to sprite_42
                lea     table_1A810(pc), a0
                bsr.w   sub_19F5E
                bsr.w   sub_19F5E
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

table_1A810:    vdpSpell 1, 1, SPELLTILE97, V2|H2|32
                vdpSpell 1, 1, SPELLTILE101, V2|H2|33
                
table_DesoulBackgroundModification:
                dc.b 0
                dc.b $38
                dc.b $10
                dc.b $60
                dc.b 0
                dc.b 1
                dc.b $A8
                dc.b $28
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FD
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FB
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FB
                dc.b 0
                dc.b 0
                dc.b $FF
                dc.b $FD
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b 0
