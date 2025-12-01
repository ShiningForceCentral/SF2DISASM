
; ASM FILE code\gameflow\battle\battlescenes\animation\update\burstrock.asm :
; 0x1EBBA..0x1ECC8 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_BurstRockExplosion:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #38,d0 
                moveq   #15,d1
loc_1EBC6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1EC80
                addq.w  #1,(a5)
                cmpi.w  #2,(a5)
                bne.w   loc_1EC22
                moveq   #7,d6
                jsr     (GenerateRandomNumber).w
                lea     table_1EC9A(pc), a0
                bclr    #0,d7
                bne.s   loc_1EBF2
                move.b  #1,2(a5)
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
loc_1EBF2:
                
                bsr.w   ConstructSimpleGraphic
                lsl.w   #2,d7
                or.b    d7,VDPSPRITE_OFFSET_TILE(a4)
                move.w  #192,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #160,d7 
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                move.w  #128,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #160,d7 
                move.w  d7,(a4)
                sndCom  SFX_BATTLEFIELD_DEATH
                bra.w   loc_1EC80
loc_1EC22:
                
                cmpi.w  #4,(a5)
                bne.w   loc_1EC46
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1EC46
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1EC46
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1EC46:
                
                tst.b   2(a5)
                bne.s   loc_1EC5A
                lea     table_1ECAA(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                moveq   #14,d0
                bra.s   loc_1EC66
loc_1EC5A:
                
                lea     table_1ECBC(pc), a0
                moveq   #2,d0
                bsr.w   sub_1B884
                moveq   #11,d0
loc_1EC66:
                
                cmp.w   (a5),d0
                bhi.w   loc_1EC80
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1EC80:
                
                movem.w (sp)+,d0-d1
                lea     12(a5),a5
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                addq.w  #1,d0
                dbf     d1,loc_1EBC6
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
                rts

    ; End of function spellanimationUpdate_BurstRockExplosion

table_1EC9A:    vdpSpell 0, 0, SPELLTILE1, V4|H4|VALUE2
                
                vdpSpell 0, 0, SPELLTILE65, V2|H2|VALUE2
                
table_1ECAA:    dc.w 5
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 16
                
                dc.w 8
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 32
                
                dc.w 11
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 48
                
table_1ECBC:    dc.w 5
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 68
                
                dc.w 8
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 72
