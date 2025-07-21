


SetYm1StereoPanning:
    inc  de
    ld  a, (de)
    bit  0, a
    ret  nz
    and  0C0h
    ld  (ix+STEREO_PANNING), a
    ld  c, a
    ld  b, YMREG_PANNING
    ld  a, (iy+0)
    add  a, b
    ld  b, a
    inc  de
    jp  ApplyYm1ConditionalInput

SetYm2StereoPanning:
    inc  de
    ld  a, (de)
    and  0C0h
    ld  (ix+STEREO_PANNING), a
    ld  c, a
    ld  b, YMREG_PANNING
    ld  a, (iy+0)
    add  a, b
    ld  b, a
    inc  de
    jp  ApplyYm2ConditionalInput
