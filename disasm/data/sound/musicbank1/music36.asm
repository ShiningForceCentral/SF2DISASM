
; ASM FILE music36.asm :
; 0xA011..0xAFFC : Music 36
Music_36:       db 0
		db 0
		db 0
		db 0CDh
		dw Music_4_Channel_0
		dw Music_4_Channel_1
		dw Music_4_Channel_2
		dw Music_4_Channel_3
		dw Music_4_Channel_4
		dw Music_4_Channel_5
		dw Music_4_Channel_6
		dw Music_4_Channel_7
		dw Music_4_Channel_9
		dw Music_4_Channel_9
Music_4_Channel_0:
		  ymStereo 0C0h
		  ymInst 21
		  ymVol 0Ch
		  release 01h
		  vibrato 02Ch
		        noteL Gs1,0
		  ymSlide 017h
		        noteL Gs2,48
		  ymStopSlide
		mainLoopStart
		        noteL Cs3,24
		        note  C3
		        note  Gs2
		        note  E2
		repeatStart
		        noteL Cs2,84
		  ymSustain
		        noteL Gs3,4
		        note  As3
		  release 01h
		        note  C4
		        noteL Cs4,6
		  ymVol 09h
		        note  Cs4
		  ymVol 0Ch
		        note  Cs4
		        note  Cs4
		        noteL Gs3,12
		        noteL E3,6
		        note  Ds3
		        note  E3
		        note  Cs3
		        note  Gs2
		        note  G2
		        note  Gs2
		        note  E2
		        note  Cs2
		        note  C2
		        noteL B1,84
		  ymSustain
		        noteL Gs3,4
		        note  A3
		  release 01h
		        note  As3
		        noteL B3,6
		  ymVol 09h
		        note  B3
		  ymVol 0Ch
		        note  B3
		        note  B3
		        noteL A3,12
		        noteL F3,6
		        note  Ds3
		        note  F3
		        note  Ds3
		        note  B2
		        note  A2
		        note  B2
		        note  A2
		        note  F2
		        note  Cs2
		        noteL Ds2,36
		  ymSustain
		        noteL As2,4
		        note  C3
		  release 01h
		        note  D3
		        noteL Ds3,24
		        noteL As2,6
		        note  Fs2
		  ymVol 09h
		        note  Fs2
		  ymVol 06h
		        note  Fs2
		  ymVol 0Ch
		        noteL A1,36
		  ymSustain
		        noteL F3,4
		        note  Fs3
		  release 01h
		        note  G3
		        noteL A3,24
		        noteL Ds3,6
		        note  B2
		  ymVol 09h
		        note  B2
		  ymVol 06h
		        note  B2
		countedLoopStart 1
		  ymVol 0Ch
		  release 03h
		        noteL D2,12
		        noteL D3,6
		        note  D3
		        note  D3
		  ymVol 07h
		        note  D3
		  ymVol 0Ch
		        note  D3
		        note  D3
		        noteL G1,12
		        noteL G2,6
		        note  G2
		        note  G2
		  ymVol 07h
		        note  G2
		  ymVol 0Ch
		        note  G2
		        note  G2
		countedLoopEnd
		  release 01h
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL D2,12
		  length 210
		        silence
		  ymInst 12
		  ymVol 0Dh
		        noteL B1,0
		  ymSlide 05h
		        noteL Cs2,192
		  ymStopSlide
		  ymInst 21
		  ymVol 0Ch
		  ymSustain
		        noteL Cs3,3
		        note  C3
		        note  B2
		        note  As2
		        note  A2
		        note  Gs2
		        note  G2
		        note  Fs2
		  release 01h
		        note  F2
		  length 189
		  ymInst 12
		  ymVol 0Dh
		        noteL A1,0
		  ymSlide 05h
		        noteL B1,168
		  ymStopSlide
		  ymInst 21
		  ymVol 0Ch
		  ymSustain
		        noteL B2,3
		        note  As2
		        note  A2
		        note  Gs2
		        note  G2
		        note  Fs2
		        note  F2
		        note  E2
		  release 01h
		        note  Ds2
		  length 165
		  ymInst 12
		  ymVol 0Dh
		        noteL Cs2,0
		  ymSlide 05h
		        noteL Ds2,96
		  ymStopSlide
		  ymInst 21
		  ymVol 0Ch
		  ymSustain
		        noteL Ds3,3
		        note  D3
		        note  Cs3
		        note  C3
		        note  B2
		        note  As2
		        note  A2
		        note  Gs2
		  release 01h
		        note  G2
		  length 69
		  ymInst 12
		  ymVol 0Dh
		        noteL G1,0
		  ymSlide 05h
		        noteL A1,96
		  ymStopSlide
		  ymInst 21
		  ymVol 0Ch
		  ymSustain
		        noteL A2,3
		        note  Gs2
		        note  G2
		        note  Fs2
		        note  F2
		        note  E2
		        note  Ds2
		        note  D2
		  release 01h
		        note  Cs2
		  length 69
		  ymInst 12
		  ymVol 0Dh
		        noteL C2,0
		  ymSlide 05h
		        noteL D2,96
		  ymStopSlide
		        noteL F2,0
		  ymSlide 05h
		        noteL G2,96
		  ymStopSlide
		  ymInst 21
		  ymVol 0Ch
		  release 09h
		countedLoopStart 6
		        noteL Gs3,12
		        note  G3
		        note  Ds3
		        note  C3
		        note  B2
		        note  C3
		        note  Ds3
		        note  Fs3
		countedLoopEnd
		        noteL Gs3,12
		        note  G3
		        note  Ds3
		        note  Fs3
		        note  Gs3
		        note  Ds3
		  release 01h
		        noteL Gs2,24
		mainLoopEnd
Music_4_Channel_1:
		  ymStereo 0C0h
		  ymInst 26
		  ymVol 0Ch
		  release 01h
		  vibrato 02Ch
		        noteL G5,6
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		mainLoopStart
		  release 00h
		        noteL Cs6,4
		        note  Ds6
		        note  Cs6
		        note  Ds6
		        note  Cs6
		        note  Ds6
		  release 01h
		        noteL Cs6,24
		        noteL Ds5,6
		        note  G4
		        note  Gs4
		        note  E5
		        note  C5
		        note  Cs5
		        note  Gs5
		  ymVol 0Ah
		        note  Gs5
		countedLoopStart 1
		  ymInst 13
		  ymVol 0Ch
		        noteL C5,30
		  ymVol 0Ah
		        noteL C5,6
		  ymVol 0Ch
		        note  C5
		        note  C5
		        noteL C5,18
		        note  Gs4
		        noteL E5,108
		  ymVol 0Ah
		        noteL E5,6
		  ymVol 08h
		        note  E5
		  length 12
		  ymVol 0Ch
		        noteL Cs5,24
		        noteL D5,18
		        note  G5
		        noteL Ds5,96
		  ymVol 0Ah
		        noteL Ds5,6
		  ymVol 08h
		        note  Ds5
		  ymVol 0Ch
		        noteL D5,30
		  ymVol 0Ah
		        noteL D5,6
		  ymVol 0Ch
		        note  D5
		        note  D5
		        noteL D5,18
		        noteL As4,6
		  ymVol 0Ah
		        note  As4
		  ymVol 08h
		        note  As4
		  ymVol 0Ch
		        noteL Fs5,48
		        noteL F5,6
		        note  E5
		        noteL Ds5,12
		        noteL B4,6
		  ymVol 0Ah
		        note  B4
		  ymVol 08h
		        note  B4
		        silence
		  ymVol 0Ch
		        noteL Cs5,204
		countedLoopEnd
		  ymInst 26
		  ymVol 0Ch
		        noteL Gs6,6
		        note  G6
		        note  Fs6
		        note  D6
		        note  Cs6
		        note  As5
		        note  A5
		        note  Fs5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  A4
		        note  Gs4
		        note  F4
		        note  E4
		        note  Cs4
		  release 00h
		countedLoopStart 11
		        noteL As3,4
		        note  B3
		countedLoopEnd
		  ymSustain
		  release 01h
		        noteL As3,16
		  ymVol 08h
		        note  As3
		  release 01h
		  ymVol 06h
		        note  As3
		  length 192
		  ymInst 1
		  ymVol 0Ch
		        note  C5
		repeatStart
		  ymSustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  ymVol 0Ah
		        noteL E4,6
		  ymVol 07h
		  release 01h
		        note  E4
		  ymVol 0Ah
		repeatEnd
		repeatSection2Start
		  ymVol 07h
		        noteL E4,6
		  release 01h
		  ymVol 05h
		        note  E4
		  ymVol 08h
		repeatEnd
		repeatSection3Start
		  ymVol 06h
		        noteL E4,6
		  release 01h
		  ymVol 04h
		        note  E4
		  ymVol 07h
		repeatStart
		  ymSustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  ymVol 05h
		        noteL E4,6
		  ymVol 03h
		  release 01h
		        note  E4
		  ymVol 06h
		repeatEnd
		repeatSection2Start
		  ymVol 04h
		        noteL E4,6
		  release 01h
		  ymVol 02h
		        note  E4
		        silence
		  ymVol 0Ch
		        noteL Ds5,168
		repeatStart
		  ymSustain
		        noteL Ds5,3
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        noteL G4,6
		repeatSection1Start
		  ymVol 0Ah
		        noteL G4,6
		  ymVol 07h
		  release 01h
		        note  G4
		  ymVol 0Ah
		repeatEnd
		repeatSection2Start
		  ymVol 07h
		        noteL G4,6
		  ymVol 05h
		  release 01h
		        note  G4
		  ymVol 08h
		repeatEnd
		repeatSection3Start
		  ymVol 06h
		        noteL G4,6
		  ymVol 04h
		  release 01h
		        note  G4
		  ymVol 07h
		repeatStart
		  ymSustain
		        noteL Ds5,3
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		repeatSection1Start
		        noteL Gs4,3
		  ymVol 05h
		        noteL G4,6
		  ymVol 03h
		        note  G4
		  release 01h
		        note  G4
		  ymVol 06h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL Gs4,3
		  ymVol 0Ch
		        noteL D5,96
		repeatStart
		  ymSustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        noteL Fs4,6
		repeatSection1Start
		  ymVol 0Ah
		        noteL Fs4,6
		  ymVol 07h
		  release 01h
		        note  Fs4
		  ymVol 0Ah
		repeatEnd
		repeatSection2Start
		  ymVol 07h
		        noteL Fs4,6
		  release 01h
		  ymVol 05h
		        note  Fs4
		  ymVol 08h
		  ymSustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		  release 01h
		        note  B4
		  ymVol 0Ch
		        noteL Fs5,96
		repeatStart
		  ymSustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        noteL As4,6
		repeatSection1Start
		  ymVol 0Ah
		        noteL As4,6
		  ymVol 07h
		  release 01h
		        note  As4
		  ymVol 0Ah
		repeatEnd
		repeatSection2Start
		  ymVol 07h
		        noteL As4,6
		  ymVol 05h
		  release 01h
		        note  As4
		  ymVol 08h
		  ymSustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		  release 01h
		        note  Ds5
		  ymVol 0Ch
		        noteL Cs5,56
		  ymVol 09h
		        noteL Cs5,8
		  ymVol 0Ch
		        note  Cs5
		  ymVol 09h
		        note  Cs5
		  ymVol 0Ch
		        note  Cs5
		  ymVol 09h
		        note  Cs5
		  ymVol 0Ch
		        noteL Cs5,96
		repeatStart
		  ymSustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        noteL F4,6
		repeatSection1Start
		  ymVol 0Ah
		        noteL F4,6
		  ymVol 07h
		  release 01h
		        note  F4
		  ymVol 0Ah
		repeatEnd
		repeatSection2Start
		  ymVol 07h
		        noteL F4,6
		  release 01h
		  ymVol 05h
		        note  F4
		  ymVol 08h
		repeatEnd
		repeatSection3Start
		  ymVol 06h
		        noteL F4,6
		  release 01h
		  ymVol 04h
		        note  F4
		  ymVol 07h
		repeatStart
		  ymSustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		repeatSection1Start
		        noteL Fs4,3
		        noteL F4,6
		  ymVol 05h
		        note  F4
		  ymVol 03h
		  release 01h
		        note  F4
		  ymVol 06h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL Fs4,3
		  ymInst 44
		  ymVol 0Ch
		        noteL Fs5,4
		        note  A5
		        noteL Gs5,76
		        noteL D6,16
		        noteL As5,4
		        note  Gs5
		        note  F5
		        note  B4
		        note  D5
		        note  Fs5
		        note  G5
		        noteL E5,88
		        noteL G5,6
		        noteL Gs5,66
		repeatStart
		  ymInst 26
		  ymVol 0Ch
		        noteL G4,6
		        note  B3
		        note  D4
		        note  G4
		        note  Gs4
		        note  C4
		        note  Fs4
		        note  Gs4
		  ymVol 0Ah
		        note  Gs4
		  release 03h
		  ymInst 13
		  ymVol 0Bh
		repeatSection1Start
		        noteL Ds5,12
		        noteL Ds5,6
		        noteL Ds5,12
		        noteL Ds5,6
		        note  Ds5
		  release 01h
		repeatEnd
		repeatSection2Start
		        noteL Fs5,12
		        noteL Fs5,6
		        noteL Fs5,12
		        noteL Fs5,6
		        note  Fs5
		  release 01h
		  ymInst 26
		  ymVol 0Ch
		        note  G5
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		        note  B5
		        note  D5
		        note  G5
		        note  B5
		        note  C6
		        note  Fs5
		        note  Gs5
		        note  C6
		mainLoopEnd
Music_4_Channel_2:
		  ymStereo 0C0h
		  ymInst 26
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL G4,24
		        note  Gs4
		mainLoopStart
		  ymInst 27
		  ymVol 09h
		  release 07h
		        noteL E4,16
		        note  E4
		        note  E4
		  release 01h
		        noteL E4,48
		countedLoopStart 1
		  ymInst 20
		  ymVol 0Ah
		        noteL Cs4,102
		  ymVol 07h
		        noteL Cs4,6
		  ymVol 05h
		        note  Cs4
		  ymVol 0Ah
		        noteL Cs4,18
		        noteL Gs3,12
		        noteL E4,18
		        noteL As3,30
		        noteL B3,108
		  ymVol 07h
		        noteL B3,6
		  ymVol 0Ah
		        noteL B3,18
		        noteL F3,12
		        noteL Fs3,18
		        note  A3
		        noteL As3,12
		        noteL Ds4,96
		        noteL B3,48
		        note  G3
		  ymVol 07h
		        noteL G3,6
		  ymVol 05h
		        note  G3
		  length 12
		  ymInst 27
		  ymVol 0Ah
		        noteL Gs3,24
		        noteL F4,48
		  release 06h
		        noteL Fs4,16
		        note  Fs4
		        note  Fs4
		  release 01h
		        noteL F4,48
		countedLoopEnd
		  ymInst 26
		  ymVol 0Bh
		        noteL Cs6,12
		  ymVol 09h
		        noteL Cs6,6
		  ymVol 07h
		        note  Cs6
		  length 204
		        silence
		  ymInst 1
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 31
		        noteL Gs4,3
		  ymSlide 020h
		        note  A4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL Gs4,3
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        noteL C4,6
		repeatSection1Start
		  ymVol 08h
		        noteL C4,6
		  ymVol 05h
		  release 01h
		        note  C4
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL C4,6
		  release 01h
		  ymVol 03h
		        note  C4
		  ymVol 06h
		repeatEnd
		repeatSection3Start
		  ymVol 04h
		        noteL C4,6
		  release 01h
		  ymVol 02h
		        note  C4
		  ymVol 05h
		repeatStart
		  ymSustain
		        noteL Gs4,3
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        noteL C4,6
		repeatSection1Start
		  ymVol 03h
		        noteL C4,6
		  ymVol 01h
		  release 01h
		        note  C4
		  ymVol 04h
		repeatEnd
		repeatSection2Start
		  ymVol 02h
		        noteL C4,6
		  release 01h
		  ymVol 00h
		        note  C4
		        silence
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 27
		        noteL A4,3
		  ymSlide 020h
		        note  As4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        noteL Cs4,6
		repeatSection1Start
		  ymVol 08h
		        noteL Cs4,6
		  ymVol 05h
		  release 01h
		        note  Cs4
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL Cs4,6
		  ymVol 03h
		  release 01h
		        note  Cs4
		  ymVol 06h
		repeatEnd
		repeatSection3Start
		  ymVol 04h
		        noteL Cs4,6
		  ymVol 02h
		  release 01h
		        note  Cs4
		  ymVol 05h
		repeatStart
		  ymSustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		repeatSection1Start
		        noteL D4,3
		  ymVol 03h
		        noteL Cs4,6
		  ymVol 01h
		        note  Cs4
		  release 01h
		        note  Cs4
		  ymVol 04h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL D4,3
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 15
		        noteL As4,3
		  ymSlide 020h
		        note  B4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL As4,3
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        noteL D4,6
		repeatSection1Start
		  ymVol 08h
		        noteL D4,6
		  ymVol 05h
		  release 01h
		        note  D4
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL D4,6
		  release 01h
		  ymVol 03h
		        note  D4
		  ymVol 06h
		  ymSustain
		        noteL As4,3
		        note  A4
		        note  Gs4
		  release 01h
		        note  G4
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 15
		        noteL B4,3
		  ymSlide 020h
		        note  Cs5
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL B4,3
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        noteL Ds4,6
		repeatSection1Start
		  ymVol 08h
		        noteL Ds4,6
		  ymVol 05h
		  release 01h
		        note  Ds4
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL Ds4,6
		  ymVol 03h
		  release 01h
		        note  Ds4
		  ymVol 06h
		  ymSustain
		        noteL B4,3
		        note  As4
		        note  A4
		  release 01h
		        note  Gs4
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 15
		        noteL Fs4,3
		  ymSlide 020h
		        note  Gs4
		countedLoopEnd
		countedLoopStart 15
		        noteL A4,3
		        note  G4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        noteL Cs4,6
		repeatSection1Start
		  ymVol 08h
		        noteL Cs4,6
		  ymVol 05h
		  release 01h
		        note  Cs4
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL Cs4,6
		  release 01h
		  ymVol 03h
		        note  Cs4
		  ymVol 06h
		repeatEnd
		repeatSection3Start
		  ymVol 04h
		        noteL Cs4,6
		  release 01h
		  ymVol 02h
		        note  Cs4
		  ymVol 05h
		repeatStart
		  ymSustain
		        noteL A4,3
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		repeatSection1Start
		        noteL D4,3
		        noteL Cs4,6
		  ymVol 03h
		        note  Cs4
		  ymVol 01h
		  release 01h
		        note  Cs4
		  ymVol 04h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL D4,3
		  length 48
		  ymInst 7
		  ymVol 0Ah
		        noteL D5,6
		        noteL Ds5,106
		        noteL D5,16
		        note  A4
		        noteL F4,96
		  ymInst 44
		  ymVol 0Ch
		        noteL D5,4
		        note  Ds5
		        noteL Cs5,20
		        noteL Gs5,4
		        note  B5
		        noteL G5,18
		  release 03h
		  ymInst 13
		  ymVol 0Ah
		        noteL Cs5,12
		        noteL Cs5,6
		        noteL Cs5,12
		        noteL Cs5,6
		        note  Cs5
		  release 01h
		  ymInst 9
		  ymVol 0Bh
		        noteL Cs4,4
		        note  F4
		        note  As4
		        note  F5
		        note  D5
		  ymVol 09h
		        note  D5
		  ymVol 0Bh
		        noteL A5,18
		        noteL E5,4
		        note  Ds5
		        note  As4
		  release 03h
		  ymInst 13
		  ymVol 0Ah
		        noteL Ds5,12
		        noteL Ds5,6
		        noteL Ds5,12
		        noteL Ds5,6
		        note  Ds5
		  release 01h
		  ymInst 7
		  ymVol 0Ah
		        note  Gs4
		        note  E4
		        note  D4
		        note  Fs4
		        noteL Cs5,4
		        noteL C5,20
		  ymInst 26
		  ymVol 0Bh
		        noteL D5,24
		        note  Ds5
		mainLoopEnd
Music_4_Channel_3:
		  ymStereo 0C0h
		  ymInst 26
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL B3,24
		        note  C4
		mainLoopStart
		  ymInst 27
		  ymVol 09h
		  release 07h
		        noteL Gs3,16
		        note  Gs3
		        note  Gs3
		  release 01h
		        noteL Gs3,48
		countedLoopStart 1
		  length 6
		  ymStereo 080h
		  shifting 020h
		  ymInst 20
		  ymVol 09h
		        noteL Cs4,108
		  ymVol 06h
		        noteL Cs4,6
		  ymVol 04h
		        note  Cs4
		  ymVol 09h
		        noteL Cs4,18
		        noteL Gs3,12
		        noteL E4,18
		        noteL As3,30
		        noteL B3,108
		  ymVol 06h
		        noteL B3,6
		  ymVol 09h
		        noteL B3,18
		        noteL F3,12
		        noteL Fs3,18
		        note  A3
		        noteL As3,12
		        noteL Ds4,96
		        noteL B3,48
		        note  G3
		  ymVol 06h
		        noteL G3,6
		  ymVol 04h
		        note  G3
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 27
		  ymVol 0Ah
		        noteL Fs3,24
		        noteL A3,48
		  release 06h
		        noteL Gs3,16
		        note  Gs3
		        note  Gs3
		  release 01h
		        noteL A3,48
		countedLoopEnd
		  ymInst 26
		  ymVol 0Bh
		        noteL E5,12
		  shifting 020h
		  ymStereo 040h
		  ymInst 26
		  ymVol 0Ah
		        noteL Gs6,6
		        note  G6
		        note  Fs6
		        note  D6
		        note  Cs6
		        note  As5
		        note  A5
		        note  Fs5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  A4
		        note  Gs4
		        note  F4
		        note  E4
		        note  Cs4
		  release 00h
		countedLoopStart 11
		        noteL As3,4
		        note  B3
		countedLoopEnd
		  ymSustain
		  release 01h
		        noteL As3,16
		  ymVol 06h
		        note  As3
		  release 01h
		  ymVol 04h
		        note  As3
		  length 180
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 1
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 31
		        noteL E4,3
		  ymSlide 020h
		        note  Ds4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL E4,3
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        noteL Gs3,6
		repeatSection1Start
		  ymVol 08h
		        noteL Gs3,6
		  ymVol 05h
		  release 01h
		        note  Gs3
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL Gs3,6
		  release 01h
		  ymVol 03h
		        note  Gs3
		  ymVol 06h
		repeatEnd
		repeatSection3Start
		  ymVol 04h
		        noteL Gs3,6
		  release 01h
		  ymVol 02h
		        note  Gs3
		  ymVol 05h
		repeatStart
		  ymSustain
		        noteL E4,3
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        noteL Gs3,6
		repeatSection1Start
		  ymVol 03h
		        noteL Gs3,6
		  ymVol 01h
		  release 01h
		        note  Gs3
		  ymVol 04h
		repeatEnd
		repeatSection2Start
		  ymVol 02h
		        noteL Gs3,6
		  release 01h
		  ymVol 00h
		        note  Gs3
		        silence
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 27
		        noteL F4,3
		  ymSlide 020h
		        note  Fs4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL F4,3
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        noteL A3,6
		repeatSection1Start
		  ymVol 08h
		        noteL A3,6
		  ymVol 05h
		  release 01h
		        note  A3
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL A3,6
		  ymVol 03h
		  release 01h
		        note  A3
		  ymVol 06h
		repeatEnd
		repeatSection3Start
		  ymVol 04h
		        noteL A3,6
		  ymVol 02h
		  release 01h
		        note  A3
		  ymVol 05h
		repeatStart
		  ymSustain
		        noteL F4,3
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		repeatSection1Start
		        noteL As3,3
		  ymVol 03h
		        noteL A3,6
		  ymVol 01h
		        note  A3
		  release 01h
		        note  A3
		  ymVol 04h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL As3,3
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 15
		        noteL G4,3
		  ymSlide 020h
		        note  Fs4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        noteL B3,6
		repeatSection1Start
		  ymVol 08h
		        noteL B3,6
		  ymVol 05h
		  release 01h
		        note  B3
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL B3,6
		  release 01h
		  ymVol 03h
		        note  B3
		  ymVol 06h
		  ymSustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		  release 01h
		        note  E4
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 15
		        noteL G4,3
		  ymSlide 020h
		        note  A4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		        note  E4
		        note  Ds4
		        note  D4
		        note  Cs4
		        note  C4
		        noteL B3,6
		repeatSection1Start
		  ymVol 08h
		        noteL B3,6
		  ymVol 05h
		  release 01h
		        note  B3
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL B3,6
		  ymVol 03h
		  release 01h
		        note  B3
		  ymVol 06h
		  ymSustain
		        noteL G4,3
		        note  Fs4
		        note  F4
		  release 01h
		        note  E4
		  ymVol 0Ah
		  ymSustain
		countedLoopStart 15
		        noteL D4,3
		  ymSlide 020h
		        note  Cs4
		countedLoopEnd
		countedLoopStart 15
		        noteL Ds4,3
		        note  F4
		countedLoopEnd
		  ymStopSlide
		repeatStart
		  ymSustain
		        noteL Ds4,3
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		        note  Gs3
		        noteL G3,6
		repeatSection1Start
		  ymVol 08h
		        noteL G3,6
		  ymVol 05h
		  release 01h
		        note  G3
		  ymVol 08h
		repeatEnd
		repeatSection2Start
		  ymVol 05h
		        noteL G3,6
		  release 01h
		  ymVol 03h
		        note  G3
		  ymVol 06h
		repeatEnd
		repeatSection3Start
		  ymVol 04h
		        noteL G3,6
		  release 01h
		  ymVol 02h
		        note  G3
		  ymVol 05h
		repeatStart
		  ymSustain
		        noteL Ds4,3
		        note  D4
		        note  Cs4
		        note  C4
		        note  B3
		        note  As3
		        note  A3
		repeatSection1Start
		        noteL Gs3,3
		        noteL G3,6
		  ymVol 03h
		        note  G3
		  ymVol 01h
		  release 01h
		        note  G3
		  ymVol 04h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL Gs3,3
		  length 54
		  ymStereo 080h
		  shifting 020h
		  ymInst 7
		  ymVol 09h
		        noteL D5,6
		        noteL Ds5,84
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 9
		  ymVol 0Bh
		        noteL A3,4
		        note  Cs4
		        note  G4
		        note  As4
		        note  Ds5
		        note  Fs5
		        noteL C6,16
		        noteL G5,4
		        note  E5
		        note  Cs5
		        note  A4
		        note  F4
		        note  Ds4
		  ymVol 09h
		        note  Ds4
		  ymVol 07h
		        note  Ds4
		  ymVol 0Bh
		        noteL As4,16
		        noteL C5,4
		        note  As4
		        note  C5
		        note  As4
		        note  C5
		        note  Ds5
		        note  D5
		        note  A4
		        noteL As4,6
		        note  C5
		        noteL B4,12
		  ymVol 09h
		        noteL B4,6
		  ymStereo 080h
		  shifting 020h
		  ymInst 44
		  ymVol 0Bh
		        noteL D5,4
		        note  Ds5
		        noteL Cs5,20
		        noteL Gs5,4
		        note  B5
		        noteL G5,12
		  release 03h
		  shifting 00h
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Ah
		        note  E4
		        noteL E4,6
		        noteL E4,12
		        noteL E4,6
		        note  E4
		        silence
		  release 01h
		  ymStereo 080h
		  shifting 020h
		  ymInst 9
		  ymVol 0Ah
		        noteL Cs4,4
		        note  F4
		        note  As4
		        note  F5
		        note  D5
		  ymVol 08h
		        note  D5
		  ymVol 0Ah
		        noteL A5,18
		        noteL E5,6
		  release 03h
		  shifting 00h
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Ah
		        noteL G4,12
		        noteL G4,6
		        noteL G4,12
		        noteL G4,6
		        note  G4
		  release 01h
		  ymInst 26
		  ymVol 0Bh
		        noteL G4,24
		        note  Gs4
		        note  B4
		        note  C5
		mainLoopEnd
Music_4_Channel_4:
		  length 6
		  shifting 020h
		  ymStereo 080h
		  ymInst 26
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        note  G5
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		mainLoopStart
		  release 00h
		        noteL Cs6,4
		        note  Ds6
		        note  Cs6
		        note  Ds6
		        note  Cs6
		        note  Ds6
		  release 01h
		        noteL Cs6,24
		        noteL Ds5,6
		        note  G4
		        note  Gs4
		        note  E5
		        note  C5
		        note  Cs5
		        note  Gs5
		  ymVol 09h
		        note  Gs5
		countedLoopStart 1
		  ymStereo 040h
		  ymInst 13
		  ymVol 0Bh
		        noteL C5,30
		  ymVol 09h
		        noteL C5,6
		  ymVol 0Bh
		        note  C5
		        note  C5
		        noteL C5,18
		        note  Gs4
		        noteL E5,108
		  ymVol 09h
		        noteL E5,6
		  ymVol 07h
		        note  E5
		  length 12
		  ymVol 0Bh
		        noteL Cs5,24
		        noteL D5,18
		        note  G5
		        noteL Ds5,96
		  ymVol 09h
		        noteL Ds5,6
		  ymVol 07h
		        note  Ds5
		  ymVol 0Bh
		        noteL D5,30
		  ymVol 09h
		        noteL D5,6
		  ymVol 0Bh
		        note  D5
		        note  D5
		        noteL D5,18
		        noteL As4,6
		  ymVol 09h
		        note  As4
		  ymVol 07h
		        note  As4
		  ymVol 0Bh
		        noteL Fs5,48
		        noteL F5,6
		        note  E5
		        noteL Ds5,12
		        noteL B4,6
		  ymVol 09h
		        note  B4
		  ymVol 07h
		        note  B4
		        silence
		  ymVol 0Bh
		        noteL Cs5,36
		  ymStereo 080h
		  ymInst 27
		  ymVol 09h
		        noteL Gs3,24
		        noteL F4,48
		  release 06h
		        noteL Fs4,16
		        note  Fs4
		        note  Fs4
		  release 01h
		        noteL F4,48
		countedLoopEnd
		  shifting 010h
		  ymInst 26
		  ymVol 0Bh
		        noteL Gs6,6
		        note  G6
		        note  Fs6
		        note  D6
		        note  Cs6
		        note  As5
		        note  A5
		        note  Fs5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  A4
		        note  Gs4
		        note  F4
		        note  E4
		        note  Cs4
		  release 00h
		countedLoopStart 11
		        noteL As3,4
		        note  B3
		countedLoopEnd
		  ymSustain
		  release 01h
		        noteL As3,16
		  ymVol 07h
		        note  As3
		  release 01h
		  ymVol 05h
		        note  As3
		  length 204
		  ymStereo 040h
		  shifting 020h
		  ymInst 1
		  ymVol 0Bh
		        noteL C5,192
		repeatStart
		  ymSustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  ymVol 09h
		        noteL E4,6
		  ymVol 06h
		  release 01h
		        note  E4
		  ymVol 09h
		repeatEnd
		repeatSection2Start
		  ymVol 06h
		        noteL E4,6
		  release 01h
		  ymVol 04h
		        note  E4
		  ymVol 07h
		repeatEnd
		repeatSection3Start
		  ymVol 05h
		        noteL E4,6
		  release 01h
		  ymVol 03h
		        note  E4
		  ymVol 06h
		repeatStart
		  ymSustain
		        noteL C5,3
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        note  F4
		        noteL E4,6
		repeatSection1Start
		  ymVol 04h
		        noteL E4,6
		  ymVol 02h
		  release 01h
		        note  E4
		  ymVol 05h
		repeatEnd
		repeatSection2Start
		  ymVol 03h
		        noteL E4,6
		  release 01h
		  ymVol 01h
		        note  E4
		        silence
		  ymVol 0Bh
		        noteL Ds5,168
		repeatStart
		  ymSustain
		        noteL Ds5,3
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        noteL G4,6
		repeatSection1Start
		  ymVol 09h
		        noteL G4,6
		  ymVol 06h
		  release 01h
		        note  G4
		  ymVol 09h
		repeatEnd
		repeatSection2Start
		  ymVol 06h
		        noteL G4,6
		  ymVol 04h
		  release 01h
		        note  G4
		  ymVol 07h
		repeatEnd
		repeatSection3Start
		  ymVol 05h
		        noteL G4,6
		  ymVol 03h
		  release 01h
		        note  G4
		  ymVol 06h
		repeatStart
		  ymSustain
		        noteL Ds5,3
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		repeatSection1Start
		        noteL Gs4,3
		  ymVol 04h
		        noteL G4,6
		  ymVol 02h
		        note  G4
		  release 01h
		        note  G4
		  ymVol 05h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL Gs4,3
		  ymVol 0Bh
		        noteL D5,96
		repeatStart
		  ymSustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        noteL Fs4,6
		repeatSection1Start
		  ymVol 09h
		        noteL Fs4,6
		  ymVol 06h
		  release 01h
		        note  Fs4
		  ymVol 09h
		repeatEnd
		repeatSection2Start
		  ymVol 06h
		        noteL Fs4,6
		  release 01h
		  ymVol 04h
		        note  Fs4
		  ymVol 07h
		  ymSustain
		        noteL D5,3
		        note  Cs5
		        note  C5
		  release 01h
		        note  B4
		  ymVol 0Bh
		        noteL Fs5,96
		repeatStart
		  ymSustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		        note  B4
		        noteL As4,6
		repeatSection1Start
		  ymVol 09h
		        noteL As4,6
		  ymVol 06h
		  release 01h
		        note  As4
		  ymVol 09h
		repeatEnd
		repeatSection2Start
		  ymVol 06h
		        noteL As4,6
		  ymVol 04h
		  release 01h
		        note  As4
		  ymVol 07h
		  ymSustain
		        noteL Fs5,3
		        note  F5
		        note  E5
		  release 01h
		        note  Ds5
		  ymVol 0Bh
		        noteL Cs5,56
		  ymVol 08h
		        noteL Cs5,8
		  ymVol 0Bh
		        note  Cs5
		  ymVol 08h
		        note  Cs5
		  ymVol 0Bh
		        note  Cs5
		  ymVol 08h
		        note  Cs5
		  ymVol 0Bh
		        noteL Cs5,96
		repeatStart
		  ymSustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        noteL F4,6
		repeatSection1Start
		  ymVol 09h
		        noteL F4,6
		  ymVol 06h
		  release 01h
		        note  F4
		  ymVol 09h
		repeatEnd
		repeatSection2Start
		  ymVol 06h
		        noteL F4,6
		  release 01h
		  ymVol 04h
		        note  F4
		  ymVol 07h
		repeatEnd
		repeatSection3Start
		  ymVol 05h
		        noteL F4,6
		  release 01h
		  ymVol 03h
		        note  F4
		  ymVol 06h
		repeatStart
		  ymSustain
		        noteL Cs5,3
		        note  C5
		        note  B4
		repeatSection1Start
		        noteL As4,3
		        note  A4
		        note  Gs4
		        note  G4
		        note  Fs4
		        noteL F4,6
		  ymVol 04h
		        note  F4
		  ymVol 02h
		  release 01h
		        note  F4
		  ymVol 05h
		repeatEnd
		repeatSection2Start
		  release 01h
		        noteL As4,3
		  ymInst 44
		  ymVol 0Bh
		        noteL Fs5,4
		        note  A5
		        noteL Gs5,76
		        noteL D6,16
		        noteL As5,4
		        note  Gs5
		        note  F5
		        note  B4
		        note  D5
		        note  Fs5
		        note  G5
		        noteL E5,88
		        noteL G5,6
		        noteL Gs5,66
		repeatStart
		  ymStereo 080h
		  ymInst 26
		  ymVol 0Bh
		        noteL G4,6
		        note  B3
		        note  D4
		        note  G4
		        note  Gs4
		        note  C4
		        note  Fs4
		        note  Gs4
		  ymVol 09h
		        note  Gs4
		  release 03h
		  ymInst 13
		  ymVol 0Ah
		repeatSection1Start
		        noteL Ds5,12
		        noteL Ds5,6
		        noteL Ds5,12
		        noteL Ds5,6
		        note  Ds5
		  release 01h
		repeatEnd
		repeatSection2Start
		        noteL Fs5,12
		        noteL Fs5,6
		        noteL Fs5,12
		        noteL Fs5,6
		        note  Fs5
		  release 01h
		  ymInst 26
		  ymVol 0Bh
		        note  G5
		        note  B4
		        note  D5
		        note  G5
		        note  Gs5
		        note  C5
		        note  Fs5
		        note  Gs5
		        note  B5
		        note  D5
		        note  G5
		        note  B5
		        note  C6
		        note  Fs5
		        note  Gs5
		        note  C6
		mainLoopEnd
Music_4_Channel_5:
		  ymStereo 0C0h
		mainLoopStart
		        sampleL 4,4
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sample  2
		        sample  2
		        sample  2
		        sample  2
		        sampleL 5,36
		        sampleL 2,4
		        sample  3
		        sample  3
		        sampleL 2,18
		        sample  2
		        sampleL 2,12
		repeatStart
		countedLoopStart 1
		        sampleL 0,72
		        sampleL 4,4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,12
		        sampleL 3,6
		        sample  3
		        sampleL 2,12
		        sampleL 3,6
		        sample  3
		        sample  2
		        sample  4
		        sample  3
		        sample  2
		        sample  4
		        sample  2
		        sample  4
		        sample  2
		countedLoopEnd
		countedLoopStart 1
		        sampleL 5,12
		        sampleL 2,24
		        sampleL 3,4
		        sample  3
		        sample  3
		        sampleL 5,12
		        sampleL 3,4
		        sample  4
		        sample  4
		        sampleL 3,6
		        sampleL 2,12
		        sampleL 3,6
		countedLoopEnd
		countedLoopStart 1
		        sampleL 3,12
		        sampleL 3,6
		        sample  3
		        sampleL 5,12
		        sampleL 3,6
		        sample  3
		        sample  2
		        sample  4
		        sample  3
		        sample  3
		        sample  2
		        sampleL 2,12
		        sampleL 3,6
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		        sampleL 0,216
		        silence
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 31
		        sampleL 4,4
		countedLoopEnd
		countedLoopStart 6
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,4
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,216
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 31
		        sampleL 4,4
		countedLoopEnd
		        sampleL 4,4
		        sample  3
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,192
		repeatStart
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 14
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,4
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,96
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 6
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,16
		        sample  2
		        sample  2
		        sampleL 5,4
		        sample  2
		        sample  2
		        sample  3
		        sample  3
		countedLoopStart 14
		        sampleL 4,4
		countedLoopEnd
		        sampleL 3,4
		        sample  3
		        sample  2
		        sample  2
		        sampleL 5,108
		        sampleL 4,6
		        sample  4
		countedLoopStart 13
		        sampleL 3,12
		        sampleL 4,6
		        sample  4
		countedLoopEnd
		        sampleL 3,6
		        sample  4
		        sample  3
		        sample  3
		countedLoopStart 9
		        sampleL 3,12
		        sampleL 4,6
		        sample  4
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_6:
		  vibrato 04Ch
		mainLoopStart
		  release 00h
		  psgInst 12
		        psgNoteL Gs4,6
		        psgNote  B4
		        psgNote  Gs4
		        psgNote  B4
		        psgNote  A4
		        psgNote  C5
		        psgNote  A4
		        psgNote  C5
		countedLoopStart 3
		        psgNoteL E5,3
		        psgNote  F5
		countedLoopEnd
		        psgNoteL E5,6
		        psgNote  Cs5
		        psgNote  As4
		        psgNote  G4
		countedLoopStart 7
		        psgNoteL E4,3
		        psgNote  F4
		countedLoopEnd
		  release 01h
		repeatStart
		  psgInst 26
		countedLoopStart 8
		        psgNoteL Cs4,6
		        psgNote  F4
		countedLoopEnd
		  psgInst 12
		        psgNoteL Gs4,6
		        psgNote  A4
		        psgNote  Cs5
		        psgNote  F5
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  E6
		        psgNote  F6
		        psgNote  E6
		        psgNote  F6
		        psgNote  Cs6
		        psgNote  A5
		        psgNote  F5
		        psgNote  Cs5
		  psgInst 26
		countedLoopStart 8
		        psgNoteL D4,6
		        psgNote  Fs4
		countedLoopEnd
		  psgInst 12
		        psgNoteL Gs4,6
		        psgNote  C5
		        psgNote  D5
		        psgNote  Fs5
		        psgNote  Gs5
		        psgNote  C6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  Ds6
		        psgNote  G6
		        psgNote  Ds6
		        psgNote  G6
		  psgInst 26
		countedLoopStart 4
		        psgNoteL E4,6
		        psgNote  G4
		countedLoopEnd
		        psgNoteL B4,6
		        psgNote  Ds5
		        psgNote  B4
		        psgNote  G4
		        psgNote  E4
		        psgNote  Ds4
		countedLoopStart 4
		        psgNoteL E4,6
		        psgNote  Gs4
		countedLoopEnd
		        psgNoteL As4,6
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  Gs5
		        psgNote  As5
		        psgNote  Ds6
		  psgInst 12
		countedLoopStart 1
		        psgNoteL F6,6
		        psgNote  Ds6
		        psgNote  F6
		        psgNote  B5
		        psgNote  F6
		        psgNote  Ds6
		        psgNote  F6
		        psgNote  B5
		        psgNote  Fs6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  C6
		        psgNote  Fs6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  C6
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  psgInst 0
		  length 144
		  psgInst 42
		        psgNoteL F4,6
		        psgNote  Fs4
		        psgNote  As4
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  F5
		        psgNote  Gs5
		        psgNote  Cs6
		countedLoopStart 16
		        psgNoteL E6,6
		        psgNote  C6
		        psgNote  Gs5
		        psgNote  Ds6
		        psgNote  B5
		        psgNote  G5
		        psgNote  D6
		        psgNote  As5
		        psgNote  Fs5
		        psgNote  B5
		        psgNote  G5
		        psgNote  Ds5
		        psgNote  G6
		        psgNote  D6
		        psgNote  Gs5
		countedLoopEnd
		        psgNoteL E6,6
		        psgNote  C6
		        psgNote  Gs5
		        psgNote  Ds6
		        psgNote  B5
		        psgNote  G5
		        psgNote  D6
		        psgNote  As5
		        psgNote  Fs5
		countedLoopStart 4
		        psgNoteL B5,6
		        psgNote  G5
		        psgNote  Ds5
		        psgNote  Cs6
		        psgNote  C6
		        psgNote  Gs5
		        psgNote  E5
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  A5
		        psgNote  F5
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  As5
		        psgNote  Fs5
		        psgNote  E6
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL Gs5,6
		        psgNote  B4
		        psgNote  E5
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  A4
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_7:
		  shifting 020h
		  vibrato 04Ch
		mainLoopStart
		  psgInst 0
		  length 6
		  release 00h
		  psgInst 10
		        psgNote  Gs4
		        psgNote  B4
		        psgNote  Gs4
		        psgNote  B4
		        psgNote  A4
		        psgNote  C5
		        psgNote  A4
		        psgNote  C5
		countedLoopStart 3
		        psgNoteL E5,3
		        psgNote  F5
		countedLoopEnd
		        psgNoteL E5,6
		        psgNote  Cs5
		        psgNote  As4
		        psgNote  G4
		countedLoopStart 7
		        psgNoteL E4,3
		        psgNote  F4
		countedLoopEnd
		  release 01h
		repeatStart
		  psgInst 24
		countedLoopStart 8
		        psgNoteL Cs4,6
		        psgNote  F4
		countedLoopEnd
		  psgInst 10
		        psgNoteL Gs4,6
		        psgNote  A4
		        psgNote  Cs5
		        psgNote  F5
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  E6
		        psgNote  F6
		        psgNote  E6
		        psgNote  F6
		        psgNote  Cs6
		        psgNote  A5
		        psgNote  F5
		        psgNote  Cs5
		  psgInst 24
		countedLoopStart 8
		        psgNoteL D4,6
		        psgNote  Fs4
		countedLoopEnd
		  psgInst 10
		        psgNoteL Gs4,6
		        psgNote  C5
		        psgNote  D5
		        psgNote  Fs5
		        psgNote  Gs5
		        psgNote  C6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  Ds6
		        psgNote  G6
		        psgNote  Ds6
		        psgNote  G6
		  psgInst 24
		countedLoopStart 4
		        psgNoteL E4,6
		        psgNote  G4
		countedLoopEnd
		        psgNoteL B4,6
		        psgNote  Ds5
		        psgNote  B4
		        psgNote  G4
		        psgNote  E4
		        psgNote  Ds4
		countedLoopStart 4
		        psgNoteL E4,6
		        psgNote  Gs4
		countedLoopEnd
		        psgNoteL As4,6
		        psgNote  Ds5
		        psgNote  E5
		        psgNote  Gs5
		        psgNote  As5
		        psgNote  Ds6
		  psgInst 10
		countedLoopStart 1
		        psgNoteL F6,6
		        psgNote  Ds6
		        psgNote  F6
		        psgNote  B5
		        psgNote  F6
		        psgNote  Ds6
		        psgNote  F6
		        psgNote  B5
		        psgNote  Fs6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  C6
		        psgNote  Fs6
		        psgNote  D6
		        psgNote  Fs6
		        psgNote  C6
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		  psgInst 0
		  length 138
		  shifting 00h
		  psgInst 42
		        psgNoteL G3,6
		        psgNote  B3
		        psgNote  D4
		        psgNote  F4
		        psgNote  G4
		        psgNote  B4
		        psgNote  D5
		        psgNote  F5
		countedLoopStart 23
		        psgNoteL F5,6
		        psgNote  E5
		        psgNote  Cs6
		        psgNote  Fs6
		        psgNote  D5
		        psgNote  F5
		        psgNote  E5
		        psgNote  A5
		        psgNote  F6
		        psgNote  Gs6
		        psgNote  As6
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL F5,6
		        psgNote  Gs5
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Fs5
		        psgNote  A5
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  G5
		        psgNote  As5
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  Gs5
		        psgNote  B5
		        psgNote  E6
		        psgNote  F6
		countedLoopEnd
		countedLoopStart 4
		        psgNoteL E4,6
		        psgNote  Gs4
		        psgNote  B3
		        psgNote  E4
		        psgNote  F4
		        psgNote  A4
		        psgNote  C4
		        psgNote  Ds4
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_9:
		channel_end
