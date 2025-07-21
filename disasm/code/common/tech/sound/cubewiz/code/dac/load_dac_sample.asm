


LoadDacSample:
    cp  0FEh
    jr  nz, $$doLoad
    ld  hl, 0C000h  ; if a = FE, play nothing, clear DAC playback
    ld  de, 0
    ret
$$doLoad:
    dec  a    ; samples start from id 1
    ld  h, 0
    ld  l, a
    add  hl, hl
    add  hl, hl
    add  hl, hl
    ld  bc, PCM_SAMPLE_ENTRIES
    add  hl, bc 
    ld  a, (hl)    ; byte 0 : time period used
    inc  hl
    inc  hl    ; byte  2 : bank to load
    ld  (DacLoop+1), a  ; change loop operand to change DAC playback time period
    ld  a, (hl) 
    ld  (DAC_BANK), a
    inc  hl
    inc  hl
    ld  e, (hl)
    inc  hl
    ld  d, (hl)    ; bytes 5-4 : sample length
    inc  hl
    ld  a, (hl)
    inc  hl
    ld  h, (hl)
    ld  l, a    ; bytes 7-6 : sample pointer
    xor  a
    ld  (NEW_SAMPLE), a
    ld  a, (DAC_BANK)
    call  LoadBank
    ret
