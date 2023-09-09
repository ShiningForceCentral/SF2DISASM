
; Z80 initialization code before entering main loop

    di                          ; disable interrupts : synchronization relies on YM Timer
    ld  sp, STACK_START
    ld  a, 0Fh
    ld  (OUTPUT_LEVEL), a
    ld  a, 0FFh
    ld  (YM_TIMER_VALUE), a
    ld  a, 0Fh
    ld  (FADE_IN_PARAMS), a
    call  ActivateResuming
    ld  a, 20h                  ; initialize music channels with void music entry $20
    call  ProcessNewCommand
    ld  a, (DAC_BANK)
    call  LoadBank
