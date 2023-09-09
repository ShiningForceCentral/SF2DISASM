


SetYmTimer:  
    push  bc
    ld  b, 26h
    ld  a, (YM_TIMER_VALUE)
    ld  c, a
    call  ApplyYm1Input
    pop  bc
    ret
