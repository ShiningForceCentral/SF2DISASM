


SetYmSlideOrKeyRelease:
    inc  de
    ld  a, (de)
    cp  0FFh
    jr  nz, $$skipClear
    xor  a
    ld  (ix+SLIDE_SPEED), a
    inc  de
    ret
$$skipClear:
    cp  81h
    jr  c, ApplyRelease
    and  7Fh
    ld  (ix+SLIDE_SPEED), a
    inc  de
    ret
