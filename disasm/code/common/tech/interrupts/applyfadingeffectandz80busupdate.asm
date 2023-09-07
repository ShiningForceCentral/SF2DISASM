
; ASM FILE code\common\tech\interrupts\applyfadingeffectandz80busupdate.asm :
; 0x8DE..0xB1E : Vertical Interrupt Engine

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
                move.w  2(a0),(a0)+
                move.w  2(a0),(a0)+
                clr.w   (a0)
                
            if (STANDARD_BUILD&MUSIC_RESUMING=1)
                ; Resuming commands
                cmpi.b  #SOUND_COMMAND_DEACTIVATE_RESUMING,d0
                beq.s   @SendResumingCommand
                cmpi.b  #SOUND_COMMAND_ACTIVATE_RESUMING,d0
                bne.s   @TestPlayPreviousMusic
@SendResumingCommand:
                    
                move.b  d0,(Z80_SoundDriverCommand).l
                bra.w   loc_9F6
@TestPlayPreviousMusic:
            endif
                
                cmpi.b  #SOUND_COMMAND_PLAY_PREVIOUS_MUSIC,d0
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
                
                cmpi.b  #SOUND_COMMAND_FADE_OUT,d0
                bcs.s   loc_96A
                move.b  d0,(Z80_SoundDriverCommand).l ; if command >= FD, then send it to Z80
                bra.w   loc_9F6
loc_96A:
                
                cmpi.b  #SOUND_COMMAND_WAIT_MUSIC_END,d0
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
                bsr.w   UpdateFadingPalette
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
                move.b  tbl_FadingData(pc,d0.w),d1
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
                move.b  ((FADING_PALETTE_BITFIELD-$1000000)).w,d1
                ext.w   d1
                bsr.w   ApplyCurrentColorFadingValue
                addq.b  #1,((FADING_POINTER-$1000000)).w
return_B1C:
                
                rts

    ; End of function ApplyFadingEffect
