
    ; sets key off / mutes music channels

StopMusic:
    push  hl

    ld  iy, CURRENT_CHANNEL
    xor  a
    ld  (CALL_YM_PART2), a
    ld  (iy+0),  a
    ld  ix, MUSIC_CHANNEL_YM1
    call  LoadYm1Instrument
    ld  bc, (YMREG_KEY_ON_OFF<<8)+00h
    call  ApplyYm1ConditionalInput
    inc  (iy+0)
    xor  a
    ld  ix, MUSIC_CHANNEL_YM2
    call  LoadYm1Instrument
    ld  bc, (YMREG_KEY_ON_OFF<<8)+01h
    call  ApplyYm1ConditionalInput
    inc  (iy+0)
    xor  a
    ld  ix, MUSIC_CHANNEL_YM3
    call  LoadYm1Instrument
    ld  bc, (YMREG_KEY_ON_OFF<<8)+02h
    call  ApplyYm1ConditionalInput
    ld  a, 1
    ld  (CALL_YM_PART2), a
    xor  a
    ld  (iy+0),  a
    ld  a, (SFX_CHANNEL_YM4+CHANNEL_FREE)
    or  a
    jr  z, $$skipYm4
    xor  a
    ld  ix, MUSIC_CHANNEL_YM4
    call  LoadYm2Instrument
    ld  bc, (YMREG_KEY_ON_OFF<<8)+04h
    call  ApplyYm1ConditionalInput
$$skipYm4:
    inc  (iy+0)
    ld  a, (SFX_CHANNEL_YM5+CHANNEL_FREE)
    or  a
    jr  z, $$skipYm5
    xor  a
    ld  ix, MUSIC_CHANNEL_YM5
    call  LoadYm2Instrument
    ld  bc, (YMREG_KEY_ON_OFF<<8)+05h
    call  ApplyYm1ConditionalInput
$$skipYm5:
    inc  (iy+0)
    ld  a, (SFX_CHANNEL_YM6+CHANNEL_FREE)
    or  a
    jr  z, $$skipYm6
    xor  a
    ld  ix, MUSIC_CHANNEL_YM6
    call  LoadYm2Instrument
    ld  bc, (YMREG_KEY_ON_OFF<<8)+06h
    call  ApplyYm1ConditionalInput
    jr  $$skipYm6
$$skipYm6:
    ld  hl, PSG_PORT
    ld  a, 9Fh
    ld  (hl), a    ; set PSG channel 1 volume to 0
    ld  a, 0BFh
    ld  (hl), a    ; set PSG channel 2 volume to 0
    ld  a, 0DFh
    ld  (hl), a    ; set PSG channel 3 volume to 0
    ld  a, 0FFh
    ld  (hl), a    ; set PSG noise  channel  volume to 0

    ld  hl, MUSIC_CHANNEL_YM1+CHANNEL_FREE
    ld  de, 30h
    ld  b, 0Ah
    ld  a, 1
$$loop:
    ld  (hl), a    ; set "Channel free" byte
    add  hl, de
    djnz  $$loop

    pop  hl
    ld  de, 0
    xor  a
    ld  (CURRENTLY_FADING_OUT), a
    ld  (FADE_OUT_COUNTER), a
    ld  a, 63h
    ld  (FADE_OUT_TIMER), a
    ret
