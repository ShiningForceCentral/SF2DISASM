


LoadPsgInstrument:
    inc  de
    ld  a, (de)
    ld  c, a
    and  0Fh    ; instrument level
    ld  b, a
    ld  a, (iy+0)
    cp  2    ; check PSG Tone 3 Channel
    jr  z, $$setChannelLevel
    ld  a, (CURRENTLY_FADING_OUT)
    or  a  ; skip level when fading out
    jr  nz, $$checkNewInstrument
$$setChannelLevel:
    ld  (ix+LEVEL),  b
$$checkNewInstrument:
    ld  a, c
    rra
    rra
    rra
    rra
    and  0Fh    ; instrument index
    inc  de
    ld  h, 0
    ld  l, a
    add  hl, hl
    ld  bc, pt_PSG_INSTRUMENTS
    add  hl, bc
    ld  c, (hl)
    inc  hl
    ld  b, (hl)
    ld  (ix+PSG_INSTRUMENT_POINTER), c
    ld  (ix+PSG_INSTRUMENT_POINTER+1), b
    ret
