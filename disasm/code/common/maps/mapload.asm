
; ASM FILE code\common\maps\mapload.asm :
; 0x20E6..0x2F6A : Map loading functions

; =============== S U B R O U T I N E =======================================

; A0=Source, A1=Destination


LoadMapLayoutData:
                
                movem.l d0-a6,-(sp)
                lea     (MAP_LAYOUT_HISTORY_MAP_SIZES).l,a4
                moveq   #0,d3
                move.w  #$7F,d0 
loc_20F6:
                
                move.l  d3,(a4)+        ; clear block history maps
                move.l  d3,(a4)+
                move.l  d3,(a4)+
                move.l  d3,(a4)+
                dbf     d0,loc_20F6     
                movea.l a1,a3
                lea     $2000(a1),a6    ; set a6 as 0x2000 past beginning in RAM (to signify end)
                clr.w   d3
                moveq   #2,d7
                lea     (MAP_LAYOUT_HISTORY_MAP_SIZES).l,a4
                moveq   #0,d3
loc_2114:
                
                cmpa.l  a6,a1           ; loop point; compare a1 to a6 to see if we're done
                bcs.s   loc_211E
                movem.l (sp)+,d0-a6
                rts
loc_211E:
                
                dbf     d3,loc_2126
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_2126:
                
                add.w   d0,d0
                bcs.w   loc_21A6        
                dbf     d3,loc_2134     
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_2134:
                
                add.w   d0,d0           ; 0...
                bcs.w   loc_214E        
                bsr.w   ReadMapLayoutBarrelForBlockFlags ; 00 : Output next block from block set
                addq.w  #1,d7
                or.w    d7,d1
                bsr.w   SaveBlockToLeftStackMap
                bsr.w   SaveBlockToUpperStackMap
                move.w  d1,(a1)+
                bra.s   loc_2114        
loc_214E:
                
                moveq   #$FFFFFFFF,d4   ; 01 : Copy section
                clr.w   d1
                moveq   #2,d5
loc_2154:
                
                dbf     d3,loc_215C     
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_215C:
                
                add.w   d0,d0           ; count "0" bits until next bit "1" = value length in bits
                dbcs    d4,loc_2154
                negx.w  d4
                dbf     d4,loc_216A
                bra.s   loc_2180
loc_216A:
                
                lsl.w   d4,d5
loc_216C:
                
                dbf     d3,loc_2174     
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_2174:
                
                add.w   d0,d0           ; value = value + 2^count
                addx.w  d1,d1
                dbf     d4,loc_216C
                add.w   d5,d1
                subq.w  #1,d1
loc_2180:
                
                dbf     d3,loc_2188
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_2188:
                
                add.w   d0,d0
                bcs.w   loc_219A        
loc_218E:
                
                move.w  -$80(a1),(a1)+  ; 0 = copy section from upper block N times
                dbf     d1,loc_218E     
                bra.w   loc_2114        
loc_219A:
                
                move.w  -2(a1),(a1)+    ; 1 = copy section from left block N times
                dbf     d1,loc_219A     
                bra.w   loc_2114        ; END of 01 : Copy section
loc_21A6:
                
                lea     -2(a1),a2       ; 1... get left tile address
                cmpa.l  a3,a2
                bcc.s   loc_21B4
                clr.w   d1
                bra.w   loc_21BA
loc_21B4:
                
                move.w  (a2),d1
                andi.w  #$3FF,d1        ; get left tile value
loc_21BA:
                
                move.w  d1,d4
                move.b  (a4,d1.w),d1    ; left tile stack size
                ext.w   d1
                dbf     d1,loc_21C8
                bra.s   loc_2208        ; if no left block stack, then this is not a "10" command, go check for 11 or 1
loc_21C8:
                
                dbf     d3,loc_21D0
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_21D0:
                
                add.w   d0,d0
                bcs.w   loc_2208        
                lea     (FF6800_MAP_LOADING_LEFT_HISTORY_MAP).l,a5 ; 10 : get block from left history map
                bra.w   loc_21F0
loc_21E0:
                
                dbf     d3,loc_21E8
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_21E8:
                
                add.w   d0,d0
                bcs.w   loc_21F4        ; get stack position :
                                        ; number of bits to parse = current stack size
                                        ; +1 per bit 0, stop at first bit 1
                addq.w  #2,a5
loc_21F0:
                
                dbf     d1,loc_21E0
loc_21F4:
                
                lsl.w   #3,d4
                move.w  (a5,d4.w),d1
                bsr.w   SaveBlockToLeftStackMap
                bsr.w   SaveBlockToUpperStackMap
                move.w  d1,(a1)+        ; END of 10 : Get block from left history map
                bra.w   loc_2114        
loc_2208:
                
                lea     -$80(a1),a2     ; 11, or 1 with no stack for left block : check upper block history stack
                cmpa.l  a3,a2
                bcc.s   loc_2216
                clr.w   d1
                bra.w   loc_221C
loc_2216:
                
                move.w  (a2),d1
                andi.w  #$3FF,d1
loc_221C:
                
                move.w  d1,d4
                ori.w   #$400,d1
                move.b  (a4,d1.w),d1
                ext.w   d1
                dbf     d1,loc_222E
                bra.s   loc_226E        ; no upper stack
loc_222E:
                
                dbf     d3,loc_2236
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_2236:
                
                add.w   d0,d0
                bcs.w   loc_226E        ; 111
                lea     (FF8800_MAP_LOADING_UPPER_HISTORY_MAP).l,a5 ; 110 : Get block from upper block history map
                bra.w   loc_2256
loc_2246:
                
                dbf     d3,loc_224E
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_224E:
                
                add.w   d0,d0
                bcs.w   loc_225A
                addq.w  #2,a5
loc_2256:
                
                dbf     d1,loc_2246
loc_225A:
                
                lsl.w   #3,d4
                move.w  (a5,d4.w),d1
                bsr.w   SaveBlockToLeftStackMap
                bsr.w   SaveBlockToUpperStackMap
                move.w  d1,(a1)+        ; END of 11 : Get block from upper history map
                bra.w   loc_2114        
loc_226E:
                
                move.w  d7,d1           ; 111 or 11 with no upper stack or 1 with no left and upper stacks
                clr.w   d4
loc_2272:
                
                dbf     d3,loc_227A
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_227A:
                
                add.w   d0,d0
                addx.w  d4,d4           ; number of bits to get = bit length of block set cursor
                lsr.w   #1,d1
                bne.s   loc_2272
                bsr.w   ReadMapLayoutBarrelForBlockFlags
                or.w    d4,d1
                bsr.w   SaveBlockToLeftStackMap
                bsr.w   SaveBlockToUpperStackMap
                move.w  d1,(a1)+
                bra.w   loc_2114        

    ; End of function LoadMapLayoutData


; =============== S U B R O U T I N E =======================================

; Reads next part of barrel to determine flags for next block
; barrel = 00
; 
; In: D0 = barrel
; Out: D1 = block flag word


ReadMapLayoutBarrelForBlockFlags:
                
                dbf     d3,loc_229E
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_229E:
                
                add.w   d0,d0
                bcs.w   loc_22B6        
                clr.w   d1              ; 0...
                dbf     d3,loc_22AE
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_22AE:
                
                add.w   d0,d0
                roxr.w  #1,d1           ; 00=0x0000 ; 01=0xC000
                asr.w   #1,d1
                rts
loc_22B6:
                
                dbf     d3,loc_22BE     ; 1...
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_22BE:
                
                add.w   d0,d0
                bcs.w   loc_22D8        
                clr.w   d1              ; 10...
                dbf     d3,loc_22CE
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_22CE:
                
                add.w   d0,d0
                addx.w  d1,d1           ; 100=0x4000 ; 101=0x8000
                addq.w  #1,d1
                ror.w   #2,d1
                rts
loc_22D8:
                
                move.l  d2,-(sp)        ; 11 : get next 6 bits
                moveq   #5,d2
                clr.w   d1
loc_22DE:
                
                dbf     d3,loc_22E6
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_22E6:
                
                add.w   d0,d0
                addx.w  d1,d1
                dbf     d2,loc_22DE
                ror.w   #6,d1
                move.l  (sp)+,d2
                rts

    ; End of function ReadMapLayoutBarrelForBlockFlags


; =============== S U B R O U T I N E =======================================


SaveBlockToUpperStackMap:
                
                lea     -$80(a1),a2     ; upper block value
                cmpa.l  a3,a2
                bcc.s   loc_2302
                clr.w   d4
                bra.w   loc_2308        
loc_2302:
                
                move.w  (a2),d4
                andi.w  #$3FF,d4
loc_2308:
                
                ori.w   #$400,d4        ; get upper block value + 0x0400 for upper blocks offset
                bra.w   loc_2324

    ; End of function SaveBlockToUpperStackMap


; =============== S U B R O U T I N E =======================================


SaveBlockToLeftStackMap:
                
                lea     -2(a1),a2
                cmpa.l  a3,a2
                bcc.s   loc_231E
                clr.w   d4
                bra.w   loc_2324
loc_231E:
                
                move.w  (a2),d4
                andi.w  #$3FF,d4        ; get left block value
loc_2324:
                
                lea     (a4,d4.w),a5
                move.b  (a5),d2
                ext.w   d2
                move.w  d2,d5
                lsl.w   #3,d4
                lea     (FF6800_MAP_LOADING_LEFT_HISTORY_MAP).l,a2
                adda.w  d4,a2
                dbf     d5,loc_2344
                move.b  #1,(a5)         ; when first value of entry stack
                move.w  d1,(a2)
                rts
loc_2344:
                
                move.w  d1,d4
loc_2346:
                
                move.w  (a2),d6
                move.w  d4,(a2)+        ; push current value on top of stack
                cmp.w   d6,d1           ; if existing stack value = saved value, do nothing else
                beq.s   return_2370
                dbf     d5,loc_235C
                subq.w  #4,d2           ; if last stack value to process
                bcc.s   return_235A     ; if stack already maxed to 4, do nothing else
                move.w  d6,(a2)         ; else, push previous value and increment stack size
                addq.b  #1,(a5)
return_235A:
                
                rts
loc_235C:
                
                move.w  (a2),d4
                move.w  d6,(a2)+
                cmp.w   d4,d1
                beq.s   return_2370     ; if existing stack value = saved value, do nothing else
                dbf     d5,loc_2346
                subq.w  #4,d2
                bcc.s   return_2370
                move.w  d4,(a2)         ; if stack maxed to 4, do nothing else
                addq.b  #1,(a5)
return_2370:
                
                rts

    ; End of function SaveBlockToLeftStackMap


; =============== S U B R O U T I N E =======================================

; a0 : input ROM block data
; a1 : output RAM data


LoadMapBlocks:
                
                movem.l d0-a6,-(sp)
                lea     (FF6800_MAP_LOADING_LEFT_HISTORY_MAP).l,a2
                clr.w   d4
                move.w  #$100,d0        ; First 3 blocks are : 
                                        ; - empty
                                        ; - closed chest
                                        ; - open chest
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  d0,(a1)+
                move.w  #$32E,(a1)+     ; Chest block data.
                move.w  #$32F,(a1)+     ; This implies that chest tiles have to be in 5th map tileset in following positions.
                move.w  #$B2E,(a1)+     ; VDP RAM base offset : 0x100
                move.w  #$33E,(a1)+
                move.w  #$33F,(a1)+
                move.w  #$B3E,(a1)+
                move.w  #$34E,(a1)+
                move.w  #$34F,(a1)+
                move.w  #$B4E,(a1)+
                move.w  #$32C,(a1)+
                move.w  #$32D,(a1)+
                move.w  #$B2C,(a1)+
                move.w  #$33C,(a1)+
                move.w  #$33D,(a1)+
                move.w  #$B3C,(a1)+
                move.w  #$34E,(a1)+
                move.w  #$34F,(a1)+
                move.w  #$B4E,(a1)+
                subi.w  #$E,d4
                bcc.s   loc_2402
                addi.w  #$E,d4
                rol.l   d4,d0
                move.w  (a0)+,d0
                subi.w  #$E,d4
                neg.w   d4
                rol.l   d4,d0
                neg.w   d4
                addi.w  #$10,d4
                move.l  d0,d5
                swap    d5
                andi.w  #$3FFF,d5       ; first 14 bits = number of commands
                bra.s   loc_240A        
loc_2402:
                
                move.w  #$3FFF,d5
                ror.w   #2,d0
                and.w   d0,d5
loc_240A:
                
                dbf     d5,loc_2414     ; loop while commands remain
                movem.l (sp)+,d0-a6
                rts
loc_2414:
                
                dbf     d4,loc_241C
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_241C:
                
                add.w   d0,d0
                bcs.w   loc_244C        
                dbf     d4,loc_242A
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_242A:
                
                add.w   d0,d0
                bcs.w   loc_2436
                move.w  -2(a1),(a1)+    ; 00 : repeat last output tile
                bra.s   loc_240A        
loc_2436:
                
                move.w  -2(a1),d1
                btst    #$B,d1          ; 01 : output last tile's previous or next tile in tileset, according to last tiles direction
                bne.s   loc_2446
                addq.w  #1,d1           ; if HFlip clear, get next tile in tileset
                move.w  d1,(a1)+
                bra.s   loc_240A        
loc_2446:
                
                subq.w  #1,d1
                move.w  d1,(a1)+        ; if HFlip set, get previous tile in tileset
                bra.s   loc_240A        
loc_244C:
                
                dbf     d4,loc_2454     ; 1...
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_2454:
                
                add.w   d0,d0
                bcs.w   loc_249E        
                dbf     d4,loc_2462     
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_2462:
                
                add.w   d0,d0           ; 10...
                bcs.w   loc_2480        
                move.w  -2(a1),d1       ; 100 : get next right tile from map
                move.w  d1,d2
                andi.w  #$3FF,d1
                andi.w  #$800,d2
                add.w   d1,d1
                or.w    d2,d1
                move.w  (a2,d1.w),(a1)+
                bra.s   loc_240A        
loc_2480:
                
                move.w  -6(a1),d1       ; 101 : get next bottom tile from map
                move.w  d1,d2
                andi.w  #$3FF,d1
                andi.w  #$800,d2
                ori.w   #$1000,d2
                add.w   d1,d1
                or.w    d2,d1
loc_2496:
                
                move.w  (a2,d1.w),(a1)+
                bra.w   loc_240A        
loc_249E:
                
                dbf     d4,loc_24A6     ; 11...
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_24A6:
                
                add.w   d0,d0
                bcs.w   loc_24B8        
                move.w  -2(a1),d7       ; 110
                andi.w  #$9800,d7       ; keep same flags as previous output tile
                bra.w   loc_24E0
loc_24B8:
                
                clr.w   d7              ; 111
                dbf     d4,loc_24C2
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_24C2:
                
                add.w   d0,d0
                roxl.w  #3,d7
                dbf     d4,loc_24CE
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_24CE:
                
                add.w   d0,d0
                addx.w  d7,d7
                dbf     d4,loc_24DA     
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_24DA:
                
                add.w   d0,d0           ; next 3 bits are used to define d7 (high priority, VFlip and HFlip)
                addx.w  d7,d7
                ror.w   #5,d7
loc_24E0:
                
                dbf     d4,loc_24E8
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_24E8:
                
                add.w   d0,d0
                bcc.w   loc_253C        
                subi.w  #9,d4           ; if 4th bit = 1, then d3 = next 9 bits
                bcc.s   loc_2514
                addi.w  #9,d4
                rol.l   d4,d0
                move.w  (a0)+,d0
                subi.w  #9,d4
                neg.w   d4
                rol.l   d4,d0
                neg.w   d4
                addi.w  #$10,d4
                move.l  d0,d3
                swap    d3
                andi.w  #$1FF,d3
                bra.s   loc_251C
loc_2514:
                
                move.w  #$1FF,d3
                ror.w   #7,d0
                and.w   d0,d3
loc_251C:
                
                cmpi.w  #$180,d3
                bcs.s   loc_2532        
                dbf     d4,loc_252A
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_252A:
                
                add.w   d0,d0
                addx.w  d3,d3
                subi.w  #$180,d3
loc_2532:
                
                addi.w  #$100,d3        ; d3 = tile offset in VDP RAM
                or.w    d7,d3
                bra.w   loc_257A        
loc_253C:
                
                subq.w  #5,d4           ; if 4th bit = 0, take next 5 bits only, instead of 9
                bcc.s   loc_255C
                addq.w  #5,d4
                rol.l   d4,d0
                move.w  (a0)+,d0
                subq.w  #5,d4
                neg.w   d4
                rol.l   d4,d0
                neg.w   d4
                addi.w  #$10,d4
                move.l  d0,d3
                swap    d3
                andi.w  #$1F,d3
                bra.s   loc_2562
loc_255C:
                
                moveq   #$1F,d3
                rol.w   #5,d0
                and.w   d0,d3
loc_2562:
                
                dbf     d4,loc_256A
                moveq   #$F,d4
                move.w  (a0)+,d0
loc_256A:
                
                add.w   d0,d0
                bcc.s   loc_2570
                neg.w   d3
loc_2570:
                
                add.w   -2(a1),d3
                andi.w  #$7FF,d3
                or.w    d7,d3
loc_257A:
                
                move.w  -2(a1),d1       ; get previous tile
                move.w  d1,d2
                andi.w  #$3FF,d1        ; d1 = offset
                andi.w  #$800,d2        ; d2 = HFlip
                add.w   d1,d1
                or.w    d2,d1
                move.w  d3,(a2,d1.w)    ; update map of next right tile value
                move.w  -6(a1),d1
                move.w  d1,d2
                andi.w  #$3FF,d1
                andi.w  #$800,d2
                ori.w   #$1000,d2
                add.w   d1,d1
                or.w    d2,d1
                move.w  d3,(a2,d1.w)    ; update map of next bottom tile value
                move.w  d3,(a1)+        ; output tile value
                bra.w   loc_240A        

    ; End of function LoadMapBlocks


; =============== S U B R O U T I N E =======================================


ProcessMapTransition:
                
                clr.w   d1
                move.b  ((CURRENT_MAP-$1000000)).w,d1
                movea.l (p_pt_MapData).l,a5
                lsl.w   #2,d1
                movea.l (a5,d1.w),a5
                addq.l  #1,a5
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_25E8
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     ($2000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDmaOnCompressedTiles
                bsr.w   WaitForDmaQueueProcessing
loc_25E8:
                
                addq.l  #1,a5
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_260E
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     ($4000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDmaOnCompressedTiles
                bsr.w   WaitForDmaQueueProcessing
loc_260E:
                
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_2632
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     ($5000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDmaOnCompressedTiles
                bsr.w   WaitForDmaQueueProcessing
loc_2632:
                
                addq.l  #1,a5
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateScrollingData
                bsr.w   LoadMapBlocksAndLayout
                movea.l (a5)+,a4
                move.w  (a4)+,d0
                move.w  (a4)+,d1
                move.w  (a4)+,d2
                move.w  (a4)+,d3
                mulu.w  #$180,d0
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                mulu.w  #$180,d3
                bsr.w   ApplyOverworldMapTransition
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l 0
                rts

    ; End of function ProcessMapTransition


; =============== S U B R O U T I N E =======================================


ApplyOverworldMapTransition:
                
                move.b  ((MAP_EVENT_PARAM_1-$1000000)).w,d0
                andi.w  #3,d0           ; Facing
                add.w   d0,d0
                move.w  rjt_OverworldMapTransition(pc,d0.w),d0
                jmp     rjt_OverworldMapTransition(pc,d0.w)

    ; End of function ApplyOverworldMapTransition

rjt_OverworldMapTransition:
                dc.w ApplyOverworldMapTransition_Right-rjt_OverworldMapTransition
                dc.w ApplyOverworldMapTransition_Up-rjt_OverworldMapTransition
                dc.w ApplyOverworldMapTransition_Left-rjt_OverworldMapTransition
                dc.w ApplyOverworldMapTransition_Down-rjt_OverworldMapTransition

; =============== S U B R O U T I N E =======================================


ApplyOverworldMapTransition_Right:
                
                move.w  #0,((VIEW_PLANE_A_PIXEL_X-$1000000)).w
                move.w  #0,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                move.w  #0,((word_FFA818-$1000000)).w
                move.w  #0,((word_FFA81C-$1000000)).w
                jsr     UpdateVdpPlaneB(pc)
                nop
                move.w  #$1D,d7
                lea     (PLANE_B_LAYOUT).l,a0
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  #2,d0
                move.w  #$3E,d1 
loc_26C0:
                
                subq.w  #8,((VIEW_PLANE_A_X_COUNTER-$1000000)).w
                cmpi.w  #$14,d7
                bge.s   loc_26D0
                move.w  #$F900,d2
                bra.s   loc_26D4
loc_26D0:
                
                move.w  #$F900,d2
loc_26D4:
                
                move.w  #$F800,d3
                bsr.w   sub_29A2
                bsr.w   WaitForVInt
                move.w  #$1F,d6
                movem.l d0-d1,-(sp)
loc_26E8:
                
                move.w  (a0,d0.w),(a1,d1.w)
                addi.w  #$40,d0 
                addi.w  #$40,d1 
                dbf     d6,loc_26E8
                movem.l (sp)+,d0-d1
                addq.w  #2,d0
                andi.w  #$3E,d0 
                addq.w  #2,d1
                andi.w  #$3E,d1 
                movem.l d0-d1/a0-a1,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                dbf     d7,loc_26C0
                bsr.w   WaitForVInt
                move.w  #0,((VIEW_PLANE_A_X_COUNTER-$1000000)).w
                move.w  #0,((VIEW_PLANE_B_X_COUNTER-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateScrollingData
                jsr     UpdateVdpPlaneA(pc)
                nop
                rts

    ; End of function ApplyOverworldMapTransition_Right


; =============== S U B R O U T I N E =======================================


ApplyOverworldMapTransition_Left:
                
                move.w  #$4F80,((VIEW_PLANE_A_PIXEL_X-$1000000)).w
                move.w  #$4F80,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                move.w  #$4F80,((word_FFA818-$1000000)).w
                move.w  #$4F80,((word_FFA81C-$1000000)).w
                jsr     UpdateVdpPlaneB(pc)
                nop
                move.w  #$1D,d7
loc_2772:
                
                lea     (PLANE_B_LAYOUT).l,a0
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  #$3C,d0 
                move.w  #0,d1
loc_2786:
                
                addq.w  #8,((VIEW_PLANE_A_X_COUNTER-$1000000)).w
                cmpi.w  #$14,d7
                bge.s   loc_2796
                move.w  #$700,d2
                bra.s   loc_279A
loc_2796:
                
                move.w  #$700,d2
loc_279A:
                
                move.w  #$800,d3
                bsr.w   sub_29A2
                bsr.w   WaitForVInt
                move.w  #$1F,d6
                movem.l d0-d1,-(sp)
loc_27AE:
                
                move.w  (a0,d0.w),(a1,d1.w)
                addi.w  #$40,d0 
                addi.w  #$40,d1 
                dbf     d6,loc_27AE
                movem.l (sp)+,d0-d1
                subq.w  #2,d0
                andi.w  #$3E,d0 
                subq.w  #2,d1
                andi.w  #$3E,d1 
                movem.l d0-d1/a0-a1,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                dbf     d7,loc_2786
                bsr.w   WaitForVInt
                move.w  #8,((VIEW_PLANE_A_X_COUNTER-$1000000)).w
                move.w  #8,((VIEW_PLANE_B_X_COUNTER-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateScrollingData
                jsr     UpdateVdpPlaneA(pc)
                nop
                rts

    ; End of function ApplyOverworldMapTransition_Left


; =============== S U B R O U T I N E =======================================


ApplyOverworldMapTransition_Up:
                
                move.w  #$5100,((VIEW_PLANE_A_PIXEL_Y-$1000000)).w
                move.w  #$5100,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
                move.w  #$5100,((word_FFA81A-$1000000)).w
                move.w  #$5100,((word_FFA81E-$1000000)).w
                jsr     UpdateVdpPlaneB(pc)
                nop
                move.w  #$1A,d7
                lea     (PLANE_B_LAYOUT).l,a0
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  #$6C0,d0
                move.w  #0,d1
loc_284C:
                
                subq.w  #8,((VIEW_PLANE_A_Y_COUNTER-$1000000)).w
                cmpi.w  #$14,d7
                bge.s   loc_285C
                move.w  #7,d2
                bra.s   loc_2860
loc_285C:
                
                move.w  #7,d2
loc_2860:
                
                move.w  #8,d3
                bsr.w   sub_29A2
                bsr.w   WaitForVInt
                move.w  #$1F,d6
                movem.l d0-d1,-(sp)
loc_2874:
                
                move.w  (a0,d0.w),(a1,d1.w)
                addq.w  #2,d0
                addq.w  #2,d1
                dbf     d6,loc_2874
                movem.l (sp)+,d0-d1
                subi.w  #$40,d0 
                andi.w  #$7FE,d0
                subi.w  #$40,d1 
                andi.w  #$7FE,d1
                movem.l d0-d1/a0-a1,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                dbf     d7,loc_284C
                bsr.w   WaitForVInt
                move.w  #$18,((VIEW_PLANE_A_Y_COUNTER-$1000000)).w
                move.w  #$18,((VIEW_PLANE_B_Y_COUNTER-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateScrollingData
                jsr     UpdateVdpPlaneA(pc)
                nop
                rts

    ; End of function ApplyOverworldMapTransition_Up


; =============== S U B R O U T I N E =======================================


ApplyOverworldMapTransition_Down:
                
                move.w  #0,((VIEW_PLANE_A_PIXEL_Y-$1000000)).w
                move.w  #0,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
                move.w  #0,((word_FFA81A-$1000000)).w
                move.w  #0,((word_FFA81E-$1000000)).w
                jsr     UpdateVdpPlaneB(pc)
                nop
                move.w  #$1A,d7
                lea     (PLANE_B_LAYOUT).l,a0
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                move.w  #$140,d0
                move.w  #0,d1
loc_2912:
                
                addq.w  #8,((VIEW_PLANE_A_Y_COUNTER-$1000000)).w
                cmpi.w  #$14,d7
                bge.s   loc_2922
                move.w  #$F9,d2 
                bra.s   loc_2926
loc_2922:
                
                move.w  #$F9,d2 
loc_2926:
                
                move.w  #$F8,d3 
                bsr.w   sub_29A2
                bsr.w   WaitForVInt
                move.w  #$1F,d6
                movem.l d0-d1,-(sp)
loc_293A:
                
                move.w  (a0,d0.w),(a1,d1.w)
                addq.w  #2,d0
                addq.w  #2,d1
                dbf     d6,loc_293A
                movem.l (sp)+,d0-d1
                addi.w  #$40,d0 
                andi.w  #$7FE,d0
                addi.w  #$40,d1 
                andi.w  #$7FE,d1
                movem.l d0-d1/a0-a1,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                dbf     d7,loc_2912
                bsr.w   WaitForVInt
                move.w  #8,((VIEW_PLANE_A_Y_COUNTER-$1000000)).w
                move.w  #8,((VIEW_PLANE_B_Y_COUNTER-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateScrollingData
                jsr     UpdateVdpPlaneA(pc)
                nop
                rts

    ; End of function ApplyOverworldMapTransition_Down


; =============== S U B R O U T I N E =======================================


sub_29A2:
                
                movem.l d0-a0,-(sp)
                lea     (SPRITE_16).l,a0
                moveq   #$1F,d7
                move.w  d2,d0
                move.w  d2,d1
                asr.w   #8,d0
                ext.w   d1
                move.w  d3,d2
                asr.w   #8,d2
                ext.w   d3
loc_29BC:
                
                cmpi.w  #$1F,d7
                bne.s   loc_29CA
                add.w   d1,(a0)
                add.w   d0,VDPSPRITE_OFFSET_X(a0)
                bra.s   loc_29D6
loc_29CA:
                
                cmpi.w  #1,(a0)
                beq.s   loc_29D6
                add.w   d3,(a0)
                add.w   d2,VDPSPRITE_OFFSET_X(a0)
loc_29D6:
                
                addq.l  #8,a0
                dbf     d7,loc_29BC
                movem.l (sp)+,d0-a0
                rts

    ; End of function sub_29A2


; =============== S U B R O U T I N E =======================================

; In: D1 = map index


LoadMapTilesets:
                
                movem.l d0-d1/a0-a1/a5,-(sp)
                ext.w   d1
                blt.w   loc_2A86
                movea.l (p_pt_MapData).l,a5
                lsl.w   #2,d1
                movea.l (a5,d1.w),a5
                move.b  (a5)+,d0
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_2A16
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     (FF3000_MAP_TILESET_1).l,a1
                bsr.w   LoadCompressedData
loc_2A16:
                
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_2A32
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     (FF6802_LOADING_SPACE).l,a1
                bsr.w   LoadCompressedData
loc_2A32:
                
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_2A4E
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     (FF0000_RAM_START).l,a1
                bsr.w   LoadCompressedData
loc_2A4E:
                
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_2A6A
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     (FF1000_MAP_TILESET_4).l,a1
                bsr.w   LoadCompressedData
loc_2A6A:
                
                movea.l (p_pt_MapTiles).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                blt.s   loc_2A86
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     (FF2000_LOADING_SPACE).l,a1
                bsr.w   LoadCompressedData
loc_2A86:
                
                movem.l (sp)+,d0-d1/a0-a1/a5
                rts

    ; End of function LoadMapTilesets


; =============== S U B R O U T I N E =======================================

; loads all map properties (map coords, entities, etc.)


LoadMap:
                
                move.l  ((word_FFA818-$1000000)).w,((VIEW_PLANE_A_PIXEL_X-$1000000)).w
                move.l  ((word_FFA81C-$1000000)).w,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                clr.l   ((word_FFA820-$1000000)).w
                clr.l   ((word_FFA824-$1000000)).w
                clr.b   ((VIEW_SCROLLING_PLANES_BITMAP-$1000000)).w
                move.w  d0,-(sp)
                move.w  d1,-(sp)
                bsr.w   InitDisplay
                move.w  (sp)+,d1
                ext.w   d1
                bpl.s   loc_2ACC        
                clr.w   d1              ; If D1<0, re-load current map
                move.b  ((CURRENT_MAP-$1000000)).w,d1
                movea.l (p_pt_MapData).l,a5
                lsl.w   #2,d1
                movea.l (a5,d1.w),a5
                lea     $E(a5),a5       ; get address 02 - map properties
                bra.w   loc_2B80        
loc_2ACC:
                
                clr.w   ((word_FFAF42-$1000000)).w ; Load new map D1
                move.b  d1,((CURRENT_MAP-$1000000)).w
loc_2AD4:
                
                movea.l (p_pt_MapData).l,a5
                lsl.w   #2,d1
                movea.l (a5,d1.w),a5
                movea.l (p_pt_MapPalettes).l,a0
                clr.w   d0
                move.b  (a5)+,d0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #$20,d7 
                bsr.w   CopyBytes       
                clr.w   (PALETTE_1_BASE).l
                tst.b   (a5)+
                blt.s   loc_2B1C
                lea     (FF3000_MAP_TILESET_1).l,a0
                lea     ($2000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
loc_2B1C:
                
                tst.b   (a5)+
                blt.s   loc_2B34
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($3000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
loc_2B34:
                
                tst.b   (a5)+
                blt.s   loc_2B4C
                lea     (FF0000_RAM_START).l,a0
                lea     ($4000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
loc_2B4C:
                
                tst.b   (a5)+
                blt.s   loc_2B64
                lea     (FF1000_MAP_TILESET_4).l,a0
                lea     ($5000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
loc_2B60:
                
                bsr.w   ApplyImmediateVramDma
loc_2B64:
                
                tst.b   (a5)+
                blt.s   loc_2B7C        
                lea     (FF2000_LOADING_SPACE).l,a0
                lea     ($6000).w,a1
                move.w  #$800,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
loc_2B7C:
                
                bsr.w   LoadMapBlocksAndLayout ; load blocks and layout ?
loc_2B80:
                
                movea.l (a5)+,a4        ; move map properties address to A4
loc_2B82:
                
                move.w  (a4)+,d0
                bpl.s   loc_2BA6
                movea.l -4(a5),a4
                move.w  (a4)+,d0
                move.w  (a4)+,d1
                move.w  (a4)+,d2
                move.w  (a4)+,d3
                mulu.w  #$180,d0
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                mulu.w  #$180,d3
                bra.w   loc_2C14
loc_2BA6:
                
                move.w  (a4)+,d1
                move.w  (a4)+,d2
                move.w  (a4)+,d3
                mulu.w  #$180,d0
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                mulu.w  #$180,d3
                move.w  (sp)+,d4
                move.w  d4,-(sp)
loc_2BC0:
                
                cmpi.w  #$FFFF,d4
                bne.s   loc_2BE6
                move.l  a0,-(sp)
                move.b  ((VIEW_TARGET_ENTITY-$1000000)).w,d4
                bpl.s   loc_2BD0
                clr.w   d4
loc_2BD0:
                
                andi.w  #$3F,d4 
                lsl.w   #5,d4
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  2(a0,d4.w),d5
                move.w  (a0,d4.w),d4
                movea.l (sp)+,a0
                bra.s   loc_2BF0
loc_2BE6:
                
                clr.w   d5
                move.b  d4,d5
                lsr.w   #8,d4
                lsl.w   #7,d4
                lsl.w   #7,d5
loc_2BF0:
                
                cmp.w   d0,d4
                blt.w   loc_2C0C
                cmp.w   d1,d5
                blt.w   loc_2C0C
                cmp.w   d2,d4
                bgt.w   loc_2C0C
                cmp.w   d3,d5
                bgt.w   loc_2C0C
                bra.w   loc_2C14
loc_2C0C:
                
                lea     $16(a4),a4
                bra.w   loc_2B82
loc_2C14:
                
                bsr.w   LoadMapArea
                move.w  (sp)+,d0
                cmpi.w  #$FFFF,d0
                bne.s   loc_2C70
                move.w  d4,d0
                move.w  d5,d1
                move.w  d0,d2
                move.w  d1,d3
                subi.w  #$780,d0
                subi.w  #$780,d1
                addi.w  #$780,d2
                addi.w  #$600,d3
                cmp.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
                bge.s   loc_2C42
                move.w  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
loc_2C42:
                
                cmp.w   ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d2
                ble.s   loc_2C50
                move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d0
                subi.w  #$F00,d0
loc_2C50:
                
                cmp.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
                bge.s   loc_2C5A
                move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
loc_2C5A:
                
                cmp.w   ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d3
                ble.s   loc_2C68
                move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d1
                subi.w  #$D80,d1
loc_2C68:
                
                lsr.w   #7,d0
                lsr.w   #7,d1
                lsl.w   #8,d0
                or.w    d1,d0
loc_2C70:
                
                clr.w   d1
                move.b  d0,d1
                lsr.w   #8,d0
                move.w  d0,d2
                move.w  d1,d3
                move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d4
                move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d5
                move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d6
                move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d7
                lsl.w   #7,d0
                lsl.w   #7,d1
                lsl.w   #7,d2
                lsl.w   #7,d3
                lsl.w   #7,d4
                lsl.w   #7,d5
                lsl.w   #7,d6
                lsl.w   #7,d7
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d0
                lsr.l   #8,d0
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d1
                lsr.l   #8,d1
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d2
                lsr.l   #8,d2
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d3
                lsr.l   #8,d3
                add.w   d4,d0
                move.w  d0,((VIEW_PLANE_A_PIXEL_X-$1000000)).w
                add.w   d5,d1
                move.w  d1,((VIEW_PLANE_A_PIXEL_Y-$1000000)).w
                add.w   d6,d2
                move.w  d2,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                add.w   d7,d3
                move.w  d3,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
                bsr.w   sub_38C0
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                beq.s   loc_2CD8
                move.w  d0,((VIEW_PLANE_A_PIXEL_X-$1000000)).w
loc_2CD8:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
                beq.s   loc_2CE2
                move.w  d1,((VIEW_PLANE_A_PIXEL_Y-$1000000)).w
loc_2CE2:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                beq.s   loc_2CEC
                move.w  d0,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
loc_2CEC:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                beq.s   loc_2CF6
                move.w  d1,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
loc_2CF6:
                
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                lsr.w   #4,d0
                neg.w   d0
                andi.w  #$FF,d0
                move.w  d0,((VIEW_PLANE_A_X_COUNTER-$1000000)).w
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
                lsr.w   #4,d1
                addq.w  #8,d1
                andi.w  #$FF,d1
                move.w  d1,((VIEW_PLANE_A_Y_COUNTER-$1000000)).w
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d2
                lsr.w   #4,d2
                neg.w   d2
                andi.w  #$FF,d2
                move.w  d2,((VIEW_PLANE_B_X_COUNTER-$1000000)).w
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d3
                lsr.w   #4,d3
                addq.w  #8,d3
                andi.w  #$FF,d3
                move.w  d3,((VIEW_PLANE_B_Y_COUNTER-$1000000)).w
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   UpdateVdpHScrollData
                bsr.w   UpdateVdpVScrollData
                bsr.w   InitWindowProperties
                bsr.w   ToggleRoofOnMapLoad
                bsr.w   WaitForVInt
                bsr.w   UpdateVdpPlaneA 
                bsr.w   UpdateVdpPlaneB 
                rts

    ; End of function LoadMap


; =============== S U B R O U T I N E =======================================


LoadMapBlocksAndLayout:
                
                movea.l (a5)+,a0
                lea     (FF2000_LOADING_SPACE).l,a1
                bsr.w   LoadMapBlocks   
                movea.l (a5)+,a0
                lea     (FF0000_RAM_START).l,a1
                bsr.w   LoadMapLayoutData
                movea.l 4(a5),a0
loc_2D74:
                
                move.w  (a0),d1
                cmpi.w  #$FFFF,d1
                beq.w   loc_2D9C
                jsr     j_CheckFlag
                beq.w   loc_2D98
                move.w  2(a0),d0
                move.w  4(a0),d1
                move.w  6(a0),d2
                bsr.w   CopyMapBlocks
loc_2D98:
                
                addq.l  #8,a0
                bra.s   loc_2D74
loc_2D9C:
                
                lea     (FF0000_RAM_START).l,a1
                movea.l $14(a5),a0
loc_2DA6:
                
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_2DD4
                clr.w   d1
                move.b  2(a0),d1
                jsr     j_CheckFlag
                beq.w   loc_2DD0
                clr.w   d0
                move.b  1(a0),d0
                lsl.w   #6,d0
                add.b   (a0),d0
                add.w   d0,d0
                move.w  #$D802,(a1,d0.w)
loc_2DD0:
                
                addq.l  #4,a0
                bra.s   loc_2DA6
loc_2DD4:
                
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                beq.s   return_2DEA
                move.w  ((BATTLE_AREA_X-$1000000)).w,d0
                move.w  ((BATTLE_AREA_WIDTH-$1000000)).w,d1
                clr.w   d2
                bsr.w   CopyMapBlocks
return_2DEA:
                
                rts

    ; End of function LoadMapBlocksAndLayout


; =============== S U B R O U T I N E =======================================


LoadMapArea:
                
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   loc_2E06
                move.w  d0,((MAP_AREA_LAYER1_STARTX-$1000000)).w
                move.w  d1,((MAP_AREA_LAYER1_STARTY-$1000000)).w
                move.w  d2,((MAP_AREA_LAYER1_ENDX-$1000000)).w
                move.w  d3,((MAP_AREA_LAYER1_ENDY-$1000000)).w
                bra.s   loc_2E2C
loc_2E06:
                
                move.w  ((BATTLE_AREA_WIDTH-$1000000)).w,d0
                clr.w   d1
                move.b  d0,d1
                subq.w  #1,d1
                mulu.w  #$180,d1
                lsr.w   #8,d0
                subq.w  #1,d0
                mulu.w  #$180,d0
                clr.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w
                clr.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w
                move.w  d0,((MAP_AREA_LAYER1_ENDX-$1000000)).w
                move.w  d1,((MAP_AREA_LAYER1_ENDY-$1000000)).w
loc_2E2C:
                
                move.w  (a4)+,d0
                mulu.w  #3,d0
                move.w  d0,((MAP_AREA_LAYER2_STARTX-$1000000)).w
                move.w  (a4)+,d0
                mulu.w  #3,d0
                move.w  d0,((MAP_AREA_LAYER2_STARTY-$1000000)).w
                move.w  (a4)+,d0
                mulu.w  #3,d0
                move.w  d0,((MAP_AREA_BACKGROUND_STARTX-$1000000)).w
                move.w  (a4)+,d0
                mulu.w  #3,d0
                move.w  d0,((MAP_AREA_BACKGROUND_STARTY-$1000000)).w
                move.w  (a4)+,((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w
                move.w  (a4)+,((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w
                move.w  (a4)+,((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w
                move.w  (a4)+,((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w
                move.l  (a4)+,((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                move.b  (a4)+,((MAP_AREA_LAYER_TYPE-$1000000)).w
                move.b  (a4)+,((MAP_AREA_MUSIC_INDEX-$1000000)).w
                movea.l (a5),a4
                move.w  #1,((TILE_ANIMATION_COUNTER-$1000000)).w
                move.l  $18(a5),((TILE_ANIMATION_DATA_ADDRESS-$1000000)).w
                blt.s   return_2EBE
                movea.l ((TILE_ANIMATION_DATA_ADDRESS-$1000000)).w,a1
                move.w  (a1)+,d0
                movea.l (p_pt_MapTiles).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.l  a1,-(sp)
                lea     (FF6802_LOADING_SPACE).l,a1
                bsr.w   LoadCompressedData
                movea.l (sp)+,a1
                move.w  (a1)+,d7
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     (byte_FF9B04).l,a1
                lsl.w   #5,d7
                bsr.w   CopyBytes       
                addq.l  #4,((TILE_ANIMATION_DATA_ADDRESS-$1000000)).w
                move.b  ((CURRENT_MAP-$1000000)).w,((TILE_ANIMATION_MAP_INDEX-$1000000)).w
return_2EBE:
                
                rts

    ; End of function LoadMapArea


; =============== S U B R O U T I N E =======================================


sub_2EC0:
                
                move.w  #$20,d6 
                bsr.w   GenerateRandomNumber
                move.w  d7,d0
                move.w  #4,d6
                bsr.w   GenerateRandomNumber
                move.w  d7,d1
                addi.w  #$1C,d1
                move.w  #$10,d6
                bsr.w   GenerateRandomNumber
                move.w  d7,d2
                move.w  #4,d6
                bsr.w   GenerateRandomNumber
                move.w  d7,d3
                move.w  #4,d4
                move.w  #4,d5
                move.w  #4,d6
                move.w  #4,d7
                bsr.w   sub_36B2
                bsr.w   WaitForVInt
loc_2F04:
                
                move.w  #$8721,d0
                bsr.w   SetVdpReg
                move.w  #$8700,d0
                bsr.w   SetVdpReg
                bsr.w   WaitForVInt
                bsr.w   sub_2F24
                tst.b   ((VIEW_SCROLLING_PLANES_BITMAP-$1000000)).w
                bne.s   loc_2F04
                rts

    ; End of function sub_2EC0


; =============== S U B R O U T I N E =======================================


sub_2F24:
                
                move.w  d0,-(sp)
                move.w  ((word_FFA820-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #$80,d0 
                bgt.s   loc_2F36
                move.w  d0,((word_FFA820-$1000000)).w
loc_2F36:
                
                move.w  ((word_FFA822-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #$80,d0 
                bgt.s   loc_2F46
                move.w  d0,((word_FFA822-$1000000)).w
loc_2F46:
                
                move.w  ((word_FFA824-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #$80,d0 
                bgt.s   loc_2F56
                move.w  d0,((word_FFA824-$1000000)).w
loc_2F56:
                
                move.w  ((word_FFA826-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #$80,d0 
                bgt.s   loc_2F66
                move.w  d0,((word_FFA826-$1000000)).w
loc_2F66:
                
                move.w  (sp)+,d0
                rts

    ; End of function sub_2F24

