
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_0.asm :
; 0x18010..0x197C8 : Battlescene engine

; =============== S U B R O U T I N E =======================================


nullsub_18010:
            if (VANILLA_BUILD=1)
                rts
            endif

    ; End of function nullsub_18010


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy index
;     d1.w = ally index


InitializeBattlescene:
                
                lea     ((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w,a0
                move.l  #byte_FFB59A,d2 
                subi.l  #BATTLESCENE_BACKGROUND_MODIFICATION_POINTER,d2
                lsr.l   #2,d2
                subq.w  #1,d2
@ClearBattlesceneData_Loop:
                
                clr.l   (a0)+
                dbf     d2,@ClearBattlesceneData_Loop
                
                move.w  d1,-(sp)
                move.w  d0,((BATTLESCENE_ENEMY-$1000000)).w
                bsr.w   GetBattlespriteAndPalette
                move.w  d1,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w
                move.w  d2,((BATTLESCENE_ENEMYBATTLEPALETTE-$1000000)).w
                move.w  d3,((BATTLESCENE_ENEMYBATTLEANIMATION-$1000000)).w
                move.w  (sp)+,d0
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
                moveq   #63,d0
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
                
                bsr.w   sub_1EF36       
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
                bsr.w   sub_1955E
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
                move.b  #$20,((byte_FFB580-$1000000)).w 
                jsr     (EnableInterrupts).w
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                move.w  #-44,d6
                bsr.w   sub_1F1CC
                clr.w   d6
                bsr.w   sub_1F1F0
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
                bsr.w   sub_1F1CC
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


; =============== S U B R O U T I N E =======================================


ExecuteBattlesceneScript:
                
                module
                lea     (FF0000_RAM_START).l,a6
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                move.b  #-1,((DEAD_COMBATANTS_LIST-$1000000)).w
                clr.b   ((ACTOR_TO_MAKE_IDLE-$1000000)).w
@Loop:
                
                move.w  (a6)+,d0
                cmpi.w  #-1,d0
                beq.s   @End
                add.w   d0,d0
                move.w  rjt_BattlesceneScriptCommands(pc,d0.w),d0
                jsr     rjt_BattlesceneScriptCommands(pc,d0.w)
                bra.s   @Loop
rjt_BattlesceneScriptCommands:
                
                dc.w bsc00_animateEnemyAction-rjt_BattlesceneScriptCommands
                dc.w bsc01_animateAllyAction-rjt_BattlesceneScriptCommands
                dc.w bsc02_moveEnemyBattlesprite-rjt_BattlesceneScriptCommands
                dc.w bsc03_moveAllyBattlesprite-rjt_BattlesceneScriptCommands
                dc.w bsc04_makeEnemyIdle-rjt_BattlesceneScriptCommands
                dc.w bsc05_makeAllyIdle-rjt_BattlesceneScriptCommands
                dc.w bsc06_switchEnemies-rjt_BattlesceneScriptCommands
                dc.w bsc07_switchAllies-rjt_BattlesceneScriptCommands
                dc.w bsc08_switchToEnemyAlone-rjt_BattlesceneScriptCommands
                dc.w bsc09_switchToAllyAlone-rjt_BattlesceneScriptCommands
                dc.w bsc0A_executeEnemyReaction-rjt_BattlesceneScriptCommands
                dc.w bsc0B_executeAllyReaction-rjt_BattlesceneScriptCommands
                dc.w bsc0C_makeActorIdleAndEndAnimation-rjt_BattlesceneScriptCommands
                dc.w bsc0D_endAnimation-rjt_BattlesceneScriptCommands
                dc.w bsc0E_sleep-rjt_BattlesceneScriptCommands
                dc.w bsc0F_giveExp-rjt_BattlesceneScriptCommands
                dc.w bsc10_displayMessage-rjt_BattlesceneScriptCommands
                dc.w bsc11_displayMessageWithNoWait-rjt_BattlesceneScriptCommands
                dc.w bsc12_closeTextBox-rjt_BattlesceneScriptCommands
                dc.w bsc13_waitForPlayerInput-rjt_BattlesceneScriptCommands
                dc.w bsc14_nullCommand-rjt_BattlesceneScriptCommands
@End:
                
                clr.w   d0
                rts

    ; End of function ExecuteBattlesceneScript

                modend

; =============== S U B R O U T I N E =======================================


bsc13_waitForPlayerInput:
                
                jmp     (WaitForPlayerInput).w

    ; End of function bsc13_waitForPlayerInput


; =============== S U B R O U T I N E =======================================


bsc14_nullCommand:
                
                rts

    ; End of function bsc14_nullCommand


; =============== S U B R O U T I N E =======================================

; xx      animation type index (0000 for attack, 0001 for dodge, 0002 for magic/item -- others (i.e. MMNK crit, RBT laser, BRGN flashing)
; yy      magic/item/projectile animation index, set $0080 to come from enemy


bsc00_animateEnemyAction:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.w   EndBattlesceneAnimation
                cmpi.w  #-1,(a6)
                beq.w   AnimateSpell
                
                move.b  #2,((ACTOR_TO_MAKE_IDLE-$1000000)).w
                bclr    #3,((byte_FFB56E-$1000000)).w
                bclr    #5,((byte_FFB56E-$1000000)).w
                move.w  (a6)+,d1
                bsr.w   GetEnemyAnimation
                clr.w   d7
                move.b  (a0)+,d7
                clr.w   d6
                move.b  (a0)+,d6
                move.w  (a6)+,d5
                move.b  (a0)+,d0
                move.w  #$80,d3 
                bsr.w   sub_184B0
                clr.w   d4
                move.b  (a0)+,d4
                move.w  d4,-(sp)
                tst.w   d6
                bne.s   loc_1844E
                move.l  a0,-(sp)
                movem.w d5-d7,-(sp)
                move.w  d5,d0
                bsr.w   SetupSpellanimation
                movem.w (sp)+,d5-d7
                movea.l (sp)+,a0
loc_1844E:
                
                move.w  d7,d0
                sub.w   d6,d0
                move.w  d0,d6
                subq.w  #1,d7
                bmi.w   loc_18496
loc_1845A:
                
                move.b  (a0)+,d0
                ext.w   d0
                clr.w   d3
                move.b  (a0)+,d3
                move.w  (a0)+,d1
                move.w  d3,-(sp)
                move.l  a0,-(sp)
                movem.w d5-d7,-(sp)
                bsr.w   sub_19464
                movem.w (sp)+,d5-d7
                movea.l (sp)+,a0
                cmp.w   d7,d6
                bne.s   loc_1848C
                move.l  a0,-(sp)
                movem.w d5-d7,-(sp)
                move.w  d5,d0
                bsr.w   SetupSpellanimation
                movem.w (sp)+,d5-d7
                movea.l (sp)+,a0
loc_1848C:
                
                move.w  (sp)+,d0
                jsr     (Sleep).w       
                dbf     d7,loc_1845A
loc_18496:
                
                move.w  (sp)+,d0
                bne.w   bsc0D_endAnimation
                rts

    ; End of function bsc00_animateEnemyAction


; =============== S U B R O U T I N E =======================================


AnimateSpell:
                
                move.w  2(a6),d0
                cmpi.w  #-1,d0
                beq.s   EndBattlesceneAnimation
                bsr.w   SetupSpellanimation

    ; End of function AnimateSpell


; START OF FUNCTION CHUNK FOR bsc00_animateEnemyAction

EndBattlesceneAnimation:
                
                addq.w  #4,a6
                rts

; END OF FUNCTION CHUNK FOR bsc00_animateEnemyAction


; =============== S U B R O U T I N E =======================================


sub_184B0:
                
                cmpi.w  #1,d1
                beq.w   @loc_4
                cmpi.w  #2,d1
                beq.w   @Return
                tst.w   d5
                beq.w   @loc_1
                cmpi.w  #-1,d5
                bne.w   @Return
@loc_1:
                
                cmpi.b  #-1,d0
                bne.s   @loc_2
                ext.w   d0
                bra.s   @loc_3
@loc_2:
                
                andi.w  #BYTE_MASK,d0
@loc_3:
                
                move.w  d0,d5
                rts
@loc_4:
                
                move.w  d3,d5
                ori.w   #%111000,d5
@Return:
                
                rts

    ; End of function sub_184B0


; =============== S U B R O U T I N E =======================================

; xx      animation type index (0000 for attack, 0001 for dodge, 0002 for magic/item -- others (i.e. MMNK crit, RBT laser, BRGN flashing)
; yy      magic/item/projectile animation index, set $0080 to come from enemy


bsc01_animateAllyAction:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   EndBattlesceneAnimation
                cmpi.w  #-1,(a6)
                beq.s   AnimateSpell
                
                move.b  #1,((ACTOR_TO_MAKE_IDLE-$1000000)).w
                bclr    #1,((byte_FFB56E-$1000000)).w
                bclr    #4,((byte_FFB56E-$1000000)).w
                move.w  (a6)+,d1        ; animation type
                bsr.w   GetAllyAnimation
                clr.w   d7
                move.b  (a0)+,d7
                clr.w   d6
                move.b  (a0)+,d6
                move.w  (a6)+,d5        ; magic/item/projectile animation
                move.b  (a0)+,d0
                clr.w   d3
                bsr.s   sub_184B0
                clr.w   d4
                move.b  (a0)+,d4
                lea     $C(a0),a0
                move.w  d4,-(sp)
                tst.w   d6
                bne.s   loc_1853E
                move.l  a0,-(sp)
                movem.w d5-d7,-(sp)
                move.w  d5,d0
                bsr.w   SetupSpellanimation
                movem.w (sp)+,d5-d7
                movea.l (sp)+,a0
loc_1853E:
                
                move.w  d7,d0
                sub.w   d6,d0
                move.w  d0,d6
                subq.w  #2,d7
                bmi.w   loc_185C0
loc_1854A:
                
                move.b  (a0)+,d0
                ext.w   d0
                clr.w   d3
                move.b  (a0)+,d3
                move.w  (a0)+,d1
                move.l  (a0)+,((WEAPON_FRAME_INDEX-$1000000)).w
                move.w  d3,-(sp)
                move.l  a0,-(sp)
                movem.w d5-d7,-(sp)
                bsr.w   sub_19366
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.s   loc_18596
                
                clr.w   d0
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d0
                andi.w  #7,d0
                ror.w   #5,d0
                lea     (FF2000_LOADING_SPACE).l,a0
                adda.w  d0,a0
                lea     ($D800).l,a1
                move.w  #$400,d0
                move.w  #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
loc_18596:
                
                movem.w (sp)+,d5-d7
                movea.l (sp)+,a0
                cmp.w   d7,d6
                bne.s   loc_185B2
                move.l  a0,-(sp)
                movem.w d5-d7,-(sp)
                move.w  d5,d0
                bsr.w   SetupSpellanimation
                movem.w (sp)+,d5-d7
                movea.l (sp)+,a0
loc_185B2:
                
                jsr     (sub_1942).w    
                move.w  (sp)+,d0
                jsr     (Sleep).w       
                dbf     d7,loc_1854A
loc_185C0:
                
                move.w  (sp)+,d4
                bne.w   bsc0D_endAnimation
                rts

    ; End of function bsc01_animateAllyAction


; =============== S U B R O U T I N E =======================================

; like previous bsc but for battlescene ally


bsc03_moveAllyBattlesprite:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   @Return
                
                move.w  (a6)+,((BATTLESCENE_ALLY_X_SPEED-$1000000)).w
                move.w  (a6),((BATTLESCENE_ALLY_Y_SPEED-$1000000)).w
                jsr     (WaitForVInt).w
@Return:
                
                rts

    ; End of function bsc03_moveAllyBattlesprite


; =============== S U B R O U T I N E =======================================

; set a long value at FFB3F6, related to battlescene enemy


bsc02_moveEnemyBattlesprite:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   @Return
                
                move.w  (a6)+,((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w
                move.w  (a6),((BATTLESCENE_ENEMY_Y_SPEED-$1000000)).w 
                                                        ; no + ... is it the next bsc ?
                jsr     (WaitForVInt).w
@Return:
                
                rts

    ; End of function bsc02_moveEnemyBattlesprite


; =============== S U B R O U T I N E =======================================


bsc05_makeAllyIdle:
                
                btst    #4,((byte_FFB56F-$1000000)).w
                bne.w   loc_1A418
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.w   return_18698
                
                bclr    #1,((byte_FFB56E-$1000000)).w
                move.l  ((WEAPON_IDLE_FRAME1_INDEX-$1000000)).w,((WEAPON_FRAME_INDEX-$1000000)).w
                bsr.w   ApplyStatusEffectsToAllyAnimation
                btst    #0,((byte_FFB56E-$1000000)).w
                beq.s   loc_18624
                clr.w   d0
                bra.s   loc_1862E
loc_18624:
                
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattlespriteIdleAnimate
                move.w  d1,d0
loc_1862E:
                
                clr.w   d1
                bsr.w   sub_1938C
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.s   loc_18664
                
                lea     (FF2000_LOADING_SPACE).l,a0
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d0
                andi.w  #7,d0
                ror.w   #5,d0
                adda.w  d0,a0
                lea     ($D800).l,a1
                move.w  #$400,d0
                move.w  #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
loc_18664:
                
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,d0
                jsr     (Sleep).w       
                btst    #0,((byte_FFB56E-$1000000)).w
                beq.s   loc_18678
                clr.w   d0
                bra.s   loc_18682
loc_18678:
                
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattlespriteIdleAnimate
                move.w  d1,d0
loc_18682:
                
                clr.w   d1
                bsr.w   sub_1938C
                jsr     (sub_1942).w    
                bset    #1,((byte_FFB56E-$1000000)).w
                bset    #4,((byte_FFB56E-$1000000)).w
return_18698:
                
                rts

    ; End of function bsc05_makeAllyIdle


; =============== S U B R O U T I N E =======================================

; related to battlescene enemy


bsc04_makeEnemyIdle:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   return_186D8
                
                bclr    #3,((byte_FFB56E-$1000000)).w
                bsr.w   ApplyStatusEffectsToEnemyAnimation
                clr.w   d0
                clr.w   d1
                bsr.w   sub_19464
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,d0
                jsr     (Sleep).w       
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                bsr.w   GetEnemyBattlespriteIdleAnimate
                move.w  d1,d0
                clr.w   d1
                bsr.w   sub_19464
                bset    #3,((byte_FFB56E-$1000000)).w
                bset    #5,((byte_FFB56E-$1000000)).w
return_186D8:
                
                rts

    ; End of function bsc04_makeEnemyIdle


; =============== S U B R O U T I N E =======================================

; xx      Combatant index
; yy      0000 for right side, 0001 for left side


bsc07_switchAllies:
                
                module
                cmpi.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                beq.s   bsc07_switchAllies ; loop as long as value 1
                
                move.b  #2,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bclr    #1,((byte_FFB56E-$1000000)).w
                move.w  (a6)+,d7
                move.w  (a6)+,d6
                move.w  d7,d0
                cmpi.w  #-1,d0
                beq.s   loc_18736
                
                bsr.w   GetBattlespriteAndPalette ; d0.w -> d1.w, d2.w
                
                disableSramAndSwitchRomBanks
                move.w  d1,d0
                bsr.w   LoadNewAllyBattlesprite
                move.w  d1,d0
                move.w  d2,d1
                bsr.w   LoadAllyBattlespritePropertiesAndPalette
                
                restoreRomBanksAndEnableSram
                move.w  d7,d0
                bsr.w   GetBattlesceneGround
                cmpi.w  #-1,d1
                beq.s   @Weaponsprite
                
                disableSram
                move.w  d1,d0
                bsr.w   LoadBattlesceneGround
                
                enableSram
@Weaponsprite:
                
                move.w  d7,d0
                bsr.w   GetWeaponspriteAndPalette
                cmpi.w  #-1,d2
                beq.s   loc_18736
                
                disableSramAndSwitchRomBanks
                move.w  d2,d0
                bsr.w   LoadWeaponsprite
                move.w  d3,d0
                bsr.w   LoadWeaponPalette
                
                restoreRomBanksAndEnableSram
loc_18736:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   loc_18754
                
                ; Is mirrored?
                btst    #1,d6
                bne.s   @Mirrored
                move.w  #400,d1
                bra.s   loc_1874E
@Mirrored:
                
                move.w  #16,d1
loc_1874E:
                
                bsr.w   SwitchAllyBattlesprite
                bra.s   loc_18758
loc_18754:
                
                bsr.w   sub_19952
loc_18758:
                
                jsr     j_CloseAllyBattlesceneMiniStatusWindow
                move.w  d7,((BATTLESCENE_ALLY-$1000000)).w
                move.w  d7,d0
                bsr.w   GetBattlespriteAndPalette
                move.w  d1,((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w
                move.w  d2,((BATTLESCENE_ALLYBATTLEPALETTE-$1000000)).w
                move.w  d3,((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w
                bsr.w   GetWeaponspriteAndPalette
                move.w  d2,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                move.w  d3,((BATTLESCENE_WEAPONPALETTE-$1000000)).w
                clr.b   ((BATTLESCENE_ALLY_STATUS_ANIMATION-$1000000)).w
                andi.b  #$FC,((byte_FFB56F-$1000000)).w
                cmpi.w  #-1,d7
                beq.w   loc_19912
                
                move.w  #264,d1
                tst.w   d6
                beq.s   loc_187AA
                cmpi.w  #3,d6
                beq.s   loc_187AA
                move.w  #152,d1
                ori.b   #3,((byte_FFB56F-$1000000)).w
loc_187AA:
                
                move.w  d1,-(sp)
                cmpi.w  #3,d6
                beq.s   loc_187B8
                move.w  #$FF08,d0
                bra.s   loc_187BC
loc_187B8:
                
                move.w  #$88,d0 
loc_187BC:
                
                move.w  d0,-(sp)
                move.w  d0,-(sp)
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($2000).w,a1
                move.w  #$900,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                lea     (ALLY_BATTLESPRITE_FRAME_LOADING_SPACE).l,a0
                lea     ($3200).w,a1
                move.w  #$900,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                bsr.w   GetBattlesceneGround
                move.b  d1,((BATTLESCENE_BACKGROUND-$1000000)).w
                cmpi.w  #-1,d1
                beq.s   loc_18818
                
                lea     (FF8C02_LOADING_SPACE).l,a0
                lea     ($F000).l,a1
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
loc_18818:
                
                move.w  ((BATTLESCENE_WEAPONSPRITE-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.w   loc_1888C
                
                move.w  ((BATTLESCENE_ALLYBATTLEANIMATION-$1000000)).w,d0
                getPointer p_pt_AllyAnimations, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #4,a0
                move.l  (a0),((WEAPON_IDLE_FRAME1_INDEX-$1000000)).w
                move.l  (a0),((WEAPON_FRAME_INDEX-$1000000)).w
                move.w  $A(a0),((WEAPON_IDLE_FRAME2_X-$1000000)).w
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_18864
                moveq   #$20,d0 
                sub.b   ((WEAPON_FRAME_X-$1000000)).w,d0
                move.b  d0,((WEAPON_IDLE_FRAME1_X-$1000000)).w
                move.b  d0,((WEAPON_FRAME_X-$1000000)).w
                moveq   #$20,d0 
                sub.b   ((WEAPON_IDLE_FRAME2_X-$1000000)).w,d0
                move.b  d0,((WEAPON_IDLE_FRAME2_X-$1000000)).w
loc_18864:
                
                lea     (FF2000_LOADING_SPACE).l,a0
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d0
                andi.w  #7,d0
                ror.w   #5,d0
                adda.w  d0,a0
                lea     ($D800).l,a1
                move.w  #$400,d0
                move.w  #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
loc_1888C:
                
                bsr.w   sub_1892A
                move.w  (sp)+,d0
                clr.w   d1
                bsr.w   LoadBattlesceneAllyAndWeaponVdpSprites
                move.w  (sp)+,d0
                clr.w   d1
                bsr.w   LoadBattlesceneGroundVdpSprites
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #2,d1
                jsr     j_OpenAllyBattlesceneMiniStatusWindow
                bsr.w   ApplyStatusEffectsToAllyAnimation
                jsr     (sub_1942).w    
                move.w  (sp)+,d1
                bsr.s   SwitchAllyBattlesprite
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   loc_188CC
                
                bset    #1,((byte_FFB56E-$1000000)).w
loc_188CC:
                
                move.b  #3,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                rts

    ; End of function bsc07_switchAllies

                modend

; =============== S U B R O U T I N E =======================================

; In: d1.w = 


SwitchAllyBattlesprite:
                
                move.w  ((BATTLESCENE_ALLY_X-$1000000)).w,d0
                cmp.w   d1,d0
                beq.s   @Return
                bge.s   @MoveLeft
                sub.w   d1,d0
                neg.w   d0
                cmpi.w  #2,d0
                bls.w   @Return
                
                cmpi.w  #16,d0
                bls.s   @Goto_UpdateSpeed
                moveq   #16,d0
@Goto_UpdateSpeed:
                
                bra.s   @UpdateSpeed
@MoveLeft:
                
                sub.w   d1,d0
                cmpi.w  #2,d0
                bls.w   @Return
                cmpi.w  #16,d0
                bls.s   @loc_3
                moveq   #16,d0
@loc_3:
                
                neg.w   d0
@UpdateSpeed:
                
                move.w  d0,((BATTLESCENE_ALLY_X_SPEED-$1000000)).w
                cmpi.b  #-1,((BATTLESCENE_BACKGROUND-$1000000)).w
                beq.s   @loc_6
                lea     ((SPRITE_BATTLESCENE_GROUND_X-$1000000)).w,a0
                moveq   #2,d2
@MoveBattlesceneGround_Loop:
                
                add.w   d0,(a0)
                addq.w  #8,a0
                dbf     d2,@MoveBattlesceneGround_Loop
@loc_6:
                
                jsr     (WaitForVInt).w
                bra.s   SwitchAllyBattlesprite
@Return:
                
                rts

    ; End of function SwitchAllyBattlesprite


; =============== S U B R O U T I N E =======================================


sub_1892A:
                
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a1
                moveq   #CRAM_LONGWORDS_COUNTER,d0
@Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d0,@Loop
                
                bra.w   sub_1A092

    ; End of function sub_1892A


; =============== S U B R O U T I N E =======================================

; xx      Combatant index
; yy      0000 for right side, 0001 for left side


bsc06_switchEnemies:
                
                cmpi.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                beq.s   bsc06_switchEnemies ; loop as long as value 1
                
                move.b  #2,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                andi.b  #$C,((byte_FFB583-$1000000)).w
                bclr    #3,((byte_FFB56E-$1000000)).w
                clr.w   d6
                bsr.w   sub_1F1CC
                clr.w   d6
                bsr.w   sub_1F1F0
                lea     ((SPRITE_BATTLESCENE_GROUND_VDPTILE-$1000000)).w,a0
                bset    #7,(a0)
                bset    #7,8(a0)
                bset    #7,$10(a0)
                move.w  (a6),d0
                bsr.w   GetBattlespriteAndPalette
                
                disableSramAndSwitchRomBanks
                move.w  d1,d0
                bsr.w   LoadNewEnemyBattlesprite
                
                restoreRomBanks
                getPointer p_pt_tiles_BattlesceneTransition, a2
                movea.l (a2)+,a0
                move.l  a2,-(sp)
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                movea.l (sp)+,a2
                movea.l (a2),a0
                lea     (FF8002_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                move.w  (a6),d0
                bpl.s   loc_189AE
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
loc_189AE:
                
                enableSram
                bsr.w   GetBattlesceneBackground
                move.w  d1,d0
                
                disableSram
                move.w  d0,-(sp)
                lea     (FF2000_LOADING_SPACE).l,a1
                bsr.w   LoadBattlesceneBackground
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                jsr     j_CloseEnemyBattlesceneMiniStatusWindow
                bsr.w   LoadBattlesceneBackgroundLayout
                move.w  (sp)+,d0
                
                move.w  2(a6),d1
                bsr.w   sub_19E96
                bcc.s   loc_189DC
                moveq   #4,d1
loc_189DC:
                
                move.w  d1,-(sp)
                btst    #1,d1
                bne.s   loc_189FC
                move.w  #$FF70,d1
                clr.w   d2
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($7400).w,a1
                lea     (byte_FFC180).l,a2
                bra.s   loc_18A14
loc_189FC:
                
                move.w  #$F0,d1 
                moveq   #1,d2
                lea     (FF9202_LOADING_SPACE).l,a0
                lea     ($9E00).l,a1
                lea     (byte_FFC1B8).l,a2
loc_18A14:
                
                moveq   #7,d0
                moveq   #0,d6
loc_18A18:
                
                movem.w d0-d2,-(sp)
                bsr.w   sub_18D14
                tst.w   d2
                bne.s   loc_18A2A
                bsr.w   sub_18C1E
                bra.s   loc_18A2E
loc_18A2A:
                
                bsr.w   sub_18C94
loc_18A2E:
                
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0-d2
                dbf     d0,loc_18A18
                
                enableSram
                move.w  (a6),d0
                move.w  d0,((BATTLESCENE_ENEMY-$1000000)).w
                bsr.w   GetBattlespriteAndPalette
                move.w  d1,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w
                move.w  d2,((BATTLESCENE_ENEMYBATTLEPALETTE-$1000000)).w
                move.w  d3,((BATTLESCENE_ENEMYBATTLEANIMATION-$1000000)).w
                move.w  (sp)+,d2
                clr.b   ((BATTLESCENE_ENEMY_STATUS_ANIMATION-$1000000)).w
                bclr    #2,((byte_FFB56F-$1000000)).w
                clr.w   d1
                move.w  #$F0,d6 
                tst.w   d2
                beq.s   loc_18A7C
                cmpi.w  #3,d2
                bcc.s   loc_18A78
                move.w  #$60,d1 
                bset    #2,((byte_FFB56F-$1000000)).w
                bra.s   loc_18A7C
loc_18A78:
                
                move.w  #$FF70,d6
loc_18A7C:
                
                movem.w d1-d2,-(sp)
                bsr.w   MoveEnemyBattlespriteHorizontally
                clr.w   d6
                bsr.w   MoveEnemyBattlespriteVertically
                cmpi.w  #-1,d0
                bne.s   loc_18A96
                
                bsr.w   sub_19926
                bra.s   loc_18AAC
loc_18A96:
                
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                move.w  ((BATTLESCENE_ENEMYBATTLEPALETTE-$1000000)).w,d1
                
                disableSramAndSwitchRomBanks
                bsr.w   LoadEnemyBattlespritePropertiesAndPalette
                
                restoreRomBanksAndEnableSram
                bset    #2,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1EF2E
loc_18AAC:
                
                lea     ((BATTLESCENE_BACKGROUND_PALETTE-$1000000)).w,a0
                lea     ((PALETTE_4_BASE-$1000000)).w,a1
                moveq   #7,d0
loc_18AB6:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_18AB6
                
                bsr.w   sub_1892A
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   loc_18ACE
                
                bsr.w   ApplyStatusEffectsToEnemyAnimation
loc_18ACE:
                
                movem.w (sp)+,d1-d2
                cmpi.w  #3,d2
                bcc.s   loc_18AEC
                clr.w   d2
                lea     (FF2000_LOADING_SPACE).l,a0
                lea     ($7400).w,a1
                lea     (byte_FFC180).l,a2
                bra.s   loc_18AFE
loc_18AEC:
                
                lea     (byte_FF4A00).l,a0
                lea     ($9E00).l,a1
                lea     (byte_FFC1B8).l,a2
loc_18AFE:
                
                jsr     (WaitForVInt).w
                moveq   #7,d0
                clr.w   d3
                moveq   #0,d6
loc_18B08:
                
                movem.w d0-d3,-(sp)
                bsr.w   sub_18BAA
                bsr.w   sub_18D14
                tst.w   d2
                bne.s   loc_18B1E
                bsr.w   sub_18C1E
                bra.s   loc_18B22
loc_18B1E:
                
                bsr.w   sub_18C94
loc_18B22:
                
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0-d3
                addq.w  #1,d3
                dbf     d0,loc_18B08
loc_18B30:
                
                bsr.w   sub_18D14
                jsr     (WaitForVInt).w
                tst.w   d0
                bne.s   loc_18B30
                lea     ((SPRITE_BATTLESCENE_GROUND_VDPTILE-$1000000)).w,a0
                bclr    #7,(a0)
                bclr    #7,8(a0)
                bclr    #7,$10(a0)
                clr.w   d6
                bsr.w   sub_1F1CC
                jsr     (WaitForVInt).w
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   loc_18B8C
                
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #4,d1
                jsr     j_OpenEnemyBattlesceneMiniStatusWindow
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                bsr.w   GetEnemyBattlespriteIdleAnimate
                lea     ($5C00).w,a1
                bsr.w   LoadEnemyBattlespriteFrameAndWaitForDma
                bsr.w   sub_1F540
                bset    #3,((byte_FFB56E-$1000000)).w
loc_18B8C:
                
                ori.b   #3,((byte_FFB583-$1000000)).w
                move.w  ((BATTLESCENE_WEAPONSPRITE-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   loc_18BA0
                
                disableSramAndSwitchRomBanks
                bsr.w   LoadWeaponsprite
                
                restoreRomBanksAndEnableSram
loc_18BA0:
                
                addq.w  #4,a6
                move.b  #3,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                rts

    ; End of function bsc06_switchEnemies


; =============== S U B R O U T I N E =======================================


sub_18BAA:
                
                cmpi.w  #3,d3
                bhi.s   return_18BFC
                movem.l d0-d2/a0-a2,-(sp)
                lea     table_18BFE(pc), a0
                nop
                lsl.w   #3,d3
                movea.l 4(a0,d3.w),a1
                movea.l (a0,d3.w),a0
                cmpi.w  #8,d3
                beq.s   loc_18BD6
                
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                bra.s   loc_18BF4
loc_18BD6:
                
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                lea     (FF9802_LOADING_SPACE).l,a0
                lea     ($4C00).w,a1
                move.w  #$200,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
loc_18BF4:
                
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0-d2/a0-a2
return_18BFC:
                
                rts

    ; End of function sub_18BAA

table_18BFE:    dc.l FF5000_LOADING_SPACE
                dc.l $4400
                dc.l FF5600_LOADING_SPACE
                dc.l $4A00
                dc.l FF9C02_LOADING_SPACE
                dc.l $5000
                dc.l FFA202_LOADING_SPACE
                dc.l $5600

; =============== S U B R O U T I N E =======================================


sub_18C1E:
                
                subi.w  #$20,d6 
                move.w  d6,-(sp)
                bsr.w   sub_1F1CC
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l a0-a2,-(sp)
                bchg    #7,(a2)
                bchg    #7,2(a2)
                bchg    #7,4(a2)
                bchg    #7,6(a2)
                lea     $40(a2),a2
                moveq   #$B,d0
                move.b  #$A0,d1
loc_18C5A:
                
                eor.b   d1,(a2)
                eor.b   d1,2(a2)
                eor.b   d1,4(a2)
                eor.b   d1,6(a2)
                lea     $40(a2),a2
                dbf     d0,loc_18C5A
                lea     (byte_FFC180).l,a0
                lea     ($C180).l,a1
                move.w  #$1A0,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,a0-a2
                addq.w  #8,a2
                move.w  (sp)+,d6
                rts

    ; End of function sub_18C1E


; =============== S U B R O U T I N E =======================================


sub_18C94:
                
                addi.w  #$20,d6 
                move.w  d6,-(sp)
                bsr.w   sub_1F1CC
                movem.l a0-a2,-(sp)
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                bchg    #7,(a2)
                bchg    #7,2(a2)
                bchg    #7,4(a2)
                bchg    #7,6(a2)
                lea     $40(a2),a2
                moveq   #$B,d0
                move.b  #$A0,d1
loc_18CD0:
                
                eor.b   d1,(a2)
                eor.b   d1,2(a2)
                eor.b   d1,4(a2)
                eor.b   d1,6(a2)
                lea     $40(a2),a2
                dbf     d0,loc_18CD0
                lea     (byte_FFC180).l,a0
                lea     ($C180).l,a1
                move.w  #$1A0,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,a0-a2
                lea     -$600(a0),a0
                lea     -$600(a1),a1
                lea     -8(a2),a2
                move.w  (sp)+,d6
                rts

    ; End of function sub_18C94


; =============== S U B R O U T I N E =======================================


sub_18D14:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   loc_18D56
                
                move.w  ((word_FFB3EC-$1000000)).w,d0
                cmp.w   d1,d0
                beq.s   loc_18D56
                bge.s   loc_18D3C
                sub.w   d1,d0
                neg.w   d0
                cmpi.w  #2,d0
                bls.w   loc_18D56
                cmpi.w  #$10,d0
                bls.s   loc_18D3A
                moveq   #$10,d0
loc_18D3A:
                
                bra.s   loc_18D50
loc_18D3C:
                
                sub.w   d1,d0
                cmpi.w  #2,d0
                bls.w   loc_18D56
                cmpi.w  #$10,d0
                bls.s   loc_18D4E
                moveq   #$10,d0
loc_18D4E:
                
                neg.w   d0
loc_18D50:
                
                move.w  d0,((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w
                rts
loc_18D56:
                
                clr.w   d0
                rts

    ; End of function sub_18D14


; =============== S U B R O U T I N E =======================================

; xx enemy index


bsc08_switchToEnemyAlone:
                
                move.w  (a6)+,((word_FFB3FE-$1000000)).w
                move.l  a6,-(sp)
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  #-1,(a6)
                clr.w   2(a6)
                bsr.w   bsc07_switchAllies
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  ((word_FFB3FE-$1000000)).w,(a6)
                move.w  #3,2(a6)
                bsr.w   bsc06_switchEnemies
                bset    #5,((byte_FFB56E-$1000000)).w
                movea.l (sp)+,a6
                rts

    ; End of function bsc08_switchToEnemyAlone


; =============== S U B R O U T I N E =======================================

; xx ally index


bsc09_switchToAllyAlone:
                
                move.w  (a6)+,((word_FFB3FE-$1000000)).w
                move.l  a6,-(sp)
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  #-1,(a6)
                clr.w   2(a6)
                bsr.w   bsc06_switchEnemies
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  ((word_FFB3FE-$1000000)).w,(a6)
                move.w  #3,2(a6)
                bsr.w   bsc07_switchAllies
                bset    #4,((byte_FFB56E-$1000000)).w
                movea.l (sp)+,a6
                rts

    ; End of function bsc09_switchToAllyAlone


; =============== S U B R O U T I N E =======================================

; same parameters as previous command


bsc0B_executeAllyReaction:
                
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #-1,d0
                bne.s   loc_18DCC
                
                addq.w  #8,a6
                rts
loc_18DCC:
                
                tst.b   ((byte_FFB588-$1000000)).w
                bne.s   loc_18DCC
                move.w  (a6)+,d1
                move.w  d1,-(sp)
                bmi.s   loc_18DE0
                jsr     j_IncreaseCurrentHp
                bra.s   loc_18DE8
loc_18DE0:
                
                neg.w   d1
                jsr     j_DecreaseCurrentHp
loc_18DE8:
                
                move.w  (a6)+,d1
                bmi.s   loc_18DF4
                jsr     j_IncreaseCurrentMp
                bra.s   loc_18DFC
loc_18DF4:
                
                neg.w   d1
                jsr     j_DecreaseCurrentMp
loc_18DFC:
                
                move.w  (a6)+,d1
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                bsr.w   ApplyStatusEffectsToAllyAnimation
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #2,d1
                jsr     j_OpenAllyBattlesceneMiniStatusWindow
                move.w  (sp)+,d1
                move.w  (a6)+,d0
                subq.w  #1,d0
                beq.s   loc_18E30
                subq.w  #1,d0
                beq.w   byte_18F48
                rts
loc_18E30:
                
                cmpi.w  #$8000,d1
                beq.w   loc_18F26
                sndCom  SFX_LIGHTNING_1
                bclr    #1,((byte_FFB56E-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,d0
                move.w  d0,-(sp)
                move.b  #1,((FADING_COUNTER_MAX-$1000000)).w
                move.b  #FLASH_QUICKLY_1,((FADING_SETTING-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  #1,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.w  ((word_FFB3EC-$1000000)).w,d4
                move.w  ((word_FFB3F0-$1000000)).w,d5
                moveq   #$B,d0
loc_18E6E:
                
                movem.w d0/d4-d5,-(sp)
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #2,d7
                asl.w   #1,d7
                move.w  d7,d6
                move.w  d7,-(sp)
                bsr.w   sub_1F1CC
                add.w   d4,d6
                bsr.w   MoveEnemyBattlespriteHorizontally
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #2,d7
                asl.w   #1,d7
                move.w  d7,d6
                move.w  d7,d1
                neg.w   d1
                bsr.w   sub_1F1F0
                add.w   d5,d6
                bsr.w   MoveEnemyBattlespriteVertically
                move.w  (sp)+,d0
                movem.w d0-d1,-(sp)
                bsr.w   LoadBattlesceneAllyAndWeaponVdpSprites
                movem.w (sp)+,d0-d1
                bsr.w   LoadBattlesceneGroundVdpSprites
                jsr     (sub_1942).w    
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0/d4-d5
                dbf     d0,loc_18E6E
                clr.w   d6
                bsr.w   sub_1F1CC
                bsr.w   sub_1F1F0
                move.w  d4,d6
                bsr.w   MoveEnemyBattlespriteHorizontally
                move.w  d5,d6
                bsr.w   MoveEnemyBattlespriteVertically
                clr.w   d1
                bsr.w   sub_1939E
                clr.w   d1
                bsr.w   sub_194FE
                jsr     (sub_1942).w    
                cmpi.b  #SPELLANIMATION_GUNNER_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                beq.s   loc_18EF8
                bsr.w   sub_1A092
loc_18EF8:
                
                move.w  (sp)+,d0
                move.b  d0,((FADING_COUNTER_MAX-$1000000)).w
                jsr     (WaitForVInt).w
                bset    #1,((byte_FFB56E-$1000000)).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   return_18F24
                bsr.w   AddAllyToDeadList
                bsr.w   sub_195FE
                move.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
return_18F24:
                
                rts
loc_18F26:
                
                cmpi.b  #SPELLANIMATION_DESOUL,((CURRENT_SPELLANIMATION-$1000000)).w
                bne.s   loc_18F38
                addq.w  #1,((dword_FFB536-$1000000)).w
                moveq   #20,d0
                jsr     (Sleep).w       
loc_18F38:
                
                bsr.w   AddAllyToDeadList
                bsr.w   sub_195FE
                move.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                rts
byte_18F48:
                
                sndCom  SFX_HEALING
                rts

    ; End of function bsc0B_executeAllyReaction


; =============== S U B R O U T I N E =======================================

; Byte 00-01      HP change, signed.
; Byte 02-03      MP change, signed.
; Byte 04-05      Set status bytes.
; Byte 06-07      Flags - 0x0001 enemy flash/sound


bsc0A_executeEnemyReaction:
                
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #-1,d0
                bne.s   loc_18F5C
                
                addq.w  #8,a6
                rts
loc_18F5C:
                
                tst.b   ((byte_FFB588-$1000000)).w
                bne.s   loc_18F5C
                bclr    #1,((byte_FFB583-$1000000)).w
                move.w  (a6)+,d1
                move.w  d1,-(sp)
                bmi.s   loc_18F76
                jsr     j_IncreaseCurrentHp
                bra.s   loc_18F7E
loc_18F76:
                
                neg.w   d1
                jsr     j_DecreaseCurrentHp
loc_18F7E:
                
                move.w  (a6)+,d1
                bmi.s   loc_18F8A
                jsr     j_IncreaseCurrentMp
                bra.s   loc_18F92
loc_18F8A:
                
                neg.w   d1
                jsr     j_DecreaseCurrentMp
loc_18F92:
                
                move.w  (a6)+,d1
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                bsr.w   ApplyStatusEffectsToEnemyAnimation
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #4,d1
                jsr     j_OpenEnemyBattlesceneMiniStatusWindow
                move.w  (sp)+,d1
                move.w  (a6)+,d0
                subq.w  #1,d0
                beq.s   loc_18FC6
                subq.w  #1,d0
                beq.w   byte_19098
                rts
loc_18FC6:
                
                cmpi.w  #$8000,d1
                beq.w   loc_19076
                sndCom  SFX_HIT_1
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,d0
                move.w  d0,-(sp)
                move.b  #1,((FADING_COUNTER_MAX-$1000000)).w
                move.b  #FLASH_QUICKLY_1,((FADING_SETTING-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  #%10,((FADING_PALETTE_BITFIELD-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.w  ((word_FFB3EC-$1000000)).w,d4
                move.w  ((word_FFB3F0-$1000000)).w,d5
                moveq   #$B,d0
loc_19004:
                
                moveq   #7,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #3,d7
                asl.w   #1,d7
                move.w  d7,d6
                add.w   d4,d6
                bsr.w   MoveEnemyBattlespriteHorizontally
                moveq   #7,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #3,d7
                asl.w   #1,d7
                move.w  d7,d6
                add.w   d5,d6
                bsr.w   MoveEnemyBattlespriteVertically
                jsr     (WaitForVInt).w
                dbf     d0,loc_19004
                move.w  d4,d6
                bsr.w   MoveEnemyBattlespriteHorizontally
                move.w  d5,d6
                bsr.w   MoveEnemyBattlespriteVertically
                cmpi.b  #SPELLANIMATION_GUNNER_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                beq.s   loc_19048
                bsr.w   sub_1A092
loc_19048:
                
                move.w  (sp)+,d0
                move.b  d0,((FADING_COUNTER_MAX-$1000000)).w
                jsr     (WaitForVInt).w
                bset    #3,((byte_FFB56E-$1000000)).w
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   return_19074
                bsr.w   AddEnemyToDeadList
                bsr.w   sub_196D4
                move.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
return_19074:
                
                rts
loc_19076:
                
                cmpi.b  #SPELLANIMATION_DESOUL,((CURRENT_SPELLANIMATION-$1000000)).w
                bne.s   loc_19088
                addq.w  #1,((dword_FFB536-$1000000)).w
                moveq   #20,d0
                jsr     (Sleep).w       
loc_19088:
                
                bsr.w   AddEnemyToDeadList
                bsr.w   sub_196D4
                move.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                rts
byte_19098:
                
                sndCom  SFX_HEALING
                bset    #1,((byte_FFB583-$1000000)).w
                rts

    ; End of function bsc0A_executeEnemyReaction


; =============== S U B R O U T I N E =======================================


bsc0C_makeActorIdleAndEndAnimation:
                
                bsr.w   MakeActorIdle   
                move.b  #3,((byte_FFB585-$1000000)).w
                jsr     (WaitForVInt).w
                bsr.w   RestorePalettes
                bsr.w   sub_1F2F6
                jmp     (WaitForVInt).w

    ; End of function bsc0C_makeActorIdleAndEndAnimation


; =============== S U B R O U T I N E =======================================


bsc0D_endAnimation:
                
                move.b  #2,((byte_FFB585-$1000000)).w
loc_190C4:
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w ; wait for byte cleared
                bne.s   loc_190C4       
                bsr.w   RestorePalettes
                bsr.w   sub_1F2F6
                jmp     (WaitForVInt).w

    ; End of function bsc0D_endAnimation


; =============== S U B R O U T I N E =======================================


bsc0E_sleep:
                
                move.w  (a6)+,d0
                jmp     (Sleep).w       

    ; End of function bsc0E_sleep


; =============== S U B R O U T I N E =======================================

; Byte 00-01      Amount of EXP.


bsc0F_giveExp:
                
                moveq   #0,d1
                move.w  (a6)+,d1
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.w   return_191DE
                
                move.l  d1,-(sp)
                andi.w  #$7FFF,d1
                jsr     j_IncreaseExp
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  (sp)+,d1
                btst    #$F,d1
                bne.s   loc_1910C
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     263             ; "{NAME} earned {#}{N}EXP. points.{D1}"
loc_1910C:
                
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                jsr     j_GetCurrentExp
                subi.w  #$64,d1 
                bcs.w   return_191DE
                jsr     j_SetCurrentExp
                jsr     j_LevelUp
                clr.w   (CURRENT_SPEECH_SFX).l
                lea     (LEVELUP_ARGUMENTS).l,a5
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                moveq   #0,d0
                move.b  (a5)+,d0
                cmpi.b  #-1,d0
                beq.w   return_191DE
                
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #2,d1
                jsr     j_OpenAllyBattlesceneMiniStatusWindow
                sndCom  SFX_LEVEL_UP
                txt     244             ; "{NAME} became{N}level {#}!"
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_19174
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     266             ; "{D1}HP increased by {#}!"
loc_19174:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_19182
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     267             ; "{D1}MP increased by {#}!"
loc_19182:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_19190
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     268             ; "{D1}Attack increased by {#}!"
loc_19190:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_1919E
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     269             ; "{D1}Defense increased by {#}!"
loc_1919E:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_191AC
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     270             ; "{D1}Agility increased by {#}!"
loc_191AC:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                cmpi.b  #-1,d0
                beq.s   return_191DE
                
                move.l  d0,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                lsr.w   #SPELLENTRY_OFFSET_LV,d1
                bne.s   loc_191D0
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  d0,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     271             ; "{D1}{NAME} learned the new{N}magic spell {SPELL}!"
                bra.s   return_191DE
loc_191D0:
                
                addq.w  #1,d1
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     272             ; "{D1}{SPELL} increased to{N}level {#}!"
return_191DE:
                
                rts

    ; End of function bsc0F_giveExp


; =============== S U B R O U T I N E =======================================

;         Byte 00-01      Main string index.
;         Byte 02-03      Character name index.
;         Byte 04-05      Magic/item index.
;         Byte 06-09      Number.


bsc10_displayMessage:
                
                move.w  (a6)+,d0
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  (a6)+,((DIALOGUE_NUMBER-$1000000)).w
                clr.w   (CURRENT_SPEECH_SFX).l
                checkSavedByte #0, NO_BATTLE_MESSAGES_TOGGLE
                bne.s   loc_1920C
                jsr     (DisplayText).l 
                checkSavedByte #0, MESSAGE_SPEED
                bne.s   loc_1920C
                txt     362             ; "{DICT}{W2}"
                rts
loc_1920C:
                
                clr.w   d0
                getSavedByte MESSAGE_SPEED, d0
                moveq   #8,d1
                sub.w   d0,d1
                clr.w   d0
                bset    d1,d0
loc_1921A:
                
                tst.b   ((PLAYER_1_INPUT-$1000000)).w
                bne.s   return_19228
                jsr     (WaitForVInt).w
                dbf     d0,loc_1921A
return_19228:
                
                rts

    ; End of function bsc10_displayMessage


; =============== S U B R O U T I N E =======================================

; same parameters as previous command


bsc11_displayMessageWithNoWait:
                
                move.w  (a6)+,d0
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  (a6)+,((DIALOGUE_NUMBER-$1000000)).w
                clr.w   (CURRENT_SPEECH_SFX).l
                jmp     (DisplayText).l 

    ; End of function bsc11_displayMessageWithNoWait


; =============== S U B R O U T I N E =======================================


bsc12_closeTextBox:
                
                jmp     (CloseDialogueWindow).l

    ; End of function bsc12_closeTextBox


; =============== S U B R O U T I N E =======================================


EndBattlescene:
                
                module
                clr.w   d0
                getSavedByte MESSAGE_SPEED, d0
                moveq   #7,d1
                sub.w   d0,d1
                clr.w   d0
                bset    d1,d0
@WaitForInput:
                
                tst.b   ((PLAYER_1_INPUT-$1000000)).w
                bne.s   byte_19266
                jsr     (WaitForVInt).w
                dbf     d0,@WaitForInput
byte_19266:
                
                sndCom  SOUND_COMMAND_FADE_OUT
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   @Enemy
                jsr     j_CloseAllyBattlesceneMiniStatusWindow
@Enemy:
                
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   @Return
                
                jsr     j_CloseEnemyBattlesceneMiniStatusWindow
@Return:
                
                rts

    ; End of function EndBattlescene

                modend

; =============== S U B R O U T I N E =======================================


ApplyStatusEffectsToAnimations:
                
                bsr.w   ApplyStatusEffectsToAllyAnimation
                bsr.s   ApplyStatusEffectsToEnemyAnimation
                bra.w   UpdateStatusEffectAnimations

    ; End of function ApplyStatusEffectsToAnimations


; =============== S U B R O U T I N E =======================================


ApplyStatusEffectsToEnemyAnimation:
                
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                clr.w   d2
                cmpi.w  #-1,d0
                beq.s   loc_192F8
                
                jsr     j_GetStatusEffects
                move.w  d1,d0
                andi.w  #STATUSEFFECT_BOOST,d0
                beq.s   loc_192BA
                lsr     ((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_192BA:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_SLOW,d0
                beq.s   loc_192C6
                lsl     ((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_192C6:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_SILENCE,d0
                beq.s   loc_192D0
                moveq   #STATUSANIMATION_SILENCE_CROSS,d2
loc_192D0:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_MUDDLE2,d0
                beq.s   loc_192DA
                moveq   #STATUSANIMATION_DIZZY_STARS,d2
loc_192DA:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_SLEEP,d0
                beq.s   loc_192EA
                moveq   #STATUSANIMATION_ZZZS,d2
                move.w  #-1,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_192EA:
                
                andi.w  #STATUSEFFECT_STUN,d1
                beq.s   loc_192F8
                moveq   #STATUSANIMATION_STUN_LINES,d2
                move.w  #-1,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_192F8:
                
                move.b  d2,((BATTLESCENE_ENEMY_STATUS_ANIMATION-$1000000)).w
                rts

    ; End of function ApplyStatusEffectsToEnemyAnimation


; =============== S U B R O U T I N E =======================================


ApplyStatusEffectsToAllyAnimation:
                
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                clr.w   d2
                cmpi.w  #-1,d0
                beq.s   loc_19360
                
                jsr     j_GetStatusEffects
                move.w  d1,d0
                andi.w  #STATUSEFFECT_BOOST,d0
                beq.s   loc_19322
                lsr     ((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_19322:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_SLOW,d0
                beq.s   loc_1932E
                lsl     ((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_1932E:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_SILENCE,d0
                beq.s   loc_19338
                moveq   #STATUSANIMATION_SILENCE_CROSS,d2
loc_19338:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_MUDDLE,d0
                beq.s   loc_19342
                moveq   #STATUSANIMATION_DIZZY_STARS,d2
loc_19342:
                
                move.w  d1,d0
                andi.w  #STATUSEFFECT_SLEEP,d0
                beq.s   loc_19352
                moveq   #STATUSANIMATION_ZZZS,d2
                move.w  #-1,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_19352:
                
                andi.w  #STATUSEFFECT_STUN,d1
                beq.s   loc_19360
                moveq   #STATUSANIMATION_STUN_LINES,d2
                move.w  #-1,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_19360:
                
                move.b  d2,((BATTLESCENE_ALLY_STATUS_ANIMATION-$1000000)).w
                rts

    ; End of function ApplyStatusEffectsToAllyAnimation


; =============== S U B R O U T I N E =======================================


sub_19366:
                
                move.w  d1,-(sp)
                move.w  d1,-(sp)
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.w  #$F,d0
                beq.s   loc_19378
                bsr.w   sub_1942C       
loc_19378:
                
                move.w  (sp)+,d1
                move.w  d1,d0
                asr.w   #BYTE_SHIFT_COUNT,d0
                ext.w   d1
                bsr.s   LoadBattlesceneAllyVdpSprites
                move.w  (sp)+,d1
                bsr.w   sub_19546
                jmp     (sub_1942).w    

    ; End of function sub_19366


; =============== S U B R O U T I N E =======================================


sub_1938C:
                
                move.w  d1,-(sp)
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.w  #$F,d0
                beq.s   loc_1939C
                bsr.w   sub_1942C       
loc_1939C:
                
                move.w  (sp)+,d1

    ; End of function sub_1938C


; =============== S U B R O U T I N E =======================================


sub_1939E:
                
                move.w  d1,-(sp)
                move.w  d1,d0
                asr.w   #BYTE_SHIFT_COUNT,d0
                ext.w   d1
                bsr.s   LoadBattlesceneAllyVdpSprites
                move.w  (sp)+,d1
                bsr.w   sub_1955E
                jmp     (sub_1942).w    

    ; End of function sub_1939E


; =============== S U B R O U T I N E =======================================

; related to battlescene ally and weapon VDP sprites


LoadBattlesceneAllyAndWeaponVdpSprites:
                
                movem.w d0-d1,-(sp)
                bsr.s   LoadBattlesceneAllyVdpSprites
                movem.w (sp)+,d0-d1
                bsr.w   LoadBattlesceneWeaponVdpSprites
                jmp     (sub_1942).w    

    ; End of function LoadBattlesceneAllyAndWeaponVdpSprites


; =============== S U B R O U T I N E =======================================

; related to battlescene ally VDP sprites


LoadBattlesceneAllyVdpSprites:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   @Return
                
                lea     sprite_BattlesceneAlly(pc), a0
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   @loc_1
                
                ; Mirrored ally
                lea     72(a0),a0
                subi.w  #112,d0
@loc_1:
                
                lea     ((SPRITE_01-$1000000)).w,a1
                btst    #0,((byte_FFB56E-$1000000)).w
                bne.s   @loc_2
                
                clr.w   d2
                bra.s   @loc_3
@loc_2:
                
                move.w  #144,d2
@loc_3:
                
                moveq   #8,d7
@loc_4:
                
                move.w  (a0)+,(a1)      ; y
                add.w   d1,(a1)+
                move.w  (a0)+,(a1)+     ; size, link
                move.w  (a0)+,(a1)      ; tile
                add.w   d2,(a1)+
                move.w  (a0)+,(a1)      ; x
                add.w   d0,(a1)+
                dbf     d7,@loc_4
                
                addi.w  #264,d0
                move.w  d0,((BATTLESCENE_ALLY_X-$1000000)).w
                addi.w  #192,d1
                move.w  d1,((BATTLESCENE_ALLY_Y-$1000000)).w
                lea     (BATTLESCENE_BATTLESPRITE_TOGGLE).l,a0
                move.l  #$1010101,d0
                move.b  d0,(a0)+
                move.l  d0,(a0)+
                move.l  d0,(a0)+
@Return:
                
                rts

    ; End of function LoadBattlesceneAllyVdpSprites


; =============== S U B R O U T I N E =======================================

; In: d0.w = frame index


sub_1942C:
                
                move.w  d0,d1
                bsr.s   WaitForBattlesceneGraphicsUpdate
                bclr    #1,((byte_FFB56E-$1000000)).w
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   @Return
                
                ; Alternate battlesprite VDP tileset when idle
                bchg    #0,((byte_FFB56E-$1000000)).w
                bne.s   @FirstVdpTileset
                
                ; Second VDP tileset address
                lea     ($3200).w,a1
                bra.s   @Continue
@FirstVdpTileset:
                
                lea     ($2000).w,a1
@Continue:
                
                bsr.w   LoadAllyBattlespriteFrameAndWaitForDma
@Return:
                
                rts

    ; End of function sub_1942C


; =============== S U B R O U T I N E =======================================


WaitForBattlesceneGraphicsUpdate:
                
                tst.b   ((WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE-$1000000)).w
                beq.s   @Return
                jsr     (WaitForVInt).w
@Return:
                
                rts

    ; End of function WaitForBattlesceneGraphicsUpdate


; =============== S U B R O U T I N E =======================================


sub_19464:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   @Return
                
                move.w  d1,-(sp)
                move.w  d1,-(sp)
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                cmpi.w  #$F,d0
                beq.s   @loc_1
                bsr.w   sub_194AA
                bra.s   @loc_2
@loc_1:
                
                bchg    #2,((byte_FFB56E-$1000000)).w
@loc_2:
                
                move.w  (sp)+,d6
                asr.w   #BYTE_SHIFT_COUNT,d6
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   @loc_3
                addi.w  #$60,d6 
@loc_3:
                
                bsr.w   MoveEnemyBattlespriteHorizontally
                move.w  (sp)+,d6
                ext.w   d6
                neg.w   d6
                bsr.w   MoveEnemyBattlespriteVertically
                bsr.w   sub_1EF2E
@Return:
                
                rts

    ; End of function sub_19464


; =============== S U B R O U T I N E =======================================


sub_194AA:
                
                move.w  d0,-(sp)
                bsr.s   WaitForBattlesceneGraphicsUpdate
                move.w  (sp)+,d1
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   @Return
                
                bsr.w   LoadEnemyBattlespriteFrame
                lea     (FF8804_LOADING_SPACE).l,a0
                btst    #2,((byte_FFB56E-$1000000)).w
                beq.s   @loc_1
                lea     ($4400).w,a1
                bra.s   @loc_2
@loc_1:
                
                lea     ($5C00).w,a1
@loc_2:
                
                move.w  #$600,d0
                move.w  #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  #$600,d0
                move.w  #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
@Return:
                
                rts

    ; End of function sub_194AA


; =============== S U B R O U T I N E =======================================


sub_194FE:
                
                move.w  d1,d0
                asr.w   #BYTE_SHIFT_COUNT,d0
                ext.w   d1

    ; End of function sub_194FE


; =============== S U B R O U T I N E =======================================

; related to battlescene ground VDP sprites


LoadBattlesceneGroundVdpSprites:
                
                cmpi.b  #-1,((BATTLESCENE_BACKGROUND-$1000000)).w
                beq.s   @Return
                
                lea     sprite_BattlesceneGround(pc), a0
                btst    #0,((byte_FFB56F-$1000000)).w
                beq.s   @loc_1
                lea     $18(a0),a0
                subi.w  #$70,d0 
@loc_1:
                
                lea     ((SPRITE_BATTLESCENE_GROUND-$1000000)).w,a1
                moveq   #2,d7
@Loop:
                
                move.w  (a0)+,(a1)
                add.w   d1,(a1)+
                move.l  (a0)+,(a1)+
                move.w  (a0)+,(a1)
                add.w   d0,(a1)+
                dbf     d7,@Loop
                
                move.w  #$101,d0
                move.w  d0,(BATTLESCENE_GROUNDSPRITE_TOGGLE).l
                move.b  d0,(byte_FFAFB0).l
@Return:
                
                rts

    ; End of function LoadBattlesceneGroundVdpSprites


; =============== S U B R O U T I N E =======================================


sub_19546:
                
                move.w  d1,d0
                asr.w   #BYTE_SHIFT_COUNT,d0
                ext.w   d1
                move.b  ((WEAPON_FRAME_X-$1000000)).w,d2
                ext.w   d2
                add.w   d2,d0
                move.b  ((WEAPON_FRAME_Y-$1000000)).w,d2
                ext.w   d2
                add.w   d2,d1
                bra.s   loc_1958E

    ; End of function sub_19546


; =============== S U B R O U T I N E =======================================


sub_1955E:
                
                move.w  d1,d0
                asr.w   #BYTE_SHIFT_COUNT,d0
                ext.w   d1

    ; End of function sub_1955E


; =============== S U B R O U T I N E =======================================

; related to battlescene weapon VDP sprites


LoadBattlesceneWeaponVdpSprites:
                
                btst    #0,((byte_FFB56E-$1000000)).w
                bne.s   loc_1957E
                move.b  ((WEAPON_IDLE_FRAME1_X-$1000000)).w,d2
                ext.w   d2
                add.w   d2,d0
                move.b  ((WEAPON_IDLE_FRAME1_Y-$1000000)).w,d2
                ext.w   d2
                add.w   d2,d1
                bra.s   loc_1958E
loc_1957E:
                
                move.b  ((WEAPON_IDLE_FRAME2_X-$1000000)).w,d2
                ext.w   d2
                add.w   d2,d0
                move.b  ((WEAPON_IDLE_FRAME2_Y-$1000000)).w,d2
                ext.w   d2
                add.w   d2,d1
loc_1958E:
                
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.w   return_195E0
                
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d7
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_195AC
                bchg    #4,d7
                subi.w  #$70,d0 
loc_195AC:
                
                lea     sprite_BattlesceneWeapon(pc), a0
                andi.w  #$30,d7 
                add.w   d7,d7
                adda.w  d7,a0
                lea     ((SPRITE_BATTLESCENE_WEAPON-$1000000)).w,a1
                moveq   #3,d7
loc_195BE:
                
                move.w  (a0)+,(a1)
                add.w   d1,(a1)+
                move.l  (a0)+,(a1)+
                move.w  (a0)+,(a1)
                add.w   d0,(a1)+
                dbf     d7,loc_195BE
                move.l  #$1010101,d0
                move.b  ((WEAPON_FRAME_LAYER-$1000000)).w,d1
                subq.b  #1,d1
                lsl.l   d1,d0
                move.l  d0,(BATTLESCENE_WEAPONSPRITE_TOGGLE).l
return_195E0:
                
                rts

    ; End of function LoadBattlesceneWeaponVdpSprites


; =============== S U B R O U T I N E =======================================

; make actor idle


MakeActorIdle:
                
                move.b  ((ACTOR_TO_MAKE_IDLE-$1000000)).w,d0
                subq.b  #1,d0
                bne.s   loc_195F0
                bsr.w   bsc05_makeAllyIdle
                bra.s   loc_195F8
loc_195F0:
                
                subq.b  #1,d0
                bne.s   loc_195F8
                bsr.w   bsc04_makeEnemyIdle
loc_195F8:
                
                clr.b   ((ACTOR_TO_MAKE_IDLE-$1000000)).w
                rts

    ; End of function MakeActorIdle


; =============== S U B R O U T I N E =======================================


sub_195FE:
                
                cmpi.w  #-1,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   @Return
                
                bclr    #1,((byte_FFB56E-$1000000)).w
                clr.b   ((BATTLESCENE_ALLY_STATUS_ANIMATION-$1000000)).w
                bsr.w   LoadAllyBattlespriteFrame
                lea     table_196B4(pc), a1
                moveq   #7,d7
@Loop:
                
                move.w  (a1),d0
                swap    d0
                move.w  (a1)+,d0
                move.w  (a1)+,d1
                movem.l d7/a1,-(sp)
                bsr.s   sub_19632       
                movem.l (sp)+,d7/a1
                dbf     d7,@Loop
@Return:
                
                rts

    ; End of function sub_195FE


; =============== S U B R O U T I N E =======================================

; In: d0.w, d1.w


sub_19632:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                adda.w  d1,a0
                move.w  #GFX_MAPSPRITE_PIXELS_COUNTER,d7
loc_1963E:
                
                and.l   d0,(a0)
                addq.w  #8,a0
                dbf     d7,loc_1963E
                
                lea     (FF2000_LOADING_SPACE).l,a0
                move.b  ((WEAPON_IDLE_FRAME1_INDEX-$1000000)).w,d7
                andi.w  #7,d7
                ror.w   #5,d7
                adda.w  d7,a0
                move.l  a0,-(sp)
                adda.w  d1,a0
                move.w  #$FF,d7
loc_19660:
                
                and.l   d0,(a0)
                addq.w  #8,a0
                dbf     d7,loc_19660
                movea.l (sp)+,a0
                move.l  a0,-(sp)
                lea     (FF8804_LOADING_SPACE).l,a0
                btst    #0,((byte_FFB56E-$1000000)).w
                bne.s   loc_19680
                lea     ($2000).w,a1
                bra.s   loc_19684
loc_19680:
                
                lea     ($3200).w,a1
loc_19684:
                
                move.w  #$900,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                movea.l (sp)+,a0
                cmpi.w  #-1,((BATTLESCENE_WEAPONSPRITE-$1000000)).w
                beq.s   loc_196B0
                
                lea     ($D800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
loc_196B0:
                
                jmp     (WaitForVInt).w

    ; End of function sub_19632

table_196B4:    dc.w $FFF               ; related to ally battlesprite reaction
                dc.w 0
                dc.w $FFF
                dc.w 4
                dc.w $FF0F
                dc.w 0
                dc.w $FF0F
                dc.w 4
                dc.w $F0FF
                dc.w 0
                dc.w $F0FF
                dc.w 4
                dc.w $FFF0
                dc.w 0
                dc.w $FFF0
                dc.w 4

; =============== S U B R O U T I N E =======================================


sub_196D4:
                
                cmpi.w  #-1,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   return_1971A
                
                bclr    #3,((byte_FFB56E-$1000000)).w
                clr.b   ((BATTLESCENE_ENEMY_STATUS_ANIMATION-$1000000)).w
                move.w  ((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w,d0
                btst    #2,((byte_FFB56E-$1000000)).w
                bne.s   loc_196F6
                clr.w   d1
                bra.s   loc_196FA
loc_196F6:
                
                bsr.w   GetEnemyBattlespriteIdleAnimate
loc_196FA:
                
                bsr.w   LoadEnemyBattlespriteFrame
                lea     table_19764(pc), a1
                moveq   #7,d7
loc_19704:
                
                move.w  (a1),d0
                swap    d0
                move.w  (a1)+,d0
                move.w  (a1)+,d1
                movem.l d7/a1,-(sp)
                bsr.s   sub_1971C
                movem.l (sp)+,d7/a1
                dbf     d7,loc_19704
return_1971A:
                
                rts

    ; End of function sub_196D4


; =============== S U B R O U T I N E =======================================


sub_1971C:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                adda.w  d1,a0
                move.w  #$2FF,d7
loc_19728:
                
                and.l   d0,(a0)
                addq.w  #8,a0
                dbf     d7,loc_19728
                lea     (FF8804_LOADING_SPACE).l,a0
                btst    #2,((byte_FFB56E-$1000000)).w
                bne.s   loc_19744
                lea     ($4400).w,a1
                bra.s   loc_19748
loc_19744:
                
                lea     ($5C00).w,a1
loc_19748:
                
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jmp     (WaitForDmaQueueProcessing).w

    ; End of function sub_1971C

table_19764:    dc.w $FFF               ; related to enemy battlesprite reaction
                dc.w 0
                dc.w $FF0F
                dc.w 4
                dc.w $FF0F
                dc.w 0
                dc.w $FFF
                dc.w 4
                dc.w $F0FF
                dc.w 0
                dc.w $FFF0
                dc.w 4
                dc.w $FFF0
                dc.w 0
                dc.w $F0FF
                dc.w 4

; =============== S U B R O U T I N E =======================================


AddAllyToDeadList:
                
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   @Return
                
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d1
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.b  d0,(a0,d1.w)
                move.b  #-1,1(a0,d1.w)
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
@Return:
                
                rts

    ; End of function AddAllyToDeadList


; =============== S U B R O U T I N E =======================================

; Add enemy to dead combatants list.


AddEnemyToDeadList:
                
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #-1,d0
                beq.s   @Return
                
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d1
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.b  d0,(a0,d1.w)
                move.b  #-1,1(a0,d1.w)
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
@Return:
                
                rts

    ; End of function AddEnemyToDeadList

