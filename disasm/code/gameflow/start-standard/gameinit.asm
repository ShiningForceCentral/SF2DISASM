
; ASM FILE code\gameflow\start-standard\gameinit.asm :
; Game initialization

; =============== S U B R O U T I N E =======================================


LoadBaseTiles:
                
                jsr     (DisableDisplayAndInterrupts).w
                jsr     (ClearVsramAndSprites).w
                move.w  #$8C00,d0       ; H32 cell mode, no interlace
                jsr     (SetVdpReg).w
                move.w  #$9000,d0       ; scroll size : V32 cell, H32 cell
                jsr     (SetVdpReg).w
                move.w  #$8230,d0       ; scroll A table VRAM address : C000
                jsr     (SetVdpReg).w
                move.w  #$8407,d0       ; scroll B table VRAM address : E000
                jsr     (SetVdpReg).w
                move.w  #$8B00,d0       ; disable external interrupt, full scrolls
                jsr     (SetVdpReg).w
                move.w  #$8D3B,d0       ; H Scroll table VRAM address : EC00
                jsr     (SetVdpReg).w
                getPointer p_tiles_Base, a0
                lea     (0).w,a1
                move.w  #4096,d0
                moveq   #2,d1
                jmp     (ApplyImmediateVramDmaOnCompressedTiles).w

    ; End of function LoadBaseTiles


; =============== S U B R O U T I N E =======================================


InitializeGame:
                
                move    #$2300,sr
            if (MUSIC_RESUMING=1)
                activateMusicResuming
            else
                deactivateMusicResuming
            endif
                bsr.s   LoadBaseTiles
                
            if (MEMORY_MAPPER=1)
                tst.b   ((SRAM_CONTROL-$1000000)).w
                ble.s   @MapperOk
                bra.w   MapperErrorHandling
            endif
                
@MapperOk:      jsr     NewGame
            if (TEST_BUILD|AUTO_DEBUG_MODE=1)
                ; Skip checking toggle
            else
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @Continue
            endif
                
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (WaitForVInt).w
            if (TEST_BUILD=1)
                ; Skip checking input
            else
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Continue
            endif
                
                ; Open the configuration screen
                sndCom  MUSIC_BATTLE_THEME_3
                jsr     (InitializeDisplay).w
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (FadeInFromBlack).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                jsr     (InitializeWindowProperties).w
                moveq   #CONFIGURATION_BATTLE_TEST,d0
                jsr     ConfigurationScreenBattleTest
            if (SKIP_GAME_INTRO=1)
                bra.s   @AfterGameIntro
            else
                bra.s   @GameIntro
            endif
@Continue:
                ; Play the SEGA logo sequence
            if (SKIP_SEGA_LOGO=1)
                ; Do nothing
            else
                jsr     DisplaySegaLogo
            endif
            if (SKIP_GAME_INTRO=1)
                bra.s   @AfterGameIntro
            else
                bne.s   @AfterGameIntro  ; skip game intro if pressing Start at the SEGA logo
            endif
@GameIntro:     
                ; Play the intro cutscene
                move.l  sp,(GAME_INTRO_STACK_POINTER_BACKUP).l
                move.l  #@AfterGameIntro,((AFTER_INTRO_JUMP_POINTER-$1000000)).w
                jsr     (EnableDisplayAndInterrupts).w
            if (SCROLLING_TEXT_INTRODUCTION=1)
                bsr.w   PlayTextIntro   ; TEXT INTRO CALL
            endif
                clr.w   d0
                jsr     PlayIntroOrEndCutscene
                clr.l   ((AFTER_INTRO_JUMP_POINTER-$1000000)).w
@AfterGameIntro:
                
                clr.w   ((QUAKE_AMPLITUDE-$1000000)).w
                move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
                jsr     (EnableInterrupts).w
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #CRAM_SIZE,d7
                jsr     (CopyBytes).w
                jsr     (FadeOutToBlack).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (WaitForDmaQueueProcessing).w
                jsr     (InitializeDisplay).w
            if (SKIP_TITLE_SCREEN=1)
                bra.w   StartWitchScreen   
            else
                jsr     (DisableDisplayAndInterrupts).w
                sndCom  MUSIC_TITLE
                bsr.s   StartTitleScreen
                bne.w   StartWitchScreen   
@Reset:         jmp     (ResetGame).w
            endif

    ; End of function InitializeGame
