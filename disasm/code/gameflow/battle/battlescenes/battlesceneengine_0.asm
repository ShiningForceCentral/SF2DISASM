
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_0.asm :
; 0x18000..0x19E5E : Battlescene engine

; =============== S U B R O U T I N E =======================================


j_nullsub_18010:
                
                jmp     nullsub_18010(pc)

    ; End of function j_nullsub_18010


; =============== S U B R O U T I N E =======================================


j_InitializeBattlescene:
                
                jmp     InitializeBattlescene(pc)

    ; End of function j_InitializeBattlescene


; =============== S U B R O U T I N E =======================================


j_ExecuteBattlesceneScript:
                
                jmp     ExecuteBattlesceneScript(pc)

    ; End of function j_ExecuteBattlesceneScript


; =============== S U B R O U T I N E =======================================


j_EndBattlescene:
                
                jmp     EndBattlescene(pc)

    ; End of function j_EndBattlescene


; =============== S U B R O U T I N E =======================================


nullsub_18010:
                
                rts

    ; End of function nullsub_18010


; =============== S U B R O U T I N E =======================================


InitializeBattlescene:
                
                lea     ((dword_FFB3C0-$1000000)).w,a0
                move.l  #byte_FFB59A,d2
                subi.l  #dword_FFB3C0,d2
                lsr.l   #2,d2
                subq.w  #1,d2
loc_18026:
                
                clr.l   (a0)+
                dbf     d2,loc_18026
                
                move.w  d1,-(sp)
                move.w  d0,((BATTLESCENE_ENEMY-$1000000)).w
                bsr.w   GetBattleSpriteAndPalette
                move.w  d1,((ENEMY_BATTLE_SPRITE-$1000000)).w
                move.w  d2,((ENEMY_BATTLE_PALETTE-$1000000)).w
                move.w  d3,((ENEMY_BATTLE_ANIMATION-$1000000)).w
                move.w  (sp)+,d0
                move.w  d0,((BATTLESCENE_ALLY-$1000000)).w
                bsr.w   GetBattleSpriteAndPalette
                move.w  d1,((ALLY_BATTLE_SPRITE-$1000000)).w
                move.w  d2,((ALLY_BATTLE_PALETTE-$1000000)).w
                move.w  d3,((ALLY_BATTLE_ANIMATION-$1000000)).w
                bsr.w   GetWeaponSpriteAndPalette
                move.w  d2,((ALLY_WEAPON_SPRITE-$1000000)).w
                move.w  d3,((ALLY_WEAPON_PALETTE-$1000000)).w
                move.b  #$FF,((BATTLE_BACKGROUND-$1000000)).w
                bsr.w   FadeOutToBlackForBattlescene
                sndCom  SOUND_COMMAND_FADE_OUT
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                bpl.s   loc_1807C
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
loc_1807C:
                
                bsr.w   GetBattleBackground
                move.w  d1,d0
                lea     (FF2000_LOADING_SPACE).l,a1 ; store it in RAM for DMA
                bsr.w   LoadBattleBackground
loc_1808C:
                
                jsr     (WaitForVInt).w
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_1808C
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w
                jsr     (DisableDisplayAndInterrupts).w
                move.w  #$8B07,d0       ; set VScroll : each 2 cells, HScroll : each 1 line
                jsr     (SetVdpReg).w
                jsr     (ClearSpriteTable).w
                moveq   #$3F,d0 
                jsr     (InitSprites).w 
                jsr     (sub_19B0).w
                bsr.w   InitializeBattlescenePalettes
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #$1FF,d0
loc_180CC:
                
                clr.l   (a0)+
                clr.l   (a1)+
                dbf     d0,loc_180CC
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
                bsr.w   sub_198C8
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
                lea     ((byte_FFB542-$1000000)).w,a0
                lea     ((PALETTE_4_BASE-$1000000)).w,a1
                moveq   #7,d0
loc_1814E:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_1814E
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
                beq.w   loc_18198
                bsr.w   sub_1EF36
                bset    #3,((byte_FFB56E-$1000000)).w
                bset    #5,((byte_FFB56E-$1000000)).w
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                clr.w   d1
                lea     ($4400).w,a1
                bsr.w   sub_1999E
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                bsr.w   GetEnemyBattleSpriteIdleAnimate
                lea     ($5C00).w,a1
                bsr.w   sub_1999E
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                move.w  ((ENEMY_BATTLE_PALETTE-$1000000)).w,d1
                bsr.w   sub_19970
loc_18198:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.w   loc_1828C
                lea     spr_1F576(pc), a0
                lea     ((SPRITE_01-$1000000)).w,a1
                lea     (byte_FFAFA1).l,a2
                moveq   #8,d0
loc_181B2:
                
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.b  #1,(a2)+
                dbf     d0,loc_181B2
                bset    #1,((byte_FFB56E-$1000000)).w
                bset    #4,((byte_FFB56E-$1000000)).w
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                clr.w   d1
                lea     ($2000).w,a1
                bsr.w   LoadAllyBattleSpriteFrame
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattleSpriteIdleAnimate
                lea     ($3200).w,a1
                bsr.w   LoadAllyBattleSpriteFrame
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                move.w  ((ALLY_BATTLE_PALETTE-$1000000)).w,d1
                bsr.w   LoadPaletteForBattlescene
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                bsr.w   sub_19E6E
                move.b  d1,((BATTLE_BACKGROUND-$1000000)).w
                cmpi.w  #$FFFF,d1
                beq.w   loc_1822A
                lea     spr_1F686(pc), a0
                lea     ((SPRITE_14-$1000000)).w,a1
                lea     (word_FFAFAE).l,a2
                moveq   #2,d0
loc_18218:
                
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.b  #1,(a2)+
                dbf     d0,loc_18218
                move.w  d1,d0
                bsr.w   LoadBattlesceneGround
loc_1822A:
                
                move.w  ((ALLY_WEAPON_SPRITE-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.w   loc_1828C
                bsr.w   LoadWeaponSprite
                move.w  ((ALLY_BATTLE_ANIMATION-$1000000)).w,d0
                movea.l (p_pt_AllyAnimations).l,a0
                lsl.w   #2,d0
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
                move.w  ((ALLY_WEAPON_PALETTE-$1000000)).w,d0
                bsr.w   LoadWeaponPalette
loc_1828C:
                
                movea.l (p_statusAnimationTiles).l,a0
                lea     ($F600).l,a1
                move.w  #$270,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDmaOnCompressedTiles).w
                bsr.w   sub_1928C
                move.w  ((ALLY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w,d0
                lsr.w   #1,d0
                move.w  d0,((ALLY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                clr.b   ((byte_FFB581-$1000000)).w
                move.b  #$20,((byte_FFB580-$1000000)).w 
                jsr     (EnableInterrupts).w
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                move.w  #$FFD4,d6
                bsr.w   sub_1F1CC
                clr.w   d6
                bsr.w   sub_1F1F0
                jsr     (WaitForVInt).w
                move.w  #$FFEA,d6
                bsr.w   sub_1F214
                clr.w   d6
                bsr.w   sub_1F254
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
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   loc_18318
                clr.w   d1
                jsr     sub_10024
loc_18318:
                
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.w   loc_18342
                clr.w   d1
                jsr     sub_10020
                move.w  #$16,d0
                clr.w   d1
                movem.w d0-d1,-(sp)
                bsr.w   sub_193B2
                movem.w (sp)+,d0-d1
                bsr.w   sub_19504
loc_18342:
                
                jsr     (WaitForVInt).w
                bsr.w   FadeInFromBlackIntoBattlescene
                clr.w   d0
                move.b  (BATTLESCENE_MUSIC_INDEX).l,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                moveq   #$15,d0
loc_18358:
                
                move.w  ((word_FFB3EA-$1000000)).w,d6
                addi.w  #2,d6
                bsr.w   sub_1F1CC
                move.w  #1,((word_FFB3F6-$1000000)).w
                move.w  #$FFFF,((word_FFB3FA-$1000000)).w
                cmpi.b  #$FF,((BATTLE_BACKGROUND-$1000000)).w
                beq.s   loc_18388
                lea     ((SPRITE_14_Y-$1000000)).w,a0
                moveq   #2,d1
loc_1837E:
                
                subi.w  #1,(a0)
                addq.w  #8,a0
                dbf     d1,loc_1837E
loc_18388:
                
                jsr     (WaitForVInt).w
                dbf     d0,loc_18358
loc_18390:
                
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_18390
                rts

    ; End of function InitializeBattlescene


; =============== S U B R O U T I N E =======================================


ExecuteBattlesceneScript:
                
                module
                lea     (FF0000_RAM_START).l,a6
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                move.b  #$FF,((DEAD_COMBATANTS_LIST-$1000000)).w
                clr.b   ((ACTOR_TO_MAKE_IDLE-$1000000)).w
@Loop:
                
                move.w  (a6)+,d0
                cmpi.w  #$FFFF,d0
                beq.s   @End
                add.w   d0,d0
                move.w  rjt_BattlesceneScriptCommands(pc,d0.w),d0
                jsr     rjt_BattlesceneScriptCommands(pc,d0.w)
                bra.s   @Loop
rjt_BattlesceneScriptCommands:
                
                dc.w bsc00_animateEnemyAction-rjt_BattlesceneScriptCommands
                dc.w bsc01_animateAllyAction-rjt_BattlesceneScriptCommands
                dc.w bsc02_moveEnemyBattleSprite-rjt_BattlesceneScriptCommands
                dc.w bsc03_moveAllyBattleSprite-rjt_BattlesceneScriptCommands
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
                dc.w bsc0F_giveEXP-rjt_BattlesceneScriptCommands
                dc.w bsc10_displayMessage-rjt_BattlesceneScriptCommands
                dc.w bsc11_displayMessageWithNoWait-rjt_BattlesceneScriptCommands
                dc.w bsc12_hideTextBox-rjt_BattlesceneScriptCommands
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
                
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
                beq.w   EndBattlesceneAnimation
                cmpi.w  #$FFFF,(a6)
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
                bsr.w   ExecuteSpellAnimation
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
                bsr.w   ExecuteSpellAnimation
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
                cmpi.w  #$FFFF,d0
                beq.s   EndBattlesceneAnimation
                bsr.w   ExecuteSpellAnimation

    ; End of function AnimateSpell


; START OF FUNCTION CHUNK FOR bsc00_animateEnemyAction

EndBattlesceneAnimation:
                
                addq.w  #4,a6
                rts

; END OF FUNCTION CHUNK FOR bsc00_animateEnemyAction


; =============== S U B R O U T I N E =======================================


sub_184B0:
                
                cmpi.w  #1,d1
                beq.w   loc_184E0
                cmpi.w  #2,d1
                beq.w   return_184E6
                tst.w   d5
                beq.w   loc_184CE
                cmpi.w  #$FFFF,d5
                bne.w   return_184E6
loc_184CE:
                
                cmpi.b  #$FF,d0
                bne.s   loc_184D8
                ext.w   d0
                bra.s   loc_184DC
loc_184D8:
                
                andi.w  #$FF,d0
loc_184DC:
                
                move.w  d0,d5
                rts
loc_184E0:
                
                move.w  d3,d5
                ori.w   #$38,d5 
return_184E6:
                
                rts

    ; End of function sub_184B0


; =============== S U B R O U T I N E =======================================

; xx      animation type index (0000 for attack, 0001 for dodge, 0002 for magic/item -- others (i.e. MMNK crit, RBT laser, BRGN flashing)
; yy      magic/item/projectile animation index, set $0080 to come from enemy


bsc01_animateAllyAction:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   EndBattlesceneAnimation
                cmpi.w  #$FFFF,(a6)
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
                bsr.w   ExecuteSpellAnimation
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
                cmpi.w  #$FFFF,((ALLY_WEAPON_SPRITE-$1000000)).w
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
                bsr.w   ExecuteSpellAnimation
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


bsc03_moveAllyBattleSprite:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   @Return
                move.w  (a6)+,((word_FFB3FA-$1000000)).w
                move.w  (a6),((word_FFB3FC-$1000000)).w
                jsr     (WaitForVInt).w
@Return:
                
                rts

    ; End of function bsc03_moveAllyBattleSprite


; =============== S U B R O U T I N E =======================================

; set a long value at FFB3F6, related to battlescene enemy


bsc02_moveEnemyBattleSprite:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   @Return
                move.w  (a6)+,((word_FFB3F6-$1000000)).w
                move.w  (a6),((word_FFB3F8-$1000000)).w ; no + ... is it the next bsc ?
                jsr     (WaitForVInt).w
@Return:
                
                rts

    ; End of function bsc02_moveEnemyBattleSprite


; =============== S U B R O U T I N E =======================================

; related to battlescene ally


bsc05_makeAllyIdle:
                
                btst    #4,((byte_FFB56F-$1000000)).w
                bne.w   loc_1A418
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.w   return_18698
                bclr    #1,((byte_FFB56E-$1000000)).w
                move.l  ((WEAPON_IDLE_FRAME1_INDEX-$1000000)).w,((WEAPON_FRAME_INDEX-$1000000)).w
                bsr.w   sub_192FE
                btst    #0,((byte_FFB56E-$1000000)).w
                beq.s   loc_18624
                clr.w   d0
                bra.s   loc_1862E
loc_18624:
                
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattleSpriteIdleAnimate
                move.w  d1,d0
loc_1862E:
                
                clr.w   d1
                bsr.w   sub_1938C
                cmpi.w  #$FFFF,((ALLY_WEAPON_SPRITE-$1000000)).w
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
                
                move.w  ((ALLY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w,d0
                jsr     (Sleep).w       
                btst    #0,((byte_FFB56E-$1000000)).w
                beq.s   loc_18678
                clr.w   d0
                bra.s   loc_18682
loc_18678:
                
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattleSpriteIdleAnimate
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
                
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   return_186D8
                bclr    #3,((byte_FFB56E-$1000000)).w
                bsr.w   sub_19296
                clr.w   d0
                clr.w   d1
                bsr.w   sub_19464
                move.w  ((ENEMY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w,d0
                jsr     (Sleep).w       
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                bsr.w   GetEnemyBattleSpriteIdleAnimate
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
                
                cmpi.b  #1,((byte_FFB589-$1000000)).w
                beq.s   bsc07_switchAllies ; loop as long as value 1
                move.b  #2,((byte_FFB589-$1000000)).w
                bclr    #1,((byte_FFB56E-$1000000)).w
                move.w  (a6)+,d7
                move.w  (a6)+,d6
                move.w  d7,d0
                cmpi.w  #$FFFF,d0
                beq.s   loc_18736
                bsr.w   GetBattleSpriteAndPalette
                move.w  d1,d0
                bsr.w   LoadNewAllyBattleSprite
                move.w  d1,d0
                move.w  d2,d1
                bsr.w   LoadPaletteForBattlescene
                move.w  d7,d0
                bsr.w   sub_19E6E
                cmpi.w  #$FFFF,d1
                beq.s   loc_1871E
                move.w  d1,d0
                bsr.w   LoadGround
loc_1871E:
                
                move.w  d7,d0
                bsr.w   GetWeaponSpriteAndPalette
                cmpi.w  #$FFFF,d2
                beq.s   loc_18736
                move.w  d2,d0
                bsr.w   LoadWeaponSprite
                move.w  d3,d0
                bsr.w   LoadWeaponPalette
loc_18736:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   loc_18754
                btst    #1,d6
                bne.s   loc_1874A
                move.w  #$190,d1
                bra.s   loc_1874E
loc_1874A:
                
                move.w  #$10,d1
loc_1874E:
                
                bsr.w   sub_188D4
                bra.s   loc_18758
loc_18754:
                
                bsr.w   sub_19952
loc_18758:
                
                jsr     j_RemoveAllyBattlesceneWindow
                move.w  d7,((BATTLESCENE_ALLY-$1000000)).w
                move.w  d7,d0
                bsr.w   GetBattleSpriteAndPalette
                move.w  d1,((ALLY_BATTLE_SPRITE-$1000000)).w
                move.w  d2,((ALLY_BATTLE_PALETTE-$1000000)).w
                move.w  d3,((ALLY_BATTLE_ANIMATION-$1000000)).w
                bsr.w   GetWeaponSpriteAndPalette
                move.w  d2,((ALLY_WEAPON_SPRITE-$1000000)).w
                move.w  d3,((ALLY_WEAPON_PALETTE-$1000000)).w
                clr.b   ((byte_FFB57E-$1000000)).w
                andi.b  #$FC,((byte_FFB56F-$1000000)).w
                cmpi.w  #$FFFF,d7
                beq.w   loc_19912
                move.w  #$108,d1
                tst.w   d6
                beq.s   loc_187AA
                cmpi.w  #3,d6
                beq.s   loc_187AA
                move.w  #$98,d1 
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
                lea     (FF7A02_LOADING_SPACE).l,a0
                lea     ($3200).w,a1
                move.w  #$900,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                bsr.w   sub_19E6E
                move.b  d1,((BATTLE_BACKGROUND-$1000000)).w
                cmpi.w  #$FFFF,d1
                beq.s   loc_18818
                lea     (byte_FF8C02).l,a0
                lea     ($F000).l,a1
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
loc_18818:
                
                move.w  ((ALLY_WEAPON_SPRITE-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.w   loc_1888C
                move.w  ((ALLY_BATTLE_ANIMATION-$1000000)).w,d0
                movea.l (p_pt_AllyAnimations).l,a0
                lsl.w   #2,d0
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
                bsr.w   sub_193B2
                move.w  (sp)+,d0
                clr.w   d1
                bsr.w   sub_19504
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #2,d1
                jsr     sub_10020
                bsr.w   sub_192FE
                jsr     (sub_1942).w    
                move.w  (sp)+,d1
                bsr.s   sub_188D4
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   loc_188CC
                bset    #1,((byte_FFB56E-$1000000)).w
loc_188CC:
                
                move.b  #3,((byte_FFB589-$1000000)).w
                rts

    ; End of function bsc07_switchAllies


; =============== S U B R O U T I N E =======================================


sub_188D4:
                
                move.w  ((word_FFB3F2-$1000000)).w,d0
                cmp.w   d1,d0
                beq.s   return_18928
                bge.s   loc_188F4
                sub.w   d1,d0
                neg.w   d0
                cmpi.w  #2,d0
                bls.w   return_18928
                cmpi.w  #$10,d0
                bls.s   loc_188F2
                moveq   #$10,d0
loc_188F2:
                
                bra.s   loc_18908
loc_188F4:
                
                sub.w   d1,d0
                cmpi.w  #2,d0
                bls.w   return_18928
                cmpi.w  #$10,d0
                bls.s   loc_18906
                moveq   #$10,d0
loc_18906:
                
                neg.w   d0
loc_18908:
                
                move.w  d0,((word_FFB3FA-$1000000)).w
                cmpi.b  #$FF,((BATTLE_BACKGROUND-$1000000)).w
                beq.s   loc_18922
                lea     ((SPRITE_14_Y-$1000000)).w,a0
                moveq   #2,d2
loc_1891A:
                
                add.w   d0,(a0)
                addq.w  #8,a0
                dbf     d2,loc_1891A
loc_18922:
                
                jsr     (WaitForVInt).w
                bra.s   sub_188D4
return_18928:
                
                rts

    ; End of function sub_188D4


; =============== S U B R O U T I N E =======================================


sub_1892A:
                
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a1
                moveq   #$1F,d0
loc_18934:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_18934
                bra.w   sub_1A092

    ; End of function sub_1892A


; =============== S U B R O U T I N E =======================================

; xx      Combatant index
; yy      0000 for right side, 0001 for left side


bsc06_switchEnemies:
                
                cmpi.b  #1,((byte_FFB589-$1000000)).w
                beq.s   bsc06_switchEnemies ; loop as long as value 1
                move.b  #2,((byte_FFB589-$1000000)).w
                andi.b  #$C,((byte_FFB583-$1000000)).w
                bclr    #3,((byte_FFB56E-$1000000)).w
                clr.w   d6
                bsr.w   sub_1F1CC
                clr.w   d6
                bsr.w   sub_1F1F0
                lea     ((SPRITE_14_TILE_FLAGS-$1000000)).w,a0
                bset    #7,(a0)
                bset    #7,8(a0)
                bset    #7,$10(a0)
                move.w  (a6),d0
                bsr.w   GetBattleSpriteAndPalette
                move.w  d1,d0
                bsr.w   LoadEnemyBattleSprite
                movea.l (p_pt_battlesceneTransitionTiles).l,a2
                movea.l (a2)+,a0
                move.l  a2,-(sp)
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a2
                movea.l (a2),a0
                lea     (FF8002_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                move.w  (a6),d0
                bpl.s   loc_189AE
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
loc_189AE:
                
                bsr.w   GetBattleBackground
                move.w  d1,d0
                move.w  d0,-(sp)
                lea     (FF2000_LOADING_SPACE).l,a1
                bsr.w   LoadBattleBackground
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                jsr     j_RemoveEnemyBattlesceneWindow
                bsr.w   sub_198C8
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
                lea     (byte_FF9202).l,a0
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
                move.w  (a6),d0
                move.w  d0,((BATTLESCENE_ENEMY-$1000000)).w
                bsr.w   GetBattleSpriteAndPalette
                move.w  d1,((ENEMY_BATTLE_SPRITE-$1000000)).w
                move.w  d2,((ENEMY_BATTLE_PALETTE-$1000000)).w
                move.w  d3,((ENEMY_BATTLE_ANIMATION-$1000000)).w
                move.w  (sp)+,d2
                clr.b   ((byte_FFB57F-$1000000)).w
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
                bsr.w   sub_1F214
                clr.w   d6
                bsr.w   sub_1F254
                cmpi.w  #$FFFF,d0
                bne.s   loc_18A96
                bsr.w   sub_19926
                bra.s   loc_18AAC
loc_18A96:
                
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                move.w  ((ENEMY_BATTLE_PALETTE-$1000000)).w,d1
                bsr.w   sub_19970
                bset    #2,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1EF2E
loc_18AAC:
                
                lea     ((byte_FFB542-$1000000)).w,a0
                lea     ((PALETTE_4_BASE-$1000000)).w,a1
                moveq   #7,d0
loc_18AB6:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_18AB6
                bsr.w   sub_1892A
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   loc_18ACE
                bsr.w   sub_19296
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
                lea     ((SPRITE_14_TILE_FLAGS-$1000000)).w,a0
                bclr    #7,(a0)
                bclr    #7,8(a0)
                bclr    #7,$10(a0)
                clr.w   d6
                bsr.w   sub_1F1CC
                jsr     (WaitForVInt).w
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   loc_18B8C
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #4,d1
                jsr     sub_10024
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                bsr.w   GetEnemyBattleSpriteIdleAnimate
                lea     ($5C00).w,a1
                bsr.w   sub_199BC
                bsr.w   sub_1F540
                bset    #3,((byte_FFB56E-$1000000)).w
loc_18B8C:
                
                ori.b   #3,((byte_FFB583-$1000000)).w
                move.w  ((ALLY_WEAPON_SPRITE-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   loc_18BA0
                bsr.w   LoadWeaponSprite
loc_18BA0:
                
                addq.w  #4,a6
                move.b  #3,((byte_FFB589-$1000000)).w
                rts

    ; End of function bsc06_switchEnemies


; =============== S U B R O U T I N E =======================================


sub_18BAA:
                
                cmpi.w  #3,d3
                bhi.s   return_18BFC
                movem.l d0-d2/a0-a2,-(sp)
                lea     off_18BFE(pc), a0
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
                lea     (word_FF9802).l,a0
                lea     ($4C00).w,a1
                move.w  #$200,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
loc_18BF4:
                
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0-d2/a0-a2
return_18BFC:
                
                rts
off_18BFE:
                
                dc.l FF5000_LOADING_SPACE
                dc.l $4400
                dc.l FF5600_LOADING_SPACE
                dc.l $4A00
                dc.l FF9C02_LOADING_SPACE
                dc.l $5000
                dc.l FFA202_LOADING_SPACE
                dc.l $5600

    ; End of function sub_18BAA


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
                
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
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
                
                move.w  d0,((word_FFB3F6-$1000000)).w
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
                lea     ((byte_FFB562-$1000000)).w,a6
                move.w  #$FFFF,(a6)
                clr.w   2(a6)
                bsr.w   bsc07_switchAllies
                lea     ((byte_FFB562-$1000000)).w,a6
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
                lea     ((byte_FFB562-$1000000)).w,a6
                move.w  #$FFFF,(a6)
                clr.w   2(a6)
                bsr.w   bsc06_switchEnemies
                lea     ((byte_FFB562-$1000000)).w,a6
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
                cmpi.w  #$FFFF,d0
                bne.s   loc_18DCC
                addq.w  #8,a6
                rts
loc_18DCC:
                
                tst.b   ((byte_FFB588-$1000000)).w
                bne.s   loc_18DCC
                move.w  (a6)+,d1
                move.w  d1,-(sp)
                bmi.s   loc_18DE0
                jsr     j_IncreaseCurrentHP
                bra.s   loc_18DE8
loc_18DE0:
                
                neg.w   d1
                jsr     j_DecreaseCurrentHP
loc_18DE8:
                
                move.w  (a6)+,d1
                bmi.s   loc_18DF4
                jsr     j_IncreaseCurrentMP
                bra.s   loc_18DFC
loc_18DF4:
                
                neg.w   d1
                jsr     j_DecreaseCurrentMP
loc_18DFC:
                
                move.w  (a6)+,d1
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                bsr.w   sub_192FE
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #2,d1
                jsr     sub_10020
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
                move.b  #1,((FADING_PALETTE_BITMAP-$1000000)).w
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
                bsr.w   sub_1F214
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #2,d7
                asl.w   #1,d7
                move.w  d7,d6
                move.w  d7,d1
                neg.w   d1
                bsr.w   sub_1F1F0
                add.w   d5,d6
                bsr.w   sub_1F254
                move.w  (sp)+,d0
                movem.w d0-d1,-(sp)
                bsr.w   sub_193B2
                movem.w (sp)+,d0-d1
                bsr.w   sub_19504
                jsr     (sub_1942).w    
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0/d4-d5
                dbf     d0,loc_18E6E
                clr.w   d6
                bsr.w   sub_1F1CC
                bsr.w   sub_1F1F0
                move.w  d4,d6
                bsr.w   sub_1F214
                move.w  d5,d6
                bsr.w   sub_1F254
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
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   return_18F24
                bsr.w   AddAllyToDeadList
                bsr.w   sub_195FE
                move.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
return_18F24:
                
                rts
loc_18F26:
                
                cmpi.b  #SPELLANIMATION_DESOUL,((CURRENT_SPELLANIMATION-$1000000)).w
                bne.s   loc_18F38
                addq.w  #1,((dword_FFB536-$1000000)).w
                moveq   #$14,d0
                jsr     (Sleep).w       
loc_18F38:
                
                bsr.w   AddAllyToDeadList
                bsr.w   sub_195FE
                move.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
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
                cmpi.w  #$FFFF,d0
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
                jsr     j_IncreaseCurrentHP
                bra.s   loc_18F7E
loc_18F76:
                
                neg.w   d1
                jsr     j_DecreaseCurrentHP
loc_18F7E:
                
                move.w  (a6)+,d1
                bmi.s   loc_18F8A
                jsr     j_IncreaseCurrentMP
                bra.s   loc_18F92
loc_18F8A:
                
                neg.w   d1
                jsr     j_DecreaseCurrentMP
loc_18F92:
                
                move.w  (a6)+,d1
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                bsr.w   sub_19296
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #4,d1
                jsr     sub_10024
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
                move.b  #2,((FADING_PALETTE_BITMAP-$1000000)).w
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
                bsr.w   sub_1F214
                moveq   #7,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #3,d7
                asl.w   #1,d7
                move.w  d7,d6
                add.w   d5,d6
                bsr.w   sub_1F254
                jsr     (WaitForVInt).w
                dbf     d0,loc_19004
                move.w  d4,d6
                bsr.w   sub_1F214
                move.w  d5,d6
                bsr.w   sub_1F254
                cmpi.b  #SPELLANIMATION_GUNNER_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                beq.s   loc_19048
                bsr.w   sub_1A092
loc_19048:
                
                move.w  (sp)+,d0
                move.b  d0,((FADING_COUNTER_MAX-$1000000)).w
                jsr     (WaitForVInt).w
                bset    #3,((byte_FFB56E-$1000000)).w
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   return_19074
                bsr.w   AddEnemyToDeadList
                bsr.w   sub_196D4
                move.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
return_19074:
                
                rts
loc_19076:
                
                cmpi.b  #SPELLANIMATION_DESOUL,((CURRENT_SPELLANIMATION-$1000000)).w
                bne.s   loc_19088
                addq.w  #1,((dword_FFB536-$1000000)).w
                moveq   #$14,d0
                jsr     (Sleep).w       
loc_19088:
                
                bsr.w   AddEnemyToDeadList
                bsr.w   sub_196D4
                move.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
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
                
                tst.b   ((byte_FFB584-$1000000)).w ; wait for byte cleared
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


bsc0F_giveEXP:
                
                moveq   #0,d1
                move.w  (a6)+,d1
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.w   return_191DE
                move.l  d1,-(sp)
                andi.w  #$7FFF,d1
                jsr     j_IncreaseEXP
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  (sp)+,d1
                btst    #$F,d1
                bne.s   loc_1910C
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     263             ; "{NAME} earned {#}{N}EXP. points.{D1}"
loc_1910C:
                
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                jsr     j_GetCurrentEXP
                subi.w  #$64,d1 
                bcs.w   return_191DE
                jsr     j_SetCurrentEXP
                jsr     j_LevelUp
                clr.w   (SPEECH_SFX).l
                lea     (LEVELUP_ARGUMENTS).l,a5
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,((TEXT_NAME_INDEX_1-$1000000)).w
                moveq   #0,d0
                move.b  (a5)+,d0
                cmpi.b  #$FF,d0
                beq.w   return_191DE
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                move.b  ((byte_FFB56F-$1000000)).w,d1
                andi.w  #2,d1
                jsr     sub_10020
                sndCom  SFX_LEVEL_UP
                txt     244             ; "{NAME} became{N}level {#}!"
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_19174
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                txt     266             ; "{D1}HP increased by {#}!"
loc_19174:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_19182
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                txt     267             ; "{D1}MP increased by {#}!"
loc_19182:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_19190
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                txt     268             ; "{D1}Attack increased by {#}!"
loc_19190:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_1919E
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                txt     269             ; "{D1}Defense increased by {#}!"
loc_1919E:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                beq.s   loc_191AC
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                txt     270             ; "{D1}Agility increased by {#}!"
loc_191AC:
                
                moveq   #0,d0
                move.b  (a5)+,d0
                cmpi.b  #$FF,d0
                beq.s   return_191DE
                move.l  d0,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d0 
                lsr.w   #6,d1
                bne.s   loc_191D0
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  d0,((TEXT_NAME_INDEX_2-$1000000)).w
                txt     271             ; "{D1}{NAME} learned the new{N}magic spell {SPELL}!"
                bra.s   return_191DE
loc_191D0:
                
                addq.w  #1,d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     272             ; "{D1}{SPELL} increased to{N}level {#}!"
return_191DE:
                
                rts

    ; End of function bsc0F_giveEXP


; =============== S U B R O U T I N E =======================================

;         Byte 00-01      Main string index.
;         Byte 02-03      Character name index.
;         Byte 04-05      Magic/item index.
;         Byte 06-09      Number.


bsc10_displayMessage:
                
                move.w  (a6)+,d0
                move.w  (a6)+,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  (a6)+,((TEXT_NAME_INDEX_2-$1000000)).w
                move.l  (a6)+,((TEXT_NUMBER-$1000000)).w
                clr.w   (SPEECH_SFX).l
                tst.b   ((DISPLAY_BATTLE_MESSAGES-$1000000)).w
                bne.s   loc_1920C
                jsr     (DisplayText).l 
                tst.b   ((MESSAGE_SPEED-$1000000)).w
                bne.s   loc_1920C
                txt     362             ; "{DICT}{W2}"
                rts
loc_1920C:
                
                clr.w   d0
                move.b  ((MESSAGE_SPEED-$1000000)).w,d0
                moveq   #8,d1
                sub.w   d0,d1
                clr.w   d0
                bset    d1,d0
loc_1921A:
                
                tst.b   ((P1_INPUT-$1000000)).w
                bne.s   return_19228
                jsr     (WaitForVInt).w
                dbf     d0,loc_1921A
return_19228:
                
                rts

    ; End of function bsc10_displayMessage


; =============== S U B R O U T I N E =======================================

; same params as previous command


bsc11_displayMessageWithNoWait:
                
                move.w  (a6)+,d0
                move.w  (a6)+,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  (a6)+,((TEXT_NAME_INDEX_2-$1000000)).w
                move.l  (a6)+,((TEXT_NUMBER-$1000000)).w
                clr.w   (SPEECH_SFX).l
                jmp     (DisplayText).l 

    ; End of function bsc11_displayMessageWithNoWait


; =============== S U B R O U T I N E =======================================


bsc12_hideTextBox:
                
                jmp     (HideTextBox).l

    ; End of function bsc12_hideTextBox


; =============== S U B R O U T I N E =======================================


EndBattlescene:
                
                clr.w   d0
                move.b  ((MESSAGE_SPEED-$1000000)).w,d0
                moveq   #7,d1
                sub.w   d0,d1
                clr.w   d0
                bset    d1,d0
loc_19258:
                
                tst.b   ((P1_INPUT-$1000000)).w
                bne.s   byte_19266
                jsr     (WaitForVInt).w
                dbf     d0,loc_19258
byte_19266:
                
                sndCom  SOUND_COMMAND_FADE_OUT
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   loc_1927A
                jsr     j_RemoveAllyBattlesceneWindow
loc_1927A:
                
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   return_1928A
                jsr     j_RemoveEnemyBattlesceneWindow
return_1928A:
                
                rts

    ; End of function EndBattlescene


; =============== S U B R O U T I N E =======================================


sub_1928C:
                
                bsr.w   sub_192FE
                bsr.s   sub_19296
                bra.w   sub_1EFD8

    ; End of function sub_1928C


; =============== S U B R O U T I N E =======================================


sub_19296:
                
                move.w  ((ENEMY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((ENEMY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                clr.w   d2
                cmpi.w  #$FFFF,d0
                beq.s   loc_192F8
                jsr     j_GetStatusEffects
                move.w  d1,d0
                andi.w  #$3000,d0
                beq.s   loc_192BA
                lsr     ((ENEMY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_192BA:
                
                move.w  d1,d0
                andi.w  #$C00,d0
                beq.s   loc_192C6
                lsl     ((ENEMY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_192C6:
                
                move.w  d1,d0
                andi.w  #$300,d0
                beq.s   loc_192D0
                moveq   #1,d2
loc_192D0:
                
                move.w  d1,d0
                andi.w  #8,d0
                beq.s   loc_192DA
                moveq   #2,d2
loc_192DA:
                
                move.w  d1,d0
                andi.w  #$C0,d0 
                beq.s   loc_192EA
                moveq   #3,d2
                move.w  #$FFFF,((ENEMY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_192EA:
                
                andi.w  #1,d1
                beq.s   loc_192F8
                moveq   #4,d2
                move.w  #$FFFF,((ENEMY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_192F8:
                
                move.b  d2,((byte_FFB57F-$1000000)).w
                rts

    ; End of function sub_19296


; =============== S U B R O U T I N E =======================================


sub_192FE:
                
                move.w  ((ALLY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w,((ALLY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                clr.w   d2
                cmpi.w  #$FFFF,d0
                beq.s   loc_19360
                jsr     j_GetStatusEffects
                move.w  d1,d0
                andi.w  #$3000,d0
                beq.s   loc_19322
                lsr     ((ALLY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_19322:
                
                move.w  d1,d0
                andi.w  #$C00,d0
                beq.s   loc_1932E
                lsl     ((ALLY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w
loc_1932E:
                
                move.w  d1,d0
                andi.w  #$300,d0
                beq.s   loc_19338
                moveq   #1,d2
loc_19338:
                
                move.w  d1,d0
                andi.w  #$30,d0 
                beq.s   loc_19342
                moveq   #2,d2
loc_19342:
                
                move.w  d1,d0
                andi.w  #$C0,d0 
                beq.s   loc_19352
                moveq   #3,d2
                move.w  #$FFFF,((ALLY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_19352:
                
                andi.w  #1,d1
                beq.s   loc_19360
                moveq   #4,d2
                move.w  #$FFFF,((ALLY_BATTLESPRITE_ANIMATION_COUNTER-$1000000)).w
loc_19360:
                
                move.b  d2,((byte_FFB57E-$1000000)).w
                rts

    ; End of function sub_192FE


; =============== S U B R O U T I N E =======================================


sub_19366:
                
                move.w  d1,-(sp)
                move.w  d1,-(sp)
                andi.w  #$F,d0
                cmpi.w  #$F,d0
                beq.s   loc_19378
                bsr.w   sub_1942C
loc_19378:
                
                move.w  (sp)+,d1
                move.w  d1,d0
                asr.w   #8,d0
                ext.w   d1
                bsr.s   sub_193C4
                move.w  (sp)+,d1
                bsr.w   sub_19546
                jmp     (sub_1942).w    

    ; End of function sub_19366


; =============== S U B R O U T I N E =======================================


sub_1938C:
                
                move.w  d1,-(sp)
                andi.w  #$F,d0
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
                asr.w   #8,d0
                ext.w   d1
                bsr.s   sub_193C4
                move.w  (sp)+,d1
                bsr.w   sub_1955E
                jmp     (sub_1942).w    

    ; End of function sub_1939E


; =============== S U B R O U T I N E =======================================


sub_193B2:
                
                movem.w d0-d1,-(sp)
                bsr.s   sub_193C4
                movem.w (sp)+,d0-d1
                bsr.w   sub_19564
                jmp     (sub_1942).w    

    ; End of function sub_193B2


; =============== S U B R O U T I N E =======================================


sub_193C4:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   return_1942A
                lea     spr_1F576(pc), a0
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_193E0
                lea     $48(a0),a0
                subi.w  #$70,d0 
loc_193E0:
                
                lea     ((SPRITE_01-$1000000)).w,a1
                btst    #0,((byte_FFB56E-$1000000)).w
                bne.s   loc_193F0
                clr.w   d2
                bra.s   loc_193F4
loc_193F0:
                
                move.w  #$90,d2 
loc_193F4:
                
                moveq   #8,d7
loc_193F6:
                
                move.w  (a0)+,(a1)
                add.w   d1,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,(a1)
                add.w   d2,(a1)+
                move.w  (a0)+,(a1)
                add.w   d0,(a1)+
                dbf     d7,loc_193F6
                addi.w  #$108,d0
                move.w  d0,((word_FFB3F2-$1000000)).w
                addi.w  #$C0,d1 
                move.w  d1,((word_FFB3F4-$1000000)).w
                lea     (byte_FFAFA1).l,a0
                move.l  #$1010101,d0
                move.b  d0,(a0)+
                move.l  d0,(a0)+
                move.l  d0,(a0)+
return_1942A:
                
                rts

    ; End of function sub_193C4


; =============== S U B R O U T I N E =======================================


sub_1942C:
                
                move.w  d0,d1
                bsr.s   sub_19458
                bclr    #1,((byte_FFB56E-$1000000)).w
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   return_19456
                bchg    #0,((byte_FFB56E-$1000000)).w
                bne.s   loc_1944E
                lea     ($3200).w,a1
                bra.s   loc_19452
loc_1944E:
                
                lea     ($2000).w,a1
loc_19452:
                
                bsr.w   VInt_LoadAllyBattleSpriteFrame
return_19456:
                
                rts

    ; End of function sub_1942C


; =============== S U B R O U T I N E =======================================


sub_19458:
                
                tst.b   ((byte_FFB56D-$1000000)).w
                beq.s   return_19462
                jsr     (WaitForVInt).w
return_19462:
                
                rts

    ; End of function sub_19458


; =============== S U B R O U T I N E =======================================


sub_19464:
                
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   return_194A8
                move.w  d1,-(sp)
                move.w  d1,-(sp)
                andi.w  #$F,d0
                cmpi.w  #$F,d0
                beq.s   loc_19480
                bsr.w   sub_194AA
                bra.s   loc_19486
loc_19480:
                
                bchg    #2,((byte_FFB56E-$1000000)).w
loc_19486:
                
                move.w  (sp)+,d6
                asr.w   #8,d6
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_19496
                addi.w  #$60,d6 
loc_19496:
                
                bsr.w   sub_1F214
                move.w  (sp)+,d6
                ext.w   d6
                neg.w   d6
                bsr.w   sub_1F254
                bsr.w   sub_1EF2E
return_194A8:
                
                rts

    ; End of function sub_19464


; =============== S U B R O U T I N E =======================================


sub_194AA:
                
                move.w  d0,-(sp)
                bsr.s   sub_19458
                move.w  (sp)+,d1
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   return_194FC
                bsr.w   LoadEnemyBattleSpriteFrame
                lea     (FF8804_LOADING_SPACE).l,a0
                btst    #2,((byte_FFB56E-$1000000)).w
                beq.s   loc_194D8
                lea     ($4400).w,a1
                bra.s   loc_194DC
loc_194D8:
                
                lea     ($5C00).w,a1
loc_194DC:
                
                move.w  #$600,d0
                move.w  #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  #$600,d0
                move.w  #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
return_194FC:
                
                rts

    ; End of function sub_194AA


; =============== S U B R O U T I N E =======================================


sub_194FE:
                
                move.w  d1,d0
                asr.w   #8,d0
                ext.w   d1

    ; End of function sub_194FE


; =============== S U B R O U T I N E =======================================


sub_19504:
                
                cmpi.b  #$FF,((BATTLE_BACKGROUND-$1000000)).w
                beq.s   return_19544
                lea     spr_1F686(pc), a0
                btst    #0,((byte_FFB56F-$1000000)).w
                beq.s   loc_19520
                lea     $18(a0),a0
                subi.w  #$70,d0 
loc_19520:
                
                lea     ((SPRITE_14-$1000000)).w,a1
                moveq   #2,d7
loc_19526:
                
                move.w  (a0)+,(a1)
                add.w   d1,(a1)+
                move.l  (a0)+,(a1)+
                move.w  (a0)+,(a1)
                add.w   d0,(a1)+
                dbf     d7,loc_19526
                move.w  #$101,d0
                move.w  d0,(word_FFAFAE).l
                move.b  d0,(byte_FFAFB0).l
return_19544:
                
                rts

    ; End of function sub_19504


; =============== S U B R O U T I N E =======================================


sub_19546:
                
                move.w  d1,d0
                asr.w   #8,d0
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
                asr.w   #8,d0
                ext.w   d1

    ; End of function sub_1955E


; =============== S U B R O U T I N E =======================================


sub_19564:
                
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
                
                cmpi.w  #$FFFF,((ALLY_WEAPON_SPRITE-$1000000)).w
                beq.w   return_195E0
                move.b  ((WEAPON_FRAME_INDEX-$1000000)).w,d7
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_195AC
                bchg    #4,d7
                subi.w  #$70,d0 
loc_195AC:
                
                lea     spr_1F606(pc), a0
                andi.w  #$30,d7 
                add.w   d7,d7
                adda.w  d7,a0
                lea     ((SPRITE_10-$1000000)).w,a1
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
                move.l  d0,(dword_FFAFAA).l
return_195E0:
                
                rts

    ; End of function sub_19564


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
                
                cmpi.w  #$FFFF,((BATTLESCENE_ALLY-$1000000)).w
                beq.s   return_19630
                bclr    #1,((byte_FFB56E-$1000000)).w
                clr.b   ((byte_FFB57E-$1000000)).w
                bsr.w   sub_19AB0
                lea     word_196B4(pc), a1
                moveq   #7,d7
loc_1961A:
                
                move.w  (a1),d0
                swap    d0
                move.w  (a1)+,d0
                move.w  (a1)+,d1
                movem.l d7/a1,-(sp)
                bsr.s   sub_19632
                movem.l (sp)+,d7/a1
                dbf     d7,loc_1961A
return_19630:
                
                rts

    ; End of function sub_195FE


; =============== S U B R O U T I N E =======================================


sub_19632:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                adda.w  d1,a0
                move.w  #$23F,d7
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
                cmpi.w  #$FFFF,((ALLY_WEAPON_SPRITE-$1000000)).w
                beq.s   loc_196B0
                lea     ($D800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
loc_196B0:
                
                jmp     (WaitForVInt).w

    ; End of function sub_19632

word_196B4:     dc.w $FFF
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
                
                cmpi.w  #$FFFF,((BATTLESCENE_ENEMY-$1000000)).w
                beq.s   return_1971A
                bclr    #3,((byte_FFB56E-$1000000)).w
                clr.b   ((byte_FFB57F-$1000000)).w
                move.w  ((ENEMY_BATTLE_SPRITE-$1000000)).w,d0
                btst    #2,((byte_FFB56E-$1000000)).w
                bne.s   loc_196F6
                clr.w   d1
                bra.s   loc_196FA
loc_196F6:
                
                bsr.w   GetEnemyBattleSpriteIdleAnimate
loc_196FA:
                
                bsr.w   LoadEnemyBattleSpriteFrame
                lea     word_19764(pc), a1
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

word_19764:     dc.w $FFF
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
                cmpi.w  #$FFFF,d0
                beq.s   return_197A4
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d1
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.b  d0,(a0,d1.w)
                move.b  #$FF,1(a0,d1.w)
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
return_197A4:
                
                rts

    ; End of function AddAllyToDeadList


; =============== S U B R O U T I N E =======================================

; add enemy to dead combatant list


AddEnemyToDeadList:
                
                move.w  ((BATTLESCENE_ENEMY-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                beq.s   return_197C6
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d1
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.b  d0,(a0,d1.w)
                move.b  #$FF,1(a0,d1.w)
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
return_197C6:
                
                rts

    ; End of function AddEnemyToDeadList


; =============== S U B R O U T I N E =======================================

; In: D1 = animation type, Out: A0 = animation pointer


GetAllyAnimation:
                
                movem.l d1-d2,-(sp)
                
                ; Check if regular attack animation type
                tst.w   d1
                bne.w   @CheckSpecialAnimation
                
                ; Check if centaur battle sprite
                moveq   #ALLYBATTLEANIMATION_SPECIALS_START,d2
                cmpi.w  #ALLYBATTLESPRITE_KNTE,((ALLY_BATTLE_ANIMATION-$1000000)).w
                beq.w   @CheckSpearWeaponSprites
                addq.w  #1,d2
                cmpi.w  #ALLYBATTLESPRITE_PLDN,((ALLY_BATTLE_ANIMATION-$1000000)).w
                beq.w   @CheckSpearWeaponSprites
                addq.w  #1,d2
                cmpi.w  #ALLYBATTLESPRITE_PGNT,((ALLY_BATTLE_ANIMATION-$1000000)).w
                bne.w   @CheckSpecialAnimation
@CheckSpearWeaponSprites:
                
                cmpi.w  #WEAPONSPRITE_SPEAR,((ALLY_WEAPON_SPRITE-$1000000)).w
                bcs.w   @CheckSpecialAnimation
                cmpi.w  #WEAPONSPRITE_JAVELIN,((ALLY_WEAPON_SPRITE-$1000000)).w
                bhi.w   @CheckSpecialAnimation
                move.w  d2,d1
                bra.w   @GetAnimationPointer
@CheckSpecialAnimation:
                
                cmpi.w  #ALLYBATTLEANIMATION_SPECIALS_START,d1
                bcc.s   @GetAnimationPointer
                
                ; Check if dodge animation type
                cmpi.w  #BATTLEANIMATION_DODGE,d1
                bne.s   @Default        
                moveq   #ALLYBATTLEANIMATION_DODGES_START,d1
                bra.s   @GetAnimationIndex
@Default:
                
                clr.w   d1              ; default to regular attack animation
@GetAnimationIndex:
                
                add.w   ((ALLY_BATTLE_ANIMATION-$1000000)).w,d1
@GetAnimationPointer:
                
                movea.l (p_pt_AllyAnimations).l,a0
                lsl.w   #2,d1
                movea.l (a0,d1.w),a0
                movem.l (sp)+,d1-d2
                rts

    ; End of function GetAllyAnimation


; =============== S U B R O U T I N E =======================================

; In: D1 = animation type, Out: A0 = animation pointer


GetEnemyAnimation:
                
                move.w  d1,-(sp)
                cmpi.w  #ENEMYBATTLEANIMATION_SPECIALS_START,d1
                bcc.s   @GetAnimationPointer
                cmpi.w  #BATTLEANIMATION_DODGE,d1
                bne.s   @Default
                moveq   #ENEMYBATTLEANIMATION_DODGES_START,d1
                bra.s   @GetAnimationIndex
@Default:
                
                clr.w   d1
@GetAnimationIndex:
                
                add.w   ((ENEMY_BATTLE_ANIMATION-$1000000)).w,d1
@GetAnimationPointer:
                
                movea.l (p_pt_EnemyAnimations).l,a0
                lsl.w   #2,d1
                movea.l (a0,d1.w),a0
                move.w  (sp)+,d1
                rts

    ; End of function GetEnemyAnimation


; =============== S U B R O U T I N E =======================================

; Return whether or not ally battle sprite should animate when idle
; 
;       In: D0 = ally battle sprite index
; 
;       Out: D1 = 0 if animates, 1 if not


GetAllyBattleSpriteIdleAnimate:
                
                move.l  a0,-(sp)
                lea     tbl_AllyBattleSpriteIdleAnimate(pc), a0
                bra.w   loc_19870

    ; End of function GetAllyBattleSpriteIdleAnimate


; =============== S U B R O U T I N E =======================================

; Return whether or not enemy battle sprite should animate when idle
; 
;       In: D0 = enemy battle sprite index
; 
;       Out: D1 = 0 if animates, 1 if not


GetEnemyBattleSpriteIdleAnimate:
                
                move.l  a0,-(sp)
                lea     tbl_EnemyBattleSpriteIdleAnimate(pc), a0
loc_19870:
                
                moveq   #0,d1
loc_19872:
                
                cmp.b   (a0),d0
                beq.w   loc_19880
                cmpi.b  #CODE_TERMINATOR_BYTE,(a0)+
                bne.s   loc_19872
                moveq   #1,d1
loc_19880:
                
                movea.l (sp)+,a0
                rts

    ; End of function GetEnemyBattleSpriteIdleAnimate


; =============== S U B R O U T I N E =======================================

; clears plt 1-2 and 1-2bis, sets plt 3bis


InitializeBattlescenePalettes:
                
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a1
                moveq   #$1F,d0
loc_1988E:
                
                clr.l   (a0)+
                clr.l   (a1)+
                dbf     d0,loc_1988E
                lea     plt_BattlesceneBasePalette(pc), a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                moveq   #7,d0
loc_198A0:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_198A0
                rts

    ; End of function InitializeBattlescenePalettes

plt_BattlesceneBasePalette:
                incbin "data/graphics/battles/plt_battlescenebasepalette.bin" 
                                                        ; Base palette for battlescene UI and ground

; =============== S U B R O U T I N E =======================================


sub_198C8:
                
                movem.l d0/a0-a1,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                move.w  #$BF,d0 
loc_198D6:
                
                move.w  #$6000,(a0)+
                dbf     d0,loc_198D6
                moveq   #$1F,d0
loc_198E0:
                
                move.w  #$40F8,(a0)+
                dbf     d0,loc_198E0
                lea     BackgroundLayout(pc), a1
                move.w  #$BF,d0 
loc_198F0:
                
                move.l  (a1)+,(a0)+
                dbf     d0,loc_198F0
                moveq   #$1F,d0
loc_198F8:
                
                move.w  #$40F8,(a0)+
                dbf     d0,loc_198F8
                move.w  #$17F,d0
loc_19904:
                
                move.w  #$6000,(a0)+
                dbf     d0,loc_19904
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function sub_198C8


; START OF FUNCTION CHUNK FOR bsc07_switchAllies

loc_19912:
                
                btst    #4,((byte_FFB56F-$1000000)).w
                beq.s   loc_1991C
                rts
loc_1991C:
                
                moveq   #$10,d0
                jsr     (InitSprites).w 
                jmp     (sub_1942).w    

; END OF FUNCTION CHUNK FOR bsc07_switchAllies


; =============== S U B R O U T I N E =======================================


sub_19926:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                move.w  #$1FF,d0
                moveq   #0,d1
loc_19932:
                
                move.l  d1,(a0)+
                dbf     d0,loc_19932
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jmp     (EnableDmaQueueProcessing).w

    ; End of function sub_19926


; =============== S U B R O U T I N E =======================================


sub_19952:
                
                movem.l d0/a0,-(sp)
                lea     ((SPRITE_14-$1000000)).w,a0
                moveq   #2,d0
loc_1995C:
                
                move.w  #1,(a0)+
                clr.l   (a0)+
                move.w  #1,(a0)+
                dbf     d0,loc_1995C
                movem.l (sp)+,d0/a0
                rts

    ; End of function sub_19952


; =============== S U B R O U T I N E =======================================


sub_19970:
                
                getEnemyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,((ENEMY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w
                move.w  (a0)+,((ENEMY_BATTLESPRITE_PROP1-$1000000)).w
                move.w  (a0),d0
                adda.w  d0,a0
                lsl.w   #5,d1
                adda.w  d1,a0
                lea     ((PALLETE_2_BASE-$1000000)).w,a1
                clr.w   (a1)+
                addq.w  #2,a0
                moveq   #$E,d0
loc_19996:
                
                move.w  (a0)+,(a1)+
                dbf     d0,loc_19996
                
                restoreRomBanks
                rts

    ; End of function sub_19970


; =============== S U B R O U T I N E =======================================


sub_1999E:
                
                getEnemyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$C00,d0
                dmaBattlespriteFrame

    ; End of function sub_1999E


; =============== S U B R O U T I N E =======================================


sub_199BC:
                
                getEnemyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$C00,d0
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                waitForBattlespriteDma

    ; End of function sub_199BC


; =============== S U B R O U T I N E =======================================

; load palette D1 of battle sprite D0


LoadPaletteForBattlescene:
                
                getAllyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,((ALLY_BATTLESPRITE_ANIMATION_SPEED-$1000000)).w
                move.w  (a0)+,((ALLY_BATTLESPRITE_PROP1-$1000000)).w
                move.w  (a0),d0
                adda.w  d0,a0
                lsl.w   #5,d1
                adda.w  d1,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                clr.w   (a1)+
                addq.w  #2,a0
                moveq   #$E,d0
@Loop:
                
                move.w  (a0)+,(a1)+
                dbf     d0,@Loop
                
                restoreRomBanks
                rts

    ; End of function LoadPaletteForBattlescene


; =============== S U B R O U T I N E =======================================

; In: D0 = battle sprite index
;     D1 = frame index


LoadAllyBattleSpriteFrame:
                
                getAllyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$900,d0
                dmaBattlespriteFrame

    ; End of function LoadAllyBattleSpriteFrame


; =============== S U B R O U T I N E =======================================

; In: D0 = battle sprite index
;     D1 = frame index


VInt_LoadAllyBattleSpriteFrame:
                
                getAllyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$900,d0
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                waitForBattlespriteDma

    ; End of function VInt_LoadAllyBattleSpriteFrame


; =============== S U B R O U T I N E =======================================


LoadWeaponPalette:
                
                movea.l (p_plt_BattlesceneWeaponColors).l,a0
                lsl.w   #2,d0
                move.l  (a0,d0.w),((PALETTE_1_BASE_0E-$1000000)).w
                rts

    ; End of function LoadWeaponPalette


; =============== S U B R O U T I N E =======================================

; In: D0 = weapon sprite index


LoadWeaponSprite:
                
                movea.l (p_pt_WeaponSprites).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     (FF2000_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (byte_FF4000).l,a0
                move.w  #$1FF,d0
loc_19A7C:
                
                clr.l   (a0)+
                dbf     d0,loc_19A7C
                rts

    ; End of function LoadWeaponSprite


; =============== S U B R O U T I N E =======================================


LoadBattlesceneGround:
                
                movea.l (p_pt_BattlesceneGrounds).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.l  (a0)+,6(a1)
                move.w  (a0)+,$10(a1)
                move.w  (a0),d0
                adda.w  d0,a0
                lea     ($F000).l,a1
                move.w  #$300,d0
                jmp     (ApplyImmediateVramDmaOnCompressedTiles).w
                rts

    ; End of function LoadBattlesceneGround


; =============== S U B R O U T I N E =======================================


sub_19AB0:
                
                getAllyBattlespritePointer
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                btst    #0,((byte_FFB56E-$1000000)).w
                beq.s   loc_19AD6
                move.w  ((ALLY_BATTLE_SPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattleSpriteIdleAnimate
                add.w   d1,d1
                adda.w  d1,a0
loc_19AD6:
                
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                loadBattlesprite

    ; End of function sub_19AB0


; =============== S U B R O U T I N E =======================================


LoadNewAllyBattleSprite:
                
                move.w  d1,-(sp)
                move.w  d0,-(sp)
                getAllyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                move.w  (a0),d0
                move.l  a0,-(sp)
                adda.w  d0,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                bsr.w   GetAllyBattleSpriteIdleAnimate
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (FF7A02_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                restoreRomBanks
                move.w  (sp)+,d1
                rts

    ; End of function LoadNewAllyBattleSprite


; =============== S U B R O U T I N E =======================================


LoadEnemyBattleSpriteFrame:
                
                getEnemyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                loadBattlesprite

    ; End of function LoadEnemyBattleSpriteFrame


; =============== S U B R O U T I N E =======================================

; d0 : battle sprite index


LoadEnemyBattleSprite:
                
                cmpi.w  #$FFFF,d0
                beq.w   return_19B7E
                
                getEnemyBattlespritePointer
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                move.w  (a0),d0
                adda.w  d0,a0           ; offset to sprite frame
                lea     (ENEMY_BATTLESPRITE_UNCOMP_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (ENEMY_BATTLESPRITE_UNCOMP_SPACE).l,a0
                lea     (FF5000_LOADING_SPACE).l,a1
                move.w  #$1FF,d0
loc_19B78:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_19B78
                
                restoreRomBanks
return_19B7E:
                
                rts

    ; End of function LoadEnemyBattleSprite


; =============== S U B R O U T I N E =======================================


LoadBattleBackground:
                
                tst.w   d0
                bmi.s   return_19BCA
                movea.l (p_pt_Backgrounds).l,a2
                lsl.w   #2,d0
                movea.l (a2,d0.w),a2
                move.w  (a2)+,d0        ; tileset 1 offset
                movem.l a1-a2,-(sp)
                lea     -2(a2,d0.w),a0
                jsr     (LoadCompressedData).w
                movem.l (sp)+,a1-a2
                move.w  (a2)+,d0
                move.l  a2,-(sp)
                lea     -2(a2,d0.w),a0  ; tileset 2 offset
                lea     $1800(a1),a1
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a2
                move.w  (a2),d0
                lea     (a2,d0.w),a0
                lea     ((byte_FFB542-$1000000)).w,a1
                addq.w  #2,a0
                clr.w   (a1)+
                moveq   #$E,d0
loc_19BC4:
                
                move.w  (a0)+,(a1)+
                dbf     d0,loc_19BC4
return_19BCA:
                
                rts

    ; End of function LoadBattleBackground


; =============== S U B R O U T I N E =======================================


LoadGround:
                
                movea.l (p_pt_BattlesceneGrounds).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.l  (a0)+,6(a1)
                move.w  (a0)+,$10(a1)
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (byte_FF8C02).l,a1
                jmp     (LoadCompressedData).w

    ; End of function LoadGround


; =============== S U B R O U T I N E =======================================


LoadInvocationSprite:
                
                movea.l (p_pt_InvocationSprites).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.l  a0,-(sp)
                addq.w  #6,a0
                move.w  (a0)+,d0
                lea     -2(a0,d0.w),a1
                addq.w  #2,a1
                lea     ((PALETTE_1_CURRENT_01-$1000000)).w,a2
                lea     ((PALETTE_1_BASE_01-$1000000)).w,a3
                moveq   #$E,d0
loc_19C14:
                
                move.w  (a1),(a2)+
                move.w  (a1)+,(a3)+
                dbf     d0,loc_19C14
                lsl.w   #2,d1
                adda.w  d1,a0
                move.w  (a0)+,d0
                move.l  a0,-(sp)
                lea     -2(a0,d0.w),a0
                move.w  #$900,d0
                btst    #6,((byte_FFB56E-$1000000)).w
                beq.s   loc_19C58
                lea     ($2000).w,a1
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForDmaQueueProcessing).w
                movea.l (sp)+,a0
                move.w  (a0),d0
                adda.w  d0,a0
                lea     ($3200).w,a1
                move.w  #$900,d0
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForDmaQueueProcessing).w
                bra.s   loc_19CA0
loc_19C58:
                
                lea     ($A400).l,a1
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForDmaQueueProcessing).w
                movea.l (sp)+,a0
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     ($B600).l,a1
                move.w  #$500,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                lea     ($D800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
loc_19CA0:
                
                movea.l (sp)+,a0
                rts

    ; End of function LoadInvocationSprite


; =============== S U B R O U T I N E =======================================

;     Loads spell animation tiles.
;     In: D0 = spell animation tileset index


LoadSpellGraphics:
                
                movea.l (p_pt_SpellGraphics).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,d0
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a1
                lea     ((PALETTE_3_BASE-$1000000)).w,a2
                move.w  (a0),$12(a1)
                move.w  (a0)+,$12(a2)
                move.w  (a0),$1A(a1)
                move.w  (a0)+,$1A(a2)
                move.w  (a0),$1C(a1)
                move.w  (a0)+,$1C(a2)
                jsr     (ApplyVIntCramDma).w
                lea     ($A400).l,a1
                lsr.w   #1,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jmp     (WaitForDmaQueueProcessing).w

    ; End of function LoadSpellGraphics


; =============== S U B R O U T I N E =======================================

; loads spell graphics


sub_19CE8:
                
                movea.l (p_pt_SpellGraphics).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,d0        ; load bytes 0-1
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a1
                lea     ((PALETTE_3_BASE-$1000000)).w,a2
                move.w  (a0),$12(a1)    ; load 3 colors on 3rd palette
                move.w  (a0)+,$12(a2)
                move.w  (a0),$1A(a1)
                move.w  (a0)+,$1A(a2)
                move.w  (a0),$1C(a1)
                move.w  (a0)+,$1C(a2)
                jsr     (ApplyVIntCramDma).w
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     ($F000).l,a1
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jmp     (WaitForDmaQueueProcessing).w

    ; End of function sub_19CE8


; =============== S U B R O U T I N E =======================================

; Get battle sprite and palette indexes for combatant D0 -> D1 (sprite), D2 (palette)


GetBattleSpriteAndPalette:
                
                cmpi.w  #$FFFF,d0
                bne.s   @Continue
                move.w  d0,d1
                move.w  d0,d2
                move.w  d0,d3
                rts
@Continue:
                
                cmpi.w  #COMBATANT_ENEMIES_START,d0
                bcc.w   @Enemy
                movem.l d0/a0,-(sp)
                jsr     j_GetClass
                lea     tbl_AllyBattleSprites(pc), a0
                mulu.w  #9,d0
                adda.w  d0,a0
                moveq   #2,d0
@FindClass_Loop:
                
                cmp.b   (a0)+,d1
                beq.s   @FoundClass
                addq.w  #2,a0
                dbf     d0,@FindClass_Loop
                
                ; return defaults if class not found
                clr.w   d1
                clr.w   d2
                clr.w   d3
                movem.l (sp)+,d0/a0
                rts
@FoundClass:
                
                move.b  (a0)+,d1
                ext.w   d1
                move.b  (a0),d2
                ext.w   d2
                move.w  d1,d3
                movem.l (sp)+,d0/a0
                rts
@Enemy:
                
                move.l  a0,-(sp)
                jsr     j_GetEnemyIndex
                lea     tbl_EnemyBattleSprites(pc), a0
                add.w   d1,d1
                move.b  1(a0,d1.w),d2
                ext.w   d2
                move.b  (a0,d1.w),d1
                ext.w   d1
                move.w  d1,d3
                movea.l (sp)+,a0
                rts

    ; End of function GetBattleSpriteAndPalette


; =============== S U B R O U T I N E =======================================

; Get battle sprite and palette indexes for combatant D0's equipped weapon -> D2 (sprite), D3 (palette)


GetWeaponSpriteAndPalette:
                
                movem.l d1/a0,-(sp)
                cmpi.w  #COMBATANT_ENEMIES_START,d0
                bcc.w   @Skip
                jsr     j_GetEquippedWeapon
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    lea     tbl_WeaponGraphics(pc), a0
                else
                    cmpi.w  #ITEMINDEX_WEAPONS_START,d1 ; HARDCODED start index for weapon items with battlescene graphics
                    bcs.w   @Skip
                    cmpi.w  #ITEMINDEX_WEAPONS_END,d1 ; HARDCODED end index for weapon items with battlescene graphics
                    bhi.w   @Skip
                    lea     tbl_WeaponGraphics(pc), a0
                    subi.w  #ITEMINDEX_WEAPONS_START,d1 ; Same here : HARDCODED start index for weapon items with battlescene graphics
                endif
                add.w   d1,d1
                move.b  (a0,d1.w),d2
                ext.w   d2
                move.b  1(a0,d1.w),d3
                ext.w   d3
                movem.l (sp)+,d1/a0
                rts
@Skip:
                
                move.w  #$FFFF,d2
                move.w  d2,d3
                movem.l (sp)+,d1/a0
                rts

    ; End of function GetWeaponSpriteAndPalette


; =============== S U B R O U T I N E =======================================


GetBattleBackground:
                
                movem.l d0/a0,-(sp)
                cmpi.w  #$FFFF,d0
                beq.s   @CheckCustomBackground
                cmpi.w  #$80,d0 
                bcs.s   @CheckCustomBackground
                jsr     j_GetEnemyIndex
                cmpi.w  #ENEMY_ZEON,d1  ; HARDCODED : if enemy is Zeon, get his own background
                bne.s   @CheckCustomBackground
                moveq   #BATTLEBACKGROUND_VERSUS_ZEON,d1
                bra.w   @Done
@CheckCustomBackground:
                
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                lea     tbl_CustomBackgrounds(pc), a0
                move.b  (a0,d1.w),d1    ; get battle's own background if it has one
                cmpi.b  #$FF,d1
                bne.w   @Done
                cmpi.w  #$FFFF,d0
                bne.s   @GetTerrainBackground
                move.w  ((word_FFB3FE-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                bne.s   @GetTerrainBackground
                clr.w   d0
@GetTerrainBackground:
                
                jsr     j_GetCurrentTerrainType
                andi.w  #$F,d0          ; get background according to terrain type
                move.b  tbl_TerrainBackgrounds(pc,d0.w),d1
                ext.w   d1
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetBattleBackground

