
ChapterScreen1:
                movem.w d0,-(sp)
                move.w  #0,d0
                bsr.w   ChapterScreen
                movem.w (sp)+,d0
                rts
                
ChapterScreen2:
                movem.w d0,-(sp)
                move.w  #1,d0
                bsr.w   ChapterScreen
                movem.w (sp)+,d0
                rts
                
ChapterScreen3:
                movem.w d0,-(sp)
                move.w  #2,d0
                bsr.w   ChapterScreen
                movem.w (sp)+,d0
                rts
                
ChapterScreen4:
                movem.w d0,-(sp)
                move.w  #3,d0
                bsr.w   ChapterScreen
                movem.w (sp)+,d0
                rts
                

; =============== S U B R O U T I N E =======================================

ChapterScreen:
                movem.l d0-a6,-(sp)
                
                lsl.w   #2, d0
                movem.w d0,-(sp)
                
                jsr     InitDisplay
                jsr     ClearVsramAndSprites
                
                move.w  #$1FF,d7
                lea     ((PLANE_A_MAP_LAYOUT-$1000000)).w,a6
@loop1          clr.l   (a6)+
                dbf     d7,@loop1
                
                move.w  #$1FF,d7
                adda.w  #$1800,a6
@loop2          clr.l   (a6)+
                dbf     d7,@loop2
                
                move.w  #$1FF,d7
                lea     ((PLANE_B_LAYOUT-$1000000)).w,a6
@loop3          clr.l   (a6)+
                dbf     d7,@loop3
                
                move.w  #$1FF,d7
                adda.w  #$1800,a6
@loop4          clr.l   (a6)+
                dbf     d7,@loop4
                
                lea     pt_ChapterScreenTiles, a0
                movem.w (sp)+,d0
                movea.l (a0,d0.w),a0
                movem.w d0,-(sp)
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($2000).w,a1
                move.w  #$1000,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                
                lea     pt_ChapterScreenLayouts, a0
                movem.w (sp)+,d0
                movea.l (a0,d0.w),a0
                movem.w d0,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  #$700,d7
                jsr     (CopyBytes).w   
                
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$380,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                
                lea     pt_ChapterScreenPalettes(pc), a0
                movem.w (sp)+,d0
                movea.l (a0,d0.w),a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #$20,d7 
                jsr     (CopyBytes).w   
                
                jsr     (EnableDisplayAndInterrupts).w
                move.w  #0,d6
                jsr     (UpdateBackgroundVScrollData).w
                move.w  #0,d6
                jsr     (UpdateForegroundVScrollData).w
                move.w  #0,d6
                jsr     (UpdateBackgroundHScrollData).w
                move.w  #0,d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                
                jsr     (FadeInFromBlack).w
                
                move.w  #300,d0 
                jsr     Sleep
                
                jsr     (FadeOutToBlack).w
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ChapterScreen

