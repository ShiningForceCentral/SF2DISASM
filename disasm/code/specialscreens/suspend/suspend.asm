
; ASM FILE code\specialscreens\suspend\suspend.asm :
; 0x2791C..0x279D8 : Suspend functions

; =============== S U B R O U T I N E =======================================


SuspendGame:
                
                moveq   #$3C,d0 
                jsr     (Sleep).w       
                movea.l (p_SuspendStringTiles).l,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a0
                lea     ($8000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                movea.l (p_plt_SuspendString).l,a0
                lea     (PALLETE_2_BASE).l,a1
                moveq   #$20,d7 
                jsr     (CopyBytes).w   
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #2,((FADING_PALETTE_BITMAP-$1000000)).w
                moveq   #3,d0
                jsr     (Sleep).w       
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                move.l  #$24002401,$5EC(a0)
                move.l  #$24022403,$5F0(a0)
                move.l  #$24042405,$5F4(a0)
                move.l  #$24062000,$5F8(a0)
                move.l  #$24072408,$62C(a0)
                move.l  #$2409240A,$630(a0)
                move.l  #$240B240C,$634(a0)
                move.l  #$240D2000,$638(a0)
                lea     ($C000).l,a1
                move.w  #$380,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                rts

    ; End of function SuspendGame

