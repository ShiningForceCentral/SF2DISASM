
; ASM FILE code\gameflow\battle\battlescenes\animation\update\apollo.asm :
; 0x1DE24..0x1DFD4 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Apollo:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                tst.w   (a5)
                beq.w   loc_1DE80
                addq.w  #1,(a5)
                cmpi.w  #40,(a5) 
                bne.s   loc_1DE3E
                clr.b   ((byte_FFB588-$1000000)).w
loc_1DE3E:
                
                subq.w  #1,4(a5)
                bne.w   loc_1DE6E
                move.w  #6,4(a5)
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                lea     table_1DFA2(pc), a0
                bchg    #0,3(a5)
                bne.s   loc_1DE64
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
loc_1DE64:
                
                moveq   #38,d0 
                bsr.w   ConstructSimpleGraphic
                move.w  (a4),6(a5)
loc_1DE6E:
                
                cmpi.w  #3,4(a5)
                bcc.s   loc_1DE7C
                move.w  6(a5),(a4)
                bra.s   loc_1DE80
loc_1DE7C:
                
                move.w  #1,(a4)
loc_1DE80:
                
                lea     12(a5),a5
                addq.w  #8,a4
                moveq   #39,d0 
                moveq   #19,d1
loc_1DE8A:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1DF7E
                addq.w  #1,(a5)
                tst.b   6(a5)
                beq.s   loc_1DEA0
                subq.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1DEA0:
                
                move.w  2(a5),d1
                bne.w   loc_1DEFC
                moveq   #32,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d1
                andi.w  #1,d1
                move.b  d1,6(a5)
                andi.w  #24,d7
                move.b  d7,7(a5)
                lea     table_1DFB2(pc), a0
                tst.b   d1
                beq.s   loc_1DECE
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
                sndCom  SFX_BATTLEFIELD_DEATH
loc_1DECE:
                
                jsr     ConstructSimpleGraphic
                or.b    d7,VDPSPRITE_OFFSET_TILE(a4)
                move.w  #128,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #160,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,(a4)
                addq.w  #1,2(a5)
                move.w  #3,4(a5)
                bra.w   loc_1DF7E
loc_1DEFC:
                
                cmpi.w  #3,(a5)
                bne.w   loc_1DF24
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1DF7E
                cmpi.b  #21,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1DF7E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1DF7E
loc_1DF24:
                
                subq.w  #1,4(a5)
                bne.w   loc_1DF7E
                move.w  #3,4(a5)
                move.w  2(a5),d1
                cmpi.w  #4,d1
                bcc.w   loc_1DF6A
                lea     (table_1DFC2-2)(pc), a0
                tst.b   6(a5)
                beq.s   loc_1DF4A
                addq.w  #6,a0
loc_1DF4A:
                
                add.w   d1,d1
                move.w  (a0,d1.w),d1
                addi.w  #VDPTILE_PALETTE3|VDPTILE_PRIORITY,d1
                clr.w   d2
                move.b  7(a5),d2  ; mirror/flip byte
                lsl.w   #BYTE_SHIFT_COUNT,d2
                or.w    d2,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1DF7E
loc_1DF6A:
                
                clr.l   (a5)
                clr.l   4(a5)
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1DF7E:
                
                movem.w (sp)+,d0-d1
                lea     12(a5),a5
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                addq.w  #1,d0
                dbf     d1,loc_1DE8A
                
                lea     table_1DFCE(pc), a0
                bsr.w   sub_1B8B2
                cmpi.b  #2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcs.w   ReinitializeSceneAfterSpell
                rts

    ; End of function spellanimationUpdate_Apollo

table_1DFA2:    vdpSpell 274, 203, TILE1920, V2|H2|VALUE2
                vdpSpell 286, 204, TILE1924, V2|H2|VALUE2
                
table_1DFB2:    vdpSpell 128, 144, TILE1940, V2|H2|VALUE2
                vdpSpell 128, 144, TILE1776, V4|H4|VALUE2
				
table_1DFC2:    dc.w $790
                dc.w $78C
                dc.w $788
				
                dc.w $5A0
                dc.w $210
                dc.w $180
				
table_1DFCE:    dc.w $00F
                dc.w 8
                dc.w 1
