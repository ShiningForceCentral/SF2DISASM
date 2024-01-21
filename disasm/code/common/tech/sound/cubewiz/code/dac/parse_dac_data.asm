


ParseYm6DacChannelData:
    ld  ix, MUSIC_CHANNEL_YM6
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$checkFmMode
    ld  de, CHANNEL_DATA_SIZE*10 ; point to SFX channel data instead
    add  ix, de
    jr  $$checkChannelFree

$$checkFmMode:
    ld  a, (MUSIC_YM6_FM_MODE)
    or  a  
    jp  nz, ParseYm2ChannelData

$$checkChannelFree:
    ld  a, (ix+CHANNEL_FREE)
    or  a
    ret  nz    
    ld  a, (ix+KEY_RELEASE)
    cp  (ix+TIME_COUNTER)
    jr  nz, $$checkTime
    ld  a, (ix+NO_RELEASE)
    or  a
    jr  nz, $$checkTime
    ld  a, 0FEh
    call  SetNewDacSample ; play nothing

$$checkTime:
    ld  a, (ix+TIME_COUNTER)
    or  a
    jp  nz, $$continueNote
    ld  d, (ix+DATA_CURSOR+1)
    ld  e, (ix+DATA_CURSOR)

$$parseByte:
    ld  a, (de)    ; new byte
    and  0F8h
    cp  0F8h
    jp  nz, $$checkNewSample
    ld  a, (de)    ; parse command
    cp  0FFh
    jp  nz, $$checkKeyRelease
    inc  de    ; $FF, parse next bytes
    ld  a, (de)
    ld  l, a
    inc  de
    ld  a, (de)
    ld  h, a
    or  l
    jr  nz, $$applyJumpCommand ; FF xx xx : jump to new offset xxxx
    ld  a, 1    ; FF 00 00 : end of data
    ld  (ix+CHANNEL_FREE),  a
    ld  a, (MUSIC_YM6_FM_MODE)
    or  a
    jr  z, $$return
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$return
    ld  bc, -(CHANNEL_DATA_SIZE*10)  ; go back to YM Channel 6 area
    add  ix, bc
    ld  a, YMREG_PANNING
    add  a, (iy+0)
    ld  b, a
    ld  c, (ix+STEREO_PANNING)
    call  ApplyYm2Input  ; set stereo
    ld  a, (ix+CHANNEL_FREE)
    or  a
    jr  nz, $$return  ; return if channel has  nothing  to do
    ld  a, (ix+LEVEL)
    jp  LoadYm2Instrument ; else, load  note and return

$$return:
    ret


$$applyJumpCommand:
    ex  de, hl
    jr  $$parseByte

$$checkKeyRelease:
    cp  0FCh
    jr  nz, $$checkPanning
    call  SetRelease
    jp  $$parseByte

$$checkPanning:
    cp  0FAh
    jr  nz, $$checkLoopCommand
    call  SetYm2StereoPanning
    jp  $$parseByte

$$checkLoopCommand: 
    cp  0F8h
    jr  nz, $$unknownCommand
    call  ParseLoopCommand
    jp  $$parseByte

$$unknownCommand:
    inc  de
    inc  de
    jp  $$parseByte

$$checkNewSample:
    ld  a, (de)
    and  7Fh
    cp  70h
    jp  z, $$checkPlayLength
    inc  a    ; new sample index : bits 6-0 + 1
    call  SetNewDacSample

$$checkPlayLength:
    ld  a, (de)
    bit  7, a
    jr  nz, $$setPlayLength
    ld  a, (ix+PLAY_LENGTH)
    jr  $$resetTimeCounter

$$setPlayLength:
    inc  de
    ld  a, (de)
    ld  (ix+PLAY_LENGTH),  a

$$resetTimeCounter:
    ld  (ix+TIME_COUNTER),  a
    inc  de
    ld  (ix+DATA_CURSOR+1),  d
    ld  (ix+DATA_CURSOR),  e
    jp  $$checkChannelFree

$$continueNote:
    dec  (ix+TIME_COUNTER)
    ld  a, (FADE_OUT_TIMER)
    or  a
    ret  nz ; TODO remove this timer check ?
    ret
