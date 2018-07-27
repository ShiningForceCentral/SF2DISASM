
; ASM FILE music34.asm :
; 0x910B..0x9B7F : Music 34
Music_34:       db 0
		db 0
		db 0
		db 0BDh
		dw Music_2_Channel_0
		dw Music_2_Channel_1
		dw Music_2_Channel_2
		dw Music_2_Channel_3
		dw Music_2_Channel_4
		dw Music_2_Channel_5
		dw Music_2_Channel_6
		dw Music_2_Channel_7
		dw Music_2_Channel_9
		dw Music_2_Channel_9
Music_2_Channel_0:
		  stereo 0C0h
		  inst 12
		  vol 0Ch
		  vibrato 02Ch
		countedLoopStart 1
		  setRelease 05h
		        noteL As3,192
		  setRelease 010h
		        noteL As3,24
		        note  As3
		        wait
		  setRelease 05h
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        waitL 40
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		countedLoopEnd
		mainLoopStart
		  vol 0Bh
		countedLoopStart 3
		  setRelease 010h
		        noteL As3,24
		        note  As3
		        wait
		  setRelease 05h
		        noteL Cs4,8
		        note  Cs4
		        note  Cs4
		        note  As3
		        waitL 40
		        noteL F4,8
		        note  F4
		        note  F4
		        note  Fs4
		        note  Fs4
		        note  Fs4
		countedLoopEnd
		  vol 0Ch
		        noteL A4,8
		  vol 0Ah
		        note  A4
		        note  A4
		  vol 0Ch
		        note  Cs5
		  vol 0Ah
		        note  Cs5
		        note  Cs5
		  vol 0Ch
		        note  G4
		  vol 0Ah
		        note  G4
		        note  G4
		  vol 0Ch
		        note  Gs4
		  vol 0Ah
		        note  Gs4
		        note  Gs4
		  vol 0Bh
		  setRelease 01h
		        noteL C5,0
		  setSlide 0Ah
		        noteL D5,48
		  noSlide
		        noteL Ds4,6
		        waitL 18
		        noteL Gs4,24
		        noteL E4,0
		  setSlide 0Ah
		        noteL Fs4,96
		  noSlide
		        noteL G4,0
		  setSlide 0Ah
		        noteL A4,48
		  noSlide
		        noteL F4,6
		        waitL 18
		        noteL Fs4,24
		        noteL Cs4,0
		  setSlide 0Ah
		        noteL Ds4,96
		  noSlide
		  vol 0Ch
		countedLoopStart 1
		  setRelease 010h
		        noteL As3,24
		        note  As3
		        wait
		        note  As3
		        note  As3
		        wait
		        note  As3
		        note  As3
		countedLoopEnd
		  vol 0Bh
		countedLoopStart 1
		  setRelease 010h
		        noteL As3,24
		        note  As3
		        wait
		  setRelease 05h
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        waitL 40
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		countedLoopEnd
		mainLoopEnd
Music_2_Channel_1:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 13
		  vol 0Ch
		        noteL As6,6
		  vol 09h
		        note  As6
		  vol 07h
		        note  As6
		        wait
		  inst 20
		  vol 0Ah
		  setRelease 05h
		        noteL A4,8
		        note  A4
		        note  A4
		        note  As4
		        note  As4
		        note  As4
		repeatSection1Start
		  setRelease 01h
		        noteL Cs5,84
		        noteL B4,12
		        note  As4
		        note  Gs4
		        noteL A4,6
		  vol 07h
		        note  A4
		  vol 0Ah
		        noteL Fs4,180
		repeatEnd
		repeatSection2Start
		        noteL Cs5,8
		  vol 07h
		        note  Cs5
		  vol 0Ah
		        note  Cs5
		  setRelease 01h
		        noteL E5,60
		        noteL Ds5,12
		        note  Cs5
		        note  B4
		        noteL C5,6
		  vol 07h
		        note  C5
		  vol 0Ah
		        noteL A4,180
		mainLoopStart
		  inst 22
		  vol 0Ch
		        noteL G6,36
		        noteL F6,12
		        note  E6
		        note  D6
		        note  E6
		        note  F6
		  sustain
		        noteL Cs6,6
		        note  B5
		  setRelease 01h
		        noteL Cs6,48
		        noteL D6,12
		  sustain
		        noteL As5,3
		        note  B5
		        noteL As5,6
		  setRelease 01h
		        noteL Gs5,12
		  sustain
		        noteL G5,6
		        note  F5
		  setRelease 01h
		        noteL G5,180
		        waitL 12
		  inst 44
		  vol 0Ch
		        note  E6
		        note  F6
		        note  C7
		        note  B6
		        note  G6
		        note  Gs6
		        note  Ds7
		        noteL D7,6
		        note  Cs7
		        noteL D7,63
		        noteL Ds7,8
		        noteL C7,7
		        noteL B6,6
		  vol 09h
		        noteL B6,8
		  vol 0Ch
		        note  G6
		        note  Gs6
		        noteL Ds7,9
		        noteL D7,8
		        noteL Cs7,19
		        noteL As6,12
		        noteL B6,11
		        noteL Cs7,5
		        noteL D7,4
		        note  F7
		        noteL A7,72
		  inst 26
		  vol 0Dh
		        noteL E5,6
		        note  F5
		        note  A5
		        note  C6
		  setRelease 05h
		        noteL Cs6,8
		        note  Cs6
		        note  Cs6
		        note  C6
		        note  C6
		        note  C6
		        note  Gs5
		        note  Gs5
		        note  Gs5
		        note  E5
		        note  E5
		        note  E5
		  setRelease 01h
		        noteL Cs5,48
		        noteL D5,6
		  vol 0Ah
		        note  D5
		  vol 08h
		        note  D5
		        wait
		  vol 0Dh
		        noteL Cs5,4
		        note  D5
		        note  F5
		        note  A5
		        note  Cs6
		        note  E6
		  sustain
		        noteL F6,84
		  vol 0Ah
		        noteL F6,6
		  vol 08h
		  setRelease 01h
		        note  F6
		  vol 0Dh
		        noteL Gs5,48
		        noteL A5,6
		  vol 0Ah
		        note  A5
		  vol 08h
		        note  A5
		        wait
		  vol 0Dh
		        noteL Gs5,4
		        note  A5
		        note  C6
		        note  E6
		        note  Gs6
		        note  B6
		  sustain
		        noteL C7,84
		  vol 0Ah
		        noteL C7,6
		  vol 08h
		  setRelease 01h
		        note  C7
		countedLoopStart 1
		  inst 13
		  vol 0Dh
		  setRelease 03h
		        noteL As6,8
		  vol 09h
		        note  As6
		        wait
		  vol 0Dh
		        note  A6
		  vol 09h
		        note  A6
		        waitL 32
		  vol 0Dh
		        noteL Gs6,8
		  vol 09h
		        note  Gs6
		        wait
		  vol 0Dh
		        note  G6
		  vol 09h
		        note  G6
		        waitL 32
		  vol 0Dh
		        noteL Fs6,8
		  vol 09h
		        note  Fs6
		        wait
		  vol 0Dh
		        note  F6
		  vol 09h
		        note  F6
		        wait
		countedLoopEnd
		  setRelease 01h
		  inst 20
		  vol 0Bh
		  sustain
		        noteL As4,192
		  setRelease 01h
		  vibrato 020h
		        note  As4
		  vibrato 02Ch
		mainLoopEnd
Music_2_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 3
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
		        noteL F4,8
		        note  F4
		        note  F4
		        note  Fs4
		        note  Fs4
		        note  Fs4
		repeatSection1Start
		  setRelease 01h
		        noteL A4,84
		        noteL G4,12
		        note  Fs4
		        note  E4
		        noteL F4,6
		  vol 07h
		        note  F4
		  vol 0Ah
		        noteL D4,180
		repeatEnd
		repeatSection2Start
		        noteL A4,8
		  vol 07h
		        note  A4
		  vol 0Ah
		        note  A4
		  setRelease 01h
		        noteL C5,60
		        noteL B4,12
		        note  A4
		        note  G4
		        noteL Gs4,6
		  vol 07h
		        note  Gs4
		  vol 0Ah
		        noteL F4,180
		mainLoopStart
		        waitL 240
		  vol 0Ah
		        noteL E5,6
		  vol 07h
		        note  E5
		  vol 0Ah
		        noteL Cs5,132
		        waitL 120
		  inst 13
		  vol 0Dh
		        noteL As6,6
		  vol 0Ah
		        note  As6
		  vol 08h
		        note  As6
		        waitL 174
		  vol 0Dh
		        noteL As6,6
		  vol 0Ah
		        note  As6
		  vol 08h
		        note  As6
		        waitL 30
		  vol 0Dh
		        noteL As6,6
		  vol 0Ah
		        note  As6
		  vol 08h
		        note  As6
		        wait
		  vol 0Dh
		        note  As6
		  vol 0Ah
		        note  As6
		  vol 08h
		        note  As6
		        waitL 78
		  inst 26
		  vol 0Ch
		        noteL Gs4,48
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		        wait
		  vol 0Ch
		        noteL F4,24
		  inst 27
		  vol 0Bh
		        noteL A5,16
		        note  As5
		        note  A5
		        noteL Gs5,6
		  vol 08h
		        note  Gs5
		  vol 0Bh
		        noteL E5,36
		  inst 26
		  vol 0Ch
		        noteL F5,48
		        noteL Fs5,6
		  vol 09h
		        note  Fs5
		  vol 07h
		        note  Fs5
		        wait
		  vol 0Ch
		        noteL F5,24
		  inst 20
		  vol 0Bh
		        noteL F5,8
		  vol 08h
		        note  F5
		  vol 0Bh
		        note  E5
		  vol 08h
		        note  E5
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        noteL A4,48
		countedLoopStart 1
		  inst 3
		  vol 0Dh
		  setRelease 03h
		        waitL 24
		        noteL As6,8
		  vol 09h
		        note  As6
		        waitL 32
		  vol 0Dh
		        noteL As6,8
		  vol 09h
		        note  As6
		        wait
		  vol 0Dh
		        note  As6
		  vol 09h
		        note  As6
		        waitL 32
		  vol 0Dh
		        noteL As6,8
		  vol 09h
		        note  As6
		        wait
		  vol 0Dh
		        note  As6
		  vol 09h
		        note  As6
		        wait
		countedLoopEnd
		  setRelease 01h
		  inst 20
		  vol 0Bh
		        noteL Fs4,144
		        noteL F4,48
		        noteL E4,192
		mainLoopEnd
Music_2_Channel_3:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 61
		  vol 0Eh
		        noteL C3,30
		  stereo 080h
		  shifting 020h
		  inst 20
		  vol 09h
		  setRelease 05h
		        noteL F4,8
		        note  F4
		        note  F4
		        note  Fs4
		        note  Fs4
		        note  Fs4
		repeatSection1Start
		  setRelease 01h
		        noteL A4,84
		        noteL G4,12
		        note  Fs4
		        noteL E4,6
		  shifting 00h
		  stereo 0C0h
		  inst 3
		countedLoopStart 1
		  vol 0Ch
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		        wait
		countedLoopEnd
		        waitL 24
		  setRelease 05h
		  vol 0Ch
		        noteL As4,8
		        note  As4
		        note  As4
		  setRelease 01h
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		        waitL 30
		  vol 0Ch
		  setRelease 05h
		        noteL As4,8
		        note  As4
		        note  As4
		        note  As4
		        note  As4
		        note  As4
		repeatEnd
		repeatSection2Start
		        noteL A4,8
		  vol 07h
		        note  A4
		  vol 0Ah
		        note  A4
		  setRelease 01h
		        noteL C5,60
		        noteL B4,12
		        note  A4
		        noteL G4,6
		  shifting 00h
		  stereo 0C0h
		  inst 3
		countedLoopStart 1
		  vol 0Ch
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		        wait
		countedLoopEnd
		        waitL 24
		  setRelease 05h
		  vol 0Ch
		        noteL As4,8
		        note  As4
		        note  As4
		  setRelease 01h
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		        waitL 30
		  vol 0Ch
		  setRelease 05h
		        noteL As4,8
		        note  As4
		        note  As4
		        note  As4
		        note  As4
		        note  As4
		        waitL 6
		mainLoopStart
		        waitL 6
		  stereo 080h
		  shifting 010h
		  inst 22
		  vol 0Ah
		        noteL G6,36
		        noteL F6,12
		        note  E6
		        note  D6
		        note  E6
		        note  F6
		  sustain
		        noteL Cs6,6
		        note  B5
		  setRelease 01h
		        noteL Cs6,48
		        noteL D6,12
		  sustain
		        noteL As5,3
		        note  B5
		        noteL As5,6
		  setRelease 01h
		        noteL Gs5,12
		  sustain
		        noteL G5,6
		        note  F5
		  setRelease 01h
		        noteL G5,30
		  shifting 020h
		  inst 20
		  vol 09h
		        noteL E5,6
		  vol 06h
		        note  E5
		  vol 09h
		        noteL Cs5,30
		  stereo 0C0h
		  shifting 00h
		  inst 13
		  vol 0Ch
		        noteL C6,6
		  vol 09h
		        note  C6
		  vol 0Ch
		  sustain
		        noteL A5,84
		  vol 09h
		        noteL A5,6
		  vol 07h
		  setRelease 01h
		        note  A5
		        waitL 12
		  shifting 010h
		  stereo 080h
		  inst 44
		  vol 0Ah
		        note  E6
		        note  F6
		        note  C7
		        note  B6
		        note  G6
		        note  Gs6
		        note  Ds7
		        noteL D7,6
		        note  Cs7
		  stereo 0C0h
		  shifting 00h
		  inst 3
		  vol 0Dh
		        note  As5
		  vol 0Ah
		        note  As5
		  vol 08h
		        note  As5
		        waitL 45
		  inst 44
		  stereo 080h
		  shifting 010h
		  vol 0Ah
		        noteL Ds7,8
		        noteL C7,7
		        noteL B6,6
		  vol 07h
		        noteL B6,8
		  vol 0Ah
		        note  G6
		        note  Gs6
		        noteL Ds7,9
		        noteL D7,8
		        noteL Cs7,19
		        noteL As6,12
		        noteL B6,11
		        noteL Cs7,5
		        noteL D7,4
		        note  F7
		        noteL A7,12
		  stereo 0C0h
		  shifting 00h
		  inst 3
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
		        noteL F4,48
		        noteL Fs4,6
		  vol 09h
		        note  Fs4
		  vol 07h
		        note  Fs4
		        wait
		  vol 0Ch
		        noteL D4,24
		  setSlide 020h
		  sustain
		        noteL Cs5,84
		  noSlide
		  vol 09h
		        noteL Cs5,6
		  vol 07h
		  setRelease 01h
		        note  Cs5
		  vol 0Ch
		        noteL Cs5,48
		        noteL D5,6
		  vol 09h
		        note  D5
		  vol 07h
		        note  D5
		        wait
		  vol 0Ch
		        noteL Cs5,24
		  setSlide 020h
		        noteL A5,48
		  noSlide
		  sustain
		        noteL F5,36
		  vol 09h
		        noteL F5,6
		  vol 07h
		  setRelease 01h
		        note  F5
		countedLoopStart 1
		  setRelease 03h
		  inst 3
		  vol 0Ch
		        noteL As5,8
		  vol 08h
		        note  As5
		        wait
		  vol 0Ch
		        note  As5
		  vol 08h
		        note  As5
		        waitL 32
		  vol 0Ch
		        noteL As5,8
		  vol 08h
		        note  As5
		        wait
		  vol 0Ch
		        note  As5
		  vol 08h
		        note  As5
		        waitL 32
		  vol 0Ch
		        noteL As5,8
		  vol 08h
		        note  As5
		        wait
		  vol 0Ch
		        note  As5
		  vol 08h
		        note  As5
		        wait
		countedLoopEnd
		  stereo 080h
		  shifting 020h
		  inst 20
		  vol 0Ah
		        waitL 6
		        noteL Fs4,144
		        noteL F4,48
		        noteL E4,192
		mainLoopEnd
Music_2_Channel_4:
		        waitL 6
		  shifting 020h
		  stereo 040h
		  setRelease 01h
		  vibrato 02Ch
		repeatStart
		  inst 13
		  vol 0Bh
		        noteL As6,6
		  vol 08h
		        note  As6
		  vol 06h
		        note  As6
		        wait
		  inst 20
		  vol 09h
		  setRelease 05h
		        noteL A4,8
		        note  A4
		        note  A4
		        note  As4
		        note  As4
		        note  As4
		repeatSection1Start
		  setRelease 01h
		        noteL Cs5,84
		        noteL B4,12
		        note  As4
		        note  Gs4
		        noteL A4,6
		  vol 06h
		        note  A4
		  vol 09h
		        noteL Fs4,180
		repeatEnd
		repeatSection2Start
		        noteL Cs5,8
		  vol 06h
		        note  Cs5
		  vol 09h
		        note  Cs5
		  setRelease 01h
		        noteL E5,60
		        noteL Ds5,12
		        note  Cs5
		        note  B4
		        noteL C5,6
		  vol 06h
		        note  C5
		  vol 09h
		        noteL A4,180
		mainLoopStart
		  inst 22
		  vol 0Bh
		        noteL G6,36
		        noteL F6,12
		        note  E6
		        note  D6
		        note  E6
		        note  F6
		  sustain
		        noteL Cs6,6
		        note  B5
		  setRelease 01h
		        noteL Cs6,48
		        noteL D6,12
		  sustain
		        noteL As5,3
		        note  B5
		        noteL As5,6
		  setRelease 01h
		        noteL Gs5,12
		  sustain
		        noteL G5,6
		        note  F5
		  setRelease 01h
		        noteL G5,84
		  inst 13
		  vol 0Bh
		        noteL C6,6
		  vol 08h
		        note  C6
		  vol 0Bh
		  sustain
		        noteL A5,84
		  vol 08h
		        noteL A5,6
		  vol 06h
		  setRelease 01h
		        note  A5
		  stereo 080h
		  inst 44
		  vol 0Bh
		        noteL E6,12
		        note  F6
		        note  C7
		        note  B6
		        note  G6
		        note  Gs6
		        note  Ds7
		        noteL D7,6
		        note  Cs7
		        noteL D7,12
		  inst 13
		  vol 0Ch
		        noteL As6,6
		  vol 09h
		        note  As6
		  vol 07h
		        note  As6
		        waitL 33
		  inst 44
		  vol 0Bh
		        noteL Ds7,8
		        noteL C7,7
		        noteL B6,6
		  vol 08h
		        noteL B6,8
		  vol 0Bh
		        note  G6
		        note  Gs6
		        noteL Ds7,9
		        noteL D7,8
		        noteL Cs7,19
		        noteL As6,12
		        noteL B6,11
		        noteL Cs7,5
		        noteL D7,4
		        note  F7
		        noteL A7,72
		  stereo 040h
		  inst 26
		  vol 0Ch
		        noteL E5,6
		        note  F5
		        note  A5
		        note  C6
		  setRelease 05h
		        noteL Cs6,8
		        note  Cs6
		        note  Cs6
		        note  C6
		        note  C6
		        note  C6
		        note  Gs5
		        note  Gs5
		        note  Gs5
		        note  E5
		        note  E5
		        note  E5
		  setRelease 01h
		        noteL Cs5,48
		        noteL D5,6
		  vol 09h
		        note  D5
		  vol 07h
		        note  D5
		        wait
		  vol 0Ch
		        noteL Cs5,4
		        note  D5
		        note  F5
		        note  A5
		        note  Cs6
		        note  E6
		  stereo 080h
		  inst 27
		  vol 0Ah
		        noteL A5,16
		        note  As5
		        note  A5
		        noteL Gs5,6
		  vol 07h
		        note  Gs5
		  vol 0Ah
		        noteL E5,36
		  stereo 040h
		  inst 26
		  vol 0Ch
		        noteL Gs5,48
		        noteL A5,6
		  vol 09h
		        note  A5
		  vol 07h
		        note  A5
		        wait
		  vol 0Ch
		        noteL Gs5,4
		        note  A5
		        note  C6
		        note  E6
		        note  Gs6
		        note  B6
		  stereo 080h
		  inst 20
		  vol 0Ah
		        noteL F5,8
		  vol 07h
		        note  F5
		  vol 0Ah
		        note  E5
		  vol 07h
		        note  E5
		  vol 0Ah
		        note  Cs5
		  vol 07h
		        note  Cs5
		  vol 0Ah
		        noteL A4,48
		  stereo 040h
		countedLoopStart 1
		  inst 13
		  vol 0Ch
		  setRelease 03h
		        noteL As6,8
		  vol 08h
		        note  As6
		        wait
		  vol 0Ch
		        note  A6
		  vol 08h
		        note  A6
		        waitL 32
		  vol 0Ch
		        noteL Gs6,8
		  vol 08h
		        note  Gs6
		        wait
		  vol 0Ch
		        note  G6
		  vol 08h
		        note  G6
		        waitL 32
		  vol 0Ch
		        noteL Fs6,8
		  vol 08h
		        note  Fs6
		        wait
		  vol 0Ch
		        note  F6
		  vol 08h
		        note  F6
		        wait
		countedLoopEnd
		  setRelease 01h
		  vol 0Ah
		  inst 21
		  sustain
		        noteL As4,192
		  setRelease 01h
		  vibrato 020h
		        note  As4
		  vibrato 02Ch
		mainLoopEnd
Music_2_Channel_5:
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
Music_2_Channel_6:
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
		        waitL 168
		  psgInst 07Bh
		countedLoopStart 5
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  B3
		countedLoopEnd
		  psgInst 07Ch
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  A4
		  psgInst 0Dh
		        psgNoteL As4,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        waitL 168
		  psgInst 07Bh
		countedLoopStart 1
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  B3
		countedLoopEnd
		  psgInst 07Ch
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  A4
		  psgInst 07Dh
		        psgNoteL G4,8
		        waitL 4
		        psgNoteL Ds4,72
		  psgInst 0Ah
		        waitL 6
		  psgInst 06h
		        wait
		mainLoopStart
		countedLoopStart 3
		  setRelease 013h
		  psgInst 07Ch
		        psgNoteL Cs3,24
		        psgNote  Cs3
		  psgInst 00h
		        wait
		  psgInst 07Ch
		  setRelease 05h
		        psgNoteL F3,8
		        psgNote  F3
		        psgNote  F3
		        psgNoteL Cs3,10
		        waitL 14
		  psgInst 00h
		        waitL 24
		  psgInst 07Ch
		        psgNoteL Cs3,8
		        psgNote  Cs3
		        psgNote  Cs3
		        psgNote  Cs3
		        psgNote  Cs3
		        psgNote  Cs3
		countedLoopEnd
		  setRelease 013h
		  psgInst 07Dh
		        psgNoteL Gs3,24
		        psgNote  G3
		        psgNote  F3
		        psgNote  Cs3
		  psgInst 00h
		        waitL 132
		  setRelease 01h
		  psgInst 07Dh
		        psgNoteL E5,4
		        psgNote  F5
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  Gs5
		        psgNote  F5
		        psgNote  E5
		        psgNote  C5
		        psgNote  B4
		        psgNote  Gs4
		        psgNoteL E4,5
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
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  psgInst 00h
		        waitL 40
		  psgInst 07Dh
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  psgInst 00h
		        waitL 40
		  psgInst 07Dh
		        psgNoteL Fs4,8
		        psgNote  F4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  F4
		countedLoopEnd
		repeatStart
		  setRelease 05h
		  psgInst 07Dh
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  psgInst 00h
		        waitL 38
		  psgInst 07Dh
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		  setRelease 05h
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  psgInst 00h
		        waitL 38
		  psgInst 07Dh
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		repeatSection1Start
		  setRelease 05h
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  setRelease 01h
		        psgNoteL As4,6
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        psgNoteL As4,6
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        waitL 10
		  psgInst 07Ch
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		  setRelease 01h
		        psgNoteL As4,6
		        wait
		  psgInst 09h
		        wait
		  psgInst 05h
		        wait
		mainLoopEnd
Music_2_Channel_7:
		  setRelease 01h
		  vibrato 04Ch
		  psgInst 0Dh
		        psgNoteL As3,6
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
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  B3
		countedLoopEnd
		  psgInst 07Ah
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  G4
		  shifting 00h
		  psgInst 0Dh
		        psgNoteL As3,6
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
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  B3
		countedLoopEnd
		  psgInst 07Ah
		        psgNoteL As3,4
		        psgNote  B3
		        psgNote  C4
		        psgNote  Cs4
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  G4
		  shifting 00h
		  psgInst 07Dh
		        psgNoteL E4,8
		        waitL 4
		        psgNoteL B3,72
		  psgInst 0Ah
		        waitL 6
		  psgInst 06h
		        wait
		mainLoopStart
		  shifting 00h
		countedLoopStart 3
		  setRelease 013h
		  psgInst 07Ch
		        psgNoteL As2,24
		        psgNote  As2
		  psgInst 00h
		        wait
		  psgInst 07Ch
		  setRelease 05h
		        psgNoteL As2,8
		        psgNote  As2
		        psgNote  As2
		        psgNoteL As2,10
		        waitL 14
		  psgInst 00h
		        waitL 24
		  psgInst 07Ch
		        psgNoteL As2,8
		        psgNote  As2
		        psgNote  As2
		        psgNote  A2
		        psgNote  A2
		        psgNote  A2
		countedLoopEnd
		  setRelease 013h
		  psgInst 07Dh
		        psgNoteL F3,24
		        psgNote  E3
		        psgNote  Cs3
		        psgNote  A2
		  psgInst 00h
		        waitL 140
		  shifting 010h
		  setRelease 01h
		  psgInst 07Bh
		        psgNoteL E5,4
		        psgNote  F5
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  Gs5
		        psgNote  F5
		        psgNote  E5
		        psgNote  C5
		        psgNote  B4
		        psgNote  Gs4
		        psgNoteL E4,5
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
		        psgNoteL As3,8
		        psgNote  As3
		        psgNote  B3
		        psgNote  As3
		  psgInst 00h
		        waitL 40
		  psgInst 07Dh
		        psgNoteL As3,8
		        psgNote  As3
		        psgNote  B3
		        psgNote  As3
		  psgInst 00h
		        waitL 44
		  shifting 010h
		  psgInst 07Ch
		        psgNoteL Fs4,8
		        psgNote  F4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Fs4
		  setRelease 01h
		        psgNoteL F4,4
		countedLoopEnd
		        waitL 4
		repeatStart
		  setRelease 05h
		  psgInst 07Bh
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  psgInst 00h
		        waitL 38
		  psgInst 07Bh
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		  setRelease 05h
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  psgInst 00h
		        waitL 38
		  psgInst 07Bh
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		repeatSection1Start
		  setRelease 05h
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		  setRelease 01h
		        psgNoteL As4,6
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        psgNoteL As4,6
		  psgInst 08h
		        wait
		  psgInst 04h
		        waitL 10
		  psgInst 07Ah
		  setRelease 080h
		        psgNoteL Gs4,1
		        psgNote  A4
		  setRelease 01h
		        psgNoteL As4,6
		        wait
		  psgInst 07h
		        waitL 8
		mainLoopEnd
Music_2_Channel_9:
		channel_end
