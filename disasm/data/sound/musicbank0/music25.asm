
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
		        noteL E2,24
		  sustain
		        noteL C3,6
		        note  Cs3
		        note  D3
		  setRelease 01h
		        note  Ds3
		        noteL E3,48
		        note  D3
		        noteL C3,96
		        noteL B2,48
		  sustain
		        noteL As2,192
		  setRelease 01h
		  vibrato 020h
		        noteL As2,144
		        waitL 24
		channel_end
Music_25_Channel_1:
		  stereo 0C0h
		  inst 13
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL Fs4,60
		  vol 09h
		        noteL Fs4,12
		  vol 0Ch
		        noteL Fs4,8
		  vol 09h
		        note  Fs4
		  vol 06h
		        note  Fs4
		  vol 0Ch
		        noteL A4,36
		        noteL B4,12
		        noteL Fs4,60
		  vol 09h
		        noteL Fs4,12
		  vol 0Ch
		        noteL B4,8
		  vol 09h
		        note  B4
		  vol 06h
		        note  B4
		  vol 0Ch
		        noteL Cs5,36
		        noteL Ds5,6
		  vol 09h
		        note  Ds5
		  vol 0Bh
		  sustain
		        noteL Ds5,192
		  vibrato 020h
		        noteL Ds5,144
		  vol 08h
		        noteL Ds5,6
		  vol 06h
		  setRelease 01h
		        note  Ds5
		        waitL 12
		channel_end
Music_25_Channel_2:
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL E4,60
		  vol 07h
		        noteL E4,12
		  vol 0Ah
		        noteL E4,8
		  vol 07h
		        note  E4
		  vol 04h
		        note  E4
		  vol 0Ah
		        noteL Fs4,48
		        noteL E4,96
		        noteL Fs4,48
		  sustain
		        noteL Gs4,192
		  vibrato 020h
		        noteL Gs4,144
		  vol 07h
		        noteL Gs4,6
		  vol 05h
		  setRelease 01h
		        note  Gs4
		        waitL 12
		channel_end
Music_25_Channel_3:
		  stereo 0C0h
		  inst 13
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        noteL B3,60
		  vol 07h
		        noteL B3,12
		        noteL B3,8
		  vol 07h
		        note  B3
		  vol 04h
		        note  B3
		  vol 0Ah
		        noteL E4,48
		        note  B3
		        note  A3
		        note  As3
		  sustain
		        noteL C4,192
		  vibrato 020h
		        noteL C4,144
		  vol 07h
		        noteL C4,6
		  vol 05h
		  setRelease 01h
		        note  C4
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
		        noteL Fs4,60
		  vol 08h
		        noteL Fs4,12
		  vol 0Bh
		        noteL Fs4,8
		  vol 08h
		        note  Fs4
		  vol 05h
		        note  Fs4
		  vol 0Bh
		        noteL A4,36
		        noteL B4,12
		        noteL Fs4,60
		  vol 08h
		        noteL Fs4,12
		  vol 0Bh
		        noteL B4,8
		  vol 08h
		        note  B4
		  vol 05h
		        note  B4
		  vol 0Bh
		        noteL Cs5,18
		  vibrato 00h
		  setRelease 01h
		  stereo 0C0h
		  inst 62
		  vol 08h
		        noteL C2,4
		  vol 09h
		        note  D2
		  vol 0Ah
		        note  E2
		  vol 0Bh
		        note  Fs2
		  vol 0Ch
		        note  Gs2
		  vol 0Dh
		        note  As2
		  vol 0Eh
		        noteL C3,192
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
		        psgNoteL B4,8
		        psgNote  E5
		        psgNote  A5
		        psgNote  B5
		        psgNote  A5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  B4
		        psgNote  A4
		        psgNote  Fs4
		repeatSection1Start
		        psgNoteL E4,8
		        psgNote  Fs4
		        psgNote  B4
		        psgNote  Fs4
		        psgNote  E4
		repeatEnd
		repeatSection2Start
		        psgNoteL Cs4,8
		        psgNote  Fs4
		        psgNote  As4
		        psgNote  Cs5
		        psgNote  Fs5
		  psgInst 07Ch
		repeatStart
		countedLoopStart 1
		        psgNoteL Gs5,8
		        psgNote  C6
		        psgNote  Gs5
		        psgNote  Ds6
		        psgNote  C6
		        psgNote  G5
		countedLoopEnd
		repeatSection1Start
		  psgInst 07Bh
		repeatEnd
		repeatSection2Start
		  psgInst 07Ah
		repeatEnd
		repeatSection3Start
		  psgInst 079h
		        psgNoteL Gs5,8
		        psgNote  C6
		        psgNote  Gs5
		  psgInst 078h
		        psgNote  Ds6
		        psgNote  C6
		        psgNote  G5
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
		        psgNoteL B4,8
		        psgNote  E5
		        psgNote  A5
		        psgNote  B5
		        psgNote  A5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  B4
		        psgNote  A4
		        psgNote  Fs4
		repeatSection1Start
		        psgNoteL E4,8
		        psgNote  Fs4
		        psgNote  B4
		        psgNote  Fs4
		        psgNote  E4
		repeatEnd
		repeatSection2Start
		        psgNoteL Cs4,8
		        psgNote  Fs4
		        psgNote  As4
		        psgNote  Cs5
		        psgNote  Fs5
		  psgInst 07Ah
		repeatStart
		countedLoopStart 1
		        psgNoteL Gs5,8
		        psgNote  C6
		        psgNote  Gs5
		        psgNote  Ds6
		        psgNote  C6
		        psgNote  G5
		countedLoopEnd
		repeatSection1Start
		  psgInst 079h
		repeatEnd
		repeatSection2Start
		  psgInst 078h
		repeatEnd
		repeatSection3Start
		  psgInst 077h
		        psgNoteL Gs5,8
		        psgNote  C6
		        psgNote  Gs5
		  psgInst 076h
		        psgNote  Ds6
		        psgNote  C6
		        psgNote  G5
		  psgInst 00h
		        waitL    12
		channel_end
Music_25_Channel_9:
		channel_end
