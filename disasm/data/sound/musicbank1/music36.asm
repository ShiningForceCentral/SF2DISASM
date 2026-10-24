
; ASM FILE music36.asm :
; 0xA011..0xAFFC : Music 36
Music_36:       db 0
		db 0
		db 0
		db 0CDh
		dw Music_36_Channel_0
		dw Music_36_Channel_1
		dw Music_36_Channel_2
		dw Music_36_Channel_3
		dw Music_36_Channel_4
		dw Music_36_Channel_5
		dw Music_36_Channel_6
		dw Music_36_Channel_7
		dw Music_36_Channel_9
		dw Music_36_Channel_9
Music_36_Channel_0:
		  stereo 0C0h
		  inst 21
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL Gs1,0
		  setSlide 017h
		        noteL Gs2,48
		  noSlide
		mainLoopStart
		        noteL Cs3,24
		        note  C3
		        note  Gs2
		        note  E2
		repeatStart
		        noteL Cs2,84
		  sustain
		        noteL Gs3,4
		        note  As3
		  setRelease 01h
		        note  C4
		        noteL Cs4,6
		  vol 09h
		        note  Cs4
		  vol 0Ch
		        note  Cs4
		        note  Cs4
		        noteL Gs3,12
		        noteL E3,6
		        note  Ds3
		        note  E3
		        note  Cs3
		        note  Gs2
		        note  G2
		        note  Gs2
		        note  E2
		        note  Cs2
		        note  C2
		        noteL B1,84
		  sustain
		        noteL Gs3,4
		        note  A3
		  setRelease 01h
		        note  As3
		        noteL B3,6
		  vol 09h
		        note  B3
		  vol 0Ch
		        note  B3
		        note  B3
		        noteL A3,12
		        noteL F3,6
		        note  Ds3
		        note  F3
		        note  Ds3
		        note  B2
		        note  A2
		        note  B2
		        note  A2
		        note  F2
		        note  Cs2
		        noteL Ds2,36
		  sustain
		        noteL As2,4
		        note  C3
		  setRelease 01h
		        note  D3
		        noteL Ds3,24
		        noteL As2,6
		        note  Fs2
		  vol 09h
		        note  Fs2
		  vol 06h
		        note  Fs2
		  vol 0Ch
		        noteL A1,36
		  sustain
		        noteL F3,4
		        note  Fs3
		  setRelease 01h
		        note  G3
		        noteL A3,24
		        noteL Ds3,6
		        note  B2
		  vol 09h
		        note  B2
		  vol 06h
		        note  B2
		countedLoopStart 1
		  vol 0Ch
		  setRelease 03h
		        noteL D2,12
		        noteL D3,6
		        note  D3
		        note  D3
		  vol 07h
		        note  D3
		  vol 0Ch
		        note  D3
		        note  D3
		        noteL G1,12
		        noteL G2,6
		        note  G2
		        note  G2
		  vol 07h
		        note  G2
		  vol 0Ch
		        note  G2
		        note  G2
		countedLoopEnd
		  setRelease 01h
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL D2,12
		        waitL 210
		        wait
		  inst 12
		  vol 0Dh
		        noteL B1,0
		  setSlide 05h
		        noteL Cs2,192
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL Cs3,3
		        note  C3
		        note  B2
		        note  As2
		        note  A2
		        note  Gs2
		        note  G2
		        note  Fs2
		  setRelease 01h
		        note  F2
		        waitL 189
		  inst 12
		  vol 0Dh
		        noteL A1,0
		  setSlide 05h
		        noteL B1,168
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL B2,3
		        note  As2
		        note  A2
		        note  Gs2
		        note  G2
		        note  Fs2
		        note  F2
		        note  E2
		  setRelease 01h
		        note  Ds2
		        waitL 165
		  inst 12
		  vol 0Dh
		        noteL Cs2,0
		  setSlide 05h
		        noteL Ds2,96
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL Ds3,3
		        note  D3
		        note  Cs3
		        note  C3
		        note  B2
		        note  As2
		        note  A2
		        note  Gs2
		  setRelease 01h
		        note  G2
		        waitL 69
		  inst 12
		  vol 0Dh
		        noteL G1,0
		  setSlide 05h
		        noteL A1,96
		  noSlide
		  inst 21
		  vol 0Ch
		  sustain
		        noteL A2,3
		        note  Gs2
		        note  G2
		        note  Fs2
		        note  F2
		        note  E2
		        note  Ds2
		        note  D2
		  setRelease 01h
		        note  Cs2
		        waitL 69
		  inst 12
		  vol 0Dh
		        noteL C2,0
		  setSlide 05h
		        noteL D2,96
		  noSlide
		        noteL F2,0
		  setSlide 05h
		        noteL G2,96
		  noSlide
		  inst 21
		  vol 0Ch
		  setRelease 09h
		countedLoopStart 6
		        noteL Gs3,12
		        note  G3
		        note  Ds3
		        note  C3
		        note  B2
		        note  C3
		        note  Ds3
		        note  Fs3
		countedLoopEnd
		        noteL Gs3,12
		        note  G3
		        note  Ds3
		        note  Fs3
		        note  Gs3
		        note  Ds3
		  setRelease 01h
		        noteL Gs2,24
		mainLoopEnd
Music_36_Channel_1:
		  stereo 0C0h
		  inst 26
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL G5,6
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		mainLoopStart
		  setRelease 00h
		        noteL Cs6,4
		        note  Ds6
		        note  Cs6
		        note  Ds6
		        note  Cs6
		        note  Ds6
		  setRelease 01h
		        noteL Cs6,24
		        noteL Ds5,6
		        note  G4
		        note  Gs4
		        note  E5
		        note  C5
		        note  Cs5
		        note  Gs5
		  vol 0Ah
		        note  Gs5
		countedLoopStart 1
		  inst 13
		  vol 0Ch
		        noteL C5,30
		  vol 0Ah
		        noteL C5,6
		  vol 0Ch
		        note  C5
		        note  C5
		        noteL C5,18
		        note  Gs4
		        noteL E5,108
		  vol 0Ah
		        noteL E5,6
		  vol 08h
		        note  E5
		        waitL 12
		  vol 0Ch
		        noteL Cs5,24
		        noteL D5,18
		        note  G5
		        noteL Ds5,96
		  vol 0Ah
		        noteL Ds5,6
		  vol 08h
		        note  Ds5
		  vol 0Ch
		        noteL D5,30
		  vol 0Ah
		        noteL D5,6
		  vol 0Ch
		        note  D5
		        note  D5
		        noteL D5,18
		        noteL As4,6
		  vol 0Ah
		        note  As4
		  vol 08h
		        note  As4
		  vol 0Ch
		        noteL Fs5,48
		        noteL F5,6
		        note  E5
		        noteL Ds5,12
		        noteL B4,6
		  vol 0Ah
		        note  B4
		  vol 08h
		        note  B4
		        wait
		  vol 0Ch
		        noteL Cs5,204
		countedLoopEnd
		  inst 26
		  vol 0Ch
		        noteL Gs6,6
		        note  G6
		        note  Fs6
		        note  D6
		        note  Cs6
		        note  As5
		        note  A5
		        note  Fs5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  A4
		        note  Gs4
		        note  F4
		        note  E4
		        note  Cs4
		  setRelease 00h
		countedLoopStart 11
		        noteL As3,4
		        note  B3
		countedLoopEnd
		  sustain
		  setRelease 01h
		        noteL As3,16
		  vol 08h
		        note  As3
		  setRelease 01h
		  vol 06h
		        note  As3
		        waitL 192
		  inst 1
		  vol 0Ch
		        note  C5
		repeatStart
		  sustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  vol 0Ah
		        noteL E4,6
		  vol 07h
		  setRelease 01h
		        note  E4
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL E4,6
		  setRelease 01h
		  vol 05h
		        note  E4
		  vol 08h
		repeatEnd
		repeatSection3Start
		  vol 06h
		        noteL E4,6
		  setRelease 01h
		  vol 04h
		        note  E4
		  vol 07h
		repeatStart
		  sustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  vol 05h
		        noteL E4,6
		  vol 03h
		  setRelease 01h
		        note  E4
		  vol 06h
		repeatEnd
		repeatSection2Start
		  vol 04h
		        noteL E4,6
		  setRelease 01h
		  vol 02h
		        note  E4
		        wait
		  vol 0Ch
		        noteL Ds5,168
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
		  vol 0Ah
		        noteL G4,6
		  vol 07h
		  setRelease 01h
		        note  G4
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL G4,6
		  vol 05h
		  setRelease 01h
		        note  G4
		  vol 08h
		repeatEnd
		repeatSection3Start
		  vol 06h
		        noteL G4,6
		  vol 04h
		  setRelease 01h
		        note  G4
		  vol 07h
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
		  vol 05h
		        noteL G4,6
		  vol 03h
		        note  G4
		  setRelease 01h
		        note  G4
		  vol 06h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Gs4,3
		  vol 0Ch
		        noteL D5,96
		repeatStart
		  sustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        noteL Fs4,6
		repeatSection1Start
		  vol 0Ah
		        noteL Fs4,6
		  vol 07h
		  setRelease 01h
		        note  Fs4
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL Fs4,6
		  setRelease 01h
		  vol 05h
		        note  Fs4
		  vol 08h
		  sustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		  setRelease 01h
		        note  B4
		  vol 0Ch
		        noteL Fs5,96
		repeatStart
		  sustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        noteL As4,6
		repeatSection1Start
		  vol 0Ah
		        noteL As4,6
		  vol 07h
		  setRelease 01h
		        note  As4
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL As4,6
		  vol 05h
		  setRelease 01h
		        note  As4
		  vol 08h
		  sustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		  setRelease 01h
		        note  Ds5
		  vol 0Ch
		        noteL Cs5,56
		  vol 09h
		        noteL Cs5,8
		  vol 0Ch
		        note  Cs5
		  vol 09h
		        note  Cs5
		  vol 0Ch
		        note  Cs5
		  vol 09h
		        note  Cs5
		  vol 0Ch
		        noteL Cs5,96
		repeatStart
		  sustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        noteL F4,6
		repeatSection1Start
		  vol 0Ah
		        noteL F4,6
		  vol 07h
		  setRelease 01h
		        note  F4
		  vol 0Ah
		repeatEnd
		repeatSection2Start
		  vol 07h
		        noteL F4,6
		  setRelease 01h
		  vol 05h
		        note  F4
		  vol 08h
		repeatEnd
		repeatSection3Start
		  vol 06h
		        noteL F4,6
		  setRelease 01h
		  vol 04h
		        note  F4
		  vol 07h
		repeatStart
		  sustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		repeatSection1Start
		        noteL Fs4,3
		        noteL F4,6
		  vol 05h
		        note  F4
		  vol 03h
		  setRelease 01h
		        note  F4
		  vol 06h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Fs4,3
		  inst 44
		  vol 0Ch
		        noteL Fs5,4
		        note  A5
		        noteL Gs5,76
		        noteL D6,16
		        noteL As5,4
		        note  Gs5
		        note  F5
		        note  B4
		        note  D5
		        note  Fs5
		        note  G5
		        noteL E5,88
		        noteL G5,6
		        noteL Gs5,66
		repeatStart
		  inst 26
		  vol 0Ch
		        noteL G4,6
		        note  B3
		        note  D4
		        note  G4
		        note  Gs4
		        note  C4
		        note  Fs4
		        note  Gs4
		  vol 0Ah
		        note  Gs4
		  setRelease 03h
		  inst 13
		  vol 0Bh
		repeatSection1Start
		        noteL Ds5,12
		        noteL Ds5,6
		        noteL Ds5,12
		        noteL Ds5,6
		        note  Ds5
		  setRelease 01h
		repeatEnd
		repeatSection2Start
		        noteL Fs5,12
		        noteL Fs5,6
		        noteL Fs5,12
		        noteL Fs5,6
		        note  Fs5
		  setRelease 01h
		  inst 26
		  vol 0Ch
		        note  G5
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		        note  B5
		        note  D5
		        note  G5
		        note  B5
		        note  C6
		        note  Fs5
		        note  Gs5
		        note  C6
		mainLoopEnd
Music_36_Channel_2:
		  stereo 0C0h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL G4,24
		        note  Gs4
		mainLoopStart
		  inst 27
		  vol 09h
		  setRelease 07h
		        noteL E4,16
		        note  E4
		        note  E4
		  setRelease 01h
		        noteL E4,48
		countedLoopStart 1
		  inst 20
		  vol 0Ah
		        noteL Cs4,102
		  vol 07h
		        noteL Cs4,6
		  vol 05h
		        note  Cs4
		  vol 0Ah
		        noteL Cs4,18
		        noteL Gs3,12
		        noteL E4,18
		        noteL As3,30
		        noteL B3,108
		  vol 07h
		        noteL B3,6
		  vol 0Ah
		        noteL B3,18
		        noteL F3,12
		        noteL Fs3,18
		        note  A3
		        noteL As3,12
		        noteL Ds4,96
		        noteL B3,48
		        note  G3
		  vol 07h
		        noteL G3,6
		  vol 05h
		        note  G3
		        waitL 12
		  inst 27
		  vol 0Ah
		        noteL Gs3,24
		        noteL F4,48
		  setRelease 06h
		        noteL Fs4,16
		        note  Fs4
		        note  Fs4
		  setRelease 01h
		        noteL F4,48
		countedLoopEnd
		  inst 26
		  vol 0Bh
		        noteL Cs6,12
		  vol 09h
		        noteL Cs6,6
		  vol 07h
		        note  Cs6
		        waitL 204
		        wait
		  inst 1
		  vol 0Ah
		  sustain
		countedLoopStart 31
		        noteL Gs4,3
		  setSlide 020h
		        note  A4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL Gs4,3
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        noteL C4,6
		repeatSection1Start
		  vol 08h
		        noteL C4,6
		  vol 05h
		  setRelease 01h
		        note  C4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL C4,6
		  setRelease 01h
		  vol 03h
		        note  C4
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL C4,6
		  setRelease 01h
		  vol 02h
		        note  C4
		  vol 05h
		repeatStart
		  sustain
		        noteL Gs4,3
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        noteL C4,6
		repeatSection1Start
		  vol 03h
		        noteL C4,6
		  vol 01h
		  setRelease 01h
		        note  C4
		  vol 04h
		repeatEnd
		repeatSection2Start
		  vol 02h
		        noteL C4,6
		  setRelease 01h
		  vol 00h
		        note  C4
		        wait
		  vol 0Ah
		  sustain
		countedLoopStart 27
		        noteL A4,3
		  setSlide 020h
		        note  As4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        noteL Cs4,6
		repeatSection1Start
		  vol 08h
		        noteL Cs4,6
		  vol 05h
		  setRelease 01h
		        note  Cs4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Cs4,6
		  vol 03h
		  setRelease 01h
		        note  Cs4
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL Cs4,6
		  vol 02h
		  setRelease 01h
		        note  Cs4
		  vol 05h
		repeatStart
		  sustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		repeatSection1Start
		        noteL D4,3
		  vol 03h
		        noteL Cs4,6
		  vol 01h
		        note  Cs4
		  setRelease 01h
		        note  Cs4
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL D4,3
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL As4,3
		  setSlide 020h
		        note  B4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL As4,3
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        noteL D4,6
		repeatSection1Start
		  vol 08h
		        noteL D4,6
		  vol 05h
		  setRelease 01h
		        note  D4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL D4,6
		  setRelease 01h
		  vol 03h
		        note  D4
		  vol 06h
		  sustain
		        noteL As4,3
		        note  A4
		        note  Gs4
		  setRelease 01h
		        note  G4
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL B4,3
		  setSlide 020h
		        note  Cs5
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL B4,3
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        noteL Ds4,6
		repeatSection1Start
		  vol 08h
		        noteL Ds4,6
		  vol 05h
		  setRelease 01h
		        note  Ds4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Ds4,6
		  vol 03h
		  setRelease 01h
		        note  Ds4
		  vol 06h
		  sustain
		        noteL B4,3
		        note  As4
		        note  A4
		  setRelease 01h
		        note  Gs4
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL Fs4,3
		  setSlide 020h
		        note  Gs4
		countedLoopEnd
		countedLoopStart 15
		        noteL A4,3
		        note  G4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        noteL Cs4,6
		repeatSection1Start
		  vol 08h
		        noteL Cs4,6
		  vol 05h
		  setRelease 01h
		        note  Cs4
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Cs4,6
		  setRelease 01h
		  vol 03h
		        note  Cs4
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL Cs4,6
		  setRelease 01h
		  vol 02h
		        note  Cs4
		  vol 05h
		repeatStart
		  sustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		repeatSection1Start
		        noteL D4,3
		        noteL Cs4,6
		  vol 03h
		        note  Cs4
		  vol 01h
		  setRelease 01h
		        note  Cs4
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL D4,3
		        waitL 48
		  inst 7
		  vol 0Ah
		        noteL D5,6
		        noteL Ds5,106
		        noteL D5,16
		        note  A4
		        noteL F4,96
		  inst 44
		  vol 0Ch
		        noteL D5,4
		        note  Ds5
		        noteL Cs5,20
		        noteL Gs5,4
		        note  B5
		        noteL G5,18
		  setRelease 03h
		  inst 13
		  vol 0Ah
		        noteL Cs5,12
		        noteL Cs5,6
		        noteL Cs5,12
		        noteL Cs5,6
		        note  Cs5
		  setRelease 01h
		  inst 9
		  vol 0Bh
		        noteL Cs4,4
		        note  F4
		        note  As4
		        note  F5
		        note  D5
		  vol 09h
		        note  D5
		  vol 0Bh
		        noteL A5,18
		        noteL E5,4
		        note  Ds5
		        note  As4
		  setRelease 03h
		  inst 13
		  vol 0Ah
		        noteL Ds5,12
		        noteL Ds5,6
		        noteL Ds5,12
		        noteL Ds5,6
		        note  Ds5
		  setRelease 01h
		  inst 7
		  vol 0Ah
		        note  Gs4
		        note  E4
		        note  D4
		        note  Fs4
		        noteL Cs5,4
		        noteL C5,20
		  inst 26
		  vol 0Bh
		        noteL D5,24
		        note  Ds5
		mainLoopEnd
Music_36_Channel_3:
		  stereo 0C0h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL B3,24
		        note  C4
		mainLoopStart
		  inst 27
		  vol 09h
		  setRelease 07h
		        noteL Gs3,16
		        note  Gs3
		        note  Gs3
		  setRelease 01h
		        noteL Gs3,48
		countedLoopStart 1
		        waitL 6
		  stereo 080h
		  shifting 020h
		  inst 20
		  vol 09h
		        noteL Cs4,108
		  vol 06h
		        noteL Cs4,6
		  vol 04h
		        note  Cs4
		  vol 09h
		        noteL Cs4,18
		        noteL Gs3,12
		        noteL E4,18
		        noteL As3,30
		        noteL B3,108
		  vol 06h
		        noteL B3,6
		  vol 09h
		        noteL B3,18
		        noteL F3,12
		        noteL Fs3,18
		        note  A3
		        noteL As3,12
		        noteL Ds4,96
		        noteL B3,48
		        note  G3
		  vol 06h
		        noteL G3,6
		  vol 04h
		        note  G3
		  stereo 0C0h
		  shifting 00h
		  inst 27
		  vol 0Ah
		        noteL Fs3,24
		        noteL A3,48
		  setRelease 06h
		        noteL Gs3,16
		        note  Gs3
		        note  Gs3
		  setRelease 01h
		        noteL A3,48
		countedLoopEnd
		  inst 26
		  vol 0Bh
		        noteL E5,12
		  shifting 020h
		  stereo 040h
		  inst 26
		  vol 0Ah
		        noteL Gs6,6
		        note  G6
		        note  Fs6
		        note  D6
		        note  Cs6
		        note  As5
		        note  A5
		        note  Fs5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  A4
		        note  Gs4
		        note  F4
		        note  E4
		        note  Cs4
		  setRelease 00h
		countedLoopStart 11
		        noteL As3,4
		        note  B3
		countedLoopEnd
		  sustain
		  setRelease 01h
		        noteL As3,16
		  vol 06h
		        note  As3
		  setRelease 01h
		  vol 04h
		        note  As3
		        waitL 180
		  stereo 0C0h
		  shifting 00h
		  inst 1
		  vol 0Ah
		  sustain
		countedLoopStart 31
		        noteL E4,3
		  setSlide 020h
		        note  Ds4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL E4,3
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        noteL Gs3,6
		repeatSection1Start
		  vol 08h
		        noteL Gs3,6
		  vol 05h
		  setRelease 01h
		        note  Gs3
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL Gs3,6
		  setRelease 01h
		  vol 03h
		        note  Gs3
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL Gs3,6
		  setRelease 01h
		  vol 02h
		        note  Gs3
		  vol 05h
		repeatStart
		  sustain
		        noteL E4,3
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        noteL Gs3,6
		repeatSection1Start
		  vol 03h
		        noteL Gs3,6
		  vol 01h
		  setRelease 01h
		        note  Gs3
		  vol 04h
		repeatEnd
		repeatSection2Start
		  vol 02h
		        noteL Gs3,6
		  setRelease 01h
		  vol 00h
		        note  Gs3
		        wait
		  vol 0Ah
		  sustain
		countedLoopStart 27
		        noteL F4,3
		  setSlide 020h
		        note  Fs4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL F4,3
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        noteL A3,6
		repeatSection1Start
		  vol 08h
		        noteL A3,6
		  vol 05h
		  setRelease 01h
		        note  A3
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL A3,6
		  vol 03h
		  setRelease 01h
		        note  A3
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL A3,6
		  vol 02h
		  setRelease 01h
		        note  A3
		  vol 05h
		repeatStart
		  sustain
		        noteL F4,3
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		repeatSection1Start
		        noteL As3,3
		  vol 03h
		        noteL A3,6
		  vol 01h
		        note  A3
		  setRelease 01h
		        note  A3
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL As3,3
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL G4,3
		  setSlide 020h
		        note  Fs4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        noteL B3,6
		repeatSection1Start
		  vol 08h
		        noteL B3,6
		  vol 05h
		  setRelease 01h
		        note  B3
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL B3,6
		  setRelease 01h
		  vol 03h
		        note  B3
		  vol 06h
		  sustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		  setRelease 01h
		        note  E4
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL G4,3
		  setSlide 020h
		        note  A4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        noteL B3,6
		repeatSection1Start
		  vol 08h
		        noteL B3,6
		  vol 05h
		  setRelease 01h
		        note  B3
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL B3,6
		  vol 03h
		  setRelease 01h
		        note  B3
		  vol 06h
		  sustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		  setRelease 01h
		        note  E4
		  vol 0Ah
		  sustain
		countedLoopStart 15
		        noteL D4,3
		  setSlide 020h
		        note  Cs4
		countedLoopEnd
		countedLoopStart 15
		        noteL Ds4,3
		        note  F4
		countedLoopEnd
		  noSlide
		repeatStart
		  sustain
		        noteL Ds4,3
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        note  Gs3
		        noteL G3,6
		repeatSection1Start
		  vol 08h
		        noteL G3,6
		  vol 05h
		  setRelease 01h
		        note  G3
		  vol 08h
		repeatEnd
		repeatSection2Start
		  vol 05h
		        noteL G3,6
		  setRelease 01h
		  vol 03h
		        note  G3
		  vol 06h
		repeatEnd
		repeatSection3Start
		  vol 04h
		        noteL G3,6
		  setRelease 01h
		  vol 02h
		        note  G3
		  vol 05h
		repeatStart
		  sustain
		        noteL Ds4,3
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		repeatSection1Start
		        noteL Gs3,3
		        noteL G3,6
		  vol 03h
		        note  G3
		  vol 01h
		  setRelease 01h
		        note  G3
		  vol 04h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Gs3,3
		        waitL 54
		  stereo 080h
		  shifting 020h
		  inst 7
		  vol 09h
		        noteL D5,6
		        noteL Ds5,84
		  stereo 0C0h
		  shifting 00h
		  inst 9
		  vol 0Bh
		        noteL A3,4
		        note  Cs4
		        note  G4
		        note  As4
		        note  Ds5
		        note  Fs5
		        noteL C6,16
		        noteL G5,4
		        note  E5
		        note  Cs5
		        note  A4
		        note  F4
		        note  Ds4
		  vol 09h
		        note  Ds4
		  vol 07h
		        note  Ds4
		  vol 0Bh
		        noteL As4,16
		        noteL C5,4
		        note  As4
		        note  C5
		        note  As4
		        note  C5
		        note  Ds5
		        note  D5
		        note  A4
		        noteL As4,6
		        note  C5
		        noteL B4,12
		  vol 09h
		        noteL B4,6
		  stereo 080h
		  shifting 020h
		  inst 44
		  vol 0Bh
		        noteL D5,4
		        note  Ds5
		        noteL Cs5,20
		        noteL Gs5,4
		        note  B5
		        noteL G5,12
		  setRelease 03h
		  shifting 00h
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		        note  E4
		        noteL E4,6
		        noteL E4,12
		        noteL E4,6
		        note  E4
		        wait
		  setRelease 01h
		  stereo 080h
		  shifting 020h
		  inst 9
		  vol 0Ah
		        noteL Cs4,4
		        note  F4
		        note  As4
		        note  F5
		        note  D5
		  vol 08h
		        note  D5
		  vol 0Ah
		        noteL A5,18
		        noteL E5,6
		  setRelease 03h
		  shifting 00h
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		        noteL G4,12
		        noteL G4,6
		        noteL G4,12
		        noteL G4,6
		        note  G4
		  setRelease 01h
		  inst 26
		  vol 0Bh
		        noteL G4,24
		        note  Gs4
		        note  B4
		        note  C5
		mainLoopEnd
Music_36_Channel_4:
		        waitL 6
		  shifting 020h
		  stereo 080h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        note  G5
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		mainLoopStart
		  setRelease 00h
		        noteL Cs6,4
		        note  Ds6
		        note  Cs6
		        note  Ds6
		        note  Cs6
		        note  Ds6
		  setRelease 01h
		        noteL Cs6,24
		        noteL Ds5,6
		        note  G4
		        note  Gs4
		        note  E5
		        note  C5
		        note  Cs5
		        note  Gs5
		  vol 09h
		        note  Gs5
		countedLoopStart 1
		  stereo 040h
		  inst 13
		  vol 0Bh
		        noteL C5,30
		  vol 09h
		        noteL C5,6
		  vol 0Bh
		        note  C5
		        note  C5
		        noteL C5,18
		        note  Gs4
		        noteL E5,108
		  vol 09h
		        noteL E5,6
		  vol 07h
		        note  E5
		        waitL 12
		  vol 0Bh
		        noteL Cs5,24
		        noteL D5,18
		        note  G5
		        noteL Ds5,96
		  vol 09h
		        noteL Ds5,6
		  vol 07h
		        note  Ds5
		  vol 0Bh
		        noteL D5,30
		  vol 09h
		        noteL D5,6
		  vol 0Bh
		        note  D5
		        note  D5
		        noteL D5,18
		        noteL As4,6
		  vol 09h
		        note  As4
		  vol 07h
		        note  As4
		  vol 0Bh
		        noteL Fs5,48
		        noteL F5,6
		        note  E5
		        noteL Ds5,12
		        noteL B4,6
		  vol 09h
		        note  B4
		  vol 07h
		        note  B4
		        wait
		  vol 0Bh
		        noteL Cs5,36
		  stereo 080h
		  inst 27
		  vol 09h
		        noteL Gs3,24
		        noteL F4,48
		  setRelease 06h
		        noteL Fs4,16
		        note  Fs4
		        note  Fs4
		  setRelease 01h
		        noteL F4,48
		countedLoopEnd
		  shifting 010h
		  inst 26
		  vol 0Bh
		        noteL Gs6,6
		        note  G6
		        note  Fs6
		        note  D6
		        note  Cs6
		        note  As5
		        note  A5
		        note  Fs5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  A4
		        note  Gs4
		        note  F4
		        note  E4
		        note  Cs4
		  setRelease 00h
		countedLoopStart 11
		        noteL As3,4
		        note  B3
		countedLoopEnd
		  sustain
		  setRelease 01h
		        noteL As3,16
		  vol 07h
		        note  As3
		  setRelease 01h
		  vol 05h
		        note  As3
		        waitL 204
		  stereo 040h
		  shifting 020h
		  inst 1
		  vol 0Bh
		        noteL C5,192
		repeatStart
		  sustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  vol 09h
		        noteL E4,6
		  vol 06h
		  setRelease 01h
		        note  E4
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL E4,6
		  setRelease 01h
		  vol 04h
		        note  E4
		  vol 07h
		repeatEnd
		repeatSection3Start
		  vol 05h
		        noteL E4,6
		  setRelease 01h
		  vol 03h
		        note  E4
		  vol 06h
		repeatStart
		  sustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  vol 04h
		        noteL E4,6
		  vol 02h
		  setRelease 01h
		        note  E4
		  vol 05h
		repeatEnd
		repeatSection2Start
		  vol 03h
		        noteL E4,6
		  setRelease 01h
		  vol 01h
		        note  E4
		        wait
		  vol 0Bh
		        noteL Ds5,168
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
		  vol 09h
		        noteL G4,6
		  vol 06h
		  setRelease 01h
		        note  G4
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL G4,6
		  vol 04h
		  setRelease 01h
		        note  G4
		  vol 07h
		repeatEnd
		repeatSection3Start
		  vol 05h
		        noteL G4,6
		  vol 03h
		  setRelease 01h
		        note  G4
		  vol 06h
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
		  vol 04h
		        noteL G4,6
		  vol 02h
		        note  G4
		  setRelease 01h
		        note  G4
		  vol 05h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL Gs4,3
		  vol 0Bh
		        noteL D5,96
		repeatStart
		  sustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        noteL Fs4,6
		repeatSection1Start
		  vol 09h
		        noteL Fs4,6
		  vol 06h
		  setRelease 01h
		        note  Fs4
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL Fs4,6
		  setRelease 01h
		  vol 04h
		        note  Fs4
		  vol 07h
		  sustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		  setRelease 01h
		        note  B4
		  vol 0Bh
		        noteL Fs5,96
		repeatStart
		  sustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        noteL As4,6
		repeatSection1Start
		  vol 09h
		        noteL As4,6
		  vol 06h
		  setRelease 01h
		        note  As4
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL As4,6
		  vol 04h
		  setRelease 01h
		        note  As4
		  vol 07h
		  sustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		  setRelease 01h
		        note  Ds5
		  vol 0Bh
		        noteL Cs5,56
		  vol 08h
		        noteL Cs5,8
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        note  Cs5
		  vol 08h
		        note  Cs5
		  vol 0Bh
		        noteL Cs5,96
		repeatStart
		  sustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        noteL F4,6
		repeatSection1Start
		  vol 09h
		        noteL F4,6
		  vol 06h
		  setRelease 01h
		        note  F4
		  vol 09h
		repeatEnd
		repeatSection2Start
		  vol 06h
		        noteL F4,6
		  setRelease 01h
		  vol 04h
		        note  F4
		  vol 07h
		repeatEnd
		repeatSection3Start
		  vol 05h
		        noteL F4,6
		  setRelease 01h
		  vol 03h
		        note  F4
		  vol 06h
		repeatStart
		  sustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		repeatSection1Start
		        noteL As4,3
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        noteL F4,6
		  vol 04h
		        note  F4
		  vol 02h
		  setRelease 01h
		        note  F4
		  vol 05h
		repeatEnd
		repeatSection2Start
		  setRelease 01h
		        noteL As4,3
		  inst 44
		  vol 0Bh
		        noteL Fs5,4
		        note  A5
		        noteL Gs5,76
		        noteL D6,16
		        noteL As5,4
		        note  Gs5
		        note  F5
		        note  B4
		        note  D5
		        note  Fs5
		        note  G5
		        noteL E5,88
		        noteL G5,6
		        noteL Gs5,66
		repeatStart
		  stereo 080h
		  inst 26
		  vol 0Bh
		        noteL G4,6
		        note  B3
		        note  D4
		        note  G4
		        note  Gs4
		        note  C4
		        note  Fs4
		        note  Gs4
		  vol 09h
		        note  Gs4
		  setRelease 03h
		  inst 13
		  vol 0Ah
		repeatSection1Start
		        noteL Ds5,12
		        noteL Ds5,6
		        noteL Ds5,12
		        noteL Ds5,6
		        note  Ds5
		  setRelease 01h
		repeatEnd
		repeatSection2Start
		        noteL Fs5,12
		        noteL Fs5,6
		        noteL Fs5,12
		        noteL Fs5,6
		        note  Fs5
		  setRelease 01h
		  inst 26
		  vol 0Bh
		        note  G5
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		        note  B5
		        note  D5
		        note  G5
		        note  B5
		        note  C6
		        note  Fs5
		        note  Gs5
		        note  C6
		mainLoopEnd
Music_36_Channel_5:
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
Music_36_Channel_6:
		  vibrato 04Ch
		mainLoopStart
		  setRelease 00h
		  psgInst 0Ch
		        psgNoteL B3,6
		        psgNote  D4
		        psgNote  B3
		        psgNote  D4
		        psgNote  C4
		        psgNote  Ds4
		        psgNote  C4
		        psgNote  Ds4
		countedLoopStart 3
		        psgNoteL G4,3
		        psgNote  Gs4
		countedLoopEnd
		        psgNoteL G4,6
		        psgNote  E4
		        psgNote  Cs4
		        psgNote  As3
		countedLoopStart 7
		        psgNoteL G3,3
		        psgNote  Gs3
		countedLoopEnd
		  setRelease 01h
		repeatStart
		  psgInst 01Ah
		countedLoopStart 8
		        psgNoteL E3,6
		        psgNote  Gs3
		countedLoopEnd
		  psgInst 0Ch
		        psgNoteL B3,6
		        psgNote  C4
		        psgNote  E4
		        psgNote  Gs4
		        psgNote  B4
		        psgNote  C5
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  E5
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  E4
		  psgInst 01Ah
		countedLoopStart 8
		        psgNoteL F3,6
		        psgNote  A3
		countedLoopEnd
		  psgInst 0Ch
		        psgNoteL B3,6
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  A4
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  A5
		        psgNote  F5
		        psgNote  A5
		        psgNote  Fs5
		        psgNote  As5
		        psgNote  Fs5
		        psgNote  As5
		  psgInst 01Ah
		countedLoopStart 4
		        psgNoteL G3,6
		        psgNote  As3
		countedLoopEnd
		        psgNoteL D4,6
		        psgNote  Fs4
		        psgNote  D4
		        psgNote  As3
		        psgNote  G3
		        psgNote  Fs3
		countedLoopStart 4
		        psgNoteL G3,6
		        psgNote  B3
		countedLoopEnd
		        psgNoteL Cs4,6
		        psgNote  Fs4
		        psgNote  G4
		        psgNote  B4
		        psgNote  Cs5
		        psgNote  Fs5
		  psgInst 0Ch
		countedLoopStart 1
		        psgNoteL Gs5,6
		        psgNote  Fs5
		        psgNote  Gs5
		        psgNote  D5
		        psgNote  Gs5
		        psgNote  Fs5
		        psgNote  Gs5
		        psgNote  D5
		        psgNote  A5
		        psgNote  F5
		        psgNote  A5
		        psgNote  Ds5
		        psgNote  A5
		        psgNote  F5
		        psgNote  A5
		        psgNote  Ds5
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  psgInst 00h
		        waitL 144
		  psgInst 02Ah
		        psgNoteL Gs3,6
		        psgNote  A3
		        psgNote  Cs4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Gs4
		        psgNote  B4
		        psgNote  E5
		countedLoopStart 16
		        psgNoteL G5,6
		        psgNote  Ds5
		        psgNote  B4
		        psgNote  Fs5
		        psgNote  D5
		        psgNote  As4
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  A4
		        psgNote  D5
		        psgNote  As4
		        psgNote  Fs4
		        psgNote  As5
		        psgNote  F5
		        psgNote  B4
		countedLoopEnd
		        psgNoteL G5,6
		        psgNote  Ds5
		        psgNote  B4
		        psgNote  Fs5
		        psgNote  D5
		        psgNote  As4
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  A4
		countedLoopStart 4
		        psgNoteL D5,6
		        psgNote  As4
		        psgNote  Fs4
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  B4
		        psgNote  G4
		        psgNote  F5
		        psgNote  E5
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  Fs5
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  A4
		        psgNote  G5
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL B4,6
		        psgNote  D4
		        psgNote  G4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  Fs4
		        psgNote  C4
		countedLoopEnd
		mainLoopEnd
Music_36_Channel_7:
		  shifting 020h
		  vibrato 04Ch
		mainLoopStart
		  psgInst 00h
		        waitL 6
		  setRelease 00h
		  psgInst 0Ah
		        psgNote  B3
		        psgNote  D4
		        psgNote  B3
		        psgNote  D4
		        psgNote  C4
		        psgNote  Ds4
		        psgNote  C4
		        psgNote  Ds4
		countedLoopStart 3
		        psgNoteL G4,3
		        psgNote  Gs4
		countedLoopEnd
		        psgNoteL G4,6
		        psgNote  E4
		        psgNote  Cs4
		        psgNote  As3
		countedLoopStart 7
		        psgNoteL G3,3
		        psgNote  Gs3
		countedLoopEnd
		  setRelease 01h
		repeatStart
		  psgInst 018h
		countedLoopStart 8
		        psgNoteL E3,6
		        psgNote  Gs3
		countedLoopEnd
		  psgInst 0Ah
		        psgNoteL B3,6
		        psgNote  C4
		        psgNote  E4
		        psgNote  Gs4
		        psgNote  B4
		        psgNote  C5
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  E5
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  E4
		  psgInst 018h
		countedLoopStart 8
		        psgNoteL F3,6
		        psgNote  A3
		countedLoopEnd
		  psgInst 0Ah
		        psgNoteL B3,6
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  A4
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  A5
		        psgNote  F5
		        psgNote  A5
		        psgNote  Fs5
		        psgNote  As5
		        psgNote  Fs5
		        psgNote  As5
		  psgInst 018h
		countedLoopStart 4
		        psgNoteL G3,6
		        psgNote  As3
		countedLoopEnd
		        psgNoteL D4,6
		        psgNote  Fs4
		        psgNote  D4
		        psgNote  As3
		        psgNote  G3
		        psgNote  Fs3
		countedLoopStart 4
		        psgNoteL G3,6
		        psgNote  B3
		countedLoopEnd
		        psgNoteL Cs4,6
		        psgNote  Fs4
		        psgNote  G4
		        psgNote  B4
		        psgNote  Cs5
		        psgNote  Fs5
		  psgInst 0Ah
		countedLoopStart 1
		        psgNoteL Gs5,6
		        psgNote  Fs5
		        psgNote  Gs5
		        psgNote  D5
		        psgNote  Gs5
		        psgNote  Fs5
		        psgNote  Gs5
		        psgNote  D5
		        psgNote  A5
		        psgNote  F5
		        psgNote  A5
		        psgNote  Ds5
		        psgNote  A5
		        psgNote  F5
		        psgNote  A5
		        psgNote  Ds5
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  psgInst 00h
		        waitL 138
		  shifting 00h
		  psgInst 02Ah
		        psgNoteL As2,6
		        psgNote  D3
		        psgNote  F3
		        psgNote  Gs3
		        psgNote  As3
		        psgNote  D4
		        psgNote  F4
		        psgNote  Gs4
		countedLoopStart 23
		        psgNoteL Gs4,6
		        psgNote  G4
		        psgNote  E5
		        psgNote  A5
		        psgNote  F4
		        psgNote  Gs4
		        psgNote  G4
		        psgNote  C5
		        psgNote  Gs5
		        psgNote  B5
		        psgNote  Cs6
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL Gs4,6
		        psgNote  B4
		        psgNote  E5
		        psgNote  F5
		        psgNote  A4
		        psgNote  C5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  As4
		        psgNote  Cs5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  B4
		        psgNote  D5
		        psgNote  G5
		        psgNote  Gs5
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL G3,6
		        psgNote  B3
		        psgNote  D3
		        psgNote  G3
		        psgNote  Gs3
		        psgNote  C4
		        psgNote  Ds3
		        psgNote  Fs3
		countedLoopEnd
		mainLoopEnd
Music_36_Channel_9:
		channel_end
