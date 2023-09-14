


SetRelease:
    inc  de
    ld  a, (de)
ApplyRelease:
    ld  c, a
    and  80h
    ld  (ix+NO_RELEASE),  a
    ld  a, c
    and  7Fh
    ld  (ix+KEY_RELEASE),  a
    inc  de
    ret
