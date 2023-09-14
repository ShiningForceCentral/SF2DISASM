


ParsePsgToneData:
    ld  a, (iy+0)  ; channel index
    ld  ix, MUSIC_CHANNEL_PSG1
    ld  h, 0
    ld  l, a
    add  hl, hl
    add  hl, hl
    add  hl, hl
    add  hl, hl
    push  bc
    ld  b, h
    ld  c, l 
    add  hl, hl
    add  hl, bc    ; hl = 30h * a
    pop  bc
    ex  de, hl
    add  ix, de    ; channel data base address
    rrca
    rrca
    rrca
    and  60h
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
    ld  d, (ix+DATA_CURSOR+1)  ; parse next byte
    ld  e, (ix+DATA_CURSOR)

$$parseByte:
    ld  a, (de)
    and  0F8h
    cp  0F8h
    jp  nz, $$checkSilence
    ld  a, (de)
    cp  0FFh
    jp  nz, $$checkNewInstrument
    inc  de    ; a = FF
    ld  a, (de)
    ld  l, a
    inc  de
    ld  a, (de)
    ld  h, a
    or  l
    jr  nz, $$applyJumpCommand ; $FF xx xx : jump
    ld  a, 1                   ; $FF 00 00 : stop
    ld  (ix+CHANNEL_FREE),  a
    ld  a, 0Fh
    jp  SetPsgChannelAttenuation

$$applyJumpCommand:
    ex  de, hl
    jr  $$parseByte

$$checkNewInstrument:
    cp  0FDh
    jr  nz, $$checkKeyRelease
    call  LoadPsgInstrument
    jp  $$parseByte

$$checkKeyRelease:
    cp  0FCh
    jr  nz, $$checkVibrato
    call  SetRelease
    jp  $$parseByte

$$checkVibrato:
    cp  0FBh
    jr  nz, $$checkTimer
    call  LoadVibrato
    jp  $$parseByte

$$checkTimer:
    cp  0FAh
    jr  nz, $$checkNoteShift
    inc  de
    ld  b, YMREG_TIMER_B
    ld  a, (de)
    ld  c, a
    inc  de
    call  ApplyYm1Input
    jp  $$parseByte

$$checkNoteShift:
    cp  0F9h
    jr  nz, $$checkLoopCommand
    call  LoadNoteShift
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
    push  af
    ld  a, (ix+KEY_RELEASED)
    or  a
    jr  z, $$newNote
    xor  a
    ld  (ix+PSG_INSTRUMENT_CURSOR), a
    ld  (ix+KEY_RELEASED), a
    ld  a, (ix+VIBRATO_DELAY)
    ld  (ix+VIBRATO_COUNTER), a

$$newNote:
    xor  a
    ld  (ix+VIBRATO_CURSOR), a
    pop  af
    add  a, (ix+NOTE_SHIFT)
    sub  15h
    ld  l, a
    ld  h, 0
    ld  bc, PSG_FREQUENCIES
    add  hl, hl
    add  hl, bc
    ld  a, (hl)
    inc  hl
    ld  h, (hl)
    ld  l, a    ; hl = corresponding frequency
    ld  b, 0
    ld  c, (ix+FREQUENCY_SHIFT)
    srl  c
    add  hl, bc
    ld  c, l
    ld  (ix+CURRENT_FREQUENCY), c
    ld  c, h
    ld  (ix+CURRENT_FREQUENCY+1), c
    ld  a, (ix+NO_RELEASE)
    and  80h
    jr  $$checkNewNoteLength

$$applySilence:
    ld  a, (ix+NO_RELEASE)
    or  1

$$checkNewNoteLength:
    ld  (ix+NO_RELEASE),  a
    ld  a, (de)
    bit  7, a
    jr  nz, $$setNewNoteLength
    ld  a, (ix+PLAY_LENGTH)
    jr  $$resetTimeCounter

$$setNewNoteLength:
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
    ld  a, (ix+VIBRATO_COUNTER)
    or  a
    jr  z, $$applyVibrato
    dec  (ix+VIBRATO_COUNTER)
    xor  a
    jr  $$getFrequency

$$applyVibrato:
    ld  a, (ix+VIBRATO_POINTER+1)
    ld  h, a
    ld  a, (ix+VIBRATO_POINTER)
    ld  l, a
    ld  a, (ix+VIBRATO_CURSOR)
    ld  b, 0
    ld  c, a
    inc  (ix+VIBRATO_CURSOR)
    add  hl, bc
    ld  a, (hl)
    cp  81h
    jr  nz, $$checkVibratoEnd
    dec  (ix+VIBRATO_CURSOR)
    jr  $$getInstrumentLevel

$$checkVibratoEnd:
    cp  80h
    jp  nz, $$getFrequency
    xor  a
    ld  (ix+VIBRATO_CURSOR), a
    jp  $$applyVibrato

$$getFrequency:
    neg
    ld  c, a
    ld  a, (ix+CURRENT_FREQUENCY)
    ld  l, a
    ld  a, (ix+CURRENT_FREQUENCY+1)
    ld  h, a
    ld  b, 0
    bit  7, c
    jr  z, $$setFrequency
    dec  b

$$setFrequency:
    add  hl, bc
    ld  a, h
    ld  (ix+CURRENT_FREQUENCY+1), a
    ld  a, l
    ld  (ix+CURRENT_FREQUENCY), a  ; vibrato applied

$$getInstrumentLevel:
    call  GetPsgInstrumentPointer
    ld  b, (hl)    ; byte b = 8x or 0x
    bit  7, b
    jr  nz, $$applyInstumentLevel  ; if byte $8x, then it's data end, so just keep applying the same level alteration
    inc  a    ; if byte 0x, point to next byte
    ld  (ix+PSG_INSTRUMENT_CURSOR), a

$$applyInstumentLevel:
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
    ld  a, (iy+0)
    cp  2
    jr  nz, $$getChannelOutputLevel
    ld  a, 0Fh    ; max level for Tone 3
    jr  $$capLevelValue

$$getChannelOutputLevel:
    ld  a, (OUTPUT_LEVEL)

$$capLevelValue:
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
    and  80h 
    jr  nz, $$startRelease
    inc  (ix+PSG_INSTRUMENT_CURSOR)
    jr  $$findReleaseDataLoop

$$startRelease:
    inc  (ix+PSG_INSTRUMENT_CURSOR)

$$checkFadeOut:
    ld  a, (FADE_OUT_TIMER) 
    or  a
    jr  nz, $$applyNote
    ld  a, (iy+0)
    cp  2
    jr  z, $$applyNote ; no fade out for Tone 3
    ld  a, (ix+LEVEL)
    or  a
    jr  z, $$applyNote
    dec  a
    ld  (ix+LEVEL),  a

$$applyNote:
    ld  a, (ix+CURRENT_FREQUENCY+1)
    ld  b, a
    ld  a, (ix+CURRENT_FREQUENCY)
    ld  c, a
    and  0Fh
    ld  h, a
    ld  a, (CURRENT_PSG_CHANNEL)
    or  h
    or  80h
    call  ApplyPsgConditionalInput  ; first byte of tone channel frequency command
    ld  a, c
    srl  b
    rra
    srl  b
    rra
    rra
    rra
    and  3Fh
    call  ApplyPsgConditionalInput  ; second byte of tone channel frequency command
    ld  a, 0Fh     ; starting attenuation value
    sub  (ix+PSG_OUTPUT_LEVEL)
    ld  h, a
    ld  a, (CURRENT_PSG_CHANNEL)
    or  h
    or  90h     ; attenuation command bits
    call  ApplyPsgConditionalInput
    ret
