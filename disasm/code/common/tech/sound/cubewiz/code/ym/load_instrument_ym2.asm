
; TODO factorize with YM1 routine ?

LoadYm2Instrument:  
    push  af
    ld  a, YM_INSTRUMENTS_BANK
    call  LoadBank
    pop  af
    ld  (ix+LEVEL),  a
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  z, $$computeLevel
    ld  a, (ix+LEVEL)
    jr  $$getInstrumentOffset

$$computeLevel:    
    ld  a, (FADE_OUT_COUNTER)
    add  a, 0Fh
    ld  h, a
    ld  a, (OUTPUT_LEVEL) 
    add  a, (ix+LEVEL)
    sub  h
    jr  nc, $$getInstrumentOffset
    xor  a

$$getInstrumentOffset:
    push  de
    push  af
    ld  a, (ix+YM_INSTRUMENT_ID)
    ld  l, a
    ld  h, 0
    ld  d, h
    ld  e, l
    add  hl, hl
    add  hl, hl
    push  hl
    add  hl, de
    ld  d, h
    ld  e, l
    add  hl, hl
    add  hl, hl
    add  hl, de
    pop  de
    add  hl, de
    ld  de, YM_INSTRUMENTS_BANK_OFFSET
    add  hl, de
    push  hl
    ld  de, 1Ch    ; instrument algorithm byte
    add  hl, de
    ld  a, (hl)
    and  7    ; algo bits
    ld  (ix+YM_ALGORITHM),  a
    pop  hl    ; get back instrument start offset
    ld  a, (iy+0)  ; current channel

    add  a, YMREG_MUL_DT
    ld  b, 4
$$detuneMultipleLoop:
    push  bc
    ld  b, a
    ld  c, (hl)
    push  af
    call  ApplyYm2ConditionalInput
    pop  af  
    inc  hl
    add  a, 4
    pop  bc
    djnz  $$detuneMultipleLoop

    ld  (TEMP_REGISTER), a
    pop  af
    push  hl
    ld  d, 0
    ld  e, a
    ld  hl, YM_LEVELS
    ld  b, e
    add  hl, de
    ld  c, (hl)
    ld  e, (ix+YM_ALGORITHM)
    ld  hl, YM_ALGORITHM_SLOTS
    add  hl, de
    ld  d, (hl)
    ld  a, (TEMP_REGISTER)
    pop  hl

    ld  b, 4
$$totalLevelLoop:
    push  bc
    ld  b, a    ; YM Register : Total level
    push  af
    rr  d
    jr  nc, $$nonSlotOperator  ; if rotated bit = 0, then use original instrument level
    ld  a, 7Fh    ; else, the operator is a slot, so use channel level
    sub  (hl)    ; instrument's operator total level value
    add  a, c
    ld  c, a
    cp  7Fh
    jr  c, $$skipCapping  ; if result > 7F, then put 7F, since it's the max value
    ld  c, 7Fh
$$skipCapping:
    jp  $$applyNote
$$nonSlotOperator:
    ld  c, (hl)    ; get instrument's operator level
$$applyNote:
    call  ApplyYm2ConditionalInput
    pop  af
    inc  hl
    add  a, 4
    pop  bc
    djnz  $$totalLevelLoop

    ld  b, 14h    ; loop 20d times, so 5 * 4 operators, so from 50h to A0h
$$mainValueCopyLoop:
    push  bc
    ld  b, a    ; YM Register :  Rate scalling /  Attack rate, First decay rate /  Amplitude modulation ...
    ld  c, (hl)    ; ... Secondary  decay rate, Secondary amplitude  / Release rate,  SSG-EG
    push  af
    call  ApplyYm2ConditionalInput
    pop  af
    inc  hl
    add  a, 4
    pop  bc
    djnz  $$mainValueCopyLoop

    add  a, 10h
    ld  b, a    ; YM Register : Feedback / Algorithm
    ld  c, (hl)
    call  ApplyYm2ConditionalInput

    pop  de
    ld  a, (PROCESSING_SFX)
    or  a
    jr  nz, $$loadSfxBank    
    ld  a, (MUSIC_BANK)
    jr  $$loadBank
$$loadSfxBank:
    ld  a, SFX_BANK
$$loadBank:    
    call  LoadBank
    ret
