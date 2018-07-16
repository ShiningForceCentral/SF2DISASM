
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
		  ymStereo 0C0h
		  ymInst 12
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL E2,24
		  ymSustain
		        noteL C3,6
		        note  Cs3
		        note  D3
		  release 01h
		        note  Ds3
		        noteL E3,48
		        note  D3
		        noteL C3,96
		        noteL B2,48
		  ymSustain
		        noteL As2,192
		  release 01h
		  vibrato 020h
		        noteL As2,144
		  length 24
		channel_end
Music_25_Channel_1:
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Ch
		  release 01h
		  vibrato 02Ch
		        noteL Fs4,60
		  ymVol 09h
		        noteL Fs4,12
		  ymVol 0Ch
		        noteL Fs4,8
		  ymVol 09h
		        note  Fs4
		  ymVol 06h
		        note  Fs4
		  ymVol 0Ch
		        noteL A4,36
		        noteL B4,12
		        noteL Fs4,60
		  ymVol 09h
		        noteL Fs4,12
		  ymVol 0Ch
		        noteL B4,8
		  ymVol 09h
		        note  B4
		  ymVol 06h
		        note  B4
		  ymVol 0Ch
		        noteL Cs5,36
		        noteL Ds5,6
		  ymVol 09h
		        note  Ds5
		  ymVol 0Bh
		  ymSustain
		        noteL Ds5,192
		  vibrato 020h
		        noteL Ds5,144
		  ymVol 08h
		        noteL Ds5,6
		  ymVol 06h
		  release 01h
		        note  Ds5
		  length 12
		channel_end
Music_25_Channel_2:
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        noteL E4,60
		  ymVol 07h
		        noteL E4,12
		  ymVol 0Ah
		        noteL E4,8
		  ymVol 07h
		        note  E4
		  ymVol 04h
		        note  E4
		  ymVol 0Ah
		        noteL Fs4,48
		        noteL E4,96
		        noteL Fs4,48
		  ymSustain
		        noteL Gs4,192
		  vibrato 020h
		        noteL Gs4,144
		  ymVol 07h
		        noteL Gs4,6
		  ymVol 05h
		  release 01h
		        note  Gs4
		  length 12
		channel_end
Music_25_Channel_3:
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        noteL B3,60
		  ymVol 07h
		        noteL B3,12
		        noteL B3,8
		  ymVol 07h
		        note  B3
		  ymVol 04h
		        note  B3
		  ymVol 0Ah
		        noteL E4,48
		        note  B3
		        note  A3
		        note  As3
		  ymSustain
		        noteL C4,192
		  vibrato 020h
		        noteL C4,144
		  ymVol 07h
		        noteL C4,6
		  ymVol 05h
		  release 01h
		        note  C4
		  length 12
		channel_end
Music_25_Channel_4:
		  shifting 020h
		  ymStereo 040h
		  length 6
		  ymInst 13
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL Fs4,60
		  ymVol 08h
		        noteL Fs4,12
		  ymVol 0Bh
		        noteL Fs4,8
		  ymVol 08h
		        note  Fs4
		  ymVol 05h
		        note  Fs4
		  ymVol 0Bh
		        noteL A4,36
		        noteL B4,12
		        noteL Fs4,60
		  ymVol 08h
		        noteL Fs4,12
		  ymVol 0Bh
		        noteL B4,8
		  ymVol 08h
		        note  B4
		  ymVol 05h
		        note  B4
		  ymVol 0Bh
		        noteL Cs5,18
		  vibrato 00h
		  release 01h
		  ymStereo 0C0h
		  ymInst 62
		  ymVol 08h
		        noteL C2,4
		  ymVol 09h
		        note  D2
		  ymVol 0Ah
		        note  E2
		  ymVol 0Bh
		        note  Fs2
		  ymVol 0Ch
		        note  Gs2
		  ymVol 0Dh
		        note  As2
		  ymVol 0Eh
		        noteL C3,192
		channel_end
Music_25_Channel_5:
		  ymStereo 0C0h
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
		  release 01h
		  vibrato 04Ch
		repeatStart
		  psgInst 0
		  length 24
		  psgInst 125
		        psgNoteL Gs5,8
		        psgNote  Cs6
		        psgNote  Fs6
		        psgNote  Gs6
		        psgNote  Fs6
		        psgNote  Ds6
		        psgNote  Cs6
		        psgNote  Gs5
		        psgNote  Fs5
		        psgNote  Ds5
		repeatSection1Start
		        psgNoteL Cs5,8
		        psgNote  Ds5
		        psgNote  Gs5
		        psgNote  Ds5
		        psgNote  Cs5
		repeatEnd
		repeatSection2Start
		        psgNoteL As4,8
		        psgNote  Ds5
		        psgNote  G5
		        psgNote  As5
		        psgNote  Ds6
		  psgInst 124
		repeatStart
		countedLoopStart 1
		        psgNoteL F6,8
		        psgNote  A6
		        psgNote  F6
		        psgNote  C7
		        psgNote  A6
		        psgNote  E6
		countedLoopEnd
		repeatSection1Start
		  psgInst 123
		repeatEnd
		repeatSection2Start
		  psgInst 122
		repeatEnd
		repeatSection3Start
		  psgInst 121
		        psgNoteL F6,8
		        psgNote  A6
		        psgNote  F6
		  psgInst 120
		        psgNote  C7
		        psgNote  A6
		        psgNote  E6
		  psgInst 0
		  length 24
		channel_end
Music_25_Channel_7:
		  psgInst 0
		  length 12
		  shifting 010h
		  release 01h
		  vibrato 04Ch
		repeatStart
		  psgInst 0
		  length 24
		  psgInst 123
		        psgNoteL Gs5,8
		        psgNote  Cs6
		        psgNote  Fs6
		        psgNote  Gs6
		        psgNote  Fs6
		        psgNote  Ds6
		        psgNote  Cs6
		        psgNote  Gs5
		        psgNote  Fs5
		        psgNote  Ds5
		repeatSection1Start
		        psgNoteL Cs5,8
		        psgNote  Ds5
		        psgNote  Gs5
		        psgNote  Ds5
		        psgNote  Cs5
		repeatEnd
		repeatSection2Start
		        psgNoteL As4,8
		        psgNote  Ds5
		        psgNote  G5
		        psgNote  As5
		        psgNote  Ds6
		  psgInst 122
		repeatStart
		countedLoopStart 1
		        psgNoteL F6,8
		        psgNote  A6
		        psgNote  F6
		        psgNote  C7
		        psgNote  A6
		        psgNote  E6
		countedLoopEnd
		repeatSection1Start
		  psgInst 121
		repeatEnd
		repeatSection2Start
		  psgInst 120
		repeatEnd
		repeatSection3Start
		  psgInst 119
		        psgNoteL F6,8
		        psgNote  A6
		        psgNote  F6
		  psgInst 118
		        psgNote  C7
		        psgNote  A6
		        psgNote  E6
		  psgInst 0
		  length 12
		channel_end
Music_25_Channel_9:
		channel_end
