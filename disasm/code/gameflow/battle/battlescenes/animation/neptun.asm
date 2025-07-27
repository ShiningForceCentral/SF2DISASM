
; ASM FILE code\gameflow\battle\battlescenes\animation\neptun.asm :
; 0x1B21A..0x1B37C : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Neptun:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #SUMMON_NEPTUNE,d0
                bsr.w   LoadInvocationSpell
                moveq   #SUMMON_NEPTUNE,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                sndCom  SFX_PRISM_LASER_FIRING
                bset    #6,((byte_FFB56E-$1000000)).w
                moveq   #$14,d1
                moveq   #9,d2
                lea     table_1B358(pc), a0
                lea     6(a0),a1
loc_1B248:
                
                movem.l d1-d2/a0-a1,-(sp)
                bsr.w   LoadInvocationSprite
                movem.l (sp)+,d1-d2/a0-a1
                swap    d2
                tst.w   d2
                bne.s   loc_1B25E
                moveq   #1,d0
                bra.s   loc_1B268
loc_1B25E:
                
                subq.w  #1,d2
                bne.s   loc_1B266
                move.w  #1,d2
loc_1B266:
                
                move.w  d2,d0
loc_1B268:
                
                jsr     (Sleep).w       
                exg     a0,a1
                dbf     d1,loc_1B248
                
                moveq   #SPELLGRAPHICS_NEPTUN,d0
                bsr.w   LoadSpellGraphicsForInvocation
                moveq   #$26,d0 
                lea     table_1B364(pc), a0
                bsr.w   sub_19F5E
                moveq   #25,d0
                jsr     (Sleep).w       
                bclr    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                sndCom  SFX_DESOUL_HOVERING
                moveq   #2,d0
                moveq   #0,d1
                moveq   #$10,d2
                lea     ((SPRITE_38-$1000000)).w,a0
loc_1B2A0:
                
                subi.w  #5,(a0)
                subq.w  #1,d0
                bne.s   loc_1B2BE
                moveq   #2,d0
                bchg    #0,d1
                bne.s   loc_1B2B8
                move.w  #$78C|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                bra.s   loc_1B2BE
loc_1B2B8:
                
                move.w  #$786|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
loc_1B2BE:
                
                jsr     (WaitForVInt).w
                dbf     d2,loc_1B2A0
                
                moveq   #SPELLGRAPHICS_NEPTUN,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.b  #1,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #2,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #5,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #8,4(a0)
                lea     (BATTLESCENE_BATTLESPRITE_TOGGLE).l,a0
                moveq   #15,d0
loc_1B304:
                
                move.b  #1,(a0)+
                dbf     d0,loc_1B304
                
                lea     (byte_FFAFC6).l,a0
                moveq   #21,d0
loc_1B314:
                
                move.b  #1,(a0)+
                dbf     d0,loc_1B314
                
                moveq   #20,d0
                jsr     (Sleep).w       
                move.l  #table_NeptunBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_NEPTUN,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #4,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Neptun

table_1B358:    dc.b 1
                dc.b 0
                dc.b 0
                dc.b -80
                dc.b 0
                dc.b 1
                
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                
table_1B364:    vdpSpell 296, 192, TILE1920, V3|H2|32
                
table_NeptunBackgroundModification:
                dc.b 0
                dc.b 56
                dc.b 4
                dc.b 96
                dc.b 0
                dc.b 1
                dc.b -77
                dc.b 116
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b -1
                dc.b -1
                dc.b 0
                dc.b 0
