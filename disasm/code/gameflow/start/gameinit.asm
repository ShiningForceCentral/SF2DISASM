
; ASM FILE code\gameflow\start\gameinit.asm :
; 0x70D2..0x7186 : Game init

; =============== S U B R O U T I N E =======================================


InitGame:
                
                move    #$2300,sr
                bsr.w   LoadBaseTiles
                bsr.w   CheckRegion
                jsr     j_NewGame
                jsr     j_DisplaySegaLogo
                bne.w   loc_71EC
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.w   GameIntro
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   WaitForVInt
                
                if (EASY_BATTLE_TEST=1)
                    bra.w   DebugModeBattleTest
                    nop
                    nop
                else
                    btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                    beq.s   loc_7118
                endif
                
                jsr     (EnableDisplayAndInterrupts).w
                bsr.w   InitDisplay
                jsr     (EnableDisplayAndInterrupts).w
                jmp     j_nullsub_18010
loc_7118:
                
                btst    #INPUT_BIT_UP,((P1_INPUT-$1000000)).w
                bne.w   DebugModeBattleTest
                btst    #INPUT_BIT_DOWN,((P1_INPUT-$1000000)).w
                beq.w   j_GameIntro
                jsr     (EnableDisplayAndInterrupts).w
                bsr.w   InitDisplay
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   FadeInFromBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                move.b  #$FF,((DEBUG_MODE_ACTIVATED-$1000000)).w
                bsr.w   InitWindowProperties
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                moveq   #0,d0
                moveq   #0,d1
                moveq   #$38,d2 
                jsr     j_NumberPrompt
                clr.w   d1
                move.b  DebugModeAvailableMaps(pc,d0.w),d0
                bsr.w   GetSavePointForMap
                moveq   #0,d4
                movem.w d0-d4,-(sp)
                move.w  #$258,d0
                jsr     j_DebugFlagSetter
                movem.w (sp)+,d0-d4
                jsr     j_ExplorationLoop
                bra.w   MainLoop        

    ; End of function InitGame

