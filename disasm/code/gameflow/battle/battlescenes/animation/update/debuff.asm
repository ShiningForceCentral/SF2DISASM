
; ASM FILE code\gameflow\battle\battlescenes\animation\update\debuff.asm :
; 0x1D038..0x1D0FE : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Debuff:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #38,d0 
                moveq   #3,d1
loc_1D048:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1D0D4
                addq.w  #1,(a5)
                subq.w  #1,4(a5)
                bne.w   loc_1D0D4
                move.w  2(a5),d1
                addq.w  #1,d1
                cmpi.w  #6,d1
                bcs.s   loc_1D06A
                clr.w   d1
loc_1D06A:
                
                move.w  d1,2(a5)
                tst.w   d1
                bne.w   loc_1D090
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                move.w  #8,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #5,d7
                move.w  d7,4(a5)
                bra.w   loc_1D0D4
loc_1D090:
                
                move.w  #5,4(a5)
                subq.w  #1,d1
                bne.w   loc_1D0C2
                lea     graphic_DebuffCloud(pc), a0
                moveq   #1,d1
                moveq   #32,d6 
                jsr     (GenerateRandomNumber).w
                add.w   (a3),d7
                move.w  d7,d2
                moveq   #32,d6 
                jsr     (GenerateRandomNumber).w
                add.w   2(a3),d7
                move.w  d7,d3
                jsr     ConstructComplexGraphic       
                bra.w   loc_1D0D4
loc_1D0C2:
                
                add.w   d1,d1
                lea     table_1D0F6(pc), a0
                move.w  -2(a0,d1.w),d1
                addi.w  #SPELLTILE_START|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d1
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
loc_1D0D4:
                
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                lea     12(a5),a5
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                dbf     d1,loc_1D048
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
                rts

    ; End of function spellanimationUpdate_Debuff

graphic_DebuffCloud:
                vdpSpell 0, 0, SPELLTILE1, V4|H4|VALUE2
                
table_1D0F6:    dc.w $10   ; graphic 2
                dc.w $20   ; graphic 3
                dc.w $10   ; graphic 2
                dc.w 0     ; graphic 1
