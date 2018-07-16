
; ASM FILE music21.asm :
; 0xF0D8..0xF243 : Music 21
Music_21:       db 0
		db 1
		db 0
		db 0D1h
		dw Music_21_Channel_0
		dw Music_21_Channel_1
		dw Music_21_Channel_2
		dw Music_21_Channel_3
		dw Music_21_Channel_4
		dw Music_21_Channel_5
		dw Music_21_Channel_6
		dw Music_21_Channel_7
		dw Music_21_Channel_9
		dw Music_21_Channel_9
Music_21_Channel_0:
		  length 6
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  ymInst 15
		  ymVol 0Bh
		        noteL Gs2,90
		  ymInst 26
		  ymVol 0Ch
		        noteL Cs2,12
		        note  Ds2
		        note  F2
		        note  G2
		  ymVol 0Bh
		  ymSustain
		        noteL Gs2,48
		  ymVol 09h
		  vibrato 020h
		        noteL Gs2,196
		  release 01h
		        noteL Gs2,192
		  length 12
		channel_end
Music_21_Channel_1:
		  length 6
		  ymStereo 0C0h
		  ymInst 15
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL As3,90
		  ymInst 26
		  ymVol 0Dh
		        noteL Gs4,48
		        noteL F4,12
		        note  G4
		        note  Gs4
		        noteL C5,14
		  ymVol 09h
		  ymSustain
		        noteL C5,194
		  vibrato 020h
		  release 01h
		        noteL C5,192
		  length 12
		channel_end
Music_21_Channel_2:
		  length 6
		  ymStereo 0C0h
		  ymInst 15
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL Ds3,90
		  ymInst 26
		  ymVol 0Ch
		        noteL Cs4,72
		        noteL Ds4,26
		  ymVol 09h
		  ymSustain
		        noteL Ds4,194
		  vibrato 020h
		  release 01h
		        noteL Ds4,192
		  length 12
		channel_end
Music_21_Channel_3:
		  length 6
		  ymStereo 0C0h
		  ymInst 15
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL Cs3,90
		  ymInst 26
		  ymVol 0Ch
		        noteL Ds3,48
		  length 24
		        noteL F3,26
		  ymInst 13
		  ymVol 0Ah
		        note  As4
		  ymVol 09h
		  ymSustain
		        noteL Gs4,24
		  ymVol 07h
		  vibrato 020h
		        noteL Gs4,144
		  release 01h
		        noteL Gs4,192
		  length 12
		channel_end
Music_21_Channel_4:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 194
		  ymInst 13
		  ymVol 0Ch
		        noteL D5,26
		  ymVol 0Bh
		  ymSustain
		        noteL Ds5,24
		  ymVol 09h
		  vibrato 020h
		        noteL Ds5,144
		  release 01h
		        noteL Ds5,192
		  length 12
		channel_end
Music_21_Channel_5:
		  shifting 020h
		  length 12
		  ymStereo 080h
		  ymInst 15
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        noteL As3,90
		  ymStereo 040h
		  ymInst 26
		  ymVol 0Ch
		        noteL Gs4,48
		        noteL F4,12
		        note  G4
		        note  Gs4
		        noteL C5,14
		  ymStereo 080h
		  ymInst 13
		  ymVol 0Bh
		        noteL D5,26
		  ymVol 0Ah
		  ymSustain
		        noteL Ds5,24
		  ymVol 08h
		  vibrato 020h
		        noteL Ds5,144
		  release 01h
		        noteL Ds5,186
		  length 12
		channel_end
Music_21_Channel_6:
		  release 01h
		  vibrato 059h
		  psgInst 0
		  length 220
		  psgInst 125
		        psgNoteL E6,24
		        psgNote  F6
		        psgNote  C7
		        psgNote  B6
		        psgNote  G6
		        psgNoteL A6,36
		        psgNoteL E7,12
		  vibrato 05Fh
		        psgNoteL D7,192
		  length 6
		  psgInst 0
		        silence
		channel_end
Music_21_Channel_7:
		  shifting 010h
		  release 01h
		  vibrato 059h
		  psgInst 0
		  length 232
		  psgInst 123
		        psgNoteL E6,24
		        psgNote  F6
		        psgNote  C7
		        psgNote  B6
		        psgNote  G6
		        psgNoteL A6,36
		        psgNoteL E7,12
		  vibrato 05Fh
		        psgNoteL D7,180
		  length 6
		  psgInst 0
		        silence
		channel_end
Music_21_Channel_9:
		channel_end
