


LoadVibrato:
    inc  de
    ld  a, (de)
    push  af
    rra
    rra
    rra
    and  1Eh 
    ld  hl, pt_PITCH_EFFECTS
    ld  b, 0
    ld  c, a
    add  hl, bc
    ld  a, (hl)
    inc  hl
    ld  h, (hl)
    ld  (ix+VIBRATO_POINTER), a
    ld  a, h
    ld  (ix+VIBRATO_POINTER+1), a
    pop  af
    rla
    and  1Eh
    jr  z, $$skipDec
    dec  a
$$skipDec:
    ld  (ix+VIBRATO_DELAY),  a
    inc  de
    ret
