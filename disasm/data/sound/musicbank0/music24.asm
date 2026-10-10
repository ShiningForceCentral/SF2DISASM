
; ASM FILE music24.asm :
; 0xF494..0xF5B6 : Music 24
Music_24:       db 0
		db 1
		db 0
		db 0C8h
		dw Music_24_Channel_0
		dw Music_24_Channel_1
		dw Music_24_Channel_2
		dw Music_24_Channel_3
		dw Music_24_Channel_4
		dw Music_24_Channel_5
		dw Music_24_Channel_6
		dw Music_24_Channel_7
		dw Music_24_Channel_9
		dw Music_24_Channel_9
Music_24_Channel_0:
		  stereo 0C0h
		  inst 25
		  vol 0Eh
		  setRelease 01h
		  vibrato 02Ch
		        noteL A1,74
		        noteL G1,42
		        noteL F1,123
		        waitL 24
		channel_end
Music_24_Channel_1:
		  stereo 0C0h
		  inst 26
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL G4,9
		        note  Fs4
		        note  G4
		        note  B4
		        noteL D5,18
		        noteL E5,20
		        noteL Fs5,32
		        noteL G5,10
		        noteL A5,123
		        waitL 24
		channel_end
Music_24_Channel_2:
		  stereo 0C0h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL B3,74
		        noteL Cs5,42
		        noteL C5,123
		        waitL 24
		channel_end
Music_24_Channel_3:
		  stereo 0C0h
		  inst 26
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL G3,74
		        noteL E4,42
		        noteL E4,123
		        waitL 24
		channel_end
Music_24_Channel_4:
		  stereo 080h
		  shifting 020h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 18
		  vol 0Ah
		        noteL G4,9
		        note  Fs4
		        note  G4
		        note  B4
		        noteL D5,18
		        noteL E5,20
		        noteL Fs5,32
		        noteL G5,10
		        noteL A5,105
		        waitL 24
		channel_end
Music_24_Channel_5:
		  stereo 040h
		  shifting 010h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 9
		  vol 0Bh
		        note  G4
		        note  Fs4
		        note  G4
		        note  B4
		        noteL D5,18
		        noteL E5,20
		        noteL Fs5,32
		        noteL G5,10
		        noteL A5,114
		        waitL 24
		channel_end
Music_24_Channel_6:
		  psgInst 00h
		  setRelease 01h
		  vibrato 04Ch
		        waitL    71
		  psgInst 07Dh
		        psgNoteL Cs5,5
		        psgNote  D5
		        psgNote  E5
		        psgNote  Fs5
		        psgNote  G5
		        psgNoteL A5,4
		        psgNote  B5
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  E6
		        psgNoteL F6,9
		        psgNoteL G6,6
		        psgNoteL F6,5
		        psgNote  G6
		countedLoopStart 7
		        psgNoteL F6,4
		        psgNote  G6
		countedLoopEnd
		        psgNoteL F6,34
		        waitL    6
		  psgInst 0Ah
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        wait
		channel_end
Music_24_Channel_7:
		  shifting 010h
		  psgInst 00h
		  setRelease 01h
		  vibrato 04Ch
		        waitL    75
		  psgInst 07Bh
		        psgNoteL Cs5,5
		        psgNote  D5
		        psgNote  E5
		        psgNote  Fs5
		        psgNote  G5
		        psgNoteL A5,4
		        psgNote  B5
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  E6
		        psgNoteL F6,9
		        psgNoteL G6,6
		        psgNoteL F6,5
		        psgNote  G6
		countedLoopStart 7
		        psgNoteL F6,4
		        psgNote  G6
		countedLoopEnd
		        psgNoteL F6,36
		        waitL    6
		  psgInst 06h
		        wait
		  psgInst 00h
		        wait
		channel_end
Music_24_Channel_9:
		channel_end
