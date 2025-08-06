
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_4.asm :
; 0x1EE2C..0x1F806 : Battlescene engine

; =============== S U B R O U T I N E =======================================


VInt_UpdateBattlesceneGraphics:
                
                addq.w  #1,((BATTLESCENE_FRAME_COUNTER-$1000000)).w
                clr.b   ((WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE-$1000000)).w
                bsr.w   UpdateEnemyBattlespriteAnimationCounter
                bsr.w   UpdateAllyBattlespriteAnimationCounter
                bsr.w   UpdateStatusEffectAnimations
                bsr.w   sub_1F282
                bsr.w   UpdateSpellanimation
                bsr.w   UpdateEnemyBattlespritePosition
                bsr.w   UpdateAllyBattlespritePosition
                jmp     (sub_1942).w    

    ; End of function VInt_UpdateBattlesceneGraphics


; =============== S U B R O U T I N E =======================================


UpdateEnemyBattlespriteAnimationCounter:
                
                btst    #3,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                btst    #5,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                subq.w  #1,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                bne.s   @Return
                bsr.w   sub_1EF2E
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateEnemyBattlespriteAnimationCounter


; =============== S U B R O U T I N E =======================================


UpdateAllyBattlespriteAnimationCounter:
                
                btst    #1,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                btst    #4,((byte_FFB56E-$1000000)).w
                beq.s   @Return
                subq.w  #1,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                bne.s   @Return
                bsr.s   UpdateWeaponsprite
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateAllyBattlespriteAnimationCounter


; =============== S U B R O U T I N E =======================================


UpdateWeaponsprite:
                
                bchg    #0,((byte_FFB56E-$1000000)).w
                beq.s   @loc_1
                clr.w   d2
                move.b  ((WEAPON_IDLE_FRAME1_X-$1000000)).w,d3
                move.b  ((WEAPON_IDLE_FRAME1_Y-$1000000)).w,d4
                bra.s   @loc_2
@loc_1:
                
                move.w  #$90,d2 
                move.b  ((WEAPON_IDLE_FRAME2_X-$1000000)).w,d3
                move.b  ((WEAPON_IDLE_FRAME2_Y-$1000000)).w,d4
@loc_2:
                
                lea     (sprite_BattlesceneAlly+4)(pc), a0
                btst    #0,((byte_FFB56F-$1000000)).w
                beq.s   @loc_3
                lea     $48(a0),a0
@loc_3:
                
                lea     ((SPRITE_01_VDPTILE-$1000000)).w,a1
                moveq   #8,d7
@loc_4:
                
                move.w  (a0),(a1)
                add.w   d2,(a1)
                addq.w  #8,a0
                addq.w  #8,a1
                dbf     d7,@loc_4
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.w   @Return
                
                ext.w   d3
                ext.w   d4
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d7
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   @loc_5
                bchg    #4,d7
@loc_5:
                
                lea     sprite_BattlesceneWeapon(pc), a0
                andi.w  #$30,d7 
                add.w   d7,d7
                adda.w  d7,a0
                lea     ((SPRITE_BATTLESCENE_WEAPON-$1000000)).w,a1
                moveq   #3,d7
@loc_6:
                
                move.w  (a0),d0
                subi.w  #$C0,d0 
                add.w   ((BATTLESCENE_ALLY_Y-$1000000)).w,d0
                add.w   d4,d0
                move.w  d0,(a1)
                addq.w  #6,a0
                addq.w  #6,a1
                move.w  (a0)+,d0
                subi.w  #$108,d0
                add.w   ((BATTLESCENE_ALLY_X-$1000000)).w,d0
                add.w   d3,d0
                move.w  d0,(a1)+
                dbf     d7,@loc_6
@Return:
                
                rts

    ; End of function UpdateWeaponsprite


; =============== S U B R O U T I N E =======================================


sub_1EF2E:
                
                bsr.w   LoadBattlesceneEnemyLayout
                bra.w   loc_1EFB0

    ; End of function sub_1EF2E


; =============== S U B R O U T I N E =======================================


DmaBattlesceneEnemyLayout:
                
                bsr.w   LoadBattlesceneEnemyLayout
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jmp     (ApplyImmediateVramDma).w

    ; End of function DmaBattlesceneEnemyLayout


; =============== S U B R O U T I N E =======================================


LoadBattlesceneEnemyLayout:
                
                lea     layout_BattlesceneEnemy(pc), a0
                lea     (BATTLESCENE_ENEMY_LAYOUT).l,a1
                bchg    #2,((byte_FFB56E-$1000000)).w
                beq.s   @loc1
                move.w  #VDPTILE_ENEMYBATTLESPRITE1|VDPTILE_PALETTE2|VDPTILE_PRIORITY,d0   ; frame 1 start
                bra.s   @loc2
@loc1:
                
                move.w  #VDPTILE_ENEMYBATTLESPRITE193|VDPTILE_PALETTE2|VDPTILE_PRIORITY,d0 ; frame 2 start
@loc2:
                
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   @loc5
                
                moveq   #11,d7
@loc3:
                
                moveq   #15,d6
@loc4:
                
                clr.w   d5
                move.b  (a0)+,d5
                add.w   d0,d5
                move.w  d5,(a1)+
                dbf     d6,@loc4
                
                lea     32(a1),a1
                dbf     d7,@loc3
                
                bra.s   @return
@loc5:
                
                bset    #VDPTILE_MIRROR_BIT,d0
                lea     32(a1),a1
                moveq   #11,d7
@loc6:
                
                moveq   #15,d6
@loc7:
                
                clr.w   d5
                move.b  (a0)+,d5
                add.w   d0,d5
                move.w  d5,-(a1)
                dbf     d6,@loc7
                
                lea     96(a1),a1
                dbf     d7,@loc6
@return:
                
                rts

    ; End of function LoadBattlesceneEnemyLayout


; START OF FUNCTION CHUNK FOR sub_1EF2E

loc_1EFB0:
                
                tst.b   ((WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE-$1000000)).w
                bne.s   @return
                
                move.b  #1,((WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE-$1000000)).w
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
@return:
                
                rts

; END OF FUNCTION CHUNK FOR sub_1EF2E


; =============== S U B R O U T I N E =======================================


UpdateStatusEffectAnimations:
                
                clr.w   d7
                move.b  ((byte_FFB580-$1000000)).w,d7
                addq.b  #1,d7
                andi.b  #$3F,d7 
                move.b  d7,((byte_FFB580-$1000000)).w
                move.b  ((BATTLESCENE_ALLY_STATUS_ANIMATION-$1000000)).w,d0
                btst    #1,((byte_FFB56E-$1000000)).w
                bne.s   loc_1EFFE
                btst    #4,((byte_FFB56E-$1000000)).w
                bne.s   loc_1EFFE
                clr.w   d0
loc_1EFFE:
                
                move.b  ((ALLY_BATTLESPRITE_STATUS_OFFSET_Y-$1000000)).w,d1
                ext.w   d1
                btst    #1,((byte_FFB56F-$1000000)).w
                bne.s   loc_1F012
                move.b  ((ALLY_BATTLESPRITE_STATUS_OFFSET_X-$1000000)).w,d4
                bra.s   loc_1F01A
loc_1F012:
                
                move.b  #$60,d4 
                sub.b   ((ALLY_BATTLESPRITE_STATUS_OFFSET_X-$1000000)).w,d4
loc_1F01A:
                
                ext.w   d4
                add.w   ((BATTLESCENE_ALLY_Y-$1000000)).w,d1
                add.w   ((BATTLESCENE_ALLY_X-$1000000)).w,d4
                lea     ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w,a1
                bsr.w   sub_1F0B0
                lea     ((SPRITE_17-$1000000)).w,a0
                move.w  d1,(a0)+
                move.w  d2,(a0)+
                move.w  d3,(a0)+
                move.w  d4,(a0)
                move.b  #2,(byte_FFAFB1).l
                clr.w   d7
                move.b  ((byte_FFB581-$1000000)).w,d7
                addq.b  #1,d7
                andi.b  #$3F,d7 
                move.b  d7,((byte_FFB581-$1000000)).w
                move.b  ((BATTLESCENE_ENEMY_STATUS_ANIMATION-$1000000)).w,d0
                btst    #3,((byte_FFB56E-$1000000)).w
                bne.s   loc_1F066
                btst    #5,((byte_FFB56E-$1000000)).w
                bne.s   loc_1F066
                clr.w   d0
loc_1F066:
                
                move.b  ((ENEMY_BATTLESPRITE_STATUS_OFFSET_Y-$1000000)).w,d1
                ext.w   d1
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1F07A
                move.b  ((ENEMY_BATTLESPRITE_STATUS_OFFSET_X-$1000000)).w,d4
                bra.s   loc_1F082
loc_1F07A:
                
                move.b  #$80,d4
                sub.b   ((ENEMY_BATTLESPRITE_STATUS_OFFSET_X-$1000000)).w,d4
loc_1F082:
                
                ext.w   d4
                addi.w  #$B0,d1 
                add.w   ((BATTLESCENE_ENEMY_Y-$1000000)).w,d1
                addi.w  #$90,d4 
                add.w   ((BATTLESCENE_ENEMY_X-$1000000)).w,d4
                lea     ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w,a1
                bsr.s   sub_1F0B0
                lea     ((SPRITE_18-$1000000)).w,a0
                move.w  d1,(a0)+
                move.w  d2,(a0)+
                move.w  d3,(a0)+
                move.w  d4,(a0)
                move.b  #2,(word_FFAFB2).l
                rts

    ; End of function UpdateStatusEffectAnimations


; =============== S U B R O U T I N E =======================================


sub_1F0B0:
                
                tst.b   d0
                beq.w   loc_1F11E
                subq.b  #1,d0
                bne.s   loc_1F0D0
                btst    #4,d7
                beq.w   loc_1F11E
                move.w  #$500,d2
                move.w  #$7BB|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d3
                subq.w  #8,d1
                subq.w  #8,d4
                rts
loc_1F0D0:
                
                subq.b  #1,d0
                bne.s   loc_1F0F2
                move.w  #$900,d2
                move.w  #$7BF|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d3
                lsr.w   #3,d7
                andi.w  #3,d7
                mulu.w  #6,d7
                add.w   d7,d3
                subi.w  #$20,d1 
                subi.w  #$C,d4
                rts
loc_1F0F2:
                
                subq.b  #1,d0
                bne.s   loc_1F10E
                lsr.w   #NIBBLE_SHIFT_COUNT,d7
                andi.w  #3,d7
                beq.s   loc_1F11E
                lsl.w   #3,d7
                lea     sprite_1F128-8(pc,d7.w),a1
                add.w   (a1)+,d1
                move.w  (a1)+,d2
                move.w  (a1)+,d3
                add.w   (a1),d4
                rts
loc_1F10E:
                
                subq.b  #1,d0
                bne.s   loc_1F11E
                andi.w  #3,d7
                add.w   d7,d7
                move.w  table_1F140(pc,d7.w),d0
                add.w   d0,(a1)
loc_1F11E:
                
                moveq   #1,d1
loc_1F120:
                
                move.w  d1,d2
                move.w  d1,d3
                move.w  d1,d4
                rts

    ; End of function sub_1F0B0

sprite_1F128:   vdpSprite -8, V1|H1|0, 1968|PALETTE3|PRIORITY, -4 
                                                        ; VDP sprite definitions related to battlescene status effect sprites
                vdpSprite -16, V2|H2|0, 1969|PALETTE3|PRIORITY, -4
                vdpSprite -24, V3|H2|0, 1973|PALETTE3|PRIORITY, -4
                
table_1F140:    dc.w 1
                dc.w -1
                dc.w 1
                dc.w -1

; =============== S U B R O U T I N E =======================================


UpdateEnemyBattlespritePosition:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   @Return
                
                move.w  ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w,d6
                beq.s   @CheckVerticalSpeed
                
                add.w   ((BATTLESCENE_ENEMY_X-$1000000)).w,d6
                bsr.w   MoveEnemyBattlespriteHorizontally
                clr.w   ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w
@CheckVerticalSpeed:
                
                move.w  ((BATTLESCENE_ENEMY_Y_SPEED-$1000000)).w,d6
                beq.s   @Return
                add.w   ((BATTLESCENE_ENEMY_Y-$1000000)).w,d6
                bsr.w   MoveEnemyBattlespriteVertically
                clr.w   ((BATTLESCENE_ENEMY_Y_SPEED-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateEnemyBattlespritePosition


; =============== S U B R O U T I N E =======================================


UpdateAllyBattlespritePosition:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.w   @Return
                
                move.w  ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w,d0
                move.w  d0,d2
                move.w  ((BATTLESCENE_ALLY_Y_SPEED-$1000000)).w,d1
                or.w    d1,d2
                beq.w   @Return
                
                add.w   d0,((BATTLESCENE_ALLY_X-$1000000)).w
                add.w   d1,((BATTLESCENE_ALLY_Y-$1000000)).w
                lea     ((SPRITE_01-$1000000)).w,a0
                moveq   #8,d2
@UpdateAllyPosition_Loop:
                
                add.w   d1,(a0)
                addq.w  #6,a0
                add.w   d0,(a0)+
                dbf     d2,@UpdateAllyPosition_Loop
                
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.s   @Done
                
                lea     ((SPRITE_BATTLESCENE_WEAPON-$1000000)).w,a0
                moveq   #3,d2
@UpdateWeaponPosition_Loop:
                
                add.w   d0,VDPSPRITE_OFFSET_X(a0)
                add.w   d1,(a0)
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d2,@UpdateWeaponPosition_Loop
@Done:
                
                clr.w   ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w
                clr.w   ((BATTLESCENE_ALLY_Y_SPEED-$1000000)).w
@Return:
                
                rts

    ; End of function UpdateAllyBattlespritePosition


; =============== S U B R O U T I N E =======================================


MoveBackgroundHorizontally:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3EA-$1000000)).w
                lea     ((byte_FFD1C0-$1000000)).w,a0
                moveq   #103,d0
@Loop:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,@Loop
                
                jsr     (UpdateVdpHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function MoveBackgroundHorizontally


; =============== S U B R O U T I N E =======================================


MoveBackgroundVertically:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((word_FFB3EE-$1000000)).w
                lea     ((VERTICAL_SCROLL_DATA-$1000000)).w,a0
                moveq   #19,d0
loc_1F1FE:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,loc_1F1FE
                
                jsr     (UpdateVdpVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function MoveBackgroundVertically


; =============== S U B R O U T I N E =======================================


MoveEnemyBattlespriteHorizontally:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((BATTLESCENE_ENEMY_X-$1000000)).w
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   loc_1F236
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1F232
                subi.w  #16,d6
                bra.s   loc_1F236
loc_1F232:
                
                addi.w  #16,d6
loc_1F236:
                
                lea     ((HORIZONTAL_SCROLL_DATA+2-$1000000)).w,a0
                move.w  #255,d0
loc_1F23E:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,loc_1F23E
                
                jsr     (UpdateVdpHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function MoveEnemyBattlespriteHorizontally


; =============== S U B R O U T I N E =======================================


MoveEnemyBattlespriteVertically:
                
                movem.l d0/a0,-(sp)
                move.w  d6,((BATTLESCENE_ENEMY_Y-$1000000)).w
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   @Continue
                subq.w  #8,d6
@Continue:
                
                lea     ((VERTICAL_SCROLL_DATA+2-$1000000)).w,a0
                moveq   #19,d0
@Loop:
                
                move.w  d6,(a0)
                addq.w  #4,a0
                dbf     d0,@Loop
                
                jsr     (UpdateVdpVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0/a0
                rts

    ; End of function MoveEnemyBattlespriteVertically


; =============== S U B R O U T I N E =======================================


sub_1F282:
                
                btst    #0,((byte_FFB3CD-$1000000)).w
                bne.s   loc_1F2AE
                btst    #0,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                btst    #2,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                tst.w   ((word_FFB3C4-$1000000)).w
                beq.s   return_1F2F4
                lea     ((HORIZONTAL_SCROLL_DATA-$1000000)).w,a3
                lea     ((VERTICAL_SCROLL_DATA-$1000000)).w,a4
                lea     ((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w,a5
                bra.s   loc_1F2D0
loc_1F2AE:
                
                btst    #1,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                btst    #3,((byte_FFB583-$1000000)).w
                beq.s   return_1F2F4
                tst.w   ((word_FFB3CA-$1000000)).w
                beq.s   return_1F2F4
                lea     ((HORIZONTAL_SCROLL_DATA+2-$1000000)).w,a3
                lea     ((VERTICAL_SCROLL_DATA+2-$1000000)).w,a4
                lea     ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w,a5
loc_1F2D0:
                
                addq.w  #1,4(a5)
                movea.l (a5),a0
                move.b  (a0),d0
                beq.w   loc_1F338 ; 0
                subq.b  #1,d0
                beq.w   loc_1F384 ; 1
                subq.b  #1,d0
                beq.w   loc_1F3DC ; 2
                subq.b  #1,d0
                beq.w   loc_1F3E0 ; 3
                subq.b  #1,d0
                beq.w   loc_1F4D2 ; 4
return_1F2F4:
                
                rts

    ; End of function sub_1F282


; =============== S U B R O U T I N E =======================================


sub_1F2F6:
                
                tst.b   ((byte_FFB583-$1000000)).w
                beq.s   return_1F336
                clr.b   ((byte_FFB583-$1000000)).w
                clr.b   ((byte_FFB56B-$1000000)).w
                clr.w   ((word_FFB3C4-$1000000)).w
                clr.w   ((word_FFB3CA-$1000000)).w
                clr.l   ((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                clr.l   ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                clr.w   d6
                bsr.w   MoveBackgroundHorizontally
                bsr.w   MoveBackgroundVertically
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_1F32A
                moveq   #96,d6
                bra.s   loc_1F32C
loc_1F32A:
                
                clr.w   d6
loc_1F32C:
                
                bsr.w   MoveEnemyBattlespriteHorizontally
                clr.w   d6
                bsr.w   MoveEnemyBattlespriteVertically
return_1F336:
                
                rts

    ; End of function sub_1F2F6


; START OF FUNCTION CHUNK FOR sub_1F282

loc_1F338:
                
                move.w  4(a5),d0
                movea.l (a5),a5
                clr.w   d3
                move.b  1(a5),d3
                lsl.w   #2,d3
                lea     (a3,d3.w),a0
                movea.l 4(a5),a1
                lea     (a1),a2
                clr.w   d2
                move.b  2(a5),d2
                subq.w  #1,d2
                and.w   d2,d0
                move.w  d0,d1
                add.w   d0,d0
                adda.w  d0,a1
                clr.w   d0
                move.b  3(a5),d0
                subq.w  #1,d0
loc_1F368:
                
                move.w  (a1)+,d3
                add.w   d3,(a0)
                addq.w  #4,a0
                addq.w  #1,d1
                cmp.w   d2,d1
                bls.s   loc_1F378
                clr.w   d1
                lea     (a2),a1 ; restore address to table start
loc_1F378:
                
                dbf     d0,loc_1F368
                jsr     (UpdateVdpHScrollData).w
                jmp     (EnableDmaQueueProcessing).w
loc_1F384:
                
                move.w  4(a5),d0
                cmpi.w  #16,d0
                bcc.s   loc_1F3C8
                move.b  table_1F3CE-2(pc,d0.w),d0
                movea.l (a5),a2
                clr.w   d3
                move.b  1(a2),d3
                lsl.w   #2,d3
                lea     (a3,d3.w),a0
                clr.w   d1
                move.b  2(a2),d1
                subq.w  #1,d1
                clr.w   d2
                move.b  3(a2),d2
                move.w  d2,d3
loc_1F3B0:
                
                add.w   d0,(a0)
                subq.w  #1,d3
                bne.s   loc_1F3BA
                neg.w   d0
                move.w  d2,d3
loc_1F3BA:
                
                addq.w  #4,a0
                dbf     d1,loc_1F3B0
                jsr     (UpdateVdpHScrollData).w
                jmp     (EnableDmaQueueProcessing).w
loc_1F3C8:
                
                clr.w   4(a5)
                rts

; END OF FUNCTION CHUNK FOR sub_1F282

table_1F3CE:    dc.b 4
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 0

; START OF FUNCTION CHUNK FOR sub_1F282

loc_1F3DC:
                
                clr.w   d7
                bra.s   loc_1F3E2
loc_1F3E0:
                
                moveq   #1,d7
loc_1F3E2:
                
                btst    #6,4(a5)
                bne.s   loc_1F422
                move.w  #4,d0
                move.w  #8,d1
                bsr.w   sub_1F45E
                move.w  #$FFE0,d0
                move.w  #$FFC0,d1
                tst.w   d7
                beq.s   loc_1F406
                neg.w   d0
                neg.w   d1
loc_1F406:
                
                bsr.w   sub_1F496
                move.w  4(a5),d0
                movea.l (a5),a0
                clr.w   d1
                move.b  1(a0),d1
                cmp.w   d1,d0
                bls.s   return_1F420
                move.w  #$4001,4(a5)
return_1F420:
                
                rts
loc_1F422:
                
                move.w  #$FFFC,d0
                move.w  #$FFF8,d1
                bsr.w   sub_1F45E
                move.w  #$20,d0 
                move.w  #$40,d1 
                tst.w   d7
                beq.s   loc_1F43E
                neg.w   d0
                neg.w   d1
loc_1F43E:
                
                bsr.w   sub_1F496
                move.w  4(a5),d0
                bclr    #$E,d0
                movea.l (a5),a0
                clr.w   d1
                move.b  1(a0),d1
                cmp.w   d1,d0
                bls.s   return_1F45C
                move.w  #1,4(a5)
return_1F45C:
                
                rts

; END OF FUNCTION CHUNK FOR sub_1F282


; =============== S U B R O U T I N E =======================================


sub_1F45E:
                
                lea     $17C(a3),a0
                lea     $180(a3),a1
                lea     (FF8804_LOADING_SPACE).l,a2
                asr.w   #1,d1
                moveq   #$3F,d2 
loc_1F470:
                
                move.w  d1,d3
                add.w   (a2),d3
                move.w  d3,(a2)+
                asr.w   #BYTE_SHIFT_COUNT,d3
                move.w  d3,d4
                add.w   ((BATTLESCENE_ENEMY_X-$1000000)).w,d4
                move.w  d4,(a0)
                neg.w   d3
                add.w   ((BATTLESCENE_ENEMY_X-$1000000)).w,d3
                move.w  d3,(a1)
                subq.w  #4,a0
                addq.w  #4,a1
                add.w   d0,d1
                dbf     d2,loc_1F470
                jmp     (UpdateVdpHScrollData).w

    ; End of function sub_1F45E


; =============== S U B R O U T I N E =======================================


sub_1F496:
                
                lea     $10(a4),a0
                lea     $14(a4),a1
                lea     (byte_FF8904).l,a2
                asr.w   #1,d1
                moveq   #4,d2
loc_1F4A8:
                
                move.w  d1,d3
                add.w   (a2),d3
                move.w  d3,(a2)+
                asr.w   #BYTE_SHIFT_COUNT,d3
                move.w  d3,d4
                add.w   ((BATTLESCENE_ENEMY_Y-$1000000)).w,d4
                move.w  d4,(a1)
                neg.w   d3
                add.w   ((BATTLESCENE_ENEMY_Y-$1000000)).w,d3
                move.w  d3,(a0)
                subq.w  #4,a0
                addq.w  #4,a1
                add.w   d0,d1
                dbf     d2,loc_1F4A8
                jsr     (UpdateVdpVScrollData).w
                jmp     (EnableDmaQueueProcessing).w

    ; End of function sub_1F496


; START OF FUNCTION CHUNK FOR sub_1F282

loc_1F4D2:
                
                move.w  4(a5),d0
                movea.l (a5),a0
                clr.w   d1
                move.b  1(a0),d1
                lea     table_1F530(pc), a0
                move.w  d0,d2
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                move.b  (a0,d2.w),d2
                ext.w   d2
                beq.s   loc_1F502
                muls.w  d1,d2
                move.w  #$FF,d3
loc_1F4F6:
                
                add.w   d2,(a3)
                addq.w  #4,a3
                dbf     d3,loc_1F4F6
                jsr     (UpdateVdpHScrollData).w
loc_1F502:
                
                lea     table_1F528(pc), a0
                move.w  d0,d2
                andi.w  #7,d2
                move.b  (a0,d2.w),d2
                ext.w   d2
                beq.s   loc_1F524
                muls.w  d1,d2
                moveq   #$13,d3
loc_1F518:
                
                add.w   d2,(a4)
                addq.w  #4,a4
                dbf     d3,loc_1F518
                jsr     (UpdateVdpVScrollData).w
loc_1F524:
                
                jmp     (EnableDmaQueueProcessing).w

; END OF FUNCTION CHUNK FOR sub_1F282

table_1F528:    dc.b 0
                dc.b 2
                dc.b -1
                dc.b 0
                dc.b 0
                dc.b -2
                dc.b 1
                dc.b 0
				
table_1F530:    dc.b -1
                dc.b 2
                dc.b -3
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b -2
                dc.b 3
                dc.b 0
                dc.b -1
                dc.b 0
                dc.b -2
                dc.b 0

; =============== S U B R O U T I N E =======================================


sub_1F540:
                
                tst.b   ((byte_FFB56B-$1000000)).w
                beq.s   return_1F574
                movem.l d0/a0,-(sp)
                move.w  #1,((word_FFB3C4-$1000000)).w
                lea     (FF8804_LOADING_SPACE).l,a0
                move.w  #$3FF,d0
loc_1F55A:
                
                clr.l   (a0)+
                dbf     d0,loc_1F55A
                movea.l ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w,a0
                clr.w   d0
                move.b  1(a0),d0
                lsr.w   #1,d0
                move.w  d0,((word_FFB3CA-$1000000)).w
                movem.l (sp)+,d0/a0
return_1F574:
                
                rts

    ; End of function sub_1F540

sprite_BattlesceneAlly:
                
; Syntax        vdpSprite y, [VDPSPRITESIZE_]bitfield|link, vdpTile, x
;
;      vdpTile: [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpSprite 192, V4|H4|0, ALLYBATTLESPRITE1|PALETTE1|PRIORITY, 264
                vdpSprite 224, V4|H4|0, ALLYBATTLESPRITE17|PALETTE1|PRIORITY, 264
                vdpSprite 256, V4|H4|0, ALLYBATTLESPRITE33|PALETTE1|PRIORITY, 264
                vdpSprite 192, V4|H4|0, ALLYBATTLESPRITE49|PALETTE1|PRIORITY, 296
                vdpSprite 224, V4|H4|0, ALLYBATTLESPRITE65|PALETTE1|PRIORITY, 296
                vdpSprite 256, V4|H4|0, ALLYBATTLESPRITE81|PALETTE1|PRIORITY, 296
                vdpSprite 192, V4|H4|0, ALLYBATTLESPRITE97|PALETTE1|PRIORITY, 328
                vdpSprite 224, V4|H4|0, ALLYBATTLESPRITE113|PALETTE1|PRIORITY, 328
                vdpSprite 256, V4|H4|0, ALLYBATTLESPRITE129|PALETTE1|PRIORITY, 328
                
                ; Mirrored ally
                vdpSprite 192, V4|H4|0, ALLYBATTLESPRITE1|MIRROR|PALETTE1|PRIORITY, 328
                vdpSprite 224, V4|H4|0, ALLYBATTLESPRITE17|MIRROR|PALETTE1|PRIORITY, 328
                vdpSprite 256, V4|H4|0, ALLYBATTLESPRITE33|MIRROR|PALETTE1|PRIORITY, 328
                vdpSprite 192, V4|H4|0, ALLYBATTLESPRITE49|MIRROR|PALETTE1|PRIORITY, 296
                vdpSprite 224, V4|H4|0, ALLYBATTLESPRITE65|MIRROR|PALETTE1|PRIORITY, 296
                vdpSprite 256, V4|H4|0, ALLYBATTLESPRITE81|MIRROR|PALETTE1|PRIORITY, 296
                vdpSprite 192, V4|H4|0, ALLYBATTLESPRITE97|MIRROR|PALETTE1|PRIORITY, 264
                vdpSprite 224, V4|H4|0, ALLYBATTLESPRITE113|MIRROR|PALETTE1|PRIORITY, 264
                vdpSprite 256, V4|H4|0, ALLYBATTLESPRITE129|MIRROR|PALETTE1|PRIORITY, 264
                
sprite_BattlesceneWeapon:
                ; Weapon configuration 0
                vdpSprite 192, V4|H4|0, WEAPON1|PALETTE1|PRIORITY, 264
                vdpSprite 224, V4|H4|0, WEAPON17|PALETTE1|PRIORITY, 264
                vdpSprite 192, V4|H4|0, WEAPON33|PALETTE1|PRIORITY, 296
                vdpSprite 224, V4|H4|0, WEAPON49|PALETTE1|PRIORITY, 296
                
                ; Weapon configuration 1 (mirrored)
                vdpSprite 192, V4|H4|0, WEAPON1|MIRROR|PALETTE1|PRIORITY, 296
                vdpSprite 224, V4|H4|0, WEAPON17|MIRROR|PALETTE1|PRIORITY, 296
                vdpSprite 192, V4|H4|0, WEAPON33|MIRROR|PALETTE1|PRIORITY, 264
                vdpSprite 224, V4|H4|0, WEAPON49|MIRROR|PALETTE1|PRIORITY, 264
                
                ; Weapon configuration 2 (flipped)
                vdpSprite 224, V4|H4|0, WEAPON1|FLIP|PALETTE1|PRIORITY, 264
                vdpSprite 192, V4|H4|0, WEAPON17|FLIP|PALETTE1|PRIORITY, 264
                vdpSprite 224, V4|H4|0, WEAPON33|FLIP|PALETTE1|PRIORITY, 296
                vdpSprite 192, V4|H4|0, WEAPON49|FLIP|PALETTE1|PRIORITY, 296
                
                ; Weapon configuration 3 (mirrored and flipped)
                vdpSprite 224, V4|H4|0, WEAPON1|MIRROR|FLIP|PALETTE1|PRIORITY, 296
                vdpSprite 192, V4|H4|0, WEAPON17|MIRROR|FLIP|PALETTE1|PRIORITY, 296
                vdpSprite 224, V4|H4|0, WEAPON33|MIRROR|FLIP|PALETTE1|PRIORITY, 264
                vdpSprite 192, V4|H4|0, WEAPON49|MIRROR|FLIP|PALETTE1|PRIORITY, 264
                
sprite_BattlesceneGround:
                vdpSprite 268, V4|H4|0, GROUND1|PALETTE3, 264
                vdpSprite 268, V4|H4|0, GROUND17|PALETTE3, 296
                vdpSprite 268, V4|H4|0, GROUND33|PALETTE3, 328
                
                ; Mirrored ground
                vdpSprite 268, V4|H4|0, GROUND1|MIRROR|PALETTE3, 328
                vdpSprite 268, V4|H4|0, GROUND17|MIRROR|PALETTE3, 296
                vdpSprite 268, V4|H4|0, GROUND33|MIRROR|PALETTE3, 264
                

; enemy battlesprite is made of 12 vdpSprites
;
layout_BattlesceneEnemy:
                ; 1st row tiles
                dc.b 0, 4, 8, $C
                dc.b $30, $34, $38, $3C
                dc.b $60, $64, $68, $6C
                dc.b $90, $94, $98, $9C
				
                ; 2nd row tiles
                dc.b 1, 5, 9, $D
                dc.b $31, $35, $39, $3D
                dc.b $61, $65, $69, $6D
                dc.b $91, $95, $99, $9D
				
                ; 3rd row tiles
                dc.b 2, 6, $A, $E
                dc.b $32, $36, $3A, $3E
                dc.b $62, $66, $6A, $6E
                dc.b $92, $96, $9A, $9E
				
                ; 4th row tiles
                dc.b 3, 7, $B, $F
                dc.b $33, $37, $3B, $3F
                dc.b $63, $67, $6B, $6F
                dc.b $93, $97, $9B, $9F
				
                ; 5th row tiles
                dc.b $10, $14, $18, $1C
                dc.b $40, $44, $48, $4C
                dc.b $70, $74, $78, $7C
                dc.b $A0, $A4, $A8, $AC
				
                ; 6th row tiles
                dc.b $11, $15, $19, $1D
                dc.b $41, $45, $49, $4D
                dc.b $71, $75, $79, $7D
                dc.b $A1, $A5, $A9, $AD
				
                ; 7th row tiles
                dc.b $12, $16, $1A, $1E
                dc.b $42, $46, $4A, $4E
                dc.b $72, $76, $7A, $7E
                dc.b $A2, $A6, $AA, $AE
				
                ; 8th row tiles
                dc.b $13, $17, $1B, $1F
                dc.b $43, $47, $4B, $4F
                dc.b $73, $77, $7B, $7F
                dc.b $A3, $A7, $AB, $AF
				
                ; 9th row tiles 
                dc.b $20, $24, $28, $2C
                dc.b $50, $54, $58, $5C
                dc.b $80, $84, $88, $8C
                dc.b $B0, $B4, $B8, $BC
				
                ; 10th row tiles
                dc.b $21, $25, $29, $2D
                dc.b $51, $55, $59, $5D
                dc.b $81, $85, $89, $8D
                dc.b $B1, $B5, $B9, $BD
				
                ; 11th row tiles
                dc.b $22, $26, $2A, $2E
                dc.b $52, $56, $5A, $5E
                dc.b $82, $86, $8A, $8E
                dc.b $B2, $B6, $BA, $BE
				
                ; 12th row tiles
                dc.b $23, $27, $2B, $2F
                dc.b $53, $57, $5B, $5F
                dc.b $83, $87, $8B, $8F
                dc.b $B3, $B7, $BB, $BF
				
            
layout_Battlesprite:    ; battlesprite arrangement
                dc.w VDPTILE_ALLYBATTLESPRITE1|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE17|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE33|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE49|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE65|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE81|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE97|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE113|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE129|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE145|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE161|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE177|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE193|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE209|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE225|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE241|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE257|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE273|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                ; 
                dc.w $520|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $530|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $540|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $550|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $560|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $570|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $580|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $590|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5A0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $5B0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5C0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5D0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $5E0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5F0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $6C0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $6D0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $6E0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $6F0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
            
layout_Invocation:    ; invocation arrangement
                dc.w VDPTILE_ALLYBATTLESPRITE1|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE17|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE145|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE161|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE33|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE49|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE177|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE193|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE65|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE81|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE209|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE225|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w VDPTILE_ALLYBATTLESPRITE97|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE113|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE241|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w VDPTILE_ALLYBATTLESPRITE257|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w 0  ; spacer byte
                dc.w 0  ; spacer byte
				
                ;
                dc.w $520|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $530|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5B0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5C0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $540|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $550|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5D0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5E0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $560|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $570|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $5F0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $6C0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w $580|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $590|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $6D0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
                dc.w $6E0|VDPTILE_PALETTE1|VDPTILE_PRIORITY
				
                dc.w 0  ; spacer byte
                dc.w 0  ; spacer byte
