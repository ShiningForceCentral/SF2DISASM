
; ASM FILE code\common\tech\interrupts\vint.asm :
; 0x594..0x7CE : Vertical Interrupt - Triggered at each frame display

; =============== S U B R O U T I N E =======================================

; Vertical interrupt


VInt:
                
                movem.l d0-a6,-(sp)
                bclr    #ENABLE_VINT,(VINT_PARAMETERS).l
                beq.s   @SkipUpdates
                
                bsr.w   WaitDmaEnd
                bsr.w   DisableDisplay
                bsr.w   ProcessVdpQueues
                bsr.w   EnableDisplayOnVdp
                bsr.w   ProcessVramRead
                bsr.w   ApplyFadingEffect
                bsr.w   ApplyZ80BusUpdates
                andi    #$F800,sr       ; disable interrupts
                
                ; Should windows be hidden?
                clr.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                tst.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                bne.s   @Continue
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Continue
                move.b  #-1,((HIDE_WINDOWS_TOGGLE-$1000000)).w ; if Start pushed, hide windows
@Continue:
                
                bsr.w   CallContextualFunctions
                clr.b   ((WAITING_NEXT_VINT-$1000000)).w
                move.b  ((VINT_ENABLED-$1000000)).w,d0
                or.b    d0,(VINT_PARAMETERS).l
@SkipUpdates:
                
                addq.b  #1,((FRAME_COUNTER-$1000000)).w
                clr.b   (byte_FFDEA1).l 
                move.w  (VDP_REG00_STATUS).l,(VDP_Control).l
                move.l  ((AFTER_INTRO_JUMP_POINTER-$1000000)).w,d0
                beq.s   @Done
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Done
                
                clr.l   ((AFTER_INTRO_JUMP_POINTER-$1000000)).w
                movea.l (GAME_INTRO_STACK_POINTER_BACKUP).l,sp ; if P1 START pushed during intro cutscenes, stop and go back to game intro flow
                movea.l d0,a0
                move    #$2300,sr       ; enable interrupts
                jmp     (a0)
@Done:
                
                movem.l (sp)+,d0-a6
                rte

    ; End of function VInt


; =============== S U B R O U T I N E =======================================


CallContextualFunctions:
                
                move.b  ((SECONDS_COUNTER_FRAMES-$1000000)).w,d0
                addq.b  #1,d0           ; increment frame and second counters
                cmpi.b  #60,d0
                bne.s   @Continue
                
                clr.b   d0
                addq.l  #1,((SECONDS_COUNTER-$1000000)).w
@Continue:
                
                move.b  d0,((SECONDS_COUNTER_FRAMES-$1000000)).w
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                moveq   #7,d7
                clr.w   d6              ; loop 8 times, for each contextual function pointer available
@Loop:
                
                move.l  (a0)+,d0
                btst    d6,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                beq.s   @Next
                
                movem.l d0-a6,-(sp)
                movea.l d0,a0
                jsr     (a0)            ; for each trigger set, execute corresponding contextual function
                movem.l (sp)+,d0-a6
@Next:
                
                addq.w  #1,d6
                dbf     d7,@Loop
                
                rts

    ; End of function CallContextualFunctions


; =============== S U B R O U T I N E =======================================


DisableDisplay:
                
                andi.b  #$BF,(VDP_REG01_VALUE).l
                move.w  (VDP_REG01_STATUS).l,(VDP_Control).l
                rts

    ; End of function DisableDisplay


; =============== S U B R O U T I N E =======================================


ProcessVdpQueues:
                
                bsr.s   ProcessVdpCommandQueue
                bsr.w   ProcessDmaQueue
                rts

    ; End of function ProcessVdpQueues


; =============== S U B R O U T I N E =======================================


ProcessVdpCommandQueue:
                
                bclr    #VDP_COMMAND_REQUEST,(VINT_PARAMETERS).l
                beq.w   @Return
                tst.b   (VDP_COMMAND_COUNTER).l
                beq.w   @Return
                lea     (VDP_COMMAND_QUEUE).l,a0
@loc_1:
                
                move.w  (a0)+,d0
                move.w  #$8F02,d1
                bclr    #15,d0
                beq.s   @loc_2
                move.w  #$8F40,d1
                bclr    #14,d0
                beq.s   @loc_2
                move.w  #$8F80,d1
@loc_2:
                
                move.w  d1,(VDP_Control).l
                move.w  (a0)+,d2
                move.w  d2,d1
                andi.w  #$3FFF,d2
                ori.w   #$4000,d2
                move.w  d2,(VDP_Control).l
                clr.w   d2
                add.w   d1,d1
                addx.w  d2,d2
                add.w   d1,d1
                addx.w  d2,d2
                move.w  d2,(VDP_Control).l
@Loop:
                
                move.w  (a0)+,(VDP_Data).l
                dbf     d0,@Loop
                
                subq.b  #1,(VDP_COMMAND_COUNTER).l
                bne.s   @loc_1
                
                move.w  #$8F02,(VDP_Control).l
                move.l  #VDP_COMMAND_QUEUE,(VDP_COMMAND_QUEUE_POINTER).l
@Return:
                
                rts

    ; End of function ProcessVdpCommandQueue


; =============== S U B R O U T I N E =======================================


ProcessVramRead:
                
                bclr    #VRAM_READ_REQUEST,(VINT_PARAMETERS).l ; Check if VRAM read requested
                beq.s   @Return
                
                lea     (VDP_COMMAND_QUEUE).l,a0
                move.w  #$8F02,(VDP_Control).l ; autoincrement 02
                move.w  (a0),d7
                andi.w  #$3FFF,d7
                move.w  d7,(VDP_Control).l
                move.w  (a0)+,d7
                rol.w   #2,d7
                andi.w  #3,d7
                move.w  d7,(VDP_Control).l
                move.w  (a0)+,d7
@Loop:
                
                move.w  (VDP_Data).l,(a0)+
                dbf     d7,@Loop
@Return:
                
                rts

    ; End of function ProcessVramRead


; =============== S U B R O U T I N E =======================================


ProcessDmaQueue:
                
                bclr    #DMA_REQUEST,(VINT_PARAMETERS).l ; Check if DMA requested
                bne.s   @Continue       
                btst    #DEACTIVATE_DMA,(VINT_PARAMETERS).l ; Check if DMA deactivated
                bne.s   @Return
@Continue:
                
                move.w  #$100,(Z80BusReq).l ; Bus request
@WaitForZ80Bus:
                
                btst    #0,(Z80BusReq).l ; Check bus availability
                bne.s   @WaitForZ80Bus  
                
                btst    #DEACTIVATE_DMA,(VINT_PARAMETERS).l ; Check if DMA deactivated
                bne.s   @Return
                bsr.w   UpdateVdpSpriteTable ; Update sprites
                tst.b   (DMA_QUEUE_SIZE).l
                beq.s   @Skip
                
                lea     (DMA_QUEUE).l,a0
                lea     (VDP_Control).l,a6
                move.w  (VDP_REG01_STATUS).l,d7
                ori.b   #$10,d7         ; Enable DMA on VDP
                move.w  d7,(a6)
@SendCommand:
                
                move.w  (a0)+,(a6)      ; Send all queued DMA commands
                move.l  (a0)+,(a6)
                move.l  (a0)+,(a6)
                move.l  (a0)+,(a6)
                move.w  (a0)+,(DMA_ADDR_MSBYTE).l
                move.w  (DMA_ADDR_MSBYTE).l,(a6)
                subq.b  #1,(DMA_QUEUE_SIZE).l
                bne.s   @SendCommand    
                
                move.w  (VDP_REG01_STATUS).l,(a6)
                move.w  #$8F02,(a6)
@Skip:
                
                move.w  #0,(Z80BusReq).l
                move.l  #DMA_QUEUE,(DMA_QUEUE_POINTER).l
@Return:
                
                rts

    ; End of function ProcessDmaQueue

