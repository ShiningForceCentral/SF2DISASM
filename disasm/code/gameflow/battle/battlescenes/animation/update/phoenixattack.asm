
; ASM FILE code\gameflow\battle\battlescenes\animation\update\phoenixattack.asm :
; 0x1EA0C..0x1EBBA : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_PhoenixAttack:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                btst    #0,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1EAB2
                moveq   #38,d0 
                moveq   #2,d1
loc_1EA22:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1EA98
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1EA46
                lea     graphic_SoundWave(pc), a0
                bsr.w   ConstructSimpleGraphic
                sndCom  SFX_SPAWN
                bra.w   loc_1EA98
loc_1EA46:
                
                subq.w  #3,VDPSPRITE_OFFSET_X(a4)
                lea     table_1EB90(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                cmpi.w  #12,(a5)
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
                
                cmpi.w  #26,(a5)
                bcs.w   loc_1EA98
                clr.w   (a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1EA98:
                
                movem.w (sp)+,d0-d1
                lea     12(a5),a5
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                addq.w  #1,d0
                dbf     d1,loc_1EA22
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
                rts
loc_1EAB2:
                
                tst.w   (a5)
                beq.w   loc_1EB7E
                addq.w  #1,(a5)
                move.w  2(a5),d0
                bne.w   loc_1EAD4
                lea     graphic_WindWedge(pc), a0
                moveq   #38,d0 
                bsr.w   ConstructSimpleGraphic
                addq.w  #1,2(a5)
                bra.w   loc_1EB7E
loc_1EAD4:
                
                subq.w  #1,d0
                bne.w   loc_1EAFE
                cmpi.w  #4,(a5)
                bcs.w   loc_1EB7E
                moveq   #39,d0 
                moveq   #2,d1
                clr.w   d2
                clr.w   d3
                lea     graphic_BlastCyclone(pc), a0
                bsr.w   ConstructComplexGraphic       
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
                
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                move.w  4(a5),d0
                subq.w  #2,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,4(a5)
                move.w  #$3000,d1
                jsr     (sub_17EC).w    
                addi.w  #216,d2 
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d2,NEXTVDPSPRITE_OFFSET_X(a4)
                swap    d2
                addi.w  #164,d2 
                move.w  d2,(a4)
                addi.w  #32,d2 
                move.w  d2,NEXTVDPSPRITE_OFFSET_Y(a4)
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
                addi.w  #SPELLTILE_START+43|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0 ; offset to cyclone graphics
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                addi.w  #16,d0
                move.w  d0,NEXTVDPSPRITE_OFFSET_TILE(a4)
loc_1EB72:
                
                cmpi.w  #26,(a5)
                bne.w   loc_1EB7E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1EB7E:
                
                cmpi.w  #34,(a5) 
                bcc.w   ReinitializeSceneAfterSpell
                rts

    ; End of function spellanimationUpdate_PhoenixAttack

graphic_SoundWave:
                vdpSpell 284, 212, SPELLTILE1, V4|H4|VALUE2
                
table_1EB90:    dc.w 8
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 16
				
                dc.w 14
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 32
				
                dc.w 20
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 48
				
graphic_WindWedge:
                vdpSpell 253, 221, SPELLTILE192, V4|H4|VALUE2|MIRRORED|FLIPPED
                
graphic_BlastCyclone:
                vdpSpell 110, 78, SPELLTILE44, V4|H4|VALUE2
                vdpSpell 110, 110, SPELLTILE60, V4|H4|VALUE2
