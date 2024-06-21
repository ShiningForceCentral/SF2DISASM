
; ASM FILE code\common\tech\interrupts\updatescrolldata.asm :
; 0x1234..0x1382 : Horizontal and Vertical Scroll data update functions

; =============== S U B R O U T I N E =======================================

; unused


sub_1234:
                
                movem.w d7,-(sp)
                move.w  a6,d7
                andi.w  #$3FFF,d7
                ori.w   #$4000,d7
                move.w  d7,(VDP_Control).l
                move.w  a6,d7
                lsr.w   #BYTE_SHIFT_COUNT,d7
                lsr.w   #6,d7
                move.w  d7,(VDP_Control).l
                movem.w (sp)+,d7
                rts

    ; End of function sub_1234


; =============== S U B R O U T I N E =======================================


UpdateVdpHScrollData:
                
                movem.l a6,-(sp)
                movea.l (DMA_QUEUE_POINTER).l,a6
                move.w  #$8F02,(a6)+    ; auto-increment : 2
                btst    #1,(VDP_REG0B_VALUE).l ; Check HScroll mode
                bne.s   @HScrollMode10  
                
                move.w  #$9400,(a6)+    ; If HScroll mode = 00, then full screen
                move.w  #$9302,(a6)+    ; DMA length = 2
                bra.s   @Finalize
@HScrollMode10:
                
                move.w  #$9402,(a6)+    ; If HScroll mode = 10, then 8 pixel rows
                move.w  #$9300,(a6)+    ; DMA length = $200 = 512
@Finalize:
                
                move.w  #$96E8,(a6)+
                move.w  #$9580,(a6)+
                move.w  #$977F,(a6)+    ; RAM to VRAM, address : 0xFFD100
                move.w  #$6C00,(a6)+    ; 0110 1100 0000 0000
                move.w  #$83,(a6)+ ; 0000 0000 1000 0011
                                        ; CD0 = 1 -> Write
                                        ; CD3-1 = 0 -> VRAM
                                        ; CD4 = 0
                                        ; CD5 = 1 -> DMA
                                        ; A15-0 = 1110 1100 0000 0000 = 0xEC00 (HScroll Data location in VRAM)
                move.l  a6,(DMA_QUEUE_POINTER).l
                addq.b  #1,(DMA_QUEUE_SIZE).l
                movem.l (sp)+,a6
                rts

    ; End of function UpdateVdpHScrollData


; =============== S U B R O U T I N E =======================================


UpdateForegroundHScrollData:
                
                movem.l d7/a6,-(sp)
                lea     (HORIZONTAL_SCROLL_DATA).l,a6
loc_12B4:
                
                move.w  #255,d7
loc_12B8:
                
                move.w  d6,(a6)+
                addq.l  #2,a6
                dbf     d7,loc_12B8
                
                movem.l (sp)+,d7/a6
                bra.s   UpdateVdpHScrollData

    ; End of function UpdateForegroundHScrollData


; =============== S U B R O U T I N E =======================================


UpdateBackgroundHScrollData:
                
                movem.l d7/a6,-(sp)
                lea     ((HORIZONTAL_SCROLL_DATA+2)).l,a6
                bra.s   loc_12B4

    ; End of function UpdateBackgroundHScrollData


; =============== S U B R O U T I N E =======================================

; VDP Vertical Scroll Data


UpdateVdpVScrollData:
                
                movem.l a6,-(sp)
                movea.l (DMA_QUEUE_POINTER).l,a6
                move.w  #$8F02,(a6)+    ; auto-inc : 2
                btst    #2,(VDP_REG0B_VALUE).l ; Check vertical scrolling mode
                bne.s   @VScrollMode1   
                
                move.w  #$9400,(a6)+    ; If VS mode = 0, then full screen (1 longword only in VSRAM)
                move.w  #$9304,(a6)+    ; DMA length = 4
                bra.s   @Finalize
@VScrollMode1:
                
                move.w  #$9400,(a6)+    ; if VS mode = 1 then 16 pixel columns (1 word per column in VSRAM)
                move.w  #$9328,(a6)+    ; DMA length = 40
@Finalize:
                
                move.w  #$96EA,(a6)+
                move.w  #$9580,(a6)+
                move.w  #$977F,(a6)+    ; RAM to VRAM, address 0xFFD500
                move.w  #$4000,(a6)+    ; VRAM write to VSRAM 0x0
                move.w  #$90,(a6)+ 
                move.l  a6,(DMA_QUEUE_POINTER).l
                addq.b  #1,(DMA_QUEUE_SIZE).l
                movem.l (sp)+,a6
                rts

    ; End of function UpdateVdpVScrollData


; =============== S U B R O U T I N E =======================================


UpdateForegroundVScrollData:
                
                movem.l d7/a6,-(sp)
                lea     (VERTICAL_SCROLL_DATA).l,a6
loc_132C:
                
                move.w  #19,d7
loc_1330:
                
                move.w  d6,(a6)+
                addq.l  #2,a6
                dbf     d7,loc_1330
                
                movem.l (sp)+,d7/a6
                bra.s   UpdateVdpVScrollData

    ; End of function UpdateForegroundVScrollData


; =============== S U B R O U T I N E =======================================


UpdateBackgroundVScrollData:
                
                movem.l d7/a6,-(sp)
                lea     ((VERTICAL_SCROLL_DATA+2)).l,a6
                bra.s   loc_132C

    ; End of function UpdateBackgroundVScrollData


; =============== S U B R O U T I N E =======================================

; unused


sub_134A:
                
                movem.w d1,-(sp)
                bsr.s   sub_135A        
                bsr.w   ApplyImmediateVramDma
                movem.w (sp)+,d1
                rts

    ; End of function sub_134A


; =============== S U B R O U T I N E =======================================

; unused


sub_135A:
                
                movem.l d0-d1/a1,-(sp)
                bsr.w   nullsub_1A80
                lea     (FF8804_LOADING_SPACE).l,a0
                movem.l (sp)+,d0-d1/a1
                move.w  #2,d1
                rts

    ; End of function sub_135A


; =============== S U B R O U T I N E =======================================

; unused


sub_1372:
                
                movem.w d1,-(sp)
                bsr.s   sub_135A        
                bsr.w   ApplyVIntVramDma
                movem.w (sp)+,d1
                rts

    ; End of function sub_1372

