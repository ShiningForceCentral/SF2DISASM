
; SFX has priority over music

SetNewDacSample:
    ld  b, a
    ld  a, (PROCESSING_SFX)
    or  a
    jr  nz, $$setSample
    exx
    push  ix    ; otherwise, check if an SFX is  being played, since it has priority
    pop  hl
    ld  bc, CHANNEL_DATA_SIZE*10+CHANNEL_FREE
    add  hl, bc
    ld  a, (hl)
    exx
    or  a
    ret  z 
    ld  a, (FADE_OUT_COUNTER)
    cp  3    ; if fade out counter > 3, don't play sample, it would be too loud compared to the other channels
    ret  nc
    ld  a, (OUTPUT_LEVEL)
    cp  0Fh    ; if general sound level not at its max, then don't play sample
    ret  nz
$$setSample:
    ld  a, b
    ld  (NEW_SAMPLE), a
    ret
