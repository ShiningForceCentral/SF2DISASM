
; ASM FILE code\common\tech\interrupts\vintengine_1.asm :
; 0xDBA..0xF1A : Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 1

; =============== S U B R O U T I N E =======================================


ClearVsramAndSprites:
                
                move.w  #$100,(Z80BusReq).l
@Wait:
                
                btst    #0,(Z80BusReq).l
                bne.s   @Wait           ; wait for bus available
                
                bsr.s   ClearScrollTableData
                bsr.s   ClearSpriteTable
                bsr.s   UpdateVdpSpriteTable
                move.w  #0,(Z80BusReq).l
                rts

    ; End of function ClearVsramAndSprites


; =============== S U B R O U T I N E =======================================


UpdateVdpSpriteTable:
                
                bsr.w   WaitDmaEnd
                lea     (VDP_Control).l,a6
                move.w  #$8134,(a6)     ; disable display, enable Vint, enable DMA
                move.l  #$94019300,(a6) ; DMA Length : $100
                move.l  #$96EE9540,(a6) ; 1110 1110 0100 0000
                move.w  #$977F,(a6)     ; 0111 1111
                                        ; DMD1-0 : 01 -> DMA transfer (DMD0 becomes SA23)
                                        ; SA23-1 : 111 1111 1110 1110 0100 0000 -> 0x7FEE40 * 2 = 0xFFDC80
                move.w  #$6800,(a6)     ; 0110 1000 0000 0000
                move.w  #$83,(DMA_ADDR_MSBYTE).l  ; 0000 0000 1000 0011
                                        ; CD5-0 : 100001 -> DMA Write to VRAM
                                        ; A15-0 : 1110 1000 0000 0000 -> 0xE800
                move.w  (DMA_ADDR_MSBYTE).l,(a6)
                move.w  (VDP_REG01_STATUS).l,(a6)
                rts

    ; End of function UpdateVdpSpriteTable


; =============== S U B R O U T I N E =======================================


ClearSpriteTable:
                
                movem.l d0-d1/a0,-(sp)
                lea     (SPRITE_TABLE).l,a0
                moveq   #VDP_SPRITES_COUNTER,d1
                moveq   #1,d0
@Loop:
                
                move.l  d0,(a0)
                clr.l   VDPSPRITE_OFFSET_TILE(a0)
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a0
                addq.b  #1,d0
                dbf     d1,@Loop
                
                clr.b   -5(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ClearSpriteTable


; =============== S U B R O U T I N E =======================================


ClearScrollTableData:
                
                movem.l d7/a6,-(sp)
                move.w  #VRAM_ADDRESS_PLANE_A,d0 ; clear scroll A table
                move.w  #VRAM_PLANE_BYTE_SIZE,d1
                clr.w   d2
                bsr.w   ApplyVramDmaFill
                move.w  #VRAM_ADDRESS_PLANE_B,d0 ; clear scroll B table
                move.w  #VRAM_PLANE_BYTE_SIZE,d1
                clr.w   d2
                bsr.w   ApplyVramDmaFill
                
                move.w  #VRAM_PLANE_LONGWORD_COUNTER,d7
                lea     ((PLANE_A_MAP_LAYOUT-$1000000)).w,a6
@ClearPlane_A:
                
                clr.l   (a6)+
                dbf     d7,@ClearPlane_A
                
                move.w  #VRAM_PLANE_LONGWORD_COUNTER,d7
                adda.w  #VRAM_PLANES_ADDRESS_DIFFERENCE,a6
@ClearPlane_B:
                
                clr.l   (a6)+
                dbf     d7,@ClearPlane_B
                
                movem.l (sp)+,d7/a6
                rts

    ; End of function ClearScrollTableData


; =============== S U B R O U T I N E =======================================

; unused


ClearCram:
                
                movem.l d0-d3,-(sp)
                move.w  (VDP_REG01_STATUS).l,d3
                ori.b   #$10,d3
                move.w  d3,(VDP_Control).l
                move.w  #$8F01,(VDP_Control).l ; auto increment : 1
                move.w  #$9300,(VDP_Control).l ; DMA length : $100
                move.w  #$9401,(VDP_Control).l
                move.w  #$9780,(VDP_Control).l ; VRAM fill
                move.w  #$C000,(VDP_Control).l
                move.w  #$80,(VDP_Control).l  ; CRAM address 0x80
                move.w  #0,(VDP_Data).l
@WaitForDmaFree:
                
                move.w  (VDP_Control).l,d0
                andi.w  #2,d0
                bne.s   @WaitForDmaFree
                
                move.w  (VDP_REG01_STATUS).l,d3
                move.w  d3,(VDP_Control).l
                move.w  #$8F02,(VDP_Control).l ; auto increment : 2
                movem.l (sp)+,d0-d3
                rts

    ; End of function ClearCram


; =============== S U B R O U T I N E =======================================


WaitForVInt:
                
                bset    #ENABLE_VINT,(VINT_PARAMETERS).l
                move.b  #1,((WAITING_NEXT_VINT-$1000000)).w
@Wait:
                
                tst.b   ((WAITING_NEXT_VINT-$1000000)).w
                bne.s   @Wait
                rts

    ; End of function WaitForVInt


; =============== S U B R O U T I N E =======================================

; Wait for d0.w VInts/Frames.


Sleep:
                
                movem.w d0,-(sp)
                subq.w  #1,d0
                bcs.w   @Done
@Loop:
                
                bsr.s   WaitForVInt
                dbf     d0,@Loop
@Done:
                
                movem.w (sp)+,d0
                rts

    ; End of function Sleep

