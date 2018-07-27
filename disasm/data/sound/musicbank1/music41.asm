
; ASM FILE music41.asm :
; 0xDC9A..0xFD9E : Music 41
Music_41:       db 0
		db 0
		db 0
		db 0C6h
		dw Music_9_Channel_0
		dw Music_9_Channel_1
		dw Music_9_Channel_2
		dw Music_9_Channel_3
		dw Music_9_Channel_4
		dw Music_9_Channel_5
		dw Music_9_Channel_6
		dw Music_9_Channel_7
		dw Music_9_Channel_9
		dw Music_9_Channel_9
Music_9_Channel_0:
		  stereo 0C0h
		  inst 55
		  vol 0Ch
		  sustain
		  vibrato 02Ch
		        noteL F3,192
		  vibrato 020h
		        note  F3
		        note  F3
		        note  F3
		  setRelease 01h
		        noteL F3,83
		  vibrato 02Ch
		  inst 40
		  vol 0Bh
		        noteL E3,15
		  vol 0Ch
		        noteL D3,16
		  inst 1
		  vol 0Bh
		        noteL Cs2,132
		  inst 3
		  vol 0Dh
		        noteL As2,10
		        waitL 14
		        noteL As2,78
		        waitL 18
		  vol 0Ch
		countedLoopStart 1
		        noteL As2,8
		        noteL As3,4
		        wait
		        note  As3
		        wait
		countedLoopEnd
		        noteL F2,8
		        noteL F3,4
		        wait
		        note  F3
		        wait
		        noteL As2,12
		  inst 32
		  vol 0Dh
		        noteL As3,6
		        note  As3
		        note  As3
		  vol 09h
		        note  As3
		  inst 3
		  vol 0Bh
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        waitL 18
		        noteL F3,6
		        wait
		countedLoopStart 3
		        noteL As2,6
		        wait
		        note  As2
		        waitL 18
		        noteL As2,6
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        waitL 18
		        noteL F3,6
		        wait
		countedLoopEnd
		repeatStart
		        noteL Ds3,6
		        wait
		        note  Ds3
		        waitL 18
		        noteL Ds3,6
		        note  Ds3
		        note  Ds3
		        note  Ds3
		        note  Ds3
		        waitL 18
		        noteL F3,6
		        wait
		  vol 0Ch
		        noteL As2,8
		        waitL 16
		        noteL As3,12
		        waitL 6
		        note  As3
		        note  Gs3
		        wait
		  vol 0Bh
		  sustain
		        note  Gs4
		  setRelease 01h
		        note  G4
		        note  Gs4
		        wait
		  vol 0Ch
		        note  Gs3
		        wait
		        note  Fs3
		        wait
		  vol 0Bh
		  sustain
		        note  Fs4
		  setRelease 01h
		        note  F4
		        note  Fs4
		        note  Gs4
		        note  As4
		        note  Fs4
		        note  F4
		        wait
		        noteL F3,24
		        noteL F3,6
		        wait
		        note  As2
		        wait
		        note  As2
		        waitL 18
		        noteL As2,6
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        waitL 18
		        noteL F3,6
		        wait
		        note  Ds3
		        wait
		        note  Ds3
		        waitL 18
		        noteL Ds3,6
		        note  Ds3
		        note  Ds3
		        wait
		repeatSection1Start
		        noteL F3,24
		        noteL Ds3,12
		        noteL D3,6
		        wait
		        note  D3
		        waitL 18
		        noteL D3,6
		        note  D3
		        note  D3
		        note  D3
		        note  D3
		        waitL 18
		        noteL A3,6
		        wait
		        note  G3
		        wait
		        note  G3
		        waitL 18
		        noteL G3,6
		        note  G3
		        note  F3
		        note  F3
		        note  F3
		        wait
		        noteL F3,24
		        noteL E3,6
		        wait
		        note  E3
		        waitL 18
		        noteL E3,6
		        note  E3
		        note  E3
		        note  E3
		        note  E3
		        waitL 18
		        noteL E3,6
		        wait
		        note  F3
		        wait
		        note  F3
		        waitL 18
		        noteL F3,6
		        wait
		        note  F2
		        note  F2
		        note  F2
		        waitL 18
		        noteL F2,6
		        wait
		        note  As2
		        wait
		        note  As2
		        waitL 18
		        noteL As2,6
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        waitL 18
		        noteL F3,6
		        wait
		repeatEnd
		repeatSection2Start
		        noteL F3,36
		        noteL Fs3,48
		        noteL Gs3,36
		  sustain
		        noteL Fs3,6
		  setRelease 01h
		        note  Gs3
		        noteL As3,8
		        waitL 16
		        noteL Ds3,48
		        noteL Ds3,24
		        noteL B2,48
		        noteL Cs3,36
		  sustain
		        noteL B2,6
		  setRelease 01h
		        note  Cs3
		        noteL Ds3,8
		        waitL 16
		        noteL E3,72
		  inst 2
		  vol 0Ch
		        noteL A4,48
		        waitL 12
		        noteL E4,24
		        noteL E4,6
		        wait
		        noteL A4,72
		        noteL E4,24
		        noteL Gs4,48
		        waitL 12
		        noteL Ds4,24
		        noteL Ds4,6
		        wait
		        noteL Gs4,96
		        noteL G4,48
		        waitL 12
		        noteL D4,24
		        noteL D4,6
		        wait
		        noteL G4,72
		        noteL D4,24
		        noteL Fs4,48
		        waitL 12
		        noteL Fs4,24
		        noteL Cs4,6
		        wait
		        noteL E4,48
		        waitL 12
		        noteL B3,24
		        noteL E4,12
		        noteL D4,48
		        waitL 12
		        noteL D4,24
		        noteL D4,6
		        wait
		        noteL Cs4,60
		        noteL Ds4,12
		        note  E4
		        note  Gs4
		        noteL G4,48
		        waitL 12
		        noteL D4,24
		        noteL G4,12
		        noteL Fs4,48
		        waitL 12
		        note  A4
		        note  B4
		        note  Cs5
		        noteL D5,48
		        waitL 12
		        noteL A4,24
		        noteL A4,6
		        wait
		        noteL Cs5,30
		        waitL 6
		        noteL Gs4,18
		        waitL 6
		        noteL E4,18
		        waitL 6
		        note  Cs4
		        waitL 30
		  inst 3
		  vol 0Ch
		        noteL Fs3,24
		        wait
		        note  E3
		        noteL D3,8
		        waitL 16
		        noteL C3,72
		countedLoopStart 1
		  inst 3
		  vol 0Ch
		  setRelease 07h
		        noteL F3,12
		        note  C4
		        note  F4
		  setRelease 01h
		  inst 32
		  vol 0Dh
		        noteL F3,6
		        note  F3
		        note  F3
		  vol 09h
		        note  F3
		  setRelease 07h
		  inst 3
		  vol 0Ch
		        noteL F3,12
		        note  C4
		        note  F4
		        wait
		  setRelease 01h
		  inst 32
		  vol 0Dh
		        noteL F3,6
		        note  F3
		        note  F3
		  vol 09h
		        note  F3
		  setRelease 07h
		  inst 3
		  vol 0Ch
		        noteL F3,12
		        note  C4
		        note  F4
		        note  Ds4
		        note  As4
		        note  F4
		  setRelease 01h
		  inst 32
		  vol 0Dh
		        noteL F3,6
		        note  F3
		        note  F3
		  vol 09h
		        note  F3
		        waitL 12
		  inst 38
		  vol 0Bh
		        noteL Ds5,4
		        note  D5
		        note  C5
		        note  As4
		        note  A4
		        note  G4
		        note  F5
		        note  Ds5
		        note  D5
		        note  C5
		        note  As4
		        note  A4
		        note  G5
		        note  F5
		        note  Ds5
		        note  D5
		        note  C5
		        note  As4
		        note  A5
		        note  G5
		        note  F5
		        note  Ds5
		        note  D5
		        note  C5
		        note  As4
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
		countedLoopEnd
		  inst 32
		  vol 0Dh
		        noteL As3,6
		  vol 09h
		        note  As3
		  vol 0Dh
		        noteL As3,4
		        note  As3
		  vol 09h
		        note  As3
		  vol 0Dh
		        noteL As3,12
		  vol 09h
		        noteL As3,6
		        wait
		  inst 3
		  vol 0Dh
		        noteL As2,54
		        waitL 6
		  vol 0Ch
		        noteL As2,4
		  setRelease 05h
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        wait
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		countedLoopStart 11
		  setRelease 01h
		        noteL As2,8
		        waitL 4
		        note  As2
		  setRelease 05h
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        wait
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		countedLoopEnd
		  setRelease 01h
		        noteL As2,8
		        waitL 4
		        note  As2
		  setRelease 05h
		        noteL As2,8
		  setRelease 01h
		        noteL F2,72
		        noteL As2,8
		        waitL 16
		        noteL As2,8
		        waitL 28
		        noteL Fs3,8
		        waitL 16
		        noteL Fs3,8
		        waitL 16
		        noteL B2,6
		        wait
		        noteL B2,8
		        waitL 16
		        noteL E3,6
		        note  E3
		        noteL E3,8
		        waitL 16
		        noteL E3,8
		        waitL 28
		        noteL A3,8
		        waitL 16
		        noteL B3,6
		        wait
		        noteL B3,8
		        waitL 16
		        noteL B3,6
		        note  B3
		        note  As3
		        wait
		        note  As2
		        note  As2
		        note  As2
		        wait
		        note  As2
		        note  As2
		        noteL As2,8
		        waitL 40
		channel_end
Music_9_Channel_1:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 035h
		  inst 15
		  vol 00h
		        noteL F3,12
		  vol 0Bh
		        note  E4
		        note  F4
		        note  C5
		        noteL B4,36
		        noteL G4,12
		        note  A4
		        note  C5
		  vibrato 03Ch
		  sustain
		        noteL E5,72
		  vibrato 030h
		  vol 09h
		        noteL E5,6
		  vol 07h
		  setRelease 01h
		        note  E5
		  vol 0Bh
		  vibrato 035h
		        noteL E4,12
		        note  F4
		        note  C5
		        note  B4
		        note  G4
		        noteL A4,18
		        noteL E5,6
		  vibrato 03Ch
		  sustain
		        noteL G5,72
		  vibrato 030h
		  vol 09h
		        noteL G5,6
		  vol 07h
		  setRelease 01h
		        note  G5
		  vol 0Bh
		  vibrato 035h
		        noteL E4,12
		        note  F4
		        note  C5
		        note  B4
		        note  G4
		        note  A4
		        note  E5
		        note  D5
		        note  B4
		        note  C5
		        noteL G5,24
		        noteL F5,12
		  vibrato 03Ch
		  sustain
		        noteL B5,24
		  vibrato 030h
		  vol 09h
		        noteL B5,6
		  vol 07h
		  setRelease 01h
		        note  B5
		  vol 0Bh
		  vibrato 035h
		        noteL C5,12
		        note  G5
		        note  F5
		  vibrato 03Ch
		  sustain
		        noteL B5,48
		  vibrato 030h
		  vol 09h
		        noteL B5,6
		  vol 07h
		  setRelease 01h
		        note  B5
		  vibrato 035h
		  vol 0Bh
		        noteL C5,12
		        noteL G5,18
		        noteL F5,6
		  vibrato 03Ch
		  sustain
		        noteL B5,48
		  vibrato 030h
		  vol 09h
		        noteL B5,6
		  vol 07h
		  setRelease 01h
		        note  B5
		  vol 0Bh
		  vibrato 035h
		        noteL C6,12
		        noteL G6,18
		        noteL F6,6
		  vibrato 03Fh
		  sustain
		        noteL B6,222
		  vibrato 030h
		  vol 09h
		        noteL B6,6
		  vol 07h
		  setRelease 01h
		        note  B6
		  vibrato 02Ch
		  inst 13
		  vol 0Ch
		        noteL G6,4
		        note  G6
		  vol 09h
		        note  G6
		  vol 0Ch
		        note  G6
		  vol 09h
		        note  G6
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  E6
		  vol 09h
		        note  E6
		  vol 0Ch
		        noteL F6,48
		  vol 09h
		        noteL F6,8
		  setRelease 05h
		  inst 27
		  vol 0Ah
		        note  G4
		        note  G4
		        note  G4
		        note  As4
		        note  As4
		        note  As4
		        note  D5
		        note  D5
		        note  D5
		        note  E5
		        note  E5
		  setRelease 01h
		        noteL F5,12
		  vol 06h
		        noteL F5,6
		  vol 04h
		        note  F5
		        waitL 12
		  inst 20
		  vol 0Bh
		        noteL E5,6
		        note  E5
		        noteL E5,36
		  vol 07h
		        noteL E5,6
		  vol 0Bh
		        note  F5
		        noteL D5,96
		  inst 16
		  vol 0Bh
		        noteL F6,6
		        note  E6
		        noteL F6,54
		  vol 08h
		        noteL F6,6
		  vol 0Bh
		        noteL F6,4
		        note  E6
		        note  Ds6
		        note  D6
		        note  Cs6
		        note  C6
		  sustain
		        noteL D6,96
		  vol 08h
		        noteL D6,6
		  setRelease 01h
		  vol 06h
		        note  D6
		repeatStart
		  inst 27
		  vol 0Bh
		        noteL A4,12
		        noteL As4,6
		  vol 07h
		        note  As4
		  vol 0Bh
		        note  G5
		  vol 07h
		        note  G5
		  vol 0Bh
		        noteL F5,36
		        noteL D5,6
		  vol 07h
		        note  D5
		  vol 0Bh
		        note  Ds5
		  vol 07h
		        note  Ds5
		  vol 0Bh
		        noteL C6,24
		        noteL As5,6
		  vol 07h
		        note  As5
		  vol 0Bh
		        noteL A5,24
		        noteL D5,18
		        noteL Ds5,6
		  inst 20
		  vol 0Bh
		        note  F5
		  vol 08h
		        note  F5
		  vol 06h
		        note  F5
		        wait
		  vol 0Bh
		        noteL F5,12
		  vol 08h
		        noteL F5,6
		  vol 0Bh
		        note  F5
		        note  G5
		  vol 08h
		        note  G5
		  vol 0Bh
		        noteL G5,24
		        noteL G5,6
		  vol 08h
		        note  G5
		  vol 0Bh
		        note  Gs5
		  vol 08h
		        note  Gs5
		  vol 0Bh
		        noteL Gs5,24
		        noteL Gs5,6
		  vol 08h
		        note  Gs5
		  vol 0Bh
		        note  G5
		        note  F5
		        noteL G5,36
		  vol 08h
		        noteL G5,6
		  vol 06h
		        note  G5
		  inst 26
		repeatSection1Start
		  vol 0Ch
		        noteL A5,12
		        note  As5
		        note  G6
		        note  F6
		        note  D6
		        noteL Ds6,6
		  vol 09h
		        note  Ds6
		  vol 07h
		        note  Ds6
		  vol 0Ch
		        note  As6
		        noteL C7,36
		        noteL As6,12
		        noteL A6,48
		  vol 09h
		        noteL A6,6
		  vol 07h
		        note  A6
		  vol 0Ch
		        noteL F4,12
		        note  Fs4
		        note  Ds5
		        noteL D5,36
		        noteL C5,12
		        note  C5
		        noteL As4,24
		        noteL As4,6
		        note  A4
		        note  As4
		  vol 09h
		        note  As4
		  vol 0Ch
		        noteL G4,12
		        note  A4
		        note  As4
		        note  D5
		        noteL C5,24
		        note  G5
		        noteL G5,12
		        note  F5
		        note  E5
		        noteL G5,6
		  vol 09h
		        note  G5
		  vol 0Ch
		        noteL F5,84
		  vol 09h
		        noteL F5,6
		  vol 07h
		        note  F5
		repeatEnd
		repeatSection2Start
		  vol 0Dh
		        noteL A4,12
		        note  As4
		        note  G5
		        note  F5
		        note  D5
		        noteL Ds5,6
		  vol 0Ah
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 0Dh
		        note  As5
		        noteL C6,36
		        noteL As5,12
		        noteL A5,36
		  inst 13
		  vol 0Ch
		        noteL As5,6
		        note  C6
		        noteL Cs6,30
		  vol 09h
		        noteL Cs6,6
		  vol 0Ch
		        note  Cs6
		        note  Cs6
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  As5
		  vol 09h
		        note  As5
		  vol 0Ch
		        note  Gs5
		  vol 09h
		        note  Gs5
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  As5
		  vol 09h
		        note  As5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        noteL As5,60
		  vol 09h
		        noteL As5,6
		  vol 07h
		        note  As5
		  vol 0Ch
		        noteL F6,30
		  vol 09h
		        noteL F6,6
		  vol 0Ch
		        note  F6
		        note  F6
		        note  Ds6
		  vol 09h
		        note  Ds6
		  vol 0Ch
		        note  Cs6
		  vol 09h
		        note  Cs6
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  Ds6
		  vol 09h
		        note  Ds6
		  vol 0Ch
		        note  Cs6
		  vol 09h
		        note  Cs6
		  vol 0Ch
		        note  Gs6
		  vol 09h
		        note  Gs6
		  vol 0Ch
		        noteL Fs6,72
		  vol 09h
		        noteL Fs6,6
		  vol 07h
		        note  Fs6
		  vol 05h
		        note  Fs6
		        waitL 30
		  inst 7
		  vol 09h
		        noteL E5,24
		        note  Fs5
		        noteL Gs5,60
		        noteL Fs5,12
		        note  E5
		        note  Cs5
		        noteL Ds5,72
		        noteL Fs5,24
		  sustain
		        noteL B5,120
		  vol 07h
		        noteL B5,6
		  vol 05h
		        note  B5
		  setRelease 01h
		  vol 03h
		        note  B5
		        wait
		  inst 9
		  vol 0Ah
		        noteL D5,24
		        note  E5
		        noteL Fs5,60
		        noteL B5,12
		        note  Cs6
		        note  D6
		        noteL Cs6,72
		        noteL A5,24
		        noteL B5,68
		  inst 26
		  vol 0Ch
		  sustain
		        noteL Gs4,4
		        note  A4
		        note  B4
		        note  Cs5
		        note  Ds5
		        note  E5
		  setRelease 01h
		        note  Fs5
		  vol 0Dh
		  sustain
		        noteL Gs5,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs6,40
		  noSlide
		        noteL A6,12
		        note  Gs6
		        note  Fs6
		        noteL E6,24
		        noteL Gs5,72
		        noteL Gs5,12
		        note  Fs5
		        note  Gs5
		        note  A5
		        noteL E5,36
		        noteL Fs5,12
		        noteL Gs5,96
		  sustain
		        noteL Gs5,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs6,40
		  noSlide
		        noteL A6,12
		        note  Gs6
		        note  Fs6
		  sustain
		        noteL E6,20
		  setRelease 01h
		  setSlide 035h
		        noteL Cs7,40
		  noSlide
		        noteL B6,12
		        note  Gs6
		        note  E6
		  inst 20
		  vol 0Ch
		        noteL Cs6,6
		        note  Ds6
		        noteL E6,18
		  vol 09h
		        noteL E6,6
		  vol 0Ch
		        note  E6
		  vol 09h
		        note  E6
		  vol 0Ch
		        note  Ds6
		        note  E6
		        noteL Fs6,24
		  sustain
		        noteL B5,4
		        note  Cs6
		  setRelease 01h
		        note  Ds6
		        noteL E6,6
		        note  Fs6
		        note  Gs6
		  vol 09h
		        note  Gs6
		  vol 0Ch
		        noteL A6,48
		  inst 26
		  vol 0Ch
		  sustain
		        noteL C6,4
		        note  D6
		        note  E6
		        note  F6
		        note  G6
		  setRelease 01h
		        note  A6
		countedLoopStart 1
		  inst 26
		  vol 0Dh
		        noteL As6,6
		  vol 0Ah
		        note  As6
		  vol 0Dh
		        note  As6
		  vol 0Ah
		        note  As6
		  vol 0Dh
		        note  C7
		  vol 0Ah
		        note  C7
		  vol 08h
		        note  C7
		  vol 06h
		        note  C7
		        waitL 12
		  vol 0Dh
		        noteL G6,6
		  vol 0Ah
		        note  G6
		  vol 0Dh
		        note  G6
		  vol 0Ah
		        note  G6
		  vol 0Dh
		        note  A6
		  vol 0Ah
		        note  A6
		  vol 08h
		        note  A6
		  vol 06h
		        note  A6
		        waitL 24
		  vol 0Dh
		        noteL F6,6
		  vol 0Ah
		        note  F6
		  vol 0Dh
		        note  F6
		  vol 0Ah
		        note  F6
		  vol 0Dh
		        note  F6
		  vol 0Ah
		        note  F6
		  vol 0Dh
		        note  G6
		  vol 0Ah
		        note  G6
		  vol 0Dh
		        note  Ds6
		  vol 0Ah
		        note  Ds6
		  vol 0Dh
		        note  C6
		  vol 0Ah
		        note  C6
		  vol 0Dh
		        note  C6
		  vol 0Ah
		        note  C6
		  vol 08h
		        note  C6
		  vol 06h
		        note  C6
		  inst 13
		  vol 0Dh
		        note  F4
		  vol 0Ah
		        note  F4
		  vol 0Dh
		        note  C5
		  vol 0Ah
		        note  C5
		  vol 0Dh
		        note  F5
		  vol 0Ah
		        note  F5
		  vol 0Dh
		        noteL Ds5,24
		  vol 0Ah
		        noteL Ds5,6
		  vol 08h
		        note  Ds5
		  vol 0Dh
		        note  C5
		  vol 0Ah
		        note  C5
		  vol 0Dh
		        note  Ds5
		  vol 0Ah
		        note  Ds5
		  vol 0Dh
		        note  As5
		  vol 0Ah
		        note  As5
		  vol 0Dh
		        noteL A5,48
		countedLoopEnd
		  vol 0Ah
		        noteL A5,6
		  vol 08h
		        note  A5
		        waitL 24
		  vol 0Ch
		        noteL G6,4
		        note  G6
		  vol 09h
		        note  G6
		  vol 0Ch
		        note  G6
		  vol 09h
		        note  G6
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  E6
		  vol 09h
		        note  E6
		  sustain
		  vol 0Ch
		        noteL F6,216
		  vol 09h
		        noteL F6,8
		  vol 07h
		        note  F6
		  setRelease 01h
		  vol 05h
		        note  F6
		  inst 0
		  vol 0Ch
		        noteL A3,24
		        note  As3
		        note  F4
		        noteL E4,72
		        noteL C4,24
		        noteL D4,12
		        note  F4
		  sustain
		        note  A4
		  vol 09h
		        noteL A4,6
		  setRelease 01h
		  vol 07h
		        note  A4
		        waitL 156
		  vol 0Ch
		        noteL A3,12
		        note  As3
		        note  F4
		        noteL E4,36
		        noteL C4,12
		        noteL D4,18
		        noteL A4,6
		  sustain
		        noteL C5,12
		  vol 09h
		        noteL C5,6
		  vol 07h
		  setRelease 01h
		        note  C5
		        waitL 36
		  vol 0Ch
		        noteL A3,12
		        note  As3
		        note  F4
		        note  E4
		        note  C4
		        note  D4
		        note  A4
		        noteL G4,18
		        noteL E4,6
		        noteL F4,12
		        noteL C5,24
		        noteL As4,12
		  vol 0Ch
		  sustain
		        note  E5
		  vol 09h
		        noteL E5,6
		  setRelease 01h
		  vol 07h
		        note  E5
		        waitL 12
		  vol 0Ch
		        note  F4
		        note  C5
		        note  As4
		  sustain
		        note  E5
		  vol 09h
		        noteL E5,6
		  vol 07h
		  setRelease 01h
		        note  E5
		        waitL 12
		  inst 26
		  vol 0Ch
		        note  F5
		        noteL C6,18
		        noteL As5,6
		  inst 15
		  vol 0Ch
		        noteL E6,52
		  inst 26
		  vol 0Ch
		        noteL D6,4
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs5
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D6
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E6
		        note  D6
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  Gs5
		        note  A5
		        note  B5
		        note  Cs6
		        note  D6
		        note  Gs5
		        note  A5
		        note  B5
		        note  Cs6
		        note  D6
		        note  E6
		  inst 20
		countedLoopStart 1
		  vol 0Ch
		        noteL F6,6
		  vol 09h
		        note  F6
		  vol 07h
		        note  F6
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Ch
		        noteL F6,6
		  vol 09h
		        note  F6
		  vol 07h
		        note  F6
		        wait
		countedLoopEnd
		  vol 0Ch
		        noteL F6,6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 07h
		        note  F6
		        wait
		  vol 0Ch
		        note  F6
		        note  F6
		        note  F6
		  vol 09h
		        note  F6
		  vol 07h
		        note  F6
		        wait
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 07h
		        note  F6
		        waitL 18
		  vol 0Ch
		        noteL F6,6
		  vol 09h
		        note  F6
		  vol 07h
		        note  F6
		        wait
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 07h
		        note  F6
		        wait
		  vol 0Ch
		        note  F6
		        note  F6
		  vol 0Ch
		        note  As6
		  vol 09h
		        note  As6
		  vol 0Ch
		        note  As4
		        note  As4
		        note  As4
		  vol 09h
		        note  As4
		  vol 0Ch
		        note  As4
		        note  As4
		        note  As4
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		  vol 05h
		        note  As4
		        waitL 24
		channel_end
Music_9_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 120
		  inst 16
		countedLoopStart 2
		  vol 09h
		        noteL B6,5
		  vol 05h
		        noteL B6,3
		countedLoopEnd
		  sustain
		  vol 09h
		        noteL A6,48
		  vibrato 020h
		  vol 07h
		        noteL A6,6
		  vol 05h
		        note  A6
		  setRelease 01h
		  vol 03h
		        note  A6
		        waitL 102
		  vibrato 02Ch
		  vol 09h
		        noteL D7,18
		        noteL E7,4
		        waitL 2
		  vol 08h
		  sustain
		        noteL E7,36
		  vol 06h
		        noteL E7,6
		  vol 04h
		  setRelease 01h
		        note  E7
		  inst 9
		  vol 08h
		        noteL C5,24
		        note  D5
		        note  E5
		        note  F5
		        note  G5
		        note  A5
		        note  B5
		  sustain
		        note  C6
		  vol 07h
		        noteL C6,6
		  vol 05h
		        note  C6
		  vol 03h
		  setRelease 01h
		        note  C6
		        wait
		  inst 16
		countedLoopStart 2
		  vol 08h
		        noteL F7,5
		  vol 05h
		        noteL F7,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL D7,48
		  vol 05h
		        noteL D7,6
		  vol 03h
		        note  D7
		  setRelease 01h
		  vol 01h
		        note  D7
		        wait
		countedLoopStart 2
		  vol 08h
		        noteL F7,5
		  vol 05h
		        noteL F7,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL D7,48
		  vol 05h
		        noteL D7,5
		  vol 03h
		        note  D7
		  vol 01h
		  setRelease 01h
		        note  D7
		        waitL 10
		  vol 08h
		        noteL F7,5
		  vol 05h
		        noteL F7,4
		  vol 08h
		        noteL F7,6
		  vol 05h
		        noteL F7,4
		  vol 08h
		        noteL F7,7
		  vol 05h
		        noteL F7,4
		  vol 08h
		        noteL D7,59
		  sustain
		        noteL Ds7,132
		  vol 06h
		        noteL Ds7,6
		  setRelease 01h
		  vol 04h
		        note  Ds7
		  inst 13
		  vol 0Ch
		        noteL E6,4
		        note  E6
		  vol 09h
		        note  E6
		  vol 0Ch
		        note  E6
		  vol 09h
		        note  E6
		  vol 0Ch
		        note  D6
		  vol 09h
		        note  D6
		        waitL 8
		  vol 0Ch
		        noteL E6,48
		  vol 09h
		        noteL E6,8
		  setRelease 05h
		  inst 27
		  vol 0Ah
		        note  E4
		        note  E4
		        note  E4
		        note  G4
		        note  G4
		        note  G4
		        note  As4
		        note  As4
		        note  As4
		        note  C5
		        note  C5
		  setRelease 01h
		        noteL D5,12
		  vol 06h
		        noteL D5,6
		  vol 04h
		        note  D5
		        waitL 12
		  inst 20
		  vol 0Ah
		        noteL D5,6
		        note  D5
		        noteL D5,36
		  vol 06h
		        noteL D5,6
		  vol 0Ah
		        note  D5
		        noteL C5,96
		  inst 16
		  vol 0Bh
		        noteL D6,66
		  vol 08h
		        noteL D6,6
		  vol 0Bh
		        noteL D6,4
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		  inst 9
		  vol 0Ah
		        noteL E5,6
		  sustain
		        noteL F5,90
		  vol 08h
		        noteL F5,6
		  vol 06h
		  setRelease 01h
		        note  F5
		        waitL 180
		repeatStart
		  inst 20
		  vol 0Bh
		        noteL D5,6
		  vol 08h
		        note  D5
		  vol 06h
		        note  D5
		        wait
		  vol 0Bh
		        noteL D5,12
		  vol 08h
		        noteL D5,6
		  vol 0Bh
		        note  D5
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 0Bh
		        noteL Ds5,24
		        noteL Ds5,6
		  vol 08h
		        note  Ds5
		  vol 0Bh
		        note  F5
		  vol 08h
		        note  F5
		  vol 0Bh
		        noteL F5,24
		        noteL F5,6
		  vol 08h
		        note  F5
		  vol 0Bh
		        note  Ds5
		        note  Ds5
		        noteL Ds5,36
		  vol 08h
		        noteL Ds5,6
		  vol 06h
		        note  Ds5
		        waitL 84
		repeatSection1Start
		        waitL 72
		  inst 38
		  vol 0Bh
		  sustain
		        noteL F6,4
		        note  Fs6
		        note  G6
		        note  A6
		        note  As6
		  setRelease 01h
		        note  C7
		  inst 47
		  vol 0Bh
		        noteL D7,60
		        noteL F6,12
		        note  Fs6
		        noteL Ds7,36
		        noteL D7,48
		        noteL C7,24
		        noteL As6,72
		        noteL C7,12
		        note  D7
		        noteL C7,54
		  inst 26
		  vol 0Bh
		        noteL As6,6
		        note  A6
		        note  F6
		        note  Ds6
		        note  C6
		        note  As5
		        note  A5
		        waitL 192
		repeatEnd
		repeatSection2Start
		        waitL 96
		  inst 13
		  vol 0Ah
		        noteL As4,48
		        note  Fs4
		        noteL F4,12
		  vol 07h
		        noteL F4,6
		  vol 05h
		        note  F4
		  vol 0Ah
		        noteL F4,72
		        noteL As4,48
		        note  Gs4
		        noteL Fs4,12
		  vol 07h
		        noteL Fs4,6
		  vol 05h
		        note  Fs4
		  vol 0Ah
		        noteL Fs4,36
		  inst 38
		  vol 0Dh
		        noteL Cs5,12
		        note  B4
		        note  As4
		        noteL Gs4,36
		        noteL Fs4,6
		        note  Gs4
		        noteL Cs4,72
		        noteL Ds4,24
		        note  E4
		        note  Gs4
		        noteL Fs4,36
		        noteL B4,6
		  vol 0Ah
		        note  B4
		  vol 0Dh
		        noteL Fs4,144
		  inst 20
		  vol 0Bh
		        noteL Fs4,30
		  vol 08h
		        noteL Fs4,6
		  vol 0Bh
		        note  E4
		        note  Fs4
		        noteL B3,64
		  vol 08h
		        noteL B3,8
		  vol 0Bh
		        noteL Cs4,16
		  vol 08h
		        noteL Cs4,8
		  vol 0Bh
		        noteL D4,16
		  vol 08h
		        noteL D4,8
		  vol 0Bh
		        noteL Fs4,16
		  vol 08h
		        noteL Fs4,8
		  vol 0Bh
		        noteL E4,30
		  vol 08h
		        noteL E4,6
		  vol 0Bh
		        note  A4
		  vol 08h
		        note  A4
		  vol 0Bh
		        noteL E4,42
		  vol 08h
		        noteL E4,6
		  vol 0Bh
		        noteL Fs4,30
		  vol 08h
		        noteL Fs4,6
		  vol 0Bh
		        note  B4
		  vol 08h
		        note  B4
		  vol 0Bh
		        noteL Fs4,48
		  vol 08h
		        noteL Fs4,6
		  vol 06h
		        note  Fs4
		        waitL 12
		  inst 27
		  vol 09h
		        noteL Fs4,24
		        note  Gs4
		        note  A4
		        noteL B4,36
		        noteL E5,6
		  vol 05h
		        note  E5
		  sustain
		  vol 09h
		        noteL B4,54
		  vol 05h
		        noteL B4,6
		  setRelease 01h
		  vol 03h
		        note  B4
		        wait
		  vol 09h
		        noteL D5,24
		        note  Cs5
		        note  B4
		        noteL B4,36
		        noteL Cs5,6
		  vol 05h
		        note  Cs5
		  sustain
		  vol 09h
		        noteL Cs5,54
		  vol 05h
		        noteL Cs5,6
		  vol 03h
		  setRelease 01h
		        note  Cs5
		        wait
		  vol 09h
		        noteL Fs4,24
		        note  D5
		        note  B4
		        note  Cs5
		        noteL E5,48
		  sustain
		        noteL Gs5,24
		  vol 05h
		        noteL Gs5,6
		  vol 03h
		  setRelease 01h
		        note  Gs5
		        waitL 12
		  inst 13
		  vol 0Ch
		        noteL E6,24
		  vol 09h
		        noteL E6,6
		  vol 07h
		        note  E6
		        waitL 12
		  vol 0Ch
		        noteL Fs6,24
		  vol 0Ch
		        noteL Gs6,6
		  vol 09h
		        note  Gs6
		  vol 07h
		        note  Gs6
		        wait
		  vol 0Ch
		        noteL Fs6,60
		  vol 09h
		        noteL Fs6,6
		  vol 07h
		        note  Fs6
		countedLoopStart 1
		  inst 26
		  vol 0Ch
		        noteL D6,6
		  vol 09h
		        note  D6
		  vol 0Ch
		        note  D6
		  vol 09h
		        note  D6
		  vol 0Ch
		        note  Ds6
		  vol 09h
		        note  Ds6
		  vol 07h
		        note  Ds6
		  vol 05h
		        note  Ds6
		        waitL 12
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
		        waitL 24
		  vol 0Ch
		        noteL A5,6
		  vol 09h
		        note  A5
		  vol 0Ch
		        note  A5
		  vol 09h
		        note  A5
		  vol 0Ch
		        note  A5
		  vol 09h
		        note  A5
		  vol 0Ch
		        note  As5
		  vol 09h
		        note  As5
		  vol 0Ch
		        note  G5
		  vol 09h
		        note  G5
		  vol 0Ch
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 0Ch
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 07h
		        note  Ds5
		  vol 05h
		        note  Ds5
		        waitL 24
		  inst 3
		  vol 0Dh
		        noteL C4,6
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
		        noteL A4,24
		  vol 0Ah
		        noteL A4,6
		  vol 08h
		        note  A4
		  vol 0Dh
		        note  F4
		  vol 0Ah
		        note  F4
		  vol 0Dh
		        note  C5
		  vol 0Ah
		        note  C5
		  vol 0Dh
		        note  F5
		  vol 0Ah
		        note  F5
		  vol 0Dh
		        noteL Ds5,24
		countedLoopEnd
		  vol 0Ah
		        noteL Ds5,6
		  vol 08h
		        note  Ds5
		        waitL 24
		  inst 13
		  vol 0Ch
		        noteL E6,4
		        note  E6
		  vol 09h
		        note  E6
		  vol 0Ch
		        note  E6
		  vol 09h
		        note  E6
		  vol 0Ch
		        note  D6
		  vol 09h
		        note  D6
		        waitL 8
		  sustain
		  vol 0Ch
		        noteL E6,216
		  vol 09h
		        noteL E6,8
		  vol 07h
		        note  E6
		  setRelease 01h
		  vol 05h
		        note  E6
		        waitL 192
		  inst 20
		  sustain
		  vol 0Ch
		        noteL A5,6
		  vol 09h
		        note  A5
		  vol 07h
		        note  A5
		  setRelease 01h
		  vol 05h
		        note  A5
		        waitL 132
		        wait
		  vol 0Ch
		  sustain
		        noteL C6,6
		  vol 09h
		        note  C6
		  vol 07h
		        note  C6
		  vol 05h
		  setRelease 01h
		        note  C6
		        waitL 192
		  sustain
		  vol 0Ch
		        noteL E6,6
		  vol 09h
		        note  E6
		  vol 07h
		        note  E6
		  vol 05h
		  setRelease 01h
		        note  E6
		        waitL 48
		  sustain
		  vol 0Ch
		        noteL E6,6
		  vol 09h
		        note  E6
		  vol 07h
		        note  E6
		  vol 05h
		  setRelease 01h
		        note  E6
		        waitL 48
		  vol 0Ch
		  sustain
		        noteL E6,192
		  setRelease 01h
		        noteL E6,96
		countedLoopStart 1
		  vol 0Bh
		        noteL C6,6
		  vol 08h
		        note  C6
		  vol 06h
		        note  C6
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Bh
		        noteL C6,6
		  vol 08h
		        note  C6
		  vol 06h
		        note  C6
		        wait
		countedLoopEnd
		  vol 0Bh
		        noteL As5,6
		  vol 08h
		        note  As5
		  vol 0Bh
		        note  As5
		  vol 08h
		        note  As5
		  vol 06h
		        note  As5
		        wait
		  vol 0Bh
		        note  B5
		        note  B5
		        note  B5
		  vol 08h
		        note  B5
		  vol 06h
		        note  B5
		        wait
		  vol 0Bh
		        note  B5
		  vol 08h
		        note  B5
		  vol 06h
		        note  B5
		        waitL 18
		  vol 0Bh
		        noteL Cs6,6
		  vol 08h
		        note  Cs6
		  vol 06h
		        note  Cs6
		        wait
		  vol 0Bh
		        note  Cs6
		  vol 08h
		        note  Cs6
		  vol 0Bh
		        note  Cs6
		  vol 08h
		        note  Cs6
		  vol 06h
		        note  Cs6
		        wait
		  vol 0Bh
		        note  Cs6
		        note  Cs6
		  vol 0Bh
		        note  D6
		  vol 08h
		        note  D6
		  vol 0Bh
		        note  As3
		        note  As3
		        note  As3
		  vol 08h
		        note  As3
		  vol 0Bh
		        note  As3
		        note  As3
		        note  As3
		  vol 08h
		        note  As3
		  vol 06h
		        note  As3
		  vol 04h
		        note  As3
		        waitL 24
		channel_end
Music_9_Channel_3:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 120
		  inst 16
		countedLoopStart 2
		  vol 09h
		        noteL G6,5
		  vol 05h
		        noteL G6,3
		countedLoopEnd
		  sustain
		  vol 09h
		        noteL F6,48
		  vibrato 020h
		  vol 07h
		        noteL F6,6
		  vol 05h
		        note  F6
		  vol 03h
		  setRelease 01h
		        note  F6
		        waitL 102
		  vibrato 02Ch
		  vol 09h
		        noteL B6,18
		        noteL C7,4
		        waitL 2
		  vol 08h
		  sustain
		        noteL C7,36
		  vol 06h
		        noteL C7,6
		  vol 04h
		  setRelease 01h
		        note  C7
		  inst 9
		  vol 08h
		        noteL A4,24
		        note  B4
		        note  C5
		        note  D5
		        note  E5
		        note  F5
		        note  G5
		  sustain
		        note  A5
		  vol 07h
		        noteL A5,6
		  vol 05h
		        note  A5
		  setRelease 01h
		  vol 03h
		        note  A5
		        wait
		  inst 16
		countedLoopStart 2
		  vol 08h
		        noteL A6,5
		  vol 05h
		        noteL A6,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL F6,48
		  vol 05h
		        noteL F6,6
		  vol 03h
		        note  F6
		  setRelease 01h
		  vol 01h
		        note  F6
		        wait
		countedLoopStart 2
		  vol 08h
		        noteL A6,5
		  vol 05h
		        noteL A6,3
		countedLoopEnd
		  vol 08h
		  sustain
		        noteL F6,48
		  vol 05h
		        noteL F6,5
		  vol 03h
		        note  F6
		  vol 01h
		  setRelease 01h
		        note  F6
		        waitL 10
		  vol 08h
		        noteL A6,5
		  vol 05h
		        noteL A6,4
		  vol 08h
		        noteL A6,6
		  vol 05h
		        noteL A6,4
		  vol 08h
		        noteL A6,7
		  vol 05h
		        noteL A6,4
		  vol 08h
		        noteL F6,59
		  sustain
		        noteL G6,132
		  vol 06h
		        noteL G6,6
		  vol 04h
		  setRelease 01h
		        note  G6
		  inst 13
		  vol 0Ch
		        noteL C6,4
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		        waitL 8
		  vol 0Ch
		        noteL C6,48
		  vol 09h
		        noteL C6,8
		        wait
		  shifting 020h
		  stereo 080h
		  setRelease 05h
		  inst 27
		  vol 09h
		        note  E4
		        note  E4
		        note  E4
		        note  G4
		        note  G4
		        note  G4
		        note  As4
		        note  As4
		        note  As4
		        note  C5
		        note  C5
		  setRelease 01h
		        noteL D5,12
		  vol 05h
		        noteL D5,6
		  vol 03h
		        note  D5
		        waitL 10
		  inst 20
		  vol 0Ah
		        noteL D5,6
		        note  D5
		        noteL D5,36
		  vol 06h
		        noteL D5,6
		  vol 0Ah
		        note  D5
		        noteL C5,96
		  inst 16
		  vol 0Ah
		        noteL D6,66
		  vol 07h
		        noteL D6,6
		  vol 0Ah
		        noteL D6,4
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		  inst 9
		  vol 09h
		        noteL E5,6
		  sustain
		        noteL F5,90
		  vol 07h
		        noteL F5,6
		  vol 05h
		  setRelease 01h
		        note  F5
		        waitL 174
		repeatStart
		  stereo 0C0h
		  shifting 00h
		  inst 20
		  vol 0Bh
		        noteL As4,6
		  vol 08h
		        note  As4
		  vol 06h
		        note  As4
		        wait
		  vol 0Bh
		        noteL As4,12
		  vol 08h
		        noteL As4,6
		  vol 0Bh
		        note  As4
		        note  C5
		  vol 08h
		        note  C5
		  vol 0Bh
		        noteL C5,24
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        noteL Cs5,24
		        noteL Cs5,6
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        note  C5
		        note  C5
		        noteL C5,36
		  vol 08h
		        noteL C5,6
		  vol 06h
		        note  C5
		        waitL 84
		repeatSection1Start
		        waitL 80
		  stereo 080h
		  shifting 020h
		  inst 38
		  vol 0Ah
		  sustain
		        noteL F6,4
		        note  Fs6
		        note  G6
		        note  A6
		        note  As6
		  setRelease 01h
		        note  C7
		  inst 47
		  vol 0Ah
		        noteL D7,58
		        noteL F6,12
		        note  Fs6
		        noteL Ds7,36
		        noteL D7,48
		        noteL C7,24
		        noteL As6,72
		        noteL C7,12
		        note  D7
		        noteL C7,54
		  inst 26
		  vol 0Ah
		        noteL As6,6
		        note  A6
		        note  F6
		        note  Ds6
		        note  C6
		        note  As5
		        note  A5
		        waitL 186
		repeatEnd
		repeatSection2Start
		        waitL 96
		  inst 13
		  vol 0Ah
		        noteL F5,48
		        note  Ds5
		        noteL D5,12
		  vol 07h
		        noteL D5,6
		  vol 05h
		        note  D5
		  vol 0Ah
		        noteL D5,72
		        noteL Fs5,48
		        note  F5
		        noteL Ds5,12
		  vol 07h
		        noteL Ds5,6
		  vol 05h
		        note  Ds5
		  vol 0Ah
		        noteL B4,42
		  stereo 080h
		  shifting 020h
		  inst 38
		  vol 0Ch
		        noteL Cs5,12
		        note  B4
		        note  As4
		        noteL Gs4,36
		        noteL Fs4,6
		        note  Gs4
		        noteL Cs4,72
		        noteL Ds4,24
		        note  E4
		        note  Gs4
		        noteL Fs4,36
		        noteL B4,6
		  vol 09h
		        note  B4
		  vol 0Ch
		        noteL Fs4,144
		  inst 20
		  vol 0Ah
		        noteL Fs4,30
		  vol 07h
		        noteL Fs4,6
		  vol 0Ah
		        note  E4
		        note  Fs4
		        noteL B3,64
		  vol 07h
		        noteL B3,8
		  vol 0Ah
		        noteL Cs4,16
		  vol 07h
		        noteL Cs4,8
		  vol 0Ah
		        noteL D4,16
		  vol 07h
		        noteL D4,8
		  vol 0Ah
		        noteL Fs4,16
		  vol 07h
		        noteL Fs4,8
		  vol 0Ah
		        noteL E4,30
		  vol 07h
		        noteL E4,6
		  vol 0Ah
		        note  A4
		  vol 07h
		        note  A4
		  vol 0Ah
		        noteL E4,42
		  vol 07h
		        noteL E4,6
		  vol 0Ah
		        noteL Fs4,30
		  vol 07h
		        noteL Fs4,6
		  vol 0Ah
		        note  B4
		  vol 07h
		        note  B4
		  vol 0Ah
		        noteL Fs4,48
		  vol 07h
		        noteL Fs4,6
		  vol 05h
		        note  Fs4
		        waitL 12
		  inst 27
		  vol 08h
		        noteL Fs4,24
		        note  Gs4
		        note  A4
		        noteL B4,36
		        noteL E5,6
		  vol 04h
		        note  E5
		  sustain
		  vol 09h
		        noteL B4,54
		  vol 04h
		        noteL B4,6
		  setRelease 01h
		  vol 02h
		        note  B4
		        wait
		  vol 08h
		        noteL D5,24
		        note  Cs5
		        note  B4
		        noteL B4,36
		        noteL Cs5,6
		  vol 04h
		        note  Cs5
		  sustain
		  vol 08h
		        noteL Cs5,54
		  vol 04h
		        noteL Cs5,6
		  vol 02h
		  setRelease 01h
		        note  Cs5
		        wait
		  vol 08h
		        noteL Fs4,24
		        note  D5
		        note  B4
		        note  Cs5
		        noteL E5,48
		  sustain
		        noteL Gs5,24
		  vol 04h
		        noteL Gs5,6
		  vol 02h
		  setRelease 01h
		        note  Gs5
		        wait
		  shifting 00h
		  stereo 0C0h
		  inst 13
		  vol 0Ch
		        noteL Cs6,24
		  vol 09h
		        noteL Cs6,6
		  vol 07h
		        note  Cs6
		        waitL 12
		  vol 0Ch
		        noteL Ds6,24
		  vol 0Ch
		        noteL E6,6
		  vol 09h
		        note  E6
		  vol 07h
		        note  E6
		        wait
		  vol 0Ch
		        noteL D6,60
		  vol 09h
		        noteL D6,6
		  vol 07h
		        note  D6
		        wait
		  stereo 080h
		  shifting 020h
		countedLoopStart 1
		  inst 26
		  vol 0Bh
		        noteL D6,6
		  vol 08h
		        note  D6
		  vol 0Bh
		        note  D6
		  vol 08h
		        note  D6
		  vol 0Bh
		        note  Ds6
		  vol 08h
		        note  Ds6
		  vol 06h
		        note  Ds6
		  vol 04h
		        note  Ds6
		        waitL 12
		  vol 0Bh
		        noteL As5,6
		  vol 08h
		        note  As5
		  vol 0Bh
		        note  As5
		  vol 08h
		        note  As5
		  vol 0Bh
		        note  C6
		  vol 08h
		        note  C6
		  vol 06h
		        note  C6
		  vol 04h
		        note  C6
		        waitL 24
		  vol 0Bh
		        noteL A5,6
		  vol 08h
		        note  A5
		  vol 0Bh
		        note  A5
		  vol 08h
		        note  A5
		  vol 0Bh
		        note  A5
		  vol 08h
		        note  A5
		  vol 0Bh
		        note  As5
		  vol 08h
		        note  As5
		  vol 0Bh
		        note  G5
		  vol 08h
		        note  G5
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		  vol 04h
		        note  Ds5
		        waitL 24
		  inst 3
		  vol 0Ch
		        noteL C4,6
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
		        noteL A4,24
		  vol 09h
		        noteL A4,6
		  vol 07h
		        note  A4
		  vol 0Ch
		        note  F4
		  vol 09h
		        note  F4
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        noteL Ds5,24
		countedLoopEnd
		  vol 09h
		        noteL Ds5,6
		  vol 07h
		        note  Ds5
		        waitL 18
		  stereo 0C0h
		  shifting 00h
		  inst 13
		  vol 0Ch
		        noteL C6,4
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		        waitL 8
		  sustain
		  vol 0Ch
		        noteL C6,216
		  vol 09h
		        noteL C6,8
		  vol 07h
		        note  C6
		  vol 05h
		  setRelease 01h
		        note  C6
		        waitL 198
		  shifting 020h
		  stereo 080h
		  inst 20
		  sustain
		  vol 0Bh
		        noteL A5,6
		  vol 08h
		        note  A5
		  vol 06h
		        note  A5
		  setRelease 01h
		  vol 04h
		        note  A5
		        waitL 132
		        wait
		  vol 0Bh
		  sustain
		        noteL C6,6
		  vol 08h
		        note  C6
		  vol 06h
		        note  C6
		  vol 04h
		  setRelease 01h
		        note  C6
		        waitL 192
		  sustain
		  vol 0Bh
		        noteL E6,6
		  vol 08h
		        note  E6
		  vol 06h
		        note  E6
		  vol 04h
		  setRelease 01h
		        note  E6
		        waitL 48
		  sustain
		  vol 0Bh
		        noteL E6,6
		  vol 08h
		        note  E6
		  vol 06h
		        note  E6
		  vol 04h
		  setRelease 01h
		        note  E6
		        waitL 48
		  vol 0Bh
		  sustain
		        noteL E6,186
		  setRelease 01h
		        noteL E6,96
		countedLoopStart 1
		  vol 0Bh
		        noteL As5,6
		  vol 08h
		        note  As5
		  vol 06h
		        note  As5
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Bh
		        noteL Gs5,6
		  vol 08h
		        note  Gs5
		  vol 06h
		        note  Gs5
		        wait
		countedLoopEnd
		  vol 0Bh
		        noteL Fs5,6
		  vol 08h
		        note  Fs5
		  vol 0Bh
		        note  Fs5
		  vol 08h
		        note  Fs5
		  vol 06h
		        note  Fs5
		        wait
		  vol 0Bh
		        note  Gs5
		        note  Gs5
		        note  Gs5
		  vol 08h
		        note  Gs5
		  vol 06h
		        note  Gs5
		        wait
		  vol 0Bh
		        note  Gs5
		  vol 08h
		        note  Gs5
		  vol 06h
		        note  Gs5
		        waitL 18
		  vol 0Bh
		        noteL Gs5,6
		  vol 08h
		        note  Gs5
		  vol 06h
		        note  Gs5
		        wait
		  vol 0Bh
		        note  A5
		  vol 08h
		        note  A5
		  vol 0Bh
		        note  A5
		  vol 08h
		        note  A5
		  vol 06h
		        note  A5
		        wait
		  vol 0Bh
		        note  A5
		        note  A5
		  vol 0Bh
		        note  As5
		  vol 08h
		        note  As5
		  inst 32
		  vol 0Dh
		        note  As3
		        note  As3
		        note  As3
		  vol 0Ah
		        note  As3
		  vol 0Dh
		        note  As3
		        note  As3
		        note  As3
		  vol 0Ah
		        note  As3
		  vol 08h
		        note  As3
		  vol 06h
		        note  As3
		        waitL 24
		channel_end
Music_9_Channel_4:
		  shifting 020h
		  stereo 040h
		  setRelease 01h
		  vibrato 035h
		        waitL 6
		  inst 15
		  vol 00h
		        noteL F3,12
		  vol 0Ah
		        note  E4
		        note  F4
		        note  C5
		        noteL B4,36
		        noteL G4,12
		        note  A4
		        note  C5
		  vibrato 03Ch
		  sustain
		        noteL E5,72
		  vibrato 030h
		  vol 08h
		        noteL E5,6
		  vol 06h
		  setRelease 01h
		        note  E5
		  vol 0Ah
		  vibrato 035h
		        noteL E4,12
		        note  F4
		        note  C5
		        note  B4
		        note  G4
		        noteL A4,18
		        noteL E5,6
		  vibrato 03Ch
		  sustain
		        noteL G5,72
		  vibrato 030h
		  vol 08h
		        noteL G5,6
		  vol 06h
		  setRelease 01h
		        note  G5
		  vol 0Ah
		  vibrato 035h
		        noteL E4,12
		        note  F4
		        note  C5
		        note  B4
		        note  G4
		        note  A4
		        note  E5
		        note  D5
		        note  B4
		        note  C5
		        noteL G5,24
		        noteL F5,12
		  vibrato 03Ch
		  sustain
		        noteL B5,24
		  vibrato 030h
		  vol 08h
		        noteL B5,6
		  vol 06h
		  setRelease 01h
		        note  B5
		  vol 0Ah
		  vibrato 035h
		        noteL C5,12
		        note  G5
		        note  F5
		  vibrato 03Ch
		  sustain
		        noteL B5,48
		  vibrato 030h
		  vol 08h
		        noteL B5,6
		  vol 06h
		  setRelease 01h
		        note  B5
		  vibrato 035h
		  vol 0Ah
		        noteL C5,12
		        noteL G5,18
		        noteL F5,6
		  vibrato 03Ch
		  sustain
		        noteL B5,48
		  vibrato 030h
		  vol 08h
		        noteL B5,6
		  vol 06h
		  setRelease 01h
		        note  B5
		  vol 0Ah
		  vibrato 035h
		        noteL C6,12
		        noteL G6,18
		        noteL F6,6
		  vibrato 03Fh
		  sustain
		        noteL B6,222
		  vibrato 030h
		  vol 08h
		        noteL B6,7
		  vol 06h
		  setRelease 01h
		        note  B6
		  vibrato 02Ch
		  inst 13
		  vol 0Bh
		        noteL G6,4
		        note  G6
		  vol 08h
		        note  G6
		  vol 0Bh
		        note  G6
		  vol 08h
		        note  G6
		  vol 0Bh
		        note  F6
		  vol 08h
		        note  F6
		  vol 0Bh
		        note  E6
		  vol 08h
		        note  E6
		  vol 0Bh
		        noteL F6,48
		  vol 08h
		        noteL F6,8
		  setRelease 05h
		  inst 27
		  vol 09h
		        note  G4
		        note  G4
		        note  G4
		        note  As4
		        note  As4
		        note  As4
		        note  D5
		        note  D5
		        note  D5
		        note  E5
		        note  E5
		  setRelease 01h
		        noteL F5,12
		  vol 05h
		        noteL F5,6
		  vol 03h
		        note  F5
		        waitL 10
		  inst 20
		  vol 0Ah
		        noteL E5,6
		        note  E5
		        noteL E5,36
		  vol 06h
		        noteL E5,6
		  vol 0Ah
		        note  F5
		        noteL D5,96
		  inst 16
		  vol 0Ah
		        noteL F6,6
		        note  E6
		        noteL F6,54
		  vol 07h
		        noteL F6,6
		  vol 0Ah
		        noteL F6,4
		        note  E6
		        note  Ds6
		        note  D6
		        note  Cs6
		        note  C6
		  sustain
		        noteL D6,96
		  vol 07h
		        noteL D6,6
		  setRelease 01h
		  vol 05h
		        note  D6
		repeatStart
		  inst 27
		  vol 0Ah
		        noteL A4,12
		        noteL As4,6
		  vol 06h
		        note  As4
		  vol 0Ah
		        note  G5
		  vol 06h
		        note  G5
		  vol 0Ah
		        noteL F5,36
		        noteL D5,6
		  vol 06h
		        note  D5
		  vol 0Ah
		        note  Ds5
		  vol 06h
		        note  Ds5
		  vol 0Ah
		        noteL C6,24
		        noteL As5,6
		  vol 06h
		        note  As5
		  vol 0Ah
		        noteL A5,24
		        noteL D5,18
		        noteL Ds5,6
		  inst 20
		  vol 0Ah
		        note  F5
		  vol 07h
		        note  F5
		  vol 05h
		        note  F5
		        wait
		  vol 0Ah
		        noteL F5,12
		  vol 07h
		        noteL F5,6
		  vol 0Ah
		        note  F5
		        note  G5
		  vol 07h
		        note  G5
		  vol 0Ah
		        noteL G5,24
		        noteL G5,6
		  vol 07h
		        note  G5
		  vol 0Ah
		        note  Gs5
		  vol 07h
		        note  Gs5
		  vol 0Ah
		        noteL Gs5,24
		        noteL Gs5,6
		  vol 07h
		        note  Gs5
		  vol 0Ah
		        note  G5
		        note  F5
		        noteL G5,36
		  vol 07h
		        noteL G5,6
		  vol 05h
		        note  G5
		  inst 26
		repeatSection1Start
		  vol 0Bh
		        noteL A5,12
		        note  As5
		        note  G6
		        note  F6
		        note  D6
		        noteL Ds6,6
		  vol 08h
		        note  Ds6
		  vol 06h
		        note  Ds6
		  vol 0Bh
		        note  As6
		        noteL C7,36
		        noteL As6,12
		        noteL A6,48
		  vol 08h
		        noteL A6,6
		  vol 06h
		        note  A6
		  vol 0Bh
		        noteL F4,12
		        note  Fs4
		        note  Ds5
		        noteL D5,36
		        noteL C5,12
		        note  C5
		        noteL As4,24
		        noteL As4,6
		        note  A4
		        note  As4
		  vol 08h
		        note  As4
		  vol 0Bh
		        noteL G4,12
		        note  A4
		        note  As4
		        note  D5
		        noteL C5,24
		        note  G5
		        noteL G5,12
		        note  F5
		        note  E5
		        noteL G5,6
		  vol 08h
		        note  G5
		  vol 0Bh
		        noteL F5,84
		  vol 08h
		        noteL F5,6
		  vol 06h
		        note  F5
		repeatEnd
		repeatSection2Start
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
		        noteL A5,36
		  inst 13
		  vol 0Bh
		        noteL As5,6
		        note  C6
		        noteL Cs6,30
		  vol 08h
		        noteL Cs6,6
		  vol 0Bh
		        note  Cs6
		        note  Cs6
		        note  C6
		  vol 08h
		        note  C6
		  vol 0Bh
		        note  As5
		  vol 08h
		        note  As5
		  vol 0Bh
		        note  Gs5
		  vol 08h
		        note  Gs5
		  vol 0Bh
		        note  C6
		  vol 08h
		        note  C6
		  vol 0Bh
		        note  As5
		  vol 08h
		        note  As5
		  vol 0Bh
		        note  F5
		  vol 08h
		        note  F5
		  vol 0Bh
		        noteL As5,60
		  vol 08h
		        noteL As5,6
		  vol 06h
		        note  As5
		  vol 0Bh
		        noteL F6,30
		  vol 08h
		        noteL F6,6
		  vol 0Bh
		        note  F6
		        note  F6
		        note  Ds6
		  vol 08h
		        note  Ds6
		  vol 0Bh
		        note  Cs6
		  vol 08h
		        note  Cs6
		  vol 0Bh
		        note  C6
		  vol 08h
		        note  C6
		  vol 0Bh
		        note  Ds6
		  vol 08h
		        note  Ds6
		  vol 0Bh
		        note  Cs6
		  vol 08h
		        note  Cs6
		  vol 0Bh
		        note  Gs6
		  vol 08h
		        note  Gs6
		  vol 0Bh
		        noteL Fs6,72
		  vol 08h
		        noteL Fs6,6
		  vol 06h
		        note  Fs6
		  vol 04h
		        note  Fs6
		        waitL 30
		  inst 7
		  vol 08h
		        noteL E5,24
		        note  Fs5
		        noteL Gs5,60
		        noteL Fs5,12
		        note  E5
		        note  Cs5
		        noteL Ds5,72
		        noteL Fs5,24
		  sustain
		        noteL B5,120
		  vol 06h
		        noteL B5,6
		  vol 04h
		        note  B5
		  setRelease 01h
		  vol 02h
		        note  B5
		        wait
		  inst 9
		  vol 09h
		        noteL D5,24
		        note  E5
		        noteL Fs5,60
		        noteL B5,12
		        note  Cs6
		        note  D6
		        noteL Cs6,72
		        noteL A5,24
		        noteL B5,68
		  inst 26
		  vol 0Bh
		  sustain
		        noteL Gs4,4
		        note  A4
		        note  B4
		        note  Cs5
		        note  Ds5
		        note  E5
		  setRelease 01h
		        note  Fs5
		  vol 0Ch
		  sustain
		        noteL Gs5,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs6,40
		  noSlide
		        noteL A6,12
		        note  Gs6
		        note  Fs6
		        noteL E6,24
		        noteL Gs5,72
		        noteL Gs5,12
		        note  Fs5
		        note  Gs5
		        note  A5
		        noteL E5,36
		        noteL Fs5,12
		        noteL Gs5,96
		  sustain
		        noteL Gs5,20
		  setRelease 01h
		  setSlide 035h
		        noteL Gs6,40
		  noSlide
		        noteL A6,12
		        note  Gs6
		        note  Fs6
		  sustain
		        noteL E6,20
		  setRelease 01h
		  setSlide 035h
		        noteL Cs7,40
		  noSlide
		        noteL B6,12
		        note  Gs6
		        note  E6
		  inst 20
		  vol 0Bh
		        noteL Cs6,6
		        note  Ds6
		        noteL E6,18
		  vol 08h
		        noteL E6,6
		  vol 0Bh
		        note  E6
		  vol 08h
		        note  E6
		  vol 0Bh
		        note  Ds6
		        note  E6
		        noteL Fs6,24
		  sustain
		        noteL B5,4
		        note  Cs6
		  setRelease 01h
		        note  Ds6
		        noteL E6,6
		        note  Fs6
		        note  Gs6
		  vol 08h
		        note  Gs6
		  vol 0Bh
		        noteL A6,48
		  inst 26
		  vol 0Bh
		  sustain
		        noteL C6,4
		        note  D6
		        note  E6
		        note  F6
		        note  G6
		  setRelease 01h
		        note  A6
		countedLoopStart 1
		  inst 26
		  vol 0Ch
		        noteL As6,6
		  vol 09h
		        note  As6
		  vol 0Ch
		        note  As6
		  vol 09h
		        note  As6
		  vol 0Ch
		        note  C7
		  vol 09h
		        note  C7
		  vol 07h
		        note  C7
		  vol 05h
		        note  C7
		        waitL 12
		  vol 0Ch
		        noteL G6,6
		  vol 09h
		        note  G6
		  vol 0Ch
		        note  G6
		  vol 09h
		        note  G6
		  vol 0Ch
		        note  A6
		  vol 09h
		        note  A6
		  vol 07h
		        note  A6
		  vol 05h
		        note  A6
		        waitL 24
		  vol 0Ch
		        noteL F6,6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  F6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  G6
		  vol 09h
		        note  G6
		  vol 0Ch
		        note  Ds6
		  vol 09h
		        note  Ds6
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		  vol 0Ch
		        note  C6
		  vol 09h
		        note  C6
		  vol 07h
		        note  C6
		  vol 05h
		        note  C6
		  inst 13
		  vol 0Ch
		        note  F4
		  vol 09h
		        note  F4
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        noteL Ds5,24
		  vol 09h
		        noteL Ds5,6
		  vol 07h
		        note  Ds5
		  vol 0Ch
		        note  C5
		  vol 09h
		        note  C5
		  vol 0Ch
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 0Ch
		        note  As5
		  vol 09h
		        note  As5
		  vol 0Ch
		        noteL A5,48
		countedLoopEnd
		  vol 09h
		        noteL A5,6
		  vol 07h
		        note  A5
		        waitL 26
		  vol 0Bh
		        noteL G6,4
		        note  G6
		  vol 08h
		        note  G6
		  vol 0Bh
		        note  G6
		  vol 08h
		        note  G6
		  vol 0Bh
		        note  F6
		  vol 08h
		        note  F6
		  vol 0Bh
		        note  E6
		  vol 08h
		        note  E6
		  sustain
		  vol 0Bh
		        noteL F6,214
		  vol 08h
		        noteL F6,8
		  vol 06h
		        note  F6
		  setRelease 01h
		  vol 04h
		        note  F6
		  inst 0
		  vol 0Bh
		        noteL A3,24
		        note  As3
		        note  F4
		        noteL E4,72
		        noteL C4,24
		        noteL D4,12
		        note  F4
		  sustain
		        note  A4
		  vol 08h
		        noteL A4,6
		  setRelease 01h
		  vol 06h
		        note  A4
		        waitL 156
		  vol 0Bh
		        noteL A3,12
		        note  As3
		        note  F4
		        noteL E4,36
		        noteL C4,12
		        noteL D4,18
		        noteL A4,6
		  sustain
		        noteL C5,12
		  vol 08h
		        noteL C5,6
		  vol 06h
		  setRelease 01h
		        note  C5
		        waitL 36
		  vol 0Bh
		        noteL A3,12
		        note  As3
		        note  F4
		        note  E4
		        note  C4
		        note  D4
		        note  A4
		        noteL G4,18
		        noteL E4,6
		        noteL F4,12
		        noteL C5,24
		        noteL As4,12
		  vol 0Bh
		  sustain
		        note  E5
		  vol 08h
		        noteL E5,6
		  setRelease 01h
		  vol 06h
		        note  E5
		        waitL 12
		  vol 0Bh
		        note  F4
		        note  C5
		        note  As4
		  sustain
		        note  E5
		  vol 08h
		        noteL E5,6
		  vol 06h
		  setRelease 01h
		        note  E5
		        waitL 12
		  inst 26
		  vol 0Bh
		        note  F5
		        noteL C6,18
		        noteL As5,6
		  inst 15
		  vol 0Bh
		        noteL E6,54
		  inst 26
		  vol 0Bh
		        noteL D6,4
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs5
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D5
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E5
		        note  D6
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  E6
		        note  D6
		        note  Cs6
		        note  B5
		        note  A5
		        note  Gs5
		        note  Fs5
		        note  Gs5
		        note  A5
		        note  B5
		        note  Cs6
		        note  D6
		        note  Gs5
		        note  A5
		        note  B5
		        note  Cs6
		  stereo 0C0h
		  shifting 00h
		  inst 20
		countedLoopStart 1
		  vol 0Bh
		        noteL D5,6
		  vol 08h
		        note  D5
		  vol 06h
		        note  D5
		        wait
		countedLoopEnd
		        waitL 12
		countedLoopStart 1
		  vol 0Bh
		        noteL Cs5,6
		  vol 08h
		        note  Cs5
		  vol 06h
		        note  Cs5
		        wait
		countedLoopEnd
		  vol 0Bh
		        noteL Cs5,6
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
		        note  Ds5
		        note  Ds5
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		        wait
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		        waitL 18
		  vol 0Bh
		        noteL Ds5,6
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		        wait
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		        wait
		  vol 0Bh
		        note  Ds5
		        note  Ds5
		  vol 0Bh
		        note  F5
		  vol 08h
		        note  F5
		  vol 06h
		        note  F5
		  stereo 040h
		  shifting 020h
		  vol 0Ah
		        note  As4
		        note  As4
		        note  As4
		  vol 07h
		        note  As4
		  vol 0Ah
		        note  As4
		        note  As4
		        note  As4
		  vol 08h
		        note  As4
		  vol 07h
		        note  As4
		  vol 05h
		        note  As4
		        waitL 18
		channel_end
Music_9_Channel_5:
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
Music_9_Channel_6:
		  ymTimer 098h
		  vibrato 040h
		  psgInst 00h
		  setRelease 080h
		  psgInst 00h
		        psgNoteL G2,6
		  psgInst 01h
		        psgNote  G2
		  psgInst 02h
		        psgNote  G2
		  psgInst 076h
		countedLoopStart 8
		        psgNoteL G2,96
		countedLoopEnd
		  psgInst 079h
		        psgNoteL B2,96
		  ymTimer 0C4h
		  setRelease 01h
		        psgNoteL B2,36
		        waitL 12
		  vibrato 04Ch
		  psgInst 0Ch
		        psgNoteL As2,4
		        psgNote  As2
		        wait
		        psgNoteL As2,72
		  psgInst 0Dh
		        psgNoteL As3,4
		        psgNote  A3
		        psgNote  G3
		        psgNote  F3
		        psgNote  E3
		        psgNote  D3
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNote  F3
		        psgNote  E3
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNote  F3
		        psgNote  E4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNoteL F4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 42
		  psgInst 07Dh
		        psgNoteL F4,4
		        psgNote  G4
		        psgNote  A4
		        psgNoteL As4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 18
		  psgInst 07Dh
		        psgNoteL As3,4
		        psgNote  C4
		        psgNote  D4
		        psgNoteL E4,6
		        wait
		        psgNoteL F3,4
		        psgNote  G3
		        psgNote  A3
		        psgNoteL As3,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 09h
		        wait
		  psgInst 07Dh
		        psgNoteL C4,4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNote  F3
		        psgNote  E3
		  psgInst 07Bh
		countedLoopStart 2
		        psgNoteL D3,6
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNoteL D3,12
		        waitL 6
		        psgNote  D3
		countedLoopEnd
		repeatStart
		        psgNoteL Ds3,6
		        psgNote  Ds3
		        psgNote  Ds3
		        wait
		        psgNote  Ds3
		        wait
		        psgNote  Ds3
		        psgNote  Ds3
		        psgNote  Ds3
		        psgNote  Ds3
		        psgNote  Ds3
		        wait
		        psgNoteL Ds3,12
		        waitL 6
		        psgNote  Ds3
		  psgInst 0Dh
		        psgNote  C3
		        psgNote  D3
		        psgNote  F3
		        psgNote  As3
		        psgNote  D4
		        psgNote  As3
		        psgNote  F3
		        psgNote  D3
		        psgNote  Ds3
		        psgNote  F3
		        psgNote  G3
		        psgNote  C4
		        psgNote  Ds4
		        psgNote  C4
		        psgNote  G3
		        psgNote  Ds3
		        psgNote  F3
		        psgNote  Fs3
		        psgNote  Gs3
		        psgNote  Cs4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  Gs3
		        psgNote  F3
		        psgNote  G3
		        psgNote  Gs3
		        psgNote  As3
		        psgNote  Ds4
		        psgNote  A3
		        psgNote  As3
		        psgNote  C4
		        psgNote  F4
		  psgInst 07Bh
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNoteL D3,12
		        waitL 6
		        psgNote  D3
		        psgNote  Ds3
		        psgNote  Ds3
		        psgNote  Ds3
		        wait
		        psgNote  Ds3
		        wait
		        psgNote  Ds3
		        psgNote  Ds3
		        psgNote  Ds3
		        wait
		        psgNoteL C3,18
		        waitL 6
		        psgNote  C3
		        wait
		repeatSection1Start
		        psgNoteL C4,6
		        psgNote  C4
		        psgNote  C4
		        wait
		        psgNote  C4
		        wait
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        psgNote  C4
		        psgNote  As3
		        wait
		        psgNoteL A3,12
		        waitL 6
		        psgNote  A3
		        psgNote  G3
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
		        psgNoteL G3,24
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
		        psgNoteL A3,12
		        waitL 6
		        psgNote  A3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNoteL D3,12
		        waitL 6
		        psgNote  D3
		repeatEnd
		repeatSection2Start
		  psgInst 07Dh
		        psgNoteL As3,48
		        psgNoteL Gs3,12
		        psgNote  Fs3
		        psgNote  F3
		        psgNote  Ds3
		  psgInst 0Dh
		        psgNoteL D3,6
		        wait
		  psgInst 0Bh
		        waitL 12
		  psgInst 07Dh
		        psgNoteL D3,24
		        waitL 6
		        psgNote  E3
		        psgNote  F3
		        psgNote  A3
		        psgNote  As3
		        psgNote  D4
		        psgNote  F4
		        psgNote  As4
		        psgNoteL Cs5,48
		        psgNote  C5
		        psgNoteL As4,6
		        psgNote  Gs4
		        psgNote  Fs4
		        psgNote  F4
		        psgNoteL Ds4,40
		        psgNoteL Cs4,4
		        psgNote  B3
		        psgNote  As3
		        psgNote  Gs3
		        psgNote  Fs3
		        psgNote  E3
		        psgNote  Ds3
		        psgNote  Cs3
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL Cs4,6
		        wait
		        psgNote  Cs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Cs4,6
		        wait
		        psgNote  Cs4
		        wait
		        psgNote  Cs4
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Cs4,6
		        psgNote  Cs4
		countedLoopEnd
		        psgNoteL B3,6
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
		        psgNote  B3
		        wait
		        psgNote  B3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B3,6
		        wait
		  psgInst 07Ch
		        psgNote  B4
		        psgNote  Cs5
		        psgNote  Ds5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  B4
		        psgNote  Fs4
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL B3,6
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
		countedLoopEnd
		        psgNoteL A3,6
		        wait
		        psgNote  A3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A3,6
		        waitL 12
		  psgInst 07Ch
		        psgNoteL Fs4,6
		        psgNote  Gs4
		        psgNote  A4
		        psgNote  Cs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs5
		  psgInst 07Bh
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        wait
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        psgNote  Gs3
		        psgNote  Fs3
		        wait
		        psgNote  Fs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs3,6
		        wait
		        psgNote  Fs3
		        wait
		        psgNote  Fs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs3,6
		        psgNote  Fs3
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        wait
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        psgNote  Gs3
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D3,6
		        wait
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D3,6
		        psgNote  D3
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        wait
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        psgNote  E3
		        psgNote  Fs3
		        wait
		        psgNote  Fs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs3,6
		        wait
		        psgNote  Fs3
		        wait
		        psgNote  Fs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs3,6
		        psgNote  Fs3
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        wait
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        psgNote  Gs3
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNote  A2
		        waitL 6
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        waitL 12
		  psgInst 0Ch
		        psgNoteL B2,24
		        psgNoteL Cs3,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 0Ch
		        psgNoteL D3,60
		        waitL 6
		  psgInst 0Ah
		        wait
		countedLoopStart 1
		  psgInst 0Ch
		        psgNoteL C3,6
		        wait
		        psgNote  C3
		        wait
		        psgNote  C3
		        wait
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNoteL C3,6
		        wait
		        psgNote  C3
		        wait
		        psgNote  C3
		        wait
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL C3,6
		        wait
		        psgNote  C3
		        wait
		        psgNote  C3
		        wait
		        psgNote  Ds3
		        wait
		        psgNote  Ds3
		        wait
		        psgNote  C3
		        wait
		        psgNote  C3
		        wait
		  psgInst 00h
		        waitL 24
		  psgInst 0Dh
		        psgNoteL Ds4,4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  Ds4
		countedLoopEnd
		  ymTimer 0C2h
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL As2,4
		        psgNote  As2
		        wait
		        psgNoteL As2,240
		        waitL 8
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 00h
		        waitL 192
		  psgInst 0Dh
		        psgNoteL E3,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 135
		        wait
		  psgInst 0Dh
		        psgNoteL E3,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 99
		        wait
		countedLoopStart 1
		  psgInst 0Dh
		        psgNoteL C4,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 54
		countedLoopEnd
		  psgInst 0Ch
		  setRelease 080h
		        psgNoteL Cs4,192
		  setRelease 01h
		        psgNoteL Cs4,96
		  psgInst 0Dh
		        psgNoteL F4,6
		        wait
		        psgNoteL D4,4
		        psgNote  Ds4
		        psgNote  E4
		        psgNoteL F4,6
		        wait
		        psgNoteL F3,4
		        psgNote  E3
		        psgNote  Ds3
		        psgNoteL Cs3,6
		        wait
		        psgNote  C3
		        psgNote  Gs2
		        psgNote  Cs3
		        psgNote  C3
		        psgNote  F3
		        psgNote  Cs3
		        psgNote  F3
		        psgNote  Fs3
		        psgNote  As3
		        psgNote  Cs4
		        psgNote  F4
		        wait
		        psgNote  F3
		        psgNote  E3
		        psgNote  Ds3
		        psgNote  B2
		        psgNote  Gs2
		        psgNote  B2
		        psgNote  Ds3
		        psgNote  B2
		        psgNote  Gs2
		        psgNote  B2
		        waitL 12
		        psgNoteL Cs4,4
		        psgNote  Ds4
		        psgNote  E4
		        psgNoteL F4,6
		        wait
		        psgNoteL F3,4
		        psgNote  Ds3
		        psgNote  Cs3
		        psgNoteL B2,6
		        psgNote  A2
		        psgNote  Ds3
		        psgNote  F3
		        psgNoteL B3,4
		        psgNote  Cs4
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  G4
		        psgNote  A4
		        psgNoteL As4,6
		        wait
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		  psgInst 00h
		        waitL 36
		channel_end
Music_9_Channel_7:
		  vibrato 040h
		  setRelease 080h
		  psgInst 00h
		        psgNoteL C2,6
		  psgInst 01h
		        psgNote  C2
		  psgInst 02h
		        psgNote  C2
		  psgInst 076h
		countedLoopStart 8
		        psgNoteL C2,96
		countedLoopEnd
		  psgInst 079h
		  setRelease 01h
		        psgNoteL Ds2,132
		        waitL 12
		  vibrato 04Ch
		  psgInst 0Ch
		        psgNoteL D2,4
		        psgNote  D2
		        wait
		        psgNoteL D2,72
		        waitL 8
		  shifting 010h
		  psgInst 0Bh
		        psgNoteL As3,4
		        psgNote  A3
		        psgNote  G3
		        psgNote  F3
		        psgNote  E3
		        psgNote  D3
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNote  F3
		        psgNote  E3
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNote  F3
		        psgNote  E4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNoteL F4,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 00h
		        waitL 42
		  psgInst 07Bh
		        psgNoteL F4,4
		        psgNote  G4
		        psgNote  A4
		        psgNoteL As4,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 00h
		        waitL 18
		  psgInst 07Bh
		        psgNoteL As3,4
		        psgNote  C4
		        psgNote  D4
		        psgNoteL E4,6
		        wait
		        psgNoteL F3,4
		        psgNote  G3
		        psgNote  A3
		        psgNoteL As3,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 07h
		        wait
		  psgInst 07Bh
		        psgNoteL C4,4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		  shifting 00h
		  psgInst 07Bh
		countedLoopStart 2
		        psgNoteL As2,6
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNote  As2
		        wait
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNoteL As2,12
		        waitL 6
		        psgNote  As2
		countedLoopEnd
		repeatStart
		        psgNoteL G2,6
		        psgNote  G2
		        psgNote  G2
		        wait
		        psgNote  G2
		        wait
		        psgNote  G2
		        psgNote  G2
		        psgNote  G2
		        psgNote  G2
		        psgNote  G2
		        wait
		        psgNoteL G2,12
		        waitL 6
		        psgNote  G2
		        wait
		  shifting 010h
		  psgInst 0Bh
		        psgNote  C3
		        psgNote  D3
		        psgNote  F3
		        psgNote  As3
		        psgNote  D4
		        psgNote  As3
		        psgNote  F3
		        psgNote  D3
		        psgNote  Ds3
		        psgNote  F3
		        psgNote  G3
		        psgNote  C4
		        psgNote  Ds4
		        psgNote  C4
		        psgNote  G3
		        psgNote  Ds3
		        psgNote  F3
		        psgNote  Fs3
		        psgNote  Gs3
		        psgNote  Cs4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  Gs3
		        psgNote  F3
		        psgNote  G3
		        psgNote  Gs3
		        psgNote  As3
		        psgNote  Ds4
		        psgNote  A3
		        psgNote  As3
		        psgNote  C4
		  shifting 00h
		  psgInst 07Bh
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNote  As2
		        wait
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNoteL As2,12
		        waitL 6
		        psgNote  As2
		        psgNote  G2
		        psgNote  G2
		        psgNote  G2
		        wait
		        psgNote  G2
		        wait
		        psgNote  G2
		        psgNote  G2
		        psgNote  G2
		        wait
		        psgNoteL A2,18
		        waitL 6
		        psgNote  A2
		        wait
		repeatSection1Start
		        psgNoteL A3,6
		        psgNote  A3
		        psgNote  A3
		        wait
		        psgNote  A3
		        wait
		        psgNote  A3
		        psgNote  A3
		        psgNote  A3
		        psgNote  A3
		        psgNote  G3
		        wait
		        psgNoteL Fs3,12
		        waitL 6
		        psgNote  Fs3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        psgNote  D3
		        wait
		        psgNoteL D3,24
		        psgNoteL G3,6
		        psgNote  G3
		        psgNote  G3
		        wait
		        psgNote  G3
		        wait
		        psgNote  G3
		        psgNote  G3
		        psgNote  C3
		        psgNote  C3
		        psgNote  C3
		        wait
		        psgNoteL C3,12
		        waitL 6
		        psgNote  C3
		        psgNote  C3
		        psgNote  C3
		        psgNote  C3
		        wait
		        psgNote  C3
		        wait
		        psgNote  C3
		        psgNote  C3
		        psgNote  C3
		        psgNote  C3
		        psgNote  C3
		        wait
		        psgNoteL C3,12
		        waitL 6
		        psgNote  C3
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNote  As2
		        wait
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNoteL As2,12
		        waitL 6
		        psgNote  As2
		repeatEnd
		repeatSection2Start
		        waitL 6
		  shifting 010h
		  psgInst 07Bh
		        psgNoteL As3,48
		        psgNoteL Gs3,12
		        psgNote  Fs3
		        psgNote  F3
		        psgNote  Ds3
		  psgInst 0Bh
		        psgNoteL D3,6
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D3,24
		        waitL 6
		        psgNote  E3
		        psgNote  F3
		        psgNote  A3
		        psgNote  As3
		        psgNote  D4
		        psgNote  F4
		        psgNote  As4
		        psgNoteL Cs5,48
		        psgNote  C5
		        psgNoteL As4,6
		        psgNote  Gs4
		        psgNote  Fs4
		        psgNote  F4
		        psgNoteL Ds4,42
		        psgNoteL Cs4,4
		        psgNote  B3
		        psgNote  As3
		        psgNote  Gs3
		        psgNote  Fs3
		        psgNote  E3
		  shifting 00h
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL A3,6
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
		countedLoopEnd
		        psgNoteL Gs3,6
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        wait
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        psgNote  Gs3
		        psgNote  Gs3
		        wait
		        psgNote  Gs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Gs3,6
		        waitL 12
		  shifting 010h
		  psgInst 07Ah
		        psgNoteL B4,6
		        psgNote  Cs5
		        psgNote  Ds5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  B4
		  shifting 00h
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL G3,6
		        wait
		        psgNote  G3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL G3,6
		        wait
		        psgNote  G3
		        wait
		        psgNote  G3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL G3,6
		        psgNote  G3
		countedLoopEnd
		        psgNoteL Fs3,6
		        wait
		        psgNote  Fs3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL Fs3,6
		        wait
		  psgInst 09h
		        waitL 12
		  shifting 010h
		  psgInst 07Ah
		        psgNoteL Fs4,6
		        psgNote  Gs4
		        psgNote  A4
		        psgNote  Cs5
		        psgNote  E5
		        psgNote  D5
		  shifting 00h
		  psgInst 07Bh
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        wait
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        psgNote  E3
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D3,6
		        wait
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D3,6
		        psgNote  D3
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        wait
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        psgNote  E3
		        psgNote  B2
		        wait
		        psgNote  B2
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B2,6
		        wait
		        psgNote  B2
		        wait
		        psgNote  B2
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL B2,6
		        psgNote  B2
		        psgNote  A2
		        wait
		        psgNote  A2
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A2,6
		        wait
		        psgNote  A2
		        wait
		        psgNote  A2
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL A2,6
		        psgNote  A2
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D3,6
		        wait
		        psgNote  D3
		        wait
		        psgNote  D3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL D3,6
		        psgNote  D3
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        wait
		        psgNote  E3
		        wait
		        psgNote  E3
		        wait
		  psgInst 09h
		        waitL 12
		  psgInst 07Bh
		        psgNoteL E3,6
		        psgNote  E3
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNote  Fs2
		        waitL 6
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        waitL 12
		  psgInst 0Ch
		        psgNoteL Gs2,24
		        psgNoteL A2,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 0Ch
		        psgNoteL A2,60
		        waitL 6
		  psgInst 0Ah
		        wait
		countedLoopStart 1
		  psgInst 0Ch
		        psgNoteL F2,6
		        wait
		        psgNote  F2
		        wait
		        psgNote  F2
		        wait
		  psgInst 00h
		        waitL 24
		  psgInst 0Ch
		        psgNoteL F2,6
		        wait
		        psgNote  F2
		        wait
		        psgNote  F2
		        wait
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL F2,6
		        wait
		        psgNote  F2
		        wait
		        psgNote  F2
		        wait
		        psgNote  As2
		        wait
		        psgNote  As2
		        wait
		        psgNote  A2
		        wait
		        psgNote  A2
		        wait
		  psgInst 00h
		        waitL 32
		  shifting 010h
		  psgInst 0Bh
		        psgNoteL Ds4,4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G3
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A3
		        psgNote  G4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C5
		        psgNote  As4
		        psgNote  A4
		        psgNote  G4
		  shifting 00h
		countedLoopEnd
		  psgInst 00h
		        waitL 36
		  psgInst 0Ch
		        psgNoteL D2,4
		        psgNote  D2
		        wait
		        psgNoteL D2,240
		        waitL 8
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 00h
		        waitL 192
		  psgInst 0Dh
		        psgNoteL D3,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 135
		        wait
		  psgInst 0Dh
		        psgNoteL As2,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 99
		        wait
		  psgInst 0Dh
		        psgNoteL G3,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 54
		  psgInst 0Dh
		        psgNoteL Gs3,6
		        wait
		  psgInst 0Bh
		        wait
		  psgInst 00h
		        waitL 54
		  psgInst 0Ch
		  setRelease 080h
		        psgNoteL A3,192
		  setRelease 01h
		        psgNoteL A3,96
		        waitL 6
		  shifting 010h
		  psgInst 0Bh
		        psgNote  F4
		        wait
		        psgNoteL D4,4
		        psgNote  Ds4
		        psgNote  E4
		        psgNoteL F4,6
		        wait
		        psgNoteL F3,4
		        psgNote  E3
		        psgNote  Ds3
		        psgNoteL Cs3,6
		        wait
		        psgNote  C3
		        psgNote  Gs2
		        psgNote  Cs3
		        psgNote  C3
		        psgNote  F3
		        psgNote  Cs3
		        psgNote  F3
		        psgNote  Fs3
		        psgNote  As3
		        psgNote  Cs4
		        psgNote  F4
		        wait
		        psgNote  F3
		        psgNote  E3
		        psgNote  Ds3
		        psgNote  B2
		        psgNote  Gs2
		        psgNote  B2
		        psgNote  Ds3
		        psgNote  B2
		        psgNote  Gs2
		        psgNote  B2
		        waitL 12
		        psgNoteL Cs4,4
		        psgNote  Ds4
		        psgNote  E4
		        psgNoteL F4,6
		        wait
		        psgNoteL F3,4
		        psgNote  Ds3
		        psgNote  Cs3
		        psgNoteL B2,6
		        psgNote  A2
		        psgNote  Ds3
		        psgNote  F3
		        psgNoteL B3,4
		        psgNote  Cs4
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  G4
		        psgNote  A4
		        psgNoteL As4,6
		        wait
		  shifting 020h
		  psgInst 0Ch
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		        psgNote  As2
		        psgNote  As2
		        psgNote  As2
		        wait
		  psgInst 00h
		        waitL 30
		channel_end
Music_9_Channel_9:
		channel_end
