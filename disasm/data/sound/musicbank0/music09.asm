
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
		        noteL G3,54
		        note  F3
		        noteL E3,216
		mainLoopStart
		        noteL As3,54
		        note  Gs3
		        noteL Cs3,108
		  inst 22
		  vol 0Ch
		        noteL B3,54
		        noteL G4,81
		        noteL B3,27
		        noteL As4,81
		        noteL B3,27
		        note  G4
		        note  B3
		        noteL As4,216
		  inst 27
		  vol 0Ah
		        noteL G4,36
		        note  C4
		  sustain
		        noteL Fs4,204
		  vol 08h
		        noteL Fs4,12
		  vol 06h
		        note  Fs4
		  vol 04h
		        note  Fs4
		  vol 02h
		  setRelease 01h
		        note  Fs4
		  inst 40
		  vol 0Ch
		        noteL G3,54
		        note  F3
		        noteL E3,108
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
		        note  Cs2
		  vibrato 020h
		  setRelease 01h
		        note  F2
		mainLoopStart
		  sustain
		  vibrato 02Ch
		        noteL B1,108
		  setRelease 01h
		  vibrato 020h
		        note  D2
		countedLoopStart 1
		  sustain
		  vibrato 02Ch
		        noteL F2,108
		  setRelease 01h
		  vibrato 020h
		        note  E2
		countedLoopEnd
		  sustain
		        noteL F1,216
		  vibrato 020h
		  setRelease 01h
		        note  F1
		  vibrato 02Ch
		  sustain
		        noteL Cs2,108
		  vibrato 020h
		  setRelease 01h
		        note  F2
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
		        noteL G3,54
		        note  F3
		        noteL E3,216
		mainLoopStart
		        noteL As3,54
		        note  Gs3
		        noteL Cs3,108
		  inst 22
		  vol 0Bh
		        noteL B3,54
		        noteL G4,81
		        noteL B3,27
		        noteL As4,81
		        noteL B3,27
		        note  G4
		        note  B3
		        noteL As4,216
		  inst 27
		  vol 09h
		        noteL G4,36
		        note  C4
		  sustain
		        noteL Fs4,204
		  vol 07h
		        noteL Fs4,12
		  vol 05h
		        note  Fs4
		  vol 03h
		        note  Fs4
		  vol 01h
		  setRelease 01h
		        note  Fs4
		  inst 40
		  vol 0Bh
		        noteL G3,54
		        note  F3
		        noteL E3,108
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
		        noteL Cs2,216
		  vibrato 020h
		  setRelease 01h
		        note  F2
		mainLoopStart
		  sustain
		  vibrato 02Ch
		        noteL B1,108
		  setRelease 01h
		  vibrato 020h
		        note  D2
		countedLoopStart 1
		  sustain
		  vibrato 02Ch
		        noteL F2,108
		  setRelease 01h
		  vibrato 020h
		        note  E2
		countedLoopEnd
		  sustain
		        noteL F1,216
		  vibrato 020h
		  setRelease 01h
		        note  F1
		  vibrato 02Ch
		  sustain
		        noteL Cs2,108
		  vibrato 020h
		  setRelease 01h
		        note  F2
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
		        noteL C2,6
		  vol 01h
		        note  C2
		  vol 02h
		        note  C2
		  vol 03h
		        note  C2
		  vol 04h
		        note  C2
		  vol 06h
		        note  C2
		  vol 08h
		        note  C2
		  vol 0Ah
		        note  C2
		  vol 0Ch
		        note  C2
		  vol 0Dh
		        noteL C2,108
		        waitL 216
		        wait
		mainLoopStart
		repeatStart
		        waitL 54
		  inst 62
		  vol 00h
		        noteL C2,6
		  vol 01h
		        note  C2
		  vol 02h
		        note  C2
		  vol 03h
		        note  C2
		  vol 04h
		        note  C2
		  vol 06h
		        note  C2
		  vol 08h
		        note  C2
		  vol 0Ah
		        note  C2
		  vol 0Ch
		        note  C2
		  vol 0Dh
		        noteL C2,108
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
		        noteL C2,6
		  vol 01h
		        note  C2
		  vol 02h
		        note  C2
		  vol 03h
		        note  C2
		  vol 04h
		        note  C2
		  vol 06h
		        note  C2
		  vol 08h
		        note  C2
		  vol 0Ah
		        note  C2
		  vol 0Ch
		        note  C2
		  vol 0Dh
		        noteL C2,108
		        waitL 216
		        wait
		mainLoopStart
		repeatStart
		        waitL 54
		  inst 62
		  vol 00h
		        noteL C2,6
		  vol 01h
		        note  C2
		  vol 02h
		        note  C2
		  vol 03h
		        note  C2
		  vol 04h
		        note  C2
		  vol 06h
		        note  C2
		  vol 08h
		        note  C2
		  vol 0Ah
		        note  C2
		  vol 0Ch
		        note  C2
		  vol 0Dh
		        noteL C2,108
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
		        psgNoteL As5,12
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		        psgNoteL As5,12
		  psgInst 0A6h
		        psgNote  B5
		        psgNote  Ds6
		  psgInst 0A7h
		        psgNote  F5
		        psgNote  As5
		  psgInst 0A8h
		        psgNote  B5
		        psgNote  Ds6
		  psgInst 0A9h
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		  psgInst 0AAh
		        psgNoteL As5,12
		        psgNote  B5
		  psgInst 0ABh
		        psgNote  Ds6
		        psgNote  F5
		        psgNote  As5
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		        psgNoteL As5,12
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNote  As5
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		        psgNoteL As5,12
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		mainLoopStart
		        psgNoteL As5,6
		        psgNote  D5
		        psgNote  B5
		        psgNote  E5
		        psgNote  Ds6
		        psgNote  G5
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  Gs5
		        psgNote  D5
		        psgNote  As5
		        psgNote  E5
		        psgNote  B5
		        psgNote  F5
		        psgNote  Ds6
		        psgNote  As5
		        psgNote  F5
		        psgNote  A5
		mainLoopEnd
Music_9_Channel_7:
		  shifting 010h
		  setRelease 01h
		  vibrato 04Ch
		  psgInst 00h
		        waitL    8
		  psgInst 0A3h
		        psgNoteL As5,12
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		        psgNoteL As5,12
		  psgInst 0A4h
		        psgNote  B5
		        psgNote  Ds6
		  psgInst 0A5h
		        psgNote  F5
		        psgNote  As5
		  psgInst 0A6h
		        psgNote  B5
		        psgNote  Ds6
		  psgInst 0A7h
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		  psgInst 0A8h
		        psgNoteL As5,12
		        psgNote  B5
		  psgInst 0A9h
		        psgNote  Ds6
		        psgNote  F5
		        psgNote  As5
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		        psgNoteL As5,12
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNote  As5
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		        psgNoteL Gs5,6
		        psgNote  D5
		        psgNoteL As5,12
		        psgNote  B5
		        psgNote  Ds6
		        psgNote  F5
		mainLoopStart
		        psgNoteL As5,6
		        psgNote  D5
		        psgNote  B5
		        psgNote  E5
		        psgNote  Ds6
		        psgNote  G5
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  Gs5
		        psgNote  D5
		        psgNote  As5
		        psgNote  E5
		        psgNote  B5
		        psgNote  F5
		        psgNote  Ds6
		        psgNote  As5
		        psgNote  F5
		        psgNote  A5
		mainLoopEnd
Music_9_Channel_9:
		channel_end
