
; ASM FILE music23.asm :
; 0xF32A..0xF494 : Music 23
Music_23:       db 0
		db 1
		db 0
		db 0C8h
		dw Music_23_Channel_0
		dw Music_23_Channel_1
		dw Music_23_Channel_2
		dw Music_23_Channel_3
		dw Music_23_Channel_4
		dw Music_23_Channel_5
		dw Music_23_Channel_6
		dw Music_23_Channel_7
		dw Music_23_Channel_9
		dw Music_23_Channel_9
Music_23_Channel_0:
		  stereo 0C0h
		  inst 25
		  vol 0Eh
		  setRelease 01h
		  vibrato 02Ch
		  sustain
		        noteL A2,108
		  vibrato 020h
		  setRelease 01h
		        noteL A2,182
		  vibrato 02Ch
		        noteL G2,42
		        noteL F2,123
		        waitL 24
		channel_end
Music_23_Channel_1:
		  stereo 0C0h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 18
		  vol 0Ch
		        note  Fs4
		        note  G4
		        note  D5
		        note  Cs5
		        note  A4
		        noteL B4,108
		        noteL G5,9
		        note  Fs5
		        note  G5
		        note  B5
		        noteL D6,18
		        noteL E6,20
		        noteL Fs6,32
		        noteL G6,10
		        noteL A6,123
		        waitL 24
		channel_end
Music_23_Channel_2:
		  stereo 0C0h
		  inst 63
		  setRelease 01h
		  vibrato 02Ch
		        waitL 36
		  vol 0Bh
		        note  D4
		        note  E4
		        note  Fs4
		        note  G4
		        note  A4
		        noteL B4,74
		        noteL Cs6,42
		        noteL C6,123
		        waitL 24
		channel_end
Music_23_Channel_3:
		  stereo 0C0h
		  inst 63
		  setRelease 01h
		  vibrato 02Ch
		        waitL 36
		  vol 0Bh
		        note  B3
		        note  Cs4
		        note  D4
		        note  E4
		        note  Fs4
		        noteL G4,74
		        noteL E5,42
		        noteL E5,123
		        waitL 24
		channel_end
Music_23_Channel_4:
		  stereo 080h
		  shifting 020h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 36
		  vol 0Ah
		        noteL Fs4,18
		        note  G4
		        note  D5
		        note  Cs5
		        note  A4
		        noteL B4,108
		        noteL G5,9
		        note  Fs5
		        note  G5
		        note  B5
		        noteL D6,18
		        noteL E6,20
		        noteL Fs6,32
		        noteL G6,10
		        noteL A6,105
		        waitL 24
		channel_end
Music_23_Channel_5:
		  stereo 040h
		  shifting 010h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 27
		  vol 0Bh
		        noteL Fs4,18
		        note  G4
		        note  D5
		        note  Cs5
		        note  A4
		        noteL B4,108
		        noteL G5,9
		        note  Fs5
		        note  G5
		        note  B5
		        noteL D6,18
		        noteL E6,20
		        noteL Fs6,32
		        noteL G6,10
		        noteL A6,114
		        waitL 24
		channel_end
Music_23_Channel_6:
		  psgInst 00h
		  setRelease 01h
		  vibrato 04Ch
		        waitL    108
		  psgInst 07Dh
		        psgNoteL B3,27
		        psgNoteL Fs4,9
		        psgNoteL E4,18
		        psgNote  Cs4
		        psgNote  D4
		        psgNote  A4
		        psgNoteL G4,71
		        psgNoteL Cs4,5
		        psgNote  D4
		        psgNote  E4
		        psgNote  Fs4
		        psgNote  G4
		        psgNoteL A4,4
		        psgNote  B4
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  E5
		        psgNoteL F5,9
		        psgNoteL G5,6
		        psgNoteL F5,5
		        psgNote  G5
		countedLoopStart 7
		        psgNoteL F5,4
		        psgNote  G5
		countedLoopEnd
		        psgNoteL F5,34
		        waitL    6
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        wait
		channel_end
Music_23_Channel_7:
		  shifting 010h
		  psgInst 00h
		  setRelease 01h
		  vibrato 04Ch
		        waitL    117
		  psgInst 07Bh
		        psgNoteL B3,27
		        psgNoteL Fs4,9
		        psgNoteL E4,18
		        psgNote  Cs4
		        psgNote  D4
		        psgNote  A4
		        psgNoteL G4,66
		        psgNoteL Cs4,5
		        psgNote  D4
		        psgNote  E4
		        psgNote  Fs4
		        psgNote  G4
		        psgNoteL A4,4
		        psgNote  B4
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  E5
		        psgNoteL F5,9
		        psgNoteL G5,6
		        psgNoteL F5,5
		        psgNote  G5
		countedLoopStart 7
		        psgNoteL F5,4
		        psgNote  G5
		countedLoopEnd
		        psgNoteL F5,36
		        waitL    6
		  psgInst 06h
		        wait
		  psgInst 00h
		        wait
		channel_end
Music_23_Channel_9:
		channel_end
