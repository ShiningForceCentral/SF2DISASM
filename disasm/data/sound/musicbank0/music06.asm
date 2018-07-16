
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
		  ymStereo 0C0h
		mainLoopStart
		  ymInst 20
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        noteL Gs3,12
		        noteL G3,6
		  ymVol 07h
		        note  G3
		  ymInst 3
		countedLoopStart 2
		  ymVol 0Ch
		        noteL E2,6
		  ymVol 08h
		        note  E2
		  ymVol 0Ch
		        note  E2
		        note  E2
		countedLoopEnd
		        noteL E2,6
		  ymVol 08h
		        note  E2
		  ymVol 0Ch
		        noteL A1,18
		  ymVol 08h
		        noteL A1,6
		  ymVol 0Ch
		        note  A1
		        note  A1
		countedLoopStart 2
		        noteL A1,6
		  ymVol 08h
		        note  A1
		  ymVol 0Ch
		        note  A1
		        note  A1
		countedLoopEnd
		countedLoopStart 2
		        noteL Fs2,6
		  ymVol 08h
		        note  Fs2
		  ymVol 0Ch
		        note  Fs2
		        note  Fs2
		countedLoopEnd
		        noteL Fs2,6
		  ymVol 08h
		        note  Fs2
		  ymVol 0Ch
		        noteL B1,18
		  ymVol 08h
		        noteL B1,6
		  ymVol 0Ch
		        note  B1
		        note  B1
		countedLoopStart 2
		        noteL B1,6
		  ymVol 08h
		        note  B1
		  ymVol 0Ch
		        note  B1
		        note  B1
		countedLoopEnd
		countedLoopStart 1
		  ymInst 3
		  ymVol 0Dh
		  ymSustain
		        noteL F1,6
		        note  Fs1
		        note  G1
		  release 01h
		        note  Gs1
		  ymInst 59
		  ymVol 0Ch
		        noteL A1,72
		countedLoopEnd
		  ymInst 3
		  ymVol 0Dh
		  ymSustain
		        noteL A1,6
		        note  As1
		        note  B1
		  release 01h
		        note  C2
		  ymInst 59
		  ymVol 0Ch
		        noteL Cs2,72
		  ymInst 3
		  ymVol 0Dh
		  ymSustain
		        noteL B1,6
		        note  C2
		        note  Cs2
		  release 01h
		        note  D2
		  ymInst 59
		  ymVol 0Ch
		        noteL Ds2,72
		repeatStart
		  ymInst 3
		  ymVol 0Dh
		        noteL Gs2,6
		        note  Gs2
		        note  Gs2
		  ymVol 09h
		        note  Gs2
		  length 12
		countedLoopStart 1
		  ymVol 0Ch
		        noteL F2,15
		  ymVol 08h
		        noteL F2,9
		countedLoopEnd
		countedLoopStart 1
		  ymVol 0Ch
		        noteL F2,6
		  ymVol 08h
		        note  F2
		countedLoopEnd
		  ymVol 0Ch
		        noteL E2,6
		  ymVol 08h
		        note  E2
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  ymVol 0Dh
		        noteL B2,6
		  ymVol 09h
		        note  B2
		  length 84
		  ymSustain
		  ymVol 0Dh
		        noteL A1,96
		        noteL A1,1
		  ymSlide 0Eh
		  release 01h
		        noteL A2,47
		  ymStopSlide
		  ymVol 0Eh
		        noteL A2,6
		  ymVol 0Bh
		        note  A2
		  ymVol 09h
		        note  A2
		  ymVol 07h
		        note  A2
		mainLoopEnd
Music_6_Channel_1:
		  ymStereo 0C0h
		mainLoopStart
		  ymInst 20
		  release 01h
		  vibrato 02Ch
		  ymVol 0Bh
		        noteL A4,12
		        noteL As4,6
		  ymVol 08h
		        note  As4
		  ymVol 06h
		        note  As4
		  ymVol 04h
		        note  As4
		  length 36
		  ymVol 0Bh
		        noteL E4,12
		        noteL F4,6
		  ymVol 08h
		        note  F4
		  length 12
		  ymVol 0Bh
		        noteL Cs4,84
		        noteL B4,12
		        noteL C5,6
		  ymVol 08h
		        note  C5
		  ymVol 06h
		        note  C5
		  ymVol 04h
		        note  C5
		  length 36
		  ymVol 0Bh
		        noteL Fs4,12
		        noteL G4,6
		  ymVol 08h
		        note  G4
		  length 12
		  ymVol 0Bh
		        noteL Ds4,108
		  ymInst 1
		  ymVol 0Bh
		        noteL Cs5,48
		        noteL C5,18
		        note  A4
		        noteL As4,6
		  ymVol 09h
		        note  As4
		  length 12
		  ymVol 0Bh
		        noteL Cs5,24
		        noteL C5,6
		  ymVol 09h
		        note  C5
		  ymVol 0Bh
		        noteL A4,48
		        note  Cs5
		        noteL C5,18
		        note  B4
		        noteL C5,6
		  ymVol 09h
		        note  C5
		  ymVol 0Bh
		        noteL Ds5,24
		        noteL D5,6
		  ymVol 09h
		        note  D5
		  ymVol 0Bh
		        noteL Fs5,60
		countedLoopStart 1
		  ymInst 3
		  ymVol 0Ch
		        noteL G5,6
		        note  G5
		        note  G5
		  ymVol 09h
		        note  G5
		  ymVol 07h
		        note  G5
		  ymVol 05h
		        note  G5
		  ymInst 56
		  ymVol 0Bh
		        noteL Gs3,15
		  length 9
		        noteL Gs3,15
		  length 9
		        noteL Gs3,6
		        silence
		        note  Gs3
		        silence
		        note  G3
		        silence
		countedLoopEnd
		        noteL Ds3,6
		  length 12
		  ymInst 20
		  ymVol 0Ah
		        noteL As5,222
		  ymVol 0Bh
		        noteL As5,6
		  ymVol 09h
		        note  As5
		  ymVol 07h
		        note  As5
		  ymVol 05h
		        note  As5
		mainLoopEnd
Music_6_Channel_2:
		  ymStereo 0C0h
		mainLoopStart
		  ymInst 20
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        noteL F4,12
		        noteL Fs4,6
		  ymVol 07h
		        note  Fs4
		  ymVol 05h
		        note  Fs4
		  ymVol 03h
		        note  Fs4
		  length 36
		  ymVol 0Ah
		        noteL Gs3,12
		        noteL A3,6
		  ymVol 07h
		        note  A3
		  length 12
		  ymVol 0Ah
		        noteL Gs3,24
		  ymInst 27
		  ymVol 0Bh
		        noteL Cs4,6
		        silence
		        noteL Gs4,18
		        noteL Cs4,6
		        noteL Gs4,24
		  ymInst 20
		  ymVol 0Ah
		        noteL G4,12
		        noteL Gs4,6
		  ymVol 07h
		        note  Gs4
		  ymVol 05h
		        note  Gs4
		  ymVol 03h
		        note  Gs4
		  length 36
		  ymVol 0Ah
		        noteL As3,12
		        noteL B3,6
		  ymVol 07h
		        note  B3
		  length 12
		  ymVol 0Ah
		        noteL As3,24
		  ymInst 27
		  ymVol 0Bh
		        noteL Ds4,6
		        silence
		        noteL As4,18
		        noteL Ds4,6
		        noteL As4,48
		  length 12
		repeatStart
		  ymInst 56
		  ymVol 0Bh
		        noteL F4,6
		countedLoopStart 1
		  ymVol 0Bh
		        noteL F4,6
		  ymVol 08h
		        note  F4
		countedLoopEnd
		  ymVol 0Bh
		        noteL F4,12
		        noteL E4,6
		  ymVol 08h
		        note  E4
		  ymVol 06h
		        note  E4
		  length 24
		  ymVol 0Bh
		repeatSection1Start
		        noteL F4,6
		        note  F4
		  ymVol 08h
		        note  F4
		  ymVol 0Bh
		        noteL F4,18
		  ymVol 08h
		        noteL F4,6
		  ymVol 06h
		        note  F4
		  ymVol 04h
		        note  F4
		  ymVol 0Bh
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 0Bh
		        note  E4
		  ymVol 08h
		        note  E4
		  ymVol 0Bh
		        noteL F4,18
		  ymVol 08h
		        noteL F4,6
		  ymVol 06h
		        note  F4
		repeatEnd
		repeatSection2Start
		        noteL G4,6
		        note  G4
		  ymVol 08h
		        note  G4
		  ymVol 0Bh
		        noteL G4,18
		  ymVol 08h
		        noteL G4,6
		  ymVol 06h
		        note  G4
		  ymVol 04h
		        note  G4
		  ymVol 0Bh
		        note  E4
		  ymVol 08h
		        note  E4
		  ymVol 0Bh
		        note  F4
		  ymVol 08h
		        note  F4
		  ymVol 0Bh
		        noteL Fs4,12
		        noteL G4,6
		countedLoopStart 1
		  ymInst 3
		  ymVol 0Bh
		        noteL Ds5,6
		        note  Ds5
		        note  Ds5
		  ymVol 08h
		        note  Ds5
		  ymVol 06h
		        note  Ds5
		  ymVol 04h
		        note  Ds5
		  ymInst 56
		  ymVol 0Ah
		        noteL Ds3,15
		  length 9
		        noteL Ds3,15
		  length 9
		        noteL Ds3,6
		        silence
		        note  Ds3
		        silence
		        note  D3
		        silence
		countedLoopEnd
		        noteL As2,6
		  length 30
		  ymInst 20
		  ymVol 09h
		        noteL Cs4,12
		        noteL Ds4,192
		  ymVol 0Ah
		        noteL Ds4,6
		  ymVol 08h
		        note  Ds4
		  ymVol 06h
		        note  Ds4
		  ymVol 04h
		        note  Ds4
		mainLoopEnd
Music_6_Channel_3:
		  ymStereo 0C0h
		mainLoopStart
		  ymInst 20
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        noteL B3,12
		        noteL B3,6
		  ymVol 07h
		        note  B3
		  ymVol 05h
		        note  B3
		  ymVol 03h
		        note  B3
		  length 36
		  ymVol 0Ah
		        noteL F3,12
		        noteL Fs3,6
		  ymVol 07h
		        note  Fs3
		  length 12
		  ymVol 0Ah
		        noteL F3,84
		        noteL C4,12
		        noteL Cs4,6
		  ymVol 07h
		        note  Cs4
		  ymVol 05h
		        note  Cs4
		  ymVol 03h
		        note  Cs4
		  length 36
		  ymVol 0Ah
		        noteL G3,12
		        noteL Gs3,6
		  ymVol 07h
		        note  Gs3
		  length 12
		  ymVol 0Ah
		        noteL G3,108
		  length 12
		repeatStart
		  ymInst 56
		  ymVol 0Bh
		        noteL A3,6
		countedLoopStart 1
		  ymVol 0Bh
		        noteL A3,6
		  ymVol 08h
		        note  A3
		countedLoopEnd
		  ymVol 0Bh
		        noteL A3,12
		        noteL Gs3,6
		  ymVol 08h
		        note  Gs3
		  ymVol 06h
		        note  Gs3
		  length 24
		  ymVol 0Bh
		repeatSection1Start
		        noteL A3,6
		        note  A3
		  ymVol 08h
		        note  A3
		  ymVol 0Bh
		        noteL A3,18
		  ymVol 08h
		        noteL A3,6
		  ymVol 06h
		        note  A3
		  ymVol 04h
		        note  A3
		  ymVol 0Bh
		        note  B3
		  ymVol 08h
		        note  B3
		  ymVol 0Bh
		        note  C4
		  ymVol 08h
		        note  C4
		  ymVol 0Bh
		        noteL Cs4,18
		  ymVol 08h
		        noteL Cs4,6
		  ymVol 06h
		        note  Cs4
		repeatEnd
		repeatSection2Start
		        noteL B3,6
		        note  B3
		  ymVol 08h
		        note  B3
		  ymVol 0Bh
		        noteL B3,18
		  ymVol 08h
		        noteL B3,6
		  ymVol 06h
		        note  B3
		  ymVol 04h
		        note  B3
		  ymVol 0Bh
		        note  Gs3
		  ymVol 08h
		        note  Gs3
		  ymVol 0Bh
		        note  A3
		  ymVol 08h
		        note  A3
		  ymVol 0Bh
		        noteL As3,12
		        noteL B3,6
		countedLoopStart 1
		  ymInst 3
		  ymVol 0Bh
		        noteL B4,6
		        note  B4
		        note  B4
		  ymVol 08h
		        note  B4
		  ymVol 06h
		        note  B4
		  ymVol 04h
		        note  B4
		  ymInst 56
		  ymVol 0Ah
		        noteL A2,15
		  length 9
		        noteL A2,15
		  length 9
		        noteL A2,6
		        silence
		        note  A2
		        silence
		        note  Gs2
		        silence
		countedLoopEnd
		        noteL F2,6
		  length 60
		  ymInst 20
		  ymVol 09h
		        noteL Fs3,18
		        noteL Gs3,156
		  ymVol 0Ah
		        noteL Gs3,6
		  ymVol 08h
		        note  Gs3
		  ymVol 06h
		        note  Gs3
		  ymVol 04h
		        note  Gs3
		mainLoopEnd
Music_6_Channel_4:
		  length 6
		  shifting 020h
		mainLoopStart
		  ymStereo 040h
		  ymInst 20
		  release 01h
		  vibrato 02Ch
		  ymVol 0Ah
		        noteL A4,12
		        noteL As4,6
		  ymVol 07h
		        note  As4
		  ymVol 05h
		        note  As4
		  ymVol 03h
		        note  As4
		  length 36
		  ymVol 0Ah
		        noteL E4,12
		        noteL F4,6
		  ymVol 07h
		        note  F4
		  length 12
		  ymVol 0Ah
		        noteL Cs4,24
		  ymStereo 080h
		  ymInst 27
		  ymVol 0Ah
		        noteL Cs4,6
		        silence
		        noteL Gs4,18
		        noteL Cs4,6
		        noteL Gs4,24
		  ymStereo 040h
		  ymInst 20
		  ymVol 0Ah
		        noteL B4,12
		        noteL C5,6
		  ymVol 07h
		        note  C5
		  ymVol 05h
		        note  C5
		  ymVol 03h
		        note  C5
		  length 36
		  ymVol 0Ah
		        noteL Fs4,12
		        noteL G4,6
		  ymVol 07h
		        note  G4
		  length 12
		  ymVol 0Ah
		        noteL Ds4,24
		  ymStereo 080h
		  ymInst 27
		  ymVol 0Ah
		        noteL Ds4,6
		        silence
		        noteL As4,18
		        noteL Ds4,6
		        noteL As4,48
		  ymStereo 040h
		  ymInst 1
		  ymVol 0Ah
		        note  Cs5
		        noteL C5,18
		        note  A4
		        noteL As4,6
		  ymVol 08h
		        note  As4
		  length 12
		  ymVol 0Ah
		        noteL Cs5,24
		        noteL C5,6
		  ymVol 08h
		        note  C5
		  ymVol 0Ah
		        noteL A4,48
		        note  Cs5
		        noteL C5,18
		        note  B4
		        noteL C5,6
		  ymVol 08h
		        note  C5
		  ymVol 0Ah
		        noteL Ds5,24
		        noteL D5,6
		  ymVol 08h
		        note  D5
		  ymVol 0Ah
		        noteL Fs5,60
		countedLoopStart 1
		  ymStereo 080h
		  ymInst 3
		  ymVol 0Bh
		        noteL G5,6
		        note  G5
		        note  G5
		  ymVol 08h
		        note  G5
		  ymVol 06h
		        note  G5
		  ymVol 04h
		        note  G5
		  ymStereo 040h
		  ymInst 56
		  ymVol 0Ah
		        noteL Gs3,15
		  length 9
		        noteL Gs3,15
		  length 9
		        noteL Gs3,6
		        silence
		        note  Gs3
		        silence
		        note  G3
		        silence
		countedLoopEnd
		        noteL Ds3,6
		  length 12
		  ymStereo 080h
		  ymInst 20
		  ymVol 09h
		        noteL As5,18
		  ymStereo 040h
		        noteL Cs4,12
		        noteL Ds4,18
		  ymStereo 080h
		        note  Fs3
		        noteL Gs3,12
		  ymStereo 040h
		  ymSustain
		        noteL A1,96
		        noteL A1,1
		  ymSlide 0Eh
		  release 01h
		        noteL A2,47
		  ymStereo 080h
		  ymStopSlide
		  ymVol 0Ah
		        noteL As5,6
		  ymVol 08h
		        note  As5
		  ymVol 06h
		        note  As5
		  ymVol 04h
		        note  As5
		mainLoopEnd
Music_6_Channel_5:
		  ymStereo 0C0h
		  release 00h
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
		  length 95
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
		  release 01h
		  vibrato 04Ch
		mainLoopStart
		  psgInst 0
		  length 24
		countedLoopStart 1
		  psgInst 123
		        psgNoteL G6,6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  As6
		        psgNote  B6
		        psgNote  As6
		        psgNote  A6
		        psgNote  Gs6
		countedLoopEnd
		        psgNoteL G6,6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  As6
		        psgNote  B6
		        psgNote  C7
		        psgNote  Cs7
		        psgNote  D7
		  psgInst 124
		        psgNoteL Cs7,4
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  C7
		        psgNote  B6
		        psgNote  As6
		        psgNote  A6
		        psgNote  Gs6
		  psgInst 123
		countedLoopStart 1
		        psgNoteL A6,6
		        psgNote  As6
		        psgNote  B6
		        psgNote  C7
		        psgNote  Cs7
		        psgNote  C7
		        psgNote  B6
		        psgNote  As6
		countedLoopEnd
		        psgNoteL A6,6
		        psgNote  As6
		        psgNote  B6
		        psgNote  C7
		        psgNote  Cs7
		        psgNote  D7
		        psgNote  Ds7
		        psgNote  E7
		  psgInst 124
		        psgNoteL Ds7,4
		        psgNote  E7
		        psgNote  Ds7
		        psgNote  E7
		        psgNote  Ds7
		        psgNote  E7
		        psgNote  Ds7
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  C7
		        psgNote  B6
		        psgNote  As6
		countedLoopStart 15
		        psgNoteL Cs5,6
		        psgNote  D5
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL F5,6
		        psgNote  Fs5
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL G5,6
		        psgNote  Gs5
		countedLoopEnd
		countedLoopStart 1
		  psgInst 0
		  length 36
		  psgInst 123
		        psgNoteL F6,6
		        psgNote  E6
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  B5
		        psgNote  As5
		        psgNote  A5
		        psgNote  Gs5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  F5
		        silence
		countedLoopEnd
		  psgInst 0
		  length 120
		  psgInst 123
		        psgNoteL Cs6,4
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  F6
		        psgNote  Fs6
		countedLoopStart 11
		        psgNoteL G6,4
		        psgNote  Gs6
		countedLoopEnd
		        psgNoteL G6,6
		  length 18
		mainLoopEnd
Music_6_Channel_7:
		  release 01h
		  vibrato 04Ch
		mainLoopStart
		  psgInst 0
		  length 24
		countedLoopStart 1
		  psgInst 123
		        psgNoteL F6,6
		        psgNote  Fs6
		        psgNote  G6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  Gs6
		        psgNote  G6
		        psgNote  Fs6
		countedLoopEnd
		        psgNoteL F6,6
		        psgNote  Fs6
		        psgNote  G6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  As6
		        psgNote  B6
		        psgNote  C7
		  psgInst 124
		        psgNoteL B6,4
		        psgNote  C7
		        psgNote  B6
		        psgNote  C7
		        psgNote  B6
		        psgNote  C7
		        psgNote  B6
		        psgNote  As6
		        psgNote  A6
		        psgNote  Gs6
		        psgNote  G6
		        psgNote  Fs6
		  psgInst 123
		countedLoopStart 1
		        psgNoteL G6,6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  As6
		        psgNote  B6
		        psgNote  As6
		        psgNote  A6
		        psgNote  Gs6
		countedLoopEnd
		        psgNoteL G6,6
		        psgNote  Gs6
		        psgNote  A6
		        psgNote  As6
		        psgNote  B6
		        psgNote  C7
		        psgNote  Cs7
		        psgNote  D7
		  psgInst 124
		        psgNoteL Cs7,4
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  C7
		        psgNote  B6
		        psgNote  As6
		        psgNote  A6
		        psgNote  Gs6
		countedLoopStart 15
		        psgNoteL A4,6
		        psgNote  As4
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL Cs5,6
		        psgNote  D5
		countedLoopEnd
		countedLoopStart 7
		        psgNoteL Ds5,6
		        psgNote  E5
		countedLoopEnd
		countedLoopStart 1
		  psgInst 0
		  length 36
		  psgInst 123
		        psgNoteL Ds6,6
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  B5
		        psgNote  As5
		        psgNote  A5
		        psgNote  Gs5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  F5
		        psgNote  E5
		        psgNote  Ds5
		        silence
		countedLoopEnd
		  psgInst 0
		  length 120
		  psgInst 123
		        psgNoteL B5,4
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		countedLoopStart 11
		        psgNoteL F6,4
		        psgNote  Fs6
		countedLoopEnd
		        psgNoteL F6,6
		  length 18
		mainLoopEnd
Music_6_Channel_9:
		channel_end
