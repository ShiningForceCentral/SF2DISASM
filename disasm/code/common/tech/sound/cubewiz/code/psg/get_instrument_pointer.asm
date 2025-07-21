


GetPsgInstrumentPointer:
    ld  a, (ix+PSG_INSTRUMENT_POINTER+1)
    ld  h, a
    ld  a, (ix+PSG_INSTRUMENT_POINTER)
    ld  l, a
    ld  b, 0
    ld  a, (ix+PSG_INSTRUMENT_CURSOR)
    ld  c, a
    add  hl, bc
    ret
