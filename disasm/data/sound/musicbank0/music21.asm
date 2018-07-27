
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
		        waitL 6
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		  inst 15
		  vol 0Bh
		        noteL Gs3,90
		  inst 26
		  vol 0Ch
		        noteL Cs3,12
		        note  Ds3
		        note  F3
		        note  G3
		  vol 0Bh
		  sustain
		        noteL Gs3,48
		  vol 09h
		  vibrato 020h
		        noteL Gs3,196
		  setRelease 01h
		        noteL Gs3,192
		        waitL 12
		channel_end
Music_21_Channel_1:
		        waitL 6
		  stereo 0C0h
		  inst 15
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL As4,90
		  inst 26
		  vol 0Dh
		        noteL Gs5,48
		        noteL F5,12
		        note  G5
		        note  Gs5
		        noteL C6,14
		  vol 09h
		  sustain
		        noteL C6,194
		  vibrato 020h
		  setRelease 01h
		        noteL C6,192
		        waitL 12
		channel_end
Music_21_Channel_2:
		        waitL 6
		  stereo 0C0h
		  inst 15
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL Ds4,90
		  inst 26
		  vol 0Ch
		        noteL Cs5,72
		        noteL Ds5,26
		  vol 09h
		  sustain
		        noteL Ds5,194
		  vibrato 020h
		  setRelease 01h
		        noteL Ds5,192
		        waitL 12
		channel_end
Music_21_Channel_3:
		        waitL 6
		  stereo 0C0h
		  inst 15
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL Cs4,90
		  inst 26
		  vol 0Ch
		        noteL Ds4,48
		        waitL 24
		        noteL F4,26
		  inst 13
		  vol 0Ah
		        note  As5
		  vol 09h
		  sustain
		        noteL Gs5,24
		  vol 07h
		  vibrato 020h
		        noteL Gs5,144
		  setRelease 01h
		        noteL Gs5,192
		        waitL 12
		channel_end
Music_21_Channel_4:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 194
		  inst 13
		  vol 0Ch
		        noteL D6,26
		  vol 0Bh
		  sustain
		        noteL Ds6,24
		  vol 09h
		  vibrato 020h
		        noteL Ds6,144
		  setRelease 01h
		        noteL Ds6,192
		        waitL 12
		channel_end
Music_21_Channel_5:
		  shifting 020h
		        waitL 12
		  stereo 080h
		  inst 15
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL As4,90
		  stereo 040h
		  inst 26
		  vol 0Ch
		        noteL Gs5,48
		        noteL F5,12
		        note  G5
		        note  Gs5
		        noteL C6,14
		  stereo 080h
		  inst 13
		  vol 0Bh
		        noteL D6,26
		  vol 0Ah
		  sustain
		        noteL Ds6,24
		  vol 08h
		  vibrato 020h
		        noteL Ds6,144
		  setRelease 01h
		        noteL Ds6,186
		        waitL 12
		channel_end
Music_21_Channel_6:
		  setRelease 01h
		  vibrato 059h
		  psgInst 00h
		        waitL    220
		  psgInst 07Dh
		        psgNoteL G4,24
		        psgNote  Gs4
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  As4
		        psgNoteL C5,36
		        psgNoteL G5,12
		  vibrato 05Fh
		        psgNoteL F5,192
		        waitL    6
		  psgInst 00h
		        wait
		channel_end
Music_21_Channel_7:
		  shifting 010h
		  setRelease 01h
		  vibrato 059h
		  psgInst 00h
		        waitL    232
		  psgInst 07Bh
		        psgNoteL G4,24
		        psgNote  Gs4
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  As4
		        psgNoteL C5,36
		        psgNoteL G5,12
		  vibrato 05Fh
		        psgNoteL F5,180
		        waitL    6
		  psgInst 00h
		        wait
		channel_end
Music_21_Channel_9:
		channel_end
