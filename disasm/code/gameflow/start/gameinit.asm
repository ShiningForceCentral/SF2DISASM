
; ASM FILE code\gameflow\start\gameinit.asm :
; 0x70D2..0x7186 : Game init

; =============== S U B R O U T I N E =======================================


InitializeGame:
                
                move    #$2300,sr
                bsr.w   LoadBaseTiles
            if (regionFreeRom=0)
                bsr.w   CheckRegion
            endif
            
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                tst.b   ((SRAM_CONTROL-$1000000)).w
                ble.s   @Continue
                jmp     MapperErrorHandling
            endif
                
@Continue:      jsr     j_NewGame
                
            if (STANDARD_BUILD&TEST_BUILD&TEST_BUILD_SKIP_SEGA_LOGO=1)
            else
                jsr     j_DisplaySegaLogo
            endif
            
            if (STANDARD_BUILD&TEST_BUILD&TEST_BUILD_SKIP_GAME_INTRO=1)
                bra.w   AfterGameIntro
            else
                bne.w   AfterGameIntro
            endif
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.w   GameIntro
                
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   WaitForVInt
            if (STANDARD_BUILD&EASY_BATTLE_TEST=1)
                bra.w   DebugModeBattleTest
            elseif (STANDARD_BUILD&EASY_DEBUG_MODE=1)
                ; flow into debug mode
            else
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                beq.s   @DebugModeMapTest
                jsr     (EnableDisplayAndInterrupts).w
                bsr.w   InitializeDisplay
                jsr     (EnableDisplayAndInterrupts).w
                jmp     j_nullsub_18010
            endif
@DebugModeMapTest:
                
                btst    #INPUT_BIT_UP,((P1_INPUT-$1000000)).w
                bne.w   DebugModeBattleTest
                btst    #INPUT_BIT_DOWN,((P1_INPUT-$1000000)).w
                beq.w   j_GameIntro
                jsr     (EnableDisplayAndInterrupts).w
                bsr.w   InitializeDisplay
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   FadeInFromBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                move.b  #$FF,((DEBUG_MODE_ACTIVATED-$1000000)).w
                bsr.w   InitializeWindowProperties
StartMapTest:
                
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                moveq   #0,d0
                moveq   #0,d1
                moveq   #MAPS_DEBUG_NUMBER,d2
                jsr     j_NumberPrompt
            if (STANDARD_BUILD&TEST_BUILD=1)
                bpl.s   @Continue
                rts
@Continue:
            endif
                clr.w   d1
                move.b  tbl_DebugModeAvailableMaps(pc,d0.w),d0
                bsr.w   GetSavePointForMap
                moveq   #0,d4
                movem.w d0-d4,-(sp)
                move.w  #600,d0
                jsr     j_DebugFlagSetter
                movem.w (sp)+,d0-d4
                jsr     j_ExplorationLoop
                bra.w   MainLoop        

    ; End of function InitializeGame

