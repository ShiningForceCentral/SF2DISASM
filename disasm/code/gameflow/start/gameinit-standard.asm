
; ASM FILE code\gameflow\start\gameinit-standard.asm :
; Game initialization

; =============== S U B R O U T I N E =======================================


InitializeGame:
                
                move    #$2300,sr
            if (MUSIC_RESUMING=0)
                deactivateMusicResuming
            endif
                jsr     (LoadBaseTiles).w
                jsr     NewGame
                jsr     DisplaySegaLogo
                bne.w   AfterGameIntro  ; skip game intro if pressing Start at the SEGA logo
                
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.w   GameIntro
                
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                beq.s   @DebugModeMapTest
                
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (InitializeDisplay).w
                jmp     (EnableDisplayAndInterrupts).w
@DebugModeMapTest:
                
                btst    #INPUT_BIT_UP,((P1_INPUT-$1000000)).w
                bne.s   DebugModeBattleTest
                
                btst    #INPUT_BIT_DOWN,((P1_INPUT-$1000000)).w
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
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                moveq   #0,d0
                moveq   #0,d1
                moveq   #MAPS_MAX_DEBUG_INDEX,d2 
                jsr     NumberPrompt
                clr.w   d1
                jsr     (GetSavePointForMap).w
                moveq   #0,d4
                
                movem.w d0-d4,-(sp)
                move.w  #600,d0
                jsr     DebugFlagSetter
                movem.w (sp)+,d0-d4
                
                jsr     ExplorationLoop
                jmp     (MainLoop).w

    ; End of function InitializeGame

