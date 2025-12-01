
; ASM FILE code\gameflow\battle\battlescenes\animation\update\shotfire.asm :
; 0x1D786..0x1D9FC : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_ShotFire:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   12(a3)
                bne.w   loc_1D8AE
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1D810
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D7B8
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D7C6
loc_1D7B8:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D7C6:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D7E4
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D7F2
loc_1D7E4:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D7F2:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   GenerateShotMissle
                cmpi.w  #20,(a5)
                bcs.s   loc_1D80C
                addq.w  #1,2(a5)
                move.w  #28,4(a5)
loc_1D80C:
                
                bra.w   loc_1D9A8
loc_1D810:
                
                cmpi.w  #1,2(a5)
                bne.w   loc_1D83C
                subq.w  #1,4(a5)
                bne.w   loc_1D9A8
                move.w  4(a3),VDPSPRITE_OFFSET_X(a4)
                move.w  6(a3),(a4)
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   6(a5)
                bra.w   loc_1D9A8
loc_1D83C:
                
                move.w  (a3),d0
                add.w   6(a5),d0
                tst.w   d0
                bmi.s   loc_1D850
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D85E
loc_1D850:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D85E:
                
                move.w  d1,6(a5)
                add.w   d0,VDPSPRITE_OFFSET_X(a4)
                move.w  2(a3),d0
                add.w   8(a5),d0
                tst.w   d0
                bmi.s   loc_1D87C
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1D88A
loc_1D87C:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1D88A:
                
                move.w  d1,8(a5)
                add.w   d0,(a4)
                bsr.w   GenerateShotMissle
                cmpi.w  #17,(a5)
                bcs.w   loc_1D9A8
                move.w  #1,(a5)
                clr.l   2(a5)
                move.w  #1,$C(a3)
                bra.w   loc_1D9A8
loc_1D8AE:
                
                clr.b   ((byte_FFB588-$1000000)).w
                moveq   #38,d0 
                moveq   #15,d1
loc_1D8B6:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D998
                addq.w  #1,(a5)
                tst.w   2(a5)
                bne.w   loc_1D928
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                lea     table_1D9CE(pc), a0
                move.b  d7,10(a5)
                beq.s   loc_1D8DC
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
loc_1D8DC:
                
                moveq   #80,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #40,d7 
                add.w   8(a3),d7
                move.w  d7,d2
                moveq   #80,d6 
                jsr     (GenerateRandomNumber).w
                subi.w  #40,d7 
                add.w   10(a3),d7
                move.w  d7,d3
                moveq   #1,d1
                bsr.w   ConstructComplexGraphic       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                lsr.w   #1,d7
                bcc.s   loc_1D912
                bset    #3,VDPSPRITE_OFFSET_TILE(a4)
loc_1D912:
                
                lsr.w   #1,d7
                bcc.s   loc_1D91C
                bset    #4,VDPSPRITE_OFFSET_TILE(a4)
loc_1D91C:
                
                addq.w  #1,2(a5)
                sndCom  SFX_BATTLEFIELD_DEATH
                bra.w   loc_1D998
loc_1D928:
                
                cmpi.w  #4,(a5)
                bne.w   loc_1D954
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1D998
                cmpi.b  #$10,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bcc.w   loc_1D998
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1D998
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D954:
                
                tst.b   10(a5)
                bne.s   loc_1D96E
                lea     table_1D9DE(pc), a0
                moveq   #2,d0
                bsr.w   sub_1B884
                cmpi.w  #9,(a5)
                bcc.w   loc_1D984
                bra.s   loc_1D980
loc_1D96E:
                
                lea     table_1D9EA(pc), a0
                moveq   #3,d0
                bsr.w   sub_1B884
                cmpi.w  #12,(a5)
                bcc.w   loc_1D984
loc_1D980:
                
                bra.w   loc_1D998
loc_1D984:
                
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4) ; clear size, link, and tile
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1D998:
                
                movem.w (sp)+,d0-d1
                lea     12(a5),a5
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                addq.w  #1,d0
                dbf     d1,loc_1D8B6
loc_1D9A8:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
                rts

    ; End of function spellanimationUpdate_ShotFire


; =============== S U B R O U T I N E =======================================


GenerateShotMissle:
                
                move.w  VDPSPRITE_OFFSET_TILE(a4),d0
                andi.w  #VDPTILE_PROPERTIES_MASK,d0
                ori.w   #VDPTILE_SPELLTILE77,d0 ; shot missle
                btst    #1,1(a5)
                beq.s   @Frame1
                addq.w  #4,d0 ; burst shot graphic size
@Frame1:
                
                move.w  d0,VDPSPRITE_OFFSET_TILE(a4)
                rts

    ; End of function GenerateShotMissle

table_1D9CE:    vdpSpell 0, 0, SPELLTILE65, V2|H2|VALUE2  ; graphic Burst_Shot
                vdpSpell -8, -8, SPELLTILE1, V4|H4|VALUE2 ; graphic Burst_Explosion
                
table_1D9DE:    dc.w 3
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 68
                
                dc.w 6
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 72
                
table_1D9EA:    dc.w 3
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 16
                
                dc.w 6
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 32
                
                dc.w 9
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 48
