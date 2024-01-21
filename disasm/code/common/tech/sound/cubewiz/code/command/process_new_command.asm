
ProcessNewCommand:          
    push  af
    xor  a
    ld  (NEW_COMMAND), a
    ld  a, (COMMANDS_COUNTER)
    add  a, 1
    ld  (COMMANDS_COUNTER), a    
    pop  af

    ld  (LAST_COMMAND), a 
    cp  0FFh
    jp  z, MuteSound
    cp  0FEh
    jp  z, StopMusic
    cp  0FDh
    jp  z, FadeOut
    cp  0FCh 
    jp  z, SaveMusic
    cp  0FBh 
    jp  z, ResumeMusic
    cp  0FAh 
    jp  z, ActivateResuming
    cp  0F9h 
    jp  z, DeactivateResuming
    cp  0F1h
    jp  z, SetYmTimer
    cp  0F0h
    jp  z, ApplyOutputLevel

    ; Music ids from 1 to 40h, SFX ids from 41h
    cp  41h
    jp  nc, $$loadSfx  
    ld  ix, PREVIOUS_MUSIC
    cp  (ix)
    jp  nz, $$loadNewMusic

    ; resume music
    ; if saved music was finished, just load it again
    push  af
    ld  a, (SAVED_MUSIC_CHANNEL_YM1+CHANNEL_FREE)    
    cp  01h
    jp  nz, $$checkResuming
    pop  af
    jp  $$loadNewMusic
$$checkResuming:
    ld  a, (RESUMING_DEACTIVATED)    
    cp  0FFh
    jp  nz, $$resume
    pop  af
    jp  $$loadNewMusic
$$resume:    
    ld  a, (CURRENT_MUSIC)
    ld  (PREVIOUS_MUSIC), a  
    pop  af
    ld  (CURRENT_MUSIC), a
    jp  ResumeMusic    

$$loadNewMusic:    
    push  hl
    push  de
    push  af
    ld  a, (MUSIC_BANK)
    ld  (SAVED_MUSIC_BANK), a  
    pop  af
    push  af
    cp  21h
    jr  nc, $$loadMusicFromBank2
    ; id from 1 to $20
    ld  a, MUSIC_BANK_1
    ld  (MUSIC_BANK), a
    call  LoadBank
    ld  a, (CURRENT_MUSIC)  
    ld  (PREVIOUS_MUSIC), a
    pop  af
    ld  (CURRENT_MUSIC), a
    ld  de, 8000h
    jp  $$loadMusicEntry

$$loadMusicFromBank2:
    ; id from $21 to $40
    ld  a, MUSIC_BANK_2  
    ld  (MUSIC_BANK), a
    call  LoadBank
    ld  a, (CURRENT_MUSIC)  
    ld  (PREVIOUS_MUSIC), a
    pop  af
    ld  (CURRENT_MUSIC), a
    ld  de, 8000h
    sub  20h

$$loadMusicEntry:
    dec  a    ; decrement music/sound index (no $00 entry)
    add  a, a
    ld  h, 0
    ld  l, a
    add  hl, de
    ld  a, (hl)
    inc  hl
    ld  h, (hl)
    ld  l, a
    ld  a, (hl)
    or  a
    jp  nz, $$loadSfx  ; if byte 0 of music data != 0, load it as an SFX instead
    ld  a, (FADE_IN_PARAMS)
    and  0Fh
    ld  (OUTPUT_LEVEL), a
    xor  a
    ld  (FADE_IN_TIMER), a
    
    call  SaveMusic
    
    call  StopMusic  ; stop currently playing music if there was one
    inc  hl
    ld  a, (hl)    ; get music data byte 1 : indicates if YM Channel 6 uses FM mode
    inc  hl
    inc  hl    ; byte 3 : YM Timer B value
    ld  (MUSIC_YM6_FM_MODE), a
    ld  a, (hl)
    ld  (YM_TIMER_VALUE), a
    call  SetYmTimer
    xor  a
    ld  (CURRENTLY_FADING_OUT),  a
    ld  (FADE_OUT_COUNTER), a
    ld  a, 63h
    ld  (FADE_OUT_TIMER), a

    inc  hl    ; Channel 1 data pointer
    ld  b, 0Ah
    ld  ix, MUSIC_CHANNEL_YM1
$$initMusicChannelsLoop:
    ld  e, (hl)
    inc  hl
    ld  d, (hl)
    inc  hl
    ld  (ix+DATA_CURSOR),  e
    ld  (ix+DATA_CURSOR+1),  d
    xor  a
    ld  (ix+TIME_COUNTER),  a
    ld  (ix+CHANNEL_FREE),  a
    ld  (ix+KEY_RELEASE),  a
    ld  (ix+NO_RELEASE),  a
    ld  (ix+INFINITE_LOOP_START_POINTER), a
    ld  (ix+INFINITE_LOOP_START_POINTER+1), a
    ld  (ix+NOTE_SHIFT), a
    ld  (ix+FREQUENCY_SHIFT), a
    ld  (ix+SLIDE_SPEED), a
    ld  a, 1
    ld  (ix+STEREO_PANNING), a
    ld  d, (ix+DATA_CURSOR+1)
    ld  e, (ix+DATA_CURSOR)
    ld  a, (de)
    cp  0FFh
    jr  nz, $$skipMusicChannelInit
    ld  a, 1
    ld  (ix+CHANNEL_FREE),  a
$$skipMusicChannelInit:
    ld  de, CHANNEL_DATA_SIZE
    add  ix, de
    djnz  $$initMusicChannelsLoop

    ld  b, 2    ; loop two times
$$activateStereoOutputsLoop:
    push  bc
    ld  a, b
    dec  a
    ld  (CALL_YM_PART2), a ; set to $01 when managing YM4,5,6 channels, to call part 2 of YM
    ld  bc, YMREG_PANNING<<8+0C0h  ; activate left and right sound outputs for each channel
    call  ApplyYmInput
    inc  b
    call  ApplyYmInput
    inc  b
    call  ApplyYmInput
    pop  bc
    djnz  $$activateStereoOutputsLoop
    
    ld  a, 0C0h
    ld  (MUSIC_CHANNEL_YM1+STEREO_PANNING), a
    ld  (MUSIC_CHANNEL_YM2+STEREO_PANNING), a
    ld  (MUSIC_CHANNEL_YM3+STEREO_PANNING), a    
    ld  (MUSIC_CHANNEL_YM4+STEREO_PANNING), a
    ld  (MUSIC_CHANNEL_YM5+STEREO_PANNING), a
    ld  (MUSIC_CHANNEL_YM6+STEREO_PANNING), a
    ld  a, 0FEh  ; DAC playback init command
    ld  (NEW_SAMPLE), a
    call  LoadYmTimerB

$$returnToMainLoop:        
    pop  de
    pop  hl
    ld  a, (DAC_BANK)
    jp  LoadBank

$$loadSfx:
    push  hl
    push  de
    sub  41h
    ld  h, 0
    ld  l, a
    ld  a, SFX_BANK
    call  LoadBank    
    add  hl, hl
    ld  de, SFX_BANK_OFFSET
    add  hl, de  
    ld  a, (hl)
    inc  hl
    ld  h, (hl)    ; get the proper pointer
    ld  l, a
    ld  a, h
    ld  (DAC_LAST_OFFSET), a
    ld  a, l  
    ld  (DAC_LAST_OFFSET+1), a            
    ld  a, (hl)    
    inc  hl    ; hl points to byte 1 of sfx data
    cp  1
    jr  nz, $$loadSfxType2

    ld  b, 0Ah ; loop 10 times
    ld  ix, SFX_CHANNEL_YM1
$$initSfxType1ChannelsLoop:
    ld  e, (hl)    ; part to get next channel data
    inc  hl
    ld  d, (hl)    ; de = bytes 2-3 of sound data = pointer
    inc  hl
    ld  a, (de)
    cp  0FFh
    jr  z, $$skipSfxType1ChannelInit
    call  InitChannelDataForSFX
$$skipSfxType1ChannelInit:
    ld  de, CHANNEL_DATA_SIZE
    add  ix, de
    djnz  $$initSfxType1ChannelsLoop
    jr  $$returnToMainLoop  

$$loadSfxType2:
    ld  bc, 304h  ; loop 3 times, starting from YM channel 4
    ld  ix, SFX_CHANNEL_YM4
$$initSfxType2ChannelsLoop:
    push  bc
    ld  e, (hl)
    inc  hl
    ld  d, (hl)
    inc  hl
    ld  a, (de)
    cp  0FFh
    jr  z, $$skipSfxType2ChannelInit
    call  InitChannelDataForSFX
    ld  b, YMREG_KEY_ON_OFF
    call  ApplyYm1Input
    ld  c, a    ; current YM channel
    add  a, YMREG_PANNING-4
    ld  b, a
    ld  c, 0C0h
    call  ApplyYm2Input
$$skipSfxType2ChannelInit:
    ld  de, CHANNEL_DATA_SIZE
    add  ix, de
    pop  bc
    inc  c
    djnz  $$initSfxType2ChannelsLoop
    jp  $$returnToMainLoop 
