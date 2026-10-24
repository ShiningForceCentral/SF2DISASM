
; ASM FILE music41.asm :
; 0xDC9A..0xFD9E : Music 41
Music_41:       db 0
		db 0
		db 0
		db 0C6h
		dw Music_41_Channel_0
		dw Music_41_Channel_1
		dw Music_41_Channel_2
		dw Music_41_Channel_3
		dw Music_41_Channel_4
		dw Music_41_Channel_5
		dw Music_41_Channel_6
		dw Music_41_Channel_7
		dw Music_41_Channel_9
		dw Music_41_Channel_9
Music_41_Channel_0:
		  stereo 0C0h
		  inst 55
		  vol 0Ch
		  sustain
		  vibrato 02Ch
		        noteL F2,192
		  vibrato 020h
		        note  F2
		        note  F2
		        note  F2
		  setRelease 01h
		        noteL F2,83
		  vibrato 02Ch
		  inst 40
		  vol 0Bh
		        noteL E2,15
		  vol 0Ch
		        noteL D2,16
		  inst 1
		  vol 0Bh
		        noteL Cs1,132
		  inst 3
		  vol 0Dh
		        noteL As1,10
		        waitL 14
		        noteL As1,78
		        waitL 18
		  vol 0Ch
		countedLoopStart 1
		        noteL As1,8
		        noteL As2,4
		        wait
		        note  As2
		        wait
		countedLoopEnd
		        noteL F1,8
		        noteL F2,4
		        wait
		        note  F2
		        wait
		        noteL As1,12
		  inst 32
		  vol 0Dh
		        noteL As2,6
		        note  As2
		        note  As2
		  vol 09h
		        note  As2
		  inst 3
		  vol 0Bh
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        waitL 18
		        noteL F2,6
		        wait
		countedLoopStart 3
		        noteL As1,6
		        wait
		        note  As1
		        waitL 18
		        noteL As1,6
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        waitL 18
		        noteL F2,6
		        wait
		countedLoopEnd
		repeatStart
		        noteL Ds2,6
		        wait
		        note  Ds2
		        waitL 18
		        noteL Ds2,6
		        note  Ds2
		        note  Ds2
		        note  Ds2
		        note  Ds2
		        waitL 18
		        noteL F2,6
		        wait
		  vol 0Ch
		        noteL As1,8
		        waitL 16
		        noteL As2,12
		        waitL 6
		        note  As2
		        note  Gs2
		        wait
		  vol 0Bh
		  sustain
		        note  Gs3
		  setRelease 01h
		        note  G3
		        note  Gs3
		        wait
		  vol 0Ch
		        note  Gs2
		        wait
		        note  Fs2
		        wait
		  vol 0Bh
		  sustain
		        note  Fs3
		  setRelease 01h
		        note  F3
		        note  Fs3
		        note  Gs3
		        note  As3
		        note  Fs3
		        note  F3
		        wait
		        noteL F2,24
		        noteL F2,6
		        wait
		        note  As1
		        wait
		        note  As1
		        waitL 18
		        noteL As1,6
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        waitL 18
		        noteL F2,6
		        wait
		        note  Ds2
		        wait
		        note  Ds2
		        waitL 18
		        noteL Ds2,6
		        note  Ds2
		        note  Ds2
		        wait
		repeatSection1Start
		        noteL F2,24
		        noteL Ds2,12
		        noteL D2,6
		        wait
		        note  D2
		        waitL 18
		        noteL D2,6
		        note  D2
		        note  D2
		        note  D2
		        note  D2
		        waitL 18
		        noteL A2,6
		        wait
		        note  G2
		        wait
		        note  G2
		        waitL 18
		        noteL G2,6
		        note  G2
		        note  F2
		        note  F2
		        note  F2
		        wait
		        noteL F2,24
		        noteL E2,6
		        wait
		        note  E2
		        waitL 18
		        noteL E2,6
		        note  E2
		        note  E2
		        note  E2
		        note  E2
		        waitL 18
		        noteL E2,6
		        wait
		        note  F2
		        wait
		        note  F2
		        waitL 18
		        noteL F2,6
		        wait
		        note  F1
		        note  F1
		        note  F1
		        waitL 18
		        noteL F1,6
		        wait
		        note  As1
		        wait
		        note  As1
		        waitL 18
		        noteL As1,6
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        waitL 18
		        noteL F2,6
		        wait
		repeatEnd
		repeatSection2Start
		        noteL F2,36
		        noteL Fs2,48
		        noteL Gs2,36
		  sustain
		        noteL Fs2,6
		  setRelease 01h
		        note  Gs2
		        noteL As2,8
		        waitL 16
		        noteL Ds2,48
		        noteL Ds2,24
		        noteL B1,48
		        noteL Cs2,36
		  sustain
		        noteL B1,6
		  setRelease 01h
		        note  Cs2
		        noteL Ds2,8
		        waitL 16
		        noteL E2,72
		  inst 2
		  vol 0Ch
		        noteL A3,48
		        waitL 12
		        noteL E3,24
		        noteL E3,6
		        wait
		        noteL A3,72
		        noteL E3,24
		        noteL Gs3,48
		        waitL 12
		        noteL Ds3,24
		        noteL Ds3,6
		        wait
		        noteL Gs3,96
		        noteL G3,48
		        waitL 12
		        noteL D3,24
		        noteL D3,6
		        wait
		        noteL G3,72
		        noteL D3,24
		        noteL Fs3,48
		        waitL 12
		        noteL Fs3,24
		        noteL Cs3,6
		        wait
		        noteL E3,48
		        waitL 12
		        noteL B2,24
		        noteL E3,12
		        noteL D3,48
		        waitL 12
		        noteL D3,24
		        noteL D3,6
		        wait
		        noteL Cs3,60
		        noteL Ds3,12
		        note  E3
		        note  Gs3
		        noteL G3,48
		        waitL 12
		        noteL D3,24
		        noteL G3,12
		        noteL Fs3,48
		        waitL 12
		        note  A3
		        note  B3
		        note  Cs4
		        noteL D4,48
		        waitL 12
		        noteL A3,24
		        noteL A3,6
		        wait
		        noteL Cs4,30
		        waitL 6
		        noteL Gs3,18
		        waitL 6
		        noteL E3,18
		        waitL 6
		        note  Cs3
		        waitL 30
		  inst 3
		  vol 0Ch
		        noteL Fs2,24
		        wait
		        note  E2
		        noteL D2,8
		        waitL 16
		        noteL C2,72
		countedLoopStart 1
		  inst 3
		  vol 0Ch
		  setRelease 07h
		        noteL F2,12
		        note  C3
		        note  F3
		  setRelease 01h
		  inst 32
		  vol 0Dh
		        noteL F2,6
		        note  F2
		        note  F2
		  vol 09h
		        note  F2
		  setRelease 07h
		  inst 3
		  vol 0Ch
		        noteL F2,12
		        note  C3
		        note  F3
		        wait
		  setRelease 01h
		  inst 32
		  vol 0Dh
		        noteL F2,6
		        note  F2
		        note  F2
		  vol 09h
		        note  F2
		  setRelease 07h
		  inst 3
		  vol 0Ch
		        noteL F2,12
		        note  C3
		        note  F3
		        note  Ds3
		        note  As3
		        note  F3
		  setRelease 01h
		  inst 32
		  vol 0Dh
		        noteL F2,6
		        note  F2
		        note  F2
		  vol 09h
		        note  F2
		        waitL 12
		  inst 38
		  vol 0Bh
		        noteL Ds4,4
		        note  D4
		        note  C4
		        note  As3
		        note  A3
		        note  G3
		        note  F4
		        note  Ds4
		        note  D4
		        note  C4
		        note  As3
		        note  A3
		        note  G4
		        note  F4
		        note  Ds4
		        note  D4
		        note  C4
		        note  As3
		        note  A4
		        note  G4
		        note  F4
		        note  Ds4
		        note  D4
		        note  C4
		        note  As3
		        note  A3
		        note  G3
		        note  F3
		        note  Ds3
		        note  D3
		        note  C3
		        note  As2
		        note  A2
		        note  G2
		        note  F2
		        note  Ds2
		countedLoopEnd
		  inst 32
		  vol 0Dh
		        noteL As2,6
		  vol 09h
		        note  As2
		  vol 0Dh
		        noteL As2,4
		        note  As2
		  vol 09h
		        note  As2
		  vol 0Dh
		        noteL As2,12
		  vol 09h
		        noteL As2,6
		        wait
		  inst 3
		  vol 0Dh
		        noteL As1,54
		        waitL 6
		  vol 0Ch
		        noteL As1,4
		  setRelease 05h
		        noteL As1,8
		        note  As1
		        note  As1
		        note  As1
		        wait
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		countedLoopStart 11
		  setRelease 01h
		        noteL As1,8
		        waitL 4
		        note  As1
		  setRelease 05h
		        noteL As1,8
		        note  As1
		        note  As1
		        note  As1
		        wait
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		countedLoopEnd
		  setRelease 01h
		        noteL As1,8
		        waitL 4
		        note  As1
		  setRelease 05h
		        noteL As1,8
		  setRelease 01h
		        noteL F1,72
		        noteL As1,8
		        waitL 16
		        noteL As1,8
		        waitL 28
		        noteL Fs2,8
		        waitL 16
		        noteL Fs2,8
		        waitL 16
		        noteL B1,6
		        wait
		        noteL B1,8
		        waitL 16
		        noteL E2,6
		        note  E2
		        noteL E2,8
		        waitL 16
		        noteL E2,8
		        waitL 28
		        noteL A2,8
		        waitL 16
		        noteL B2,6
		        wait
		        noteL B2,8
		        waitL 16
		        noteL B2,6
		        note  B2
		        note  As2
		        wait
		        note  As1
		        note  As1
		        note  As1
		        wait
		        note  As1
		        note  As1
		        noteL As1,8
		        waitL 40
		channel_end
Music_41_Channel_1:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 035h
		  inst 15
		  vol 00h
		        noteL F2,12
		  vol 0Bh
		        note  E3
		        note  F3
		        note  C4
		        noteL B3,36
		        noteL G3,12
		        note  A3
		        note  C4
		  vibrato 03Ch
		  sustain
		        noteL E4,72
		  vibrato 030h
		  vol 09h
		        noteL E4,6
		  vol 07h
		  setRelease 01h
		        note  E4
		  vol 0Bh
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        noteL A3,18
		        noteL E4,6
		  vibrato 03Ch
		  sustain
		        noteL G4,72
		  vibrato 030h
		  vol 09h
		        noteL G4,6
		  vol 07h
		  setRelease 01h
		        note  G4
		  vol 0Bh
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        note  A3
		        note  E4
		        note  D4
		        note  B3
		        note  C4
		        noteL G4,24
		        noteL F4,12
		  vibrato 03Ch
		  sustain
		        noteL B4,24
		  vibrato 030h
		  vol 09h
		        noteL B4,6
		  vol 07h
		  setRelease 01h
		        note  B4
		  vol 0Bh
		  vibrato 035h
		        noteL C4,12
		        note  G4
		        note  F4
		  vibrato 03Ch
		  sustain
		        noteL B4,48
		  vibrato 030h
		  vol 09h
		        noteL B4,6
		  vol 07h
		  setRelease 01h
		        note  B4
		  vibrato 035h
		  vol 0Bh
		        noteL C4,12
		        noteL G4,18
		        noteL F4,6
		  vibrato 03Ch
		  sustain
		        noteL B4,48
		  vibrato 030h
		  vol 09h
		        noteL B4,6
		  vol 07h
		  setRelease 01h
		        note  B4
		  vol 0Bh
		  vibrato 035h
		        noteL C5,12
		        noteL G5,18
		        noteL F5,6
		  vibrato 03Fh
		  sustain
		        noteL B5,222
		  vibrato 030h
		  vol 09h
		        noteL B5,6
		  vol 07h
		  setRelease 01h
		        note  B5
		  vibrato 02Ch
		  inst 13
		  vol 0Ch
		        noteL G5,4
		        note  G5
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  G5
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  E5
		  vol 09h
		        note  E5
		  vol 0Ch
		        noteL F5,48
		  vol 09h
		        noteL F5,8
		  setRelease 05h
		  inst 27
		  vol 0Ah
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  D4
		        note  D4
		        note  D4
		        note  E4
		        note  E4
		  setRelease 01h
		        noteL F4,12
		  vol 06h
		        noteL F4,6
		  vol 04h
		        note  F4
		        waitL 12
		  inst 20
		  vol 0Bh
		        noteL E4,6
		        note  E4
		        noteL E4,36
		  vol 07h
		        noteL E4,6
		  vol 0Bh
		        note  F4
		        noteL D4,96
		  inst 16
		  vol 0Bh
		        noteL F5,6
		        note  E5
		        noteL F5,54
		  vol 08h
		        noteL F5,6
		  vol 0Bh
		        noteL F5,4
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		  sustain
		        noteL D5,96
		  vol 08h
		        noteL D5,6
		  setRelease 01h
		  vol 06h
		        note  D5
		repeatStart
		  inst 27
		  vol 0Bh
		        noteL A3,12
		        noteL As3,6
		  vol 07h
		        note  As3
		  vol 0Bh
		        note  G4
		  vol 07h
		        note  G4
		  vol 0Bh
		        noteL F4,36
		        noteL D4,6
		  vol 07h
		        note  D4
		  vol 0Bh
		        note  Ds4
		  vol 07h
		        note  Ds4
		  vol 0Bh
		        noteL C5,24
		        noteL As4,6
		  vol 07h
		        note  As4
		  vol 0Bh
		        noteL A4,24
		        noteL D4,18
		        noteL Ds4,6
		  inst 20
		  vol 0Bh
		        note  F4
		  vol 08h
		        note  F4
		  vol 06h
		        note  F4
		        wait
		  vol 0Bh
		        noteL F4,12
		  vol 08h
		        noteL F4,6
		  vol 0Bh
		        note  F4
		        note  G4
		  vol 08h
		        note  G4
		  vol 0Bh
		        noteL G4,24
		        noteL G4,6
		  vol 08h
		        note  G4
		  vol 0Bh
		        note  Gs4
		  vol 08h
		        note  Gs4
		  vol 0Bh
		        noteL Gs4,24
		        noteL Gs4,6
		  vol 08h
		        note  Gs4
		  vol 0Bh
		        note  G4
		        note  F4
		        noteL G4,36
		  vol 08h
		        noteL G4,6
		  vol 06h
		        note  G4
		  inst 26
		repeatSection1Start
		  vol 0Ch
		        noteL A4,12
		        note  As4
		        note  G5
		        note  F5
		        note  D5
		        noteL Ds5,6
		  vol 09h
		        note  Ds5
		  vol 07h
		        note  Ds5
		  vol 0Ch
		        note  As5
		        noteL C6,36
		        noteL As5,12
		        noteL A5,48
		  vol 09h
		        noteL A5,6
		  vol 07h
		        note  A5
		  vol 0Ch
		        noteL F3,12
		        note  Fs3
		        note  Ds4
		        noteL D4,36
		        noteL C4,12
		        note  C4
		        noteL As3,24
		        noteL As3,6
		        note  A3
		        note  As3
		  vol 09h
		        note  As3
		  vol 0Ch
		        noteL G3,12
		        note  A3
		        note  As3
		        note  D4
		        noteL C4,24
		        note  G4
		        noteL G4,12
		        note  F4
		        note  E4
		        noteL G4,6
		  vol 09h
		        note  G4
		  vol 0Ch
		        noteL F4,84
		  vol 09h
		        noteL F4,6
		  vol 07h
		        note  F4
		repeatEnd
		repeatSection2Start
		  vol 0Dh
		        noteL A3,12
		        note  As3
		        note  G4
		        note  F4
		        note  D4
		        noteL Ds4,6
		  vol 0Ah
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 0Dh
		        note  As4
		        noteL C5,36
		        noteL As4,12
		        noteL A4,36
		  inst 13
		  vol 0Ch
		        noteL As4,6
		        note  C5
		        noteL Cs5,30
		  vol 09h
		        noteL Cs5,6
		  vol 0Ch
		        note  Cs5
		        note  Cs5
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  As4
		  vol 09h
		        note  As4
		  vol 0Ch
		        note  Gs4
		  vol 09h
		        note  Gs4
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  As4
		  vol 09h
		        note  As4
		  vol 0Ch
		        note  F4
		  vol 09h
		        note  F4
		  vol 0Ch
		        noteL As4,60
		  vol 09h
		        noteL As4,6
		  vol 07h
		        note  As4
		  vol 0Ch
		        noteL F5,30
		  vol 09h
		        noteL F5,6
		  vol 0Ch
		        note  F5
		        note  F5
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 0Ch
		        note  Cs5
		  vol 09h
		        note  Cs5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 0Ch
		        note  Cs5
		  vol 09h
		        note  Cs5
		  vol 0Ch
		        note  Gs5
		  vol 09h
		        note  Gs5
		  vol 0Ch
		        noteL Fs5,72
		  vol 09h
		        noteL Fs5,6
		  vol 07h
		        note  Fs5
		  vol 05h
		        note  Fs5
		        waitL 30
		  inst 7
		  vol 09h
		        noteL E4,24
		        note  Fs4
		        noteL Gs4,60
		        noteL Fs4,12
		        note  E4
		        note  Cs4
		        noteL Ds4,72
		        noteL Fs4,24
		  sustain
		        noteL B4,120
		  vol 07h
		        noteL B4,6
		  vol 05h
		        note  B4
		  setRelease 01h
		  vol 03h
		        note  B4
		        wait
		  inst 9
		  vol 0Ah
		        noteL D4,24
		        note  E4
		        noteL Fs4,60
		        noteL B4,12
		        note  Cs5
		        note  D5
		        noteL Cs5,72
		        noteL A4,24
		        noteL B4,68
		  inst 26
		  vol 0Ch
		  sustain
		        noteL Gs3,4
		        note  A3
		        note  B3
		        note  Cs4
		        note  Ds4
		        note  E4
		  setRelease 01h
		        note  Fs4
		  vol 0Dh
		  sustain
		        noteL Gs4,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs5,40
		  noSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		        noteL E5,24
		        noteL Gs4,72
		        noteL Gs4,12
		        note  Fs4
		        note  Gs4
		        note  A4
		        noteL E4,36
		        noteL Fs4,12
		        noteL Gs4,96
		  sustain
		        noteL Gs4,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs5,40
		  noSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		  sustain
		        noteL E5,20
		  setRelease 01h
		  setSlide 035h
		        noteL Cs6,40
		  noSlide
		        noteL B5,12
		        note  Gs5
		        note  E5
		  inst 20
		  vol 0Ch
		        noteL Cs5,6
		        note  Ds5
		        noteL E5,18
		  vol 09h
		        noteL E5,6
		  vol 0Ch
		        note  E5
		  vol 09h
		        note  E5
		  vol 0Ch
		        note  Ds5
		        note  E5
		        noteL Fs5,24
		  sustain
		        noteL B4,4
		        note  Cs5
		  setRelease 01h
		        note  Ds5
		        noteL E5,6
		        note  Fs5
		        note  Gs5
		  vol 09h
		        note  Gs5
		  vol 0Ch
		        noteL A5,48
		  inst 26
		  vol 0Ch
		  sustain
		        noteL C5,4
		        note  D5
		        note  E5
		        note  F5
		        note  G5
		  setRelease 01h
		        note  A5
		countedLoopStart 1
		  inst 26
		  vol 0Dh
		        noteL As5,6
		  vol 0Ah
		        note  As5
		  vol 0Dh
		        note  As5
		  vol 0Ah
		        note  As5
		  vol 0Dh
		        note  C6
		  vol 0Ah
		        note  C6
		  vol 08h
		        note  C6
		  vol 06h
		        note  C6
		        waitL 12
		  vol 0Dh
		        noteL G5,6
		  vol 0Ah
		        note  G5
		  vol 0Dh
		        note  G5
		  vol 0Ah
		        note  G5
		  vol 0Dh
		        note  A5
		  vol 0Ah
		        note  A5
		  vol 08h
		        note  A5
		  vol 06h
		        note  A5
		        waitL 24
		  vol 0Dh
		        noteL F5,6
		  vol 0Ah
		        note  F5
		  vol 0Dh
		        note  F5
		  vol 0Ah
		        note  F5
		  vol 0Dh
		        note  F5
		  vol 0Ah
		        note  F5
		  vol 0Dh
		        note  G5
		  vol 0Ah
		        note  G5
		  vol 0Dh
		        note  Ds5
		  vol 0Ah
		        note  Ds5
		  vol 0Dh
		        note  C5
		  vol 0Ah
		        note  C5
		  vol 0Dh
		        note  C5
		  vol 0Ah
		        note  C5
		  vol 08h
		        note  C5
		  vol 06h
		        note  C5
		  inst 13
		  vol 0Dh
		        note  F3
		  vol 0Ah
		        note  F3
		  vol 0Dh
		        note  C4
		  vol 0Ah
		        note  C4
		  vol 0Dh
		        note  F4
		  vol 0Ah
		        note  F4
		  vol 0Dh
		        noteL Ds4,24
		  vol 0Ah
		        noteL Ds4,6
		  vol 08h
		        note  Ds4
		  vol 0Dh
		        note  C4
		  vol 0Ah
		        note  C4
		  vol 0Dh
		        note  Ds4
		  vol 0Ah
		        note  Ds4
		  vol 0Dh
		        note  As4
		  vol 0Ah
		        note  As4
		  vol 0Dh
		        noteL A4,48
		countedLoopEnd
		  vol 0Ah
		        noteL A4,6
		  vol 08h
		        note  A4
		        waitL 24
		  vol 0Ch
		        noteL G5,4
		        note  G5
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  G5
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  E5
		  vol 09h
		        note  E5
		  sustain
		  vol 0Ch
		        noteL F5,216
		  vol 09h
		        noteL F5,8
		  vol 07h
		        note  F5
		  setRelease 01h
		  vol 05h
		        note  F5
		  inst 0
		  vol 0Ch
		        noteL A2,24
		        note  As2
		        note  F3
		        noteL E3,72
		        noteL C3,24
		        noteL D3,12
		        note  F3
		  sustain
		        note  A3
		  vol 09h
		        noteL A3,6
		  setRelease 01h
		  vol 07h
		        note  A3
		        waitL 156
		  vol 0Ch
		        noteL A2,12
		        note  As2
		        note  F3
		        noteL E3,36
		        noteL C3,12
		        noteL D3,18
		        noteL A3,6
		  sustain
		        noteL C4,12
		  vol 09h
		        noteL C4,6
		  vol 07h
		  setRelease 01h
		        note  C4
		        waitL 36
		  vol 0Ch
		        noteL A2,12
		        note  As2
		        note  F3
		        note  E3
		        note  C3
		        note  D3
		        note  A3
		        noteL G3,18
		        noteL E3,6
		        noteL F3,12
		        noteL C4,24
		        noteL As3,12
		  vol 0Ch
		  sustain
		        note  E4
		  vol 09h
		        noteL E4,6
		  setRelease 01h
		  vol 07h
		        note  E4
		        waitL 12
		  vol 0Ch
		        note  F3
		        note  C4
		        note  As3
		  sustain
		        note  E4
		  vol 09h
		        noteL E4,6
		  vol 07h
		  setRelease 01h
		        note  E4
		        waitL 12
		  inst 26
		  vol 0Ch
		        note  F4
		        noteL C5,18
		        noteL As4,6
		  inst 15
		  vol 0Ch
		        noteL E5,52
		  inst 26
		  vol 0Ch
		        noteL D5,4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A3
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		        note  D5
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		        note  D5
		        note  E5
		  inst 20
		countedLoopStart 1
		  vol 0Ch
		        noteL F5,6
		  vol 09h
		        note  F5
		  vol 07h
		        note  F5
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Ch
		        noteL F5,6
		  vol 09h
		        note  F5
		  vol 07h
		        note  F5
		        wait
		countedLoopEnd
		  vol 0Ch
		        noteL F5,6
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 07h
		        note  F5
		        wait
		  vol 0Ch
		        note  F5
		        note  F5
		        note  F5
		  vol 09h
		        note  F5
		  vol 07h
		        note  F5
		        wait
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 07h
		        note  F5
		        waitL 18
		  vol 0Ch
		        noteL F5,6
		  vol 09h
		        note  F5
		  vol 07h
		        note  F5
		        wait
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 07h
		        note  F5
		        wait
		  vol 0Ch
		        note  F5
		        note  F5
		  vol 0Ch
		        note  As5
		  vol 09h
		        note  As5
		  vol 0Ch
		        note  As3
		        note  As3
		        note  As3
		  vol 09h
		        note  As3
		  vol 0Ch
		        note  As3
		        note  As3
		        note  As3
		  vol 09h
		        note  As3
		  vol 07h
		        note  As3
		  vol 05h
		        note  As3
		        waitL 24
		channel_end
Music_41_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 120
		  inst 16
		countedLoopStart 2
		  vol 09h
		        noteL B5,5
		  vol 05h
		        noteL B5,3
		countedLoopEnd
		  sustain
		  vol 09h
		        noteL A5,48
		  vibrato 020h
		  vol 07h
		        noteL A5,6
		  vol 05h
		        note  A5
		  setRelease 01h
		  vol 03h
		        note  A5
		        waitL 102
		  vibrato 02Ch
		  vol 09h
		        noteL D6,18
		        noteL E6,4
		        waitL 2
		  vol 08h
		  sustain
		        noteL E6,36
		  vol 06h
		        noteL E6,6
		  vol 04h
		  setRelease 01h
		        note  E6
		  inst 9
		  vol 08h
		        noteL C4,24
		        note  D4
		        note  E4
		        note  F4
		        note  G4
		        note  A4
		        note  B4
		  sustain
		        note  C5
		  vol 07h
		        noteL C5,6
		  vol 05h
		        note  C5
		  vol 03h
		  setRelease 01h
		        note  C5
		        wait
		  inst 16
		countedLoopStart 2
		  vol 08h
		        noteL F6,5
		  vol 05h
		        noteL F6,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL D6,48
		  vol 05h
		        noteL D6,6
		  vol 03h
		        note  D6
		  setRelease 01h
		  vol 01h
		        note  D6
		        wait
		countedLoopStart 2
		  vol 08h
		        noteL F6,5
		  vol 05h
		        noteL F6,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL D6,48
		  vol 05h
		        noteL D6,5
		  vol 03h
		        note  D6
		  vol 01h
		  setRelease 01h
		        note  D6
		        waitL 10
		  vol 08h
		        noteL F6,5
		  vol 05h
		        noteL F6,4
		  vol 08h
		        noteL F6,6
		  vol 05h
		        noteL F6,4
		  vol 08h
		        noteL F6,7
		  vol 05h
		        noteL F6,4
		  vol 08h
		        noteL D6,59
		  sustain
		        noteL Ds6,132
		  vol 06h
		        noteL Ds6,6
		  setRelease 01h
		  vol 04h
		        note  Ds6
		  inst 13
		  vol 0Ch
		        noteL E5,4
		        note  E5
		  vol 09h
		        note  E5
		  vol 0Ch
		        note  E5
		  vol 09h
		        note  E5
		  vol 0Ch
		        note  D5
		  vol 09h
		        note  D5
		        waitL 8
		  vol 0Ch
		        noteL E5,48
		  vol 09h
		        noteL E5,8
		  setRelease 05h
		  inst 27
		  vol 0Ah
		        note  E3
		        note  E3
		        note  E3
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  C4
		        note  C4
		  setRelease 01h
		        noteL D4,12
		  vol 06h
		        noteL D4,6
		  vol 04h
		        note  D4
		        waitL 12
		  inst 20
		  vol 0Ah
		        noteL D4,6
		        note  D4
		        noteL D4,36
		  vol 06h
		        noteL D4,6
		  vol 0Ah
		        note  D4
		        noteL C4,96
		  inst 16
		  vol 0Bh
		        noteL D5,66
		  vol 08h
		        noteL D5,6
		  vol 0Bh
		        noteL D5,4
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		  inst 9
		  vol 0Ah
		        noteL E4,6
		  sustain
		        noteL F4,90
		  vol 08h
		        noteL F4,6
		  vol 06h
		  setRelease 01h
		        note  F4
		        waitL 180
		repeatStart
		  inst 20
		  vol 0Bh
		        noteL D4,6
		  vol 08h
		        note  D4
		  vol 06h
		        note  D4
		        wait
		  vol 0Bh
		        noteL D4,12
		  vol 08h
		        noteL D4,6
		  vol 0Bh
		        note  D4
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 0Bh
		        noteL Ds4,24
		        noteL Ds4,6
		  vol 08h
		        note  Ds4
		  vol 0Bh
		        note  F4
		  vol 08h
		        note  F4
		  vol 0Bh
		        noteL F4,24
		        noteL F4,6
		  vol 08h
		        note  F4
		  vol 0Bh
		        note  Ds4
		        note  Ds4
		        noteL Ds4,36
		  vol 08h
		        noteL Ds4,6
		  vol 06h
		        note  Ds4
		        waitL 84
		repeatSection1Start
		        waitL 72
		  inst 38
		  vol 0Bh
		  sustain
		        noteL F5,4
		        note  Fs5
		        note  G5
		        note  A5
		        note  As5
		  setRelease 01h
		        note  C6
		  inst 47
		  vol 0Bh
		        noteL D6,60
		        noteL F5,12
		        note  Fs5
		        noteL Ds6,36
		        noteL D6,48
		        noteL C6,24
		        noteL As5,72
		        noteL C6,12
		        note  D6
		        noteL C6,54
		  inst 26
		  vol 0Bh
		        noteL As5,6
		        note  A5
		        note  F5
		        note  Ds5
		        note  C5
		        note  As4
		        note  A4
		        waitL 192
		repeatEnd
		repeatSection2Start
		        waitL 96
		  inst 13
		  vol 0Ah
		        noteL As3,48
		        note  Fs3
		        noteL F3,12
		  vol 07h
		        noteL F3,6
		  vol 05h
		        note  F3
		  vol 0Ah
		        noteL F3,72
		        noteL As3,48
		        note  Gs3
		        noteL Fs3,12
		  vol 07h
		        noteL Fs3,6
		  vol 05h
		        note  Fs3
		  vol 0Ah
		        noteL Fs3,36
		  inst 38
		  vol 0Dh
		        noteL Cs4,12
		        note  B3
		        note  As3
		        noteL Gs3,36
		        noteL Fs3,6
		        note  Gs3
		        noteL Cs3,72
		        noteL Ds3,24
		        note  E3
		        note  Gs3
		        noteL Fs3,36
		        noteL B3,6
		  vol 0Ah
		        note  B3
		  vol 0Dh
		        noteL Fs3,144
		  inst 20
		  vol 0Bh
		        noteL Fs3,30
		  vol 08h
		        noteL Fs3,6
		  vol 0Bh
		        note  E3
		        note  Fs3
		        noteL B2,64
		  vol 08h
		        noteL B2,8
		  vol 0Bh
		        noteL Cs3,16
		  vol 08h
		        noteL Cs3,8
		  vol 0Bh
		        noteL D3,16
		  vol 08h
		        noteL D3,8
		  vol 0Bh
		        noteL Fs3,16
		  vol 08h
		        noteL Fs3,8
		  vol 0Bh
		        noteL E3,30
		  vol 08h
		        noteL E3,6
		  vol 0Bh
		        note  A3
		  vol 08h
		        note  A3
		  vol 0Bh
		        noteL E3,42
		  vol 08h
		        noteL E3,6
		  vol 0Bh
		        noteL Fs3,30
		  vol 08h
		        noteL Fs3,6
		  vol 0Bh
		        note  B3
		  vol 08h
		        note  B3
		  vol 0Bh
		        noteL Fs3,48
		  vol 08h
		        noteL Fs3,6
		  vol 06h
		        note  Fs3
		        waitL 12
		  inst 27
		  vol 09h
		        noteL Fs3,24
		        note  Gs3
		        note  A3
		        noteL B3,36
		        noteL E4,6
		  vol 05h
		        note  E4
		  sustain
		  vol 09h
		        noteL B3,54
		  vol 05h
		        noteL B3,6
		  setRelease 01h
		  vol 03h
		        note  B3
		        wait
		  vol 09h
		        noteL D4,24
		        note  Cs4
		        note  B3
		        noteL B3,36
		        noteL Cs4,6
		  vol 05h
		        note  Cs4
		  sustain
		  vol 09h
		        noteL Cs4,54
		  vol 05h
		        noteL Cs4,6
		  vol 03h
		  setRelease 01h
		        note  Cs4
		        wait
		  vol 09h
		        noteL Fs3,24
		        note  D4
		        note  B3
		        note  Cs4
		        noteL E4,48
		  sustain
		        noteL Gs4,24
		  vol 05h
		        noteL Gs4,6
		  vol 03h
		  setRelease 01h
		        note  Gs4
		        waitL 12
		  inst 13
		  vol 0Ch
		        noteL E5,24
		  vol 09h
		        noteL E5,6
		  vol 07h
		        note  E5
		        waitL 12
		  vol 0Ch
		        noteL Fs5,24
		  vol 0Ch
		        noteL Gs5,6
		  vol 09h
		        note  Gs5
		  vol 07h
		        note  Gs5
		        wait
		  vol 0Ch
		        noteL Fs5,60
		  vol 09h
		        noteL Fs5,6
		  vol 07h
		        note  Fs5
		countedLoopStart 1
		  inst 26
		  vol 0Ch
		        noteL D5,6
		  vol 09h
		        note  D5
		  vol 0Ch
		        note  D5
		  vol 09h
		        note  D5
		  vol 0Ch
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 07h
		        note  Ds5
		  vol 05h
		        note  Ds5
		        waitL 12
		  vol 0Ch
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 0Ch
		        note  As4
		  vol 09h
		        note  As4
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 07h
		        note  C5
		  vol 05h
		        note  C5
		        waitL 24
		  vol 0Ch
		        noteL A4,6
		  vol 09h
		        note  A4
		  vol 0Ch
		        note  A4
		  vol 09h
		        note  A4
		  vol 0Ch
		        note  A4
		  vol 09h
		        note  A4
		  vol 0Ch
		        note  As4
		  vol 09h
		        note  As4
		  vol 0Ch
		        note  G4
		  vol 09h
		        note  G4
		  vol 0Ch
		        note  Ds4
		  vol 09h
		        note  Ds4
		  vol 0Ch
		        note  Ds4
		  vol 09h
		        note  Ds4
		  vol 07h
		        note  Ds4
		  vol 05h
		        note  Ds4
		        waitL 24
		  inst 3
		  vol 0Dh
		        noteL C3,6
		  vol 0Ah
		        note  C3
		  vol 0Dh
		        note  Ds3
		  vol 0Ah
		        note  Ds3
		  vol 0Dh
		        note  As3
		  vol 0Ah
		        note  As3
		  vol 0Dh
		        noteL A3,24
		  vol 0Ah
		        noteL A3,6
		  vol 08h
		        note  A3
		  vol 0Dh
		        note  F3
		  vol 0Ah
		        note  F3
		  vol 0Dh
		        note  C4
		  vol 0Ah
		        note  C4
		  vol 0Dh
		        note  F4
		  vol 0Ah
		        note  F4
		  vol 0Dh
		        noteL Ds4,24
		countedLoopEnd
		  vol 0Ah
		        noteL Ds4,6
		  vol 08h
		        note  Ds4
		        waitL 24
		  inst 13
		  vol 0Ch
		        noteL E5,4
		        note  E5
		  vol 09h
		        note  E5
		  vol 0Ch
		        note  E5
		  vol 09h
		        note  E5
		  vol 0Ch
		        note  D5
		  vol 09h
		        note  D5
		        waitL 8
		  sustain
		  vol 0Ch
		        noteL E5,216
		  vol 09h
		        noteL E5,8
		  vol 07h
		        note  E5
		  setRelease 01h
		  vol 05h
		        note  E5
		        waitL 192
		  inst 20
		  sustain
		  vol 0Ch
		        noteL A4,6
		  vol 09h
		        note  A4
		  vol 07h
		        note  A4
		  setRelease 01h
		  vol 05h
		        note  A4
		        waitL 132
		        wait
		  vol 0Ch
		  sustain
		        noteL C5,6
		  vol 09h
		        note  C5
		  vol 07h
		        note  C5
		  vol 05h
		  setRelease 01h
		        note  C5
		        waitL 192
		  sustain
		  vol 0Ch
		        noteL E5,6
		  vol 09h
		        note  E5
		  vol 07h
		        note  E5
		  vol 05h
		  setRelease 01h
		        note  E5
		        waitL 48
		  sustain
		  vol 0Ch
		        noteL E5,6
		  vol 09h
		        note  E5
		  vol 07h
		        note  E5
		  vol 05h
		  setRelease 01h
		        note  E5
		        waitL 48
		  vol 0Ch
		  sustain
		        noteL E5,192
		  setRelease 01h
		        noteL E5,96
		countedLoopStart 1
		  vol 0Bh
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 06h
		        note  C5
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Bh
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 06h
		        note  C5
		        wait
		countedLoopEnd
		  vol 0Bh
		        noteL As4,6
		  vol 08h
		        note  As4
		  vol 0Bh
		        note  As4
		  vol 08h
		        note  As4
		  vol 06h
		        note  As4
		        wait
		  vol 0Bh
		        note  B4
		        note  B4
		        note  B4
		  vol 08h
		        note  B4
		  vol 06h
		        note  B4
		        wait
		  vol 0Bh
		        note  B4
		  vol 08h
		        note  B4
		  vol 06h
		        note  B4
		        waitL 18
		  vol 0Bh
		        noteL Cs5,6
		  vol 08h
		        note  Cs5
		  vol 06h
		        note  Cs5
		        wait
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 06h
		        note  Cs5
		        wait
		  vol 0Bh
		        note  Cs5
		        note  Cs5
		  vol 0Bh
		        note  D5
		  vol 08h
		        note  D5
		  vol 0Bh
		        note  As2
		        note  As2
		        note  As2
		  vol 08h
		        note  As2
		  vol 0Bh
		        note  As2
		        note  As2
		        note  As2
		  vol 08h
		        note  As2
		  vol 06h
		        note  As2
		  vol 04h
		        note  As2
		        waitL 24
		channel_end
Music_41_Channel_3:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 120
		  inst 16
		countedLoopStart 2
		  vol 09h
		        noteL G5,5
		  vol 05h
		        noteL G5,3
		countedLoopEnd
		  sustain
		  vol 09h
		        noteL F5,48
		  vibrato 020h
		  vol 07h
		        noteL F5,6
		  vol 05h
		        note  F5
		  vol 03h
		  setRelease 01h
		        note  F5
		        waitL 102
		  vibrato 02Ch
		  vol 09h
		        noteL B5,18
		        noteL C6,4
		        waitL 2
		  vol 08h
		  sustain
		        noteL C6,36
		  vol 06h
		        noteL C6,6
		  vol 04h
		  setRelease 01h
		        note  C6
		  inst 9
		  vol 08h
		        noteL A3,24
		        note  B3
		        note  C4
		        note  D4
		        note  E4
		        note  F4
		        note  G4
		  sustain
		        note  A4
		  vol 07h
		        noteL A4,6
		  vol 05h
		        note  A4
		  setRelease 01h
		  vol 03h
		        note  A4
		        wait
		  inst 16
		countedLoopStart 2
		  vol 08h
		        noteL A5,5
		  vol 05h
		        noteL A5,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL F5,48
		  vol 05h
		        noteL F5,6
		  vol 03h
		        note  F5
		  setRelease 01h
		  vol 01h
		        note  F5
		        wait
		countedLoopStart 2
		  vol 08h
		        noteL A5,5
		  vol 05h
		        noteL A5,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL F5,48
		  vol 05h
		        noteL F5,5
		  vol 03h
		        note  F5
		  vol 01h
		  setRelease 01h
		        note  F5
		        waitL 10
		  vol 08h
		        noteL A5,5
		  vol 05h
		        noteL A5,4
		  vol 08h
		        noteL A5,6
		  vol 05h
		        noteL A5,4
		  vol 08h
		        noteL A5,7
		  vol 05h
		        noteL A5,4
		  vol 08h
		        noteL F5,59
		  sustain
		        noteL G5,132
		  vol 06h
		        noteL G5,6
		  vol 04h
		  setRelease 01h
		        note  G5
		  inst 13
		  vol 0Ch
		        noteL C5,4
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		        waitL 8
		  vol 0Ch
		        noteL C5,48
		  vol 09h
		        noteL C5,8
		        wait
		  shifting 020h
		  stereo 080h
		  setRelease 05h
		  inst 27
		  vol 09h
		        note  E3
		        note  E3
		        note  E3
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  C4
		        note  C4
		  setRelease 01h
		        noteL D4,12
		  vol 05h
		        noteL D4,6
		  vol 03h
		        note  D4
		        waitL 10
		  inst 20
		  vol 0Ah
		        noteL D4,6
		        note  D4
		        noteL D4,36
		  vol 06h
		        noteL D4,6
		  vol 0Ah
		        note  D4
		        noteL C4,96
		  inst 16
		  vol 0Ah
		        noteL D5,66
		  vol 07h
		        noteL D5,6
		  vol 0Ah
		        noteL D5,4
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		  inst 9
		  vol 09h
		        noteL E4,6
		  sustain
		        noteL F4,90
		  vol 07h
		        noteL F4,6
		  vol 05h
		  setRelease 01h
		        note  F4
		        waitL 174
		repeatStart
		  stereo 0C0h
		  shifting 00h
		  inst 20
		  vol 0Bh
		        noteL As3,6
		  vol 08h
		        note  As3
		  vol 06h
		        note  As3
		        wait
		  vol 0Bh
		        noteL As3,12
		  vol 08h
		        noteL As3,6
		  vol 0Bh
		        note  As3
		        note  C4
		  vol 08h
		        note  C4
		  vol 0Bh
		        noteL C4,24
		        noteL C4,6
		  vol 08h
		        note  C4
		  vol 0Bh
		        note  Cs4
		  vol 08h
		        note  Cs4
		  vol 0Bh
		        noteL Cs4,24
		        noteL Cs4,6
		  vol 08h
		        note  Cs4
		  vol 0Bh
		        note  C4
		        note  C4
		        noteL C4,36
		  vol 08h
		        noteL C4,6
		  vol 06h
		        note  C4
		        waitL 84
		repeatSection1Start
		        waitL 80
		  stereo 080h
		  shifting 020h
		  inst 38
		  vol 0Ah
		  sustain
		        noteL F5,4
		        note  Fs5
		        note  G5
		        note  A5
		        note  As5
		  setRelease 01h
		        note  C6
		  inst 47
		  vol 0Ah
		        noteL D6,58
		        noteL F5,12
		        note  Fs5
		        noteL Ds6,36
		        noteL D6,48
		        noteL C6,24
		        noteL As5,72
		        noteL C6,12
		        note  D6
		        noteL C6,54
		  inst 26
		  vol 0Ah
		        noteL As5,6
		        note  A5
		        note  F5
		        note  Ds5
		        note  C5
		        note  As4
		        note  A4
		        waitL 186
		repeatEnd
		repeatSection2Start
		        waitL 96
		  inst 13
		  vol 0Ah
		        noteL F4,48
		        note  Ds4
		        noteL D4,12
		  vol 07h
		        noteL D4,6
		  vol 05h
		        note  D4
		  vol 0Ah
		        noteL D4,72
		        noteL Fs4,48
		        note  F4
		        noteL Ds4,12
		  vol 07h
		        noteL Ds4,6
		  vol 05h
		        note  Ds4
		  vol 0Ah
		        noteL B3,42
		  stereo 080h
		  shifting 020h
		  inst 38
		  vol 0Ch
		        noteL Cs4,12
		        note  B3
		        note  As3
		        noteL Gs3,36
		        noteL Fs3,6
		        note  Gs3
		        noteL Cs3,72
		        noteL Ds3,24
		        note  E3
		        note  Gs3
		        noteL Fs3,36
		        noteL B3,6
		  vol 09h
		        note  B3
		  vol 0Ch
		        noteL Fs3,144
		  inst 20
		  vol 0Ah
		        noteL Fs3,30
		  vol 07h
		        noteL Fs3,6
		  vol 0Ah
		        note  E3
		        note  Fs3
		        noteL B2,64
		  vol 07h
		        noteL B2,8
		  vol 0Ah
		        noteL Cs3,16
		  vol 07h
		        noteL Cs3,8
		  vol 0Ah
		        noteL D3,16
		  vol 07h
		        noteL D3,8
		  vol 0Ah
		        noteL Fs3,16
		  vol 07h
		        noteL Fs3,8
		  vol 0Ah
		        noteL E3,30
		  vol 07h
		        noteL E3,6
		  vol 0Ah
		        note  A3
		  vol 07h
		        note  A3
		  vol 0Ah
		        noteL E3,42
		  vol 07h
		        noteL E3,6
		  vol 0Ah
		        noteL Fs3,30
		  vol 07h
		        noteL Fs3,6
		  vol 0Ah
		        note  B3
		  vol 07h
		        note  B3
		  vol 0Ah
		        noteL Fs3,48
		  vol 07h
		        noteL Fs3,6
		  vol 05h
		        note  Fs3
		        waitL 12
		  inst 27
		  vol 08h
		        noteL Fs3,24
		        note  Gs3
		        note  A3
		        noteL B3,36
		        noteL E4,6
		  vol 04h
		        note  E4
		  sustain
		  vol 09h
		        noteL B3,54
		  vol 04h
		        noteL B3,6
		  setRelease 01h
		  vol 02h
		        note  B3
		        wait
		  vol 08h
		        noteL D4,24
		        note  Cs4
		        note  B3
		        noteL B3,36
		        noteL Cs4,6
		  vol 04h
		        note  Cs4
		  sustain
		  vol 08h
		        noteL Cs4,54
		  vol 04h
		        noteL Cs4,6
		  vol 02h
		  setRelease 01h
		        note  Cs4
		        wait
		  vol 08h
		        noteL Fs3,24
		        note  D4
		        note  B3
		        note  Cs4
		        noteL E4,48
		  sustain
		        noteL Gs4,24
		  vol 04h
		        noteL Gs4,6
		  vol 02h
		  setRelease 01h
		        note  Gs4
		        wait
		  shifting 00h
		  stereo 0C0h
		  inst 13
		  vol 0Ch
		        noteL Cs5,24
		  vol 09h
		        noteL Cs5,6
		  vol 07h
		        note  Cs5
		        waitL 12
		  vol 0Ch
		        noteL Ds5,24
		  vol 0Ch
		        noteL E5,6
		  vol 09h
		        note  E5
		  vol 07h
		        note  E5
		        wait
		  vol 0Ch
		        noteL D5,60
		  vol 09h
		        noteL D5,6
		  vol 07h
		        note  D5
		        wait
		  stereo 080h
		  shifting 020h
		countedLoopStart 1
		  inst 26
		  vol 0Bh
		        noteL D5,6
		  vol 08h
		        note  D5
		  vol 0Bh
		        note  D5
		  vol 08h
		        note  D5
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		  vol 04h
		        note  Ds5
		        waitL 12
		  vol 0Bh
		        noteL As4,6
		  vol 08h
		        note  As4
		  vol 0Bh
		        note  As4
		  vol 08h
		        note  As4
		  vol 0Bh
		        note  C5
		  vol 08h
		        note  C5
		  vol 06h
		        note  C5
		  vol 04h
		        note  C5
		        waitL 24
		  vol 0Bh
		        noteL A4,6
		  vol 08h
		        note  A4
		  vol 0Bh
		        note  A4
		  vol 08h
		        note  A4
		  vol 0Bh
		        note  A4
		  vol 08h
		        note  A4
		  vol 0Bh
		        note  As4
		  vol 08h
		        note  As4
		  vol 0Bh
		        note  G4
		  vol 08h
		        note  G4
		  vol 0Bh
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 0Bh
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 06h
		        note  Ds4
		  vol 04h
		        note  Ds4
		        waitL 24
		  inst 3
		  vol 0Ch
		        noteL C3,6
		  vol 09h
		        note  C3
		  vol 0Ch
		        note  Ds3
		  vol 09h
		        note  Ds3
		  vol 0Ch
		        note  As3
		  vol 09h
		        note  As3
		  vol 0Ch
		        noteL A3,24
		  vol 09h
		        noteL A3,6
		  vol 07h
		        note  A3
		  vol 0Ch
		        note  F3
		  vol 09h
		        note  F3
		  vol 0Ch
		        note  C4
		  vol 09h
		        note  C4
		  vol 0Ch
		        note  F4
		  vol 09h
		        note  F4
		  vol 0Ch
		        noteL Ds4,24
		countedLoopEnd
		  vol 09h
		        noteL Ds4,6
		  vol 07h
		        note  Ds4
		        waitL 18
		  stereo 0C0h
		  shifting 00h
		  inst 13
		  vol 0Ch
		        noteL C5,4
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		        waitL 8
		  sustain
		  vol 0Ch
		        noteL C5,216
		  vol 09h
		        noteL C5,8
		  vol 07h
		        note  C5
		  vol 05h
		  setRelease 01h
		        note  C5
		        waitL 198
		  shifting 020h
		  stereo 080h
		  inst 20
		  sustain
		  vol 0Bh
		        noteL A4,6
		  vol 08h
		        note  A4
		  vol 06h
		        note  A4
		  setRelease 01h
		  vol 04h
		        note  A4
		        waitL 132
		        wait
		  vol 0Bh
		  sustain
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 06h
		        note  C5
		  vol 04h
		  setRelease 01h
		        note  C5
		        waitL 192
		  sustain
		  vol 0Bh
		        noteL E5,6
		  vol 08h
		        note  E5
		  vol 06h
		        note  E5
		  vol 04h
		  setRelease 01h
		        note  E5
		        waitL 48
		  sustain
		  vol 0Bh
		        noteL E5,6
		  vol 08h
		        note  E5
		  vol 06h
		        note  E5
		  vol 04h
		  setRelease 01h
		        note  E5
		        waitL 48
		  vol 0Bh
		  sustain
		        noteL E5,186
		  setRelease 01h
		        noteL E5,96
		countedLoopStart 1
		  vol 0Bh
		        noteL As4,6
		  vol 08h
		        note  As4
		  vol 06h
		        note  As4
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Bh
		        noteL Gs4,6
		  vol 08h
		        note  Gs4
		  vol 06h
		        note  Gs4
		        wait
		countedLoopEnd
		  vol 0Bh
		        noteL Fs4,6
		  vol 08h
		        note  Fs4
		  vol 0Bh
		        note  Fs4
		  vol 08h
		        note  Fs4
		  vol 06h
		        note  Fs4
		        wait
		  vol 0Bh
		        note  Gs4
		        note  Gs4
		        note  Gs4
		  vol 08h
		        note  Gs4
		  vol 06h
		        note  Gs4
		        wait
		  vol 0Bh
		        note  Gs4
		  vol 08h
		        note  Gs4
		  vol 06h
		        note  Gs4
		        waitL 18
		  vol 0Bh
		        noteL Gs4,6
		  vol 08h
		        note  Gs4
		  vol 06h
		        note  Gs4
		        wait
		  vol 0Bh
		        note  A4
		  vol 08h
		        note  A4
		  vol 0Bh
		        note  A4
		  vol 08h
		        note  A4
		  vol 06h
		        note  A4
		        wait
		  vol 0Bh
		        note  A4
		        note  A4
		  vol 0Bh
		        note  As4
		  vol 08h
		        note  As4
		  inst 32
		  vol 0Dh
		        note  As2
		        note  As2
		        note  As2
		  vol 0Ah
		        note  As2
		  vol 0Dh
		        note  As2
		        note  As2
		        note  As2
		  vol 0Ah
		        note  As2
		  vol 08h
		        note  As2
		  vol 06h
		        note  As2
		        waitL 24
		channel_end
Music_41_Channel_4:
		  shifting 020h
		  stereo 040h
		  setRelease 01h
		  vibrato 035h
		        waitL 6
		  inst 15
		  vol 00h
		        noteL F2,12
		  vol 0Ah
		        note  E3
		        note  F3
		        note  C4
		        noteL B3,36
		        noteL G3,12
		        note  A3
		        note  C4
		  vibrato 03Ch
		  sustain
		        noteL E4,72
		  vibrato 030h
		  vol 08h
		        noteL E4,6
		  vol 06h
		  setRelease 01h
		        note  E4
		  vol 0Ah
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        noteL A3,18
		        noteL E4,6
		  vibrato 03Ch
		  sustain
		        noteL G4,72
		  vibrato 030h
		  vol 08h
		        noteL G4,6
		  vol 06h
		  setRelease 01h
		        note  G4
		  vol 0Ah
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        note  A3
		        note  E4
		        note  D4
		        note  B3
		        note  C4
		        noteL G4,24
		        noteL F4,12
		  vibrato 03Ch
		  sustain
		        noteL B4,24
		  vibrato 030h
		  vol 08h
		        noteL B4,6
		  vol 06h
		  setRelease 01h
		        note  B4
		  vol 0Ah
		  vibrato 035h
		        noteL C4,12
		        note  G4
		        note  F4
		  vibrato 03Ch
		  sustain
		        noteL B4,48
		  vibrato 030h
		  vol 08h
		        noteL B4,6
		  vol 06h
		  setRelease 01h
		        note  B4
		  vibrato 035h
		  vol 0Ah
		        noteL C4,12
		        noteL G4,18
		        noteL F4,6
		  vibrato 03Ch
		  sustain
		        noteL B4,48
		  vibrato 030h
		  vol 08h
		        noteL B4,6
		  vol 06h
		  setRelease 01h
		        note  B4
		  vol 0Ah
		  vibrato 035h
		        noteL C5,12
		        noteL G5,18
		        noteL F5,6
		  vibrato 03Fh
		  sustain
		        noteL B5,222
		  vibrato 030h
		  vol 08h
		        noteL B5,7
		  vol 06h
		  setRelease 01h
		        note  B5
		  vibrato 02Ch
		  inst 13
		  vol 0Bh
		        noteL G5,4
		        note  G5
		  vol 08h
		        note  G5
		  vol 0Bh
		        note  G5
		  vol 08h
		        note  G5
		  vol 0Bh
		        note  F5
		  vol 08h
		        note  F5
		  vol 0Bh
		        note  E5
		  vol 08h
		        note  E5
		  vol 0Bh
		        noteL F5,48
		  vol 08h
		        noteL F5,8
		  setRelease 05h
		  inst 27
		  vol 09h
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  D4
		        note  D4
		        note  D4
		        note  E4
		        note  E4
		  setRelease 01h
		        noteL F4,12
		  vol 05h
		        noteL F4,6
		  vol 03h
		        note  F4
		        waitL 10
		  inst 20
		  vol 0Ah
		        noteL E4,6
		        note  E4
		        noteL E4,36
		  vol 06h
		        noteL E4,6
		  vol 0Ah
		        note  F4
		        noteL D4,96
		  inst 16
		  vol 0Ah
		        noteL F5,6
		        note  E5
		        noteL F5,54
		  vol 07h
		        noteL F5,6
		  vol 0Ah
		        noteL F5,4
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		  sustain
		        noteL D5,96
		  vol 07h
		        noteL D5,6
		  setRelease 01h
		  vol 05h
		        note  D5
		repeatStart
		  inst 27
		  vol 0Ah
		        noteL A3,12
		        noteL As3,6
		  vol 06h
		        note  As3
		  vol 0Ah
		        note  G4
		  vol 06h
		        note  G4
		  vol 0Ah
		        noteL F4,36
		        noteL D4,6
		  vol 06h
		        note  D4
		  vol 0Ah
		        note  Ds4
		  vol 06h
		        note  Ds4
		  vol 0Ah
		        noteL C5,24
		        noteL As4,6
		  vol 06h
		        note  As4
		  vol 0Ah
		        noteL A4,24
		        noteL D4,18
		        noteL Ds4,6
		  inst 20
		  vol 0Ah
		        note  F4
		  vol 07h
		        note  F4
		  vol 05h
		        note  F4
		        wait
		  vol 0Ah
		        noteL F4,12
		  vol 07h
		        noteL F4,6
		  vol 0Ah
		        note  F4
		        note  G4
		  vol 07h
		        note  G4
		  vol 0Ah
		        noteL G4,24
		        noteL G4,6
		  vol 07h
		        note  G4
		  vol 0Ah
		        note  Gs4
		  vol 07h
		        note  Gs4
		  vol 0Ah
		        noteL Gs4,24
		        noteL Gs4,6
		  vol 07h
		        note  Gs4
		  vol 0Ah
		        note  G4
		        note  F4
		        noteL G4,36
		  vol 07h
		        noteL G4,6
		  vol 05h
		        note  G4
		  inst 26
		repeatSection1Start
		  vol 0Bh
		        noteL A4,12
		        note  As4
		        note  G5
		        note  F5
		        note  D5
		        noteL Ds5,6
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		  vol 0Bh
		        note  As5
		        noteL C6,36
		        noteL As5,12
		        noteL A5,48
		  vol 08h
		        noteL A5,6
		  vol 06h
		        note  A5
		  vol 0Bh
		        noteL F3,12
		        note  Fs3
		        note  Ds4
		        noteL D4,36
		        noteL C4,12
		        note  C4
		        noteL As3,24
		        noteL As3,6
		        note  A3
		        note  As3
		  vol 08h
		        note  As3
		  vol 0Bh
		        noteL G3,12
		        note  A3
		        note  As3
		        note  D4
		        noteL C4,24
		        note  G4
		        noteL G4,12
		        note  F4
		        note  E4
		        noteL G4,6
		  vol 08h
		        note  G4
		  vol 0Bh
		        noteL F4,84
		  vol 08h
		        noteL F4,6
		  vol 06h
		        note  F4
		repeatEnd
		repeatSection2Start
		  vol 0Ch
		        noteL A3,12
		        note  As3
		        note  G4
		        note  F4
		        note  D4
		        noteL Ds4,6
		  vol 09h
		        note  Ds4
		  vol 07h
		        note  Ds4
		  vol 0Ch
		        note  As4
		        noteL C5,36
		        noteL As4,12
		        noteL A4,36
		  inst 13
		  vol 0Bh
		        noteL As4,6
		        note  C5
		        noteL Cs5,30
		  vol 08h
		        noteL Cs5,6
		  vol 0Bh
		        note  Cs5
		        note  Cs5
		        note  C5
		  vol 08h
		        note  C5
		  vol 0Bh
		        note  As4
		  vol 08h
		        note  As4
		  vol 0Bh
		        note  Gs4
		  vol 08h
		        note  Gs4
		  vol 0Bh
		        note  C5
		  vol 08h
		        note  C5
		  vol 0Bh
		        note  As4
		  vol 08h
		        note  As4
		  vol 0Bh
		        note  F4
		  vol 08h
		        note  F4
		  vol 0Bh
		        noteL As4,60
		  vol 08h
		        noteL As4,6
		  vol 06h
		        note  As4
		  vol 0Bh
		        noteL F5,30
		  vol 08h
		        noteL F5,6
		  vol 0Bh
		        note  F5
		        note  F5
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        note  C5
		  vol 08h
		        note  C5
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        note  Gs5
		  vol 08h
		        note  Gs5
		  vol 0Bh
		        noteL Fs5,72
		  vol 08h
		        noteL Fs5,6
		  vol 06h
		        note  Fs5
		  vol 04h
		        note  Fs5
		        waitL 30
		  inst 7
		  vol 08h
		        noteL E4,24
		        note  Fs4
		        noteL Gs4,60
		        noteL Fs4,12
		        note  E4
		        note  Cs4
		        noteL Ds4,72
		        noteL Fs4,24
		  sustain
		        noteL B4,120
		  vol 06h
		        noteL B4,6
		  vol 04h
		        note  B4
		  setRelease 01h
		  vol 02h
		        note  B4
		        wait
		  inst 9
		  vol 09h
		        noteL D4,24
		        note  E4
		        noteL Fs4,60
		        noteL B4,12
		        note  Cs5
		        note  D5
		        noteL Cs5,72
		        noteL A4,24
		        noteL B4,68
		  inst 26
		  vol 0Bh
		  sustain
		        noteL Gs3,4
		        note  A3
		        note  B3
		        note  Cs4
		        note  Ds4
		        note  E4
		  setRelease 01h
		        note  Fs4
		  vol 0Ch
		  sustain
		        noteL Gs4,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs5,40
		  noSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		        noteL E5,24
		        noteL Gs4,72
		        noteL Gs4,12
		        note  Fs4
		        note  Gs4
		        note  A4
		        noteL E4,36
		        noteL Fs4,12
		        noteL Gs4,96
		  sustain
		        noteL Gs4,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs5,40
		  noSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		  sustain
		        noteL E5,20
		  setRelease 01h
		  setSlide 035h
		        noteL Cs6,40
		  noSlide
		        noteL B5,12
		        note  Gs5
		        note  E5
		  inst 20
		  vol 0Bh
		        noteL Cs5,6
		        note  Ds5
		        noteL E5,18
		  vol 08h
		        noteL E5,6
		  vol 0Bh
		        note  E5
		  vol 08h
		        note  E5
		  vol 0Bh
		        note  Ds5
		        note  E5
		        noteL Fs5,24
		  sustain
		        noteL B4,4
		        note  Cs5
		  setRelease 01h
		        note  Ds5
		        noteL E5,6
		        note  Fs5
		        note  Gs5
		  vol 08h
		        note  Gs5
		  vol 0Bh
		        noteL A5,48
		  inst 26
		  vol 0Bh
		  sustain
		        noteL C5,4
		        note  D5
		        note  E5
		        note  F5
		        note  G5
		  setRelease 01h
		        note  A5
		countedLoopStart 1
		  inst 26
		  vol 0Ch
		        noteL As5,6
		  vol 09h
		        note  As5
		  vol 0Ch
		        note  As5
		  vol 09h
		        note  As5
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		  vol 07h
		        note  C6
		  vol 05h
		        note  C6
		        waitL 12
		  vol 0Ch
		        noteL G5,6
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  G5
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  A5
		  vol 09h
		        note  A5
		  vol 07h
		        note  A5
		  vol 05h
		        note  A5
		        waitL 24
		  vol 0Ch
		        noteL F5,6
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  G5
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 07h
		        note  C5
		  vol 05h
		        note  C5
		  inst 13
		  vol 0Ch
		        note  F3
		  vol 09h
		        note  F3
		  vol 0Ch
		        note  C4
		  vol 09h
		        note  C4
		  vol 0Ch
		        note  F4
		  vol 09h
		        note  F4
		  vol 0Ch
		        noteL Ds4,24
		  vol 09h
		        noteL Ds4,6
		  vol 07h
		        note  Ds4
		  vol 0Ch
		        note  C4
		  vol 09h
		        note  C4
		  vol 0Ch
		        note  Ds4
		  vol 09h
		        note  Ds4
		  vol 0Ch
		        note  As4
		  vol 09h
		        note  As4
		  vol 0Ch
		        noteL A4,48
		countedLoopEnd
		  vol 09h
		        noteL A4,6
		  vol 07h
		        note  A4
		        waitL 26
		  vol 0Bh
		        noteL G5,4
		        note  G5
		  vol 08h
		        note  G5
		  vol 0Bh
		        note  G5
		  vol 08h
		        note  G5
		  vol 0Bh
		        note  F5
		  vol 08h
		        note  F5
		  vol 0Bh
		        note  E5
		  vol 08h
		        note  E5
		  sustain
		  vol 0Bh
		        noteL F5,214
		  vol 08h
		        noteL F5,8
		  vol 06h
		        note  F5
		  setRelease 01h
		  vol 04h
		        note  F5
		  inst 0
		  vol 0Bh
		        noteL A2,24
		        note  As2
		        note  F3
		        noteL E3,72
		        noteL C3,24
		        noteL D3,12
		        note  F3
		  sustain
		        note  A3
		  vol 08h
		        noteL A3,6
		  setRelease 01h
		  vol 06h
		        note  A3
		        waitL 156
		  vol 0Bh
		        noteL A2,12
		        note  As2
		        note  F3
		        noteL E3,36
		        noteL C3,12
		        noteL D3,18
		        noteL A3,6
		  sustain
		        noteL C4,12
		  vol 08h
		        noteL C4,6
		  vol 06h
		  setRelease 01h
		        note  C4
		        waitL 36
		  vol 0Bh
		        noteL A2,12
		        note  As2
		        note  F3
		        note  E3
		        note  C3
		        note  D3
		        note  A3
		        noteL G3,18
		        noteL E3,6
		        noteL F3,12
		        noteL C4,24
		        noteL As3,12
		  vol 0Bh
		  sustain
		        note  E4
		  vol 08h
		        noteL E4,6
		  setRelease 01h
		  vol 06h
		        note  E4
		        waitL 12
		  vol 0Bh
		        note  F3
		        note  C4
		        note  As3
		  sustain
		        note  E4
		  vol 08h
		        noteL E4,6
		  vol 06h
		  setRelease 01h
		        note  E4
		        waitL 12
		  inst 26
		  vol 0Bh
		        note  F4
		        noteL C5,18
		        noteL As4,6
		  inst 15
		  vol 0Bh
		        noteL E5,54
		  inst 26
		  vol 0Bh
		        noteL D5,4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A3
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		        note  D5
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		  stereo 0C0h
		  shifting 00h
		  inst 20
		countedLoopStart 1
		  vol 0Bh
		        noteL D4,6
		  vol 08h
		        note  D4
		  vol 06h
		        note  D4
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Bh
		        noteL Cs4,6
		  vol 08h
		        note  Cs4
		  vol 06h
		        note  Cs4
		        wait
		countedLoopEnd
		  vol 0Bh
		        noteL Cs4,6
		  vol 08h
		        note  Cs4
		  vol 0Bh
		        note  Cs4
		  vol 08h
		        note  Cs4
		  vol 06h
		        note  Cs4
		        wait
		  vol 0Bh
		        note  Ds4
		        note  Ds4
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 06h
		        note  Ds4
		        wait
		  vol 0Bh
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 06h
		        note  Ds4
		        waitL 18
		  vol 0Bh
		        noteL Ds4,6
		  vol 08h
		        note  Ds4
		  vol 06h
		        note  Ds4
		        wait
		  vol 0Bh
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 0Bh
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 06h
		        note  Ds4
		        wait
		  vol 0Bh
		        note  Ds4
		        note  Ds4
		  vol 0Bh
		        note  F4
		  vol 08h
		        note  F4
		  vol 06h
		        note  F4
		  stereo 040h
		  shifting 020h
		  vol 0Ah
		        note  As3
		        note  As3
		        note  As3
		  vol 07h
		        note  As3
		  vol 0Ah
		        note  As3
		        note  As3
		        note  As3
		  vol 08h
		        note  As3
		  vol 07h
		        note  As3
		  vol 05h
		        note  As3
		        waitL 18
		channel_end
Music_41_Channel_5:
		  stereo 0C0h
		countedLoopStart 9
		        waitL 96
		countedLoopEnd
		        waitL 18
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sample  2
		        sample  2
		        sample  2
		        sample  2
		        sampleL 5,24
		        sampleL 5,48
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 3
		        sampleL 2,4
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		countedLoopEnd
		        sampleL 2,12
		        sampleL 0,6
		        sample  0
		        sampleL 0,12
		        sampleL 4,6
		        sample  4
		        sample  3
		        sample  4
		        sampleL 4,12
		        sample  3
		        sampleL 4,6
		        sample  4
		countedLoopStart 1
		        sampleL 3,6
		        sample  4
		        sampleL 4,24
		        sampleL 4,6
		        sample  4
		        sample  3
		        sample  4
		        sampleL 4,12
		        sample  3
		        sampleL 4,6
		        sample  4
		countedLoopEnd
		        sampleL 3,6
		        sample  4
		        sampleL 4,24
		        sampleL 4,6
		        sample  4
		        sample  3
		        sample  4
		        sampleL 4,12
		        sampleL 4,120
		repeatStart
		        waitL 84
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		countedLoopStart 1
		        sampleL 2,12
		        sampleL 3,4
		        sample  4
		        sample  4
		        sampleL 2,12
		        sampleL 3,6
		        sampleL 3,5
		        sampleL 4,1
		countedLoopEnd
		        sampleL 2,4
		        sample  4
		        sample  4
		        sample  3
		        sample  4
		        sample  4
		        sampleL 2,12
		        sampleL 3,6
		        sample  3
		        sample  5
		        sample  2
		        sampleL 5,12
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,192
		repeatSection1Start
		        waitL 240
		        wait
		repeatEnd
		repeatSection2Start
		repeatStart
		countedLoopStart 1
		        sampleL 2,24
		        sampleL 0,12
		        sampleL 3,4
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 5,24
		        sampleL 5,48
		repeatSection1Start
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		repeatEnd
		repeatSection2Start
		        sampleL 3,3
		        sample  3
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		        sample  4
		countedLoopStart 2
		        sampleL 1,60
		        sampleL 1,24
		        sampleL 1,12
		        sampleL 1,96
		        waitL 192
		countedLoopEnd
		        sampleL 1,60
		        sampleL 1,24
		        sampleL 1,12
		        sampleL 1,72
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 1
		        sampleL 2,24
		        sampleL 0,12
		        sampleL 3,4
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 5,24
		        sampleL 5,48
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		repeatStart
		        sampleL 2,6
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,12
		        sampleL 0,6
		        sample  0
		        sampleL 0,12
		        sampleL 3,6
		        sample  3
		        sample  2
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,12
		        sampleL 0,6
		        sample  0
		        sampleL 0,12
		        sampleL 3,6
		        sample  3
		countedLoopStart 1
		        sampleL 2,6
		        sample  3
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 2,12
		        sampleL 5,6
		        sample  0
		        sampleL 0,12
		        sampleL 4,4
		        sample  4
		        sample  4
		countedLoopStart 5
		        sampleL 2,4
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		        sampleL 5,12
		        sampleL 0,4
		        sampleL 0,8
		        sampleL 0,24
		        sample  5
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 12
		        sampleL 2,12
		        sampleL 3,4
		        sampleL 2,8
		        sample  2
		        sample  3
		        sample  3
		        sample  0
		        sample  3
		        sampleL 3,7
		        sampleL 3,1
		        sampleL 2,8
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 2,12
		        sampleL 3,4
		        sampleL 2,8
		        sampleL 5,24
		countedLoopStart 1
		        sampleL 2,4
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		countedLoopEnd
		        sampleL 2,12
		        sampleL 4,4
		        sample  4
		        sample  3
		        sampleL 2,24
		        sampleL 0,11
		        sampleL 3,1
		        sampleL 2,24
		        sampleL 2,6
		        sampleL 3,18
		        sampleL 2,12
		        sampleL 2,24
		        sampleL 2,6
		        sample  3
		        sampleL 2,23
		        sampleL 3,1
		        sampleL 2,12
		        sample  0
		        sampleL 4,4
		        sample  4
		        sample  3
		        sampleL 5,24
		        sampleL 2,6
		        sample  3
		        sampleL 2,12
		        sample  2
		        sampleL 2,6
		        sample  3
		        sampleL 5,12
		        sampleL 2,6
		        sample  3
		        sampleL 2,12
		        sampleL 2,6
		        sample  3
		        sampleL 5,48
		channel_end
Music_41_Channel_6:
		  ymTimer 098h
		  vibrato 040h
		  psgInst 00h
		  setRelease 080h
		  psgInst 00h
		        psgNoteL G3,6
		  psgInst 01h
		        psgNote  G3
		  psgInst 02h
		        psgNote  G3
		  psgInst 076h
		countedLoopStart 8
		        psgNoteL G3,96
		countedLoopEnd
		  psgInst 079h
		        psgNoteL B3,96
		  ymTimer 0C4h
		  setRelease 01h
		        psgNoteL B3,36
		        waitL 12
		  vibrato 04Ch
		  psgInst 0Ch
		        psgNoteL As3,4
		        psgNote  As3
		        wait
		        psgNoteL As3,72
		  psgInst 0Dh
		        psgNoteL As4,4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  E4
		        psgNote  D4
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  E4
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  E5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNoteL F5,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 42
		  psgInst 07Dh
		        psgNoteL F5,4
		        psgNote  G5
		        psgNote  A5
		        psgNoteL As5,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 18
		  psgInst 07Dh
		        psgNoteL As4,4
		        psgNote  C5
		        psgNote  D5
		        psgNoteL E5,6
		        wait
		        psgNoteL F4,4
		        psgNote  G4
		        psgNote  A4
		        psgNoteL As4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 09h
		        wait
		  psgInst 07Dh
		        psgNoteL C5,4
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  E4
		  psgInst 07Bh
		countedLoopStart 2
		        psgNoteL D4,6
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNoteL D4,12
		        waitL 6
		        psgNote  D4
		countedLoopEnd
		repeatStart
		        psgNoteL Ds4,6
		        psgNote  Ds4
		        psgNote  Ds4
		        wait
		        psgNote  Ds4
		        wait
		        psgNote  Ds4
		        psgNote  Ds4
		        psgNote  Ds4
		        psgNote  Ds4
		        psgNote  Ds4
		        wait
		        psgNoteL Ds4,12
		        waitL 6
		        psgNote  Ds4
		  psgInst 0Dh
		        psgNote  C4
		        psgNote  D4
		        psgNote  F4
		        psgNote  As4
		        psgNote  D5
		        psgNote  As4
		        psgNote  F4
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  G4
		        psgNote  C5
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  G4
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  Gs4
		        psgNote  Cs5
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  Gs4
		        psgNote  F4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  As4
		        psgNote  Ds5
		        psgNote  A4
		        psgNote  As4
		        psgNote  C5
		        psgNote  F5
		  psgInst 07Bh
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNoteL D4,12
		        waitL 6
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  Ds4
		        psgNote  Ds4
		        wait
		        psgNote  Ds4
		        wait
		        psgNote  Ds4
		        psgNote  Ds4
		        psgNote  Ds4
		        wait
		        psgNoteL C4,18
		        waitL 6
		        psgNote  C4
		        wait
		repeatSection1Start
		        psgNoteL C5,6
		        psgNote  C5
		        psgNote  C5
		        wait
		        psgNote  C5
		        wait
		        psgNote  C5
		        psgNote  C5
		        psgNote  C5
		        psgNote  C5
		        psgNote  As4
		        wait
		        psgNoteL A4,12
		        waitL 6
		        psgNote  A4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        wait
		        psgNote  G4
		        wait
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        wait
		        psgNoteL G4,24
		        psgNoteL As4,6
		        psgNote  As4
		        psgNote  As4
		        wait
		        psgNote  As4
		        wait
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        wait
		        psgNoteL As4,12
		        waitL 6
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        wait
		        psgNote  As4
		        wait
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        wait
		        psgNoteL A4,12
		        waitL 6
		        psgNote  A4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNoteL D4,12
		        waitL 6
		        psgNote  D4
		repeatEnd
		repeatSection2Start
		  psgInst 07Dh
		        psgNoteL As4,48
		        psgNoteL Gs4,12
		        psgNote  Fs4
		        psgNote  F4
		        psgNote  Ds4
		  psgInst 0Dh
		        psgNoteL D4,6
		        wait
		  psgInst 0Bh
		        waitL 12
		  psgInst 07Dh
		        psgNoteL D4,24
		        waitL 6
		        psgNote  E4
		        psgNote  F4
		        psgNote  A4
		        psgNote  As4
		        psgNote  D5
		        psgNote  F5
		        psgNote  As5
		        psgNoteL Cs6,48
		        psgNote  C6
		        psgNoteL As5,6
		        psgNote  Gs5
		        psgNote  Fs5
		        psgNote  F5
		        psgNoteL Ds5,40
		        psgNoteL Cs5,4
		        psgNote  B4
		        psgNote  As4
		        psgNote  Gs4
		        psgNote  Fs4
		        psgNote  E4
		        psgNote  Ds4
		        psgNote  Cs4
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL Cs5,6
		        wait
		        psgNote  Cs5
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Cs5,6
		        wait
		        psgNote  Cs5
		        wait
		        psgNote  Cs5
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Cs5,6
		        psgNote  Cs5
		countedLoopEnd
		        psgNoteL B4,6
		        wait
		        psgNote  B4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B4,6
		        wait
		        psgNote  B4
		        wait
		        psgNote  B4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B4,6
		        psgNote  B4
		        psgNote  B4
		        wait
		        psgNote  B4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B4,6
		        wait
		  psgInst 07Ch
		        psgNote  B5
		        psgNote  Cs6
		        psgNote  Ds6
		        psgNote  Fs6
		        psgNote  E6
		        psgNote  Ds6
		        psgNote  B5
		        psgNote  Fs5
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL B4,6
		        wait
		        psgNote  B4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B4,6
		        wait
		        psgNote  B4
		        wait
		        psgNote  B4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B4,6
		        psgNote  B4
		countedLoopEnd
		        psgNoteL A4,6
		        wait
		        psgNote  A4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A4,6
		        waitL 12
		  psgInst 07Ch
		        psgNoteL Fs5,6
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  Cs6
		        psgNote  E6
		        psgNote  D6
		        psgNote  Cs6
		  psgInst 07Bh
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        wait
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        psgNote  Gs4
		        psgNote  Fs4
		        wait
		        psgNote  Fs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs4,6
		        wait
		        psgNote  Fs4
		        wait
		        psgNote  Fs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs4,6
		        psgNote  Fs4
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        wait
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        psgNote  Gs4
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D4,6
		        wait
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D4,6
		        psgNote  D4
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        wait
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        psgNote  E4
		        psgNote  Fs4
		        wait
		        psgNote  Fs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs4,6
		        wait
		        psgNote  Fs4
		        wait
		        psgNote  Fs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs4,6
		        psgNote  Fs4
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        wait
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        psgNote  Gs4
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNote  A3
		        waitL 6
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        waitL 12
		  psgInst 0Ch
		        psgNoteL B3,24
		        psgNoteL Cs4,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 0Ch
		        psgNoteL D4,60
		        waitL 6
		  psgInst 0Ah
		        wait
		countedLoopStart 1
		  psgInst 0Ch
		        psgNoteL C4,6
		        wait
		        psgNote  C4
		        wait
		        psgNote  C4
		        wait
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNoteL C4,6
		        wait
		        psgNote  C4
		        wait
		        psgNote  C4
		        wait
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL C4,6
		        wait
		        psgNote  C4
		        wait
		        psgNote  C4
		        wait
		        psgNote  Ds4
		        wait
		        psgNote  Ds4
		        wait
		        psgNote  C4
		        wait
		        psgNote  C4
		        wait
		  psgInst 00h
		        waitL 24
		  psgInst 0Dh
		        psgNoteL Ds5,4
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A5
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As5
		        psgNote  A5
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C6
		        psgNote  As5
		        psgNote  A5
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		countedLoopEnd
		  ymTimer 0C2h
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL As3,4
		        psgNote  As3
		        wait
		        psgNoteL As3,240
		        waitL 8
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 00h
		        waitL 192
		  psgInst 0Dh
		        psgNoteL E4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 135
		        wait
		  psgInst 0Dh
		        psgNoteL E4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 99
		        wait
		countedLoopStart 1
		  psgInst 0Dh
		        psgNoteL C5,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 54
		countedLoopEnd
		  psgInst 0Ch
		  setRelease 080h
		        psgNoteL Cs5,192
		  setRelease 01h
		        psgNoteL Cs5,96
		  psgInst 0Dh
		        psgNoteL F5,6
		        wait
		        psgNoteL D5,4
		        psgNote  Ds5
		        psgNote  E5
		        psgNoteL F5,6
		        wait
		        psgNoteL F4,4
		        psgNote  E4
		        psgNote  Ds4
		        psgNoteL Cs4,6
		        wait
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  As4
		        psgNote  Cs5
		        psgNote  F5
		        wait
		        psgNote  F4
		        psgNote  E4
		        psgNote  Ds4
		        psgNote  B3
		        psgNote  Gs3
		        psgNote  B3
		        psgNote  Ds4
		        psgNote  B3
		        psgNote  Gs3
		        psgNote  B3
		        waitL 12
		        psgNoteL Cs5,4
		        psgNote  Ds5
		        psgNote  E5
		        psgNoteL F5,6
		        wait
		        psgNoteL F4,4
		        psgNote  Ds4
		        psgNote  Cs4
		        psgNoteL B3,6
		        psgNote  A3
		        psgNote  Ds4
		        psgNote  F4
		        psgNoteL B4,4
		        psgNote  Cs5
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  G5
		        psgNote  A5
		        psgNoteL As5,6
		        wait
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		  psgInst 00h
		        waitL 36
		channel_end
Music_41_Channel_7:
		  vibrato 040h
		  setRelease 080h
		  psgInst 00h
		        psgNoteL C3,6
		  psgInst 01h
		        psgNote  C3
		  psgInst 02h
		        psgNote  C3
		  psgInst 076h
		countedLoopStart 8
		        psgNoteL C3,96
		countedLoopEnd
		  psgInst 079h
		  setRelease 01h
		        psgNoteL Ds3,132
		        waitL 12
		  vibrato 04Ch
		  psgInst 0Ch
		        psgNoteL D3,4
		        psgNote  D3
		        wait
		        psgNoteL D3,72
		        waitL 8
		  shifting 010h
		  psgInst 0Bh
		        psgNoteL As4,4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  E4
		        psgNote  D4
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  E4
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  E5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNoteL F5,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 00h
		        waitL 42
		  psgInst 07Bh
		        psgNoteL F5,4
		        psgNote  G5
		        psgNote  A5
		        psgNoteL As5,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 00h
		        waitL 18
		  psgInst 07Bh
		        psgNoteL As4,4
		        psgNote  C5
		        psgNote  D5
		        psgNoteL E5,6
		        wait
		        psgNoteL F4,4
		        psgNote  G4
		        psgNote  A4
		        psgNoteL As4,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 07h
		        wait
		  psgInst 07Bh
		        psgNoteL C5,4
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		  shifting 00h
		  psgInst 07Bh
		countedLoopStart 2
		        psgNoteL As3,6
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNote  As3
		        wait
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNoteL As3,12
		        waitL 6
		        psgNote  As3
		countedLoopEnd
		repeatStart
		        psgNoteL G3,6
		        psgNote  G3
		        psgNote  G3
		        wait
		        psgNote  G3
		        wait
		        psgNote  G3
		        psgNote  G3
		        psgNote  G3
		        psgNote  G3
		        psgNote  G3
		        wait
		        psgNoteL G3,12
		        waitL 6
		        psgNote  G3
		        wait
		  shifting 010h
		  psgInst 0Bh
		        psgNote  C4
		        psgNote  D4
		        psgNote  F4
		        psgNote  As4
		        psgNote  D5
		        psgNote  As4
		        psgNote  F4
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  G4
		        psgNote  C5
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  G4
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  Gs4
		        psgNote  Cs5
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  Gs4
		        psgNote  F4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  As4
		        psgNote  Ds5
		        psgNote  A4
		        psgNote  As4
		        psgNote  C5
		  shifting 00h
		  psgInst 07Bh
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNote  As3
		        wait
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNoteL As3,12
		        waitL 6
		        psgNote  As3
		        psgNote  G3
		        psgNote  G3
		        psgNote  G3
		        wait
		        psgNote  G3
		        wait
		        psgNote  G3
		        psgNote  G3
		        psgNote  G3
		        wait
		        psgNoteL A3,18
		        waitL 6
		        psgNote  A3
		        wait
		repeatSection1Start
		        psgNoteL A4,6
		        psgNote  A4
		        psgNote  A4
		        wait
		        psgNote  A4
		        wait
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        psgNote  G4
		        wait
		        psgNoteL Fs4,12
		        waitL 6
		        psgNote  Fs4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        psgNote  D4
		        wait
		        psgNoteL D4,24
		        psgNoteL G4,6
		        psgNote  G4
		        psgNote  G4
		        wait
		        psgNote  G4
		        wait
		        psgNote  G4
		        psgNote  G4
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        wait
		        psgNoteL C4,12
		        waitL 6
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        wait
		        psgNote  C4
		        wait
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        wait
		        psgNoteL C4,12
		        waitL 6
		        psgNote  C4
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNote  As3
		        wait
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNoteL As3,12
		        waitL 6
		        psgNote  As3
		repeatEnd
		repeatSection2Start
		        waitL 6
		  shifting 010h
		  psgInst 07Bh
		        psgNoteL As4,48
		        psgNoteL Gs4,12
		        psgNote  Fs4
		        psgNote  F4
		        psgNote  Ds4
		  psgInst 0Bh
		        psgNoteL D4,6
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D4,24
		        waitL 6
		        psgNote  E4
		        psgNote  F4
		        psgNote  A4
		        psgNote  As4
		        psgNote  D5
		        psgNote  F5
		        psgNote  As5
		        psgNoteL Cs6,48
		        psgNote  C6
		        psgNoteL As5,6
		        psgNote  Gs5
		        psgNote  Fs5
		        psgNote  F5
		        psgNoteL Ds5,42
		        psgNoteL Cs5,4
		        psgNote  B4
		        psgNote  As4
		        psgNote  Gs4
		        psgNote  Fs4
		        psgNote  E4
		  shifting 00h
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL A4,6
		        wait
		        psgNote  A4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A4,6
		        wait
		        psgNote  A4
		        wait
		        psgNote  A4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A4,6
		        psgNote  A4
		countedLoopEnd
		        psgNoteL Gs4,6
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        wait
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        psgNote  Gs4
		        psgNote  Gs4
		        wait
		        psgNote  Gs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        waitL 12
		  shifting 010h
		  psgInst 07Ah
		        psgNoteL B5,6
		        psgNote  Cs6
		        psgNote  Ds6
		        psgNote  Fs6
		        psgNote  E6
		        psgNote  Ds6
		        psgNote  B5
		  shifting 00h
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL G4,6
		        wait
		        psgNote  G4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL G4,6
		        wait
		        psgNote  G4
		        wait
		        psgNote  G4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL G4,6
		        psgNote  G4
		countedLoopEnd
		        psgNoteL Fs4,6
		        wait
		        psgNote  Fs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs4,6
		        wait
		  psgInst 09h
		        waitL 12
		  shifting 010h
		  psgInst 07Ah
		        psgNoteL Fs5,6
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  Cs6
		        psgNote  E6
		        psgNote  D6
		  shifting 00h
		  psgInst 07Bh
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        wait
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        psgNote  E4
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D4,6
		        wait
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D4,6
		        psgNote  D4
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        wait
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        psgNote  E4
		        psgNote  B3
		        wait
		        psgNote  B3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B3,6
		        wait
		        psgNote  B3
		        wait
		        psgNote  B3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B3,6
		        psgNote  B3
		        psgNote  A3
		        wait
		        psgNote  A3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A3,6
		        wait
		        psgNote  A3
		        wait
		        psgNote  A3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A3,6
		        psgNote  A3
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D4,6
		        wait
		        psgNote  D4
		        wait
		        psgNote  D4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D4,6
		        psgNote  D4
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        wait
		        psgNote  E4
		        wait
		        psgNote  E4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E4,6
		        psgNote  E4
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNote  Fs3
		        waitL 6
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        waitL 12
		  psgInst 0Ch
		        psgNoteL Gs3,24
		        psgNoteL A3,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 0Ch
		        psgNoteL A3,60
		        waitL 6
		  psgInst 0Ah
		        wait
		countedLoopStart 1
		  psgInst 0Ch
		        psgNoteL F3,6
		        wait
		        psgNote  F3
		        wait
		        psgNote  F3
		        wait
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNoteL F3,6
		        wait
		        psgNote  F3
		        wait
		        psgNote  F3
		        wait
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL F3,6
		        wait
		        psgNote  F3
		        wait
		        psgNote  F3
		        wait
		        psgNote  As3
		        wait
		        psgNote  As3
		        wait
		        psgNote  A3
		        wait
		        psgNote  A3
		        wait
		  psgInst 00h
		        waitL 32
		  shifting 010h
		  psgInst 0Bh
		        psgNoteL Ds5,4
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  A5
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As5
		        psgNote  A5
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C6
		        psgNote  As5
		        psgNote  A5
		        psgNote  G5
		  shifting 00h
		countedLoopEnd
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL D3,4
		        psgNote  D3
		        wait
		        psgNoteL D3,240
		        waitL 8
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 00h
		        waitL 192
		  psgInst 0Dh
		        psgNoteL D4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 135
		        wait
		  psgInst 0Dh
		        psgNoteL As3,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 99
		        wait
		  psgInst 0Dh
		        psgNoteL G4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 54
		  psgInst 0Dh
		        psgNoteL Gs4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 54
		  psgInst 0Ch
		  setRelease 080h
		        psgNoteL A4,192
		  setRelease 01h
		        psgNoteL A4,96
		        waitL 6
		  shifting 010h
		  psgInst 0Bh
		        psgNote  F5
		        wait
		        psgNoteL D5,4
		        psgNote  Ds5
		        psgNote  E5
		        psgNoteL F5,6
		        wait
		        psgNoteL F4,4
		        psgNote  E4
		        psgNote  Ds4
		        psgNoteL Cs4,6
		        wait
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  As4
		        psgNote  Cs5
		        psgNote  F5
		        wait
		        psgNote  F4
		        psgNote  E4
		        psgNote  Ds4
		        psgNote  B3
		        psgNote  Gs3
		        psgNote  B3
		        psgNote  Ds4
		        psgNote  B3
		        psgNote  Gs3
		        psgNote  B3
		        waitL 12
		        psgNoteL Cs5,4
		        psgNote  Ds5
		        psgNote  E5
		        psgNoteL F5,6
		        wait
		        psgNoteL F4,4
		        psgNote  Ds4
		        psgNote  Cs4
		        psgNoteL B3,6
		        psgNote  A3
		        psgNote  Ds4
		        psgNote  F4
		        psgNoteL B4,4
		        psgNote  Cs5
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  G5
		        psgNote  A5
		        psgNoteL As5,6
		        wait
		  shifting 020h
		  psgInst 0Ch
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		        psgNote  As3
		        psgNote  As3
		        psgNote  As3
		        wait
		  psgInst 00h
		        waitL 30
		channel_end
Music_41_Channel_9:
		channel_end
