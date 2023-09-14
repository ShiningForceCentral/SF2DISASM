


SendDacByte:    
    push  af
    push  bc
    push  de
    push  hl      
    
    ld  b, YMREG_DAC_OUTPUT
    ld  a, (DAC_REMAINING_LENGTH)
    ld  d, a    
    ld  a, (DAC_REMAINING_LENGTH+1)
    ld  e, a      
    ld  a, d    ; check remaining sound length
    or  e
    jp  z, $$return

    ld  a, (DAC_BANK)
    call  LoadBank        
    ld  a, (DAC_LAST_OFFSET)
    ld  h, a    
    ld  a, (DAC_LAST_OFFSET+1)
    ld  l, a    
    ld  c, (hl)    ; get next DAC sample byte. It's 8-bit PCM
    inc  hl

$$ymRequestLoop:          
    ld  a, (YM1_REGISTER)
    and  80h
    jr  nz, $$ymRequestLoop

    ld  a, b
    ld  (YM1_REGISTER),  a
    ld  a, c
    ld  (YM1_DATA), a  ; transmit DAC Data
    dec  de    ; decrement remaining sound length to play    
    ld  a, h
    ld  (DAC_LAST_OFFSET), a
    ld  a, l
    ld  (DAC_LAST_OFFSET+1), a  
    ld  a, d
    ld  (DAC_REMAINING_LENGTH), a
    ld  a, e
    ld  (DAC_REMAINING_LENGTH+1), a  

    ld  a, (PROCESSING_SFX)
    or  a
    jp  nz, $$loadSfxBank
    ld  a, (MUSIC_BANK)
    call  LoadBank
    jp  $$return
$$loadSfxBank:    
    ld  a, SFX_BANK
    call  LoadBank    
$$return:
    pop  hl
    pop  de
    pop  bc
    pop  af
    ret