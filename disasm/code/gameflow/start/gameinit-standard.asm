
; ASM FILE code\gameflow\start\gameinit-standard.asm :
; Game initialization

; =============== S U B R O U T I N E =======================================


InitializeGame:
                
                move    #$2300,sr
                
            if (MUSIC_RESUMING=0)
                deactivateMusicResuming
            endif
                
                jsr     (LoadBaseTiles).w
                
            if (MEMORY_MAPPER=1)
                tst.b   ((SRAM_CONTROL-$1000000)).w
                ble.s   @Continue
                bra.w   MapperErrorHandling
            endif
                
@Continue:      jsr     NewGame
                
            if (SKIP_SEGA_LOGO=1)
                ; Do nothing
            else
                jsr     DisplaySegaLogo
            endif
            if (SKIP_GAME_INTRO=1)
                bra.w   AfterGameIntro
            else
                bne.w   AfterGameIntro  ; skip game intro if pressing Start at the SEGA logo
            endif
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.w   GameIntro
                
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (WaitForVInt).w
            if (EASY_BATTLE_TEST=1)
                bra.w   DebugModeBattleTest
            elseif (EASY_DEBUG_MODE=1)
                ; flow into debug mode
            else
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @DebugModeMapTest
                
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (InitializeDisplay).w
                jmp     (EnableDisplayAndInterrupts).w
            endif
@DebugModeMapTest:
                
                btst    #INPUT_BIT_UP,((PLAYER_1_INPUT-$1000000)).w
                bne.s   DebugModeBattleTest
                
                btst    #INPUT_BIT_DOWN,((PLAYER_1_INPUT-$1000000)).w
                beq.w   GameIntro
                
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (InitializeDisplay).w
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (FadeInFromBlack).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                st      ((DEBUG_MODE_TOGGLE-$1000000)).w
                jsr     (InitializeWindowProperties).w
StartMapTest:
                
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                moveq   #0,d0
                moveq   #0,d1
                moveq   #MAPS_DEBUG_MAX_INDEX,d2 
                jsr     NumberPrompt
            if (TEST_BUILD=1)
                bpl.s   @ContinueMapTest
                rts
@ContinueMapTest:
            endif
                clr.w   d1
                jsr     (GetSavepointForMap).w
                moveq   #0,d4
                
                movem.w d0-d4,-(sp)
                move.w  #600,d0
                jsr     DebugSetFlag
                movem.w (sp)+,d0-d4
                
                jsr     ExplorationLoop
                jmp     (MainLoop).w

    ; End of function InitializeGame

