
; ASM FILE code\common\tech\interrupts\vintengine.asm :
; 0x594..0x14A6 : Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display

; =============== S U B R O U T I N E =======================================

; Vertical interrupt


VInt:
                
                movem.l d0-a6,-(sp)
                bclr    #ENABLE_VINT,(VINT_PARAMS).l
                beq.s   loc_5EC
                bsr.w   WaitDmaEnd
                bsr.w   DisableDisplay
                bsr.w   ProcessVdpQueues
                bsr.w   EnableDisplayOnVdp
                bsr.w   ProcessVramRead
                bsr.w   ApplyFadingEffect
                bsr.w   ApplyZ80BusUpdates
                andi    #$F800,sr       ; disable interrupts
                clr.b   ((HIDE_WINDOWS-$1000000)).w
                tst.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                bne.s   loc_5DA
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w ; if Start pushed, hide windows
                beq.s   loc_5DA
                move.b  #$FF,((HIDE_WINDOWS-$1000000)).w
loc_5DA:
                
                bsr.w   CallContextualFunctions
                clr.b   ((WAITING_NEXT_VINT-$1000000)).w
                move.b  ((VINT_ENABLED-$1000000)).w,d0
                or.b    d0,(VINT_PARAMS).l
loc_5EC:
                
                addq.b  #1,((FRAME_COUNTER-$1000000)).w
                clr.b   (byte_FFDEA1).l 
                move.w  (VDP_REG00_STATUS).l,(VDP_Control).l
                move.l  ((AFTER_INTRO_JUMP_OFFSET-$1000000)).w,d0
                beq.s   loc_620
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                beq.s   loc_620
                clr.l   ((AFTER_INTRO_JUMP_OFFSET-$1000000)).w
                movea.l (GAME_INTRO_SP_OFFSET).l,sp ; if P1 START pushed during intro cutscenes, stop and go back to game intro flow
                movea.l d0,a0
                move    #$2300,sr       ; enable interrupts
                jmp     (a0)
loc_620:
                
                movem.l (sp)+,d0-a6
                rte

    ; End of function VInt


; =============== S U B R O U T I N E =======================================


CallContextualFunctions:
                
                move.b  ((SECONDS_COUNTER_FRAMES-$1000000)).w,d0
                addq.b  #1,d0           ; increment frame and second counters
                cmpi.b  #$3C,d0 
                bne.s   loc_638
                clr.b   d0
                addq.l  #1,((SECONDS_COUNTER-$1000000)).w
loc_638:
                
                move.b  d0,((SECONDS_COUNTER_FRAMES-$1000000)).w
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                moveq   #7,d7
                clr.w   d6              ; loop 8 times, for each contextual function pointer available
loc_644:
                
                move.l  (a0)+,d0
                btst    d6,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                beq.s   loc_658
                movem.l d0-a6,-(sp)
                movea.l d0,a0
                jsr     (a0)            ; for each trigger set, execute corresponding contextual function
                movem.l (sp)+,d0-a6
loc_658:
                
                addq.w  #1,d6
                dbf     d7,loc_644
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
                
                bclr    #VDP_COMMAND_REQUEST,(VINT_PARAMS).l
                beq.w   return_6FE
                tst.b   (VDP_COMMAND_COUNTER).l
                beq.w   return_6FE
                lea     (VDP_COMMAND_QUEUE).l,a0
loc_698:
                
                move.w  (a0)+,d0
                move.w  #$8F02,d1
                bclr    #$F,d0
                beq.s   loc_6B2
                move.w  #$8F40,d1
                bclr    #$E,d0
                beq.s   loc_6B2
                move.w  #$8F80,d1
loc_6B2:
                
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
loc_6DA:
                
                move.w  (a0)+,(VDP_Data).l
                dbf     d0,loc_6DA
                subq.b  #1,(VDP_COMMAND_COUNTER).l
                bne.s   loc_698
                move.w  #$8F02,(VDP_Control).l
                move.l  #VDP_COMMAND_QUEUE,(VDP_COMMAND_QUEUE_POINTER).l
return_6FE:
                
                rts

    ; End of function ProcessVdpCommandQueue


; =============== S U B R O U T I N E =======================================


ProcessVramRead:
                
                bclr    #VRAM_READ_REQUEST,(VINT_PARAMS).l ; Check if VRAM read requested
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
                
                bclr    #DMA_REQUEST,(VINT_PARAMS).l ; Check if DMA requested
                bne.s   loc_754         
                btst    #DEACTIVATE_DMA,(VINT_PARAMS).l ; Check if DMA deactivated
                bne.s   return_7CC
loc_754:
                
                move.w  #$100,(Z80BusReq).l ; Bus request
loc_75C:
                
                btst    #0,(Z80BusReq).l ; Check bus availability
                bne.s   loc_75C         
                btst    #DEACTIVATE_DMA,(VINT_PARAMS).l ; Check if DMA deactivated
                bne.s   return_7CC
                bsr.w   UpdateVdpSpriteTable ; Update sprites
                tst.b   (DMA_QUEUE_SIZE).l
                beq.s   loc_7BA
                lea     (DMA_QUEUE).l,a0
                lea     (VDP_Control).l,a6
                move.w  (VDP_REG01_STATUS).l,d7
                ori.b   #$10,d7         ; Enable DMA on VDP
                move.w  d7,(a6)
loc_794:
                
                move.w  (a0)+,(a6)      ; Send all queued DMA commands
                move.l  (a0)+,(a6)
                move.l  (a0)+,(a6)
                move.l  (a0)+,(a6)
                move.w  (a0)+,(DMA_ADDR_MSBYTE).l
                move.w  (DMA_ADDR_MSBYTE).l,(a6)
                subq.b  #1,(DMA_QUEUE_SIZE).l
                bne.s   loc_794         
                move.w  (VDP_REG01_STATUS).l,(a6)
                move.w  #$8F02,(a6)
loc_7BA:
                
                move.w  #0,(Z80BusReq).l
                move.l  #DMA_QUEUE,(DMA_QUEUE_POINTER).l
return_7CC:
                
                rts

    ; End of function ProcessDmaQueue


; =============== S U B R O U T I N E =======================================


Trap9_ManageContextualFunctions:
                
                movem.l d0-a6,-(sp)
                move    sr,d6
                move    #$2700,sr
                movea.l $3E(sp),a6
                move.w  (a6)+,d0
                addq.l  #2,$3E(sp)
                add.w   d0,d0
                move.w  rjt_Trap9ActionsOfs(pc,d0.w),d0
                jmp     rjt_Trap9ActionsOfs(pc,d0.w) ; jump according to the first two bytes parameter : $0000 to $0004

    ; End of function Trap9_ManageContextualFunctions

rjt_Trap9ActionsOfs:
                dc.w Trap9_ClearPointers-rjt_Trap9ActionsOfs
                dc.w Trap9_SetFunctionAndTrigger-rjt_Trap9ActionsOfs
                dc.w Trap9_ClearFunctionAndTrigger-rjt_Trap9ActionsOfs
                dc.w Trap9_ClearTrigger-rjt_Trap9ActionsOfs
                dc.w Trap9_SetTrigger-rjt_Trap9ActionsOfs

; =============== S U B R O U T I N E =======================================


Trap9_ClearPointers:
                
                moveq   #0,d0
                clr.b   ((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                bra.w   loc_8D6

    ; End of function Trap9_ClearPointers


; =============== S U B R O U T I N E =======================================


Trap9_SetFunctionAndTrigger:
                
                move.l  (a6)+,d0
                addq.l  #4,$3E(sp)
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
loc_822:
                
                tst.l   (a0)+
                beq.w   loc_832
                addq.w  #1,d1
                dbf     d7,loc_822
                bra.w   loc_8D6
loc_832:
                
                move.l  d0,-(a0)
                bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6

    ; End of function Trap9_SetFunctionAndTrigger


; =============== S U B R O U T I N E =======================================


Trap9_ClearFunctionAndTrigger:
                
                move.l  (a6)+,d0
                addq.l  #4,$3E(sp)
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
loc_84A:
                
                cmp.l   (a0)+,d0
                beq.w   loc_85A
                addq.w  #1,d1
                dbf     d7,loc_84A
                bra.w   loc_8D6
loc_85A:
                
                clr.l   -(a0)
                bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6

    ; End of function Trap9_ClearFunctionAndTrigger


; =============== S U B R O U T I N E =======================================


Trap9_ClearTrigger:
                
                addq.l  #4,$3E(sp)
                move.l  (a6)+,d0
                beq.w   loc_88E
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
loc_876:
                
                cmp.l   (a0)+,d0
                beq.w   loc_886
                addq.w  #1,d1
                dbf     d7,loc_876
                bra.w   loc_8D6
loc_886:
                
                bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6
loc_88E:
                
                clr.b   ((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
                bra.w   loc_8D6

    ; End of function Trap9_ClearTrigger


; =============== S U B R O U T I N E =======================================


Trap9_SetTrigger:
                
                moveq   #7,d7
                lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
                clr.w   d1
                addq.l  #4,$3E(sp)
                move.l  (a6)+,d0
                beq.w   loc_8C0
loc_8A8:
                
                cmp.l   (a0)+,d0
                beq.w   loc_8B8         
                addq.w  #1,d1
                dbf     d7,loc_8A8
                bra.w   loc_8D6
loc_8B8:
                
                bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w 
                                                        ; set trigger
                bra.w   loc_8D6
loc_8C0:
                
                clr.w   d0
                clr.w   d1
                moveq   #7,d7
loc_8C6:
                
                tst.l   (a0)+
                beq.s   loc_8CC
                bset    d1,d0
loc_8CC:
                
                addq.w  #1,d1
                dbf     d7,loc_8C6
                move.b  d0,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
loc_8D6:
                
                move    d6,sr
                movem.l (sp)+,d0-a6
                rte

    ; End of function Trap9_SetTrigger


; =============== S U B R O U T I N E =======================================


ApplyZ80BusUpdates:
                
                move.w  #$100,(Z80BusReq).l
loc_8E6:
                
                btst    #0,(Z80BusReq).l
                bne.s   loc_8E6         ; wait for Z80 bus available
                tst.b   ((WAIT_FOR_MUSIC_END-$1000000)).w
                beq.w   loc_906
                tst.b   (Z80_CHANNEL_1_NOT_IN_USE).l
                beq.w   loc_9F6
                clr.b   ((WAIT_FOR_MUSIC_END-$1000000)).w
loc_906:
                
                lea     ((SOUND_COMMAND_QUEUE-$1000000)).w,a0
                move.l  4(a0),d0
                or.l    (a0),d0         ; if stack void, do nothing
                beq.w   loc_9F6
                move.b  (a0),d1         ; contains music volume parameter when command is FC
                                        ; or fade in parameter when 7F < command < F0
                move.b  1(a0),d0        ; stores first command in d1 and d0 and pushes the rest forward
                move.w  2(a0),(a0)+
loc_91E:
                
                move.w  2(a0),(a0)+
                move.w  2(a0),(a0)+
                clr.w   (a0)
                cmpi.b  #$FB,d0
                bne.s   loc_95A         ; if command FB, play back previous music
                tst.b   ((MUSIC_STACK_LENGTH-$1000000)).w
                beq.s   loc_94E
                movem.l d7-a0,-(sp)
                lea     ((MUSIC_STACK-$1000000)).w,a0
                moveq   #8,d7
loc_93E:
                
                move.b  1(a0),(a0)+
                dbf     d7,loc_93E
                movem.l (sp)+,d7-a0
                subq.b  #1,((MUSIC_STACK_LENGTH-$1000000)).w
loc_94E:
                
                move.b  ((MUSIC_STACK-$1000000)).w,(Z80_SoundDriverCommand).l
                bra.w   loc_9F6
loc_95A:
                
                cmpi.b  #$FD,d0
                bcs.s   loc_96A
                move.b  d0,(Z80_SoundDriverCommand).l ; if command >= FD, then send it to Z80
                bra.w   loc_9F6
loc_96A:
                
                cmpi.b  #$F0,d0
                bne.s   loc_97A
                move.b  #1,((WAIT_FOR_MUSIC_END-$1000000)).w ; if F0, then wait for current music to end before sending commands to Z80
                bra.w   loc_9F6
loc_97A:
                
                cmpi.b  #$FC,d0
                bne.s   loc_994         ; if FC, then update music level
                andi.b  #$F,d1
                move.b  d1,(Z80_SoundDriverMusicLevel).l
                move.b  d0,(Z80_SoundDriverCommand).l
                bra.w   loc_9F6
loc_994:
                
                movem.l d0,-(sp)
                andi.b  #$7F,d0 ; a music/sfx index mask, so max index value is $7F
                cmp.b   ((MUSIC_STACK-$1000000)).w,d0 ; compare with last played music
                movem.l (sp)+,d0
                bne.s   loc_9AA
                bra.w   loc_9F6         ; if same to last played music, let current music play
                                        ; (might play nothing if last played music has ended !)
loc_9AA:
                
                bclr    #7,d0           ; if command > 7F, then send Fade In parameter
                beq.s   loc_9B8         ; branch if bit was 1 before bclr
                move.b  d1,(Z80_SoundDriverFadeInData).l
                bra.s   loc_9C6
loc_9B8:
                
                cmpi.b  #$40,d0 
                bgt.s   loc_9C6
                move.b  #$F,(Z80_SoundDriverFadeInData).l ; if music, put this fade in parameter : no fade in
loc_9C6:
                
                move.b  d0,(Z80_SoundDriverCommand).l ; send music/sfx command to Z80
                cmpi.b  #$40,d0 
                bge.s   loc_9F6
                movem.l d7-a0,-(sp)
                lea     ((WAIT_FOR_MUSIC_END-$1000000)).w,a0
                moveq   #8,d7
loc_9DC:
                
                move.b  -2(a0),-(a0)    ; add music index to music stack
                dbf     d7,loc_9DC
                move.b  d0,-(a0)
                movem.l (sp)+,d7-a0
                cmpi.b  #$A,((MUSIC_STACK_LENGTH-$1000000)).w
                bge.s   loc_9F6
                addq.b  #1,((MUSIC_STACK_LENGTH-$1000000)).w
loc_9F6:
                
                bsr.w   UpdatePlayerInputs
                tst.b   ((CONTROLLING_UNIT_CURSOR-$1000000)).w
                bne.s   loc_A60
                moveq   #2,d0
                move.b  ((P1_INPUT-$1000000)).w,d1
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                tst.w   d0
                bgt.s   loc_A54         
                move.b  ((PRIMARY_WALKING_DIRECTION-$1000000)).w,d0 ; get current walking direction
                eor.b   d0,((P1_INPUT-$1000000)).w ; get new direction
                moveq   #2,d0
                move.b  ((P1_INPUT-$1000000)).w,d1
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                tst.w   d0
                bgt.s   loc_A52
                andi.b  #INPUT_UP|INPUT_DOWN,((P1_INPUT-$1000000)).w 
                                                        ; if both directions are new, only keep vertical one
loc_A52:
                
                bra.s   loc_A60
loc_A54:
                
                move.b  ((P1_INPUT-$1000000)).w,d1 ; if only one direction pushed, set it as primary
                andi.w  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT,d1
                move.b  d1,((PRIMARY_WALKING_DIRECTION-$1000000)).w
loc_A60:
                
                move.b  ((P1_INPUT-$1000000)).w,d0
                move.b  d0,((CURRENT_PLAYER_INPUT-$1000000)).w ; overwrite P2 6-button data with P1 state with walking direction
                cmp.b   ((LAST_PLAYER_INPUT-$1000000)).w,d0
                bne.s   loc_A86         
                addq.b  #1,((INPUT_REPEAT_DELAYER-$1000000)).w ; if input is the same then increment counter and ignore input
                cmpi.b  #$18,((INPUT_REPEAT_DELAYER-$1000000)).w
                bcc.s   loc_A80
                clr.b   ((CURRENT_PLAYER_INPUT-$1000000)).w ; keep current input only when counter reaches $18
                bra.s   loc_A84
loc_A80:
                
                subq.b  #6,((INPUT_REPEAT_DELAYER-$1000000)).w
loc_A84:
                
                bra.s   loc_AAC
loc_A86:
                
                clr.w   d2              ; if input is new
                move.b  ((LAST_PLAYER_INPUT-$1000000)).w,d1
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT,d1
                beq.s   loc_A94
                moveq   #1,d2           ; was pushing a direction
loc_A94:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,((LAST_PLAYER_INPUT-$1000000)).w
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT,d0
                beq.w   loc_AA8
                tst.b   d2
                bne.w   loc_AAC
loc_AA8:
                
                clr.b   ((INPUT_REPEAT_DELAYER-$1000000)).w
loc_AAC:
                
                move.w  #0,(Z80BusReq).l
                bsr.w   sub_19F8        
                rts

    ; End of function ApplyZ80BusUpdates


; =============== S U B R O U T I N E =======================================


ApplyFadingEffect:
                
                move.b  ((FADING_SETTING-$1000000)).w,d0
                beq.w   return_B1C
                subq.b  #1,((FADING_COUNTER-$1000000)).w
                bne.w   return_B1C
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                subq.b  #1,d0
                ext.w   d0
                lsl.w   #3,d0
                move.b  ((FADING_POINTER-$1000000)).w,d1
                ext.w   d1
                add.w   d1,d0
                move.b  FadingData(pc,d0.w),d1
                cmpi.w  #$80,d1 
                bne.s   loc_AEC
                clr.b   ((FADING_SETTING-$1000000)).w
loc_AEC:
                
                movem.l d1,-(sp)
                andi.w  #$F0,d1 
                cmpi.w  #$80,d1 
                movem.l (sp)+,d1
                bne.s   loc_B0A
                andi.w  #$F,d1          ; go x backwards
                sub.b   d1,((FADING_POINTER-$1000000)).w
                bra.w   ApplyFadingEffect
loc_B0A:
                
                ext.w   d1
                move.w  d1,d0
                move.b  ((FADING_PALETTE_BITMAP-$1000000)).w,d1
                ext.w   d1
                bsr.w   ApplyCurrentColorFadingValue
                addq.b  #1,((FADING_POINTER-$1000000)).w
return_B1C:
                
                rts

    ; End of function ApplyFadingEffect

FadingData:     incbin "data/graphics/tech/fadingdata.bin" ; 80 : end
                                        ; 8x : go x backward

; =============== S U B R O U T I N E =======================================


WaitDmaEnd:
                
                movem.w d0,-(sp)
@Wait:
                
                move.w  (VDP_Control).l,d0
                btst    #1,d0           ; control if DMA in progress
                bne.s   @Wait           ; loop if DMA in progress
                movem.w (sp)+,d0
                rts

    ; End of function WaitDmaEnd


; =============== S U B R O U T I N E =======================================

; VDP Reg Status -> D0


GetVdpRegStatus:
                
                movem.l a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                add.w   d0,d0
                move.w  (a0,d0.w),d0
                movem.l (sp)+,a0
                rts

    ; End of function GetVdpRegStatus


; =============== S U B R O U T I N E =======================================


SetVdpReg:
                
                bsr.s   WaitDmaEnd
                movem.l d0-d1/a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                move.w  d0,(VDP_Control).l
                move.w  d0,d1
                andi.w  #$7F00,d0
                lsr.w   #7,d0
                move.w  d1,(a0,d0.w)    ; store new vdp reg status
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function SetVdpReg


; =============== S U B R O U T I N E =======================================


ApplyLogicalOrOnVdpReg:
                
                bsr.s   WaitDmaEnd
                movem.l d0-d1/a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                add.w   d0,d0
                or.b    d1,1(a0,d0.w)   ; enable display
                bra.s   SendVdpCommand

    ; End of function ApplyLogicalOrOnVdpReg


; =============== S U B R O U T I N E =======================================


ApplyLogicalAndOnVdpReg:
                
                bsr.s   WaitDmaEnd
                movem.l d0-d1/a0,-(sp)
                lea     (VDP_REG00_STATUS).l,a0
                add.w   d0,d0
                and.b   d1,1(a0,d0.w)   ; disable display

    ; End of function ApplyLogicalAndOnVdpReg


; START OF FUNCTION CHUNK FOR ApplyLogicalOrOnVdpReg

SendVdpCommand:
                
                move.w  (a0,d0.w),d1
                move.w  d1,(VDP_Control).l
                movem.l (sp)+,d0-d1/a0
                rts

; END OF FUNCTION CHUNK FOR ApplyLogicalOrOnVdpReg


; =============== S U B R O U T I N E =======================================


EnableDisplayOnVdp:
                
                move.w  #1,d0           ; get vdp reg 01
                move.w  #$40,d1 
                bra.s   ApplyLogicalOrOnVdpReg

    ; End of function EnableDisplayOnVdp


; =============== S U B R O U T I N E =======================================


DisableDisplayOnVdp:
                
                move.w  #1,d0
                move.w  #$BF,d1 
                bra.s   ApplyLogicalAndOnVdpReg

    ; End of function DisableDisplayOnVdp


; =============== S U B R O U T I N E =======================================


EnableInterrupts:
                
                move.b  #$80,((VINT_ENABLED-$1000000)).w
                move    #$2300,sr       ; set interrupt mask to level 3
                rts

    ; End of function EnableInterrupts


; =============== S U B R O U T I N E =======================================


DisableInterrupts:
                
                clr.b   ((VINT_ENABLED-$1000000)).w
                move    #$2700,sr       ; set interrupt mask to level 7 : no more HInt/VInt !
                rts

    ; End of function DisableInterrupts


; =============== S U B R O U T I N E =======================================


EnableDisplayAndInterrupts:
                
                bsr.s   EnableDisplayOnVdp
                bra.s   EnableInterrupts

    ; End of function EnableDisplayAndInterrupts


; =============== S U B R O U T I N E =======================================


DisableDisplayAndInterrupts:
                
                bsr.s   DisableInterrupts
                bra.s   DisableDisplayOnVdp

    ; End of function DisableDisplayAndInterrupts


; =============== S U B R O U T I N E =======================================


ActivateVIntDmaQueueProcessing:
                
                bclr    #DEACTIVATE_DMA,(VINT_PARAMS).l
                rts

    ; End of function ActivateVIntDmaQueueProcessing


; =============== S U B R O U T I N E =======================================


DeactivateVIntDmaQueueProcessing:
                
                bset    #DEACTIVATE_DMA,(VINT_PARAMS).l
                rts

    ; End of function DeactivateVIntDmaQueueProcessing


; =============== S U B R O U T I N E =======================================


DuplicatePalettes:
                
                movem.l d7/a5-a6,-(sp)
                lea     (PALETTE_1_BASE).l,a5
                lea     (PALETTE_1_CURRENT).l,a6
                move.w  #CRAM_COLORS_COUNTER,d7
@Loop:
                
                move.w  (a5)+,(a6)+
                dbf     d7,@Loop
                movem.l (sp)+,d7/a5-a6

    ; End of function DuplicatePalettes


; =============== S U B R O U T I N E =======================================

; VDP CRAM


ApplyVIntCramDma:
                
                move    sr,-(sp)
                move    #$2700,sr       ; disable interrupts
                movem.l a6,-(sp)
                movea.l (DMA_QUEUE_POINTER).l,a6
                move.w  #$8F02,(a6)+    ; auto increment : 2
                move.w  #$9400,(a6)+    ; DMA length : 64
                move.w  #$9340,(a6)+
                move.w  #$96E8,(a6)+
                move.w  #$9500,(a6)+
                move.w  #$977F,(a6)+    ; RAM to VRAM, address : 0xFFD000 (Palette data)
                move.w  #$C000,(a6)+
                move.w  #$80,(a6)+      ; CRAM DMA Write
                move.l  a6,(DMA_QUEUE_POINTER).l
                addq.b  #1,(DMA_QUEUE_SIZE).l
                movem.l (sp)+,a6
                move    (sp)+,sr
                rts

    ; End of function ApplyVIntCramDma


; =============== S U B R O U T I N E =======================================

; Unused palette copy


SetBasePalette1:
                
                lea     (PALETTE_1_BASE).l,a1
                move.w  #$F,d0
loc_CCE:
                
                move.w  (a0)+,(a1)+
                dbf     d0,loc_CCE
                rts

    ; End of function SetBasePalette1


; =============== S U B R O U T I N E =======================================


FadeInFromBlack:
                
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                bra.w   ExecuteFading

    ; End of function FadeInFromBlack


; =============== S U B R O U T I N E =======================================


FadeOutToBlack:
                
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                bra.w   ExecuteFading

    ; End of function FadeOutToBlack


; =============== S U B R O U T I N E =======================================


FadeInFromWhite:
                
                move.b  #IN_FROM_WHITE,((FADING_SETTING-$1000000)).w
                bra.w   ExecuteFading

    ; End of function FadeInFromWhite


; =============== S U B R O U T I N E =======================================


FadeOutToWhite:
                
                move.b  #OUT_TO_WHITE,((FADING_SETTING-$1000000)).w

    ; End of function FadeOutToWhite


; =============== S U B R O U T I N E =======================================


ExecuteFading:
                
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
@Wait:
                
                bsr.w   WaitForVInt
                tst.b   ((FADING_SETTING-$1000000)).w ; wait until fade end
                bne.s   @Wait
                bsr.w   WaitForVInt
                rts

    ; End of function ExecuteFading


; =============== S U B R O U T I N E =======================================


ApplyCurrentColorFadingValue:
                
                movem.l d2-a2,-(sp)
                lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                moveq   #3,d6
loc_D30:
                
                moveq   #3,d5
                sub.w   d6,d5
                btst    d5,d1
                bne.s   loc_D44
                adda.w  #$20,a0 
                adda.w  #$20,a1 
                bra.w   loc_DA8
loc_D44:
                
                moveq   #$F,d7
loc_D46:
                
                movem.l d0,-(sp)
                move.w  (a0)+,d2
                add.w   d0,d0
                move.w  d2,d3
                andi.w  #$F,d3
                add.w   d0,d3
                bpl.s   loc_D5C
                clr.w   d3
                bra.s   loc_D66
loc_D5C:
                
                cmpi.w  #$F,d3
                ble.s   loc_D66
                move.w  #$F,d3
loc_D66:
                
                asl.w   #4,d0
                move.w  d2,d4
                andi.w  #$F0,d4 
                add.w   d0,d4
                bpl.s   loc_D76
                clr.w   d4
                bra.s   loc_D80
loc_D76:
                
                cmpi.w  #$F0,d4 
                ble.s   loc_D80
                move.w  #$F0,d4 
loc_D80:
                
                or.w    d4,d3
                asl.w   #4,d0
                move.w  d2,d4
                andi.w  #$F00,d4
                add.w   d0,d4
                bpl.s   loc_D92
                clr.w   d4
                bra.s   loc_D9C
loc_D92:
                
                cmpi.w  #$F00,d4
                ble.s   loc_D9C
                move.w  #$F00,d4
loc_D9C:
                
                or.w    d4,d3
                move.w  d3,(a1)+
                movem.l (sp)+,d0
                dbf     d7,loc_D46
loc_DA8:
                
                dbf     d6,loc_D30
                bsr.w   ApplyVIntCramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d2-a2
                rts

    ; End of function ApplyCurrentColorFadingValue


; =============== S U B R O U T I N E =======================================


ClearVsramAndSprites:
                
                move.w  #$100,(Z80BusReq).l
loc_DC2:
                
                btst    #0,(Z80BusReq).l
                bne.s   loc_DC2         ; wait for bus available
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
                clr.l   4(a0)
                addq.w  #8,a0
                addq.b  #1,d0
                dbf     d1,@Loop
                
                clr.b   -5(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ClearSpriteTable


; =============== S U B R O U T I N E =======================================


ClearScrollTableData:
                
                movem.l d7/a6,-(sp)
                move.w  #$C000,d0       ; clear scroll A table
                move.w  #$1000,d1
                clr.w   d2
                bsr.w   ApplyVramDmaFill
                move.w  #$E000,d0       ; clear scroll B table
                move.w  #$1000,d1
                clr.w   d2
                bsr.w   ApplyVramDmaFill
                move.w  #$1FF,d7
                lea     ((PLANE_A_MAP_LAYOUT-$1000000)).w,a6
loc_E62:
                
                clr.l   (a6)+
                dbf     d7,loc_E62
                move.w  #$1FF,d7
                adda.w  #$1800,a6
loc_E70:
                
                clr.l   (a6)+
                dbf     d7,loc_E70
                movem.l (sp)+,d7/a6
                rts

    ; End of function ClearScrollTableData


; =============== S U B R O U T I N E =======================================


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
                
                bset    #ENABLE_VINT,(VINT_PARAMS).l
                move.b  #1,((WAITING_NEXT_VINT-$1000000)).w
@Wait:
                
                tst.b   ((WAITING_NEXT_VINT-$1000000)).w ; wait until FFDEF7 clear
                bne.s   @Wait           
                rts

    ; End of function WaitForVInt


; =============== S U B R O U T I N E =======================================

; Wait for D0 VInts/Frames


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


; =============== S U B R O U T I N E =======================================


RequestVdpCommandQueueProcessing:
                
                bset    #VDP_COMMAND_REQUEST,(VINT_PARAMS).l
                rts

    ; End of function RequestVdpCommandQueueProcessing


; =============== S U B R O U T I N E =======================================


WaitForVdpCommandQueueProcessing:
                
                bsr.s   RequestVdpCommandQueueProcessing
                bra.w   WaitForVInt

    ; End of function WaitForVdpCommandQueueProcessing


; =============== S U B R O U T I N E =======================================


EnableDmaQueueProcessing:
                
                bset    #DMA_REQUEST,(VINT_PARAMS).l
                rts

    ; End of function EnableDmaQueueProcessing


; =============== S U B R O U T I N E =======================================


WaitForDmaQueueProcessing:
                
                bsr.s   EnableDmaQueueProcessing
                bra.w   WaitForVInt

    ; End of function WaitForDmaQueueProcessing


; =============== S U B R O U T I N E =======================================

; unused


sub_F3A:
                
                bsr.w   DisableInterrupts
                movem.l d7/a4-a5,-(sp)
                movea.l (VDP_COMMAND_QUEUE_POINTER).l,a4
                moveq   #0,d7
                move.w  d7,(a4)+
                bsr.s   sub_F90         
                move.w  a6,(a4)+
loc_F50:
                
                move.w  d0,(a4)+
                move.l  a4,(VDP_COMMAND_QUEUE_POINTER).l
                addq.b  #1,(VDP_COMMAND_COUNTER).l
                clr.l   d7
                move.w  a6,d7
                ori.l   #$FF0000,d7
                movea.l d7,a6
                move.w  d0,(a6)
                movem.l (sp)+,d7/a4-a5
                bsr.w   EnableInterrupts
                rts

    ; End of function sub_F3A


; =============== S U B R O U T I N E =======================================

; unused


sub_F76:
                
                bsr.w   DisableInterrupts
                movem.l d7/a4-a5,-(sp)
                movea.l (VDP_COMMAND_QUEUE_POINTER).l,a4
                moveq   #0,d7
                move.w  d7,(a4)+
                bsr.s   sub_F90         
                bsr.s   SwapA6
                move.w  a6,(a4)+
                bra.s   loc_F50

    ; End of function sub_F76


; =============== S U B R O U T I N E =======================================

; unused


sub_F90:
                
                movem.l d5-d7,-(sp)
                lea     ($E000).l,a6
                lsl.w   #1,d5
                move.w  (HORIZONTAL_SCROLL_DATA+2).l,d7
                addq.w  #4,d7
                lsr.w   #2,d7
                sub.w   d7,d5
                andi.w  #$7E,d5 
                lsl.w   #7,d6
                move.w  (VERTICAL_SCROLL_DATA+2).l,d7
                subq.w  #8,d7
                lsl.w   #4,d7
                add.w   d7,d6
                andi.w  #$F80,d6
                or.w    d6,d5
                adda.w  d5,a6
                bsr.s   SwapA6
                movem.l (sp)+,d5-d6
                movem.l d5-d6,-(sp)
                adda.l  #$C000,a6
                lsl.w   #1,d5
                move.w  (HORIZONTAL_SCROLL_DATA).l,d7
                lsr.w   #2,d7
                sub.w   d7,d5
                andi.w  #$7E,d5 
                lsl.w   #7,d6
                move.w  (VERTICAL_SCROLL_DATA).l,d7
                lsl.w   #4,d7
                add.w   d7,d6
                andi.w  #$F80,d6
                or.w    d6,d5
                adda.w  d5,a6
                movem.l (sp)+,d5-d7
                andi.w  #$7E,d5 
loc_FFE:
                
                andi.w  #$F80,d6
                rts

    ; End of function sub_F90


; =============== S U B R O U T I N E =======================================


SwapA6:
                
                movem.l d7,-(sp)
                move.l  a6,d7
                swap    d7
                movea.l d7,a6
                movem.l (sp)+,d7
                rts

    ; End of function SwapA6


; =============== S U B R O U T I N E =======================================

; unused


sub_1014:
                
                bsr.w   DisableInterrupts
                lea     (byte_FFDB80).l,a4
                movem.l d5-d6,-(sp)
                move.w  (word_FFDEA6).l,d5
                lsr.w   #8,d5
                move.w  (word_FFDEA6).l,d6
                andi.w  #$FF,d6
                bsr.w   sub_F90         
                movem.l (sp)+,d5-d6
loc_103C:
                
                movem.l d3-d4/a3-a6,-(sp)
                clr.l   d3
                move.w  a6,d3
                cmpi.w  #$E000,d3
                bcc.s   loc_104E
                addi.w  #$1000,d3
loc_104E:
                
                ori.l   #$FF0000,d3
                movea.l d3,a3
                movea.l (VDP_COMMAND_QUEUE_POINTER).l,a5
                move.w  (word_FFDEA8).l,d3
                andi.l  #$FF,d3
                move.b  d3,(VDP_COMMAND_COUNTER).l
                subq.w  #1,d3
loc_1070:
                
                movem.l a3,-(sp)
                move.w  (word_FFDEA8).l,d4
                andi.l  #$FF00,d4
                lsr.w   #8,d4
                subq.w  #1,d4
                move.w  d4,(a5)+
                move.w  a6,(a5)+
loc_1088:
                
                move.w  (a4),(a5)+
                move.w  (a4)+,(a3)+
                dbf     d4,loc_1088
                adda.w  #$80,a6 
                movem.l (sp)+,a3
                adda.w  #$80,a3 
                dbf     d3,loc_1070
                movem.l (sp)+,d3-d4/a3-a6
                bsr.w   EnableInterrupts
                bra.w   WaitForVdpCommandQueueProcessing
                bsr.w   DisableInterrupts
                lea     (byte_FFDB80).l,a4
                movem.l d5-d6,-(sp)
                move.w  (word_FFDEA6).l,d5
                lsr.w   #8,d5
                move.w  (word_FFDEA6).l,d6
                andi.w  #$FF,d6
                bsr.w   sub_F90         
                movem.l (sp)+,d5-d6
                bsr.w   SwapA6
                bra.w   loc_103C

    ; End of function sub_1014


; =============== S U B R O U T I N E =======================================

; A0=Source, A1=Destination, D0=Length, D1=Auto-increment


ApplyImmediateVramDma:
                
                move    sr,-(sp)
                move    #$2700,sr
                move.w  #$100,(Z80BusReq).l
loc_10EA:
                
                btst    #0,(Z80BusReq).l
                bne.s   loc_10EA
                movem.l d2,-(sp)
                movem.l d0/a6,-(sp)
                lea     (VDP_Control).l,a6
                cmpi.w  #2,d1
                beq.s   loc_1112
                move.l  d1,d2
                addi.w  #-$7100,d1
                move.w  d1,(a6)
                move.l  d2,d1
loc_1112:
                
                moveq   #$10,d2
                or.w    (VDP_REG01_STATUS).l,d2
                move.w  d2,(a6)
                clr.w   d2
                move.b  d0,d2
                lsr.w   #8,d0
                swap    d0
                move.w  d2,d0
                ori.l   #$94009300,d0
                move.l  d0,(a6)
                move.l  #$96009500,d2
                move.l  a0,d0
                lsr.l   #1,d0
                move.b  d0,d2
                lsr.w   #8,d0
                swap    d2
                move.b  d0,d2
                swap    d2
                move.l  d2,(a6)
                swap    d0
                ori.w   #$9700,d0
                move.w  d0,(a6)
                move.w  a1,d0
                andi.w  #$3FFF,d0
                ori.w   #$4000,d0
                move.w  d0,(a6)
                move.w  a1,d0
                rol.w   #2,d0
                andi.w  #3,d0
                ori.b   #$80,d0
                move.w  d0,(DMA_ADDR_MSBYTE).l
                move.w  (DMA_ADDR_MSBYTE).l,(a6)
                move.w  (VDP_REG01_STATUS).l,(a6)
                move.w  #0,(Z80BusReq).l
                cmpi.w  #2,d1
                beq.s   loc_1188
                move.w  #$8F02,(a6)
loc_1188:
                
                movem.l (sp)+,d0/a6
                moveq   #0,d2
                move.w  d0,d2
                add.l   d2,d2
                adda.l  d2,a0
                adda.l  d2,a1
                movem.l (sp)+,d2
                move    (sp)+,sr
                rts

    ; End of function ApplyImmediateVramDma


; =============== S U B R O U T I N E =======================================

; A0=Source, A1=Destination, D0=Length, D1=Auto-increment


ApplyVIntVramDma:
                
                move    sr,-(sp)
                move    #$2700,sr
                move.b  ((VINT_ENABLED-$1000000)).w,-(sp)
                sf      ((VINT_ENABLED-$1000000)).w ; gives msb sign
                movem.l d2,-(sp)
                movem.l d0/a6,-(sp)
                movea.l (DMA_QUEUE_POINTER).l,a6
                move.l  d1,d2
                addi.w  #$8F00,d1
                move.w  d1,(a6)+        ; Apply auto-increment from D1
                move.l  d2,d1
                clr.w   d2
                move.b  d0,d2
                lsr.w   #8,d0
                swap    d0
                move.w  d2,d0
                ori.l   #$94009300,d0
                move.l  d0,(a6)+        ; Apply DMA Length from D0
                move.l  #$96009500,d2
                move.l  a0,d0
                lsr.l   #1,d0
                move.b  d0,d2
                lsr.w   #8,d0
                swap    d2
                move.b  d0,d2
                swap    d2
                move.l  d2,(a6)+
                swap    d0
                ori.w   #$9700,d0
                move.w  d0,(a6)+        ; Apply source address from A0
                move.w  a1,d0
                andi.w  #$3FFF,d0
                ori.w   #$4000,d0
                move.w  d0,(a6)+
                move.w  a1,d0
                rol.w   #2,d0
                andi.w  #3,d0
                ori.b   #$80,d0
                move.w  d0,(a6)+        ; Apply VRAM write destination address from A1
                move.l  a6,(DMA_QUEUE_POINTER).l
                addq.b  #1,(DMA_QUEUE_SIZE).l
                movem.l (sp)+,d0/a6
                moveq   #0,d2
                move.w  d0,d2
                add.l   d2,d2
                adda.l  d2,a0
                adda.l  d2,a1
                movem.l (sp)+,d2
                move.b  (sp)+,((VINT_ENABLED-$1000000)).w
                move    (sp)+,sr
                rts

    ; End of function ApplyVIntVramDma


; =============== S U B R O U T I N E =======================================

; unused


sub_1234:
                
                movem.w d7,-(sp)
                move.w  a6,d7
                andi.w  #$3FFF,d7
                ori.w   #$4000,d7
                move.w  d7,(VDP_Control).l
                move.w  a6,d7
                lsr.w   #8,d7
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
                bne.s   loc_127C        
                move.w  #$9400,(a6)+    ; If HScroll mode = 00, then full screen
                move.w  #$9302,(a6)+    ; DMA length = 2
                bra.s   loc_1284
loc_127C:
                
                move.w  #$9402,(a6)+    ; If HScroll mode = 10, then 8 pixel rows
                move.w  #$9300,(a6)+    ; DMA length = $200 = 512
loc_1284:
                
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
                
                move.w  #$FF,d7
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
                bne.s   loc_12F4        
                move.w  #$9400,(a6)+    ; If VS mode = 0, then full screen (1 longword only in VSRAM)
                move.w  #$9304,(a6)+    ; DMA length = 4
                bra.s   loc_12FC
loc_12F4:
                
                move.w  #$9400,(a6)+    ; if VS mode = 1 then 16 pixel columns (1 word per column in VSRAM)
                move.w  #$9328,(a6)+    ; DMA length = 40
loc_12FC:
                
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
                
                move.w  #$13,d7
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


; =============== S U B R O U T I N E =======================================

; A0=Source, A1=Destination, D0=Length, D1=Auto-increment


ApplyImmediateVramDmaOnCompressedTiles:
                
                movem.w d1,-(sp)
                bsr.s   DecompressTilesForVramDma
                bsr.w   ApplyImmediateVramDma
                movem.w (sp)+,d1
                rts

    ; End of function ApplyImmediateVramDmaOnCompressedTiles


; =============== S U B R O U T I N E =======================================


DecompressTilesForVramDma:
                
                movem.l d0-d1/a1,-(sp)
                lea     (FF8804_LOADING_SPACE).l,a1
                bsr.w   LoadCompressedData
                lea     (FF8804_LOADING_SPACE).l,a0
                movem.l (sp)+,d0-d1/a1
                move.w  #2,d1
                rts

    ; End of function DecompressTilesForVramDma


; =============== S U B R O U T I N E =======================================


ApplyVIntVramDmaOnCompressedTiles:
                
                movem.w d1,-(sp)
                bsr.s   DecompressTilesForVramDma
                bsr.w   ApplyVIntVramDma
                movem.w (sp)+,d1
                rts

    ; End of function ApplyVIntVramDmaOnCompressedTiles


; =============== S U B R O U T I N E =======================================

; unused DMA code


sub_13C0:
                
                movem.l d0-d1/a0-a1,-(sp)
                lea     ((PLANE_A_MAP_LAYOUT-$1000000)).w,a0
                lea     ($C000).l,a1
                move.w  #$800,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function sub_13C0


; =============== S U B R O U T I N E =======================================

; unused DMA code


sub_13E4:
                
                movem.l d0-d1/a0-a1,-(sp)
                lea     ((PLANE_A_MAP_LAYOUT-$1000000)).w,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function sub_13E4


; =============== S U B R O U T I N E =======================================

; unused


DmaAndWait:
                
                bsr.s   sub_13C0        
                bra.w   WaitForVInt

    ; End of function DmaAndWait


; =============== S U B R O U T I N E =======================================

; D0=Destination, D1=Length, D2=Filler value


ApplyVramDmaFill:
                
                movem.l d0-d3,-(sp)
                move.w  (VDP_REG01_STATUS).l,d3 ; get last 16+ vdp reg config command ?
                ori.b   #$10,d3         ; make sure it concerns a 16+ vdp reg
                move.w  d3,(VDP_Control).l ; send command again
                move.w  #$8F01,(VDP_Control).l ; set auto increment bias number to 1
                movem.l d1,-(sp)
                andi.w  #$FF,d1
                ori.w   #$9300,d1
                move.w  d1,(VDP_Control).l ; DMA length counter low : 0
                movem.l (sp)+,d1
                lsr.w   #8,d1
                ori.w   #$9400,d1       ; DMA length counter high : 1
                move.w  d1,(VDP_Control).l
                move.w  #$9780,(VDP_Control).l ; VRAM fill
                movem.l d0,-(sp)
                andi.w  #$3FFF,d0       ; d0 : destination address
                ori.w   #$4000,d0
                move.w  d0,(VDP_Control).l
                movem.l (sp)+,d0
                rol.w   #2,d0
                andi.w  #3,d0
                ori.w   #$80,d0 ; errr .. CD5 set to 1 ? doesn't correspond to any access mode
                move.w  d0,(VDP_Control).l ; destination address, second word
                move.w  d2,(VDP_Data).l ; writes 0 everytime
@Wait:
                
                move.w  (VDP_Control).l,d0
                andi.w  #2,d0           ; wait for DMA free
                bne.s   @Wait
                move.w  (VDP_REG01_STATUS).l,d3 ; get last vdp 16+ reg config command and send it
                move.w  d3,(VDP_Control).l
                move.w  #$8F02,(VDP_Control).l ; auto increment bias number : 2
                movem.l (sp)+,d0-d3
                rts

    ; End of function ApplyVramDmaFill

