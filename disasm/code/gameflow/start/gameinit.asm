
; ASM FILE code\gameflow\start\gameinit.asm :
; 0x70D2..0x7186 : Game init

; =============== S U B R O U T I N E =======================================


InitializeGame:
                
                move    #$2300,sr
                bsr.w   LoadBaseTiles
                bsr.w   CheckRegion
                jsr     j_NewGame
                jsr     j_DisplaySegaLogo
                bne.w   AfterGameIntro  ; skip game intro if pressing Start at the SEGA logo
                
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.w   GameIntro
                
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   WaitForVInt
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @DebugModeMapTest
                
                jsr     (EnableDisplayAndInterrupts).w
                bsr.w   InitializeDisplay
                jsr     (EnableDisplayAndInterrupts).w
                jmp     j_nullsub_18010
@DebugModeMapTest:
                
                btst    #INPUT_BIT_UP,((PLAYER_1_INPUT-$1000000)).w
                bne.w   DebugModeBattleTest
                btst    #INPUT_BIT_DOWN,((PLAYER_1_INPUT-$1000000)).w
                beq.w   j_GameIntro
                
                jsr     (EnableDisplayAndInterrupts).w
                bsr.w   InitializeDisplay
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   FadeInFromBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                move.b  #-1,((DEBUG_MODE_TOGGLE-$1000000)).w
                bsr.w   InitializeWindowProperties
                
                ; Start map test
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                moveq   #0,d0
                moveq   #0,d1
                moveq   #MAPS_DEBUG_MAX_INDEX,d2
                jsr     j_NumberPrompt
                clr.w   d1
                move.b  table_DebugModeAvailableMaps(pc,d0.w),d0
                bsr.w   GetSavepointForMap
                moveq   #0,d4
                movem.w d0-d4,-(sp)
                move.w  #600,d0
                jsr     j_DebugSetFlag
                movem.w (sp)+,d0-d4
                jsr     j_ExplorationLoop
                bra.w   MainLoop        

    ; End of function InitializeGame

