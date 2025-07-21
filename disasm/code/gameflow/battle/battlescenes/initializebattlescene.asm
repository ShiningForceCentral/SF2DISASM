
; ASM FILE code\gameflow\battle\battlescenes\initializebattlescene.asm :
; 0x18012..0x18398 : Battlescene engine

; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy index
;     d1.w = ally index


InitializeBattlescene:
                
                lea     ((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w,a0
                move.l  #BATTLESCENE_DATA_END,d2
                subi.l  #BATTLESCENE_BACKGROUND_MODIFICATION_POINTER,d2
                lsr.l   #2,d2
                subq.w  #1,d2
@ClearBattlesceneData_Loop:
                
                clr.l   (a0)+
                dbf     d2,@ClearBattlesceneData_Loop
                
                ; Get enemy graphics information
                move.w  d1,-(sp)
                move.w  d0,((BATTLESCENE_ENEMY-$1000000)).w
                bsr.w   GetBattlespriteAndPalette
                move.w  d1,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w
                move.w  d2,((BATTLESCENE_ENEMYBATTLEPALETTE-$1000000)).w
                move.w  d3,((BATTLESCENE_ENEMYBATTLEANIMATION-$1000000)).w
                move.w  (sp)+,d0
                
                ; Get ally graphics information
                move.w  d0,((BATTLESCENE_ALLY-$1000000)).w
                bsr.w   GetBattlespriteAndPalette
                move.w  d1,((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w
                move.w  d2,((BATTLESCENE_ALLYBATTLEPALETTE-$1000000)).w
                move.w  d3,((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w
                bsr.w   GetWeaponspriteAndPalette
                move.w  d2,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                move.w  d3,((BATTLESCENE_WEAPONPALETTE-$1000000)).w
                move.b  #-1,((BATTLESCENE_BACKGROUND-$1000000)).w
                
                bsr.w   FadeOutToBlackForBattlescene
                sndCom  SOUND_COMMAND_FADE_OUT
                
                ; Get background
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                bpl.s   @Continue
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
@Continue:
                
                bsr.w   GetBattlesceneBackground
                
                disableSram
                move.w  d1,d0
                lea     (FF2000_LOADING_SPACE).l,a1 ; store it in RAM for DMA
                bsr.w   LoadBattlesceneBackground
@WaitForFadeOut:
                
                jsr     (WaitForVInt).w
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   @WaitForFadeOut
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w
                jsr     (DisableDisplayAndInterrupts).w
                move.w  #$8B07,d0       ; set VScroll : each 2 cells, HScroll : each 1 line
                jsr     (SetVdpReg).w
                jsr     (ClearSpriteTable).w
                moveq   #VDP_SPRITES_COUNTER,d0
                jsr     (InitializeSprites).w
                jsr     (sub_19B0).w    
                bsr.w   InitializeBattlescenePalettes
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #VRAM_PLANE_LONGWORD_COUNTER,d0
@ClearPlanes_Loop:
                
                clr.l   (a0)+
                clr.l   (a1)+
                dbf     d0,@ClearPlanes_Loop
                
                ; Load cleared out planes to VRAM
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                bsr.w   LoadBattlesceneBackgroundLayout
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     (FF2000_LOADING_SPACE).l,a0
                lea     ($7400).w,a1
                move.w  #$C00,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     (FF3800_LOADING_SPACE).l,a0
                lea     ($8C00).l,a1
                move.w  #$C00,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                
                ; Load background palette
                lea     ((BATTLESCENE_BACKGROUND_PALETTE-$1000000)).w,a0
                lea     ((PALETTE_4_BASE-$1000000)).w,a1
                moveq   #7,d0
@LoadBackgroundPalette_Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d0,@LoadBackgroundPalette_Loop
                
                ; Load enemy plane layout to VRAM
                switchRomBanks
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.w   @LoadAllyVdpSprite
                
                bsr.w   DmaBattlesceneEnemyLayout
                bset    #3,((byte_FFB56E-$1000000)).w
                bset    #5,((byte_FFB56E-$1000000)).w
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                clr.w   d1
                lea     ($4400).w,a1
                bsr.w   LoadEnemyBattlespriteFrameToVram
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                bsr.w   GetEnemyBattlespriteIdleAnimate
                lea     ($5C00).w,a1
                bsr.w   LoadEnemyBattlespriteFrameToVram
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                move.w  ((BATTLESCENE_ENEMYBATTLEPALETTE-$1000000)).w,d1
                bsr.w   LoadEnemyBattlespritePropertiesAndPalette
@LoadAllyVdpSprite:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.w   @StatusAnimationTilesToVram
                
                lea     sprite_BattlesceneAlly(pc), a0
                lea     ((SPRITE_01-$1000000)).w,a1
                lea     (BATTLESCENE_BATTLESPRITE_TOGGLE).l,a2
                moveq   #8,d0
@LoadAllyVdpSprite_Loop:
                
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.b  #1,(a2)+
                dbf     d0,@LoadAllyVdpSprite_Loop
                
                bset    #1,((byte_FFB56E-$1000000)).w
                bset    #4,((byte_FFB56E-$1000000)).w
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                clr.w   d1
                lea     ($2000).w,a1
                bsr.w   LoadAllyBattlespriteFrameToVram
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattlespriteIdleAnimate
                lea     ($3200).w,a1
                bsr.w   LoadAllyBattlespriteFrameToVram
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                move.w  ((BATTLESCENE_ALLYBATTLEPALETTE-$1000000)).w,d1
                bsr.w   LoadAllyBattlespritePropertiesAndPalette
                
                ; Get ground platform for ally
                restoreRomBanksAndEnableSram
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                bsr.w   GetBattlesceneGround
                move.b  d1,((BATTLESCENE_BACKGROUND-$1000000)).w
                
                disableSram
                cmpi.w  #-1,d1
                beq.w   @CheckWeaponsprite
                
                ; Load ground VDP sprite
                lea     sprite_BattlesceneGround(pc), a0
                lea     ((SPRITE_BATTLESCENE_GROUND-$1000000)).w,a1
                lea     (BATTLESCENE_GROUNDSPRITE_TOGGLE).l,a2
                moveq   #2,d0
@LoadGroundVdpSprite_Loop:
                
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.b  #1,(a2)+
                dbf     d0,@LoadGroundVdpSprite_Loop
                
                move.w  d1,d0
                bsr.w   LoadBattlesceneGroundToVram
@CheckWeaponsprite:
                
                move.w  ((BATTLESCENE_WEAPONSPRITE-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.w   @StatusAnimationTilesToVram
                
                switchRomBanks
                bsr.w   LoadWeaponsprite
                move.w  ((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w,d0
                getPointer p_pt_AllyAnimations, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #4,a0
                move.l  (a0),((WEAPON_IDLE_FRAME1_INDEX-$1000000)).w
                move.l  (a0),((WEAPON_FRAME_INDEX-$1000000)).w
                move.w  $A(a0),((WEAPON_IDLE_FRAME2_X-$1000000)).w
                clr.w   d1
                bsr.w   UpdateBattlesceneWeaponVdpSprites
                lea     (FF2000_LOADING_SPACE).l,a0
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d0
                andi.w  #7,d0
                ror.w   #5,d0
                lea     (a0,d0.w),a0
                lea     ($D800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                move.w  ((BATTLESCENE_WEAPONPALETTE-$1000000)).w,d0
                bsr.w   LoadWeaponPalette
                
                restoreRomBanks
@StatusAnimationTilesToVram:
                
                getPointer p_tiles_StatusAnimation, a0
                lea     ($F600).l,a1
                move.w  #$270,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDmaOnCompressedTiles).w
                
                enableSram
                bsr.w   ApplyStatusEffectsToAnimations
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w,d0
                lsr.w   #1,d0
                move.w  d0,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                clr.b   ((byte_FFB581-$1000000)).w
                move.b  #32,((byte_FFB580-$1000000)).w
                jsr     (EnableInterrupts).w
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                move.w  #-44,d6
                bsr.w   MoveBackgroundHorizontally
                clr.w   d6
                bsr.w   MoveBackgroundVertically
                jsr     (WaitForVInt).w
                move.w  #-22,d6
                bsr.w   MoveEnemyBattlespriteHorizontally
                clr.w   d6
                bsr.w   MoveEnemyBattlespriteVertically
                jsr     (WaitForVInt).w
                jsr     (sub_1942).w    
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateBattlesceneGraphics
                jsr     j_CreateBattlesceneMiniStatusWindows
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                jsr     (EnableDisplayAndInterrupts).w
                
                ; Check enemy battlescene window
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   @CheckAllyBattlesceneWindow
                
                clr.w   d1
                jsr     j_OpenEnemyBattlesceneMiniStatusWindow
@CheckAllyBattlesceneWindow:
                
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.w   @StartFadeInAndPlayMusic
                
                clr.w   d1
                jsr     j_OpenAllyBattlesceneMiniStatusWindow
                
                move.w  #22,d0
                clr.w   d1
                
                movem.w d0-d1,-(sp)
                bsr.w   LoadBattlesceneAllyAndWeaponVdpSprites
                movem.w (sp)+,d0-d1
                
                bsr.w   LoadBattlesceneGroundVdpSprites
@StartFadeInAndPlayMusic:
                
                jsr     (WaitForVInt).w
                bsr.w   FadeInFromBlackIntoBattlescene
                clr.w   d0
                move.b  (BATTLESCENE_MUSIC_INDEX).l,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                moveq   #21,d0
@MoveActorsToPosition_Loop:
                
                move.w  ((word_FFB3EA-$1000000)).w,d6
                addi.w  #2,d6
                bsr.w   MoveBackgroundHorizontally
                move.w  #1,((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w
                move.w  #-1,((BATTLESCENE_ALLY_X_SPEED-$1000000)).w
                cmpi.b  #-1,((BATTLESCENE_BACKGROUND-$1000000)).w
                beq.s   @WaitForNextFrame
                
                lea     ((SPRITE_BATTLESCENE_GROUND_X-$1000000)).w,a0
                moveq   #2,d1
@MoveGroundToPosition_Loop:
                
                subi.w  #1,(a0)
                addq.w  #8,a0
                dbf     d1,@MoveGroundToPosition_Loop
@WaitForNextFrame:
                
                jsr     (WaitForVInt).w
                dbf     d0,@MoveActorsToPosition_Loop
@WaitForFadeIn:
                
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   @WaitForFadeIn
                
                rts

    ; End of function InitializeBattlescene

