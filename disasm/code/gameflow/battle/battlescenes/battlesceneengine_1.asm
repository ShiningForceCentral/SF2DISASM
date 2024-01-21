
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_1.asm :
; 0x19838..0x19DB0 : Battlescene engine

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
                
                add.w   ((BATTLESCENE_ENEMYBATTLEANIMATION-$1000000)).w,d1
@GetAnimationPointer:
                
                getPointer p_pt_EnemyAnimations, a0
                lsl.w   #INDEX_SHIFT_COUNT,d1
                movea.l (a0,d1.w),a0
                move.w  (sp)+,d1
                rts

    ; End of function GetEnemyAnimation


; =============== S U B R O U T I N E =======================================

; Return whether or not ally battlesprite d0.b should animate when idle.
; 
;       Out: d1.l = 0 if it animates, 1 if not


GetAllyBattlespriteIdleAnimate:
                
                move.l  a0,-(sp)
                lea     table_AnimatedWhenIdleAllyBattlesprites(pc), a0
                bra.w   GetBattlespriteIdleAnimate

    ; End of function GetAllyBattlespriteIdleAnimate


; =============== S U B R O U T I N E =======================================

; Return whether or not enemy battlesprite d0.b should animate when idle.
; 
;       Out: d1.l = 0 if it animates, 1 if not


GetEnemyBattlespriteIdleAnimate:
                
                move.l  a0,-(sp)
                lea     table_AnimatedWhenIdleEnemyBattlesprites(pc), a0
GetBattlespriteIdleAnimate:
                
                moveq   #0,d1
@FindBattlesprite_Loop:
                
                cmp.b   (a0),d0
                beq.w   @Found
                cmpi.b  #-1,(a0)+
                bne.s   @FindBattlesprite_Loop
                moveq   #1,d1
@Found:
                
                movea.l (sp)+,a0
                rts

    ; End of function GetEnemyBattlespriteIdleAnimate


; =============== S U B R O U T I N E =======================================

; Clear palettes 1-2 and 1-2bis, and load battlescene UI and ground palette to 3bis.


InitializeBattlescenePalettes:
                
                lea     ((PALETTE_1_BASE-$1000000)).w,a0
                lea     ((PALETTE_1_CURRENT-$1000000)).w,a1
                moveq   #31,d0
@ClearPalettes_Loop:
                
                clr.l   (a0)+
                clr.l   (a1)+
                dbf     d0,@ClearPalettes_Loop
                
                lea     palette_BattlesceneBase(pc), a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                moveq   #7,d0
@LoadBattlesceneBasePalette_Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d0,@LoadBattlesceneBasePalette_Loop
                
                rts

    ; End of function InitializeBattlescenePalettes

palette_BattlesceneBase:
                incbin "data/graphics/battles/battlescenebasepalette.bin" 
                                                        ; Base palette for battlescene UI and ground

; =============== S U B R O U T I N E =======================================


LoadBattlesceneBackgroundLayout:
                
                movem.l d0/a0-a1,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                move.w  #191,d0
loc_198D6:
                
                move.w  #VDPTILE_PALETTE4,(a0)+
                dbf     d0,loc_198D6
                moveq   #31,d0
loc_198E0:
                
                move.w  #VDPTILE_BLANK|VDPTILE_PALETTE3,(a0)+
                dbf     d0,loc_198E0
            if (STANDARD_BUILD=1)
                getPointer p_layout_BattlesceneBackground, a1
            else
                lea     layout_BattlesceneBackground(pc), a1
            endif
                move.w  #191,d0 
loc_198F0:
                
                move.l  (a1)+,(a0)+
                dbf     d0,loc_198F0
                moveq   #31,d0
loc_198F8:
                
                move.w  #VDPTILE_BLANK|VDPTILE_PALETTE3,(a0)+
                dbf     d0,loc_198F8
                move.w  #383,d0
loc_19904:
                
                move.w  #VDPTILE_PALETTE4,(a0)+
                dbf     d0,loc_19904
                
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function LoadBattlesceneBackgroundLayout


; START OF FUNCTION CHUNK FOR bsc07_switchAllies

loc_19912:
                
                btst    #4,((byte_FFB56F-$1000000)).w
                beq.s   loc_1991C
                rts
loc_1991C:
                
                moveq   #$10,d0
                jsr     (InitializeSprites).w
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
                lea     ((SPRITE_BATTLESCENE_GROUND-$1000000)).w,a0
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

; In: d0.w = enemy battlesprite index
;     d1.w = palette index


LoadEnemyBattlespritePropertiesAndPalette:
                
                getPointer p_pt_EnemyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,((BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w
                move.w  (a0)+,((ENEMY_BATTLESPRITE_PROP1-$1000000)).w
                move.w  (a0),d0
                adda.w  d0,a0           ; a0 = pointer to palettes
                lsl.w   #5,d1
                adda.w  d1,a0
                lea     ((PALLETE_2_BASE-$1000000)).w,a1
                clr.w   (a1)+
                addq.w  #2,a0
                moveq   #14,d0
@Loop:
                
                move.w  (a0)+,(a1)+
                dbf     d0,@Loop
                
                rts

    ; End of function LoadEnemyBattlespritePropertiesAndPalette


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy battlesprite index
;     d1.w = frame index


LoadEnemyBattlespriteFrameToVram:
                
                getPointer p_pt_EnemyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$C00,d0
                jmp     (ApplyImmediateVramDmaOnCompressedTiles).w

    ; End of function LoadEnemyBattlespriteFrameToVram


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy battlesprite index
;     d1.w = frame index


LoadEnemyBattlespriteFrameAndWaitForDma:
                
                disableSramAndSwitchRomBanks
                getPointer p_pt_EnemyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$C00,d0
                processDmaRestoreRomBanksAndEnableSram ApplyVIntVramDmaOnCompressedTiles

    ; End of function LoadEnemyBattlespriteFrameAndWaitForDma


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally battlesprite index
;     d1.w = palette index


LoadAllyBattlespritePropertiesAndPalette:
                
                getPointer p_pt_AllyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,((BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED-$1000000)).w
                move.w  (a0)+,((ALLY_BATTLESPRITE_PROP1-$1000000)).w
                move.w  (a0),d0
                adda.w  d0,a0           ; a0 = pointer to palettes
                lsl.w   #5,d1
                adda.w  d1,a0
                lea     ((PALETTE_1_BASE-$1000000)).w,a1
                clr.w   (a1)+
                addq.w  #2,a0
                moveq   #14,d0
@Loop:
                
                move.w  (a0)+,(a1)+
                dbf     d0,@Loop
                
                rts

    ; End of function LoadAllyBattlespritePropertiesAndPalette


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally battlesprite index
;     d1.w = frame index


LoadAllyBattlespriteFrameToVram:
                
                getPointer p_pt_AllyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$900,d0
                jmp     (ApplyImmediateVramDmaOnCompressedTiles).w

    ; End of function LoadAllyBattlespriteFrameToVram


; =============== S U B R O U T I N E =======================================

; In: a1 = frame location in VRAM
;     d0.w = ally battlesprite index
;     d1.w = frame index


LoadAllyBattlespriteFrameAndWaitForDma:
                
                disableSramAndSwitchRomBanks
                getPointer p_pt_AllyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                move.w  #$900,d0
                processDmaRestoreRomBanksAndEnableSram ApplyVIntVramDmaOnCompressedTiles

    ; End of function LoadAllyBattlespriteFrameAndWaitForDma


; =============== S U B R O U T I N E =======================================

; In: d0.w = weapon palette index


LoadWeaponPalette:
                
                getPointer p_WeaponPalettes, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                move.l  (a0,d0.w),((PALETTE_1_BASE_0E-$1000000)).w
                rts

    ; End of function LoadWeaponPalette


; =============== S U B R O U T I N E =======================================

; In: d0.w = weaponsprite index


LoadWeaponsprite:
                
                getPointer p_pt_Weaponsprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                lea     (FF2000_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                lea     (byte_FF4000).l,a0
                move.w  #511,d0
@Loop:
                
                clr.l   (a0)+
                dbf     d0,@Loop
                
                rts

    ; End of function LoadWeaponsprite


; =============== S U B R O U T I N E =======================================


LoadBattlesceneGroundToVram:
                
                getPointer p_pt_Grounds, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.l  (a0)+,6(a1)     ; replace base palette color indexes 3, 4, and 8
                move.w  (a0)+,$10(a1)
                move.w  (a0),d0
                adda.w  d0,a0
                lea     ($F000).l,a1
                move.w  #$300,d0
                jmp     (ApplyImmediateVramDmaOnCompressedTiles).w

    ; End of function LoadBattlesceneGroundToVram

                rts

; =============== S U B R O U T I N E =======================================

; In: d0.w = ally battlesprite index
;     d1.w = frame index


LoadAllyBattlespriteFrame:
                
                disableSramAndSwitchRomBanks
                getPointer p_pt_AllyBattlesprites, a0
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                btst    #0,((byte_FFB56E-$1000000)).w
                beq.s   loc_19AD6
                move.w  ((BATTLESCENE_ALLYBATTLESPRITE-$1000000)).w,d0
                bsr.w   GetAllyBattlespriteIdleAnimate
                add.w   d1,d1
                adda.w  d1,a0
loc_19AD6:
                
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                loadCompressedDataRestoreRomBanksAndEnableSram

    ; End of function LoadAllyBattlespriteFrame


; =============== S U B R O U T I N E =======================================


LoadNewAllyBattlesprite:
                
                move.w  d1,-(sp)
                move.w  d0,-(sp)
                getPointer p_pt_AllyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                move.w  (a0),d0
                move.l  a0,-(sp)
                adda.w  d0,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                bsr.w   GetAllyBattlespriteIdleAnimate
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (ALLY_BATTLESPRITE_FRAME_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                move.w  (sp)+,d1
                rts

    ; End of function LoadNewAllyBattlesprite


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy battlesprite index
;     d1.w = frame index


LoadEnemyBattlespriteFrame:
                
                disableSramAndSwitchRomBanks
                getPointer p_pt_EnemyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                add.w   d1,d1
                adda.w  d1,a0
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                loadCompressedDataRestoreRomBanksAndEnableSram

    ; End of function LoadEnemyBattlespriteFrame


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy battlesprite index


LoadNewEnemyBattlesprite:
                
                cmpi.w  #-1,d0
                beq.w   @Return
                
                getPointer p_pt_EnemyBattlesprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                addq.w  #6,a0
                move.w  (a0),d0
                adda.w  d0,a0           ; a0 = pointer to sprite frame
                lea     (ENEMY_BATTLESPRITE_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                lea     (ENEMY_BATTLESPRITE_LOADING_SPACE).l,a0
                lea     (FF5000_LOADING_SPACE).l,a1
                move.w  #511,d0
@Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d0,@Loop
@Return:
                
                rts

    ; End of function LoadNewEnemyBattlesprite


; =============== S U B R O U T I N E =======================================

; In: d0.w = battlescene background index


LoadBattlesceneBackground:
                
                tst.w   d0
                bmi.s   @Return
                
                getPointer p_pt_Backgrounds, a2
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a2,d0.w),a2
                move.w  (a2)+,d0        ; tileset 1 offset
                
                movem.l a1-a2,-(sp)
                lea     -2(a2,d0.w),a0
                jsr     (LoadStackCompressedData).w
                movem.l (sp)+,a1-a2
                
                move.w  (a2)+,d0        ; tileset 2 offset
                
                move.l  a2,-(sp)
                lea     -2(a2,d0.w),a0
                lea     $1800(a1),a1
                jsr     (LoadStackCompressedData).w
                movea.l (sp)+,a2
                
                move.w  (a2),d0
                lea     (a2,d0.w),a0
                lea     ((BATTLESCENE_BACKGROUND_PALETTE-$1000000)).w,a1
                addq.w  #2,a0
                clr.w   (a1)+
                moveq   #14,d0
@Loop:
                
                move.w  (a0)+,(a1)+
                dbf     d0,@Loop
@Return:
                
                rts

    ; End of function LoadBattlesceneBackground


; =============== S U B R O U T I N E =======================================

; In: d0.w = battlescene ground index


LoadBattlesceneGround:
                
                getPointer p_pt_Grounds, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                lea     ((PALETTE_3_BASE-$1000000)).w,a1
                move.l  (a0)+,6(a1)     ; replace base palette color indexes 3, 4, and 8
                move.w  (a0)+,$10(a1)
                move.w  (a0),d0
                adda.w  d0,a0
                lea     (FF8C02_LOADING_SPACE).l,a1
                jmp     (LoadStackCompressedData).w

    ; End of function LoadBattlesceneGround


; =============== S U B R O U T I N E =======================================

; In: d0.w = invocation sprite index
;     d1.w = frame number


LoadInvocationSpriteFrameToVram:
                
                disableSram
                getPointer p_pt_InvocationSprites, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
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
                jsr     (LoadStackCompressedData).w
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
                enableSramAndReturn

    ; End of function LoadInvocationSpriteFrameToVram


; =============== S U B R O U T I N E =======================================

; In: d0.w = spellanimation graphics data index


LoadSpellGraphics:
                
                disableSram
                getPointer p_pt_SpellGraphics, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,d0
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a1
                lea     ((PALETTE_3_BASE-$1000000)).w,a2
                move.w  (a0),$12(a1)    ; replace base palette color indexes 9, 13, and 14
                move.w  (a0)+,$12(a2)
                move.w  (a0),$1A(a1)
                move.w  (a0)+,$1A(a2)
                move.w  (a0),$1C(a1)
                move.w  (a0)+,$1C(a2)
                jsr     (ApplyVIntCramDma).w
                lea     ($A400).l,a1
                lsr.w   #1,d0
                moveq   #2,d1
                processDmaAndEnableSram ApplyVIntVramDmaOnCompressedTiles

    ; End of function LoadSpellGraphics


; =============== S U B R O U T I N E =======================================

; Loads spell graphics for Apollo and Neptun invocations.
; 
; In: d0.w = spellanimation graphics data index


LoadSpellGraphicsForInvocation:
                
                disableSram
                getPointer p_pt_SpellGraphics, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
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
                jsr     (LoadStackCompressedData).w
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     ($F000).l,a1
                move.w  #$300,d0
                moveq   #2,d1
                processDmaAndEnableSram ApplyVIntVramDma

    ; End of function LoadSpellGraphicsForInvocation


; =============== S U B R O U T I N E =======================================

; Get battlesprite and palette indexes for combatant d0.w -> d1.w, d2.w


GetBattlespriteAndPalette:
                
                cmpi.w  #-1,d0
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
                lea     table_AllyBattlesprites(pc), a0
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
                jsr     j_GetEnemy
                lea     table_EnemyBattlesprites(pc), a0
                add.w   d1,d1
                move.b  1(a0,d1.w),d2
                ext.w   d2
                move.b  (a0,d1.w),d1
                ext.w   d1
                move.w  d1,d3
                movea.l (sp)+,a0
                rts

    ; End of function GetBattlespriteAndPalette

