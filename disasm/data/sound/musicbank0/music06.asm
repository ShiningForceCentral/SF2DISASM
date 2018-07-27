
; ASM FILE music06.asm :
; 0xB7B5..0xBE8F : Music 06
Music_6:        db 0
		db 0
		db 0
		db 0CCh
		dw Music_6_Channel_0
		dw Music_6_Channel_1
		dw Music_6_Channel_2
		dw Music_6_Channel_3
		dw Music_6_Channel_4
		dw Music_6_Channel_5
		dw Music_6_Channel_6
		dw Music_6_Channel_7
		dw Music_6_Channel_9
		dw Music_6_Channel_9
Music_6_Channel_0:
		  stereo 0C0h
		mainLoopStart
		  inst 20
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL Gs4,12
		        noteL G4,6
		  vol 07h
		        note  G4
		  inst 3
		countedLoopStart 2
		  vol 0Ch
		        noteL E3,6
		  vol 08h
		        note  E3
		  vol 0Ch
		        note  E3
		        note  E3
		countedLoopEnd
		        noteL E3,6
		  vol 08h
		        note  E3
		  vol 0Ch
		        noteL A2,18
		  vol 08h
		        noteL A2,6
		  vol 0Ch
		        note  A2
		        note  A2
		countedLoopStart 2
		        noteL A2,6
		  vol 08h
		        note  A2
		  vol 0Ch
		        note  A2
		        note  A2
		countedLoopEnd
		countedLoopStart 2
		        noteL Fs3,6
		  vol 08h
		        note  Fs3
		  vol 0Ch
		        note  Fs3
		        note  Fs3
		countedLoopEnd
		        noteL Fs3,6
		  vol 08h
		        note  Fs3
		  vol 0Ch
		        noteL B2,18
		  vol 08h
		        noteL B2,6
		  vol 0Ch
		        note  B2
		        note  B2
		countedLoopStart 2
		        noteL B2,6
		  vol 08h
		        note  B2
		  vol 0Ch
		        note  B2
		        note  B2
		countedLoopEnd
		countedLoopStart 1
		  inst 3
		  vol 0Dh
		  sustain
		        noteL F2,6
		        note  Fs2
		        note  G2
		  setRelease 01h
		        note  Gs2
		  inst 59
		  vol 0Ch
		        noteL A2,72
		countedLoopEnd
		  inst 3
		  vol 0Dh
		  sustain
		        noteL A2,6
		        note  As2
		        note  B2
		  setRelease 01h
		        note  C3
		  inst 59
		  vol 0Ch
		        noteL Cs3,72
		  inst 3
		  vol 0Dh
		  sustain
		        noteL B2,6
		        note  C3
		        note  Cs3
		  setRelease 01h
		        note  D3
		  inst 59
		  vol 0Ch
		        noteL Ds3,72
		repeatStart
		  inst 3
		  vol 0Dh
		        noteL Gs3,6
		        note  Gs3
		        note  Gs3
		  vol 09h
		        note  Gs3
		        waitL 12
		countedLoopStart 1
		  vol 0Ch
		        noteL F3,15
		  vol 08h
		        noteL F3,9
		countedLoopEnd
		countedLoopStart 1
		  vol 0Ch
		        noteL F3,6
		  vol 08h
		        note  F3
		countedLoopEnd
		  vol 0Ch
		        noteL E3,6
		  vol 08h
		        note  E3
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  vol 0Dh
		        noteL B3,6
		  vol 09h
		        note  B3
		        waitL 84
		  sustain
		  vol 0Dh
		        noteL A2,96
		        noteL A2,1
		  setSlide 0Eh
		  setRelease 01h
		        noteL A3,47
		  noSlide
		  vol 0Eh
		        noteL A3,6
		  vol 0Bh
		        note  A3
		  vol 09h
		        note  A3
		  vol 07h
		        note  A3
		mainLoopEnd
Music_6_Channel_1:
		  stereo 0C0h
		mainLoopStart
		  inst 20
		  setRelease 01h
		  vibrato 02Ch
		  vol 0Bh
		        noteL A5,12
		        noteL As5,6
		  vol 08h
		        note  As5
		  vol 06h
		        note  As5
		  vol 04h
		        note  As5
		        waitL 36
		  vol 0Bh
		        noteL E5,12
		        noteL F5,6
		  vol 08h
		        note  F5
		        waitL 12
		  vol 0Bh
		        noteL Cs5,84
		        noteL B5,12
		        noteL C6,6
		  vol 08h
		        note  C6
		  vol 06h
		        note  C6
		  vol 04h
		        note  C6
		        waitL 36
		  vol 0Bh
		        noteL Fs5,12
		        noteL G5,6
		  vol 08h
		        note  G5
		        waitL 12
		  vol 0Bh
		        noteL Ds5,108
		  inst 1
		  vol 0Bh
		        noteL Cs6,48
		        noteL C6,18
		        note  A5
		        noteL As5,6
		  vol 09h
		        note  As5
		        waitL 12
		  vol 0Bh
		        noteL Cs6,24
		        noteL C6,6
		  vol 09h
		        note  C6
		  vol 0Bh
		        noteL A5,48
		        note  Cs6
		        noteL C6,18
		        note  B5
		        noteL C6,6
		  vol 09h
		        note  C6
		  vol 0Bh
		        noteL Ds6,24
		        noteL D6,6
		  vol 09h
		        note  D6
		  vol 0Bh
		        noteL Fs6,60
		countedLoopStart 1
		  inst 3
		  vol 0Ch
		        noteL G6,6
		        note  G6
		        note  G6
		  vol 09h
		        note  G6
		  vol 07h
		        note  G6
		  vol 05h
		        note  G6
		  inst 56
		  vol 0Bh
		        noteL Gs4,15
		        waitL 9
		        noteL Gs4,15
		        waitL 9
		        noteL Gs4,6
		        wait
		        note  Gs4
		        wait
		        note  G4
		        wait
		countedLoopEnd
		        noteL Ds4,6
		        waitL 12
		  inst 20
		  vol 0Ah
		        noteL As6,222
		  vol 0Bh
		        noteL As6,6
		  vol 09h
		        note  As6
		  vol 07h
		        note  As6
		  vol 05h
		        note  As6
		mainLoopEnd
Music_6_Channel_2:
		  stereo 0C0h
		mainLoopStart
		  inst 20
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL F5,12
		        noteL Fs5,6
		  vol 07h
		        note  Fs5
		  vol 05h
		        note  Fs5
		  vol 03h
		        note  Fs5
		        waitL 36
		  vol 0Ah
		        noteL Gs4,12
		        noteL A4,6
		  vol 07h
		        note  A4
		        waitL 12
		  vol 0Ah
		        noteL Gs4,24
		  inst 27
		  vol 0Bh
		        noteL Cs5,6
		        wait
		        noteL Gs5,18
		        noteL Cs5,6
		        noteL Gs5,24
		  inst 20
		  vol 0Ah
		        noteL G5,12
		        noteL Gs5,6
		  vol 07h
		        note  Gs5
		  vol 05h
		        note  Gs5
		  vol 03h
		        note  Gs5
		        waitL 36
		  vol 0Ah
		        noteL As4,12
		        noteL B4,6
		  vol 07h
		        note  B4
		        waitL 12
		  vol 0Ah
		        noteL As4,24
		  inst 27
		  vol 0Bh
		        noteL Ds5,6
		        wait
		        noteL As5,18
		        noteL Ds5,6
		        noteL As5,48
		        waitL 12
		repeatStart
		  inst 56
		  vol 0Bh
		        noteL F5,6
		countedLoopStart 1
		  vol 0Bh
		        noteL F5,6
		  vol 08h
		        note  F5
		countedLoopEnd
		  vol 0Bh
		        noteL F5,12
		        noteL E5,6
		  vol 08h
		        note  E5
		  vol 06h
		        note  E5
		        waitL 24
		  vol 0Bh
		repeatSection1Start
		        noteL F5,6
		        note  F5
		  vol 08h
		        note  F5
		  vol 0Bh
		        noteL F5,18
		  vol 08h
		        noteL F5,6
		  vol 06h
		        note  F5
		  vol 04h
		        note  F5
		  vol 0Bh
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 0Bh
		        note  E5
		  vol 08h
		        note  E5
		  vol 0Bh
		        noteL F5,18
		  vol 08h
		        noteL F5,6
		  vol 06h
		        note  F5
		repeatEnd
		repeatSection2Start
		        noteL G5,6
		        note  G5
		  vol 08h
		        note  G5
		  vol 0Bh
		        noteL G5,18
		  vol 08h
		        noteL G5,6
		  vol 06h
		        note  G5
		  vol 04h
		        note  G5
		  vol 0Bh
		        note  E5
		  vol 08h
		        note  E5
		  vol 0Bh
		        note  F5
		  vol 08h
		        note  F5
		  vol 0Bh
		        noteL Fs5,12
		        noteL G5,6
		countedLoopStart 1
		  inst 3
		  vol 0Bh
		        noteL Ds6,6
		        note  Ds6
		        note  Ds6
		  vol 08h
		        note  Ds6
		  vol 06h
		        note  Ds6
		  vol 04h
		        note  Ds6
		  inst 56
		  vol 0Ah
		        noteL Ds4,15
		        waitL 9
		        noteL Ds4,15
		        waitL 9
		        noteL Ds4,6
		        wait
		        note  Ds4
		        wait
		        note  D4
		        wait
		countedLoopEnd
		        noteL As3,6
		        waitL 30
		  inst 20
		  vol 09h
		        noteL Cs5,12
		        noteL Ds5,192
		  vol 0Ah
		        noteL Ds5,6
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		  vol 04h
		        note  Ds5
		mainLoopEnd
Music_6_Channel_3:
		  stereo 0C0h
		mainLoopStart
		  inst 20
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL B4,12
		        noteL B4,6
		  vol 07h
		        note  B4
		  vol 05h
		        note  B4
		  vol 03h
		        note  B4
		        waitL 36
		  vol 0Ah
		        noteL F4,12
		        noteL Fs4,6
		  vol 07h
		        note  Fs4
		        waitL 12
		  vol 0Ah
		        noteL F4,84
		        noteL C5,12
		        noteL Cs5,6
		  vol 07h
		        note  Cs5
		  vol 05h
		        note  Cs5
		  vol 03h
		        note  Cs5
		        waitL 36
		  vol 0Ah
		        noteL G4,12
		        noteL Gs4,6
		  vol 07h
		        note  Gs4
		        waitL 12
		  vol 0Ah
		        noteL G4,108
		        waitL 12
		repeatStart
		  inst 56
		  vol 0Bh
		        noteL A4,6
		countedLoopStart 1
		  vol 0Bh
		        noteL A4,6
		  vol 08h
		        note  A4
		countedLoopEnd
		  vol 0Bh
		        noteL A4,12
		        noteL Gs4,6
		  vol 08h
		        note  Gs4
		  vol 06h
		        note  Gs4
		        waitL 24
		  vol 0Bh
		repeatSection1Start
		        noteL A4,6
		        note  A4
		  vol 08h
		        note  A4
		  vol 0Bh
		        noteL A4,18
		  vol 08h
		        noteL A4,6
		  vol 06h
		        note  A4
		  vol 04h
		        note  A4
		  vol 0Bh
		        note  B4
		  vol 08h
		        note  B4
		  vol 0Bh
		        note  C5
		  vol 08h
		        note  C5
		  vol 0Bh
		        noteL Cs5,18
		  vol 08h
		        noteL Cs5,6
		  vol 06h
		        note  Cs5
		repeatEnd
		repeatSection2Start
		        noteL B4,6
		        note  B4
		  vol 08h
		        note  B4
		  vol 0Bh
		        noteL B4,18
		  vol 08h
		        noteL B4,6
		  vol 06h
		        note  B4
		  vol 04h
		        note  B4
		  vol 0Bh
		        note  Gs4
		  vol 08h
		        note  Gs4
		  vol 0Bh
		        note  A4
		  vol 08h
		        note  A4
		  vol 0Bh
		        noteL As4,12
		        noteL B4,6
		countedLoopStart 1
		  inst 3
		  vol 0Bh
		        noteL B5,6
		        note  B5
		        note  B5
		  vol 08h
		        note  B5
		  vol 06h
		        note  B5
		  vol 04h
		        note  B5
		  inst 56
		  vol 0Ah
		        noteL A3,15
		        waitL 9
		        noteL A3,15
		        waitL 9
		        noteL A3,6
		        wait
		        note  A3
		        wait
		        note  Gs3
		        wait
		countedLoopEnd
		        noteL F3,6
		        waitL 60
		  inst 20
		  vol 09h
		        noteL Fs4,18
		        noteL Gs4,156
		  vol 0Ah
		        noteL Gs4,6
		  vol 08h
		        note  Gs4
		  vol 06h
		        note  Gs4
		  vol 04h
		        note  Gs4
		mainLoopEnd
Music_6_Channel_4:
		        waitL 6
		  shifting 020h
		mainLoopStart
		  stereo 040h
		  inst 20
		  setRelease 01h
		  vibrato 02Ch
		  vol 0Ah
		        noteL A5,12
		        noteL As5,6
		  vol 07h
		        note  As5
		  vol 05h
		        note  As5
		  vol 03h
		        note  As5
		        waitL 36
		  vol 0Ah
		        noteL E5,12
		        noteL F5,6
		  vol 07h
		        note  F5
		        waitL 12
		  vol 0Ah
		        noteL Cs5,24
		  stereo 080h
		  inst 27
		  vol 0Ah
		        noteL Cs5,6
		        wait
		        noteL Gs5,18
		        noteL Cs5,6
		        noteL Gs5,24
		  stereo 040h
		  inst 20
		  vol 0Ah
		        noteL B5,12
		        noteL C6,6
		  vol 07h
		        note  C6
		  vol 05h
		        note  C6
		  vol 03h
		        note  C6
		        waitL 36
		  vol 0Ah
		        noteL Fs5,12
		        noteL G5,6
		  vol 07h
		        note  G5
		        waitL 12
		  vol 0Ah
		        noteL Ds5,24
		  stereo 080h
		  inst 27
		  vol 0Ah
		        noteL Ds5,6
		        wait
		        noteL As5,18
		        noteL Ds5,6
		        noteL As5,48
		  stereo 040h
		  inst 1
		  vol 0Ah
		        note  Cs6
		        noteL C6,18
		        note  A5
		        noteL As5,6
		  vol 08h
		        note  As5
		        waitL 12
		  vol 0Ah
		        noteL Cs6,24
		        noteL C6,6
		  vol 08h
		        note  C6
		  vol 0Ah
		        noteL A5,48
		        note  Cs6
		        noteL C6,18
		        note  B5
		        noteL C6,6
		  vol 08h
		        note  C6
		  vol 0Ah
		        noteL Ds6,24
		        noteL D6,6
		  vol 08h
		        note  D6
		  vol 0Ah
		        noteL Fs6,60
		countedLoopStart 1
		  stereo 080h
		  inst 3
		  vol 0Bh
		        noteL G6,6
		        note  G6
		        note  G6
		  vol 08h
		        note  G6
		  vol 06h
		        note  G6
		  vol 04h
		        note  G6
		  stereo 040h
		  inst 56
		  vol 0Ah
		        noteL Gs4,15
		        waitL 9
		        noteL Gs4,15
		        waitL 9
		        noteL Gs4,6
		        wait
		        note  Gs4
		        wait
		        note  G4
		        wait
		countedLoopEnd
		        noteL Ds4,6
		        waitL 12
		  stereo 080h
		  inst 20
		  vol 09h
		        noteL As6,18
		  stereo 040h
		        noteL Cs5,12
		        noteL Ds5,18
		  stereo 080h
		        note  Fs4
		        noteL Gs4,12
		  stereo 040h
		  sustain
		        noteL A2,96
		        noteL A2,1
		  setSlide 0Eh
		  setRelease 01h
		        noteL A3,47
		  stereo 080h
		  noSlide
		  vol 0Ah
		        noteL As6,6
		  vol 08h
		        note  As6
		  vol 06h
		        note  As6
		  vol 04h
		        note  As6
		mainLoopEnd
Music_6_Channel_5:
		  stereo 0C0h
		  setRelease 00h
		mainLoopStart
		repeatStart
		        sampleL 5,12
		        sample  5
		countedLoopStart 2
		        sampleL 5,6
		        sample  3
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 2,12
		        sampleL 5,6
		        sample  3
		        sample  2
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 1
		        sampleL 5,6
		        sample  3
		        sample  3
		        sample  3
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		        sampleL 5,6
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 1
		repeatStart
		        sampleL 0,12
		        sampleL 2,3
		        sample  3
		        sample  3
		        sample  4
		        sampleL 3,6
		        sampleL 2,12
		        sampleL 3,6
		repeatSection1Start
		        sampleL 1,12
		        sampleL 2,3
		        sample  3
		        sample  3
		        sample  4
		        sampleL 1,6
		        sampleL 2,12
		        sampleL 3,6
		repeatEnd
		repeatSection2Start
		        sampleL 1,6
		        sampleL 2,3
		        sample  3
		        sample  3
		        sample  4
		        sampleL 3,6
		        sampleL 2,12
		        sample  1
		countedLoopEnd
		countedLoopStart 1
		        sampleL 5,6
		        sample  5
		        sampleL 5,24
		        sample  1
		        sample  1
		        sampleL 1,12
		        sample  1
		        sampleL 4,6
		        sample  3
		countedLoopEnd
		        sampleL 5,96
		        waitL 95
		        sampleL 3,1
		        sampleL 2,17
		        sampleL 3,1
		        sampleL 2,17
		        sampleL 3,1
		        sampleL 2,11
		        sampleL 3,1
		        sampleL 5,24
		mainLoopEnd
Music_6_Channel_6:
		  setRelease 01h
		  vibrato 04Ch
		mainLoopStart
		  psgInst 00h
		        waitL    24
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL As4,6
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		countedLoopEnd
		        psgNoteL As4,6
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		  psgInst 07Ch
		        psgNoteL E5,4
		        psgNote  F5
		        psgNote  E5
		        psgNote  F5
		        psgNote  E5
		        psgNote  F5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		  psgInst 07Bh
		countedLoopStart 1
		        psgNoteL C5,6
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Cs5
		countedLoopEnd
		        psgNoteL C5,6
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  G5
		  psgInst 07Ch
		        psgNoteL Fs5,4
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  F5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Cs5
		countedLoopStart 15
		        psgNoteL E3,6
		        psgNote  F3
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL Gs3,6
		        psgNote  A3
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL As3,6
		        psgNote  B3
		countedLoopEnd
		countedLoopStart 1
		  psgInst 00h
		        waitL    36
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        psgNote  G4
		        psgNote  Fs4
		        psgNote  F4
		        psgNote  E4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  B3
		        psgNote  As3
		        psgNote  A3
		        psgNote  Gs3
		        wait
		countedLoopEnd
		  psgInst 00h
		        waitL    120
		  psgInst 07Bh
		        psgNoteL E4,4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  G4
		        psgNote  Gs4
		        psgNote  A4
		countedLoopStart 11
		        psgNoteL As4,4
		        psgNote  B4
		countedLoopEnd
		        psgNoteL As4,6
		        waitL    18
		mainLoopEnd
Music_6_Channel_7:
		  setRelease 01h
		  vibrato 04Ch
		mainLoopStart
		  psgInst 00h
		        waitL    24
		countedLoopStart 1
		  psgInst 07Bh
		        psgNoteL Gs4,6
		        psgNote  A4
		        psgNote  As4
		        psgNote  B4
		        psgNote  C5
		        psgNote  B4
		        psgNote  As4
		        psgNote  A4
		countedLoopEnd
		        psgNoteL Gs4,6
		        psgNote  A4
		        psgNote  As4
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		  psgInst 07Ch
		        psgNoteL D5,4
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		        psgNote  As4
		        psgNote  A4
		  psgInst 07Bh
		countedLoopStart 1
		        psgNoteL As4,6
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		countedLoopEnd
		        psgNoteL As4,6
		        psgNote  B4
		        psgNote  C5
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		  psgInst 07Ch
		        psgNoteL E5,4
		        psgNote  F5
		        psgNote  E5
		        psgNote  F5
		        psgNote  E5
		        psgNote  F5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		countedLoopStart 15
		        psgNoteL C3,6
		        psgNote  Cs3
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL E3,6
		        psgNote  F3
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL Fs3,6
		        psgNote  G3
		countedLoopEnd
		countedLoopStart 1
		  psgInst 00h
		        waitL    36
		  psgInst 07Bh
		        psgNoteL Fs4,6
		        psgNote  F4
		        psgNote  E4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  Cs4
		        psgNote  C4
		        psgNote  B3
		        psgNote  As3
		        psgNote  A3
		        psgNote  Gs3
		        psgNote  G3
		        psgNote  Fs3
		        wait
		countedLoopEnd
		  psgInst 00h
		        waitL    120
		  psgInst 07Bh
		        psgNoteL D4,4
		        psgNote  Ds4
		        psgNote  E4
		        psgNote  F4
		        psgNote  Fs4
		        psgNote  G4
		countedLoopStart 11
		        psgNoteL Gs4,4
		        psgNote  A4
		countedLoopEnd
		        psgNoteL Gs4,6
		        waitL    18
		mainLoopEnd
Music_6_Channel_9:
		channel_end
