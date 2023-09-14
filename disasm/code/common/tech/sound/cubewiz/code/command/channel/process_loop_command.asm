


ParseLoopCommand:
    inc  de
    ld  a, (de)
    ld  b, a
    inc  de
    rlca
    rlca
    rlca
    and  7
    jr  nz, $$checkVoltaStart
    ; F8 00 : Infinite Loop Start
    ld  (ix+INFINITE_LOOP_START_POINTER), e 
    ld  (ix+INFINITE_LOOP_START_POINTER+1), d
    ret

$$checkVoltaStart:
    cp  1
    jr  nz, $$checkVoltaSection1Start
    ; F8 20 : Volta Start
    ld  (ix+VOLTA_START_POINTER), e 
    ld  (ix+VOLTA_START_POINTER+1), d
    xor  a
    ld  (ix+VOLTA_END_1_DONE), a
    ld  (ix+VOLTA_END_2_DONE), a
    ret

$$checkVoltaSection1Start:
    cp  2
    jr  nz, $$checkVoltaSection2Start
    ; F8 40 : Volta Section 1 Start
    ld  a, (ix+VOLTA_END_1_DONE)
    or  a
    jr  nz, $$goToVoltaSection2
    ld  a, 1
    ld  (ix+VOLTA_END_1_DONE), a
    ret

$$goToVoltaSection2:
    ld  a, (de)
    ld  b, a
    inc  de
    ld  a, (de)
    ld  c, a
    inc  de
    ld  a, b
    cp  0FFh
    jr  z, $$voltaReturn
    cp  0F8h
    jr  z, $$goToVoltaSection2Check
    and  80h
    jr  nz, $$goToVoltaSection2
    dec  de
    jr  $$goToVoltaSection2

$$goToVoltaSection2Check:
    ld  a, c
    cp  60h
    jr  nz, $$goToVoltaSection2
    ; Found F8 60 : Volta Section 2 Start

$$voltaReturn:
    dec  de
    dec  de
    ret

$$checkVoltaSection2Start:
    cp  3
    jr  nz, $$checkVoltaSection3Start
    ; F8 60 : Volta Section 2 Start
    ld  a, (ix+VOLTA_END_2_DONE)
    or  a
    jr  nz, $$goToVoltaSection3
    ld  a, 1
    ld  (ix+VOLTA_END_2_DONE), a
    ret

$$goToVoltaSection3:
    ld  a, (de)
    ld  b, a
    inc  de
    ld  a, (de)
    ld  c, a
    inc  de
    ld  a, b
    cp  0FFh
    jr  z, $$voltaReturn
    cp  0F8h
    jr  z, $$goToVoltaSection3Check
    and  80h
    jr  nz, $$goToVoltaSection3
    dec  de
    jr  $$goToVoltaSection3

$$goToVoltaSection3Check:
    ld  a, c
    cp  80h
    jr  nz, $$goToVoltaSection3
    ; Found F8 80 : Volta Section 3 Start
    jr  $$voltaReturn

$$checkVoltaSection3Start:
    cp  4
    jr  nz, $$checkVoltaSectionEnd
    ; F8 80 : Volta Section 3 Start
    ret

$$checkVoltaSectionEnd:
    cp  5
    jr  nz, $$checkCountedLoopStart
    bit  0, b
    jr  nz, $$infiniteLoopEnd
    ; F8 A0 : Volta Section End, return to Volta Start
    ld  e, (ix+VOLTA_START_POINTER)
    ld  d, (ix+VOLTA_START_POINTER+1)
    ret

$$infiniteLoopEnd:
    ; F8 A1 : Infinite Loop End
    ld  e, (ix+INFINITE_LOOP_START_POINTER)
    ld  d, (ix+INFINITE_LOOP_START_POINTER+1)
    ret

$$checkCountedLoopStart:
    cp  6
    jr  nz, $$countedLoopEnd
    ; F8 Cx/Dx : Counted Loop Start
    ld  (ix+COUNTED_LOOP_POINTER), e
    ld  (ix+COUNTED_LOOP_POINTER+1), d
    ld  a, b
    and  1Fh 
    inc  a
    ld  (ix+COUNTER_LOOP_COUNTER), a
    ret

$$countedLoopEnd:
    ; F8 E0 : Counted Loop End
    dec  (ix+COUNTER_LOOP_COUNTER)
    ret  z
    ld  e, (ix+COUNTED_LOOP_POINTER)
    ld  d, (ix+COUNTED_LOOP_POINTER+1)
    ret
