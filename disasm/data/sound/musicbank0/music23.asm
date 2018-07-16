
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
		  ymStereo 0C0h
		  ymInst 25
		  ymVol 0Eh
		  release 01h
		  vibrato 02Ch
		  ymSustain
		        noteL A1,108
		  vibrato 020h
		  release 01h
		        noteL A1,182
		  vibrato 02Ch
		        noteL G1,42
		        noteL F1,123
		  length 24
		channel_end
Music_23_Channel_1:
		  ymStereo 0C0h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 18
		  ymVol 0Ch
		        note  Fs3
		        note  G3
		        note  D4
		        note  Cs4
		        note  A3
		        noteL B3,108
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
Music_23_Channel_2:
		  ymStereo 0C0h
		  ymInst 63
		  release 01h
		  vibrato 02Ch
		  length 36
		  ymVol 0Bh
		        note  D3
		        note  E3
		        note  Fs3
		        note  G3
		        note  A3
		        noteL B3,74
		        noteL Cs5,42
		        noteL C5,123
		  length 24
		channel_end
Music_23_Channel_3:
		  ymStereo 0C0h
		  ymInst 63
		  release 01h
		  vibrato 02Ch
		  length 36
		  ymVol 0Bh
		        note  B2
		        note  Cs3
		        note  D3
		        note  E3
		        note  Fs3
		        noteL G3,74
		        noteL E4,42
		        noteL E4,123
		  length 24
		channel_end
Music_23_Channel_4:
		  ymStereo 080h
		  shifting 020h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 36
		  ymVol 0Ah
		        noteL Fs3,18
		        note  G3
		        note  D4
		        note  Cs4
		        note  A3
		        noteL B3,108
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
Music_23_Channel_5:
		  ymStereo 040h
		  shifting 010h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 27
		  ymVol 0Bh
		        noteL Fs3,18
		        note  G3
		        note  D4
		        note  Cs4
		        note  A3
		        noteL B3,108
		        noteL G4,9
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
Music_23_Channel_6:
		  psgInst 0
		  release 01h
		  vibrato 04Ch
		  length 108
		  psgInst 125
		        psgNoteL Gs5,27
		        psgNoteL Ds6,9
		        psgNoteL Cs6,18
		        psgNote  As5
		        psgNote  B5
		        psgNote  Fs6
		        psgNoteL E6,71
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
Music_23_Channel_7:
		  shifting 010h
		  psgInst 0
		  release 01h
		  vibrato 04Ch
		  length 117
		  psgInst 123
		        psgNoteL Gs5,27
		        psgNoteL Ds6,9
		        psgNoteL Cs6,18
		        psgNote  As5
		        psgNote  B5
		        psgNote  Fs6
		        psgNoteL E6,66
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
Music_23_Channel_9:
		channel_end
