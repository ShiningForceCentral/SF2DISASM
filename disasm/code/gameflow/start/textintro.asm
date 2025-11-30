
; ASM FILE code\gameflow\start\textintro.asm :
; Included if patch SCROLLING_TEXT_INTRODUCTION is enabled.

; =============== S U B R O U T I N E =======================================


PlayTextIntro:
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w 
                jsr     (DisableDisplayAndInterrupts).w
                jsr     (ClearVsramAndSprites).w
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (InitializeDisplay).w 
                jsr     ClearPalette2
                jsr     (DisableDisplayAndInterrupts).w
                jsr     GenerateEndingCreditsFont
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #VDPTILE_PORTRAITTILE1|VDPTILE_PALETTE2,d1
                moveq   #7,d7
@loc_1:
                
                moveq   #5,d6
@loc_2:
                
                move.w  d1,(a1)+
                addq.w  #1,d1
                dbf     d6,@loc_2
        
                addq.w  #2,d1
                lea     52(a1),a1
                dbf     d7,@loc_1
        
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w    
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (EnableDisplayAndInterrupts).w
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                jsr     (FadeInFromBlack).w
                move.l  (p_table_IntroText).l,((CONFIGURATION_MODE_OR_GAME_STAFF_POINTER-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_EndCredits
@loc_3:
                
                movea.l ((CONFIGURATION_MODE_OR_GAME_STAFF_POINTER-$1000000)).w,a0
                cmpi.b  #-1,(a0)
                bne.s   @loc_3
                
                jsr     ClearPalette2
                move.w  #180,d0 
                jsr     (Sleep).w       
                jsr     (FadeOutToBlack).w
                move.w  #120,d0 
                jsr     (Sleep).w       
                rts

	; End of function PlayTextIntro
