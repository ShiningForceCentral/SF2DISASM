
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
		        noteL Gs2,90
		  inst 26
		  vol 0Ch
		        noteL Cs2,12
		        note  Ds2
		        note  F2
		        note  G2
		  vol 0Bh
		  sustain
		        noteL Gs2,48
		  vol 09h
		  vibrato 020h
		        noteL Gs2,196
		  setRelease 01h
		        noteL Gs2,192
		        waitL 12
		channel_end
Music_21_Channel_1:
		        waitL 6
		  stereo 0C0h
		  inst 15
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL As3,90
		  inst 26
		  vol 0Dh
		        noteL Gs4,48
		        noteL F4,12
		        note  G4
		        note  Gs4
		        noteL C5,14
		  vol 09h
		  sustain
		        noteL C5,194
		  vibrato 020h
		  setRelease 01h
		        noteL C5,192
		        waitL 12
		channel_end
Music_21_Channel_2:
		        waitL 6
		  stereo 0C0h
		  inst 15
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL Ds3,90
		  inst 26
		  vol 0Ch
		        noteL Cs4,72
		        noteL Ds4,26
		  vol 09h
		  sustain
		        noteL Ds4,194
		  vibrato 020h
		  setRelease 01h
		        noteL Ds4,192
		        waitL 12
		channel_end
Music_21_Channel_3:
		        waitL 6
		  stereo 0C0h
		  inst 15
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL Cs3,90
		  inst 26
		  vol 0Ch
		        noteL Ds3,48
		        waitL 24
		        noteL F3,26
		  inst 13
		  vol 0Ah
		        note  As4
		  vol 09h
		  sustain
		        noteL Gs4,24
		  vol 07h
		  vibrato 020h
		        noteL Gs4,144
		  setRelease 01h
		        noteL Gs4,192
		        waitL 12
		channel_end
Music_21_Channel_4:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 194
		  inst 13
		  vol 0Ch
		        noteL D5,26
		  vol 0Bh
		  sustain
		        noteL Ds5,24
		  vol 09h
		  vibrato 020h
		        noteL Ds5,144
		  setRelease 01h
		        noteL Ds5,192
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
		        noteL As3,90
		  stereo 040h
		  inst 26
		  vol 0Ch
		        noteL Gs4,48
		        noteL F4,12
		        note  G4
		        note  Gs4
		        noteL C5,14
		  stereo 080h
		  inst 13
		  vol 0Bh
		        noteL D5,26
		  vol 0Ah
		  sustain
		        noteL Ds5,24
		  vol 08h
		  vibrato 020h
		        noteL Ds5,144
		  setRelease 01h
		        noteL Ds5,186
		        waitL 12
		channel_end
Music_21_Channel_6:
		  setRelease 01h
		  vibrato 059h
		  psgInst 00h
		        waitL    220
		  psgInst 07Dh
		        psgNoteL G5,24
		        psgNote  Gs5
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  As5
		        psgNoteL C6,36
		        psgNoteL G6,12
		  vibrato 05Fh
		        psgNoteL F6,192
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
		        psgNoteL G5,24
		        psgNote  Gs5
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  As5
		        psgNoteL C6,36
		        psgNoteL G6,12
		  vibrato 05Fh
		        psgNoteL F6,180
		        waitL    6
		  psgInst 00h
		        wait
		channel_end
Music_21_Channel_9:
		channel_end
