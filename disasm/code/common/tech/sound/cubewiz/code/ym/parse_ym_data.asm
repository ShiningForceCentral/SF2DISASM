


ParseYm1ChannelData:
    ld  a, (iy+0)  ; channel id
    ld  ix, MUSIC_CHANNEL_YM1
    push  af
    add  a, a
    add  a, a
    add  a, a
    add  a, a
    ld  d, a
    add  a, a
    add  a, d    ; a = 30h * a
    ld  d, 0
    ld  e, a
    add  ix, de    ; channel data base address
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$loadFrequencyRegisterAddresses
    ld  de, CHANNEL_DATA_SIZE*10 ; point to SFX channel data instead
    add  ix, de

$$loadFrequencyRegisterAddresses:        
    pop  af
    ld  c, 0A0h
    add  a, c    ; first input address of frequency register
    ld  (LoadYm1FrequencyRegister1+1), a
    ld  c, 4
    add  a, c    ; second input address of frequency register
    ld  (LoadYm1FrequencyRegister2+1), a

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
    ld  b, YMREG_KEY_ON_OFF
    ld  a, (iy+0)
    ld  c, a
    call  ApplyYm1ConditionalInput  ; set key OFF

$$checkTime:
    ld  a, (ix+TIME_COUNTER)
    or  a
    jp  nz, $$continueNote
    ld  d, (ix+DATA_CURSOR+1)
    ld  e, (ix+DATA_CURSOR)

$$parseByte:
    xor  a  
    ld  (ix+VIBRATO_CURSOR), a
    ld  a, (ix+VIBRATO_DELAY)
    ld  (ix+VIBRATO_COUNTER), a
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
    or  a
    jr  nz, $$applyJumpCommand ; $FF xx xx : jump
    ld  a, l
    or  a
    jr  z, $$parsingEnd ; $FF 00 00 : stop
    ld  (NEW_COMMAND), a

$$parsingEnd:
    ld  a, 1
    ld  (ix+CHANNEL_FREE),  a
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$muteChannel
    ld  bc, -(CHANNEL_DATA_SIZE*10)
    add  ix, bc
    ld  a, YMREG_PANNING
    add  a, (iy+0)
    ld  b, a
    ld  c, (ix+STEREO_PANNING)
    call  ApplyYm1Input
    ld  a, (ix+CHANNEL_FREE)
    or  a
    jr  nz, $$muteChannel
    ld  a, (ix+LEVEL)
    jp  LoadYm1Instrument  
    
$$muteChannel:    
    xor  a
    jp  LoadYm1Instrument

$$applyJumpCommand:
    ex  de, hl
    jr  $$parseByte

$$checkNewInstrument:
    cp  0FEh
    jr  nz, $$checkNewLevel
    inc  de
    ld  a, (de)
    call  SetYm1ChannelInstrument
    inc  de
    jp  $$parseByte

$$checkNewLevel:
    cp  0FDh 
    jr  nz, $$checkSlideRelease
    inc  de
    ld  a, (de)
    and  0Fh    
    call  LoadYm1Instrument
    inc  de
    jp  $$parseByte

$$checkSlideRelease:
    cp  0FCh
    jr  nz, $$checkVibrato
    call  SetYmSlideOrKeyRelease
    jp  $$parseByte

$$checkVibrato:
    cp  0FBh
    jr  nz, $$checkPanning
    call  LoadVibrato
    jp  $$parseByte

$$checkPanning:
    cp  0FAh
    jr  nz, $$checkNoteShift
    call  SetYm1StereoPanning
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
    jp  z, $$applySilence
    add  a, (ix+NOTE_SHIFT)
    ld  l, a
    ld  h, 0
    ld  bc, YM_FREQUENCIES+1
    add  hl, hl
    add  hl, bc
    ld  a, (hl)
    dec  hl
    ld  l, (hl)
    ld  h, a
    ld  b, 0
    ld  c, (ix+FREQUENCY_SHIFT)
    add  hl, bc
    ld  a, (LoadYm1FrequencyRegister2+1)
    ld  b, a
    ld  c, h
    ld  (ix+YM_TARGET_FREQUENCY+1), c
    ld  a, (ix+SLIDE_SPEED)
    or  a
    jr  nz, $$applyFrequency2
    ld  (ix+CURRENT_FREQUENCY+1), c 
    xor  a
    ld  (ix+YM_TARGET_FREQUENCY+1), a

$$applyFrequency2:
    call  ApplyYm1ConditionalInput
    ld  a, (LoadYm1FrequencyRegister1+1)
    ld  b, a
    ld  c, l
    ld  (ix+YM_TARGET_FREQUENCY), c
    ld  a, (ix+SLIDE_SPEED)
    or  a 
    jr  nz, $$applyFrequency1
    ld  (ix+CURRENT_FREQUENCY), c
    xor  a
    ld  (ix+YM_TARGET_FREQUENCY), a

$$applyFrequency1:
    call  ApplyYm1ConditionalInput
    ld  b, YMREG_KEY_ON_OFF
    ld  a, (iy+0)
    or  0F0h ; set key ON
    ld  c, a
    call  ApplyYm1ConditionalInput

$$applySilence:
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
    ld  b, (ix+YM_TARGET_FREQUENCY+1)
    ld  c, (ix+YM_TARGET_FREQUENCY)
    ld  a, b
    or  c
    jr  z, $$checkVibratoCounter
    ld  a, (ix+CURRENT_FREQUENCY+1)  ; pitch slide
    ld  h, a
    ld  a, (ix+CURRENT_FREQUENCY)
    ld  l, a 
    push  bc
    push  hl
    or  a
    sbc  hl, bc    ; frequency difference
    ld  a, h
    ld  (TEMP_FREQUENCY), a
    jr  nc, $$slideDown 
    ld  b, 0 ; slide up
    ld  c, (ix+SLIDE_SPEED)
    jp  $$applySlide

$$slideDown:
    ld  b, 0FFh
    ld  a, (ix+SLIDE_SPEED)
    neg 
    ld  c, a

$$applySlide:
    pop  hl
    add  hl, bc
    pop  bc
    push  hl
    or  a
    sbc  hl, bc
    ld  a, (TEMP_FREQUENCY)
    xor  h
    bit  7, a
    pop  hl
    jr  nz, $$finishSlide
    push  hl
    ld  a, h
    and  7
    ld  h, a
    ld  (TEMP_FREQUENCY), hl
    ld  bc, 4D4h
    or  a
    sbc  hl, bc
    jr  c, $$checkLowerCapping  ; if hl frequency (without octave) < $4D4
    ld  bc, 596h  ; hl > $4D4, so add $596
    jp  $$updateFrequencyWithSlide

$$checkLowerCapping:
    ld  hl, (TEMP_FREQUENCY)
    ld  bc, 26Ah  ; 2 * $26A = $4D4
    or  a
    sbc  hl, bc
    jr  nc, $$skipCapping  ; if hl frequency (without octave) >= 26A
    ld  bc, 0FA6Ah  ; hl < $26A, so sub $596
    jp  $$updateFrequencyWithSlide

$$skipCapping:
    ld  bc, 0    ; hl between $26A and $4D4, so do nothing

$$updateFrequencyWithSlide:
    pop  hl
    add  hl, bc
    ld  a, h
    ld  (ix+CURRENT_FREQUENCY+1), a
    ld  a, l
    ld  (ix+CURRENT_FREQUENCY), a
    jp  $$checkVibratoCounter

$$finishSlide:
    ld  (ix+CURRENT_FREQUENCY+1), b
    ld  (ix+CURRENT_FREQUENCY), c
    xor  a
    ld  (ix+YM_TARGET_FREQUENCY), a
    ld  (ix+YM_TARGET_FREQUENCY+1), a

$$checkVibratoCounter:
    ld  a, (ix+VIBRATO_COUNTER)
    or  a
    jr  z, $$getNextVibratoByte
    dec  (ix+VIBRATO_COUNTER)
    xor  a
    jr  $$getFrequency

$$getNextVibratoByte:
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
    xor  a
    jr  $$getFrequency

$$checkVibratoEnd:
    cp  80h
    jp  nz, $$getFrequency
    xor  a    ; byte = 80, go back to start
    ld  (ix+VIBRATO_CURSOR), a
    jp  $$getNextVibratoByte

$$getFrequency:
    ld  c, a    ; a = vibrato value to apply
    ld  a, (ix+CURRENT_FREQUENCY)
    ld  l, a
    ld  a, (ix+CURRENT_FREQUENCY+1)
    ld  h, a
    ld  b, 0
    bit  7, c
    jr  z, $$skipNeg
    dec  b
$$skipNeg:
    add  hl, bc


LoadYm1FrequencyRegister2:
    ld  b, 0    ; dynamically updated operand : 2nd frequency register for current channel
    ld  c, h
    ld  (ix+CURRENT_FREQUENCY+1), c
    call  ApplyYm1ConditionalInput

LoadYm1FrequencyRegister1:
    ld  b, 0    ; dynamically updated operand : 1st frequency register for current channel
    ld  c, l
    ld  (ix+CURRENT_FREQUENCY), c
    call  ApplyYm1ConditionalInput
    ld  a, (FADE_OUT_TIMER)
    or  a
    ret  nz
    ld  a, (ix+LEVEL)
    jp  LoadYm1Instrument


ParseYm2ChannelData:
    ld  a, (iy+0)  ; channel id
    ld  ix, MUSIC_CHANNEL_YM4
    push  af
    add  a, a
    add  a, a
    add  a, a
    add  a, a
    ld  d, a
    add  a, a
    add  a, d    ; a = 30h * a
    ld  d, 0
    ld  e, a
    add  ix, de    ; channel data base address
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$loadFrequencyRegisterAddresses
    ld  de, CHANNEL_DATA_SIZE*10 ; point to SFX channel data instead
    add  ix, de

$$loadFrequencyRegisterAddresses:
    pop  af
    ld  c, 0A0h
    add  a, c    ; first input address of frequency register
    ld  (LoadYm2FrequencyRegister1+1), a
    ld  c, 4
    add  a, c    ; second input address of frequency register
    ld  (LoadYm2FrequencyRegister2+1), a

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
    ld  b, YMREG_KEY_ON_OFF
    ld  a, (iy+0)
    add  a, 4
    ld  c, a
    call  ApplyYm1ConditionalInput  ; set key OFF

$$checkTime:
    ld  a, (ix+TIME_COUNTER)
    or  a
    jp  nz, $$continueNote
    ld  d, (ix+DATA_CURSOR+1)
    ld  e, (ix+DATA_CURSOR)

$$parseByte:
    xor  a
    ld  (ix+VIBRATO_CURSOR), a
    ld  a, (ix+VIBRATO_DELAY)
    ld  (ix+VIBRATO_COUNTER), a
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
    jr  nz, $$applyJumpCommand ; $FF xx xx : jump
    ld  a, 1
    ld  (ix+CHANNEL_FREE),  a
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$muteChannel 
    ld  bc, -(CHANNEL_DATA_SIZE*10) ; go back to music channel data
    add  ix, bc
    ld  a, YMREG_PANNING
    add  a, (iy+0)
    ld  b, a
    ld  c, (ix+STEREO_PANNING)
    call  ApplyYm2Input
    ld  a, (ix+CHANNEL_FREE)
    or  a
    jr  nz, $$muteChannel
    ld  a, (ix+LEVEL)
    jp  LoadYm2Instrument

$$muteChannel:
    xor  a
    jp  LoadYm2Instrument

$$applyJumpCommand:
    ex  de, hl
    jr  $$parseByte

$$checkNewInstrument:
    cp  0FEh
    jr  nz, $$checkNewLevel
    inc  de
    ld  a, (de)
    call  SetYm2ChannelInstrument
    inc  de
    jp  $$parseByte

$$checkNewLevel:
    cp  0FDh 
    jr  nz, $$checkSlideRelease
    inc  de
    ld  a, (de)
    and  0Fh
    call  LoadYm2Instrument
    inc  de
    jp  $$parseByte

$$checkSlideRelease:
    cp  0FCh
    jr  nz, $$checkVibrato
    call  SetYmSlideOrKeyRelease
    jp  $$parseByte

$$checkVibrato:
    cp  0FBh
    jr  nz, $$checkPanning
    call  LoadVibrato
    jp  $$parseByte

$$checkPanning:
    cp  0FAh
    jr  nz, $$checkNoteShift
    call  SetYm2StereoPanning
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
    jp  z, $$applySilence
    add  a, (ix+NOTE_SHIFT) 
    ld  l, a
    ld  h, 0
    ld  bc, YM_FREQUENCIES+1 
    add  hl, hl
    add  hl, bc
    ld  a, (hl)
    dec  hl
    ld  l, (hl)
    ld  h, a 
    ld  b, 0
    ld  c, (ix+FREQUENCY_SHIFT)
    add  hl, bc
    ld  a, (LoadYm1FrequencyRegister2+1)
    ld  b, a
    ld  c, h
    ld  (ix+YM_TARGET_FREQUENCY+1), c
    ld  a, (ix+SLIDE_SPEED)
    or  a
    jr  nz, $$applyFrequency2
    ld  (ix+CURRENT_FREQUENCY+1), c
    xor  a
    ld  (ix+YM_TARGET_FREQUENCY+1), a

$$applyFrequency2:
    call  ApplyYm2ConditionalInput
    ld  a, (LoadYm1FrequencyRegister1+1)  ; dynamically changed :  1st frequency register to use corresponding to current channel
    ld  b, a
    ld  c, l
    ld  (ix+YM_TARGET_FREQUENCY), c
    ld  a, (ix+SLIDE_SPEED)
    or  a
    jr  nz, $$applyFrequency1
    ld  (ix+CURRENT_FREQUENCY), c
    xor  a
    ld  (ix+YM_TARGET_FREQUENCY), a

$$applyFrequency1:
    call  ApplyYm2ConditionalInput
    ld  b, YMREG_KEY_ON_OFF 
    ld  a, (iy+0)
    add  a, 4
    or  0F0h ; set key ON
    ld  c, a
    call  ApplyYm1ConditionalInput

$$applySilence:
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
    ld  b, (ix+YM_TARGET_FREQUENCY+1)
    ld  c, (ix+YM_TARGET_FREQUENCY)
    ld  a, b
    or  c
    jr  z, $$checkVibratoCounter
    ld  a, (ix+CURRENT_FREQUENCY+1)  ; pitch slide
    ld  h, a
    ld  a, (ix+CURRENT_FREQUENCY)
    ld  l, a
    push  bc
    push  hl
    or  a
    sbc  hl, bc    ; frequency difference
    ld  a, h
    ld  (TEMP_FREQUENCY), a
    jr  nc, $$slideDown
    ld  b, 0 ; slide up
    ld  c, (ix+SLIDE_SPEED)
    jp  $$applySlide

$$slideDown:
    ld  b, 0FFh
    ld  a, (ix+SLIDE_SPEED)
    neg
    ld  c, a

$$applySlide:
    pop  hl
    add  hl, bc
    pop  bc
    push  hl
    or  a
    sbc  hl, bc
    ld  a, (TEMP_FREQUENCY)
    xor  h
    bit  7, a
    pop  hl
    jr  nz, $$finishSlide
    push  hl
    ld  a, h
    and  7
    ld  h, a
    ld  (TEMP_FREQUENCY), hl
    ld  bc, 4D4h
    or  a
    sbc  hl, bc
    jr  c, $$checkLowerCapping
    ld  bc, 596h
    jp  $$updateFrequencyWithSlide

$$checkLowerCapping:
    ld  hl, (TEMP_FREQUENCY)
    ld  bc, 26Ah
    or  a
    sbc  hl, bc
    jr  nc, $$skipCapping
    ld  bc, 0FA6Ah
    jp  $$updateFrequencyWithSlide

$$skipCapping:
    ld  bc, 0

$$updateFrequencyWithSlide:
    pop  hl
    add  hl, bc
    ld  a, h
    ld  (ix+CURRENT_FREQUENCY+1), a
    ld  a, l
    ld  (ix+CURRENT_FREQUENCY), a
    jp  $$checkVibratoCounter

$$finishSlide:
    ld  (ix+CURRENT_FREQUENCY+1), b
    ld  (ix+CURRENT_FREQUENCY), c
    xor  a
    ld  (ix+YM_TARGET_FREQUENCY), a
    ld  (ix+YM_TARGET_FREQUENCY+1), a

$$checkVibratoCounter:
    ld  a, (ix+VIBRATO_COUNTER)
    or  a
    jr  z, $$getNextVibratoByte
    dec  (ix+VIBRATO_COUNTER)
    xor  a
    jr  $$getFrequency

$$getNextVibratoByte:
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
    xor  a
    jr  $$getFrequency

$$checkVibratoEnd: 
    cp  80h
    jp  nz, $$getFrequency
    xor  a
    ld  (ix+VIBRATO_CURSOR), a
    jp  $$getNextVibratoByte

$$getFrequency:
    ld  c, a
    ld  a, (ix+CURRENT_FREQUENCY)
    ld  l, a
    ld  a, (ix+CURRENT_FREQUENCY+1)
    ld  h, a
    ld  b, 0
    bit  7, c
    jr  z, $$skipNeg
    dec  b

$$skipNeg:
    add  hl, bc

LoadYm2FrequencyRegister2:
    ld  b, 0
    ld  c, h
    ld  (ix+CURRENT_FREQUENCY+1), c
    call  ApplyYm2ConditionalInput

LoadYm2FrequencyRegister1:
    ld  b, 0
    ld  c, l
    ld  (ix+CURRENT_FREQUENCY), c
    call  ApplyYm2ConditionalInput
    ld  a, (PROCESSING_SFX) 
    or  a
    ret  nz
    ld  a, (FADE_OUT_TIMER)
    or  a
    ret  nz
    ld  a, (ix+LEVEL)
    jp  LoadYm2Instrument
