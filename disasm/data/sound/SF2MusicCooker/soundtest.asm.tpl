
; Original soundtest has been altered with replaced and/or added musics through an automated tool.
; Manual edits in this file is strongly discouraged.

; =============== S U B R O U T I N E =======================================


SoundTest:      txt     464                         ; "Oh! I have a good idea.{N}Let's listen to music!{W1}"
                sndCom  SOUND_COMMAND_FADE_OUT
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                clr.w   d0
                clr.w   d7                          ; D7 = # bytes into sound table, so we clear it here
                
                lea     table_SoundtrackTitles(pc),a0
                clr.w   d1
                moveq   #-1,d2                      ; d2.w = index beyond which a number is written instead of a title (-1 = disabled)
                
@UpdateTrack:   move.b  table_Soundtracks(pc,d7.w),d1
                jsr     (DisplaySoundtrackTitle).w
                
@Start:         jsr     (WaitForVInt).w
                
@Right:         btst    #INPUT_BIT_RIGHT,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Left
                cmpi.w  #{{LAST_INDEX}},d7      ; check we're not trying to go beyond final track
                bge.s   @First      ; if we are, go to first track (circular navigation)
                addq.w  #1,d7
                bra.s   @UpdateTrack
                
@Left:          btst    #INPUT_BIT_LEFT,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @A
                tst.w   d7          ; check we're not trying to go below the first track
				ble.s   @Last       ; if we are, go to last track (circular navigation)
                subq.w  #1,d7
                bra.s   @UpdateTrack
                
@First:         move.b  #0,d7       ; go to first track
                bra.s   @UpdateTrack

@Last:          move.b  #{{LAST_INDEX}},d7      ; go to last track
                bra.s   @UpdateTrack

@A:             btst    #INPUT_BIT_A,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @C
                
                ; Fade out if pressed A
                sndCom  SOUND_COMMAND_FADE_OUT
                bra.s   @Start
                
@C:             btst    #INPUT_BIT_C,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @B
                
                ; Play track if pressed C
@PlayTrack:     sndCom  MUSIC_STOP
                move.b  d1,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                
                ; Exit sound test if pressed B
@B:             btst    #INPUT_BIT_B,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @Return
                bra.s   @Start
                
@Return:        rts

    ; End of function SoundTest

; ---------------------------------------------------------------------------

table_Soundtracks:
                {{INDEXES}}

; ---------------------------------------------------------------------------

table_SoundtrackTitles:
                {{NAMES}}