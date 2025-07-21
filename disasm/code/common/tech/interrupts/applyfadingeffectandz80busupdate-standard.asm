
; ASM FILE code\common\tech\interrupts\applyfadingeffectandz80busupdate-standard.asm :


; =============== S U B R O U T I N E =======================================


ApplyZ80BusUpdates:
                
                move.w  #$100,(Z80BusReq).l
                
@WaitForZ80Bus: btst    #0,(Z80BusReq).l
                bne.s   @WaitForZ80Bus  ; wait for Z80 bus available
                
                ; Should wait for music end?
                tst.b   ((WAIT_FOR_MUSIC_END-$1000000)).w
                beq.s   @Continue
                tst.b   (Z80_CHANNEL_1_NOT_IN_USE).l
                beq.w   @ProcessInputs
                clr.b   ((WAIT_FOR_MUSIC_END-$1000000)).w
                
@Continue:      lea     ((SOUND_COMMAND_QUEUE-$1000000)).w,a0
                move.l  4(a0),d0
                or.l    (a0),d0         ; if stack void, do nothing
                beq.w   @ProcessInputs
                move.b  (a0),d1         ; contains music volume parameter when command is $FC
                                        ; or fade in parameter when $7F < command < $F0
                move.b  1(a0),d0        ; stores first command in d1 and d0 and pushes the rest forward
                move.w  2(a0),(a0)+
                move.w  2(a0),(a0)+
                move.w  2(a0),(a0)+
                clr.w   (a0)
                
                ; CUBEWIZ music resuming commands
                cmpi.b  #SOUND_COMMAND_DEACTIVATE_RESUMING,d0
                beq.s   @SendResumingCommand
                cmpi.b  #SOUND_COMMAND_ACTIVATE_RESUMING,d0
                bne.s   @TestPlayPreviousMusic
@SendResumingCommand:
                    
                move.b  d0,(Z80_SoundDriverCommand).l
                bra.w   @ProcessInputs
@TestPlayPreviousMusic:
                
                cmpi.b  #SOUND_COMMAND_PLAY_PREVIOUS_MUSIC,d0
                bne.s   @IsFadeOut
                
                ; If command $FB, play back previous music
                tst.b   ((MUSIC_STACK_LENGTH-$1000000)).w
                beq.s   @NoPreviousMusic
                
                movem.l d7-a0,-(sp)
                lea     ((MUSIC_STACK-$1000000)).w,a0
                moveq   #8,d7
@FillMusicStack_Loop:
                
                move.b  1(a0),(a0)+
                dbf     d7,@FillMusicStack_Loop
                
                movem.l (sp)+,d7-a0
                subq.b  #1,((MUSIC_STACK_LENGTH-$1000000)).w
@NoPreviousMusic:
                
                move.b  ((MUSIC_STACK-$1000000)).w,(Z80_SoundDriverCommand).l
                bra.w   @ProcessInputs
                
@IsFadeOut:     cmpi.b  #SOUND_COMMAND_FADE_OUT,d0
                bcs.s   @IsWaitMusicEnd
                
                ; If command >= $FD, then send it to Z80
                move.b  d0,(Z80_SoundDriverCommand).l
                bra.w   @ProcessInputs
                
@IsWaitMusicEnd:cmpi.b  #SOUND_COMMAND_WAIT_MUSIC_END,d0
                bne.s   @IsUpdateMusicLevel
                
                ; If $F0, then wait for current music to end before sending commands to Z80
                move.b  #1,((WAIT_FOR_MUSIC_END-$1000000)).w
                bra.s   @ProcessInputs
@IsUpdateMusicLevel:
                
                cmpi.b  #SOUND_COMMAND_UPDATE_MUSIC_LEVEL,d0
                bne.s   @IsSameMusic
                
                ; If $FC, then update music level
                andi.b  #$F,d1
                move.b  d1,(Z80_SoundDriverMusicLevel).l
                move.b  d0,(Z80_SoundDriverCommand).l
                bra.s   @ProcessInputs
                
@IsSameMusic:   movem.l d0,-(sp)
                andi.b  #$7F,d0 ; a music/sfx index mask, so max index value is $7F
                cmp.b   ((MUSIC_STACK-$1000000)).w,d0 ; compare with last played music
                movem.l (sp)+,d0
                beq.s   @ProcessInputs  ; if same to last played music, let current music play
                                        ; (might play nothing if last played music has ended !)
                
                bclr    #7,d0           ; if command > $7F, then send Fade In parameter
                beq.s   @IsSfx          ; branch if bit was 1 before bclr
                
                move.b  d1,(Z80_SoundDriverFadeInData).l
                bra.s   @SendCommand
                
@IsSfx:         cmpi.b  #$40,d0 
                bgt.s   @SendCommand
                move.b  #$F,(Z80_SoundDriverFadeInData).l ; if music, put this fade in parameter : no fade in
                
@SendCommand:   move.b  d0,(Z80_SoundDriverCommand).l ; send music/sfx command to Z80
                cmpi.b  #$40,d0 
                bge.s   @ProcessInputs
                
                movem.l d7-a0,-(sp)
                lea     ((WAIT_FOR_MUSIC_END-$1000000)).w,a0
                moveq   #8,d7
                
@AddMusic_Loop: move.b  -2(a0),-(a0)    ; add music index to music stack
                dbf     d7,@AddMusic_Loop
                
                move.b  d0,-(a0)
                movem.l (sp)+,d7-a0
                
                cmpi.b  #10,((MUSIC_STACK_LENGTH-$1000000)).w
                bge.s   @ProcessInputs
                addq.b  #1,((MUSIC_STACK_LENGTH-$1000000)).w
                
@ProcessInputs: bsr.w   UpdatePlayerInputs
                tst.b   ((CONTROLLING_UNIT_CURSOR-$1000000)).w
                bne.s   @IsNewInput
                moveq   #2,d0
                move.b  ((PLAYER_1_INPUT-$1000000)).w,d1
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                tst.w   d0
                bgt.s   @SetPrimaryDirection         
                
                ; Get current walking direction
                move.b  ((PRIMARY_WALKING_DIRECTION-$1000000)).w,d0
                eor.b   d0,((PLAYER_1_INPUT-$1000000)).w ; get new direction
                moveq   #2,d0
                move.b  ((PLAYER_1_INPUT-$1000000)).w,d1
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                lsr.w   #1,d1
                dbcc    d0,*+4
                tst.w   d0
                bgt.s   @IsNewInput
                andi.b  #INPUT_UP|INPUT_DOWN,((PLAYER_1_INPUT-$1000000)).w ; if both directions are new, only keep vertical one
                bra.s   @IsNewInput
@SetPrimaryDirection:
                
                move.b  ((PLAYER_1_INPUT-$1000000)).w,d1 ; if only one direction pushed, set it as primary
                andi.w  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT,d1
                move.b  d1,((PRIMARY_WALKING_DIRECTION-$1000000)).w
                
@IsNewInput:    move.b  ((PLAYER_1_INPUT-$1000000)).w,d0
                move.b  d0,((CURRENT_PLAYER_INPUT-$1000000)).w ; overwrite P2 6-button data with P1 state with walking direction
                cmp.b   ((LAST_PLAYER_INPUT-$1000000)).w,d0
                bne.s   @WasPushingDirection         
                
                ; If input is the same then increment counter and ignore input
                addq.b  #1,((INPUT_REPEAT_DELAYER-$1000000)).w
                cmpi.b  #24,((INPUT_REPEAT_DELAYER-$1000000)).w
                bhs.s   @IgnoreInput
                
                ; Keep current input only when counter reaches 24
                clr.b   ((CURRENT_PLAYER_INPUT-$1000000)).w
                bra.s   @Finalize
                
@IgnoreInput:   subq.b  #6,((INPUT_REPEAT_DELAYER-$1000000)).w
                bra.s   @Finalize
@WasPushingDirection:
                
                clr.w   d2              ; if input is new
                move.b  ((LAST_PLAYER_INPUT-$1000000)).w,d1
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT,d1
                beq.s   @loc_1
                moveq   #1,d2           ; set "was pushing a direction"
                
@loc_1:         move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,((LAST_PLAYER_INPUT-$1000000)).w
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT,d0
                beq.s   @loc_2
                tst.b   d2
                bne.s   @Finalize
                
@loc_2:         clr.b   ((INPUT_REPEAT_DELAYER-$1000000)).w
@Finalize:      move.w  #0,(Z80BusReq).l
; ---------------------------------------------------------------------------

UpdateFadingPalette:
                
                module
                clr.w   d6
                move.b  ((FADING_TIMER_WORD-$1000000)).w,d6
                bne.s   @Continue
                rts
                
@Continue:      lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                lea     ((PALETTE_1_COPY-$1000000)).w,a2
                moveq   #CRAM_COLORS_COUNTER,d7 
                subq.w  #1,d6
                move.b  d6,((FADING_TIMER_WORD-$1000000)).w
                lsr.w   #2,d6
                
@Loop:          clr.w   d0
                clr.w   d1
                move.b  (a2)+,d0
                move.b  (a2)+,d1
                move.w  d1,d2
                lsr.w   #4,d1
                andi.w  #$F,d2
                clr.w   d3
                clr.w   d4
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                move.w  d4,d5
                lsr.w   #4,d4
                andi.w  #$F,d5
                move.w  d7,-(sp)
                moveq   #8,d7
                sub.w   d6,d7
                mulu.w  d6,d0
                mulu.w  d6,d1
                mulu.w  d6,d2
                mulu.w  d7,d3
                mulu.w  d7,d4
                mulu.w  d7,d5
                add.w   d3,d0
                add.w   d4,d1
                add.w   d5,d2
                lsr.w   #3,d0
                lsr.w   #3,d1
                lsr.w   #3,d2
                lsl.w   #4,d1
                or.w    d1,d2
                move.b  d0,(a1)+
                move.b  d2,(a1)+
                move.w  (sp)+,d7
                dbf     d7,@Loop
                
                bsr.w   ApplyVIntCramDma
                tst.b   ((FADING_TIMER_WORD-$1000000)).w
                bne.s   @Return
                
                lea     ((PALETTE_1_COPY-$1000000)).w,a0
                tst.b   ((FADING_TIMER_BYTE-$1000000)).w
                beq.s   @Return
UpdateBasePalettesAndBackupCurrent:
                
                movem.l d7-a1,-(sp)
                lea     (PALETTE_1_BASE).l,a1
                move.w  #CRAM_SIZE,d7
                bsr.w   CopyBytes
                lea     (PALETTE_1_CURRENT).l,a0
                lea     ((PALETTE_1_COPY-$1000000)).w,a1
                move.w  #CRAM_SIZE,d7
                bsr.w   CopyBytes
                move.b  #32,((FADING_TIMER_WORD-$1000000)).w
                movem.l (sp)+,d7-a1
                
@Return:        rts
                modend

    ; End of function ApplyZ80BusUpdates


; =============== S U B R O U T I N E =======================================


ApplyFadingEffectAndZ80BusUpdates:
                
                pea     ApplyZ80BusUpdates(pc)
                move.b  ((FADING_SETTING-$1000000)).w,d0
                beq.s   @Return
                subq.b  #1,((FADING_COUNTER-$1000000)).w
                bne.s   @Return
                
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                subq.b  #1,d0
                ext.w   d0
                lsl.w   #3,d0
                move.b  ((FADING_POINTER-$1000000)).w,d1
                ext.w   d1
                add.w   d1,d0
                move.b  table_FadingData(pc,d0.w),d1
                cmpi.w  #$80,d1 
                bne.s   @Continue
                
                ; End fading
                clr.b   ((FADING_SETTING-$1000000)).w
@Continue:      movem.l d1,-(sp)
                andi.w  #$F0,d1 
                cmpi.w  #$80,d1 
                movem.l (sp)+,d1
                bne.s   @ApplyFading
                
                andi.w  #$F,d1          ; go x backwards
                sub.b   d1,((FADING_POINTER-$1000000)).w
                bra.s   ApplyFadingEffectAndZ80BusUpdates
                
@ApplyFading:   ext.w   d1
                move.w  d1,d0
                move.b  ((FADING_PALETTE_BITFIELD-$1000000)).w,d1
                ext.w   d1
                bsr.w   ApplyCurrentColorFadingValue
                addq.b  #1,((FADING_POINTER-$1000000)).w
@Return:        rts

    ; End of function ApplyFadingEffectAndZ80BusUpdates
