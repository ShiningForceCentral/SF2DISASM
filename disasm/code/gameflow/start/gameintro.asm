
; ASM FILE code\gameflow\start\gameintro.asm :
; 0x71C0..0x724E : Game intro

; =============== S U B R O U T I N E =======================================


j_GameIntro:
                
                bra.w   GameIntro

    ; End of function j_GameIntro


; =============== S U B R O U T I N E =======================================


j_j_DisplaySegaLogo:
                
                jsr     j_DisplaySegaLogo
                bne.w   AfterGameIntro

    ; End of function j_j_DisplaySegaLogo


; START OF FUNCTION CHUNK FOR InitializeGame

GameIntro:
                
                move.l  sp,(GAME_INTRO_STACK_POINTER_BACKUP).l
                move.l  #AfterGameIntro,((AFTER_INTRO_JUMP_POINTER-$1000000)).w
                jsr     (EnableDisplayAndInterrupts).w
                clr.w   d0
                jsr     j_PlayIntroOrEndCutscene
                clr.l   ((AFTER_INTRO_JUMP_POINTER-$1000000)).w
AfterGameIntro:
                
                clr.w   ((QUAKE_AMPLITUDE-$1000000)).w
                move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
                bsr.w   EnableInterrupts
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #CRAM_SIZE,d7
                bsr.w   CopyBytes       
                bsr.w   FadeOutToBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (WaitForDmaQueueProcessing).w
                bsr.w   InitializeDisplay
                bsr.w   DisableDisplayAndInterrupts
                sndCom  MUSIC_TITLE
                jsr     StartTitleScreen
                bne.s   StartWitchScreen
                
                move    #$2700,sr
                movea.l (InitialStack).w,sp
                movea.l (p_Start).w,a0  
                jmp     (a0)            ; reset
