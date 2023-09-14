


MainLoop:      

    ; Check YM timer for sequenial sound update
    ld  a, (YM1_REGISTER) 
    and  2    
    jr  z, DacLoop

    ; Sequential sound update
    ; Save/restore of DAC playback data for intermediate DAC outputs during sound update
    ; (prevents the DAC soundwave to be interrupted with a long plateau)
    ld  a, d
    ld  (DAC_REMAINING_LENGTH), a
    ld  a, e
    ld  (DAC_REMAINING_LENGTH+1), a    
    ld  a, h
    ld  (DAC_LAST_OFFSET), a
    ld  a, l
    ld  (DAC_LAST_OFFSET+1), a
    call  UpdateSound
    ld  a, (DAC_LAST_OFFSET)
    ld  h, a    
    ld  a, (DAC_LAST_OFFSET+1)
    ld  l, a  
    ld  a, (DAC_REMAINING_LENGTH)
    ld  d, a    
    ld  a, (DAC_REMAINING_LENGTH+1)
    ld  e, a  
    jp  CheckNewCommand

    ; Apply DAC playback rate
DacLoop:        
    ld  b, 5    ; loop parameter is dynamically changed to adjust time period of a DAC sound   
    djnz  $     ; loop b times before new checks

CheckNewCommand:          
    ld  a, (NEW_COMMAND)
    or  a
    call  nz, ProcessNewCommand

    ; Check new DAC sample
    ld  a, (NEW_SAMPLE)
    or  a    
    call  nz, LoadDacSample
    
    ; Check remaining sample length
    ld  a, d
    or  e
    jr  z, MainLoop
    
    ; Send sample byte
    ld  b, YMREG_DAC_OUTPUT
    ld  c, (hl)             ; get next DAC byte (8-bit PCM)
    inc  hl
$$waitYM:
    ld  a, (YM1_REGISTER)
    and  80h
    jr  nz, $$waitYM        ; wait for YM to be available
    ld  a, b
    ld  (YM1_REGISTER),  a
    ld  a, c
    ld  (YM1_DATA), a       ; send DAC byte
    dec  de                 ; decrement remaining sample length
    jp  MainLoop
