
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
		  ymStereo 0C0h
		  ymInst 25
		  ymVol 0Eh
		  release 01h
		  vibrato 02Ch
		        noteL A1,74
		        noteL G1,42
		        noteL F1,123
		  length 24
		channel_end
Music_24_Channel_1:
		  ymStereo 0C0h
		  ymInst 26
		  ymVol 0Ch
		  release 01h
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
		  length 24
		channel_end
Music_24_Channel_2:
		  ymStereo 0C0h
		  ymInst 26
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL B3,74
		        noteL Cs5,42
		        noteL C5,123
		  length 24
		channel_end
Music_24_Channel_3:
		  ymStereo 0C0h
		  ymInst 26
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL G3,74
		        noteL E4,42
		        noteL E4,123
		  length 24
		channel_end
Music_24_Channel_4:
		  ymStereo 080h
		  shifting 020h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 18
		  ymVol 0Ah
		        noteL G4,9
		        note  Fs4
		        note  G4
		        note  B4
		        noteL D5,18
		        noteL E5,20
		        noteL Fs5,32
		        noteL G5,10
		        noteL A5,105
		  length 24
		channel_end
Music_24_Channel_5:
		  ymStereo 040h
		  shifting 010h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 9
		  ymVol 0Bh
		        note  G4
		        note  Fs4
		        note  G4
		        note  B4
		        noteL D5,18
		        noteL E5,20
		        noteL Fs5,32
		        noteL G5,10
		        noteL A5,114
		  length 24
		channel_end
Music_24_Channel_6:
		  psgInst 0
		  release 01h
		  vibrato 04Ch
		  length 71
		  psgInst 125
		        psgNoteL As5,5
		        psgNote  B5
		        psgNote  Cs6
		        psgNote  Ds6
		        psgNote  E6
		        psgNoteL Fs6,4
		        psgNote  Gs6
		        psgNote  As6
		        psgNote  B6
		        psgNote  Cs7
		        psgNoteL D7,9
		        psgNoteL E7,6
		        psgNoteL D7,5
		        psgNote  E7
		countedLoopStart 7
		        psgNoteL D7,4
		        psgNote  E7
		countedLoopEnd
		        psgNoteL D7,34
		  length 6
		  psgInst 10
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		        silence
		channel_end
Music_24_Channel_7:
		  shifting 010h
		  psgInst 0
		  release 01h
		  vibrato 04Ch
		  length 75
		  psgInst 123
		        psgNoteL As5,5
		        psgNote  B5
		        psgNote  Cs6
		        psgNote  Ds6
		        psgNote  E6
		        psgNoteL Fs6,4
		        psgNote  Gs6
		        psgNote  As6
		        psgNote  B6
		        psgNote  Cs7
		        psgNoteL D7,9
		        psgNoteL E7,6
		        psgNoteL D7,5
		        psgNote  E7
		countedLoopStart 7
		        psgNoteL D7,4
		        psgNote  E7
		countedLoopEnd
		        psgNoteL D7,36
		  length 6
		  psgInst 6
		        silence
		  psgInst 0
		        silence
		channel_end
Music_24_Channel_9:
		channel_end
