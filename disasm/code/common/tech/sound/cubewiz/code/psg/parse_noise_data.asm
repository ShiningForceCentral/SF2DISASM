


ParsePsgNoiseData:
    ld  a, (iy+0)
    ld  ix, MUSIC_CHANNEL_NOISE
    ld  a, 60h
    ld  (CURRENT_PSG_CHANNEL), a
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$checkChannelFree
    ld  de, CHANNEL_DATA_SIZE*10 ; point to SFX channel data instead
    add  ix, de      

$$checkChannelFree:
    ld  a, (ix+CHANNEL_FREE)
    or  a
    ret  nz
    ld  a, (ix+TIME_COUNTER)
    or  a
    jp  nz, $$continueNote
    ld  d, (ix+DATA_CURSOR+1)
    ld  e, (ix+DATA_CURSOR)

$$parseByte:
    ld  a, (de)
    and  0F8h
    cp  0F8h
    jp  nz, $$checkSilence
    ld  a, (de)
    cp  0FFh
    jp  nz, $$checkNewInstrument
    inc  de
    ld  a, (de)
    ld  l, a
    inc  de
    ld  a, (de)
    ld  h, a
    or  l
    jr  nz, $$applyJumpCommand
    ld  a, 1
    ld  (ix+CHANNEL_FREE),  a  ; FF 00 00 : stop channel
    ld  a, 0Fh
    jp  SetPsgChannelAttenuation

$$applyJumpCommand:
    ex  de, hl
    jp  $$parseByte

$$checkNewInstrument
    cp  0FDh
    jr  nz, $$checkKeyRelease
    call  LoadPsgInstrument
    jp  $$parseByte

$$checkKeyRelease:
    cp  0FCh
    jr  nz, $$checkLoopCommand
    call  SetRelease
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

$$checkSilence:
    ld  a, (de)
    and  7Fh
    cp  70h
    jp  z, $$applySilence  ; byte = F0 or 70
    push  af    ; new  note
    ld  a, (ix+KEY_RELEASED)
    or  a
    jr  z, $$applyNoiseTone
    xor  a
    ld  (ix+PSG_INSTRUMENT_CURSOR), a 
    ld  (ix+KEY_RELEASED), a

$$applyNoiseTone:
    pop  af
    and  7    ; bits 2-0
    or  0E0h
    ld  (PSG_PORT), a
    ld  a, (ix+NO_RELEASE)
    and  80h
    jr  $$checkNewNoteLength

$$applySilence:
    ld  a, (ix+NO_RELEASE)
    or  1

$$checkNewNoteLength:
    ld  (ix+NO_RELEASE),  a
    ld  a, (de)    ; get full byte again
    bit  7, a
    jr  nz, $$setNewPlayLength  ; if bit 7 set, next byte is new play length
    ld  a, (ix+PLAY_LENGTH)
    jr  $$resetTimeCounter

$$setNewPlayLength:
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
    call  GetPsgInstrumentPointer
    ld  b, (hl)
    bit  7, b
    jr  nz, $$applyInstrumentLevel  ; if byte $8x, then it's data end, so just keep applying the same level alteration
    inc  a    ; if byte 0x, point to next byte
    ld  (ix+PSG_INSTRUMENT_CURSOR), a

$$applyInstrumentLevel:
    res  7, b
    ld  a, 0Fh
    sub  b
    ld  b, a
    ld  a, (ix+LEVEL)
    sub  b 
    jr  nc, $$applyOutputLevel
    xor  a

$$applyOutputLevel:
    ld  b, a
    ld  a, (OUTPUT_LEVEL)
    add  a, b
    sub  0Fh
    jr  nc, $$checkTime 
    xor  a

$$checkTime:
    ld  (ix+PSG_OUTPUT_LEVEL),  a
    ld  b, (ix+NO_RELEASE)
    ld  a, (ix+TIME_COUNTER)
    or  a
    jr  z, $$checkNoRelease
    bit  7, b
    jr  nz, $$checkFadeOut
    cp  (ix+KEY_RELEASE)
    jr  nz, $$checkFadeOut

$$checkNoRelease:
    ld  a, b
    or  a
    jr  nz, $$checkFadeOut
    ld  c, 1
    ld  (ix+KEY_RELEASED), c
    or  2
    ld  (ix+NO_RELEASE),  a

$$findReleaseDataLoop:
    call  GetPsgInstrumentPointer
    ld  a, (hl)
    and  80
    jr  nz, $$startRelease
    inc  (ix+PSG_INSTRUMENT_CURSOR)
    jr  $$findReleaseDataLoop

$$startRelease:
    inc  (ix+PSG_INSTRUMENT_CURSOR)

$$checkFadeOut:
    ld  a, (FADE_OUT_TIMER)
    or  a
    jr  nz, $$applyNote
    ld  a, (ix+LEVEL)
    or  a
    jr  z, $$applyNote
    dec  a
    ld  (ix+LEVEL),  a

$$applyNote:
    ld  a, 0Fh
    sub  (ix+PSG_OUTPUT_LEVEL)
    or  0F0h     ; attenuation command bits
    call  ApplyPsgConditionalInput
    ret
