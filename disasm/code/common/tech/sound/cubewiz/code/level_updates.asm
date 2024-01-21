

MuteSound:
    push  hl
    push  de

    xor  a
    ld  (PROCESSING_SFX), a
    ld  (CALL_YM_PART2), a
    ld  bc, (YMREG_TOTAL_LEVEL<<8)+7Fh  ; set Total Level to smallest amplitude
    ld  d, 4       ; loop on operators
$$ym1VolumeDownLoop:
    call  ApplyYmInput
    inc  b
    call  ApplyYmInput
    inc  b
    call  ApplyYmInput
    inc  b
    inc  b
    dec  d
    jr  nz, $$ym1VolumeDownLoop

    ld  a, 1
    ld  (CALL_YM_PART2), a
    ld  bc, (YMREG_TOTAL_LEVEL<<8)+7Fh  ; set Total Level to smallest amplitude
    ld  d, 4
$$ym2VolumeDownLoop:
    call  ApplyYm2Input
    inc  b
    call  ApplyYm2Input
    inc  b
    call  ApplyYm2Input
    inc  b
    inc  b
    dec  d
    jr  nz, $$ym2VolumeDownLoop

    ld  hl, PSG_PORT
    ld  a, 9Fh     ; Max attenuation on Tone 1
    ld  (hl), a    
    ld  a, 0BFh    ; Max attenuation on Tone 2
    ld  (hl), a
    ld  a, 0DFh    ; Max attenuation on Tone 3
    ld  (hl), a
    ld  a, 0FFh    ; Max attenuation on Noise
    ld  (hl), a

$$waitNextCommandLoop:  
    ld  a, (NEW_COMMAND)
    or  a
    jr  z, $$waitNextCommandLoop
    cp  0FFh
    jr  nz, UpdateYmLevelsBeforeMainLoop
    xor  a  ; ignore new "mute sound" command
    ld  (NEW_COMMAND), a

UpdateYmLevelsBeforeMainLoop:
    call  UpdateYmInstrumentLevels
    pop  de
    pop  hl
    pop  af
    jp  MainLoop

ApplyOutputLevel:
    push  hl
    push  de
    ld  hl, OUTPUT_LEVEL
    ld  a, (hl)
    and  0Fh
    ld  (hl), a
    jp  UpdateYmLevelsBeforeMainLoop

UpdateYmInstrumentLevels:
    ; new workflow yet to implement :
    ; for each of the 10 channels, update SFX channel instrument in priority over music instrument
    ; 
    ld  iy, CURRENT_CHANNEL
    xor  a
    ld  (CALL_YM_PART2), a
    ld  (iy+0),  a
    ld  ix, MUSIC_CHANNEL_YM1
    ld  a, (ix+LEVEL)
    call  LoadYm1Instrument
    inc  (iy+0)
    ld  ix, MUSIC_CHANNEL_YM2
    ld  a, (ix+LEVEL)
    call  LoadYm1Instrument
    inc  (iy+0)
    ld  ix, MUSIC_CHANNEL_YM3
    ld  a, (ix+LEVEL)
    call  LoadYm1Instrument
    xor  a
    ld  (iy+0),  a
    ld  a, 1
    ld  (CALL_YM_PART2), a
    ld  ix, MUSIC_CHANNEL_YM4
    ld  a, (ix+LEVEL)
    call  LoadYm2Instrument
    inc  (iy+0)
    ld  ix, MUSIC_CHANNEL_YM5
    ld  a, (ix+LEVEL)
    call  LoadYm2Instrument
    ld  ix, MUSIC_CHANNEL_YM6
    ld  a, (ix+LEVEL)
    call  LoadYm2Instrument
    xor  a
    ret