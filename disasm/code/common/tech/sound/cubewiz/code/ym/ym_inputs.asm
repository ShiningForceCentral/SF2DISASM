
; SFX have priority over music

ApplyYmInput:
    ld  a, (CALL_YM_PART2)
    or  a
    jr  nz, ApplyYm2ConditionalInput
    jp  ApplyYm1ConditionalInput

ApplyYm1ConditionalInput:
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  nz, ApplyYm1Input  ; if input comes from an SFX, sent input unconditionally
    exx                    ; otherwise, input comes from music : check if an SFX is being played
    push  ix
    pop  hl
    ld  bc, CHANNEL_DATA_SIZE*10+CHANNEL_FREE
    add  hl, bc
    ld  a, (hl)            ; check if corresponding SFX channel is playing
    exx
    or  a
    ret  z
ApplyYm1Input:
    ; send value c in register b of YM1
    ld  a, (YM1_REGISTER) 
    and  80h
    jr  nz, ApplyYm1Input
    ld  a, b
    ld  (YM1_REGISTER),  a
    ld  a, c
    ld  (YM1_DATA), a
    ret

ApplyYm2ConditionalInput:
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  nz, ApplyYm2Input  ; if input comes from an SFX, sent input unconditionally
    exx                    ; otherwise, input comes from music : check if an SFX is being played
    push  ix
    pop  hl
    ld  bc, CHANNEL_DATA_SIZE*10+CHANNEL_FREE
    add  hl, bc
    ld  a, (hl)            ; check if corresponding SFX channel is playing
    exx
    or  a
    ret  z
ApplyYm2Input:
    ; send value c in register b of YM2
    ld  a, (YM2_REGISTER)
    and  80h
    jr  nz, ApplyYm2Input
    ld  a, b
    ld  (YM2_REGISTER),  a
    ld  a, c
    ld  (YM2_DATA), a
    ret
