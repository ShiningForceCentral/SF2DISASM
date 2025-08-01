
; ASM FILE code\gameflow\battle\battlescenes\animation\update\flamebreath.asm :
; 0x1D2E6..0x1D4E6 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_FlameBreath:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #24,d1
                moveq   #38,d0 
loc_1D2F6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D424
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1D348
                lea     table_1D4A0(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1D33C
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d2
                cmpi.w  #ENEMYBATTLESPRITE_CERBERUS,d2
                beq.w   loc_1D33C
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
                cmpi.w  #ENEMYBATTLESPRITE_HYDRA,d2
                beq.w   loc_1D33C
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
                cmpi.w  #ENEMYBATTLESPRITE_WYVERN,d2
                beq.w   loc_1D33C
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
loc_1D33C:
                
                bsr.w   ConstructSimpleGraphic
                sndCom  SFX_DOOR_OPEN
                bra.w   loc_1D424
loc_1D348:
                
                move.w  2(a5),d0
                jsr     (sub_179C).w    
                move.w  d1,d0
                asl.w   #1,d1
                add.w   d0,d1
                add.w   4(a5),d1
                tst.w   d1
                bmi.s   loc_1D368
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1D376
loc_1D368:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1D376:
                
                move.w  d0,4(a5)
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                swap    d1
                move.w  d1,d0
                asl.w   #1,d1
                add.w   d0,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1D398
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1D3A6
loc_1D398:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1D3A6:
                
                move.w  d0,6(a5)
                add.w   d1,(a4)
                cmpi.w  #6,(a5)
                bne.w   loc_1D402
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1D424
                move.w  2(a5),d1
                move.b  8(a5),d2
                bne.s   loc_1D3D8
                addq.w  #4,d1
                andi.w  #$FC,d1 
                cmp.w   2(a3),d1
                bne.s   loc_1D3D6
                move.b  #1,d2
loc_1D3D6:
                
                bra.s   loc_1D3E4
loc_1D3D8:
                
                subq.w  #4,d1
                andi.w  #$FC,d1 
                cmp.w   (a3),d1
                bne.s   loc_1D3E4
                clr.b   d2
loc_1D3E4:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1D424
                
                move.w  d1,2(a0)
                move.b  d2,8(a0)
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1D424
loc_1D402:
                
                move.w  4(a3),d1
                cmp.w   (a5),d1
                bhi.w   loc_1D424
                clr.w   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.b   ((byte_FFB588-$1000000)).w
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D424:
                
                moveq   #4,d0
                lea     table_1D4C8(pc), a0
                bsr.w   sub_1B884
                btst    #2,1(a5)
                bne.s   loc_1D43E
                bclr    #3,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1D444
loc_1D43E:
                
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1D444:
                
                movem.w (sp)+,d0-d1
                lea     12(a5),a5
                addq.w  #8,a4
                addq.w  #1,d0
                dbf     d1,loc_1D2F6
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
loc_1D45C:
                
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                moveq   #23,d0
loc_1D466:
                
                tst.w   (a5)
                bne.s   loc_1D494
                lea     (a4),a0
                lea     (a5),a1
                move.w  d0,d1
loc_1D470:
                
                move.l  NEXTVDPSPRITE_OFFSET_Y(a0),(a0)
                move.l  NEXTVDPSPRITE_OFFSET_TILE(a0),VDPSPRITE_OFFSET_TILE(a0)
                move.l  12(a1),(a1)
                move.l  16(a1),4(a1)
                move.l  20(a1),8(a1)
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a0
                lea     12(a1),a1
                dbf     d1,loc_1D470
loc_1D494:
                
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                lea     12(a5),a5
                dbf     d0,loc_1D466
                rts

    ; End of function spellanimationUpdate_FlameBreath

table_1D4A0:    vdpSpell 284, 222, SPELLTILE1, V1|H1|32  ; ally
                vdpSpell 210, 236, SPELLTILE1, V1|H1|32  ; cerberus
                vdpSpell 223, 214, SPELLTILE1, V1|H1|32  ; hydra
                vdpSpell 208, 216, SPELLTILE1, V1|H1|32  ; wyvern
                vdpSpell 212, 204, SPELLTILE1, V1|H1|32  ; dragon
                
table_1D4C8:    ; dc.w [yet unknown][location offset?]
                ; dc.w [spell graphic dimensions]
                ; dc.w [graphic tile-offset]
				
                dc.w 5
                dc.w VDPSPELLPROP_V1|VDPSPELLPROP_H1
                dc.w 1
				
                dc.w 10
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 2
				
                dc.w 15
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 6
				
                dc.w 20
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 10
				
                dc.w 25
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 19
