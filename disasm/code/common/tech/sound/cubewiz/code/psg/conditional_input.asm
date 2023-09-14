
; SFX has priority over music

ApplyPsgConditionalInput:  
    push  af    
    ld  a, (PROCESSING_SFX) 
    or  a
    jr  nz, $$sendInput  
    exx
    push  ix    
    pop  hl
    ld  bc, CHANNEL_DATA_SIZE*10+CHANNEL_FREE
    add  hl, bc
    ld  a, (hl)    
    exx
    or  a
    jr  nz, $$sendInput
    pop  af
    ret  
$$sendInput:
    pop  af
    ld  (PSG_PORT), a
    ret
    