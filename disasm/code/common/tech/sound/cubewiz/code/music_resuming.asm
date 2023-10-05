


DeactivateResuming:        
    ld  a, 0FFh
    ld  (RESUMING_DEACTIVATED), a
    ret

ActivateResuming:        
    ld  a, 0
    ld  (RESUMING_DEACTIVATED), a
    ret

SaveMusic:    
    push  de     
    push  hl  
    ld  a, (YM_TIMER_VALUE)
    ld  (SAVED_YM_TIMER_VALUE), a
    ld  a, (MUSIC_YM6_FM_MODE)
    ld  (SAVED_MUSIC_YM6_FM_MODE), a
    ld  hl, MUSIC_CHANNEL_YM1
    ld  de, SAVED_MUSIC_CHANNEL_YM1
    call CopyMusicData
    pop  hl
    pop  de
    ret

ResumeMusic:    
    push  de   
    push  hl 
    
    ; save in temporary space
    ld  a, (MUSIC_BANK)
    ld  (TMPCPY_MUSIC_BANK), a
    ld  a, (YM_TIMER_VALUE)
    ld  (TMPCPY_YM_TIMER_VALUE), a
    ld  a, (MUSIC_YM6_FM_MODE)
    ld  (TMPCPY_MUSIC_DOESNT_USE_SAMPLES), a
    ld  hl, MUSIC_CHANNEL_YM1
    ld  de, TMPCPY_MUSIC_CHANNEL_YM1
    call CopyMusicData
    
    call  StopMusic        
    
    ; resume
    xor  a
    ld  a, (SAVED_MUSIC_BANK)
    ld  (MUSIC_BANK), a
    call  LoadBank
    ld  a, (SAVED_MUSIC_YM6_FM_MODE)
    ld  (MUSIC_YM6_FM_MODE), a
    ld  a, (SAVED_YM_TIMER_VALUE)
    ld  (YM_TIMER_VALUE), a
    call  SetYmTimer
    ld  a, 010h
    ld  (FADE_IN_PARAMS), a
    and  0Fh
    ld  (OUTPUT_LEVEL), a 
    xor  a
    ld  (FADE_IN_TIMER), a ; reset fade  in timer  
    ld  hl, SAVED_MUSIC_CHANNEL_YM1
    ld  de, MUSIC_CHANNEL_YM1
    call CopyMusicData
    
    ; Copy temporary space into saved space
    ld  a, (TMPCPY_MUSIC_BANK)
    ld  (SAVED_MUSIC_BANK), a
    ld  a, (TMPCPY_YM_TIMER_VALUE)
    ld  (SAVED_YM_TIMER_VALUE), a
    ld  a, (TMPCPY_MUSIC_DOESNT_USE_SAMPLES)
    ld  (SAVED_MUSIC_YM6_FM_MODE), a
    ld  hl, TMPCPY_MUSIC_CHANNEL_YM1
    ld  de, SAVED_MUSIC_CHANNEL_YM1
    call CopyMusicData
    
    ; avoid resumed PCM sample while fading in
    ld  a, 0FEh
    ld  (NEW_SAMPLE), a
    call  SetNewDacSample ; play nothing  !
    xor  a
    ld  (DAC_REMAINING_LENGTH), a
    ld  (DAC_REMAINING_LENGTH+1), a
    ld  (DAC_LAST_OFFSET), a
    ld  (DAC_LAST_OFFSET+1), a
        
    pop  hl
    pop  de
    ret

CopyMusicData:
    push  bc  
    ld  b, 0Ah     ; 10 channels
$$loop:      
    push  bc
    ld  bc, 020h   ; copy $20 bytes of data
    ldir           ; copy BC bytes from source HL to target DE
    ld  bc, 010h   ; skip $10 bytes (currently contain channel label)
    add  hl, bc
    ex  de, hl
    add  hl, bc
    ex  hl, de
    pop  bc 
    djnz  $$loop
    pop  bc
    ret