
; ASM FILE music25.asm :
; 0xF5B6..0xF803 : Music 25
Music_25:       db 0
		db 0
		db 0
		db 0CEh
		dw Music_25_Channel_0
		dw Music_25_Channel_1
		dw Music_25_Channel_2
		dw Music_25_Channel_3
		dw Music_25_Channel_4
		dw Music_25_Channel_5
		dw Music_25_Channel_6
		dw Music_25_Channel_7
		dw Music_25_Channel_9
		dw Music_25_Channel_9
Music_25_Channel_0:
		  stereo 0C0h
		  inst 12
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL E3,24
		  sustain
		        noteL C4,6
		        note  Cs4
		        note  D4
		  setRelease 01h
		        note  Ds4
		        noteL E4,48
		        note  D4
		        noteL C4,96
		        noteL B3,48
		  sustain
		        noteL As3,192
		  setRelease 01h
		  vibrato 020h
		        noteL As3,144
		        waitL 24
		channel_end
Music_25_Channel_1:
		  stereo 0C0h
		  inst 13
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL Fs5,60
		  vol 09h
		        noteL Fs5,12
		  vol 0Ch
		        noteL Fs5,8
		  vol 09h
		        note  Fs5
		  vol 06h
		        note  Fs5
		  vol 0Ch
		        noteL A5,36
		        noteL B5,12
		        noteL Fs5,60
		  vol 09h
		        noteL Fs5,12
		  vol 0Ch
		        noteL B5,8
		  vol 09h
		        note  B5
		  vol 06h
		        note  B5
		  vol 0Ch
		        noteL Cs6,36
		        noteL Ds6,6
		  vol 09h
		        note  Ds6
		  vol 0Bh
		  sustain
		        noteL Ds6,192
		  vibrato 020h
		        noteL Ds6,144
		  vol 08h
		        noteL Ds6,6
		  vol 06h
		  setRelease 01h
		        note  Ds6
		        waitL 12
		channel_end
Music_25_Channel_2:
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL E5,60
		  vol 07h
		        noteL E5,12
		  vol 0Ah
		        noteL E5,8
		  vol 07h
		        note  E5
		  vol 04h
		        note  E5
		  vol 0Ah
		        noteL Fs5,48
		        noteL E5,96
		        noteL Fs5,48
		  sustain
		        noteL Gs5,192
		  vibrato 020h
		        noteL Gs5,144
		  vol 07h
		        noteL Gs5,6
		  vol 05h
		  setRelease 01h
		        note  Gs5
		        waitL 12
		channel_end
Music_25_Channel_3:
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL B4,60
		  vol 07h
		        noteL B4,12
		        noteL B4,8
		  vol 07h
		        note  B4
		  vol 04h
		        note  B4
		  vol 0Ah
		        noteL E5,48
		        note  B4
		        note  A4
		        note  As4
		  sustain
		        noteL C5,192
		  vibrato 020h
		        noteL C5,144
		  vol 07h
		        noteL C5,6
		  vol 05h
		  setRelease 01h
		        note  C5
		        waitL 12
		channel_end
Music_25_Channel_4:
		  shifting 020h
		  stereo 040h
		        waitL 6
		  inst 13
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL Fs5,60
		  vol 08h
		        noteL Fs5,12
		  vol 0Bh
		        noteL Fs5,8
		  vol 08h
		        note  Fs5
		  vol 05h
		        note  Fs5
		  vol 0Bh
		        noteL A5,36
		        noteL B5,12
		        noteL Fs5,60
		  vol 08h
		        noteL Fs5,12
		  vol 0Bh
		        noteL B5,8
		  vol 08h
		        note  B5
		  vol 05h
		        note  B5
		  vol 0Bh
		        noteL Cs6,18
		  vibrato 00h
		  setRelease 01h
		  stereo 0C0h
		  inst 62
		  vol 08h
		        noteL C3,4
		  vol 09h
		        note  D3
		  vol 0Ah
		        note  E3
		  vol 0Bh
		        note  Fs3
		  vol 0Ch
		        note  Gs3
		  vol 0Dh
		        note  As3
		  vol 0Eh
		        noteL C4,192
		channel_end
Music_25_Channel_5:
		  stereo 0C0h
		        sampleL 0,24
		        sampleL 2,3
		        sample  2
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		        sample  4
		        sampleL 2,12
		        sample  3
		        sampleL 2,24
		        sampleL 2,12
		        sampleL 2,4
		        sample  3
		        sample  3
		        sampleL 2,12
		        sample  3
		        sampleL 0,24
		        sampleL 2,3
		        sample  2
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		        sample  4
		        sampleL 2,12
		        sample  3
		        sampleL 2,24
		        sampleL 2,6
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,18
		        sampleL 1,6
		        sampleL 0,96
		channel_end
Music_25_Channel_6:
		  setRelease 01h
		  vibrato 04Ch
		repeatStart
		  psgInst 00h
		        waitL    24
		  psgInst 07Dh
		        psgNoteL B3,8
		        psgNote  E4
		        psgNote  A4
		        psgNote  B4
		        psgNote  A4
		        psgNote  Fs4
		        psgNote  E4
		        psgNote  B3
		        psgNote  A3
		        psgNote  Fs3
		repeatSection1Start
		        psgNoteL E3,8
		        psgNote  Fs3
		        psgNote  B3
		        psgNote  Fs3
		        psgNote  E3
		repeatEnd
		repeatSection2Start
		        psgNoteL Cs3,8
		        psgNote  Fs3
		        psgNote  As3
		        psgNote  Cs4
		        psgNote  Fs4
		  psgInst 07Ch
		repeatStart
		countedLoopStart 1
		        psgNoteL Gs4,8
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  G4
		countedLoopEnd
		repeatSection1Start
		  psgInst 07Bh
		repeatEnd
		repeatSection2Start
		  psgInst 07Ah
		repeatEnd
		repeatSection3Start
		  psgInst 079h
		        psgNoteL Gs4,8
		        psgNote  C5
		        psgNote  Gs4
		  psgInst 078h
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  G4
		  psgInst 00h
		        waitL    24
		channel_end
Music_25_Channel_7:
		  psgInst 00h
		        waitL    12
		  shifting 010h
		  setRelease 01h
		  vibrato 04Ch
		repeatStart
		  psgInst 00h
		        waitL    24
		  psgInst 07Bh
		        psgNoteL B3,8
		        psgNote  E4
		        psgNote  A4
		        psgNote  B4
		        psgNote  A4
		        psgNote  Fs4
		        psgNote  E4
		        psgNote  B3
		        psgNote  A3
		        psgNote  Fs3
		repeatSection1Start
		        psgNoteL E3,8
		        psgNote  Fs3
		        psgNote  B3
		        psgNote  Fs3
		        psgNote  E3
		repeatEnd
		repeatSection2Start
		        psgNoteL Cs3,8
		        psgNote  Fs3
		        psgNote  As3
		        psgNote  Cs4
		        psgNote  Fs4
		  psgInst 07Ah
		repeatStart
		countedLoopStart 1
		        psgNoteL Gs4,8
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  G4
		countedLoopEnd
		repeatSection1Start
		  psgInst 079h
		repeatEnd
		repeatSection2Start
		  psgInst 078h
		repeatEnd
		repeatSection3Start
		  psgInst 077h
		        psgNoteL Gs4,8
		        psgNote  C5
		        psgNote  Gs4
		  psgInst 076h
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  G4
		  psgInst 00h
		        waitL    12
		channel_end
Music_25_Channel_9:
		channel_end
