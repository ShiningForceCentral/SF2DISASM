
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
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 216
		        silence
		  length 108
		  ymInst 40
		  ymVol 0Ch
		        noteL G3,54
		        note  F3
		        noteL E3,216
		mainLoopStart
		        noteL As3,54
		        note  Gs3
		        noteL Cs3,108
		  ymInst 22
		  ymVol 0Ch
		        noteL B3,54
		        noteL G4,81
		        noteL B3,27
		        noteL As4,81
		        noteL B3,27
		        note  G4
		        note  B3
		        noteL As4,216
		  ymInst 27
		  ymVol 0Ah
		        noteL G4,36
		        note  C4
		  ymSustain
		        noteL Fs4,204
		  ymVol 08h
		        noteL Fs4,12
		  ymVol 06h
		        note  Fs4
		  ymVol 04h
		        note  Fs4
		  ymVol 02h
		  release 01h
		        note  Fs4
		  ymInst 40
		  ymVol 0Ch
		        noteL G3,54
		        note  F3
		        noteL E3,108
		mainLoopEnd
Music_9_Channel_1:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 216
		        silence
		  ymInst 11
		  ymVol 0Dh
		  ymSustain
		        note  Cs2
		  vibrato 020h
		  release 01h
		        note  F2
		mainLoopStart
		  ymSustain
		  vibrato 02Ch
		        noteL B1,108
		  release 01h
		  vibrato 020h
		        note  D2
		countedLoopStart 1
		  ymSustain
		  vibrato 02Ch
		        noteL F2,108
		  release 01h
		  vibrato 020h
		        note  E2
		countedLoopEnd
		  ymSustain
		        noteL F1,216
		  vibrato 020h
		  release 01h
		        note  F1
		  vibrato 02Ch
		  ymSustain
		        noteL Cs2,108
		  vibrato 020h
		  release 01h
		        note  F2
		mainLoopEnd
Music_9_Channel_2:
		  ymStereo 080h
		  shifting 010h
		  ymVol 00h
		  release 01h
		  vibrato 02Ch
		  length 222
		        silence
		  length 108
		  ymInst 40
		  ymVol 0Bh
		        noteL G3,54
		        note  F3
		        noteL E3,216
		mainLoopStart
		        noteL As3,54
		        note  Gs3
		        noteL Cs3,108
		  ymInst 22
		  ymVol 0Bh
		        noteL B3,54
		        noteL G4,81
		        noteL B3,27
		        noteL As4,81
		        noteL B3,27
		        note  G4
		        note  B3
		        noteL As4,216
		  ymInst 27
		  ymVol 09h
		        noteL G4,36
		        note  C4
		  ymSustain
		        noteL Fs4,204
		  ymVol 07h
		        noteL Fs4,12
		  ymVol 05h
		        note  Fs4
		  ymVol 03h
		        note  Fs4
		  ymVol 01h
		  release 01h
		        note  Fs4
		  ymInst 40
		  ymVol 0Bh
		        noteL G3,54
		        note  F3
		        noteL E3,108
		mainLoopEnd
Music_9_Channel_3:
		  shifting 020h
		  ymStereo 040h
		  release 01h
		  vibrato 02Ch
		  length 222
		        silence
		  ymInst 11
		  ymVol 0Ch
		  ymSustain
		        noteL Cs2,216
		  vibrato 020h
		  release 01h
		        note  F2
		mainLoopStart
		  ymSustain
		  vibrato 02Ch
		        noteL B1,108
		  release 01h
		  vibrato 020h
		        note  D2
		countedLoopStart 1
		  ymSustain
		  vibrato 02Ch
		        noteL F2,108
		  release 01h
		  vibrato 020h
		        note  E2
		countedLoopEnd
		  ymSustain
		        noteL F1,216
		  vibrato 020h
		  release 01h
		        note  F1
		  vibrato 02Ch
		  ymSustain
		        noteL Cs2,108
		  vibrato 020h
		  release 01h
		        note  F2
		mainLoopEnd
Music_9_Channel_4:
		  ymStereo 040h
		  vibrato 02Ch
		  release 00h
		  length 108
		        silence
		        silence
		  length 54
		  ymInst 62
		  ymVol 00h
		        noteL C2,6
		  ymVol 01h
		        note  C2
		  ymVol 02h
		        note  C2
		  ymVol 03h
		        note  C2
		  ymVol 04h
		        note  C2
		  ymVol 06h
		        note  C2
		  ymVol 08h
		        note  C2
		  ymVol 0Ah
		        note  C2
		  ymVol 0Ch
		        note  C2
		  ymVol 0Dh
		        noteL C2,108
		  length 216
		        silence
		mainLoopStart
		repeatStart
		  length 54
		  ymInst 62
		  ymVol 00h
		        noteL C2,6
		  ymVol 01h
		        note  C2
		  ymVol 02h
		        note  C2
		  ymVol 03h
		        note  C2
		  ymVol 04h
		        note  C2
		  ymVol 06h
		        note  C2
		  ymVol 08h
		        note  C2
		  ymVol 0Ah
		        note  C2
		  ymVol 0Ch
		        note  C2
		  ymVol 0Dh
		        noteL C2,108
		        silence
		repeatSection1Start
		  length 216
		repeatEnd
		repeatSection2Start
		repeatEnd
		repeatSection3Start
		  length 108
		mainLoopEnd
Music_9_Channel_5:
		  shifting 020h
		  ymStereo 080h
		  vibrato 02Ch
		  release 00h
		  length 111
		  length 108
		        silence
		  length 54
		  ymInst 62
		  ymVol 00h
		        noteL C2,6
		  ymVol 01h
		        note  C2
		  ymVol 02h
		        note  C2
		  ymVol 03h
		        note  C2
		  ymVol 04h
		        note  C2
		  ymVol 06h
		        note  C2
		  ymVol 08h
		        note  C2
		  ymVol 0Ah
		        note  C2
		  ymVol 0Ch
		        note  C2
		  ymVol 0Dh
		        noteL C2,108
		  length 216
		        silence
		mainLoopStart
		repeatStart
		  length 54
		  ymInst 62
		  ymVol 00h
		        noteL C2,6
		  ymVol 01h
		        note  C2
		  ymVol 02h
		        note  C2
		  ymVol 03h
		        note  C2
		  ymVol 04h
		        note  C2
		  ymVol 06h
		        note  C2
		  ymVol 08h
		        note  C2
		  ymVol 0Ah
		        note  C2
		  ymVol 0Ch
		        note  C2
		  ymVol 0Dh
		        noteL C2,108
		        silence
		repeatSection1Start
		  length 216
		repeatEnd
		repeatSection2Start
		repeatEnd
		repeatSection3Start
		  length 108
		mainLoopEnd
Music_9_Channel_6:
		  release 01h
		  vibrato 04Ch
		  psgInst 165
		        psgNoteL G6,12
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		        psgNoteL G6,12
		  psgInst 166
		        psgNote  Gs6
		        psgNote  C7
		  psgInst 167
		        psgNote  D6
		        psgNote  G6
		  psgInst 168
		        psgNote  Gs6
		        psgNote  C7
		  psgInst 169
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		  psgInst 170
		        psgNoteL G6,12
		        psgNote  Gs6
		  psgInst 171
		        psgNote  C7
		        psgNote  D6
		        psgNote  G6
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		        psgNoteL G6,12
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNote  G6
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		        psgNoteL G6,12
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		mainLoopStart
		        psgNoteL G6,6
		        psgNote  B5
		        psgNote  Gs6
		        psgNote  Cs6
		        psgNote  C7
		        psgNote  E6
		        psgNote  D6
		        psgNote  As5
		        psgNote  F6
		        psgNote  B5
		        psgNote  G6
		        psgNote  Cs6
		        psgNote  Gs6
		        psgNote  D6
		        psgNote  C7
		        psgNote  G6
		        psgNote  D6
		        psgNote  Fs6
		mainLoopEnd
Music_9_Channel_7:
		  shifting 010h
		  release 01h
		  vibrato 04Ch
		  psgInst 0
		  length 8
		  psgInst 163
		        psgNoteL G6,12
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		        psgNoteL G6,12
		  psgInst 164
		        psgNote  Gs6
		        psgNote  C7
		  psgInst 165
		        psgNote  D6
		        psgNote  G6
		  psgInst 166
		        psgNote  Gs6
		        psgNote  C7
		  psgInst 167
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		  psgInst 168
		        psgNoteL G6,12
		        psgNote  Gs6
		  psgInst 169
		        psgNote  C7
		        psgNote  D6
		        psgNote  G6
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		        psgNoteL G6,12
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNote  G6
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		        psgNoteL F6,6
		        psgNote  B5
		        psgNoteL G6,12
		        psgNote  Gs6
		        psgNote  C7
		        psgNote  D6
		mainLoopStart
		        psgNoteL G6,6
		        psgNote  B5
		        psgNote  Gs6
		        psgNote  Cs6
		        psgNote  C7
		        psgNote  E6
		        psgNote  D6
		        psgNote  As5
		        psgNote  F6
		        psgNote  B5
		        psgNote  G6
		        psgNote  Cs6
		        psgNote  Gs6
		        psgNote  D6
		        psgNote  C7
		        psgNote  G6
		        psgNote  D6
		        psgNote  Fs6
		mainLoopEnd
Music_9_Channel_9:
		channel_end
