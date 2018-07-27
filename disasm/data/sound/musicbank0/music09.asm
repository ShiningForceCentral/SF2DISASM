
; ASM FILE music09.asm :
; 0x8040..0x8325 : Music 09
Music_9:        db 0
		db 1
		db 0
		db 0C4h
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
		  setRelease 01h
		  vibrato 02Ch
		        waitL 216
		        wait
		        waitL 108
		  inst 40
		  vol 0Ch
		        noteL G4,54
		        note  F4
		        noteL E4,216
		mainLoopStart
		        noteL As4,54
		        note  Gs4
		        noteL Cs4,108
		  inst 22
		  vol 0Ch
		        noteL B4,54
		        noteL G5,81
		        noteL B4,27
		        noteL As5,81
		        noteL B4,27
		        note  G5
		        note  B4
		        noteL As5,216
		  inst 27
		  vol 0Ah
		        noteL G5,36
		        note  C5
		  sustain
		        noteL Fs5,204
		  vol 08h
		        noteL Fs5,12
		  vol 06h
		        note  Fs5
		  vol 04h
		        note  Fs5
		  vol 02h
		  setRelease 01h
		        note  Fs5
		  inst 40
		  vol 0Ch
		        noteL G4,54
		        note  F4
		        noteL E4,108
		mainLoopEnd
Music_9_Channel_1:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 216
		        wait
		  inst 11
		  vol 0Dh
		  sustain
		        note  Cs3
		  vibrato 020h
		  setRelease 01h
		        note  F3
		mainLoopStart
		  sustain
		  vibrato 02Ch
		        noteL B2,108
		  setRelease 01h
		  vibrato 020h
		        note  D3
		countedLoopStart 1
		  sustain
		  vibrato 02Ch
		        noteL F3,108
		  setRelease 01h
		  vibrato 020h
		        note  E3
		countedLoopEnd
		  sustain
		        noteL F2,216
		  vibrato 020h
		  setRelease 01h
		        note  F2
		  vibrato 02Ch
		  sustain
		        noteL Cs3,108
		  vibrato 020h
		  setRelease 01h
		        note  F3
		mainLoopEnd
Music_9_Channel_2:
		  stereo 080h
		  shifting 010h
		  vol 00h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 222
		        wait
		        waitL 108
		  inst 40
		  vol 0Bh
		        noteL G4,54
		        note  F4
		        noteL E4,216
		mainLoopStart
		        noteL As4,54
		        note  Gs4
		        noteL Cs4,108
		  inst 22
		  vol 0Bh
		        noteL B4,54
		        noteL G5,81
		        noteL B4,27
		        noteL As5,81
		        noteL B4,27
		        note  G5
		        note  B4
		        noteL As5,216
		  inst 27
		  vol 09h
		        noteL G5,36
		        note  C5
		  sustain
		        noteL Fs5,204
		  vol 07h
		        noteL Fs5,12
		  vol 05h
		        note  Fs5
		  vol 03h
		        note  Fs5
		  vol 01h
		  setRelease 01h
		        note  Fs5
		  inst 40
		  vol 0Bh
		        noteL G4,54
		        note  F4
		        noteL E4,108
		mainLoopEnd
Music_9_Channel_3:
		  shifting 020h
		  stereo 040h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 222
		        wait
		  inst 11
		  vol 0Ch
		  sustain
		        noteL Cs3,216
		  vibrato 020h
		  setRelease 01h
		        note  F3
		mainLoopStart
		  sustain
		  vibrato 02Ch
		        noteL B2,108
		  setRelease 01h
		  vibrato 020h
		        note  D3
		countedLoopStart 1
		  sustain
		  vibrato 02Ch
		        noteL F3,108
		  setRelease 01h
		  vibrato 020h
		        note  E3
		countedLoopEnd
		  sustain
		        noteL F2,216
		  vibrato 020h
		  setRelease 01h
		        note  F2
		  vibrato 02Ch
		  sustain
		        noteL Cs3,108
		  vibrato 020h
		  setRelease 01h
		        note  F3
		mainLoopEnd
Music_9_Channel_4:
		  stereo 040h
		  vibrato 02Ch
		  setRelease 00h
		        waitL 108
		        wait
		        wait
		        waitL 54
		  inst 62
		  vol 00h
		        noteL C3,6
		  vol 01h
		        note  C3
		  vol 02h
		        note  C3
		  vol 03h
		        note  C3
		  vol 04h
		        note  C3
		  vol 06h
		        note  C3
		  vol 08h
		        note  C3
		  vol 0Ah
		        note  C3
		  vol 0Ch
		        note  C3
		  vol 0Dh
		        noteL C3,108
		        waitL 216
		        wait
		mainLoopStart
		repeatStart
		        waitL 54
		  inst 62
		  vol 00h
		        noteL C3,6
		  vol 01h
		        note  C3
		  vol 02h
		        note  C3
		  vol 03h
		        note  C3
		  vol 04h
		        note  C3
		  vol 06h
		        note  C3
		  vol 08h
		        note  C3
		  vol 0Ah
		        note  C3
		  vol 0Ch
		        note  C3
		  vol 0Dh
		        noteL C3,108
		        wait
		repeatSection1Start
		        waitL 216
		repeatEnd
		repeatSection2Start
		repeatEnd
		repeatSection3Start
		        waitL 108
		mainLoopEnd
Music_9_Channel_5:
		  shifting 020h
		  stereo 080h
		  vibrato 02Ch
		  setRelease 00h
		        waitL 111
		        waitL 108
		        wait
		        waitL 54
		  inst 62
		  vol 00h
		        noteL C3,6
		  vol 01h
		        note  C3
		  vol 02h
		        note  C3
		  vol 03h
		        note  C3
		  vol 04h
		        note  C3
		  vol 06h
		        note  C3
		  vol 08h
		        note  C3
		  vol 0Ah
		        note  C3
		  vol 0Ch
		        note  C3
		  vol 0Dh
		        noteL C3,108
		        waitL 216
		        wait
		mainLoopStart
		repeatStart
		        waitL 54
		  inst 62
		  vol 00h
		        noteL C3,6
		  vol 01h
		        note  C3
		  vol 02h
		        note  C3
		  vol 03h
		        note  C3
		  vol 04h
		        note  C3
		  vol 06h
		        note  C3
		  vol 08h
		        note  C3
		  vol 0Ah
		        note  C3
		  vol 0Ch
		        note  C3
		  vol 0Dh
		        noteL C3,108
		        wait
		repeatSection1Start
		        waitL 216
		repeatEnd
		repeatSection2Start
		repeatEnd
		repeatSection3Start
		        waitL 108
		mainLoopEnd
Music_9_Channel_6:
		  setRelease 01h
		  vibrato 04Ch
		  psgInst 0A5h
		        psgNoteL As4,12
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		        psgNoteL As4,12
		  psgInst 0A6h
		        psgNote  B4
		        psgNote  Ds5
		  psgInst 0A7h
		        psgNote  F4
		        psgNote  As4
		  psgInst 0A8h
		        psgNote  B4
		        psgNote  Ds5
		  psgInst 0A9h
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		  psgInst 0AAh
		        psgNoteL As4,12
		        psgNote  B4
		  psgInst 0ABh
		        psgNote  Ds5
		        psgNote  F4
		        psgNote  As4
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		        psgNoteL As4,12
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNote  As4
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		        psgNoteL As4,12
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		mainLoopStart
		        psgNoteL As4,6
		        psgNote  D4
		        psgNote  B4
		        psgNote  E4
		        psgNote  Ds5
		        psgNote  G4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  Gs4
		        psgNote  D4
		        psgNote  As4
		        psgNote  E4
		        psgNote  B4
		        psgNote  F4
		        psgNote  Ds5
		        psgNote  As4
		        psgNote  F4
		        psgNote  A4
		mainLoopEnd
Music_9_Channel_7:
		  shifting 010h
		  setRelease 01h
		  vibrato 04Ch
		  psgInst 00h
		        waitL    8
		  psgInst 0A3h
		        psgNoteL As4,12
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		        psgNoteL As4,12
		  psgInst 0A4h
		        psgNote  B4
		        psgNote  Ds5
		  psgInst 0A5h
		        psgNote  F4
		        psgNote  As4
		  psgInst 0A6h
		        psgNote  B4
		        psgNote  Ds5
		  psgInst 0A7h
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		  psgInst 0A8h
		        psgNoteL As4,12
		        psgNote  B4
		  psgInst 0A9h
		        psgNote  Ds5
		        psgNote  F4
		        psgNote  As4
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		        psgNoteL As4,12
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNote  As4
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		        psgNoteL Gs4,6
		        psgNote  D4
		        psgNoteL As4,12
		        psgNote  B4
		        psgNote  Ds5
		        psgNote  F4
		mainLoopStart
		        psgNoteL As4,6
		        psgNote  D4
		        psgNote  B4
		        psgNote  E4
		        psgNote  Ds5
		        psgNote  G4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  Gs4
		        psgNote  D4
		        psgNote  As4
		        psgNote  E4
		        psgNote  B4
		        psgNote  F4
		        psgNote  Ds5
		        psgNote  As4
		        psgNote  F4
		        psgNote  A4
		mainLoopEnd
Music_9_Channel_9:
		channel_end
