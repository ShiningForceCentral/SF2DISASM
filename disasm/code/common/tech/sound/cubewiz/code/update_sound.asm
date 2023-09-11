


UpdateSound:
    push  bc
    push  de
    push  hl
    
    ; toggle DAC on YM6
    
    ld  bc, (YMREG_DAC_ENABLE<<8)+80h
    ld  a, (MUSIC_YM6_FM_MODE)
    or  a
    jr  z, $$applyDacEnable
    ld  a, (SFX_CHANNEL_YM6+CHANNEL_FREE)
    or  a
    jr  z, $$applyDacEnable
    ld  bc, (YMREG_DAC_ENABLE<<8)+00h

$$applyDacEnable:
    call  ApplyYm1Input
    
    ld  hl, FADE_IN_TIMER
    inc  (hl)
    ld  a, (FADE_IN_PARAMS)
    rrca
    rrca
    and  3Ch
    jr  z, $$checkFadeout
    cp  (hl)
    jr  nz, $$checkFadeout
    xor  a
    ld  (hl), a
    ld  hl, OUTPUT_LEVEL
    ld  a, (hl)
    cp  0Fh
    jr  z, $$checkFadeout
    inc  (hl)
    ld  a, (hl)
    cp  0Fh
    jr  z, $$updateLevels
    inc  (hl)
    ld  a, (hl)
    cp  0Fh
    jr  z, $$updateLevels
    inc  (hl)
    ld  a, (hl)
    cp  0Fh
    jr  z, $$updateLevels
    inc  (hl)
$$updateLevels:    
    call  UpdateYmInstrumentLevels

$$checkFadeout:  
    ld  a, (CURRENTLY_FADING_OUT)
    or  a
    jr  z, $$doUpdate
    ld  a, (FADE_OUT_TIMER)
    or  a
    jr  nz, $$decrementFadeoutTimer
    ld  a, (FADE_OUT_LENGTH)
    ld  (FADE_OUT_TIMER), a
    ld  a, (FADE_OUT_COUNTER)
    inc  a
    ld  (FADE_OUT_COUNTER), a
    cp  0Ch
    jr  nz, $$doUpdate
    call  StopMusic
    jp  $$return

$$decrementFadeoutTimer:
    dec  a
    ld  (FADE_OUT_TIMER), a

$$doUpdate:
        
    ld  a, (MUSIC_BANK)
    call  LoadBank        
          
    call  LoadYmTimerB
    ld  iy, CURRENT_CHANNEL
    xor  a
    ld  (PROCESSING_SFX), a
    ld  (CALL_YM_PART2), a
    ld  (iy+0),  a
    call  ParseYm1ChannelData
    call  SendDacByte
    inc  (iy+0)
    call  ParseYm1ChannelData
    call  SendDacByte
    inc  (iy+0)
    call  ParseYm1ChannelData
    call  SendDacByte
    ld  a, 1
    ld  (CALL_YM_PART2), a
    xor  a
    ld  (iy+0),  a
    call  ParseYm2ChannelData
    call  SendDacByte
    inc  (iy+0)
    call  ParseYm2ChannelData
    call  SendDacByte
    inc  (iy+0)
    call  ParseYm6DacChannelData
    call  SendDacByte
    xor  a
    ld  (iy+0),  a
    call  ParsePsgToneData
    call  SendDacByte
    inc  (iy+0)
    call  ParsePsgToneData
    call  SendDacByte
    inc  (iy+0)
    call  ParsePsgToneData
    call  SendDacByte
    inc  (iy+0)
    call  ParsePsgNoiseData
    call  SendDacByte
    
    ; SFX Update
    ld  a, SFX_BANK
    call  LoadBank    
    ld  a, 1
    ld  (PROCESSING_SFX), a
    xor  a
    ld  (CALL_YM_PART2), a
    ld  (iy+0),  a
    call  ParseYm1ChannelData
    inc  (iy+0)
    call  ParseYm1ChannelData
    inc  (iy+0)
    call  ParseYm1ChannelData
    ld  a, 1
    ld  (CALL_YM_PART2), a
    xor  a
    ld  (iy+0),  a
    call  ParseYm2ChannelData
    inc  (iy+0)
    call  ParseYm2ChannelData
    inc  (iy+0)
    call  ParseYm6DacChannelData
    xor  a
    ld  (iy+0),  a
    call  ParsePsgToneData
    inc  (iy+0)
    call  ParsePsgToneData    
    inc  (iy+0)
    call  ParsePsgToneData
    inc  (iy+0)
    call  ParsePsgNoiseData    
    ld  a, 0
    ld  (PROCESSING_SFX), a

$$return:
    ld  a, (DAC_BANK)
    call  LoadBank
    pop  hl
    pop  de
    pop  bc
    ret

