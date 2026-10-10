
; ASM FILE music34.asm :
; 0x910B..0x9B7F : Music 34
Music_34:       db 0
		db 0
		db 0
		db 0BDh
		dw Music_34_Channel_0
		dw Music_34_Channel_1
		dw Music_34_Channel_2
		dw Music_34_Channel_3
		dw Music_34_Channel_4
		dw Music_34_Channel_5
		dw Music_34_Channel_6
		dw Music_34_Channel_7
		dw Music_34_Channel_9
		dw Music_34_Channel_9
Music_34_Channel_0:
		  stereo 0C0h
		  inst 12
		  vol 0Ch
		  vibrato 02Ch
		countedLoopStart 1
		  setRelease 05h
		        noteL As2,192
		  setRelease 010h
		        noteL As2,24
		        note  As2
		        wait
		  setRelease 05h
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        waitL 40
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		countedLoopEnd
		mainLoopStart
		  vol 0Bh
		countedLoopStart 3
		  setRelease 010h
		        noteL As2,24
		        note  As2
		        wait
		  setRelease 05h
		        noteL Cs3,8
		        note  Cs3
		        note  Cs3
		        note  As2
		        waitL 40
		        noteL F3,8
		        note  F3
		        note  F3
		        note  Fs3
		        note  Fs3
		        note  Fs3
		countedLoopEnd
		  vol 0Ch
		        noteL A3,8
		  vol 0Ah
		        note  A3
		        note  A3
		  vol 0Ch
		        note  Cs4
		  vol 0Ah
		        note  Cs4
		        note  Cs4
		  vol 0Ch
		        note  G3
		  vol 0Ah
		        note  G3
		        note  G3
		  vol 0Ch
		        note  Gs3
		  vol 0Ah
		        note  Gs3
		        note  Gs3
		  vol 0Bh
		  setRelease 01h
		        noteL C4,0
		  setSlide 0Ah
		        noteL D4,48
		  noSlide
		        noteL Ds3,6
		        waitL 18
		        noteL Gs3,24
		        noteL E3,0
		  setSlide 0Ah
		        noteL Fs3,96
		  noSlide
		        noteL G3,0
		  setSlide 0Ah
		        noteL A3,48
		  noSlide
		        noteL F3,6
		        waitL 18
		        noteL Fs3,24
		        noteL Cs3,0
		  setSlide 0Ah
		        noteL Ds3,96
		  noSlide
		  vol 0Ch
		countedLoopStart 1
		  setRelease 010h
		        noteL As2,24
		        note  As2
		        wait
		        note  As2
		        note  As2
		        wait
		        note  As2
		        note  As2
		countedLoopEnd
		  vol 0Bh
		countedLoopStart 1
		  setRelease 010h
		        noteL As2,24
		        note  As2
		        wait
		  setRelease 05h
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        waitL 40
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		countedLoopEnd
		mainLoopEnd
Music_34_Channel_1:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 13
		  vol 0Ch
		        noteL As5,6
		  vol 09h
		        note  As5
		  vol 07h
		        note  As5
		        wait
		  inst 20
		  vol 0Ah
		  setRelease 05h
		        noteL A3,8
		        note  A3
		        note  A3
		        note  As3
		        note  As3
		        note  As3
		repeatSection1Start
		  setRelease 01h
		        noteL Cs4,84
		        noteL B3,12
		        note  As3
		        note  Gs3
		        noteL A3,6
		  vol 07h
		        note  A3
		  vol 0Ah
		        noteL Fs3,180
		repeatEnd
		repeatSection2Start
		        noteL Cs4,8
		  vol 07h
		        note  Cs4
		  vol 0Ah
		        note  Cs4
		  setRelease 01h
		        noteL E4,60
		        noteL Ds4,12
		        note  Cs4
		        note  B3
		        noteL C4,6
		  vol 07h
		        note  C4
		  vol 0Ah
		        noteL A3,180
		mainLoopStart
		  inst 22
		  vol 0Ch
		        noteL G5,36
		        noteL F5,12
		        note  E5
		        note  D5
		        note  E5
		        note  F5
		  sustain
		        noteL Cs5,6
		        note  B4
		  setRelease 01h
		        noteL Cs5,48
		        noteL D5,12
		  sustain
		        noteL As4,3
		        note  B4
		        noteL As4,6
		  setRelease 01h
		        noteL Gs4,12
		  sustain
		        noteL G4,6
		        note  F4
		  setRelease 01h
		        noteL G4,180
		        waitL 12
		  inst 44
		  vol 0Ch
		        note  E5
		        note  F5
		        note  C6
		        note  B5
		        note  G5
		        note  Gs5
		        note  Ds6
		        noteL D6,6
		        note  Cs6
		        noteL D6,63
		        noteL Ds6,8
		        noteL C6,7
		        noteL B5,6
		  vol 09h
		        noteL B5,8
		  vol 0Ch
		        note  G5
		        note  Gs5
		        noteL Ds6,9
		        noteL D6,8
		        noteL Cs6,19
		        noteL As5,12
		        noteL B5,11
		        noteL Cs6,5
		        noteL D6,4
		        note  F6
		        noteL A6,72
		  inst 26
		  vol 0Dh
		        noteL E4,6
		        note  F4
		        note  A4
		        note  C5
		  setRelease 05h
		        noteL Cs5,8
		        note  Cs5
		        note  Cs5
		        note  C5
		        note  C5
		        note  C5
		        note  Gs4
		        note  Gs4
		        note  Gs4
		        note  E4
		        note  E4
		        note  E4
		  setRelease 01h
		        noteL Cs4,48
		        noteL D4,6
		  vol 0Ah
		        note  D4
		  vol 08h
		        note  D4
		        wait
		  vol 0Dh
		        noteL Cs4,4
		        note  D4
		        note  F4
		        note  A4
		        note  Cs5
		        note  E5
		  sustain
		        noteL F5,84
		  vol 0Ah
		        noteL F5,6
		  vol 08h
		  setRelease 01h
		        note  F5
		  vol 0Dh
		        noteL Gs4,48
		        noteL A4,6
		  vol 0Ah
		        note  A4
		  vol 08h
		        note  A4
		        wait
		  vol 0Dh
		        noteL Gs4,4
		        note  A4
		        note  C5
		        note  E5
		        note  Gs5
		        note  B5
		  sustain
		        noteL C6,84
		  vol 0Ah
		        noteL C6,6
		  vol 08h
		  setRelease 01h
		        note  C6
		countedLoopStart 1
		  inst 13
		  vol 0Dh
		  setRelease 03h
		        noteL As5,8
		  vol 09h
		        note  As5
		        wait
		  vol 0Dh
		        note  A5
		  vol 09h
		        note  A5
		        waitL 32
		  vol 0Dh
		        noteL Gs5,8
		  vol 09h
		        note  Gs5
		        wait
		  vol 0Dh
		        note  G5
		  vol 09h
		        note  G5
		        waitL 32
		  vol 0Dh
		        noteL Fs5,8
		  vol 09h
		        note  Fs5
		        wait
		  vol 0Dh
		        note  F5
		  vol 09h
		        note  F5
		        wait
		countedLoopEnd
		  setRelease 01h
		  inst 20
		  vol 0Bh
		  sustain
		        noteL As3,192
		  setRelease 01h
		  vibrato 020h
		        note  As3
		  vibrato 02Ch
		mainLoopEnd
Music_34_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 3
		  vol 0Ch
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		        wait
		  inst 20
		  vol 0Ah
		  setRelease 05h
		        noteL F3,8
		        note  F3
		        note  F3
		        note  Fs3
		        note  Fs3
		        note  Fs3
		repeatSection1Start
		  setRelease 01h
		        noteL A3,84
		        noteL G3,12
		        note  Fs3
		        note  E3
		        noteL F3,6
		  vol 07h
		        note  F3
		  vol 0Ah
		        noteL D3,180
		repeatEnd
		repeatSection2Start
		        noteL A3,8
		  vol 07h
		        note  A3
		  vol 0Ah
		        note  A3
		  setRelease 01h
		        noteL C4,60
		        noteL B3,12
		        note  A3
		        note  G3
		        noteL Gs3,6
		  vol 07h
		        note  Gs3
		  vol 0Ah
		        noteL F3,180
		mainLoopStart
		        waitL 240
		  vol 0Ah
		        noteL E4,6
		  vol 07h
		        note  E4
		  vol 0Ah
		        noteL Cs4,132
		        waitL 120
		  inst 13
		  vol 0Dh
		        noteL As5,6
		  vol 0Ah
		        note  As5
		  vol 08h
		        note  As5
		        waitL 174
		  vol 0Dh
		        noteL As5,6
		  vol 0Ah
		        note  As5
		  vol 08h
		        note  As5
		        waitL 30
		  vol 0Dh
		        noteL As5,6
		  vol 0Ah
		        note  As5
		  vol 08h
		        note  As5
		        wait
		  vol 0Dh
		        note  As5
		  vol 0Ah
		        note  As5
		  vol 08h
		        note  As5
		        waitL 78
		  inst 26
		  vol 0Ch
		        noteL Gs3,48
		        noteL As3,6
		  vol 09h
		        note  As3
		  vol 07h
		        note  As3
		        wait
		  vol 0Ch
		        noteL F3,24
		  inst 27
		  vol 0Bh
		        noteL A4,16
		        note  As4
		        note  A4
		        noteL Gs4,6
		  vol 08h
		        note  Gs4
		  vol 0Bh
		        noteL E4,36
		  inst 26
		  vol 0Ch
		        noteL F4,48
		        noteL Fs4,6
		  vol 09h
		        note  Fs4
		  vol 07h
		        note  Fs4
		        wait
		  vol 0Ch
		        noteL F4,24
		  inst 20
		  vol 0Bh
		        noteL F4,8
		  vol 08h
		        note  F4
		  vol 0Bh
		        note  E4
		  vol 08h
		        note  E4
		  vol 0Bh
		        note  Cs4
		  vol 08h
		        note  Cs4
		  vol 0Bh
		        noteL A3,48
		countedLoopStart 1
		  inst 3
		  vol 0Dh
		  setRelease 03h
		        waitL 24
		        noteL As5,8
		  vol 09h
		        note  As5
		        waitL 32
		  vol 0Dh
		        noteL As5,8
		  vol 09h
		        note  As5
		        wait
		  vol 0Dh
		        note  As5
		  vol 09h
		        note  As5
		        waitL 32
		  vol 0Dh
		        noteL As5,8
		  vol 09h
		        note  As5
		        wait
		  vol 0Dh
		        note  As5
		  vol 09h
		        note  As5
		        wait
		countedLoopEnd
		  setRelease 01h
		  inst 20
		  vol 0Bh
		        noteL Fs3,144
		        noteL F3,48
		        noteL E3,192
		mainLoopEnd
Music_34_Channel_3:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 61
		  vol 0Eh
		        noteL C2,30
		  stereo 080h
		  shifting 020h
		  inst 20
		  vol 09h
		  setRelease 05h
		        noteL F3,8
		        note  F3
		        note  F3
		        note  Fs3
		        note  Fs3
		        note  Fs3
		repeatSection1Start
		  setRelease 01h
		        noteL A3,84
		        noteL G3,12
		        note  Fs3
		        noteL E3,6
		  shifting 00h
		  stereo 0C0h
		  inst 3
		countedLoopStart 1
		  vol 0Ch
		        noteL As3,6
		  vol 09h
		        note  As3
		  vol 07h
		        note  As3
		        wait
		countedLoopEnd
		        waitL 24
		  setRelease 05h
		  vol 0Ch
		        noteL As3,8
		        note  As3
		        note  As3
		  setRelease 01h
		        noteL As3,6
		  vol 09h
		        note  As3
		  vol 07h
		        note  As3
		        waitL 30
		  vol 0Ch
		  setRelease 05h
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		repeatEnd
		repeatSection2Start
		        noteL A3,8
		  vol 07h
		        note  A3
		  vol 0Ah
		        note  A3
		  setRelease 01h
		        noteL C4,60
		        noteL B3,12
		        note  A3
		        noteL G3,6
		  shifting 00h
		  stereo 0C0h
		  inst 3
		countedLoopStart 1
		  vol 0Ch
		        noteL As3,6
		  vol 09h
		        note  As3
		  vol 07h
		        note  As3
		        wait
		countedLoopEnd
		        waitL 24
		  setRelease 05h
		  vol 0Ch
		        noteL As3,8
		        note  As3
		        note  As3
		  setRelease 01h
		        noteL As3,6
		  vol 09h
		        note  As3
		  vol 07h
		        note  As3
		        waitL 30
		  vol 0Ch
		  setRelease 05h
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		        waitL 6
		mainLoopStart
		        waitL 6
		  stereo 080h
		  shifting 010h
		  inst 22
		  vol 0Ah
		        noteL G5,36
		        noteL F5,12
		        note  E5
		        note  D5
		        note  E5
		        note  F5
		  sustain
		        noteL Cs5,6
		        note  B4
		  setRelease 01h
		        noteL Cs5,48
		        noteL D5,12
		  sustain
		        noteL As4,3
		        note  B4
		        noteL As4,6
		  setRelease 01h
		        noteL Gs4,12
		  sustain
		        noteL G4,6
		        note  F4
		  setRelease 01h
		        noteL G4,30
		  shifting 020h
		  inst 20
		  vol 09h
		        noteL E4,6
		  vol 06h
		        note  E4
		  vol 09h
		        noteL Cs4,30
		  stereo 0C0h
		  shifting 00h
		  inst 13
		  vol 0Ch
		        noteL C5,6
		  vol 09h
		        note  C5
		  vol 0Ch
		  sustain
		        noteL A4,84
		  vol 09h
		        noteL A4,6
		  vol 07h
		  setRelease 01h
		        note  A4
		        waitL 12
		  shifting 010h
		  stereo 080h
		  inst 44
		  vol 0Ah
		        note  E5
		        note  F5
		        note  C6
		        note  B5
		        note  G5
		        note  Gs5
		        note  Ds6
		        noteL D6,6
		        note  Cs6
		  stereo 0C0h
		  shifting 00h
		  inst 3
		  vol 0Dh
		        note  As4
		  vol 0Ah
		        note  As4
		  vol 08h
		        note  As4
		        waitL 45
		  inst 44
		  stereo 080h
		  shifting 010h
		  vol 0Ah
		        noteL Ds6,8
		        noteL C6,7
		        noteL B5,6
		  vol 07h
		        noteL B5,8
		  vol 0Ah
		        note  G5
		        note  Gs5
		        noteL Ds6,9
		        noteL D6,8
		        noteL Cs6,19
		        noteL As5,12
		        noteL B5,11
		        noteL Cs6,5
		        noteL D6,4
		        note  F6
		        noteL A6,12
		  stereo 0C0h
		  shifting 00h
		  inst 3
		  vol 0Dh
		        noteL As4,6
		  vol 0Ah
		        note  As4
		  vol 08h
		        note  As4
		        waitL 30
		  vol 0Dh
		        noteL As4,6
		  vol 0Ah
		        note  As4
		  vol 08h
		        note  As4
		        wait
		  vol 0Dh
		        note  As4
		  vol 0Ah
		        note  As4
		  vol 08h
		        note  As4
		        waitL 78
		  inst 26
		  vol 0Ch
		        noteL F3,48
		        noteL Fs3,6
		  vol 09h
		        note  Fs3
		  vol 07h
		        note  Fs3
		        wait
		  vol 0Ch
		        noteL D3,24
		  setSlide 020h
		  sustain
		        noteL Cs4,84
		  noSlide
		  vol 09h
		        noteL Cs4,6
		  vol 07h
		  setRelease 01h
		        note  Cs4
		  vol 0Ch
		        noteL Cs4,48
		        noteL D4,6
		  vol 09h
		        note  D4
		  vol 07h
		        note  D4
		        wait
		  vol 0Ch
		        noteL Cs4,24
		  setSlide 020h
		        noteL A4,48
		  noSlide
		  sustain
		        noteL F4,36
		  vol 09h
		        noteL F4,6
		  vol 07h
		  setRelease 01h
		        note  F4
		countedLoopStart 1
		  setRelease 03h
		  inst 3
		  vol 0Ch
		        noteL As4,8
		  vol 08h
		        note  As4
		        wait
		  vol 0Ch
		        note  As4
		  vol 08h
		        note  As4
		        waitL 32
		  vol 0Ch
		        noteL As4,8
		  vol 08h
		        note  As4
		        wait
		  vol 0Ch
		        note  As4
		  vol 08h
		        note  As4
		        waitL 32
		  vol 0Ch
		        noteL As4,8
		  vol 08h
		        note  As4
		        wait
		  vol 0Ch
		        note  As4
		  vol 08h
		        note  As4
		        wait
		countedLoopEnd
		  stereo 080h
		  shifting 020h
		  inst 20
		  vol 0Ah
		        waitL 6
		        noteL Fs3,144
		        noteL F3,48
		        noteL E3,192
		mainLoopEnd
Music_34_Channel_4:
		        waitL 6
		  shifting 020h
		  stereo 040h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 13
		  vol 0Bh
		        noteL As5,6
		  vol 08h
		        note  As5
		  vol 06h
		        note  As5
		        wait
		  inst 20
		  vol 09h
		  setRelease 05h
		        noteL A3,8
		        note  A3
		        note  A3
		        note  As3
		        note  As3
		        note  As3
		repeatSection1Start
		  setRelease 01h
		        noteL Cs4,84
		        noteL B3,12
		        note  As3
		        note  Gs3
		        noteL A3,6
		  vol 06h
		        note  A3
		  vol 09h
		        noteL Fs3,180
		repeatEnd
		repeatSection2Start
		        noteL Cs4,8
		  vol 06h
		        note  Cs4
		  vol 09h
		        note  Cs4
		  setRelease 01h
		        noteL E4,60
		        noteL Ds4,12
		        note  Cs4
		        note  B3
		        noteL C4,6
		  vol 06h
		        note  C4
		  vol 09h
		        noteL A3,180
		mainLoopStart
		  inst 22
		  vol 0Bh
		        noteL G5,36
		        noteL F5,12
		        note  E5
		        note  D5
		        note  E5
		        note  F5
		  sustain
		        noteL Cs5,6
		        note  B4
		  setRelease 01h
		        noteL Cs5,48
		        noteL D5,12
		  sustain
		        noteL As4,3
		        note  B4
		        noteL As4,6
		  setRelease 01h
		        noteL Gs4,12
		  sustain
		        noteL G4,6
		        note  F4
		  setRelease 01h
		        noteL G4,84
		  inst 13
		  vol 0Bh
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 0Bh
		  sustain
		        noteL A4,84
		  vol 08h
		        noteL A4,6
		  vol 06h
		  setRelease 01h
		        note  A4
		  stereo 080h
		  inst 44
		  vol 0Bh
		        noteL E5,12
		        note  F5
		        note  C6
		        note  B5
		        note  G5
		        note  Gs5
		        note  Ds6
		        noteL D6,6
		        note  Cs6
		        noteL D6,12
		  inst 13
		  vol 0Ch
		        noteL As5,6
		  vol 09h
		        note  As5
		  vol 07h
		        note  As5
		        waitL 33
		  inst 44
		  vol 0Bh
		        noteL Ds6,8
		        noteL C6,7
		        noteL B5,6
		  vol 08h
		        noteL B5,8
		  vol 0Bh
		        note  G5
		        note  Gs5
		        noteL Ds6,9
		        noteL D6,8
		        noteL Cs6,19
		        noteL As5,12
		        noteL B5,11
		        noteL Cs6,5
		        noteL D6,4
		        note  F6
		        noteL A6,72
		  stereo 040h
		  inst 26
		  vol 0Ch
		        noteL E4,6
		        note  F4
		        note  A4
		        note  C5
		  setRelease 05h
		        noteL Cs5,8
		        note  Cs5
		        note  Cs5
		        note  C5
		        note  C5
		        note  C5
		        note  Gs4
		        note  Gs4
		        note  Gs4
		        note  E4
		        note  E4
		        note  E4
		  setRelease 01h
		        noteL Cs4,48
		        noteL D4,6
		  vol 09h
		        note  D4
		  vol 07h
		        note  D4
		        wait
		  vol 0Ch
		        noteL Cs4,4
		        note  D4
		        note  F4
		        note  A4
		        note  Cs5
		        note  E5
		  stereo 080h
		  inst 27
		  vol 0Ah
		        noteL A4,16
		        note  As4
		        note  A4
		        noteL Gs4,6
		  vol 07h
		        note  Gs4
		  vol 0Ah
		        noteL E4,36
		  stereo 040h
		  inst 26
		  vol 0Ch
		        noteL Gs4,48
		        noteL A4,6
		  vol 09h
		        note  A4
		  vol 07h
		        note  A4
		        wait
		  vol 0Ch
		        noteL Gs4,4
		        note  A4
		        note  C5
		        note  E5
		        note  Gs5
		        note  B5
		  stereo 080h
		  inst 20
		  vol 0Ah
		        noteL F4,8
		  vol 07h
		        note  F4
		  vol 0Ah
		        note  E4
		  vol 07h
		        note  E4
		  vol 0Ah
		        note  Cs4
		  vol 07h
		        note  Cs4
		  vol 0Ah
		        noteL A3,48
		  stereo 040h
		countedLoopStart 1
		  inst 13
		  vol 0Ch
		  setRelease 03h
		        noteL As5,8
		  vol 08h
		        note  As5
		        wait
		  vol 0Ch
		        note  A5
		  vol 08h
		        note  A5
		        waitL 32
		  vol 0Ch
		        noteL Gs5,8
		  vol 08h
		        note  Gs5
		        wait
		  vol 0Ch
		        note  G5
		  vol 08h
		        note  G5
		        waitL 32
		  vol 0Ch
		        noteL Fs5,8
		  vol 08h
		        note  Fs5
		        wait
		  vol 0Ch
		        note  F5
		  vol 08h
		        note  F5
		        wait
		countedLoopEnd
		  setRelease 01h
		  vol 0Ah
		  inst 21
		  sustain
		        noteL As3,192
		  setRelease 01h
		  vibrato 020h
		        note  As3
		  vibrato 02Ch
		mainLoopEnd
Music_34_Channel_5:
		  stereo 0C0h
		countedLoopStart 1
		        sampleL 5,168
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sampleL 5,24
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 2,8
		        sample  2
		        sample  2
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 5,8
		        sample  3
		        sample  3
		        sample  5
		        sample  3
		        sample  3
		countedLoopEnd
		mainLoopStart
		countedLoopStart 1
		        sampleL 3,18
		        sampleL 4,3
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sample  3
		        sample  4
		        sample  4
		countedLoopEnd
		repeatStart
		        sampleL 3,18
		        sampleL 4,3
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sampleL 3,24
		        sampleL 0,12
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		repeatSection1Start
		        sampleL 3,8
		        sample  4
		        sample  4
		repeatEnd
		repeatSection2Start
		        sampleL 5,24
		        sampleL 5,96
		repeatStart
		        sampleL 1,12
		        sampleL 3,3
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,20
		        sampleL 3,2
		        sample  3
		        sampleL 2,24
		        sample  2
		repeatSection1Start
		        sampleL 0,96
		repeatEnd
		repeatSection2Start
		        sampleL 0,16
		        sample  2
		        sample  2
		        sample  2
		        sample  2
		        sample  2
		countedLoopStart 1
		        sampleL 5,24
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 5,8
		        sample  3
		        sample  3
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 5,8
		        sample  3
		        sample  3
		        sample  5
		        sample  3
		        sample  3
		countedLoopEnd
		countedLoopStart 1
		        sampleL 5,18
		        sampleL 4,3
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sample  3
		        sample  4
		        sample  4
		countedLoopEnd
		mainLoopEnd
Music_34_Channel_6:
		  setRelease 01h
		  vibrato 04Ch
		  psgInst 0Dh
		        psgNoteL As5,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        waitL 168
		  psgInst 07Bh
		countedLoopStart 5
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		countedLoopEnd
		  psgInst 07Ch
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  A5
		  psgInst 0Dh
		        psgNoteL As5,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        waitL 168
		  psgInst 07Bh
		countedLoopStart 1
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		countedLoopEnd
		  psgInst 07Ch
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  A5
		  psgInst 07Dh
		        psgNoteL G5,8
		        waitL 4
		        psgNoteL Ds5,72
		  psgInst 0Ah
		        waitL 6
		  psgInst 06h
		        wait
		mainLoopStart
		countedLoopStart 3
		  setRelease 013h
		  psgInst 07Ch
		        psgNoteL Cs4,24
		        psgNote  Cs4
		  psgInst 00h
		        wait
		  psgInst 07Ch
		  setRelease 05h
		        psgNoteL F4,8
		        psgNote  F4
		        psgNote  F4
		        psgNoteL Cs4,10
		        waitL 14
		  psgInst 00h
		        waitL 24
		  psgInst 07Ch
		        psgNoteL Cs4,8
		        psgNote  Cs4
		        psgNote  Cs4
		        psgNote  Cs4
		        psgNote  Cs4
		        psgNote  Cs4
		countedLoopEnd
		  setRelease 013h
		  psgInst 07Dh
		        psgNoteL Gs4,24
		        psgNote  G4
		        psgNote  F4
		        psgNote  Cs4
		  psgInst 00h
		        waitL 132
		  setRelease 01h
		  psgInst 07Dh
		        psgNoteL E6,4
		        psgNote  F6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  Gs6
		        psgNote  F6
		        psgNote  E6
		        psgNote  C6
		        psgNote  B5
		        psgNote  Gs5
		        psgNoteL E5,5
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        waitL 192
		countedLoopStart 1
		  setRelease 05h
		  psgInst 07Dh
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  psgInst 00h
		        waitL 40
		  psgInst 07Dh
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  psgInst 00h
		        waitL 40
		  psgInst 07Dh
		        psgNoteL Fs5,8
		        psgNote  F5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  F5
		countedLoopEnd
		repeatStart
		  setRelease 05h
		  psgInst 07Dh
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  psgInst 00h
		        waitL 38
		  psgInst 07Dh
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		  setRelease 05h
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  psgInst 00h
		        waitL 38
		  psgInst 07Dh
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		repeatSection1Start
		  setRelease 05h
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  setRelease 01h
		        psgNoteL As5,6
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        psgNoteL As5,6
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        waitL 10
		  psgInst 07Ch
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		  setRelease 01h
		        psgNoteL As5,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 05h
		        wait
		mainLoopEnd
Music_34_Channel_7:
		  setRelease 01h
		  vibrato 04Ch
		  psgInst 0Dh
		        psgNoteL As4,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        waitL 176
		  shifting 010h
		  psgInst 079h
		countedLoopStart 5
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		countedLoopEnd
		  psgInst 07Ah
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  G5
		  shifting 00h
		  psgInst 0Dh
		        psgNoteL As4,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        waitL 176
		  shifting 010h
		  psgInst 079h
		countedLoopStart 1
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		countedLoopEnd
		  psgInst 07Ah
		        psgNoteL As4,4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  G5
		  shifting 00h
		  psgInst 07Dh
		        psgNoteL E5,8
		        waitL 4
		        psgNoteL B4,72
		  psgInst 0Ah
		        waitL 6
		  psgInst 06h
		        wait
		mainLoopStart
		  shifting 00h
		countedLoopStart 3
		  setRelease 013h
		  psgInst 07Ch
		        psgNoteL As3,24
		        psgNote  As3
		  psgInst 00h
		        wait
		  psgInst 07Ch
		  setRelease 05h
		        psgNoteL As3,8
		        psgNote  As3
		        psgNote  As3
		        psgNoteL As3,10
		        waitL 14
		  psgInst 00h
		        waitL 24
		  psgInst 07Ch
		        psgNoteL As3,8
		        psgNote  As3
		        psgNote  As3
		        psgNote  A3
		        psgNote  A3
		        psgNote  A3
		countedLoopEnd
		  setRelease 013h
		  psgInst 07Dh
		        psgNoteL F4,24
		        psgNote  E4
		        psgNote  Cs4
		        psgNote  A3
		  psgInst 00h
		        waitL 140
		  shifting 010h
		  setRelease 01h
		  psgInst 07Bh
		        psgNoteL E6,4
		        psgNote  F6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  Gs6
		        psgNote  F6
		        psgNote  E6
		        psgNote  C6
		        psgNote  B5
		        psgNote  Gs5
		        psgNoteL E5,5
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        waitL 184
		countedLoopStart 1
		  shifting 00h
		  setRelease 05h
		  psgInst 07Dh
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  B4
		        psgNote  As4
		  psgInst 00h
		        waitL 40
		  psgInst 07Dh
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  B4
		        psgNote  As4
		  psgInst 00h
		        waitL 44
		  shifting 010h
		  psgInst 07Ch
		        psgNoteL Fs5,8
		        psgNote  F5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		  setRelease 01h
		        psgNoteL F5,4
		countedLoopEnd
		        waitL 4
		repeatStart
		  setRelease 05h
		  psgInst 07Bh
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  psgInst 00h
		        waitL 38
		  psgInst 07Bh
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		  setRelease 05h
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  psgInst 00h
		        waitL 38
		  psgInst 07Bh
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		repeatSection1Start
		  setRelease 05h
		        psgNoteL As5,8
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		        psgNote  As5
		  setRelease 01h
		        psgNoteL As5,6
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        psgNoteL As5,6
		  psgInst 08h
		        wait
		  psgInst 04h
		        waitL 10
		  psgInst 07Ah
		  setRelease 080h
		        psgNoteL Gs5,1
		        psgNote  A5
		  setRelease 01h
		        psgNoteL As5,6
		        wait
		  psgInst 07h
		        waitL 8
		mainLoopEnd
Music_34_Channel_9:
		channel_end
