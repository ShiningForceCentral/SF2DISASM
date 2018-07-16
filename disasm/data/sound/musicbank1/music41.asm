
; ASM FILE music41.asm :
; 0xDC9A..0xFD9E : Music 41
Music_41:       db 0
		db 0
		db 0
		db 0C6h
		dw Music_9_Channel_0
		dw Music_9_Channel_1
		dw Music_9_Channel_2
		dw Music_9_Channel_3
		dw Music_9_Channel_4
		dw Music_9_Channel_5
		dw Music_9_Channel_6
		dw Music_9_Channel_7
		dw Music_9_Channel_9
		dw Music_9_Channel_9
Music_9_Channel_0:
		  ymStereo 0C0h
		  ymInst 55
		  ymVol 0Ch
		  ymSustain
		  vibrato 02Ch
		        noteL F2,192
		  vibrato 020h
		        note  F2
		        note  F2
		        note  F2
		  release 01h
		        noteL F2,83
		  vibrato 02Ch
		  ymInst 40
		  ymVol 0Bh
		        noteL E2,15
		  ymVol 0Ch
		        noteL D2,16
		  ymInst 1
		  ymVol 0Bh
		        noteL Cs1,132
		  ymInst 3
		  ymVol 0Dh
		        noteL As1,10
		  length 14
		        noteL As1,78
		  length 18
		  ymVol 0Ch
		countedLoopStart 1
		        noteL As1,8
		        noteL As2,4
		        silence
		        note  As2
		        silence
		countedLoopEnd
		        noteL F1,8
		        noteL F2,4
		        silence
		        note  F2
		        silence
		        noteL As1,12
		  ymInst 32
		  ymVol 0Dh
		        noteL As2,6
		        note  As2
		        note  As2
		  ymVol 09h
		        note  As2
		  ymInst 3
		  ymVol 0Bh
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		  length 18
		        noteL F2,6
		        silence
		countedLoopStart 3
		        noteL As1,6
		        silence
		        note  As1
		  length 18
		        noteL As1,6
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		  length 18
		        noteL F2,6
		        silence
		countedLoopEnd
		repeatStart
		        noteL Ds2,6
		        silence
		        note  Ds2
		  length 18
		        noteL Ds2,6
		        note  Ds2
		        note  Ds2
		        note  Ds2
		        note  Ds2
		  length 18
		        noteL F2,6
		        silence
		  ymVol 0Ch
		        noteL As1,8
		  length 16
		        noteL As2,12
		  length 6
		        note  As2
		        note  Gs2
		        silence
		  ymVol 0Bh
		  ymSustain
		        note  Gs3
		  release 01h
		        note  G3
		        note  Gs3
		        silence
		  ymVol 0Ch
		        note  Gs2
		        silence
		        note  Fs2
		        silence
		  ymVol 0Bh
		  ymSustain
		        note  Fs3
		  release 01h
		        note  F3
		        note  Fs3
		        note  Gs3
		        note  As3
		        note  Fs3
		        note  F3
		        silence
		        noteL F2,24
		        noteL F2,6
		        silence
		        note  As1
		        silence
		        note  As1
		  length 18
		        noteL As1,6
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		  length 18
		        noteL F2,6
		        silence
		        note  Ds2
		        silence
		        note  Ds2
		  length 18
		        noteL Ds2,6
		        note  Ds2
		        note  Ds2
		        silence
		repeatSection1Start
		        noteL F2,24
		        noteL Ds2,12
		        noteL D2,6
		        silence
		        note  D2
		  length 18
		        noteL D2,6
		        note  D2
		        note  D2
		        note  D2
		        note  D2
		  length 18
		        noteL A2,6
		        silence
		        note  G2
		        silence
		        note  G2
		  length 18
		        noteL G2,6
		        note  G2
		        note  F2
		        note  F2
		        note  F2
		        silence
		        noteL F2,24
		        noteL E2,6
		        silence
		        note  E2
		  length 18
		        noteL E2,6
		        note  E2
		        note  E2
		        note  E2
		        note  E2
		  length 18
		        noteL E2,6
		        silence
		        note  F2
		        silence
		        note  F2
		  length 18
		        noteL F2,6
		        silence
		        note  F1
		        note  F1
		        note  F1
		  length 18
		        noteL F1,6
		        silence
		        note  As1
		        silence
		        note  As1
		  length 18
		        noteL As1,6
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		  length 18
		        noteL F2,6
		        silence
		repeatEnd
		repeatSection2Start
		        noteL F2,36
		        noteL Fs2,48
		        noteL Gs2,36
		  ymSustain
		        noteL Fs2,6
		  release 01h
		        note  Gs2
		        noteL As2,8
		  length 16
		        noteL Ds2,48
		        noteL Ds2,24
		        noteL B1,48
		        noteL Cs2,36
		  ymSustain
		        noteL B1,6
		  release 01h
		        note  Cs2
		        noteL Ds2,8
		  length 16
		        noteL E2,72
		  ymInst 2
		  ymVol 0Ch
		        noteL A3,48
		  length 12
		        noteL E3,24
		        noteL E3,6
		        silence
		        noteL A3,72
		        noteL E3,24
		        noteL Gs3,48
		  length 12
		        noteL Ds3,24
		        noteL Ds3,6
		        silence
		        noteL Gs3,96
		        noteL G3,48
		  length 12
		        noteL D3,24
		        noteL D3,6
		        silence
		        noteL G3,72
		        noteL D3,24
		        noteL Fs3,48
		  length 12
		        noteL Fs3,24
		        noteL Cs3,6
		        silence
		        noteL E3,48
		  length 12
		        noteL B2,24
		        noteL E3,12
		        noteL D3,48
		  length 12
		        noteL D3,24
		        noteL D3,6
		        silence
		        noteL Cs3,60
		        noteL Ds3,12
		        note  E3
		        note  Gs3
		        noteL G3,48
		  length 12
		        noteL D3,24
		        noteL G3,12
		        noteL Fs3,48
		  length 12
		        note  A3
		        note  B3
		        note  Cs4
		        noteL D4,48
		  length 12
		        noteL A3,24
		        noteL A3,6
		        silence
		        noteL Cs4,30
		  length 6
		        noteL Gs3,18
		  length 6
		        noteL E3,18
		  length 6
		        note  Cs3
		  length 30
		  ymInst 3
		  ymVol 0Ch
		        noteL Fs2,24
		        silence
		        note  E2
		        noteL D2,8
		  length 16
		        noteL C2,72
		countedLoopStart 1
		  ymInst 3
		  ymVol 0Ch
		  release 07h
		        noteL F2,12
		        note  C3
		        note  F3
		  release 01h
		  ymInst 32
		  ymVol 0Dh
		        noteL F2,6
		        note  F2
		        note  F2
		  ymVol 09h
		        note  F2
		  release 07h
		  ymInst 3
		  ymVol 0Ch
		        noteL F2,12
		        note  C3
		        note  F3
		        silence
		  release 01h
		  ymInst 32
		  ymVol 0Dh
		        noteL F2,6
		        note  F2
		        note  F2
		  ymVol 09h
		        note  F2
		  release 07h
		  ymInst 3
		  ymVol 0Ch
		        noteL F2,12
		        note  C3
		        note  F3
		        note  Ds3
		        note  As3
		        note  F3
		  release 01h
		  ymInst 32
		  ymVol 0Dh
		        noteL F2,6
		        note  F2
		        note  F2
		  ymVol 09h
		        note  F2
		  length 12
		  ymInst 38
		  ymVol 0Bh
		        noteL Ds4,4
		        note  D4
		        note  C4
		        note  As3
		        note  A3
		        note  G3
		        note  F4
		        note  Ds4
		        note  D4
		        note  C4
		        note  As3
		        note  A3
		        note  G4
		        note  F4
		        note  Ds4
		        note  D4
		        note  C4
		        note  As3
		        note  A4
		        note  G4
		        note  F4
		        note  Ds4
		        note  D4
		        note  C4
		        note  As3
		        note  A3
		        note  G3
		        note  F3
		        note  Ds3
		        note  D3
		        note  C3
		        note  As2
		        note  A2
		        note  G2
		        note  F2
		        note  Ds2
		countedLoopEnd
		  ymInst 32
		  ymVol 0Dh
		        noteL As2,6
		  ymVol 09h
		        note  As2
		  ymVol 0Dh
		        noteL As2,4
		        note  As2
		  ymVol 09h
		        note  As2
		  ymVol 0Dh
		        noteL As2,12
		  ymVol 09h
		        noteL As2,6
		        silence
		  ymInst 3
		  ymVol 0Dh
		        noteL As1,54
		  length 6
		  ymVol 0Ch
		        noteL As1,4
		  release 05h
		        noteL As1,8
		        note  As1
		        note  As1
		        note  As1
		        silence
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		countedLoopStart 11
		  release 01h
		        noteL As1,8
		  length 4
		        note  As1
		  release 05h
		        noteL As1,8
		        note  As1
		        note  As1
		        note  As1
		        silence
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		        note  As1
		countedLoopEnd
		  release 01h
		        noteL As1,8
		  length 4
		        note  As1
		  release 05h
		        noteL As1,8
		  release 01h
		        noteL F1,72
		        noteL As1,8
		  length 16
		        noteL As1,8
		  length 28
		        noteL Fs2,8
		  length 16
		        noteL Fs2,8
		  length 16
		        noteL B1,6
		        silence
		        noteL B1,8
		  length 16
		        noteL E2,6
		        note  E2
		        noteL E2,8
		  length 16
		        noteL E2,8
		  length 28
		        noteL A2,8
		  length 16
		        noteL B2,6
		        silence
		        noteL B2,8
		  length 16
		        noteL B2,6
		        note  B2
		        note  As2
		        silence
		        note  As1
		        note  As1
		        note  As1
		        silence
		        note  As1
		        note  As1
		        noteL As1,8
		  length 40
		channel_end
Music_9_Channel_1:
		  ymStereo 0C0h
		  release 01h
		  vibrato 035h
		  ymInst 15
		  ymVol 00h
		        noteL F2,12
		  ymVol 0Bh
		        note  E3
		        note  F3
		        note  C4
		        noteL B3,36
		        noteL G3,12
		        note  A3
		        note  C4
		  vibrato 03Ch
		  ymSustain
		        noteL E4,72
		  vibrato 030h
		  ymVol 09h
		        noteL E4,6
		  ymVol 07h
		  release 01h
		        note  E4
		  ymVol 0Bh
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        noteL A3,18
		        noteL E4,6
		  vibrato 03Ch
		  ymSustain
		        noteL G4,72
		  vibrato 030h
		  ymVol 09h
		        noteL G4,6
		  ymVol 07h
		  release 01h
		        note  G4
		  ymVol 0Bh
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        note  A3
		        note  E4
		        note  D4
		        note  B3
		        note  C4
		        noteL G4,24
		        noteL F4,12
		  vibrato 03Ch
		  ymSustain
		        noteL B4,24
		  vibrato 030h
		  ymVol 09h
		        noteL B4,6
		  ymVol 07h
		  release 01h
		        note  B4
		  ymVol 0Bh
		  vibrato 035h
		        noteL C4,12
		        note  G4
		        note  F4
		  vibrato 03Ch
		  ymSustain
		        noteL B4,48
		  vibrato 030h
		  ymVol 09h
		        noteL B4,6
		  ymVol 07h
		  release 01h
		        note  B4
		  vibrato 035h
		  ymVol 0Bh
		        noteL C4,12
		        noteL G4,18
		        noteL F4,6
		  vibrato 03Ch
		  ymSustain
		        noteL B4,48
		  vibrato 030h
		  ymVol 09h
		        noteL B4,6
		  ymVol 07h
		  release 01h
		        note  B4
		  ymVol 0Bh
		  vibrato 035h
		        noteL C5,12
		        noteL G5,18
		        noteL F5,6
		  vibrato 03Fh
		  ymSustain
		        noteL B5,222
		  vibrato 030h
		  ymVol 09h
		        noteL B5,6
		  ymVol 07h
		  release 01h
		        note  B5
		  vibrato 02Ch
		  ymInst 13
		  ymVol 0Ch
		        noteL G5,4
		        note  G5
		  ymVol 09h
		        note  G5
		  ymVol 0Ch
		        note  G5
		  ymVol 09h
		        note  G5
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  E5
		  ymVol 09h
		        note  E5
		  ymVol 0Ch
		        noteL F5,48
		  ymVol 09h
		        noteL F5,8
		  release 05h
		  ymInst 27
		  ymVol 0Ah
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  D4
		        note  D4
		        note  D4
		        note  E4
		        note  E4
		  release 01h
		        noteL F4,12
		  ymVol 06h
		        noteL F4,6
		  ymVol 04h
		        note  F4
		  length 12
		  ymInst 20
		  ymVol 0Bh
		        noteL E4,6
		        note  E4
		        noteL E4,36
		  ymVol 07h
		        noteL E4,6
		  ymVol 0Bh
		        note  F4
		        noteL D4,96
		  ymInst 16
		  ymVol 0Bh
		        noteL F5,6
		        note  E5
		        noteL F5,54
		  ymVol 08h
		        noteL F5,6
		  ymVol 0Bh
		        noteL F5,4
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		  ymSustain
		        noteL D5,96
		  ymVol 08h
		        noteL D5,6
		  release 01h
		  ymVol 06h
		        note  D5
		repeatStart
		  ymInst 27
		  ymVol 0Bh
		        noteL A3,12
		        noteL As3,6
		  ymVol 07h
		        note  As3
		  ymVol 0Bh
		        note  G4
		  ymVol 07h
		        note  G4
		  ymVol 0Bh
		        noteL F4,36
		        noteL D4,6
		  ymVol 07h
		        note  D4
		  ymVol 0Bh
		        note  Ds4
		  ymVol 07h
		        note  Ds4
		  ymVol 0Bh
		        noteL C5,24
		        noteL As4,6
		  ymVol 07h
		        note  As4
		  ymVol 0Bh
		        noteL A4,24
		        noteL D4,18
		        noteL Ds4,6
		  ymInst 20
		  ymVol 0Bh
		        note  F4
		  ymVol 08h
		        note  F4
		  ymVol 06h
		        note  F4
		        silence
		  ymVol 0Bh
		        noteL F4,12
		  ymVol 08h
		        noteL F4,6
		  ymVol 0Bh
		        note  F4
		        note  G4
		  ymVol 08h
		        note  G4
		  ymVol 0Bh
		        noteL G4,24
		        noteL G4,6
		  ymVol 08h
		        note  G4
		  ymVol 0Bh
		        note  Gs4
		  ymVol 08h
		        note  Gs4
		  ymVol 0Bh
		        noteL Gs4,24
		        noteL Gs4,6
		  ymVol 08h
		        note  Gs4
		  ymVol 0Bh
		        note  G4
		        note  F4
		        noteL G4,36
		  ymVol 08h
		        noteL G4,6
		  ymVol 06h
		        note  G4
		  ymInst 26
		repeatSection1Start
		  ymVol 0Ch
		        noteL A4,12
		        note  As4
		        note  G5
		        note  F5
		        note  D5
		        noteL Ds5,6
		  ymVol 09h
		        note  Ds5
		  ymVol 07h
		        note  Ds5
		  ymVol 0Ch
		        note  As5
		        noteL C6,36
		        noteL As5,12
		        noteL A5,48
		  ymVol 09h
		        noteL A5,6
		  ymVol 07h
		        note  A5
		  ymVol 0Ch
		        noteL F3,12
		        note  Fs3
		        note  Ds4
		        noteL D4,36
		        noteL C4,12
		        note  C4
		        noteL As3,24
		        noteL As3,6
		        note  A3
		        note  As3
		  ymVol 09h
		        note  As3
		  ymVol 0Ch
		        noteL G3,12
		        note  A3
		        note  As3
		        note  D4
		        noteL C4,24
		        note  G4
		        noteL G4,12
		        note  F4
		        note  E4
		        noteL G4,6
		  ymVol 09h
		        note  G4
		  ymVol 0Ch
		        noteL F4,84
		  ymVol 09h
		        noteL F4,6
		  ymVol 07h
		        note  F4
		repeatEnd
		repeatSection2Start
		  ymVol 0Dh
		        noteL A3,12
		        note  As3
		        note  G4
		        note  F4
		        note  D4
		        noteL Ds4,6
		  ymVol 0Ah
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 0Dh
		        note  As4
		        noteL C5,36
		        noteL As4,12
		        noteL A4,36
		  ymInst 13
		  ymVol 0Ch
		        noteL As4,6
		        note  C5
		        noteL Cs5,30
		  ymVol 09h
		        noteL Cs5,6
		  ymVol 0Ch
		        note  Cs5
		        note  Cs5
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  As4
		  ymVol 09h
		        note  As4
		  ymVol 0Ch
		        note  Gs4
		  ymVol 09h
		        note  Gs4
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  As4
		  ymVol 09h
		        note  As4
		  ymVol 0Ch
		        note  F4
		  ymVol 09h
		        note  F4
		  ymVol 0Ch
		        noteL As4,60
		  ymVol 09h
		        noteL As4,6
		  ymVol 07h
		        note  As4
		  ymVol 0Ch
		        noteL F5,30
		  ymVol 09h
		        noteL F5,6
		  ymVol 0Ch
		        note  F5
		        note  F5
		        note  Ds5
		  ymVol 09h
		        note  Ds5
		  ymVol 0Ch
		        note  Cs5
		  ymVol 09h
		        note  Cs5
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  Ds5
		  ymVol 09h
		        note  Ds5
		  ymVol 0Ch
		        note  Cs5
		  ymVol 09h
		        note  Cs5
		  ymVol 0Ch
		        note  Gs5
		  ymVol 09h
		        note  Gs5
		  ymVol 0Ch
		        noteL Fs5,72
		  ymVol 09h
		        noteL Fs5,6
		  ymVol 07h
		        note  Fs5
		  ymVol 05h
		        note  Fs5
		  length 30
		  ymInst 7
		  ymVol 09h
		        noteL E4,24
		        note  Fs4
		        noteL Gs4,60
		        noteL Fs4,12
		        note  E4
		        note  Cs4
		        noteL Ds4,72
		        noteL Fs4,24
		  ymSustain
		        noteL B4,120
		  ymVol 07h
		        noteL B4,6
		  ymVol 05h
		        note  B4
		  release 01h
		  ymVol 03h
		        note  B4
		        silence
		  ymInst 9
		  ymVol 0Ah
		        noteL D4,24
		        note  E4
		        noteL Fs4,60
		        noteL B4,12
		        note  Cs5
		        note  D5
		        noteL Cs5,72
		        noteL A4,24
		        noteL B4,68
		  ymInst 26
		  ymVol 0Ch
		  ymSustain
		        noteL Gs3,4
		        note  A3
		        note  B3
		        note  Cs4
		        note  Ds4
		        note  E4
		  release 01h
		        note  Fs4
		  ymVol 0Dh
		  ymSustain
		        noteL Gs4,20
		  release 01h
		  ymSlide 035h
		        noteL Gs5,40
		  ymStopSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		        noteL E5,24
		        noteL Gs4,72
		        noteL Gs4,12
		        note  Fs4
		        note  Gs4
		        note  A4
		        noteL E4,36
		        noteL Fs4,12
		        noteL Gs4,96
		  ymSustain
		        noteL Gs4,20
		  release 01h
		  ymSlide 035h
		        noteL Gs5,40
		  ymStopSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		  ymSustain
		        noteL E5,20
		  release 01h
		  ymSlide 035h
		        noteL Cs6,40
		  ymStopSlide
		        noteL B5,12
		        note  Gs5
		        note  E5
		  ymInst 20
		  ymVol 0Ch
		        noteL Cs5,6
		        note  Ds5
		        noteL E5,18
		  ymVol 09h
		        noteL E5,6
		  ymVol 0Ch
		        note  E5
		  ymVol 09h
		        note  E5
		  ymVol 0Ch
		        note  Ds5
		        note  E5
		        noteL Fs5,24
		  ymSustain
		        noteL B4,4
		        note  Cs5
		  release 01h
		        note  Ds5
		        noteL E5,6
		        note  Fs5
		        note  Gs5
		  ymVol 09h
		        note  Gs5
		  ymVol 0Ch
		        noteL A5,48
		  ymInst 26
		  ymVol 0Ch
		  ymSustain
		        noteL C5,4
		        note  D5
		        note  E5
		        note  F5
		        note  G5
		  release 01h
		        note  A5
		countedLoopStart 1
		  ymInst 26
		  ymVol 0Dh
		        noteL As5,6
		  ymVol 0Ah
		        note  As5
		  ymVol 0Dh
		        note  As5
		  ymVol 0Ah
		        note  As5
		  ymVol 0Dh
		        note  C6
		  ymVol 0Ah
		        note  C6
		  ymVol 08h
		        note  C6
		  ymVol 06h
		        note  C6
		  length 12
		  ymVol 0Dh
		        noteL G5,6
		  ymVol 0Ah
		        note  G5
		  ymVol 0Dh
		        note  G5
		  ymVol 0Ah
		        note  G5
		  ymVol 0Dh
		        note  A5
		  ymVol 0Ah
		        note  A5
		  ymVol 08h
		        note  A5
		  ymVol 06h
		        note  A5
		  length 24
		  ymVol 0Dh
		        noteL F5,6
		  ymVol 0Ah
		        note  F5
		  ymVol 0Dh
		        note  F5
		  ymVol 0Ah
		        note  F5
		  ymVol 0Dh
		        note  F5
		  ymVol 0Ah
		        note  F5
		  ymVol 0Dh
		        note  G5
		  ymVol 0Ah
		        note  G5
		  ymVol 0Dh
		        note  Ds5
		  ymVol 0Ah
		        note  Ds5
		  ymVol 0Dh
		        note  C5
		  ymVol 0Ah
		        note  C5
		  ymVol 0Dh
		        note  C5
		  ymVol 0Ah
		        note  C5
		  ymVol 08h
		        note  C5
		  ymVol 06h
		        note  C5
		  ymInst 13
		  ymVol 0Dh
		        note  F3
		  ymVol 0Ah
		        note  F3
		  ymVol 0Dh
		        note  C4
		  ymVol 0Ah
		        note  C4
		  ymVol 0Dh
		        note  F4
		  ymVol 0Ah
		        note  F4
		  ymVol 0Dh
		        noteL Ds4,24
		  ymVol 0Ah
		        noteL Ds4,6
		  ymVol 08h
		        note  Ds4
		  ymVol 0Dh
		        note  C4
		  ymVol 0Ah
		        note  C4
		  ymVol 0Dh
		        note  Ds4
		  ymVol 0Ah
		        note  Ds4
		  ymVol 0Dh
		        note  As4
		  ymVol 0Ah
		        note  As4
		  ymVol 0Dh
		        noteL A4,48
		countedLoopEnd
		  ymVol 0Ah
		        noteL A4,6
		  ymVol 08h
		        note  A4
		  length 24
		  ymVol 0Ch
		        noteL G5,4
		        note  G5
		  ymVol 09h
		        note  G5
		  ymVol 0Ch
		        note  G5
		  ymVol 09h
		        note  G5
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  E5
		  ymVol 09h
		        note  E5
		  ymSustain
		  ymVol 0Ch
		        noteL F5,216
		  ymVol 09h
		        noteL F5,8
		  ymVol 07h
		        note  F5
		  release 01h
		  ymVol 05h
		        note  F5
		  ymInst 0
		  ymVol 0Ch
		        noteL A2,24
		        note  As2
		        note  F3
		        noteL E3,72
		        noteL C3,24
		        noteL D3,12
		        note  F3
		  ymSustain
		        note  A3
		  ymVol 09h
		        noteL A3,6
		  release 01h
		  ymVol 07h
		        note  A3
		  length 156
		  ymVol 0Ch
		        noteL A2,12
		        note  As2
		        note  F3
		        noteL E3,36
		        noteL C3,12
		        noteL D3,18
		        noteL A3,6
		  ymSustain
		        noteL C4,12
		  ymVol 09h
		        noteL C4,6
		  ymVol 07h
		  release 01h
		        note  C4
		  length 36
		  ymVol 0Ch
		        noteL A2,12
		        note  As2
		        note  F3
		        note  E3
		        note  C3
		        note  D3
		        note  A3
		        noteL G3,18
		        noteL E3,6
		        noteL F3,12
		        noteL C4,24
		        noteL As3,12
		  ymVol 0Ch
		  ymSustain
		        note  E4
		  ymVol 09h
		        noteL E4,6
		  release 01h
		  ymVol 07h
		        note  E4
		  length 12
		  ymVol 0Ch
		        note  F3
		        note  C4
		        note  As3
		  ymSustain
		        note  E4
		  ymVol 09h
		        noteL E4,6
		  ymVol 07h
		  release 01h
		        note  E4
		  length 12
		  ymInst 26
		  ymVol 0Ch
		        note  F4
		        noteL C5,18
		        noteL As4,6
		  ymInst 15
		  ymVol 0Ch
		        noteL E5,52
		  ymInst 26
		  ymVol 0Ch
		        noteL D5,4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A3
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		        note  D5
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		        note  D5
		        note  E5
		  ymInst 20
		countedLoopStart 1
		  ymVol 0Ch
		        noteL F5,6
		  ymVol 09h
		        note  F5
		  ymVol 07h
		        note  F5
		        silence
		countedLoopEnd
		  length 12
		countedLoopStart 1
		  ymVol 0Ch
		        noteL F5,6
		  ymVol 09h
		        note  F5
		  ymVol 07h
		        note  F5
		        silence
		countedLoopEnd
		  ymVol 0Ch
		        noteL F5,6
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 07h
		        note  F5
		        silence
		  ymVol 0Ch
		        note  F5
		        note  F5
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 07h
		        note  F5
		        silence
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 07h
		        note  F5
		  length 18
		  ymVol 0Ch
		        noteL F5,6
		  ymVol 09h
		        note  F5
		  ymVol 07h
		        note  F5
		        silence
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 07h
		        note  F5
		        silence
		  ymVol 0Ch
		        note  F5
		        note  F5
		  ymVol 0Ch
		        note  As5
		  ymVol 09h
		        note  As5
		  ymVol 0Ch
		        note  As3
		        note  As3
		        note  As3
		  ymVol 09h
		        note  As3
		  ymVol 0Ch
		        note  As3
		        note  As3
		        note  As3
		  ymVol 09h
		        note  As3
		  ymVol 07h
		        note  As3
		  ymVol 05h
		        note  As3
		  length 24
		channel_end
Music_9_Channel_2:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 120
		  ymInst 16
		countedLoopStart 2
		  ymVol 09h
		        noteL B5,5
		  ymVol 05h
		        noteL B5,3
		countedLoopEnd
		  ymSustain
		  ymVol 09h
		        noteL A5,48
		  vibrato 020h
		  ymVol 07h
		        noteL A5,6
		  ymVol 05h
		        note  A5
		  release 01h
		  ymVol 03h
		        note  A5
		  length 102
		  vibrato 02Ch
		  ymVol 09h
		        noteL D6,18
		        noteL E6,4
		  length 2
		  ymVol 08h
		  ymSustain
		        noteL E6,36
		  ymVol 06h
		        noteL E6,6
		  ymVol 04h
		  release 01h
		        note  E6
		  ymInst 9
		  ymVol 08h
		        noteL C4,24
		        note  D4
		        note  E4
		        note  F4
		        note  G4
		        note  A4
		        note  B4
		  ymSustain
		        note  C5
		  ymVol 07h
		        noteL C5,6
		  ymVol 05h
		        note  C5
		  ymVol 03h
		  release 01h
		        note  C5
		        silence
		  ymInst 16
		countedLoopStart 2
		  ymVol 08h
		        noteL F6,5
		  ymVol 05h
		        noteL F6,3
		countedLoopEnd
		  ymVol 08h
		  ymSustain
		        noteL D6,48
		  ymVol 05h
		        noteL D6,6
		  ymVol 03h
		        note  D6
		  release 01h
		  ymVol 01h
		        note  D6
		        silence
		countedLoopStart 2
		  ymVol 08h
		        noteL F6,5
		  ymVol 05h
		        noteL F6,3
		countedLoopEnd
		  ymVol 08h
		  ymSustain
		        noteL D6,48
		  ymVol 05h
		        noteL D6,5
		  ymVol 03h
		        note  D6
		  ymVol 01h
		  release 01h
		        note  D6
		  length 10
		  ymVol 08h
		        noteL F6,5
		  ymVol 05h
		        noteL F6,4
		  ymVol 08h
		        noteL F6,6
		  ymVol 05h
		        noteL F6,4
		  ymVol 08h
		        noteL F6,7
		  ymVol 05h
		        noteL F6,4
		  ymVol 08h
		        noteL D6,59
		  ymSustain
		        noteL Ds6,132
		  ymVol 06h
		        noteL Ds6,6
		  release 01h
		  ymVol 04h
		        note  Ds6
		  ymInst 13
		  ymVol 0Ch
		        noteL E5,4
		        note  E5
		  ymVol 09h
		        note  E5
		  ymVol 0Ch
		        note  E5
		  ymVol 09h
		        note  E5
		  ymVol 0Ch
		        note  D5
		  ymVol 09h
		        note  D5
		  length 8
		  ymVol 0Ch
		        noteL E5,48
		  ymVol 09h
		        noteL E5,8
		  release 05h
		  ymInst 27
		  ymVol 0Ah
		        note  E3
		        note  E3
		        note  E3
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  C4
		        note  C4
		  release 01h
		        noteL D4,12
		  ymVol 06h
		        noteL D4,6
		  ymVol 04h
		        note  D4
		  length 12
		  ymInst 20
		  ymVol 0Ah
		        noteL D4,6
		        note  D4
		        noteL D4,36
		  ymVol 06h
		        noteL D4,6
		  ymVol 0Ah
		        note  D4
		        noteL C4,96
		  ymInst 16
		  ymVol 0Bh
		        noteL D5,66
		  ymVol 08h
		        noteL D5,6
		  ymVol 0Bh
		        noteL D5,4
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		  ymInst 9
		  ymVol 0Ah
		        noteL E4,6
		  ymSustain
		        noteL F4,90
		  ymVol 08h
		        noteL F4,6
		  ymVol 06h
		  release 01h
		        note  F4
		  length 180
		repeatStart
		  ymInst 20
		  ymVol 0Bh
		        noteL D4,6
		  ymVol 08h
		        note  D4
		  ymVol 06h
		        note  D4
		        silence
		  ymVol 0Bh
		        noteL D4,12
		  ymVol 08h
		        noteL D4,6
		  ymVol 0Bh
		        note  D4
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 0Bh
		        noteL Ds4,24
		        noteL Ds4,6
		  ymVol 08h
		        note  Ds4
		  ymVol 0Bh
		        note  F4
		  ymVol 08h
		        note  F4
		  ymVol 0Bh
		        noteL F4,24
		        noteL F4,6
		  ymVol 08h
		        note  F4
		  ymVol 0Bh
		        note  Ds4
		        note  Ds4
		        noteL Ds4,36
		  ymVol 08h
		        noteL Ds4,6
		  ymVol 06h
		        note  Ds4
		  length 84
		repeatSection1Start
		  length 72
		  ymInst 38
		  ymVol 0Bh
		  ymSustain
		        noteL F5,4
		        note  Fs5
		        note  G5
		        note  A5
		        note  As5
		  release 01h
		        note  C6
		  ymInst 47
		  ymVol 0Bh
		        noteL D6,60
		        noteL F5,12
		        note  Fs5
		        noteL Ds6,36
		        noteL D6,48
		        noteL C6,24
		        noteL As5,72
		        noteL C6,12
		        note  D6
		        noteL C6,54
		  ymInst 26
		  ymVol 0Bh
		        noteL As5,6
		        note  A5
		        note  F5
		        note  Ds5
		        note  C5
		        note  As4
		        note  A4
		  length 192
		repeatEnd
		repeatSection2Start
		  length 96
		  ymInst 13
		  ymVol 0Ah
		        noteL As3,48
		        note  Fs3
		        noteL F3,12
		  ymVol 07h
		        noteL F3,6
		  ymVol 05h
		        note  F3
		  ymVol 0Ah
		        noteL F3,72
		        noteL As3,48
		        note  Gs3
		        noteL Fs3,12
		  ymVol 07h
		        noteL Fs3,6
		  ymVol 05h
		        note  Fs3
		  ymVol 0Ah
		        noteL Fs3,36
		  ymInst 38
		  ymVol 0Dh
		        noteL Cs4,12
		        note  B3
		        note  As3
		        noteL Gs3,36
		        noteL Fs3,6
		        note  Gs3
		        noteL Cs3,72
		        noteL Ds3,24
		        note  E3
		        note  Gs3
		        noteL Fs3,36
		        noteL B3,6
		  ymVol 0Ah
		        note  B3
		  ymVol 0Dh
		        noteL Fs3,144
		  ymInst 20
		  ymVol 0Bh
		        noteL Fs3,30
		  ymVol 08h
		        noteL Fs3,6
		  ymVol 0Bh
		        note  E3
		        note  Fs3
		        noteL B2,64
		  ymVol 08h
		        noteL B2,8
		  ymVol 0Bh
		        noteL Cs3,16
		  ymVol 08h
		        noteL Cs3,8
		  ymVol 0Bh
		        noteL D3,16
		  ymVol 08h
		        noteL D3,8
		  ymVol 0Bh
		        noteL Fs3,16
		  ymVol 08h
		        noteL Fs3,8
		  ymVol 0Bh
		        noteL E3,30
		  ymVol 08h
		        noteL E3,6
		  ymVol 0Bh
		        note  A3
		  ymVol 08h
		        note  A3
		  ymVol 0Bh
		        noteL E3,42
		  ymVol 08h
		        noteL E3,6
		  ymVol 0Bh
		        noteL Fs3,30
		  ymVol 08h
		        noteL Fs3,6
		  ymVol 0Bh
		        note  B3
		  ymVol 08h
		        note  B3
		  ymVol 0Bh
		        noteL Fs3,48
		  ymVol 08h
		        noteL Fs3,6
		  ymVol 06h
		        note  Fs3
		  length 12
		  ymInst 27
		  ymVol 09h
		        noteL Fs3,24
		        note  Gs3
		        note  A3
		        noteL B3,36
		        noteL E4,6
		  ymVol 05h
		        note  E4
		  ymSustain
		  ymVol 09h
		        noteL B3,54
		  ymVol 05h
		        noteL B3,6
		  release 01h
		  ymVol 03h
		        note  B3
		        silence
		  ymVol 09h
		        noteL D4,24
		        note  Cs4
		        note  B3
		        noteL B3,36
		        noteL Cs4,6
		  ymVol 05h
		        note  Cs4
		  ymSustain
		  ymVol 09h
		        noteL Cs4,54
		  ymVol 05h
		        noteL Cs4,6
		  ymVol 03h
		  release 01h
		        note  Cs4
		        silence
		  ymVol 09h
		        noteL Fs3,24
		        note  D4
		        note  B3
		        note  Cs4
		        noteL E4,48
		  ymSustain
		        noteL Gs4,24
		  ymVol 05h
		        noteL Gs4,6
		  ymVol 03h
		  release 01h
		        note  Gs4
		  length 12
		  ymInst 13
		  ymVol 0Ch
		        noteL E5,24
		  ymVol 09h
		        noteL E5,6
		  ymVol 07h
		        note  E5
		  length 12
		  ymVol 0Ch
		        noteL Fs5,24
		  ymVol 0Ch
		        noteL Gs5,6
		  ymVol 09h
		        note  Gs5
		  ymVol 07h
		        note  Gs5
		        silence
		  ymVol 0Ch
		        noteL Fs5,60
		  ymVol 09h
		        noteL Fs5,6
		  ymVol 07h
		        note  Fs5
		countedLoopStart 1
		  ymInst 26
		  ymVol 0Ch
		        noteL D5,6
		  ymVol 09h
		        note  D5
		  ymVol 0Ch
		        note  D5
		  ymVol 09h
		        note  D5
		  ymVol 0Ch
		        note  Ds5
		  ymVol 09h
		        note  Ds5
		  ymVol 07h
		        note  Ds5
		  ymVol 05h
		        note  Ds5
		  length 12
		  ymVol 0Ch
		        noteL As4,6
		  ymVol 09h
		        note  As4
		  ymVol 0Ch
		        note  As4
		  ymVol 09h
		        note  As4
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 07h
		        note  C5
		  ymVol 05h
		        note  C5
		  length 24
		  ymVol 0Ch
		        noteL A4,6
		  ymVol 09h
		        note  A4
		  ymVol 0Ch
		        note  A4
		  ymVol 09h
		        note  A4
		  ymVol 0Ch
		        note  A4
		  ymVol 09h
		        note  A4
		  ymVol 0Ch
		        note  As4
		  ymVol 09h
		        note  As4
		  ymVol 0Ch
		        note  G4
		  ymVol 09h
		        note  G4
		  ymVol 0Ch
		        note  Ds4
		  ymVol 09h
		        note  Ds4
		  ymVol 0Ch
		        note  Ds4
		  ymVol 09h
		        note  Ds4
		  ymVol 07h
		        note  Ds4
		  ymVol 05h
		        note  Ds4
		  length 24
		  ymInst 3
		  ymVol 0Dh
		        noteL C3,6
		  ymVol 0Ah
		        note  C3
		  ymVol 0Dh
		        note  Ds3
		  ymVol 0Ah
		        note  Ds3
		  ymVol 0Dh
		        note  As3
		  ymVol 0Ah
		        note  As3
		  ymVol 0Dh
		        noteL A3,24
		  ymVol 0Ah
		        noteL A3,6
		  ymVol 08h
		        note  A3
		  ymVol 0Dh
		        note  F3
		  ymVol 0Ah
		        note  F3
		  ymVol 0Dh
		        note  C4
		  ymVol 0Ah
		        note  C4
		  ymVol 0Dh
		        note  F4
		  ymVol 0Ah
		        note  F4
		  ymVol 0Dh
		        noteL Ds4,24
		countedLoopEnd
		  ymVol 0Ah
		        noteL Ds4,6
		  ymVol 08h
		        note  Ds4
		  length 24
		  ymInst 13
		  ymVol 0Ch
		        noteL E5,4
		        note  E5
		  ymVol 09h
		        note  E5
		  ymVol 0Ch
		        note  E5
		  ymVol 09h
		        note  E5
		  ymVol 0Ch
		        note  D5
		  ymVol 09h
		        note  D5
		  length 8
		  ymSustain
		  ymVol 0Ch
		        noteL E5,216
		  ymVol 09h
		        noteL E5,8
		  ymVol 07h
		        note  E5
		  release 01h
		  ymVol 05h
		        note  E5
		  length 192
		  ymInst 20
		  ymSustain
		  ymVol 0Ch
		        noteL A4,6
		  ymVol 09h
		        note  A4
		  ymVol 07h
		        note  A4
		  release 01h
		  ymVol 05h
		        note  A4
		  length 132
		        silence
		  ymVol 0Ch
		  ymSustain
		        noteL C5,6
		  ymVol 09h
		        note  C5
		  ymVol 07h
		        note  C5
		  ymVol 05h
		  release 01h
		        note  C5
		  length 192
		  ymSustain
		  ymVol 0Ch
		        noteL E5,6
		  ymVol 09h
		        note  E5
		  ymVol 07h
		        note  E5
		  ymVol 05h
		  release 01h
		        note  E5
		  length 48
		  ymSustain
		  ymVol 0Ch
		        noteL E5,6
		  ymVol 09h
		        note  E5
		  ymVol 07h
		        note  E5
		  ymVol 05h
		  release 01h
		        note  E5
		  length 48
		  ymVol 0Ch
		  ymSustain
		        noteL E5,192
		  release 01h
		        noteL E5,96
		countedLoopStart 1
		  ymVol 0Bh
		        noteL C5,6
		  ymVol 08h
		        note  C5
		  ymVol 06h
		        note  C5
		        silence
		countedLoopEnd
		  length 12
		countedLoopStart 1
		  ymVol 0Bh
		        noteL C5,6
		  ymVol 08h
		        note  C5
		  ymVol 06h
		        note  C5
		        silence
		countedLoopEnd
		  ymVol 0Bh
		        noteL As4,6
		  ymVol 08h
		        note  As4
		  ymVol 0Bh
		        note  As4
		  ymVol 08h
		        note  As4
		  ymVol 06h
		        note  As4
		        silence
		  ymVol 0Bh
		        note  B4
		        note  B4
		        note  B4
		  ymVol 08h
		        note  B4
		  ymVol 06h
		        note  B4
		        silence
		  ymVol 0Bh
		        note  B4
		  ymVol 08h
		        note  B4
		  ymVol 06h
		        note  B4
		  length 18
		  ymVol 0Bh
		        noteL Cs5,6
		  ymVol 08h
		        note  Cs5
		  ymVol 06h
		        note  Cs5
		        silence
		  ymVol 0Bh
		        note  Cs5
		  ymVol 08h
		        note  Cs5
		  ymVol 0Bh
		        note  Cs5
		  ymVol 08h
		        note  Cs5
		  ymVol 06h
		        note  Cs5
		        silence
		  ymVol 0Bh
		        note  Cs5
		        note  Cs5
		  ymVol 0Bh
		        note  D5
		  ymVol 08h
		        note  D5
		  ymVol 0Bh
		        note  As2
		        note  As2
		        note  As2
		  ymVol 08h
		        note  As2
		  ymVol 0Bh
		        note  As2
		        note  As2
		        note  As2
		  ymVol 08h
		        note  As2
		  ymVol 06h
		        note  As2
		  ymVol 04h
		        note  As2
		  length 24
		channel_end
Music_9_Channel_3:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 120
		  ymInst 16
		countedLoopStart 2
		  ymVol 09h
		        noteL G5,5
		  ymVol 05h
		        noteL G5,3
		countedLoopEnd
		  ymSustain
		  ymVol 09h
		        noteL F5,48
		  vibrato 020h
		  ymVol 07h
		        noteL F5,6
		  ymVol 05h
		        note  F5
		  ymVol 03h
		  release 01h
		        note  F5
		  length 102
		  vibrato 02Ch
		  ymVol 09h
		        noteL B5,18
		        noteL C6,4
		  length 2
		  ymVol 08h
		  ymSustain
		        noteL C6,36
		  ymVol 06h
		        noteL C6,6
		  ymVol 04h
		  release 01h
		        note  C6
		  ymInst 9
		  ymVol 08h
		        noteL A3,24
		        note  B3
		        note  C4
		        note  D4
		        note  E4
		        note  F4
		        note  G4
		  ymSustain
		        note  A4
		  ymVol 07h
		        noteL A4,6
		  ymVol 05h
		        note  A4
		  release 01h
		  ymVol 03h
		        note  A4
		        silence
		  ymInst 16
		countedLoopStart 2
		  ymVol 08h
		        noteL A5,5
		  ymVol 05h
		        noteL A5,3
		countedLoopEnd
		  ymVol 08h
		  ymSustain
		        noteL F5,48
		  ymVol 05h
		        noteL F5,6
		  ymVol 03h
		        note  F5
		  release 01h
		  ymVol 01h
		        note  F5
		        silence
		countedLoopStart 2
		  ymVol 08h
		        noteL A5,5
		  ymVol 05h
		        noteL A5,3
		countedLoopEnd
		  ymVol 08h
		  ymSustain
		        noteL F5,48
		  ymVol 05h
		        noteL F5,5
		  ymVol 03h
		        note  F5
		  ymVol 01h
		  release 01h
		        note  F5
		  length 10
		  ymVol 08h
		        noteL A5,5
		  ymVol 05h
		        noteL A5,4
		  ymVol 08h
		        noteL A5,6
		  ymVol 05h
		        noteL A5,4
		  ymVol 08h
		        noteL A5,7
		  ymVol 05h
		        noteL A5,4
		  ymVol 08h
		        noteL F5,59
		  ymSustain
		        noteL G5,132
		  ymVol 06h
		        noteL G5,6
		  ymVol 04h
		  release 01h
		        note  G5
		  ymInst 13
		  ymVol 0Ch
		        noteL C5,4
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  length 8
		  ymVol 0Ch
		        noteL C5,48
		  ymVol 09h
		        noteL C5,8
		        silence
		  shifting 020h
		  ymStereo 080h
		  release 05h
		  ymInst 27
		  ymVol 09h
		        note  E3
		        note  E3
		        note  E3
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  C4
		        note  C4
		  release 01h
		        noteL D4,12
		  ymVol 05h
		        noteL D4,6
		  ymVol 03h
		        note  D4
		  length 10
		  ymInst 20
		  ymVol 0Ah
		        noteL D4,6
		        note  D4
		        noteL D4,36
		  ymVol 06h
		        noteL D4,6
		  ymVol 0Ah
		        note  D4
		        noteL C4,96
		  ymInst 16
		  ymVol 0Ah
		        noteL D5,66
		  ymVol 07h
		        noteL D5,6
		  ymVol 0Ah
		        noteL D5,4
		        note  Cs5
		        note  C5
		        note  B4
		        note  As4
		        note  A4
		  ymInst 9
		  ymVol 09h
		        noteL E4,6
		  ymSustain
		        noteL F4,90
		  ymVol 07h
		        noteL F4,6
		  ymVol 05h
		  release 01h
		        note  F4
		  length 174
		repeatStart
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 20
		  ymVol 0Bh
		        noteL As3,6
		  ymVol 08h
		        note  As3
		  ymVol 06h
		        note  As3
		        silence
		  ymVol 0Bh
		        noteL As3,12
		  ymVol 08h
		        noteL As3,6
		  ymVol 0Bh
		        note  As3
		        note  C4
		  ymVol 08h
		        note  C4
		  ymVol 0Bh
		        noteL C4,24
		        noteL C4,6
		  ymVol 08h
		        note  C4
		  ymVol 0Bh
		        note  Cs4
		  ymVol 08h
		        note  Cs4
		  ymVol 0Bh
		        noteL Cs4,24
		        noteL Cs4,6
		  ymVol 08h
		        note  Cs4
		  ymVol 0Bh
		        note  C4
		        note  C4
		        noteL C4,36
		  ymVol 08h
		        noteL C4,6
		  ymVol 06h
		        note  C4
		  length 84
		repeatSection1Start
		  length 80
		  ymStereo 080h
		  shifting 020h
		  ymInst 38
		  ymVol 0Ah
		  ymSustain
		        noteL F5,4
		        note  Fs5
		        note  G5
		        note  A5
		        note  As5
		  release 01h
		        note  C6
		  ymInst 47
		  ymVol 0Ah
		        noteL D6,58
		        noteL F5,12
		        note  Fs5
		        noteL Ds6,36
		        noteL D6,48
		        noteL C6,24
		        noteL As5,72
		        noteL C6,12
		        note  D6
		        noteL C6,54
		  ymInst 26
		  ymVol 0Ah
		        noteL As5,6
		        note  A5
		        note  F5
		        note  Ds5
		        note  C5
		        note  As4
		        note  A4
		  length 186
		repeatEnd
		repeatSection2Start
		  length 96
		  ymInst 13
		  ymVol 0Ah
		        noteL F4,48
		        note  Ds4
		        noteL D4,12
		  ymVol 07h
		        noteL D4,6
		  ymVol 05h
		        note  D4
		  ymVol 0Ah
		        noteL D4,72
		        noteL Fs4,48
		        note  F4
		        noteL Ds4,12
		  ymVol 07h
		        noteL Ds4,6
		  ymVol 05h
		        note  Ds4
		  ymVol 0Ah
		        noteL B3,42
		  ymStereo 080h
		  shifting 020h
		  ymInst 38
		  ymVol 0Ch
		        noteL Cs4,12
		        note  B3
		        note  As3
		        noteL Gs3,36
		        noteL Fs3,6
		        note  Gs3
		        noteL Cs3,72
		        noteL Ds3,24
		        note  E3
		        note  Gs3
		        noteL Fs3,36
		        noteL B3,6
		  ymVol 09h
		        note  B3
		  ymVol 0Ch
		        noteL Fs3,144
		  ymInst 20
		  ymVol 0Ah
		        noteL Fs3,30
		  ymVol 07h
		        noteL Fs3,6
		  ymVol 0Ah
		        note  E3
		        note  Fs3
		        noteL B2,64
		  ymVol 07h
		        noteL B2,8
		  ymVol 0Ah
		        noteL Cs3,16
		  ymVol 07h
		        noteL Cs3,8
		  ymVol 0Ah
		        noteL D3,16
		  ymVol 07h
		        noteL D3,8
		  ymVol 0Ah
		        noteL Fs3,16
		  ymVol 07h
		        noteL Fs3,8
		  ymVol 0Ah
		        noteL E3,30
		  ymVol 07h
		        noteL E3,6
		  ymVol 0Ah
		        note  A3
		  ymVol 07h
		        note  A3
		  ymVol 0Ah
		        noteL E3,42
		  ymVol 07h
		        noteL E3,6
		  ymVol 0Ah
		        noteL Fs3,30
		  ymVol 07h
		        noteL Fs3,6
		  ymVol 0Ah
		        note  B3
		  ymVol 07h
		        note  B3
		  ymVol 0Ah
		        noteL Fs3,48
		  ymVol 07h
		        noteL Fs3,6
		  ymVol 05h
		        note  Fs3
		  length 12
		  ymInst 27
		  ymVol 08h
		        noteL Fs3,24
		        note  Gs3
		        note  A3
		        noteL B3,36
		        noteL E4,6
		  ymVol 04h
		        note  E4
		  ymSustain
		  ymVol 09h
		        noteL B3,54
		  ymVol 04h
		        noteL B3,6
		  release 01h
		  ymVol 02h
		        note  B3
		        silence
		  ymVol 08h
		        noteL D4,24
		        note  Cs4
		        note  B3
		        noteL B3,36
		        noteL Cs4,6
		  ymVol 04h
		        note  Cs4
		  ymSustain
		  ymVol 08h
		        noteL Cs4,54
		  ymVol 04h
		        noteL Cs4,6
		  ymVol 02h
		  release 01h
		        note  Cs4
		        silence
		  ymVol 08h
		        noteL Fs3,24
		        note  D4
		        note  B3
		        note  Cs4
		        noteL E4,48
		  ymSustain
		        noteL Gs4,24
		  ymVol 04h
		        noteL Gs4,6
		  ymVol 02h
		  release 01h
		        note  Gs4
		        silence
		  shifting 00h
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Ch
		        noteL Cs5,24
		  ymVol 09h
		        noteL Cs5,6
		  ymVol 07h
		        note  Cs5
		  length 12
		  ymVol 0Ch
		        noteL Ds5,24
		  ymVol 0Ch
		        noteL E5,6
		  ymVol 09h
		        note  E5
		  ymVol 07h
		        note  E5
		        silence
		  ymVol 0Ch
		        noteL D5,60
		  ymVol 09h
		        noteL D5,6
		  ymVol 07h
		        note  D5
		        silence
		  ymStereo 080h
		  shifting 020h
		countedLoopStart 1
		  ymInst 26
		  ymVol 0Bh
		        noteL D5,6
		  ymVol 08h
		        note  D5
		  ymVol 0Bh
		        note  D5
		  ymVol 08h
		        note  D5
		  ymVol 0Bh
		        note  Ds5
		  ymVol 08h
		        note  Ds5
		  ymVol 06h
		        note  Ds5
		  ymVol 04h
		        note  Ds5
		  length 12
		  ymVol 0Bh
		        noteL As4,6
		  ymVol 08h
		        note  As4
		  ymVol 0Bh
		        note  As4
		  ymVol 08h
		        note  As4
		  ymVol 0Bh
		        note  C5
		  ymVol 08h
		        note  C5
		  ymVol 06h
		        note  C5
		  ymVol 04h
		        note  C5
		  length 24
		  ymVol 0Bh
		        noteL A4,6
		  ymVol 08h
		        note  A4
		  ymVol 0Bh
		        note  A4
		  ymVol 08h
		        note  A4
		  ymVol 0Bh
		        note  A4
		  ymVol 08h
		        note  A4
		  ymVol 0Bh
		        note  As4
		  ymVol 08h
		        note  As4
		  ymVol 0Bh
		        note  G4
		  ymVol 08h
		        note  G4
		  ymVol 0Bh
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 0Bh
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 06h
		        note  Ds4
		  ymVol 04h
		        note  Ds4
		  length 24
		  ymInst 3
		  ymVol 0Ch
		        noteL C3,6
		  ymVol 09h
		        note  C3
		  ymVol 0Ch
		        note  Ds3
		  ymVol 09h
		        note  Ds3
		  ymVol 0Ch
		        note  As3
		  ymVol 09h
		        note  As3
		  ymVol 0Ch
		        noteL A3,24
		  ymVol 09h
		        noteL A3,6
		  ymVol 07h
		        note  A3
		  ymVol 0Ch
		        note  F3
		  ymVol 09h
		        note  F3
		  ymVol 0Ch
		        note  C4
		  ymVol 09h
		        note  C4
		  ymVol 0Ch
		        note  F4
		  ymVol 09h
		        note  F4
		  ymVol 0Ch
		        noteL Ds4,24
		countedLoopEnd
		  ymVol 09h
		        noteL Ds4,6
		  ymVol 07h
		        note  Ds4
		  length 18
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 13
		  ymVol 0Ch
		        noteL C5,4
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  length 8
		  ymSustain
		  ymVol 0Ch
		        noteL C5,216
		  ymVol 09h
		        noteL C5,8
		  ymVol 07h
		        note  C5
		  ymVol 05h
		  release 01h
		        note  C5
		  length 198
		  shifting 020h
		  ymStereo 080h
		  ymInst 20
		  ymSustain
		  ymVol 0Bh
		        noteL A4,6
		  ymVol 08h
		        note  A4
		  ymVol 06h
		        note  A4
		  release 01h
		  ymVol 04h
		        note  A4
		  length 132
		        silence
		  ymVol 0Bh
		  ymSustain
		        noteL C5,6
		  ymVol 08h
		        note  C5
		  ymVol 06h
		        note  C5
		  ymVol 04h
		  release 01h
		        note  C5
		  length 192
		  ymSustain
		  ymVol 0Bh
		        noteL E5,6
		  ymVol 08h
		        note  E5
		  ymVol 06h
		        note  E5
		  ymVol 04h
		  release 01h
		        note  E5
		  length 48
		  ymSustain
		  ymVol 0Bh
		        noteL E5,6
		  ymVol 08h
		        note  E5
		  ymVol 06h
		        note  E5
		  ymVol 04h
		  release 01h
		        note  E5
		  length 48
		  ymVol 0Bh
		  ymSustain
		        noteL E5,186
		  release 01h
		        noteL E5,96
		countedLoopStart 1
		  ymVol 0Bh
		        noteL As4,6
		  ymVol 08h
		        note  As4
		  ymVol 06h
		        note  As4
		        silence
		countedLoopEnd
		  length 12
		countedLoopStart 1
		  ymVol 0Bh
		        noteL Gs4,6
		  ymVol 08h
		        note  Gs4
		  ymVol 06h
		        note  Gs4
		        silence
		countedLoopEnd
		  ymVol 0Bh
		        noteL Fs4,6
		  ymVol 08h
		        note  Fs4
		  ymVol 0Bh
		        note  Fs4
		  ymVol 08h
		        note  Fs4
		  ymVol 06h
		        note  Fs4
		        silence
		  ymVol 0Bh
		        note  Gs4
		        note  Gs4
		        note  Gs4
		  ymVol 08h
		        note  Gs4
		  ymVol 06h
		        note  Gs4
		        silence
		  ymVol 0Bh
		        note  Gs4
		  ymVol 08h
		        note  Gs4
		  ymVol 06h
		        note  Gs4
		  length 18
		  ymVol 0Bh
		        noteL Gs4,6
		  ymVol 08h
		        note  Gs4
		  ymVol 06h
		        note  Gs4
		        silence
		  ymVol 0Bh
		        note  A4
		  ymVol 08h
		        note  A4
		  ymVol 0Bh
		        note  A4
		  ymVol 08h
		        note  A4
		  ymVol 06h
		        note  A4
		        silence
		  ymVol 0Bh
		        note  A4
		        note  A4
		  ymVol 0Bh
		        note  As4
		  ymVol 08h
		        note  As4
		  ymInst 32
		  ymVol 0Dh
		        note  As2
		        note  As2
		        note  As2
		  ymVol 0Ah
		        note  As2
		  ymVol 0Dh
		        note  As2
		        note  As2
		        note  As2
		  ymVol 0Ah
		        note  As2
		  ymVol 08h
		        note  As2
		  ymVol 06h
		        note  As2
		  length 24
		channel_end
Music_9_Channel_4:
		  shifting 020h
		  ymStereo 040h
		  release 01h
		  vibrato 035h
		  length 6
		  ymInst 15
		  ymVol 00h
		        noteL F2,12
		  ymVol 0Ah
		        note  E3
		        note  F3
		        note  C4
		        noteL B3,36
		        noteL G3,12
		        note  A3
		        note  C4
		  vibrato 03Ch
		  ymSustain
		        noteL E4,72
		  vibrato 030h
		  ymVol 08h
		        noteL E4,6
		  ymVol 06h
		  release 01h
		        note  E4
		  ymVol 0Ah
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        noteL A3,18
		        noteL E4,6
		  vibrato 03Ch
		  ymSustain
		        noteL G4,72
		  vibrato 030h
		  ymVol 08h
		        noteL G4,6
		  ymVol 06h
		  release 01h
		        note  G4
		  ymVol 0Ah
		  vibrato 035h
		        noteL E3,12
		        note  F3
		        note  C4
		        note  B3
		        note  G3
		        note  A3
		        note  E4
		        note  D4
		        note  B3
		        note  C4
		        noteL G4,24
		        noteL F4,12
		  vibrato 03Ch
		  ymSustain
		        noteL B4,24
		  vibrato 030h
		  ymVol 08h
		        noteL B4,6
		  ymVol 06h
		  release 01h
		        note  B4
		  ymVol 0Ah
		  vibrato 035h
		        noteL C4,12
		        note  G4
		        note  F4
		  vibrato 03Ch
		  ymSustain
		        noteL B4,48
		  vibrato 030h
		  ymVol 08h
		        noteL B4,6
		  ymVol 06h
		  release 01h
		        note  B4
		  vibrato 035h
		  ymVol 0Ah
		        noteL C4,12
		        noteL G4,18
		        noteL F4,6
		  vibrato 03Ch
		  ymSustain
		        noteL B4,48
		  vibrato 030h
		  ymVol 08h
		        noteL B4,6
		  ymVol 06h
		  release 01h
		        note  B4
		  ymVol 0Ah
		  vibrato 035h
		        noteL C5,12
		        noteL G5,18
		        noteL F5,6
		  vibrato 03Fh
		  ymSustain
		        noteL B5,222
		  vibrato 030h
		  ymVol 08h
		        noteL B5,7
		  ymVol 06h
		  release 01h
		        note  B5
		  vibrato 02Ch
		  ymInst 13
		  ymVol 0Bh
		        noteL G5,4
		        note  G5
		  ymVol 08h
		        note  G5
		  ymVol 0Bh
		        note  G5
		  ymVol 08h
		        note  G5
		  ymVol 0Bh
		        note  F5
		  ymVol 08h
		        note  F5
		  ymVol 0Bh
		        note  E5
		  ymVol 08h
		        note  E5
		  ymVol 0Bh
		        noteL F5,48
		  ymVol 08h
		        noteL F5,8
		  release 05h
		  ymInst 27
		  ymVol 09h
		        note  G3
		        note  G3
		        note  G3
		        note  As3
		        note  As3
		        note  As3
		        note  D4
		        note  D4
		        note  D4
		        note  E4
		        note  E4
		  release 01h
		        noteL F4,12
		  ymVol 05h
		        noteL F4,6
		  ymVol 03h
		        note  F4
		  length 10
		  ymInst 20
		  ymVol 0Ah
		        noteL E4,6
		        note  E4
		        noteL E4,36
		  ymVol 06h
		        noteL E4,6
		  ymVol 0Ah
		        note  F4
		        noteL D4,96
		  ymInst 16
		  ymVol 0Ah
		        noteL F5,6
		        note  E5
		        noteL F5,54
		  ymVol 07h
		        noteL F5,6
		  ymVol 0Ah
		        noteL F5,4
		        note  E5
		        note  Ds5
		        note  D5
		        note  Cs5
		        note  C5
		  ymSustain
		        noteL D5,96
		  ymVol 07h
		        noteL D5,6
		  release 01h
		  ymVol 05h
		        note  D5
		repeatStart
		  ymInst 27
		  ymVol 0Ah
		        noteL A3,12
		        noteL As3,6
		  ymVol 06h
		        note  As3
		  ymVol 0Ah
		        note  G4
		  ymVol 06h
		        note  G4
		  ymVol 0Ah
		        noteL F4,36
		        noteL D4,6
		  ymVol 06h
		        note  D4
		  ymVol 0Ah
		        note  Ds4
		  ymVol 06h
		        note  Ds4
		  ymVol 0Ah
		        noteL C5,24
		        noteL As4,6
		  ymVol 06h
		        note  As4
		  ymVol 0Ah
		        noteL A4,24
		        noteL D4,18
		        noteL Ds4,6
		  ymInst 20
		  ymVol 0Ah
		        note  F4
		  ymVol 07h
		        note  F4
		  ymVol 05h
		        note  F4
		        silence
		  ymVol 0Ah
		        noteL F4,12
		  ymVol 07h
		        noteL F4,6
		  ymVol 0Ah
		        note  F4
		        note  G4
		  ymVol 07h
		        note  G4
		  ymVol 0Ah
		        noteL G4,24
		        noteL G4,6
		  ymVol 07h
		        note  G4
		  ymVol 0Ah
		        note  Gs4
		  ymVol 07h
		        note  Gs4
		  ymVol 0Ah
		        noteL Gs4,24
		        noteL Gs4,6
		  ymVol 07h
		        note  Gs4
		  ymVol 0Ah
		        note  G4
		        note  F4
		        noteL G4,36
		  ymVol 07h
		        noteL G4,6
		  ymVol 05h
		        note  G4
		  ymInst 26
		repeatSection1Start
		  ymVol 0Bh
		        noteL A4,12
		        note  As4
		        note  G5
		        note  F5
		        note  D5
		        noteL Ds5,6
		  ymVol 08h
		        note  Ds5
		  ymVol 06h
		        note  Ds5
		  ymVol 0Bh
		        note  As5
		        noteL C6,36
		        noteL As5,12
		        noteL A5,48
		  ymVol 08h
		        noteL A5,6
		  ymVol 06h
		        note  A5
		  ymVol 0Bh
		        noteL F3,12
		        note  Fs3
		        note  Ds4
		        noteL D4,36
		        noteL C4,12
		        note  C4
		        noteL As3,24
		        noteL As3,6
		        note  A3
		        note  As3
		  ymVol 08h
		        note  As3
		  ymVol 0Bh
		        noteL G3,12
		        note  A3
		        note  As3
		        note  D4
		        noteL C4,24
		        note  G4
		        noteL G4,12
		        note  F4
		        note  E4
		        noteL G4,6
		  ymVol 08h
		        note  G4
		  ymVol 0Bh
		        noteL F4,84
		  ymVol 08h
		        noteL F4,6
		  ymVol 06h
		        note  F4
		repeatEnd
		repeatSection2Start
		  ymVol 0Ch
		        noteL A3,12
		        note  As3
		        note  G4
		        note  F4
		        note  D4
		        noteL Ds4,6
		  ymVol 09h
		        note  Ds4
		  ymVol 07h
		        note  Ds4
		  ymVol 0Ch
		        note  As4
		        noteL C5,36
		        noteL As4,12
		        noteL A4,36
		  ymInst 13
		  ymVol 0Bh
		        noteL As4,6
		        note  C5
		        noteL Cs5,30
		  ymVol 08h
		        noteL Cs5,6
		  ymVol 0Bh
		        note  Cs5
		        note  Cs5
		        note  C5
		  ymVol 08h
		        note  C5
		  ymVol 0Bh
		        note  As4
		  ymVol 08h
		        note  As4
		  ymVol 0Bh
		        note  Gs4
		  ymVol 08h
		        note  Gs4
		  ymVol 0Bh
		        note  C5
		  ymVol 08h
		        note  C5
		  ymVol 0Bh
		        note  As4
		  ymVol 08h
		        note  As4
		  ymVol 0Bh
		        note  F4
		  ymVol 08h
		        note  F4
		  ymVol 0Bh
		        noteL As4,60
		  ymVol 08h
		        noteL As4,6
		  ymVol 06h
		        note  As4
		  ymVol 0Bh
		        noteL F5,30
		  ymVol 08h
		        noteL F5,6
		  ymVol 0Bh
		        note  F5
		        note  F5
		        note  Ds5
		  ymVol 08h
		        note  Ds5
		  ymVol 0Bh
		        note  Cs5
		  ymVol 08h
		        note  Cs5
		  ymVol 0Bh
		        note  C5
		  ymVol 08h
		        note  C5
		  ymVol 0Bh
		        note  Ds5
		  ymVol 08h
		        note  Ds5
		  ymVol 0Bh
		        note  Cs5
		  ymVol 08h
		        note  Cs5
		  ymVol 0Bh
		        note  Gs5
		  ymVol 08h
		        note  Gs5
		  ymVol 0Bh
		        noteL Fs5,72
		  ymVol 08h
		        noteL Fs5,6
		  ymVol 06h
		        note  Fs5
		  ymVol 04h
		        note  Fs5
		  length 30
		  ymInst 7
		  ymVol 08h
		        noteL E4,24
		        note  Fs4
		        noteL Gs4,60
		        noteL Fs4,12
		        note  E4
		        note  Cs4
		        noteL Ds4,72
		        noteL Fs4,24
		  ymSustain
		        noteL B4,120
		  ymVol 06h
		        noteL B4,6
		  ymVol 04h
		        note  B4
		  release 01h
		  ymVol 02h
		        note  B4
		        silence
		  ymInst 9
		  ymVol 09h
		        noteL D4,24
		        note  E4
		        noteL Fs4,60
		        noteL B4,12
		        note  Cs5
		        note  D5
		        noteL Cs5,72
		        noteL A4,24
		        noteL B4,68
		  ymInst 26
		  ymVol 0Bh
		  ymSustain
		        noteL Gs3,4
		        note  A3
		        note  B3
		        note  Cs4
		        note  Ds4
		        note  E4
		  release 01h
		        note  Fs4
		  ymVol 0Ch
		  ymSustain
		        noteL Gs4,20
		  release 01h
		  ymSlide 035h
		        noteL Gs5,40
		  ymStopSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		        noteL E5,24
		        noteL Gs4,72
		        noteL Gs4,12
		        note  Fs4
		        note  Gs4
		        note  A4
		        noteL E4,36
		        noteL Fs4,12
		        noteL Gs4,96
		  ymSustain
		        noteL Gs4,20
		  release 01h
		  ymSlide 035h
		        noteL Gs5,40
		  ymStopSlide
		        noteL A5,12
		        note  Gs5
		        note  Fs5
		  ymSustain
		        noteL E5,20
		  release 01h
		  ymSlide 035h
		        noteL Cs6,40
		  ymStopSlide
		        noteL B5,12
		        note  Gs5
		        note  E5
		  ymInst 20
		  ymVol 0Bh
		        noteL Cs5,6
		        note  Ds5
		        noteL E5,18
		  ymVol 08h
		        noteL E5,6
		  ymVol 0Bh
		        note  E5
		  ymVol 08h
		        note  E5
		  ymVol 0Bh
		        note  Ds5
		        note  E5
		        noteL Fs5,24
		  ymSustain
		        noteL B4,4
		        note  Cs5
		  release 01h
		        note  Ds5
		        noteL E5,6
		        note  Fs5
		        note  Gs5
		  ymVol 08h
		        note  Gs5
		  ymVol 0Bh
		        noteL A5,48
		  ymInst 26
		  ymVol 0Bh
		  ymSustain
		        noteL C5,4
		        note  D5
		        note  E5
		        note  F5
		        note  G5
		  release 01h
		        note  A5
		countedLoopStart 1
		  ymInst 26
		  ymVol 0Ch
		        noteL As5,6
		  ymVol 09h
		        note  As5
		  ymVol 0Ch
		        note  As5
		  ymVol 09h
		        note  As5
		  ymVol 0Ch
		        note  C6
		  ymVol 09h
		        note  C6
		  ymVol 07h
		        note  C6
		  ymVol 05h
		        note  C6
		  length 12
		  ymVol 0Ch
		        noteL G5,6
		  ymVol 09h
		        note  G5
		  ymVol 0Ch
		        note  G5
		  ymVol 09h
		        note  G5
		  ymVol 0Ch
		        note  A5
		  ymVol 09h
		        note  A5
		  ymVol 07h
		        note  A5
		  ymVol 05h
		        note  A5
		  length 24
		  ymVol 0Ch
		        noteL F5,6
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  G5
		  ymVol 09h
		        note  G5
		  ymVol 0Ch
		        note  Ds5
		  ymVol 09h
		        note  Ds5
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		        note  C5
		  ymVol 09h
		        note  C5
		  ymVol 07h
		        note  C5
		  ymVol 05h
		        note  C5
		  ymInst 13
		  ymVol 0Ch
		        note  F3
		  ymVol 09h
		        note  F3
		  ymVol 0Ch
		        note  C4
		  ymVol 09h
		        note  C4
		  ymVol 0Ch
		        note  F4
		  ymVol 09h
		        note  F4
		  ymVol 0Ch
		        noteL Ds4,24
		  ymVol 09h
		        noteL Ds4,6
		  ymVol 07h
		        note  Ds4
		  ymVol 0Ch
		        note  C4
		  ymVol 09h
		        note  C4
		  ymVol 0Ch
		        note  Ds4
		  ymVol 09h
		        note  Ds4
		  ymVol 0Ch
		        note  As4
		  ymVol 09h
		        note  As4
		  ymVol 0Ch
		        noteL A4,48
		countedLoopEnd
		  ymVol 09h
		        noteL A4,6
		  ymVol 07h
		        note  A4
		  length 26
		  ymVol 0Bh
		        noteL G5,4
		        note  G5
		  ymVol 08h
		        note  G5
		  ymVol 0Bh
		        note  G5
		  ymVol 08h
		        note  G5
		  ymVol 0Bh
		        note  F5
		  ymVol 08h
		        note  F5
		  ymVol 0Bh
		        note  E5
		  ymVol 08h
		        note  E5
		  ymSustain
		  ymVol 0Bh
		        noteL F5,214
		  ymVol 08h
		        noteL F5,8
		  ymVol 06h
		        note  F5
		  release 01h
		  ymVol 04h
		        note  F5
		  ymInst 0
		  ymVol 0Bh
		        noteL A2,24
		        note  As2
		        note  F3
		        noteL E3,72
		        noteL C3,24
		        noteL D3,12
		        note  F3
		  ymSustain
		        note  A3
		  ymVol 08h
		        noteL A3,6
		  release 01h
		  ymVol 06h
		        note  A3
		  length 156
		  ymVol 0Bh
		        noteL A2,12
		        note  As2
		        note  F3
		        noteL E3,36
		        noteL C3,12
		        noteL D3,18
		        noteL A3,6
		  ymSustain
		        noteL C4,12
		  ymVol 08h
		        noteL C4,6
		  ymVol 06h
		  release 01h
		        note  C4
		  length 36
		  ymVol 0Bh
		        noteL A2,12
		        note  As2
		        note  F3
		        note  E3
		        note  C3
		        note  D3
		        note  A3
		        noteL G3,18
		        noteL E3,6
		        noteL F3,12
		        noteL C4,24
		        noteL As3,12
		  ymVol 0Bh
		  ymSustain
		        note  E4
		  ymVol 08h
		        noteL E4,6
		  release 01h
		  ymVol 06h
		        note  E4
		  length 12
		  ymVol 0Bh
		        note  F3
		        note  C4
		        note  As3
		  ymSustain
		        note  E4
		  ymVol 08h
		        noteL E4,6
		  ymVol 06h
		  release 01h
		        note  E4
		  length 12
		  ymInst 26
		  ymVol 0Bh
		        note  F4
		        noteL C5,18
		        noteL As4,6
		  ymInst 15
		  ymVol 0Bh
		        noteL E5,54
		  ymInst 26
		  ymVol 0Bh
		        noteL D5,4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A3
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B3
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs4
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D4
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E4
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  E5
		        note  D5
		        note  Cs5
		        note  B4
		        note  A4
		        note  Gs4
		        note  Fs4
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		        note  D5
		        note  Gs4
		        note  A4
		        note  B4
		        note  Cs5
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 20
		countedLoopStart 1
		  ymVol 0Bh
		        noteL D4,6
		  ymVol 08h
		        note  D4
		  ymVol 06h
		        note  D4
		        silence
		countedLoopEnd
		  length 12
		countedLoopStart 1
		  ymVol 0Bh
		        noteL Cs4,6
		  ymVol 08h
		        note  Cs4
		  ymVol 06h
		        note  Cs4
		        silence
		countedLoopEnd
		  ymVol 0Bh
		        noteL Cs4,6
		  ymVol 08h
		        note  Cs4
		  ymVol 0Bh
		        note  Cs4
		  ymVol 08h
		        note  Cs4
		  ymVol 06h
		        note  Cs4
		        silence
		  ymVol 0Bh
		        note  Ds4
		        note  Ds4
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 06h
		        note  Ds4
		        silence
		  ymVol 0Bh
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 06h
		        note  Ds4
		  length 18
		  ymVol 0Bh
		        noteL Ds4,6
		  ymVol 08h
		        note  Ds4
		  ymVol 06h
		        note  Ds4
		        silence
		  ymVol 0Bh
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 0Bh
		        note  Ds4
		  ymVol 08h
		        note  Ds4
		  ymVol 06h
		        note  Ds4
		        silence
		  ymVol 0Bh
		        note  Ds4
		        note  Ds4
		  ymVol 0Bh
		        note  F4
		  ymVol 08h
		        note  F4
		  ymVol 06h
		        note  F4
		  ymStereo 040h
		  shifting 020h
		  ymVol 0Ah
		        note  As3
		        note  As3
		        note  As3
		  ymVol 07h
		        note  As3
		  ymVol 0Ah
		        note  As3
		        note  As3
		        note  As3
		  ymVol 08h
		        note  As3
		  ymVol 07h
		        note  As3
		  ymVol 05h
		        note  As3
		  length 18
		channel_end
Music_9_Channel_5:
		  ymStereo 0C0h
		countedLoopStart 9
		  length 96
		countedLoopEnd
		  length 18
		        sampleL 4,3
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
		        sampleL 5,24
		        sampleL 5,48
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 3
		        sampleL 2,4
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		countedLoopEnd
		        sampleL 2,12
		        sampleL 0,6
		        sample  0
		        sampleL 0,12
		        sampleL 4,6
		        sample  4
		        sample  3
		        sample  4
		        sampleL 4,12
		        sample  3
		        sampleL 4,6
		        sample  4
		countedLoopStart 1
		        sampleL 3,6
		        sample  4
		        sampleL 4,24
		        sampleL 4,6
		        sample  4
		        sample  3
		        sample  4
		        sampleL 4,12
		        sample  3
		        sampleL 4,6
		        sample  4
		countedLoopEnd
		        sampleL 3,6
		        sample  4
		        sampleL 4,24
		        sampleL 4,6
		        sample  4
		        sample  3
		        sample  4
		        sampleL 4,12
		        sampleL 4,120
		repeatStart
		  length 84
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		countedLoopStart 1
		        sampleL 2,12
		        sampleL 3,4
		        sample  4
		        sample  4
		        sampleL 2,12
		        sampleL 3,6
		        sampleL 3,5
		        sampleL 4,1
		countedLoopEnd
		        sampleL 2,4
		        sample  4
		        sample  4
		        sample  3
		        sample  4
		        sample  4
		        sampleL 2,12
		        sampleL 3,6
		        sample  3
		        sample  5
		        sample  2
		        sampleL 5,12
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,192
		repeatSection1Start
		  length 240
		        silence
		repeatEnd
		repeatSection2Start
		repeatStart
		countedLoopStart 1
		        sampleL 2,24
		        sampleL 0,12
		        sampleL 3,4
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 5,24
		        sampleL 5,48
		repeatSection1Start
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		repeatEnd
		repeatSection2Start
		        sampleL 3,3
		        sample  3
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		        sample  4
		countedLoopStart 2
		        sampleL 1,60
		        sampleL 1,24
		        sampleL 1,12
		        sampleL 1,96
		  length 192
		countedLoopEnd
		        sampleL 1,60
		        sampleL 1,24
		        sampleL 1,12
		        sampleL 1,72
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 1
		        sampleL 2,24
		        sampleL 0,12
		        sampleL 3,4
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 5,24
		        sampleL 5,48
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		repeatStart
		        sampleL 2,6
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,12
		        sampleL 0,6
		        sample  0
		        sampleL 0,12
		        sampleL 3,6
		        sample  3
		        sample  2
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,12
		        sampleL 0,6
		        sample  0
		        sampleL 0,12
		        sampleL 3,6
		        sample  3
		countedLoopStart 1
		        sampleL 2,6
		        sample  3
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 2,12
		        sampleL 5,6
		        sample  0
		        sampleL 0,12
		        sampleL 4,4
		        sample  4
		        sample  4
		countedLoopStart 5
		        sampleL 2,4
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		        sampleL 5,12
		        sampleL 0,4
		        sampleL 0,8
		        sampleL 0,24
		        sample  5
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		countedLoopStart 12
		        sampleL 2,12
		        sampleL 3,4
		        sampleL 2,8
		        sample  2
		        sample  3
		        sample  3
		        sample  0
		        sample  3
		        sampleL 3,7
		        sampleL 3,1
		        sampleL 2,8
		        sample  3
		        sample  3
		countedLoopEnd
		        sampleL 2,12
		        sampleL 3,4
		        sampleL 2,8
		        sampleL 5,24
		countedLoopStart 1
		        sampleL 2,4
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		countedLoopEnd
		        sampleL 2,12
		        sampleL 4,4
		        sample  4
		        sample  3
		        sampleL 2,24
		        sampleL 0,11
		        sampleL 3,1
		        sampleL 2,24
		        sampleL 2,6
		        sampleL 3,18
		        sampleL 2,12
		        sampleL 2,24
		        sampleL 2,6
		        sample  3
		        sampleL 2,23
		        sampleL 3,1
		        sampleL 2,12
		        sample  0
		        sampleL 4,4
		        sample  4
		        sample  3
		        sampleL 5,24
		        sampleL 2,6
		        sample  3
		        sampleL 2,12
		        sample  2
		        sampleL 2,6
		        sample  3
		        sampleL 5,12
		        sampleL 2,6
		        sample  3
		        sampleL 2,12
		        sampleL 2,6
		        sample  3
		        sampleL 5,48
		channel_end
Music_9_Channel_6:
		  ymTimer 098h
		  vibrato 040h
		  psgInst 0
		  release 080h
		  psgInst 0
		        psgNoteL E4,6
		  psgInst 1
		        psgNote  E4
		  psgInst 2
		        psgNote  E4
		  psgInst 118
		countedLoopStart 8
		        psgNoteL E4,96
		countedLoopEnd
		  psgInst 121
		        psgNoteL Gs4,96
		  ymTimer 0C4h
		  release 01h
		        psgNoteL Gs4,36
		  length 12
		  vibrato 04Ch
		  psgInst 12
		        psgNoteL G4,4
		        psgNote  G4
		        silence
		        psgNoteL G4,72
		  psgInst 13
		        psgNoteL G5,4
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  B4
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNoteL D6,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 42
		  psgInst 125
		        psgNoteL D6,4
		        psgNote  E6
		        psgNote  Fs6
		        psgNoteL G6,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 18
		  psgInst 125
		        psgNoteL G5,4
		        psgNote  A5
		        psgNote  B5
		        psgNoteL Cs6,6
		        silence
		        psgNoteL D5,4
		        psgNote  E5
		        psgNote  Fs5
		        psgNoteL G5,6
		        silence
		  psgInst 11
		        silence
		  psgInst 9
		        silence
		  psgInst 125
		        psgNoteL A5,4
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs5
		  psgInst 123
		countedLoopStart 2
		        psgNoteL B4,6
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNoteL B4,12
		  length 6
		        psgNote  B4
		countedLoopEnd
		repeatStart
		        psgNoteL C5,6
		        psgNote  C5
		        psgNote  C5
		        silence
		        psgNote  C5
		        silence
		        psgNote  C5
		        psgNote  C5
		        psgNote  C5
		        psgNote  C5
		        psgNote  C5
		        silence
		        psgNoteL C5,12
		  length 6
		        psgNote  C5
		  psgInst 13
		        psgNote  A4
		        psgNote  B4
		        psgNote  D5
		        psgNote  G5
		        psgNote  B5
		        psgNote  G5
		        psgNote  D5
		        psgNote  B4
		        psgNote  C5
		        psgNote  D5
		        psgNote  E5
		        psgNote  A5
		        psgNote  C6
		        psgNote  A5
		        psgNote  E5
		        psgNote  C5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  As5
		        psgNote  D6
		        psgNote  As5
		        psgNote  F5
		        psgNote  D5
		        psgNote  E5
		        psgNote  F5
		        psgNote  G5
		        psgNote  C6
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  A5
		        psgNote  D6
		  psgInst 123
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNoteL B4,12
		  length 6
		        psgNote  B4
		        psgNote  C5
		        psgNote  C5
		        psgNote  C5
		        silence
		        psgNote  C5
		        silence
		        psgNote  C5
		        psgNote  C5
		        psgNote  C5
		        silence
		        psgNoteL A4,18
		  length 6
		        psgNote  A4
		        silence
		repeatSection1Start
		        psgNoteL A5,6
		        psgNote  A5
		        psgNote  A5
		        silence
		        psgNote  A5
		        silence
		        psgNote  A5
		        psgNote  A5
		        psgNote  A5
		        psgNote  A5
		        psgNote  G5
		        silence
		        psgNoteL Fs5,12
		  length 6
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  E5
		        psgNote  E5
		        silence
		        psgNote  E5
		        silence
		        psgNote  E5
		        psgNote  E5
		        psgNote  E5
		        psgNote  E5
		        psgNote  E5
		        silence
		        psgNoteL E5,24
		        psgNoteL G5,6
		        psgNote  G5
		        psgNote  G5
		        silence
		        psgNote  G5
		        silence
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        silence
		        psgNoteL G5,12
		  length 6
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        silence
		        psgNote  G5
		        silence
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        psgNote  G5
		        silence
		        psgNoteL Fs5,12
		  length 6
		        psgNote  Fs5
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNoteL B4,12
		  length 6
		        psgNote  B4
		repeatEnd
		repeatSection2Start
		  psgInst 125
		        psgNoteL G5,48
		        psgNoteL F5,12
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		  psgInst 13
		        psgNoteL B4,6
		        silence
		  psgInst 11
		  length 12
		  psgInst 125
		        psgNoteL B4,24
		  length 6
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  B5
		        psgNote  D6
		        psgNote  G6
		        psgNoteL As6,48
		        psgNote  A6
		        psgNoteL G6,6
		        psgNote  F6
		        psgNote  Ds6
		        psgNote  D6
		        psgNoteL C6,40
		        psgNoteL As5,4
		        psgNote  Gs5
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  As4
		countedLoopStart 1
		  psgInst 123
		        psgNoteL As5,6
		        silence
		        psgNote  As5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL As5,6
		        silence
		        psgNote  As5
		        silence
		        psgNote  As5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL As5,6
		        psgNote  As5
		countedLoopEnd
		        psgNoteL Gs5,6
		        silence
		        psgNote  Gs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Gs5,6
		        silence
		        psgNote  Gs5
		        silence
		        psgNote  Gs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Gs5,6
		        psgNote  Gs5
		        psgNote  Gs5
		        silence
		        psgNote  Gs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Gs5,6
		        silence
		  psgInst 124
		        psgNote  Gs6
		        psgNote  As6
		        psgNote  C7
		        psgNote  Ds7
		        psgNote  Cs7
		        psgNote  C7
		        psgNote  Gs6
		        psgNote  Ds6
		countedLoopStart 1
		  psgInst 123
		        psgNoteL Gs5,6
		        silence
		        psgNote  Gs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Gs5,6
		        silence
		        psgNote  Gs5
		        silence
		        psgNote  Gs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Gs5,6
		        psgNote  Gs5
		countedLoopEnd
		        psgNoteL Fs5,6
		        silence
		        psgNote  Fs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Fs5,6
		  length 12
		  psgInst 124
		        psgNoteL Ds6,6
		        psgNote  F6
		        psgNote  Fs6
		        psgNote  As6
		        psgNote  Cs7
		        psgNote  B6
		        psgNote  As6
		  psgInst 123
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        silence
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        psgNote  F5
		        psgNote  Ds5
		        silence
		        psgNote  Ds5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Ds5,6
		        silence
		        psgNote  Ds5
		        silence
		        psgNote  Ds5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Ds5,6
		        psgNote  Ds5
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        silence
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        psgNote  F5
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL B4,6
		        silence
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL B4,6
		        psgNote  B4
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        silence
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        psgNote  Cs5
		        psgNote  Ds5
		        silence
		        psgNote  Ds5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Ds5,6
		        silence
		        psgNote  Ds5
		        silence
		        psgNote  Ds5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Ds5,6
		        psgNote  Ds5
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        silence
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        psgNote  F5
		  psgInst 0
		  length 24
		  psgInst 12
		        psgNote  Fs4
		  length 6
		  psgInst 10
		        silence
		  psgInst 8
		  length 12
		  psgInst 12
		        psgNoteL Gs4,24
		        psgNoteL As4,6
		        silence
		  psgInst 10
		        silence
		  psgInst 8
		        silence
		  psgInst 12
		        psgNoteL B4,60
		  length 6
		  psgInst 10
		        silence
		countedLoopStart 1
		  psgInst 12
		        psgNoteL A4,6
		        silence
		        psgNote  A4
		        silence
		        psgNote  A4
		        silence
		  psgInst 0
		  length 24
		  psgInst 12
		        psgNoteL A4,6
		        silence
		        psgNote  A4
		        silence
		        psgNote  A4
		        silence
		  psgInst 0
		  length 36
		  psgInst 12
		        psgNoteL A4,6
		        silence
		        psgNote  A4
		        silence
		        psgNote  A4
		        silence
		        psgNote  C5
		        silence
		        psgNote  C5
		        silence
		        psgNote  A4
		        silence
		        psgNote  A4
		        silence
		  psgInst 0
		  length 24
		  psgInst 13
		        psgNoteL C6,4
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E6
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs6
		        psgNote  E6
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G6
		        psgNote  Fs6
		        psgNote  E6
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A6
		        psgNote  G6
		        psgNote  Fs6
		        psgNote  E6
		        psgNote  D6
		        psgNote  C6
		countedLoopEnd
		  ymTimer 0C2h
		  psgInst 0
		  length 36
		  psgInst 12
		        psgNoteL G4,4
		        psgNote  G4
		        silence
		        psgNoteL G4,240
		  length 8
		  psgInst 10
		        silence
		  psgInst 8
		        silence
		  psgInst 0
		  length 192
		  psgInst 13
		        psgNoteL Cs5,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 135
		        silence
		  psgInst 13
		        psgNoteL Cs5,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 99
		        silence
		countedLoopStart 1
		  psgInst 13
		        psgNoteL A5,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 54
		countedLoopEnd
		  psgInst 12
		  release 080h
		        psgNoteL As5,192
		  release 01h
		        psgNoteL As5,96
		  psgInst 13
		        psgNoteL D6,6
		        silence
		        psgNoteL B5,4
		        psgNote  C6
		        psgNote  Cs6
		        psgNoteL D6,6
		        silence
		        psgNoteL D5,4
		        psgNote  Cs5
		        psgNote  C5
		        psgNoteL As4,6
		        silence
		        psgNote  A4
		        psgNote  F4
		        psgNote  As4
		        psgNote  A4
		        psgNote  D5
		        psgNote  As4
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  G5
		        psgNote  As5
		        psgNote  D6
		        silence
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  F4
		        psgNote  Gs4
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  F4
		        psgNote  Gs4
		  length 12
		        psgNoteL As5,4
		        psgNote  C6
		        psgNote  Cs6
		        psgNoteL D6,6
		        silence
		        psgNoteL D5,4
		        psgNote  C5
		        psgNote  As4
		        psgNoteL Gs4,6
		        psgNote  Fs4
		        psgNote  C5
		        psgNote  D5
		        psgNoteL Gs5,4
		        psgNote  As5
		        psgNote  C6
		        psgNote  D6
		        psgNote  E6
		        psgNote  Fs6
		        psgNoteL G6,6
		        silence
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		  psgInst 0
		  length 36
		channel_end
Music_9_Channel_7:
		  vibrato 040h
		  release 080h
		  psgInst 0
		        psgNoteL A3,6
		  psgInst 1
		        psgNote  A3
		  psgInst 2
		        psgNote  A3
		  psgInst 118
		countedLoopStart 8
		        psgNoteL A3,96
		countedLoopEnd
		  psgInst 121
		  release 01h
		        psgNoteL C4,132
		  length 12
		  vibrato 04Ch
		  psgInst 12
		        psgNoteL B3,4
		        psgNote  B3
		        silence
		        psgNoteL B3,72
		  length 8
		  shifting 010h
		  psgInst 11
		        psgNoteL G5,4
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  B4
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D5
		        psgNote  Cs6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNoteL D6,6
		        silence
		  psgInst 9
		        silence
		  psgInst 0
		  length 42
		  psgInst 123
		        psgNoteL D6,4
		        psgNote  E6
		        psgNote  Fs6
		        psgNoteL G6,6
		        silence
		  psgInst 9
		        silence
		  psgInst 0
		  length 18
		  psgInst 123
		        psgNoteL G5,4
		        psgNote  A5
		        psgNote  B5
		        psgNoteL Cs6,6
		        silence
		        psgNoteL D5,4
		        psgNote  E5
		        psgNote  Fs5
		        psgNoteL G5,6
		        silence
		  psgInst 9
		        silence
		  psgInst 7
		        silence
		  psgInst 123
		        psgNoteL A5,4
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		  shifting 00h
		  psgInst 123
		countedLoopStart 2
		        psgNoteL G4,6
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNote  G4
		        silence
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNoteL G4,12
		  length 6
		        psgNote  G4
		countedLoopEnd
		repeatStart
		        psgNoteL E4,6
		        psgNote  E4
		        psgNote  E4
		        silence
		        psgNote  E4
		        silence
		        psgNote  E4
		        psgNote  E4
		        psgNote  E4
		        psgNote  E4
		        psgNote  E4
		        silence
		        psgNoteL E4,12
		  length 6
		        psgNote  E4
		        silence
		  shifting 010h
		  psgInst 11
		        psgNote  A4
		        psgNote  B4
		        psgNote  D5
		        psgNote  G5
		        psgNote  B5
		        psgNote  G5
		        psgNote  D5
		        psgNote  B4
		        psgNote  C5
		        psgNote  D5
		        psgNote  E5
		        psgNote  A5
		        psgNote  C6
		        psgNote  A5
		        psgNote  E5
		        psgNote  C5
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  As5
		        psgNote  D6
		        psgNote  As5
		        psgNote  F5
		        psgNote  D5
		        psgNote  E5
		        psgNote  F5
		        psgNote  G5
		        psgNote  C6
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  A5
		  shifting 00h
		  psgInst 123
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNote  G4
		        silence
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNoteL G4,12
		  length 6
		        psgNote  G4
		        psgNote  E4
		        psgNote  E4
		        psgNote  E4
		        silence
		        psgNote  E4
		        silence
		        psgNote  E4
		        psgNote  E4
		        psgNote  E4
		        silence
		        psgNoteL Fs4,18
		  length 6
		        psgNote  Fs4
		        silence
		repeatSection1Start
		        psgNoteL Fs5,6
		        psgNote  Fs5
		        psgNote  Fs5
		        silence
		        psgNote  Fs5
		        silence
		        psgNote  Fs5
		        psgNote  Fs5
		        psgNote  Fs5
		        psgNote  Fs5
		        psgNote  E5
		        silence
		        psgNoteL Ds5,12
		  length 6
		        psgNote  Ds5
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        psgNote  B4
		        silence
		        psgNoteL B4,24
		        psgNoteL E5,6
		        psgNote  E5
		        psgNote  E5
		        silence
		        psgNote  E5
		        silence
		        psgNote  E5
		        psgNote  E5
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        silence
		        psgNoteL A4,12
		  length 6
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        silence
		        psgNote  A4
		        silence
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        psgNote  A4
		        silence
		        psgNoteL A4,12
		  length 6
		        psgNote  A4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNote  G4
		        silence
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNoteL G4,12
		  length 6
		        psgNote  G4
		repeatEnd
		repeatSection2Start
		  length 6
		  shifting 010h
		  psgInst 123
		        psgNoteL G5,48
		        psgNoteL F5,12
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		  psgInst 11
		        psgNoteL B4,6
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL B4,24
		  length 6
		        psgNote  Cs5
		        psgNote  D5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  B5
		        psgNote  D6
		        psgNote  G6
		        psgNoteL As6,48
		        psgNote  A6
		        psgNoteL G6,6
		        psgNote  F6
		        psgNote  Ds6
		        psgNote  D6
		        psgNoteL C6,42
		        psgNoteL As5,4
		        psgNote  Gs5
		        psgNote  G5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  Cs5
		  shifting 00h
		countedLoopStart 1
		  psgInst 123
		        psgNoteL Fs5,6
		        silence
		        psgNote  Fs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Fs5,6
		        silence
		        psgNote  Fs5
		        silence
		        psgNote  Fs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Fs5,6
		        psgNote  Fs5
		countedLoopEnd
		        psgNoteL F5,6
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        silence
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		        psgNote  F5
		        psgNote  F5
		        silence
		        psgNote  F5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL F5,6
		  length 12
		  shifting 010h
		  psgInst 122
		        psgNoteL Gs6,6
		        psgNote  As6
		        psgNote  C7
		        psgNote  Ds7
		        psgNote  Cs7
		        psgNote  C7
		        psgNote  Gs6
		  shifting 00h
		countedLoopStart 1
		  psgInst 123
		        psgNoteL E5,6
		        silence
		        psgNote  E5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL E5,6
		        silence
		        psgNote  E5
		        silence
		        psgNote  E5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL E5,6
		        psgNote  E5
		countedLoopEnd
		        psgNoteL Ds5,6
		        silence
		        psgNote  Ds5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Ds5,6
		        silence
		  psgInst 9
		  length 12
		  shifting 010h
		  psgInst 122
		        psgNoteL Ds6,6
		        psgNote  F6
		        psgNote  Fs6
		        psgNote  As6
		        psgNote  Cs7
		        psgNote  B6
		  shifting 00h
		  psgInst 123
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        silence
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        psgNote  Cs5
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL B4,6
		        silence
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL B4,6
		        psgNote  B4
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        silence
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        psgNote  Cs5
		        psgNote  Gs4
		        silence
		        psgNote  Gs4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Gs4,6
		        silence
		        psgNote  Gs4
		        silence
		        psgNote  Gs4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Gs4,6
		        psgNote  Gs4
		        psgNote  Fs4
		        silence
		        psgNote  Fs4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Fs4,6
		        silence
		        psgNote  Fs4
		        silence
		        psgNote  Fs4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Fs4,6
		        psgNote  Fs4
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL B4,6
		        silence
		        psgNote  B4
		        silence
		        psgNote  B4
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL B4,6
		        psgNote  B4
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        silence
		        psgNote  Cs5
		        silence
		        psgNote  Cs5
		        silence
		  psgInst 9
		  length 12
		  psgInst 123
		        psgNoteL Cs5,6
		        psgNote  Cs5
		  psgInst 0
		  length 24
		  psgInst 12
		        psgNote  Ds4
		  length 6
		  psgInst 10
		        silence
		  psgInst 8
		  length 12
		  psgInst 12
		        psgNoteL F4,24
		        psgNoteL Fs4,6
		        silence
		  psgInst 10
		        silence
		  psgInst 8
		        silence
		  psgInst 12
		        psgNoteL Fs4,60
		  length 6
		  psgInst 10
		        silence
		countedLoopStart 1
		  psgInst 12
		        psgNoteL D4,6
		        silence
		        psgNote  D4
		        silence
		        psgNote  D4
		        silence
		  psgInst 0
		  length 24
		  psgInst 12
		        psgNoteL D4,6
		        silence
		        psgNote  D4
		        silence
		        psgNote  D4
		        silence
		  psgInst 0
		  length 36
		  psgInst 12
		        psgNoteL D4,6
		        silence
		        psgNote  D4
		        silence
		        psgNote  D4
		        silence
		        psgNote  G4
		        silence
		        psgNote  G4
		        silence
		        psgNote  Fs4
		        silence
		        psgNote  Fs4
		        silence
		  psgInst 0
		  length 32
		  shifting 010h
		  psgInst 11
		        psgNoteL C6,4
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E5
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs5
		        psgNote  E6
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  Fs6
		        psgNote  E6
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G6
		        psgNote  Fs6
		        psgNote  E6
		        psgNote  D6
		        psgNote  C6
		        psgNote  B5
		        psgNote  A6
		        psgNote  G6
		        psgNote  Fs6
		        psgNote  E6
		  shifting 00h
		countedLoopEnd
		  psgInst 0
		  length 36
		  psgInst 12
		        psgNoteL B3,4
		        psgNote  B3
		        silence
		        psgNoteL B3,240
		  length 8
		  psgInst 10
		        silence
		  psgInst 8
		        silence
		  psgInst 0
		  length 192
		  psgInst 13
		        psgNoteL B4,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 135
		        silence
		  psgInst 13
		        psgNoteL G4,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 99
		        silence
		  psgInst 13
		        psgNoteL E5,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 54
		  psgInst 13
		        psgNoteL F5,6
		        silence
		  psgInst 11
		        silence
		  psgInst 0
		  length 54
		  psgInst 12
		  release 080h
		        psgNoteL Fs5,192
		  release 01h
		        psgNoteL Fs5,96
		  length 6
		  shifting 010h
		  psgInst 11
		        psgNote  D6
		        silence
		        psgNoteL B5,4
		        psgNote  C6
		        psgNote  Cs6
		        psgNoteL D6,6
		        silence
		        psgNoteL D5,4
		        psgNote  Cs5
		        psgNote  C5
		        psgNoteL As4,6
		        silence
		        psgNote  A4
		        psgNote  F4
		        psgNote  As4
		        psgNote  A4
		        psgNote  D5
		        psgNote  As4
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  G5
		        psgNote  As5
		        psgNote  D6
		        silence
		        psgNote  D5
		        psgNote  Cs5
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  F4
		        psgNote  Gs4
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  F4
		        psgNote  Gs4
		  length 12
		        psgNoteL As5,4
		        psgNote  C6
		        psgNote  Cs6
		        psgNoteL D6,6
		        silence
		        psgNoteL D5,4
		        psgNote  C5
		        psgNote  As4
		        psgNoteL Gs4,6
		        psgNote  Fs4
		        psgNote  C5
		        psgNote  D5
		        psgNoteL Gs5,4
		        psgNote  As5
		        psgNote  C6
		        psgNote  D6
		        psgNote  E6
		        psgNote  Fs6
		        psgNoteL G6,6
		        silence
		  shifting 020h
		  psgInst 12
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		        psgNote  G4
		        psgNote  G4
		        psgNote  G4
		        silence
		  psgInst 0
		  length 30
		channel_end
Music_9_Channel_9:
		channel_end
