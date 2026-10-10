
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
		        noteL Gs3,12
		        noteL G3,6
		  vol 07h
		        note  G3
		  inst 3
		countedLoopStart 2
		  vol 0Ch
		        noteL E2,6
		  vol 08h
		        note  E2
		  vol 0Ch
		        note  E2
		        note  E2
		countedLoopEnd
		        noteL E2,6
		  vol 08h
		        note  E2
		  vol 0Ch
		        noteL A1,18
		  vol 08h
		        noteL A1,6
		  vol 0Ch
		        note  A1
		        note  A1
		countedLoopStart 2
		        noteL A1,6
		  vol 08h
		        note  A1
		  vol 0Ch
		        note  A1
		        note  A1
		countedLoopEnd
		countedLoopStart 2
		        noteL Fs2,6
		  vol 08h
		        note  Fs2
		  vol 0Ch
		        note  Fs2
		        note  Fs2
		countedLoopEnd
		        noteL Fs2,6
		  vol 08h
		        note  Fs2
		  vol 0Ch
		        noteL B1,18
		  vol 08h
		        noteL B1,6
		  vol 0Ch
		        note  B1
		        note  B1
		countedLoopStart 2
		        noteL B1,6
		  vol 08h
		        note  B1
		  vol 0Ch
		        note  B1
		        note  B1
		countedLoopEnd
		countedLoopStart 1
		  inst 3
		  vol 0Dh
		  sustain
		        noteL F1,6
		        note  Fs1
		        note  G1
		  setRelease 01h
		        note  Gs1
		  inst 59
		  vol 0Ch
		        noteL A1,72
		countedLoopEnd
		  inst 3
		  vol 0Dh
		  sustain
		        noteL A1,6
		        note  As1
		        note  B1
		  setRelease 01h
		        note  C2
		  inst 59
		  vol 0Ch
		        noteL Cs2,72
		  inst 3
		  vol 0Dh
		  sustain
		        noteL B1,6
		        note  C2
		        note  Cs2
		  setRelease 01h
		        note  D2
		  inst 59
		  vol 0Ch
		        noteL Ds2,72
		repeatStart
		  inst 3
		  vol 0Dh
		        noteL Gs2,6
		        note  Gs2
		        note  Gs2
		  vol 09h
		        note  Gs2
		        waitL 12
		countedLoopStart 1
		  vol 0Ch
		        noteL F2,15
		  vol 08h
		        noteL F2,9
		countedLoopEnd
		countedLoopStart 1
		  vol 0Ch
		        noteL F2,6
		  vol 08h
		        note  F2
		countedLoopEnd
		  vol 0Ch
		        noteL E2,6
		  vol 08h
		        note  E2
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  vol 0Dh
		        noteL B2,6
		  vol 09h
		        note  B2
		        waitL 84
		  sustain
		  vol 0Dh
		        noteL A1,96
		        noteL A1,1
		  setSlide 0Eh
		  setRelease 01h
		        noteL A2,47
		  noSlide
		  vol 0Eh
		        noteL A2,6
		  vol 0Bh
		        note  A2
		  vol 09h
		        note  A2
		  vol 07h
		        note  A2
		mainLoopEnd
Music_6_Channel_1:
		  stereo 0C0h
		mainLoopStart
		  inst 20
		  setRelease 01h
		  vibrato 02Ch
		  vol 0Bh
		        noteL A4,12
		        noteL As4,6
		  vol 08h
		        note  As4
		  vol 06h
		        note  As4
		  vol 04h
		        note  As4
		        waitL 36
		  vol 0Bh
		        noteL E4,12
		        noteL F4,6
		  vol 08h
		        note  F4
		        waitL 12
		  vol 0Bh
		        noteL Cs4,84
		        noteL B4,12
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 06h
		        note  C5
		  vol 04h
		        note  C5
		        waitL 36
		  vol 0Bh
		        noteL Fs4,12
		        noteL G4,6
		  vol 08h
		        note  G4
		        waitL 12
		  vol 0Bh
		        noteL Ds4,108
		  inst 1
		  vol 0Bh
		        noteL Cs5,48
		        noteL C5,18
		        note  A4
		        noteL As4,6
		  vol 09h
		        note  As4
		        waitL 12
		  vol 0Bh
		        noteL Cs5,24
		        noteL C5,6
		  vol 09h
		        note  C5
		  vol 0Bh
		        noteL A4,48
		        note  Cs5
		        noteL C5,18
		        note  B4
		        noteL C5,6
		  vol 09h
		        note  C5
		  vol 0Bh
		        noteL Ds5,24
		        noteL D5,6
		  vol 09h
		        note  D5
		  vol 0Bh
		        noteL Fs5,60
		countedLoopStart 1
		  inst 3
		  vol 0Ch
		        noteL G5,6
		        note  G5
		        note  G5
		  vol 09h
		        note  G5
		  vol 07h
		        note  G5
		  vol 05h
		        note  G5
		  inst 56
		  vol 0Bh
		        noteL Gs3,15
		        waitL 9
		        noteL Gs3,15
		        waitL 9
		        noteL Gs3,6
		        wait
		        note  Gs3
		        wait
		        note  G3
		        wait
		countedLoopEnd
		        noteL Ds3,6
		        waitL 12
		  inst 20
		  vol 0Ah
		        noteL As5,222
		  vol 0Bh
		        noteL As5,6
		  vol 09h
		        note  As5
		  vol 07h
		        note  As5
		  vol 05h
		        note  As5
		mainLoopEnd
Music_6_Channel_2:
		  stereo 0C0h
		mainLoopStart
		  inst 20
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL F4,12
		        noteL Fs4,6
		  vol 07h
		        note  Fs4
		  vol 05h
		        note  Fs4
		  vol 03h
		        note  Fs4
		        waitL 36
		  vol 0Ah
		        noteL Gs3,12
		        noteL A3,6
		  vol 07h
		        note  A3
		        waitL 12
		  vol 0Ah
		        noteL Gs3,24
		  inst 27
		  vol 0Bh
		        noteL Cs4,6
		        wait
		        noteL Gs4,18
		        noteL Cs4,6
		        noteL Gs4,24
		  inst 20
		  vol 0Ah
		        noteL G4,12
		        noteL Gs4,6
		  vol 07h
		        note  Gs4
		  vol 05h
		        note  Gs4
		  vol 03h
		        note  Gs4
		        waitL 36
		  vol 0Ah
		        noteL As3,12
		        noteL B3,6
		  vol 07h
		        note  B3
		        waitL 12
		  vol 0Ah
		        noteL As3,24
		  inst 27
		  vol 0Bh
		        noteL Ds4,6
		        wait
		        noteL As4,18
		        noteL Ds4,6
		        noteL As4,48
		        waitL 12
		repeatStart
		  inst 56
		  vol 0Bh
		        noteL F4,6
		countedLoopStart 1
		  vol 0Bh
		        noteL F4,6
		  vol 08h
		        note  F4
		countedLoopEnd
		  vol 0Bh
		        noteL F4,12
		        noteL E4,6
		  vol 08h
		        note  E4
		  vol 06h
		        note  E4
		        waitL 24
		  vol 0Bh
		repeatSection1Start
		        noteL F4,6
		        note  F4
		  vol 08h
		        note  F4
		  vol 0Bh
		        noteL F4,18
		  vol 08h
		        noteL F4,6
		  vol 06h
		        note  F4
		  vol 04h
		        note  F4
		  vol 0Bh
		        note  Ds4
		  vol 08h
		        note  Ds4
		  vol 0Bh
		        note  E4
		  vol 08h
		        note  E4
		  vol 0Bh
		        noteL F4,18
		  vol 08h
		        noteL F4,6
		  vol 06h
		        note  F4
		repeatEnd
		repeatSection2Start
		        noteL G4,6
		        note  G4
		  vol 08h
		        note  G4
		  vol 0Bh
		        noteL G4,18
		  vol 08h
		        noteL G4,6
		  vol 06h
		        note  G4
		  vol 04h
		        note  G4
		  vol 0Bh
		        note  E4
		  vol 08h
		        note  E4
		  vol 0Bh
		        note  F4
		  vol 08h
		        note  F4
		  vol 0Bh
		        noteL Fs4,12
		        noteL G4,6
		countedLoopStart 1
		  inst 3
		  vol 0Bh
		        noteL Ds5,6
		        note  Ds5
		        note  Ds5
		  vol 08h
		        note  Ds5
		  vol 06h
		        note  Ds5
		  vol 04h
		        note  Ds5
		  inst 56
		  vol 0Ah
		        noteL Ds3,15
		        waitL 9
		        noteL Ds3,15
		        waitL 9
		        noteL Ds3,6
		        wait
		        note  Ds3
		        wait
		        note  D3
		        wait
		countedLoopEnd
		        noteL As2,6
		        waitL 30
		  inst 20
		  vol 09h
		        noteL Cs4,12
		        noteL Ds4,192
		  vol 0Ah
		        noteL Ds4,6
		  vol 08h
		        note  Ds4
		  vol 06h
		        note  Ds4
		  vol 04h
		        note  Ds4
		mainLoopEnd
Music_6_Channel_3:
		  stereo 0C0h
		mainLoopStart
		  inst 20
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL B3,12
		        noteL B3,6
		  vol 07h
		        note  B3
		  vol 05h
		        note  B3
		  vol 03h
		        note  B3
		        waitL 36
		  vol 0Ah
		        noteL F3,12
		        noteL Fs3,6
		  vol 07h
		        note  Fs3
		        waitL 12
		  vol 0Ah
		        noteL F3,84
		        noteL C4,12
		        noteL Cs4,6
		  vol 07h
		        note  Cs4
		  vol 05h
		        note  Cs4
		  vol 03h
		        note  Cs4
		        waitL 36
		  vol 0Ah
		        noteL G3,12
		        noteL Gs3,6
		  vol 07h
		        note  Gs3
		        waitL 12
		  vol 0Ah
		        noteL G3,108
		        waitL 12
		repeatStart
		  inst 56
		  vol 0Bh
		        noteL A3,6
		countedLoopStart 1
		  vol 0Bh
		        noteL A3,6
		  vol 08h
		        note  A3
		countedLoopEnd
		  vol 0Bh
		        noteL A3,12
		        noteL Gs3,6
		  vol 08h
		        note  Gs3
		  vol 06h
		        note  Gs3
		        waitL 24
		  vol 0Bh
		repeatSection1Start
		        noteL A3,6
		        note  A3
		  vol 08h
		        note  A3
		  vol 0Bh
		        noteL A3,18
		  vol 08h
		        noteL A3,6
		  vol 06h
		        note  A3
		  vol 04h
		        note  A3
		  vol 0Bh
		        note  B3
		  vol 08h
		        note  B3
		  vol 0Bh
		        note  C4
		  vol 08h
		        note  C4
		  vol 0Bh
		        noteL Cs4,18
		  vol 08h
		        noteL Cs4,6
		  vol 06h
		        note  Cs4
		repeatEnd
		repeatSection2Start
		        noteL B3,6
		        note  B3
		  vol 08h
		        note  B3
		  vol 0Bh
		        noteL B3,18
		  vol 08h
		        noteL B3,6
		  vol 06h
		        note  B3
		  vol 04h
		        note  B3
		  vol 0Bh
		        note  Gs3
		  vol 08h
		        note  Gs3
		  vol 0Bh
		        note  A3
		  vol 08h
		        note  A3
		  vol 0Bh
		        noteL As3,12
		        noteL B3,6
		countedLoopStart 1
		  inst 3
		  vol 0Bh
		        noteL B4,6
		        note  B4
		        note  B4
		  vol 08h
		        note  B4
		  vol 06h
		        note  B4
		  vol 04h
		        note  B4
		  inst 56
		  vol 0Ah
		        noteL A2,15
		        waitL 9
		        noteL A2,15
		        waitL 9
		        noteL A2,6
		        wait
		        note  A2
		        wait
		        note  Gs2
		        wait
		countedLoopEnd
		        noteL F2,6
		        waitL 60
		  inst 20
		  vol 09h
		        noteL Fs3,18
		        noteL Gs3,156
		  vol 0Ah
		        noteL Gs3,6
		  vol 08h
		        note  Gs3
		  vol 06h
		        note  Gs3
		  vol 04h
		        note  Gs3
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
		        noteL A4,12
		        noteL As4,6
		  vol 07h
		        note  As4
		  vol 05h
		        note  As4
		  vol 03h
		        note  As4
		        waitL 36
		  vol 0Ah
		        noteL E4,12
		        noteL F4,6
		  vol 07h
		        note  F4
		        waitL 12
		  vol 0Ah
		        noteL Cs4,24
		  stereo 080h
		  inst 27
		  vol 0Ah
		        noteL Cs4,6
		        wait
		        noteL Gs4,18
		        noteL Cs4,6
		        noteL Gs4,24
		  stereo 040h
		  inst 20
		  vol 0Ah
		        noteL B4,12
		        noteL C5,6
		  vol 07h
		        note  C5
		  vol 05h
		        note  C5
		  vol 03h
		        note  C5
		        waitL 36
		  vol 0Ah
		        noteL Fs4,12
		        noteL G4,6
		  vol 07h
		        note  G4
		        waitL 12
		  vol 0Ah
		        noteL Ds4,24
		  stereo 080h
		  inst 27
		  vol 0Ah
		        noteL Ds4,6
		        wait
		        noteL As4,18
		        noteL Ds4,6
		        noteL As4,48
		  stereo 040h
		  inst 1
		  vol 0Ah
		        note  Cs5
		        noteL C5,18
		        note  A4
		        noteL As4,6
		  vol 08h
		        note  As4
		        waitL 12
		  vol 0Ah
		        noteL Cs5,24
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 0Ah
		        noteL A4,48
		        note  Cs5
		        noteL C5,18
		        note  B4
		        noteL C5,6
		  vol 08h
		        note  C5
		  vol 0Ah
		        noteL Ds5,24
		        noteL D5,6
		  vol 08h
		        note  D5
		  vol 0Ah
		        noteL Fs5,60
		countedLoopStart 1
		  stereo 080h
		  inst 3
		  vol 0Bh
		        noteL G5,6
		        note  G5
		        note  G5
		  vol 08h
		        note  G5
		  vol 06h
		        note  G5
		  vol 04h
		        note  G5
		  stereo 040h
		  inst 56
		  vol 0Ah
		        noteL Gs3,15
		        waitL 9
		        noteL Gs3,15
		        waitL 9
		        noteL Gs3,6
		        wait
		        note  Gs3
		        wait
		        note  G3
		        wait
		countedLoopEnd
		        noteL Ds3,6
		        waitL 12
		  stereo 080h
		  inst 20
		  vol 09h
		        noteL As5,18
		  stereo 040h
		        noteL Cs4,12
		        noteL Ds4,18
		  stereo 080h
		        note  Fs3
		        noteL Gs3,12
		  stereo 040h
		  sustain
		        noteL A1,96
		        noteL A1,1
		  setSlide 0Eh
		  setRelease 01h
		        noteL A2,47
		  stereo 080h
		  noSlide
		  vol 0Ah
		        noteL As5,6
		  vol 08h
		        note  As5
		  vol 06h
		        note  As5
		  vol 04h
		        note  As5
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
		        psgNoteL As5,6
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  B5
		countedLoopEnd
		        psgNoteL As5,6
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  F6
		  psgInst 07Ch
		        psgNoteL E6,4
		        psgNote  F6
		        psgNote  E6
		        psgNote  F6
		        psgNote  E6
		        psgNote  F6
		        psgNote  E6
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  B5
		  psgInst 07Bh
		countedLoopStart 1
		        psgNoteL C6,6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Cs6
		countedLoopEnd
		        psgNoteL C6,6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  F6
		        psgNote  Fs6
		        psgNote  G6
		  psgInst 07Ch
		        psgNoteL Fs6,4
		        psgNote  G6
		        psgNote  Fs6
		        psgNote  G6
		        psgNote  Fs6
		        psgNote  G6
		        psgNote  Fs6
		        psgNote  F6
		        psgNote  E6
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Cs6
		countedLoopStart 15
		        psgNoteL E4,6
		        psgNote  F4
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL Gs4,6
		        psgNote  A4
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL As4,6
		        psgNote  B4
		countedLoopEnd
		countedLoopStart 1
		  psgInst 00h
		        waitL    36
		  psgInst 07Bh
		        psgNoteL Gs5,6
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  F5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		        psgNote  As4
		        psgNote  A4
		        psgNote  Gs4
		        wait
		countedLoopEnd
		  psgInst 00h
		        waitL    120
		  psgInst 07Bh
		        psgNoteL E5,4
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  A5
		countedLoopStart 11
		        psgNoteL As5,4
		        psgNote  B5
		countedLoopEnd
		        psgNoteL As5,6
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
		        psgNoteL Gs5,6
		        psgNote  A5
		        psgNote  As5
		        psgNote  B5
		        psgNote  C6
		        psgNote  B5
		        psgNote  As5
		        psgNote  A5
		countedLoopEnd
		        psgNoteL Gs5,6
		        psgNote  A5
		        psgNote  As5
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		  psgInst 07Ch
		        psgNoteL D6,4
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  B5
		        psgNote  As5
		        psgNote  A5
		  psgInst 07Bh
		countedLoopStart 1
		        psgNoteL As5,6
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  B5
		countedLoopEnd
		        psgNoteL As5,6
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  F6
		  psgInst 07Ch
		        psgNoteL E6,4
		        psgNote  F6
		        psgNote  E6
		        psgNote  F6
		        psgNote  E6
		        psgNote  F6
		        psgNote  E6
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  B5
		countedLoopStart 15
		        psgNoteL C4,6
		        psgNote  Cs4
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL E4,6
		        psgNote  F4
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL Fs4,6
		        psgNote  G4
		countedLoopEnd
		countedLoopStart 1
		  psgInst 00h
		        waitL    36
		  psgInst 07Bh
		        psgNoteL Fs5,6
		        psgNote  F5
		        psgNote  E5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  B4
		        psgNote  As4
		        psgNote  A4
		        psgNote  Gs4
		        psgNote  G4
		        psgNote  Fs4
		        wait
		countedLoopEnd
		  psgInst 00h
		        waitL    120
		  psgInst 07Bh
		        psgNoteL D5,4
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  F5
		        psgNote  Fs5
		        psgNote  G5
		countedLoopStart 11
		        psgNoteL Gs5,4
		        psgNote  A5
		countedLoopEnd
		        psgNoteL Gs5,6
		        waitL    18
		mainLoopEnd
Music_6_Channel_9:
		channel_end
