
; ASM FILE code\gameflow\start\gameintro-standard.asm :
; Game intro

; =============== S U B R O U T I N E =======================================


GameIntro:      move.l  sp,(GAME_INTRO_STACK_POINTER_BACKUP).l
                move.l  #AfterGameIntro,((AFTER_INTRO_JUMP_POINTER-$1000000)).w
                jsr     (EnableDisplayAndInterrupts).w
                clr.w   d0
                jsr     PlayIntroOrEndCutscene
                clr.l   ((AFTER_INTRO_JUMP_POINTER-$1000000)).w
                
AfterGameIntro: clr.w   ((QUAKE_AMPLITUDE-$1000000)).w
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

    ; End of function GameIntro
