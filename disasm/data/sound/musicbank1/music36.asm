
; ASM FILE music36.asm :
; 0xA011..0xAFFC : Music 36
Music_36:       db 0
		db 0
		db 0
		db 0CDh
		dw Music_4_Channel_0
		dw Music_4_Channel_1
		dw Music_4_Channel_2
		dw Music_4_Channel_3
		dw Music_4_Channel_4
		dw Music_4_Channel_5
		dw Music_4_Channel_6
		dw Music_4_Channel_7
		dw Music_4_Channel_9
		dw Music_4_Channel_9
Music_4_Channel_0:
		  stereo 0C0h
		  inst 21
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL Gs2,0
		  setSlide 017h
		        noteL Gs3,48
		  noSlide
		mainLoopStart
		        noteL Cs4,24
		        note  C4
		        note  Gs3
		        note  E3
		repeatStart
		        noteL Cs3,84
		  sustain
		        noteL Gs4,4
		        note  As4
		  setRelease 01h
		        note  C5
		        noteL Cs5,6
		  vol 09h
		        note  Cs5
		  vol 0Ch
		        note  Cs5
		        note  Cs5
		        noteL Gs4,12
		        noteL E4,6
		        note  Ds4
		        note  E4
		        note  Cs4
		        note  Gs3
		        note  G3
		        note  Gs3
		        note  E3
		        note  Cs3
		        note  C3
		        noteL B2,84
		  sustain
		        noteL Gs4,4
		        note  A4
		  setRelease 01h
		        note  As4
		        noteL B4,6
		  vol 09h
		        note  B4
		  vol 0Ch
		        note  B4
		        note  B4
		        noteL A4,12
		        noteL F4,6
		        note  Ds4
		        note  F4
		        note  Ds4
		        note  B3
		        note  A3
		        note  B3
		        note  A3
		        note  F3
		        note  Cs3
		        noteL Ds3,36
		  sustain
		        noteL As3,4
		        note  C4
		  setRelease 01h
		        note  D4
		        noteL Ds4,24
		        noteL As3,6
		        note  Fs3
		  vol 09h
		        note  Fs3
		  vol 06h
		        note  Fs3
		  vol 0Ch
		        noteL A2,36
		  sustain
		        noteL F4,4
		        note  Fs4
		  setRelease 01h
		        note  G4
		        noteL A4,24
		        noteL Ds4,6
		        note  B3
		  vol 09h
		        note  B3
		  vol 06h
		        note  B3
		countedLoopStart 1
		  vol 0Ch
		  setRelease 03h
		        noteL D3,12
		        noteL D4,6
		        note  D4
		        note  D4
		  vol 07h
		        note  D4
		  vol 0Ch
		        note  D4
		        note  D4
		        noteL G2,12
		        noteL G3,6
		        note  G3
		        note  G3
		  vol 07h
		        note  G3
		  vol 0Ch
		        note  G3
		        note  G3
		countedLoopEnd
		  setRelease 01h
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL D3,12
		        waitL 210
		        wait
		  inst 12
		  vol 0Dh
		        noteL B2,0
		  setSlide 05h
		        noteL Cs3,192
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL Cs4,3
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        note  Gs3
		        note  G3
		        note  Fs3
		  setRelease 01h
		        note  F3
		        waitL 189
		  inst 12
		  vol 0Dh
		        noteL A2,0
		  setSlide 05h
		        noteL B2,168
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL B3,3
		        note  As3
		        note  A3
		        note  Gs3
		        note  G3
		        note  Fs3
		        note  F3
		        note  E3
		  setRelease 01h
		        note  Ds3
		        waitL 165
		  inst 12
		  vol 0Dh
		        noteL Cs3,0
		  setSlide 05h
		        noteL Ds3,96
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL Ds4,3
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        note  Gs3
		  setRelease 01h
		        note  G3
		        waitL 69
		  inst 12
		  vol 0Dh
		        noteL G2,0
		  setSlide 05h
		        noteL A2,96
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL A3,3
		        note  Gs3
		        note  G3
		        note  Fs3
		        note  F3
		        note  E3
		        note  Ds3
		        note  D3
		  setRelease 01h
		        note  Cs3
		        waitL 69
		  inst 12
		  vol 0Dh
		        noteL C3,0
		  setSlide 05h
		        noteL D3,96
		  noSlide
		        noteL F3,0
		  setSlide 05h
		        noteL G3,96
		  noSlide
		  inst 21
		  vol 0Ch
		  setRelease 09h
		countedLoopStart 6
		        noteL Gs4,12
		        note  G4
		        note  Ds4
		        note  C4
		        note  B3
		        note  C4
		        note  Ds4
		        note  Fs4
		countedLoopEnd
		        noteL Gs4,12
		        note  G4
		        note  Ds4
		        note  Fs4
		        note  Gs4
		        note  Ds4
		  setRelease 01h
		        noteL Gs3,24
		mainLoopEnd
Music_4_Channel_1:
		  stereo 0C0h
		  inst 26
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL G6,6
		        note  B5
		        note  D6
		        note  G6
		        note  Gs6
		        note  C6
		        note  Fs6
		        note  Gs6
		mainLoopStart
		  setRelease 00h
		        noteL Cs7,4
		        note  Ds7
		        note  Cs7
		        note  Ds7
		        note  Cs7
		        note  Ds7
		  setRelease 01h
		        noteL Cs7,24
		        noteL Ds6,6
		        note  G5
		        note  Gs5
		        note  E6
		        note  C6
		        note  Cs6
		        note  Gs6
		  vol 0Ah
		        note  Gs6
		countedLoopStart 1
		  inst 13
		  vol 0Ch
		        noteL C6,30
		  vol 0Ah
		        noteL C6,6
		  vol 0Ch
		        note  C6
		        note  C6
		        noteL C6,18
		        note  Gs5
		        noteL E6,108
		  vol 0Ah
		        noteL E6,6
		  vol 08h
		        note  E6
		        waitL 12
		  vol 0Ch
		        noteL Cs6,24
		        noteL D6,18
		        note  G6
		        noteL Ds6,96
		  vol 0Ah
		        noteL Ds6,6
		  vol 08h
		        note  Ds6
		  vol 0Ch
		        noteL D6,30
		  vol 0Ah
		        noteL D6,6
		  vol 0Ch
		        note  D6
		        note  D6
		        noteL D6,18
		        noteL As5,6
		  vol 0Ah
		        note  As5
		  vol 08h
		        note  As5
		  vol 0Ch
		        noteL Fs6,48
		        noteL F6,6
		        note  E6
		        noteL Ds6,12
		        noteL B5,6
		  vol 0Ah
		        note  B5
		  vol 08h
		        note  B5
		        wait
		  vol 0Ch
		        noteL Cs6,204
		countedLoopEnd
		  inst 26
		  vol 0Ch
		        noteL Gs7,6
		        note  G7
		        note  Fs7
		        note  D7
		        note  Cs7
		        note  As6
		        note  A6
		        note  Fs6
		        note  Ds6
		        note  D6
		        note  Cs6
		        note  A5
		        note  Gs5
		        note  F5
		        note  E5
		        note  Cs5
		  setRelease 00h
		countedLoopStart 11
		        noteL As4,4
		        note  B4
		countedLoopEnd
		  sustain
		  setRelease 01h
		        noteL As4,16
		  vol 08h
		        note  As4
		  setRelease 01h
		  vol 06h
		        note  As4
		        waitL 192
		  inst 1
		  vol 0Ch
		        note  C6
		repeatStart
		  sustain
		        noteL C6,3
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        noteL E5,6
		repeatSection1Start
		  vol 0Ah
		        noteL E5,6
		  vol 07h
		  setRelease 01h
		        note  E5
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL E5,6
		  setRelease 01h
		  vol 05h
		        note  E5
		  vol 08h
		repeatEnd
		repeatSection3Start
		  vol 06h
		        noteL E5,6
		  setRelease 01h
		  vol 04h
		        note  E5
		  vol 07h
		repeatStart
		  sustain
		        noteL C6,3
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        noteL E5,6
		repeatSection1Start
		  vol 05h
		        noteL E5,6
		  vol 03h
		  setRelease 01h
		        note  E5
		  vol 06h
		repeatEnd
		repeatSection2Start
		  vol 04h
		        noteL E5,6
		  setRelease 01h
		  vol 02h
		        note  E5
		        wait
		  vol 0Ch
		        noteL Ds6,168
		repeatStart
		  sustain
		        noteL Ds6,3
		        note  D6
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        noteL G5,6
		repeatSection1Start
		  vol 0Ah
		        noteL G5,6
		  vol 07h
		  setRelease 01h
		        note  G5
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL G5,6
		  vol 05h
		  setRelease 01h
		        note  G5
		  vol 08h
		repeatEnd
		repeatSection3Start
		  vol 06h
		        noteL G5,6
		  vol 04h
		  setRelease 01h
		        note  G5
		  vol 07h
		repeatStart
		  sustain
		        noteL Ds6,3
		        note  D6
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		repeatSection1Start
		        noteL Gs5,3
		  vol 05h
		        noteL G5,6
		  vol 03h
		        note  G5
		  setRelease 01h
		        note  G5
		  vol 06h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Gs5,3
		  vol 0Ch
		        noteL D6,96
		repeatStart
		  sustain
		        noteL D6,3
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        noteL Fs5,6
		repeatSection1Start
		  vol 0Ah
		        noteL Fs5,6
		  vol 07h
		  setRelease 01h
		        note  Fs5
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL Fs5,6
		  setRelease 01h
		  vol 05h
		        note  Fs5
		  vol 08h
		  sustain
		        noteL D6,3
		        note  Cs6
		        note  C6
		  setRelease 01h
		        note  B5
		  vol 0Ch
		        noteL Fs6,96
		repeatStart
		  sustain
		        noteL Fs6,3
		        note  F6
		        note  E6
		        note  Ds6
		        note  D6
		        note  Cs6
		        note  C6
		        note  B5
		        noteL As5,6
		repeatSection1Start
		  vol 0Ah
		        noteL As5,6
		  vol 07h
		  setRelease 01h
		        note  As5
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL As5,6
		  vol 05h
		  setRelease 01h
		        note  As5
		  vol 08h
		  sustain
		        noteL Fs6,3
		        note  F6
		        note  E6
		  setRelease 01h
		        note  Ds6
		  vol 0Ch
		        noteL Cs6,56
		  vol 09h
		        noteL Cs6,8
		  vol 0Ch
		        note  Cs6
		  vol 09h
		        note  Cs6
		  vol 0Ch
		        note  Cs6
		  vol 09h
		        note  Cs6
		  vol 0Ch
		        noteL Cs6,96
		repeatStart
		  sustain
		        noteL Cs6,3
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        noteL F5,6
		repeatSection1Start
		  vol 0Ah
		        noteL F5,6
		  vol 07h
		  setRelease 01h
		        note  F5
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL F5,6
		  setRelease 01h
		  vol 05h
		        note  F5
		  vol 08h
		repeatEnd
		repeatSection3Start
		  vol 06h
		        noteL F5,6
		  setRelease 01h
		  vol 04h
		        note  F5
		  vol 07h
		repeatStart
		  sustain
		        noteL Cs6,3
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		repeatSection1Start
		        noteL Fs5,3
		        noteL F5,6
		  vol 05h
		        note  F5
		  vol 03h
		  setRelease 01h
		        note  F5
		  vol 06h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Fs5,3
		  inst 44
		  vol 0Ch
		        noteL Fs6,4
		        note  A6
		        noteL Gs6,76
		        noteL D7,16
		        noteL As6,4
		        note  Gs6
		        note  F6
		        note  B5
		        note  D6
		        note  Fs6
		        note  G6
		        noteL E6,88
		        noteL G6,6
		        noteL Gs6,66
		repeatStart
		  inst 26
		  vol 0Ch
		        noteL G5,6
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		  vol 0Ah
		        note  Gs5
		  setRelease 03h
		  inst 13
		  vol 0Bh
		repeatSection1Start
		        noteL Ds6,12
		        noteL Ds6,6
		        noteL Ds6,12
		        noteL Ds6,6
		        note  Ds6
		  setRelease 01h
		repeatEnd
		repeatSection2Start
		        noteL Fs6,12
		        noteL Fs6,6
		        noteL Fs6,12
		        noteL Fs6,6
		        note  Fs6
		  setRelease 01h
		  inst 26
		  vol 0Ch
		        note  G6
		        note  B5
		        note  D6
		        note  G6
		        note  Gs6
		        note  C6
		        note  Fs6
		        note  Gs6
		        note  B6
		        note  D6
		        note  G6
		        note  B6
		        note  C7
		        note  Fs6
		        note  Gs6
		        note  C7
		mainLoopEnd
Music_4_Channel_2:
		  stereo 0C0h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL G5,24
		        note  Gs5
		mainLoopStart
		  inst 27
		  vol 09h
		  setRelease 07h
		        noteL E5,16
		        note  E5
		        note  E5
		  setRelease 01h
		        noteL E5,48
		countedLoopStart 1
		  inst 20
		  vol 0Ah
		        noteL Cs5,102
		  vol 07h
		        noteL Cs5,6
		  vol 05h
		        note  Cs5
		  vol 0Ah
		        noteL Cs5,18
		        noteL Gs4,12
		        noteL E5,18
		        noteL As4,30
		        noteL B4,108
		  vol 07h
		        noteL B4,6
		  vol 0Ah
		        noteL B4,18
		        noteL F4,12
		        noteL Fs4,18
		        note  A4
		        noteL As4,12
		        noteL Ds5,96
		        noteL B4,48
		        note  G4
		  vol 07h
		        noteL G4,6
		  vol 05h
		        note  G4
		        waitL 12
		  inst 27
		  vol 0Ah
		        noteL Gs4,24
		        noteL F5,48
		  setRelease 06h
		        noteL Fs5,16
		        note  Fs5
		        note  Fs5
		  setRelease 01h
		        noteL F5,48
		countedLoopEnd
		  inst 26
		  vol 0Bh
		        noteL Cs7,12
		  vol 09h
		        noteL Cs7,6
		  vol 07h
		        note  Cs7
		        waitL 204
		        wait
		  inst 1
		  vol 0Ah
		  sustain
		countedLoopStart 31
		        noteL Gs5,3
		  setSlide 020h
		        note  A5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL Gs5,3
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        noteL C5,6
		repeatSection1Start
		  vol 08h
		        noteL C5,6
		  vol 05h
		  setRelease 01h
		        note  C5
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL C5,6
		  setRelease 01h
		  vol 03h
		        note  C5
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL C5,6
		  setRelease 01h
		  vol 02h
		        note  C5
		  vol 05h
		repeatStart
		  sustain
		        noteL Gs5,3
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        noteL C5,6
		repeatSection1Start
		  vol 03h
		        noteL C5,6
		  vol 01h
		  setRelease 01h
		        note  C5
		  vol 04h
		repeatEnd
		repeatSection2Start
		  vol 02h
		        noteL C5,6
		  setRelease 01h
		  vol 00h
		        note  C5
		        wait
		  vol 0Ah
		  sustain
		countedLoopStart 27
		        noteL A5,3
		  setSlide 020h
		        note  As5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL A5,3
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        noteL Cs5,6
		repeatSection1Start
		  vol 08h
		        noteL Cs5,6
		  vol 05h
		  setRelease 01h
		        note  Cs5
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Cs5,6
		  vol 03h
		  setRelease 01h
		        note  Cs5
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL Cs5,6
		  vol 02h
		  setRelease 01h
		        note  Cs5
		  vol 05h
		repeatStart
		  sustain
		        noteL A5,3
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		repeatSection1Start
		        noteL D5,3
		  vol 03h
		        noteL Cs5,6
		  vol 01h
		        note  Cs5
		  setRelease 01h
		        note  Cs5
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL D5,3
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL As5,3
		  setSlide 020h
		        note  B5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL As5,3
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		        noteL D5,6
		repeatSection1Start
		  vol 08h
		        noteL D5,6
		  vol 05h
		  setRelease 01h
		        note  D5
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL D5,6
		  setRelease 01h
		  vol 03h
		        note  D5
		  vol 06h
		  sustain
		        noteL As5,3
		        note  A5
		        note  Gs5
		  setRelease 01h
		        note  G5
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL B5,3
		  setSlide 020h
		        note  Cs6
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL B5,3
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        noteL Ds5,6
		repeatSection1Start
		  vol 08h
		        noteL Ds5,6
		  vol 05h
		  setRelease 01h
		        note  Ds5
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Ds5,6
		  vol 03h
		  setRelease 01h
		        note  Ds5
		  vol 06h
		  sustain
		        noteL B5,3
		        note  As5
		        note  A5
		  setRelease 01h
		        note  Gs5
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL Fs5,3
		  setSlide 020h
		        note  Gs5
		countedLoopEnd
		countedLoopStart 15
		        noteL A5,3
		        note  G5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL A5,3
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        noteL Cs5,6
		repeatSection1Start
		  vol 08h
		        noteL Cs5,6
		  vol 05h
		  setRelease 01h
		        note  Cs5
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Cs5,6
		  setRelease 01h
		  vol 03h
		        note  Cs5
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL Cs5,6
		  setRelease 01h
		  vol 02h
		        note  Cs5
		  vol 05h
		repeatStart
		  sustain
		        noteL A5,3
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		repeatSection1Start
		        noteL D5,3
		        noteL Cs5,6
		  vol 03h
		        note  Cs5
		  vol 01h
		  setRelease 01h
		        note  Cs5
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL D5,3
		        waitL 48
		  inst 7
		  vol 0Ah
		        noteL D6,6
		        noteL Ds6,106
		        noteL D6,16
		        note  A5
		        noteL F5,96
		  inst 44
		  vol 0Ch
		        noteL D6,4
		        note  Ds6
		        noteL Cs6,20
		        noteL Gs6,4
		        note  B6
		        noteL G6,18
		  setRelease 03h
		  inst 13
		  vol 0Ah
		        noteL Cs6,12
		        noteL Cs6,6
		        noteL Cs6,12
		        noteL Cs6,6
		        note  Cs6
		  setRelease 01h
		  inst 9
		  vol 0Bh
		        noteL Cs5,4
		        note  F5
		        note  As5
		        note  F6
		        note  D6
		  vol 09h
		        note  D6
		  vol 0Bh
		        noteL A6,18
		        noteL E6,4
		        note  Ds6
		        note  As5
		  setRelease 03h
		  inst 13
		  vol 0Ah
		        noteL Ds6,12
		        noteL Ds6,6
		        noteL Ds6,12
		        noteL Ds6,6
		        note  Ds6
		  setRelease 01h
		  inst 7
		  vol 0Ah
		        note  Gs5
		        note  E5
		        note  D5
		        note  Fs5
		        noteL Cs6,4
		        noteL C6,20
		  inst 26
		  vol 0Bh
		        noteL D6,24
		        note  Ds6
		mainLoopEnd
Music_4_Channel_3:
		  stereo 0C0h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL B4,24
		        note  C5
		mainLoopStart
		  inst 27
		  vol 09h
		  setRelease 07h
		        noteL Gs4,16
		        note  Gs4
		        note  Gs4
		  setRelease 01h
		        noteL Gs4,48
		countedLoopStart 1
		        waitL 6
		  stereo 080h
		  shifting 020h
		  inst 20
		  vol 09h
		        noteL Cs5,108
		  vol 06h
		        noteL Cs5,6
		  vol 04h
		        note  Cs5
		  vol 09h
		        noteL Cs5,18
		        noteL Gs4,12
		        noteL E5,18
		        noteL As4,30
		        noteL B4,108
		  vol 06h
		        noteL B4,6
		  vol 09h
		        noteL B4,18
		        noteL F4,12
		        noteL Fs4,18
		        note  A4
		        noteL As4,12
		        noteL Ds5,96
		        noteL B4,48
		        note  G4
		  vol 06h
		        noteL G4,6
		  vol 04h
		        note  G4
		  stereo 0C0h
		  shifting 00h
		  inst 27
		  vol 0Ah
		        noteL Fs4,24
		        noteL A4,48
		  setRelease 06h
		        noteL Gs4,16
		        note  Gs4
		        note  Gs4
		  setRelease 01h
		        noteL A4,48
		countedLoopEnd
		  inst 26
		  vol 0Bh
		        noteL E6,12
		  shifting 020h
		  stereo 040h
		  inst 26
		  vol 0Ah
		        noteL Gs7,6
		        note  G7
		        note  Fs7
		        note  D7
		        note  Cs7
		        note  As6
		        note  A6
		        note  Fs6
		        note  Ds6
		        note  D6
		        note  Cs6
		        note  A5
		        note  Gs5
		        note  F5
		        note  E5
		        note  Cs5
		  setRelease 00h
		countedLoopStart 11
		        noteL As4,4
		        note  B4
		countedLoopEnd
		  sustain
		  setRelease 01h
		        noteL As4,16
		  vol 06h
		        note  As4
		  setRelease 01h
		  vol 04h
		        note  As4
		        waitL 180
		  stereo 0C0h
		  shifting 00h
		  inst 1
		  vol 0Ah
		  sustain
		countedLoopStart 31
		        noteL E5,3
		  setSlide 020h
		        note  Ds5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL E5,3
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        noteL Gs4,6
		repeatSection1Start
		  vol 08h
		        noteL Gs4,6
		  vol 05h
		  setRelease 01h
		        note  Gs4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Gs4,6
		  setRelease 01h
		  vol 03h
		        note  Gs4
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL Gs4,6
		  setRelease 01h
		  vol 02h
		        note  Gs4
		  vol 05h
		repeatStart
		  sustain
		        noteL E5,3
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        noteL Gs4,6
		repeatSection1Start
		  vol 03h
		        noteL Gs4,6
		  vol 01h
		  setRelease 01h
		        note  Gs4
		  vol 04h
		repeatEnd
		repeatSection2Start
		  vol 02h
		        noteL Gs4,6
		  setRelease 01h
		  vol 00h
		        note  Gs4
		        wait
		  vol 0Ah
		  sustain
		countedLoopStart 27
		        noteL F5,3
		  setSlide 020h
		        note  Fs5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL F5,3
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        noteL A4,6
		repeatSection1Start
		  vol 08h
		        noteL A4,6
		  vol 05h
		  setRelease 01h
		        note  A4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL A4,6
		  vol 03h
		  setRelease 01h
		        note  A4
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL A4,6
		  vol 02h
		  setRelease 01h
		        note  A4
		  vol 05h
		repeatStart
		  sustain
		        noteL F5,3
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		repeatSection1Start
		        noteL As4,3
		  vol 03h
		        noteL A4,6
		  vol 01h
		        note  A4
		  setRelease 01h
		        note  A4
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL As4,3
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL G5,3
		  setSlide 020h
		        note  Fs5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL G5,3
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        noteL B4,6
		repeatSection1Start
		  vol 08h
		        noteL B4,6
		  vol 05h
		  setRelease 01h
		        note  B4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL B4,6
		  setRelease 01h
		  vol 03h
		        note  B4
		  vol 06h
		  sustain
		        noteL G5,3
		        note  Fs5
		        note  F5
		  setRelease 01h
		        note  E5
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL G5,3
		  setSlide 020h
		        note  A5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL G5,3
		        note  Fs5
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        noteL B4,6
		repeatSection1Start
		  vol 08h
		        noteL B4,6
		  vol 05h
		  setRelease 01h
		        note  B4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL B4,6
		  vol 03h
		  setRelease 01h
		        note  B4
		  vol 06h
		  sustain
		        noteL G5,3
		        note  Fs5
		        note  F5
		  setRelease 01h
		        note  E5
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL D5,3
		  setSlide 020h
		        note  Cs5
		countedLoopEnd
		countedLoopStart 15
		        noteL Ds5,3
		        note  F5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL Ds5,3
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        noteL G4,6
		repeatSection1Start
		  vol 08h
		        noteL G4,6
		  vol 05h
		  setRelease 01h
		        note  G4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL G4,6
		  setRelease 01h
		  vol 03h
		        note  G4
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL G4,6
		  setRelease 01h
		  vol 02h
		        note  G4
		  vol 05h
		repeatStart
		  sustain
		        noteL Ds5,3
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		repeatSection1Start
		        noteL Gs4,3
		        noteL G4,6
		  vol 03h
		        note  G4
		  vol 01h
		  setRelease 01h
		        note  G4
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Gs4,3
		        waitL 54
		  stereo 080h
		  shifting 020h
		  inst 7
		  vol 09h
		        noteL D6,6
		        noteL Ds6,84
		  stereo 0C0h
		  shifting 00h
		  inst 9
		  vol 0Bh
		        noteL A4,4
		        note  Cs5
		        note  G5
		        note  As5
		        note  Ds6
		        note  Fs6
		        noteL C7,16
		        noteL G6,4
		        note  E6
		        note  Cs6
		        note  A5
		        note  F5
		        note  Ds5
		  vol 09h
		        note  Ds5
		  vol 07h
		        note  Ds5
		  vol 0Bh
		        noteL As5,16
		        noteL C6,4
		        note  As5
		        note  C6
		        note  As5
		        note  C6
		        note  Ds6
		        note  D6
		        note  A5
		        noteL As5,6
		        note  C6
		        noteL B5,12
		  vol 09h
		        noteL B5,6
		  stereo 080h
		  shifting 020h
		  inst 44
		  vol 0Bh
		        noteL D6,4
		        note  Ds6
		        noteL Cs6,20
		        noteL Gs6,4
		        note  B6
		        noteL G6,12
		  setRelease 03h
		  shifting 00h
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		        note  E5
		        noteL E5,6
		        noteL E5,12
		        noteL E5,6
		        note  E5
		        wait
		  setRelease 01h
		  stereo 080h
		  shifting 020h
		  inst 9
		  vol 0Ah
		        noteL Cs5,4
		        note  F5
		        note  As5
		        note  F6
		        note  D6
		  vol 08h
		        note  D6
		  vol 0Ah
		        noteL A6,18
		        noteL E6,6
		  setRelease 03h
		  shifting 00h
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		        noteL G5,12
		        noteL G5,6
		        noteL G5,12
		        noteL G5,6
		        note  G5
		  setRelease 01h
		  inst 26
		  vol 0Bh
		        noteL G5,24
		        note  Gs5
		        note  B5
		        note  C6
		mainLoopEnd
Music_4_Channel_4:
		        waitL 6
		  shifting 020h
		  stereo 080h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        note  G6
		        note  B5
		        note  D6
		        note  G6
		        note  Gs6
		        note  C6
		        note  Fs6
		        note  Gs6
		mainLoopStart
		  setRelease 00h
		        noteL Cs7,4
		        note  Ds7
		        note  Cs7
		        note  Ds7
		        note  Cs7
		        note  Ds7
		  setRelease 01h
		        noteL Cs7,24
		        noteL Ds6,6
		        note  G5
		        note  Gs5
		        note  E6
		        note  C6
		        note  Cs6
		        note  Gs6
		  vol 09h
		        note  Gs6
		countedLoopStart 1
		  stereo 040h
		  inst 13
		  vol 0Bh
		        noteL C6,30
		  vol 09h
		        noteL C6,6
		  vol 0Bh
		        note  C6
		        note  C6
		        noteL C6,18
		        note  Gs5
		        noteL E6,108
		  vol 09h
		        noteL E6,6
		  vol 07h
		        note  E6
		        waitL 12
		  vol 0Bh
		        noteL Cs6,24
		        noteL D6,18
		        note  G6
		        noteL Ds6,96
		  vol 09h
		        noteL Ds6,6
		  vol 07h
		        note  Ds6
		  vol 0Bh
		        noteL D6,30
		  vol 09h
		        noteL D6,6
		  vol 0Bh
		        note  D6
		        note  D6
		        noteL D6,18
		        noteL As5,6
		  vol 09h
		        note  As5
		  vol 07h
		        note  As5
		  vol 0Bh
		        noteL Fs6,48
		        noteL F6,6
		        note  E6
		        noteL Ds6,12
		        noteL B5,6
		  vol 09h
		        note  B5
		  vol 07h
		        note  B5
		        wait
		  vol 0Bh
		        noteL Cs6,36
		  stereo 080h
		  inst 27
		  vol 09h
		        noteL Gs4,24
		        noteL F5,48
		  setRelease 06h
		        noteL Fs5,16
		        note  Fs5
		        note  Fs5
		  setRelease 01h
		        noteL F5,48
		countedLoopEnd
		  shifting 010h
		  inst 26
		  vol 0Bh
		        noteL Gs7,6
		        note  G7
		        note  Fs7
		        note  D7
		        note  Cs7
		        note  As6
		        note  A6
		        note  Fs6
		        note  Ds6
		        note  D6
		        note  Cs6
		        note  A5
		        note  Gs5
		        note  F5
		        note  E5
		        note  Cs5
		  setRelease 00h
		countedLoopStart 11
		        noteL As4,4
		        note  B4
		countedLoopEnd
		  sustain
		  setRelease 01h
		        noteL As4,16
		  vol 07h
		        note  As4
		  setRelease 01h
		  vol 05h
		        note  As4
		        waitL 204
		  stereo 040h
		  shifting 020h
		  inst 1
		  vol 0Bh
		        noteL C6,192
		repeatStart
		  sustain
		        noteL C6,3
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        noteL E5,6
		repeatSection1Start
		  vol 09h
		        noteL E5,6
		  vol 06h
		  setRelease 01h
		        note  E5
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL E5,6
		  setRelease 01h
		  vol 04h
		        note  E5
		  vol 07h
		repeatEnd
		repeatSection3Start
		  vol 05h
		        noteL E5,6
		  setRelease 01h
		  vol 03h
		        note  E5
		  vol 06h
		repeatStart
		  sustain
		        noteL C6,3
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        note  F5
		        noteL E5,6
		repeatSection1Start
		  vol 04h
		        noteL E5,6
		  vol 02h
		  setRelease 01h
		        note  E5
		  vol 05h
		repeatEnd
		repeatSection2Start
		  vol 03h
		        noteL E5,6
		  setRelease 01h
		  vol 01h
		        note  E5
		        wait
		  vol 0Bh
		        noteL Ds6,168
		repeatStart
		  sustain
		        noteL Ds6,3
		        note  D6
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        noteL G5,6
		repeatSection1Start
		  vol 09h
		        noteL G5,6
		  vol 06h
		  setRelease 01h
		        note  G5
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL G5,6
		  vol 04h
		  setRelease 01h
		        note  G5
		  vol 07h
		repeatEnd
		repeatSection3Start
		  vol 05h
		        noteL G5,6
		  vol 03h
		  setRelease 01h
		        note  G5
		  vol 06h
		repeatStart
		  sustain
		        noteL Ds6,3
		        note  D6
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		repeatSection1Start
		        noteL Gs5,3
		  vol 04h
		        noteL G5,6
		  vol 02h
		        note  G5
		  setRelease 01h
		        note  G5
		  vol 05h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Gs5,3
		  vol 0Bh
		        noteL D6,96
		repeatStart
		  sustain
		        noteL D6,3
		        note  Cs6
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        noteL Fs5,6
		repeatSection1Start
		  vol 09h
		        noteL Fs5,6
		  vol 06h
		  setRelease 01h
		        note  Fs5
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL Fs5,6
		  setRelease 01h
		  vol 04h
		        note  Fs5
		  vol 07h
		  sustain
		        noteL D6,3
		        note  Cs6
		        note  C6
		  setRelease 01h
		        note  B5
		  vol 0Bh
		        noteL Fs6,96
		repeatStart
		  sustain
		        noteL Fs6,3
		        note  F6
		        note  E6
		        note  Ds6
		        note  D6
		        note  Cs6
		        note  C6
		        note  B5
		        noteL As5,6
		repeatSection1Start
		  vol 09h
		        noteL As5,6
		  vol 06h
		  setRelease 01h
		        note  As5
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL As5,6
		  vol 04h
		  setRelease 01h
		        note  As5
		  vol 07h
		  sustain
		        noteL Fs6,3
		        note  F6
		        note  E6
		  setRelease 01h
		        note  Ds6
		  vol 0Bh
		        noteL Cs6,56
		  vol 08h
		        noteL Cs6,8
		  vol 0Bh
		        note  Cs6
		  vol 08h
		        note  Cs6
		  vol 0Bh
		        note  Cs6
		  vol 08h
		        note  Cs6
		  vol 0Bh
		        noteL Cs6,96
		repeatStart
		  sustain
		        noteL Cs6,3
		        note  C6
		        note  B5
		        note  As5
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        noteL F5,6
		repeatSection1Start
		  vol 09h
		        noteL F5,6
		  vol 06h
		  setRelease 01h
		        note  F5
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL F5,6
		  setRelease 01h
		  vol 04h
		        note  F5
		  vol 07h
		repeatEnd
		repeatSection3Start
		  vol 05h
		        noteL F5,6
		  setRelease 01h
		  vol 03h
		        note  F5
		  vol 06h
		repeatStart
		  sustain
		        noteL Cs6,3
		        note  C6
		        note  B5
		repeatSection1Start
		        noteL As5,3
		        note  A5
		        note  Gs5
		        note  G5
		        note  Fs5
		        noteL F5,6
		  vol 04h
		        note  F5
		  vol 02h
		  setRelease 01h
		        note  F5
		  vol 05h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL As5,3
		  inst 44
		  vol 0Bh
		        noteL Fs6,4
		        note  A6
		        noteL Gs6,76
		        noteL D7,16
		        noteL As6,4
		        note  Gs6
		        note  F6
		        note  B5
		        note  D6
		        note  Fs6
		        note  G6
		        noteL E6,88
		        noteL G6,6
		        noteL Gs6,66
		repeatStart
		  stereo 080h
		  inst 26
		  vol 0Bh
		        noteL G5,6
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		  vol 09h
		        note  Gs5
		  setRelease 03h
		  inst 13
		  vol 0Ah
		repeatSection1Start
		        noteL Ds6,12
		        noteL Ds6,6
		        noteL Ds6,12
		        noteL Ds6,6
		        note  Ds6
		  setRelease 01h
		repeatEnd
		repeatSection2Start
		        noteL Fs6,12
		        noteL Fs6,6
		        noteL Fs6,12
		        noteL Fs6,6
		        note  Fs6
		  setRelease 01h
		  inst 26
		  vol 0Bh
		        note  G6
		        note  B5
		        note  D6
		        note  G6
		        note  Gs6
		        note  C6
		        note  Fs6
		        note  Gs6
		        note  B6
		        note  D6
		        note  G6
		        note  B6
		        note  C7
		        note  Fs6
		        note  Gs6
		        note  C7
		mainLoopEnd
Music_4_Channel_5:
		  stereo 0C0h
		mainLoopStart
		        sampleL 4,4
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
		        sampleL 5,36
		        sampleL 2,4
		        sample  3
		        sample  3
		        sampleL 2,18
		        sample  2
		        sampleL 2,12
		repeatStart
		countedLoopStart 1
		        sampleL 0,72
		        sampleL 4,4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,12
		        sampleL 3,6
		        sample  3
		        sampleL 2,12
		        sampleL 3,6
		        sample  3
		        sample  2
		        sample  4
		        sample  3
		        sample  2
		        sample  4
		        sample  2
		        sample  4
		        sample  2
		countedLoopEnd
		countedLoopStart 1
		        sampleL 5,12
		        sampleL 2,24
		        sampleL 3,4
		        sample  3
		        sample  3
		        sampleL 5,12
		        sampleL 3,4
		        sample  4
		        sample  4
		        sampleL 3,6
		        sampleL 2,12
		        sampleL 3,6
		countedLoopEnd
		countedLoopStart 1
		        sampleL 3,12
		        sampleL 3,6
		        sample  3
		        sampleL 5,12
		        sampleL 3,6
		        sample  3
		        sample  2
		        sample  4
		        sample  3
		        sample  3
		        sample  2
		        sampleL 2,12
		        sampleL 3,6
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		        sampleL 0,216
		        wait
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 31
		        sampleL 4,4
		countedLoopEnd
		countedLoopStart 6
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,4
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,216
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 31
		        sampleL 4,4
		countedLoopEnd
		        sampleL 4,4
		        sample  3
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,192
		repeatStart
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 14
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,4
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,96
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 6
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,16
		        sample  2
		        sample  2
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 14
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,4
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,108
		        sampleL 4,6
		        sample  4
		countedLoopStart 13
		        sampleL 3,12
		        sampleL 4,6
		        sample  4
		countedLoopEnd
		        sampleL 3,6
		        sample  4
		        sample  3
		        sample  3
		countedLoopStart 9
		        sampleL 3,12
		        sampleL 4,6
		        sample  4
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_6:
		  vibrato 04Ch
		mainLoopStart
		  setRelease 00h
		  psgInst 0Ch
		        psgNoteL B2,6
		        psgNote  D3
		        psgNote  B2
		        psgNote  D3
		        psgNote  C3
		        psgNote  Ds3
		        psgNote  C3
		        psgNote  Ds3
		countedLoopStart 3
		        psgNoteL G3,3
		        psgNote  Gs3
		countedLoopEnd
		        psgNoteL G3,6
		        psgNote  E3
		        psgNote  Cs3
		        psgNote  As2
		countedLoopStart 7
		        psgNoteL G2,3
		        psgNote  Gs2
		countedLoopEnd
		  setRelease 01h
		repeatStart
		  psgInst 01Ah
		countedLoopStart 8
		        psgNoteL E2,6
		        psgNote  Gs2
		countedLoopEnd
		  psgInst 0Ch
		        psgNoteL B2,6
		        psgNote  C3
		        psgNote  E3
		        psgNote  Gs3
		        psgNote  B3
		        psgNote  C4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  E4
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  E3
		  psgInst 01Ah
		countedLoopStart 8
		        psgNoteL F2,6
		        psgNote  A2
		countedLoopEnd
		  psgInst 0Ch
		        psgNoteL B2,6
		        psgNote  Ds3
		        psgNote  F3
		        psgNote  A3
		        psgNote  B3
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  A4
		        psgNote  F4
		        psgNote  A4
		        psgNote  Fs4
		        psgNote  As4
		        psgNote  Fs4
		        psgNote  As4
		  psgInst 01Ah
		countedLoopStart 4
		        psgNoteL G2,6
		        psgNote  As2
		countedLoopEnd
		        psgNoteL D3,6
		        psgNote  Fs3
		        psgNote  D3
		        psgNote  As2
		        psgNote  G2
		        psgNote  Fs2
		countedLoopStart 4
		        psgNoteL G2,6
		        psgNote  B2
		countedLoopEnd
		        psgNoteL Cs3,6
		        psgNote  Fs3
		        psgNote  G3
		        psgNote  B3
		        psgNote  Cs4
		        psgNote  Fs4
		  psgInst 0Ch
		countedLoopStart 1
		        psgNoteL Gs4,6
		        psgNote  Fs4
		        psgNote  Gs4
		        psgNote  D4
		        psgNote  Gs4
		        psgNote  Fs4
		        psgNote  Gs4
		        psgNote  D4
		        psgNote  A4
		        psgNote  F4
		        psgNote  A4
		        psgNote  Ds4
		        psgNote  A4
		        psgNote  F4
		        psgNote  A4
		        psgNote  Ds4
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  psgInst 00h
		        waitL 144
		  psgInst 02Ah
		        psgNoteL Gs2,6
		        psgNote  A2
		        psgNote  Cs3
		        psgNote  E3
		        psgNote  F3
		        psgNote  Gs3
		        psgNote  B3
		        psgNote  E4
		countedLoopStart 16
		        psgNoteL G4,6
		        psgNote  Ds4
		        psgNote  B3
		        psgNote  Fs4
		        psgNote  D4
		        psgNote  As3
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  A3
		        psgNote  D4
		        psgNote  As3
		        psgNote  Fs3
		        psgNote  As4
		        psgNote  F4
		        psgNote  B3
		countedLoopEnd
		        psgNoteL G4,6
		        psgNote  Ds4
		        psgNote  B3
		        psgNote  Fs4
		        psgNote  D4
		        psgNote  As3
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  A3
		countedLoopStart 4
		        psgNoteL D4,6
		        psgNote  As3
		        psgNote  Fs3
		        psgNote  E4
		        psgNote  Ds4
		        psgNote  B3
		        psgNote  G3
		        psgNote  F4
		        psgNote  E4
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  Fs4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  A3
		        psgNote  G4
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL B3,6
		        psgNote  D3
		        psgNote  G3
		        psgNote  B3
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  Fs3
		        psgNote  C3
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_7:
		  shifting 020h
		  vibrato 04Ch
		mainLoopStart
		  psgInst 00h
		        waitL 6
		  setRelease 00h
		  psgInst 0Ah
		        psgNote  B2
		        psgNote  D3
		        psgNote  B2
		        psgNote  D3
		        psgNote  C3
		        psgNote  Ds3
		        psgNote  C3
		        psgNote  Ds3
		countedLoopStart 3
		        psgNoteL G3,3
		        psgNote  Gs3
		countedLoopEnd
		        psgNoteL G3,6
		        psgNote  E3
		        psgNote  Cs3
		        psgNote  As2
		countedLoopStart 7
		        psgNoteL G2,3
		        psgNote  Gs2
		countedLoopEnd
		  setRelease 01h
		repeatStart
		  psgInst 018h
		countedLoopStart 8
		        psgNoteL E2,6
		        psgNote  Gs2
		countedLoopEnd
		  psgInst 0Ah
		        psgNoteL B2,6
		        psgNote  C3
		        psgNote  E3
		        psgNote  Gs3
		        psgNote  B3
		        psgNote  C4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  E4
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  E3
		  psgInst 018h
		countedLoopStart 8
		        psgNoteL F2,6
		        psgNote  A2
		countedLoopEnd
		  psgInst 0Ah
		        psgNoteL B2,6
		        psgNote  Ds3
		        psgNote  F3
		        psgNote  A3
		        psgNote  B3
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  A4
		        psgNote  F4
		        psgNote  A4
		        psgNote  Fs4
		        psgNote  As4
		        psgNote  Fs4
		        psgNote  As4
		  psgInst 018h
		countedLoopStart 4
		        psgNoteL G2,6
		        psgNote  As2
		countedLoopEnd
		        psgNoteL D3,6
		        psgNote  Fs3
		        psgNote  D3
		        psgNote  As2
		        psgNote  G2
		        psgNote  Fs2
		countedLoopStart 4
		        psgNoteL G2,6
		        psgNote  B2
		countedLoopEnd
		        psgNoteL Cs3,6
		        psgNote  Fs3
		        psgNote  G3
		        psgNote  B3
		        psgNote  Cs4
		        psgNote  Fs4
		  psgInst 0Ah
		countedLoopStart 1
		        psgNoteL Gs4,6
		        psgNote  Fs4
		        psgNote  Gs4
		        psgNote  D4
		        psgNote  Gs4
		        psgNote  Fs4
		        psgNote  Gs4
		        psgNote  D4
		        psgNote  A4
		        psgNote  F4
		        psgNote  A4
		        psgNote  Ds4
		        psgNote  A4
		        psgNote  F4
		        psgNote  A4
		        psgNote  Ds4
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  psgInst 00h
		        waitL 138
		  shifting 00h
		  psgInst 02Ah
		        psgNoteL As1,6
		        psgNote  D2
		        psgNote  F2
		        psgNote  Gs2
		        psgNote  As2
		        psgNote  D3
		        psgNote  F3
		        psgNote  Gs3
		countedLoopStart 23
		        psgNoteL Gs3,6
		        psgNote  G3
		        psgNote  E4
		        psgNote  A4
		        psgNote  F3
		        psgNote  Gs3
		        psgNote  G3
		        psgNote  C4
		        psgNote  Gs4
		        psgNote  B4
		        psgNote  Cs5
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL Gs3,6
		        psgNote  B3
		        psgNote  E4
		        psgNote  F4
		        psgNote  A3
		        psgNote  C4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  As3
		        psgNote  Cs4
		        psgNote  Fs4
		        psgNote  G4
		        psgNote  B3
		        psgNote  D4
		        psgNote  G4
		        psgNote  Gs4
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL G2,6
		        psgNote  B2
		        psgNote  D2
		        psgNote  G2
		        psgNote  Gs2
		        psgNote  C3
		        psgNote  Ds2
		        psgNote  Fs2
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_9:
		channel_end
