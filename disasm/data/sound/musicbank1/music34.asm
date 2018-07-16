
; ASM FILE music34.asm :
; 0x910B..0x9B7F : Music 34
Music_34:       db 0
		db 0
		db 0
		db 0BDh
		dw Music_2_Channel_0
		dw Music_2_Channel_1
		dw Music_2_Channel_2
		dw Music_2_Channel_3
		dw Music_2_Channel_4
		dw Music_2_Channel_5
		dw Music_2_Channel_6
		dw Music_2_Channel_7
		dw Music_2_Channel_9
		dw Music_2_Channel_9
Music_2_Channel_0:
		  ymStereo 0C0h
		  ymInst 12
		  ymVol 0Ch
		  vibrato 02Ch
		countedLoopStart 1
		  release 05h
		        noteL As2,192
		  release 010h
		        noteL As2,24
		        note  As2
		        silence
		  release 05h
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		  length 40
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		countedLoopEnd
		mainLoopStart
		  ymVol 0Bh
		countedLoopStart 3
		  release 010h
		        noteL As2,24
		        note  As2
		        silence
		  release 05h
		        noteL Cs3,8
		        note  Cs3
		        note  Cs3
		        note  As2
		  length 40
		        noteL F3,8
		        note  F3
		        note  F3
		        note  Fs3
		        note  Fs3
		        note  Fs3
		countedLoopEnd
		  ymVol 0Ch
		        noteL A3,8
		  ymVol 0Ah
		        note  A3
		        note  A3
		  ymVol 0Ch
		        note  Cs4
		  ymVol 0Ah
		        note  Cs4
		        note  Cs4
		  ymVol 0Ch
		        note  G3
		  ymVol 0Ah
		        note  G3
		        note  G3
		  ymVol 0Ch
		        note  Gs3
		  ymVol 0Ah
		        note  Gs3
		        note  Gs3
		  ymVol 0Bh
		  release 01h
		        noteL C4,0
		  ymSlide 0Ah
		        noteL D4,48
		  ymStopSlide
		        noteL Ds3,6
		  length 18
		        noteL Gs3,24
		        noteL E3,0
		  ymSlide 0Ah
		        noteL Fs3,96
		  ymStopSlide
		        noteL G3,0
		  ymSlide 0Ah
		        noteL A3,48
		  ymStopSlide
		        noteL F3,6
		  length 18
		        noteL Fs3,24
		        noteL Cs3,0
		  ymSlide 0Ah
		        noteL Ds3,96
		  ymStopSlide
		  ymVol 0Ch
		countedLoopStart 1
		  release 010h
		        noteL As2,24
		        note  As2
		        silence
		        note  As2
		        note  As2
		        silence
		        note  As2
		        note  As2
		countedLoopEnd
		  ymVol 0Bh
		countedLoopStart 1
		  release 010h
		        noteL As2,24
		        note  As2
		        silence
		  release 05h
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		  length 40
		        noteL As2,8
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		        note  As2
		countedLoopEnd
		mainLoopEnd
Music_2_Channel_1:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		repeatStart
		  ymInst 13
		  ymVol 0Ch
		        noteL As5,6
		  ymVol 09h
		        note  As5
		  ymVol 07h
		        note  As5
		        silence
		  ymInst 20
		  ymVol 0Ah
		  release 05h
		        noteL A3,8
		        note  A3
		        note  A3
		        note  As3
		        note  As3
		        note  As3
		repeatSection1Start
		  release 01h
		        noteL Cs4,84
		        noteL B3,12
		        note  As3
		        note  Gs3
		        noteL A3,6
		  ymVol 07h
		        note  A3
		  ymVol 0Ah
		        noteL Fs3,180
		repeatEnd
		repeatSection2Start
		        noteL Cs4,8
		  ymVol 07h
		        note  Cs4
		  ymVol 0Ah
		        note  Cs4
		  release 01h
		        noteL E4,60
		        noteL Ds4,12
		        note  Cs4
		        note  B3
		        noteL C4,6
		  ymVol 07h
		        note  C4
		  ymVol 0Ah
		        noteL A3,180
		mainLoopStart
		  ymInst 22
		  ymVol 0Ch
		        noteL G5,36
		        noteL F5,12
		        note  E5
		        note  D5
		        note  E5
		        note  F5
		  ymSustain
		        noteL Cs5,6
		        note  B4
		  release 01h
		        noteL Cs5,48
		        noteL D5,12
		  ymSustain
		        noteL As4,3
		        note  B4
		        noteL As4,6
		  release 01h
		        noteL Gs4,12
		  ymSustain
		        noteL G4,6
		        note  F4
		  release 01h
		        noteL G4,180
		  length 12
		  ymInst 44
		  ymVol 0Ch
		        note  E5
		        note  F5
		        note  C6
		        note  B5
		        note  G5
		        note  Gs5
		        note  Ds6
		        noteL D6,6
		        note  Cs6
		        noteL D6,63
		        noteL Ds6,8
		        noteL C6,7
		        noteL B5,6
		  ymVol 09h
		        noteL B5,8
		  ymVol 0Ch
		        note  G5
		        note  Gs5
		        noteL Ds6,9
		        noteL D6,8
		        noteL Cs6,19
		        noteL As5,12
		        noteL B5,11
		        noteL Cs6,5
		        noteL D6,4
		        note  F6
		        noteL A6,72
		  ymInst 26
		  ymVol 0Dh
		        noteL E4,6
		        note  F4
		        note  A4
		        note  C5
		  release 05h
		        noteL Cs5,8
		        note  Cs5
		        note  Cs5
		        note  C5
		        note  C5
		        note  C5
		        note  Gs4
		        note  Gs4
		        note  Gs4
		        note  E4
		        note  E4
		        note  E4
		  release 01h
		        noteL Cs4,48
		        noteL D4,6
		  ymVol 0Ah
		        note  D4
		  ymVol 08h
		        note  D4
		        silence
		  ymVol 0Dh
		        noteL Cs4,4
		        note  D4
		        note  F4
		        note  A4
		        note  Cs5
		        note  E5
		  ymSustain
		        noteL F5,84
		  ymVol 0Ah
		        noteL F5,6
		  ymVol 08h
		  release 01h
		        note  F5
		  ymVol 0Dh
		        noteL Gs4,48
		        noteL A4,6
		  ymVol 0Ah
		        note  A4
		  ymVol 08h
		        note  A4
		        silence
		  ymVol 0Dh
		        noteL Gs4,4
		        note  A4
		        note  C5
		        note  E5
		        note  Gs5
		        note  B5
		  ymSustain
		        noteL C6,84
		  ymVol 0Ah
		        noteL C6,6
		  ymVol 08h
		  release 01h
		        note  C6
		countedLoopStart 1
		  ymInst 13
		  ymVol 0Dh
		  release 03h
		        noteL As5,8
		  ymVol 09h
		        note  As5
		        silence
		  ymVol 0Dh
		        note  A5
		  ymVol 09h
		        note  A5
		  length 32
		  ymVol 0Dh
		        noteL Gs5,8
		  ymVol 09h
		        note  Gs5
		        silence
		  ymVol 0Dh
		        note  G5
		  ymVol 09h
		        note  G5
		  length 32
		  ymVol 0Dh
		        noteL Fs5,8
		  ymVol 09h
		        note  Fs5
		        silence
		  ymVol 0Dh
		        note  F5
		  ymVol 09h
		        note  F5
		        silence
		countedLoopEnd
		  release 01h
		  ymInst 20
		  ymVol 0Bh
		  ymSustain
		        noteL As3,192
		  release 01h
		  vibrato 020h
		        note  As3
		  vibrato 02Ch
		mainLoopEnd
Music_2_Channel_2:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		repeatStart
		  ymInst 3
		  ymVol 0Ch
		        noteL As4,6
		  ymVol 09h
		        note  As4
		  ymVol 07h
		        note  As4
		        silence
		  ymInst 20
		  ymVol 0Ah
		  release 05h
		        noteL F3,8
		        note  F3
		        note  F3
		        note  Fs3
		        note  Fs3
		        note  Fs3
		repeatSection1Start
		  release 01h
		        noteL A3,84
		        noteL G3,12
		        note  Fs3
		        note  E3
		        noteL F3,6
		  ymVol 07h
		        note  F3
		  ymVol 0Ah
		        noteL D3,180
		repeatEnd
		repeatSection2Start
		        noteL A3,8
		  ymVol 07h
		        note  A3
		  ymVol 0Ah
		        note  A3
		  release 01h
		        noteL C4,60
		        noteL B3,12
		        note  A3
		        note  G3
		        noteL Gs3,6
		  ymVol 07h
		        note  Gs3
		  ymVol 0Ah
		        noteL F3,180
		mainLoopStart
		  length 240
		  ymVol 0Ah
		        noteL E4,6
		  ymVol 07h
		        note  E4
		  ymVol 0Ah
		        noteL Cs4,132
		  length 120
		  ymInst 13
		  ymVol 0Dh
		        noteL As5,6
		  ymVol 0Ah
		        note  As5
		  ymVol 08h
		        note  As5
		  length 174
		  ymVol 0Dh
		        noteL As5,6
		  ymVol 0Ah
		        note  As5
		  ymVol 08h
		        note  As5
		  length 30
		  ymVol 0Dh
		        noteL As5,6
		  ymVol 0Ah
		        note  As5
		  ymVol 08h
		        note  As5
		        silence
		  ymVol 0Dh
		        note  As5
		  ymVol 0Ah
		        note  As5
		  ymVol 08h
		        note  As5
		  length 78
		  ymInst 26
		  ymVol 0Ch
		        noteL Gs3,48
		        noteL As3,6
		  ymVol 09h
		        note  As3
		  ymVol 07h
		        note  As3
		        silence
		  ymVol 0Ch
		        noteL F3,24
		  ymInst 27
		  ymVol 0Bh
		        noteL A4,16
		        note  As4
		        note  A4
		        noteL Gs4,6
		  ymVol 08h
		        note  Gs4
		  ymVol 0Bh
		        noteL E4,36
		  ymInst 26
		  ymVol 0Ch
		        noteL F4,48
		        noteL Fs4,6
		  ymVol 09h
		        note  Fs4
		  ymVol 07h
		        note  Fs4
		        silence
		  ymVol 0Ch
		        noteL F4,24
		  ymInst 20
		  ymVol 0Bh
		        noteL F4,8
		  ymVol 08h
		        note  F4
		  ymVol 0Bh
		        note  E4
		  ymVol 08h
		        note  E4
		  ymVol 0Bh
		        note  Cs4
		  ymVol 08h
		        note  Cs4
		  ymVol 0Bh
		        noteL A3,48
		countedLoopStart 1
		  ymInst 3
		  ymVol 0Dh
		  release 03h
		  length 24
		        noteL As5,8
		  ymVol 09h
		        note  As5
		  length 32
		  ymVol 0Dh
		        noteL As5,8
		  ymVol 09h
		        note  As5
		        silence
		  ymVol 0Dh
		        note  As5
		  ymVol 09h
		        note  As5
		  length 32
		  ymVol 0Dh
		        noteL As5,8
		  ymVol 09h
		        note  As5
		        silence
		  ymVol 0Dh
		        note  As5
		  ymVol 09h
		        note  As5
		        silence
		countedLoopEnd
		  release 01h
		  ymInst 20
		  ymVol 0Bh
		        noteL Fs3,144
		        noteL F3,48
		        noteL E3,192
		mainLoopEnd
Music_2_Channel_3:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		repeatStart
		  ymInst 61
		  ymVol 0Eh
		        noteL C2,30
		  ymStereo 080h
		  shifting 020h
		  ymInst 20
		  ymVol 09h
		  release 05h
		        noteL F3,8
		        note  F3
		        note  F3
		        note  Fs3
		        note  Fs3
		        note  Fs3
		repeatSection1Start
		  release 01h
		        noteL A3,84
		        noteL G3,12
		        note  Fs3
		        noteL E3,6
		  shifting 00h
		  ymStereo 0C0h
		  ymInst 3
		countedLoopStart 1
		  ymVol 0Ch
		        noteL As3,6
		  ymVol 09h
		        note  As3
		  ymVol 07h
		        note  As3
		        silence
		countedLoopEnd
		  length 24
		  release 05h
		  ymVol 0Ch
		        noteL As3,8
		        note  As3
		        note  As3
		  release 01h
		        noteL As3,6
		  ymVol 09h
		        note  As3
		  ymVol 07h
		        note  As3
		  length 30
		  ymVol 0Ch
		  release 05h
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		repeatEnd
		repeatSection2Start
		        noteL A3,8
		  ymVol 07h
		        note  A3
		  ymVol 0Ah
		        note  A3
		  release 01h
		        noteL C4,60
		        noteL B3,12
		        note  A3
		        noteL G3,6
		  shifting 00h
		  ymStereo 0C0h
		  ymInst 3
		countedLoopStart 1
		  ymVol 0Ch
		        noteL As3,6
		  ymVol 09h
		        note  As3
		  ymVol 07h
		        note  As3
		        silence
		countedLoopEnd
		  length 24
		  release 05h
		  ymVol 0Ch
		        noteL As3,8
		        note  As3
		        note  As3
		  release 01h
		        noteL As3,6
		  ymVol 09h
		        note  As3
		  ymVol 07h
		        note  As3
		  length 30
		  ymVol 0Ch
		  release 05h
		        noteL As3,8
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		        note  As3
		  length 6
		mainLoopStart
		  length 6
		  ymStereo 080h
		  shifting 010h
		  ymInst 22
		  ymVol 0Ah
		        noteL G5,36
		        noteL F5,12
		        note  E5
		        note  D5
		        note  E5
		        note  F5
		  ymSustain
		        noteL Cs5,6
		        note  B4
		  release 01h
		        noteL Cs5,48
		        noteL D5,12
		  ymSustain
		        noteL As4,3
		        note  B4
		        noteL As4,6
		  release 01h
		        noteL Gs4,12
		  ymSustain
		        noteL G4,6
		        note  F4
		  release 01h
		        noteL G4,30
		  shifting 020h
		  ymInst 20
		  ymVol 09h
		        noteL E4,6
		  ymVol 06h
		        note  E4
		  ymVol 09h
		        noteL Cs4,30
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 13
		  ymVol 0Ch
		        noteL C5,6
		  ymVol 09h
		        note  C5
		  ymVol 0Ch
		  ymSustain
		        noteL A4,84
		  ymVol 09h
		        noteL A4,6
		  ymVol 07h
		  release 01h
		        note  A4
		  length 12
		  shifting 010h
		  ymStereo 080h
		  ymInst 44
		  ymVol 0Ah
		        note  E5
		        note  F5
		        note  C6
		        note  B5
		        note  G5
		        note  Gs5
		        note  Ds6
		        noteL D6,6
		        note  Cs6
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 3
		  ymVol 0Dh
		        note  As4
		  ymVol 0Ah
		        note  As4
		  ymVol 08h
		        note  As4
		  length 45
		  ymInst 44
		  ymStereo 080h
		  shifting 010h
		  ymVol 0Ah
		        noteL Ds6,8
		        noteL C6,7
		        noteL B5,6
		  ymVol 07h
		        noteL B5,8
		  ymVol 0Ah
		        note  G5
		        note  Gs5
		        noteL Ds6,9
		        noteL D6,8
		        noteL Cs6,19
		        noteL As5,12
		        noteL B5,11
		        noteL Cs6,5
		        noteL D6,4
		        note  F6
		        noteL A6,12
		  ymStereo 0C0h
		  shifting 00h
		  ymInst 3
		  ymVol 0Dh
		        noteL As4,6
		  ymVol 0Ah
		        note  As4
		  ymVol 08h
		        note  As4
		  length 30
		  ymVol 0Dh
		        noteL As4,6
		  ymVol 0Ah
		        note  As4
		  ymVol 08h
		        note  As4
		        silence
		  ymVol 0Dh
		        note  As4
		  ymVol 0Ah
		        note  As4
		  ymVol 08h
		        note  As4
		  length 78
		  ymInst 26
		  ymVol 0Ch
		        noteL F3,48
		        noteL Fs3,6
		  ymVol 09h
		        note  Fs3
		  ymVol 07h
		        note  Fs3
		        silence
		  ymVol 0Ch
		        noteL D3,24
		  ymSlide 020h
		  ymSustain
		        noteL Cs4,84
		  ymStopSlide
		  ymVol 09h
		        noteL Cs4,6
		  ymVol 07h
		  release 01h
		        note  Cs4
		  ymVol 0Ch
		        noteL Cs4,48
		        noteL D4,6
		  ymVol 09h
		        note  D4
		  ymVol 07h
		        note  D4
		        silence
		  ymVol 0Ch
		        noteL Cs4,24
		  ymSlide 020h
		        noteL A4,48
		  ymStopSlide
		  ymSustain
		        noteL F4,36
		  ymVol 09h
		        noteL F4,6
		  ymVol 07h
		  release 01h
		        note  F4
		countedLoopStart 1
		  release 03h
		  ymInst 3
		  ymVol 0Ch
		        noteL As4,8
		  ymVol 08h
		        note  As4
		        silence
		  ymVol 0Ch
		        note  As4
		  ymVol 08h
		        note  As4
		  length 32
		  ymVol 0Ch
		        noteL As4,8
		  ymVol 08h
		        note  As4
		        silence
		  ymVol 0Ch
		        note  As4
		  ymVol 08h
		        note  As4
		  length 32
		  ymVol 0Ch
		        noteL As4,8
		  ymVol 08h
		        note  As4
		        silence
		  ymVol 0Ch
		        note  As4
		  ymVol 08h
		        note  As4
		        silence
		countedLoopEnd
		  ymStereo 080h
		  shifting 020h
		  ymInst 20
		  ymVol 0Ah
		  length 6
		        noteL Fs3,144
		        noteL F3,48
		        noteL E3,192
		mainLoopEnd
Music_2_Channel_4:
		  length 6
		  shifting 020h
		  ymStereo 040h
		  release 01h
		  vibrato 02Ch
		repeatStart
		  ymInst 13
		  ymVol 0Bh
		        noteL As5,6
		  ymVol 08h
		        note  As5
		  ymVol 06h
		        note  As5
		        silence
		  ymInst 20
		  ymVol 09h
		  release 05h
		        noteL A3,8
		        note  A3
		        note  A3
		        note  As3
		        note  As3
		        note  As3
		repeatSection1Start
		  release 01h
		        noteL Cs4,84
		        noteL B3,12
		        note  As3
		        note  Gs3
		        noteL A3,6
		  ymVol 06h
		        note  A3
		  ymVol 09h
		        noteL Fs3,180
		repeatEnd
		repeatSection2Start
		        noteL Cs4,8
		  ymVol 06h
		        note  Cs4
		  ymVol 09h
		        note  Cs4
		  release 01h
		        noteL E4,60
		        noteL Ds4,12
		        note  Cs4
		        note  B3
		        noteL C4,6
		  ymVol 06h
		        note  C4
		  ymVol 09h
		        noteL A3,180
		mainLoopStart
		  ymInst 22
		  ymVol 0Bh
		        noteL G5,36
		        noteL F5,12
		        note  E5
		        note  D5
		        note  E5
		        note  F5
		  ymSustain
		        noteL Cs5,6
		        note  B4
		  release 01h
		        noteL Cs5,48
		        noteL D5,12
		  ymSustain
		        noteL As4,3
		        note  B4
		        noteL As4,6
		  release 01h
		        noteL Gs4,12
		  ymSustain
		        noteL G4,6
		        note  F4
		  release 01h
		        noteL G4,84
		  ymInst 13
		  ymVol 0Bh
		        noteL C5,6
		  ymVol 08h
		        note  C5
		  ymVol 0Bh
		  ymSustain
		        noteL A4,84
		  ymVol 08h
		        noteL A4,6
		  ymVol 06h
		  release 01h
		        note  A4
		  ymStereo 080h
		  ymInst 44
		  ymVol 0Bh
		        noteL E5,12
		        note  F5
		        note  C6
		        note  B5
		        note  G5
		        note  Gs5
		        note  Ds6
		        noteL D6,6
		        note  Cs6
		        noteL D6,12
		  ymInst 13
		  ymVol 0Ch
		        noteL As5,6
		  ymVol 09h
		        note  As5
		  ymVol 07h
		        note  As5
		  length 33
		  ymInst 44
		  ymVol 0Bh
		        noteL Ds6,8
		        noteL C6,7
		        noteL B5,6
		  ymVol 08h
		        noteL B5,8
		  ymVol 0Bh
		        note  G5
		        note  Gs5
		        noteL Ds6,9
		        noteL D6,8
		        noteL Cs6,19
		        noteL As5,12
		        noteL B5,11
		        noteL Cs6,5
		        noteL D6,4
		        note  F6
		        noteL A6,72
		  ymStereo 040h
		  ymInst 26
		  ymVol 0Ch
		        noteL E4,6
		        note  F4
		        note  A4
		        note  C5
		  release 05h
		        noteL Cs5,8
		        note  Cs5
		        note  Cs5
		        note  C5
		        note  C5
		        note  C5
		        note  Gs4
		        note  Gs4
		        note  Gs4
		        note  E4
		        note  E4
		        note  E4
		  release 01h
		        noteL Cs4,48
		        noteL D4,6
		  ymVol 09h
		        note  D4
		  ymVol 07h
		        note  D4
		        silence
		  ymVol 0Ch
		        noteL Cs4,4
		        note  D4
		        note  F4
		        note  A4
		        note  Cs5
		        note  E5
		  ymStereo 080h
		  ymInst 27
		  ymVol 0Ah
		        noteL A4,16
		        note  As4
		        note  A4
		        noteL Gs4,6
		  ymVol 07h
		        note  Gs4
		  ymVol 0Ah
		        noteL E4,36
		  ymStereo 040h
		  ymInst 26
		  ymVol 0Ch
		        noteL Gs4,48
		        noteL A4,6
		  ymVol 09h
		        note  A4
		  ymVol 07h
		        note  A4
		        silence
		  ymVol 0Ch
		        noteL Gs4,4
		        note  A4
		        note  C5
		        note  E5
		        note  Gs5
		        note  B5
		  ymStereo 080h
		  ymInst 20
		  ymVol 0Ah
		        noteL F4,8
		  ymVol 07h
		        note  F4
		  ymVol 0Ah
		        note  E4
		  ymVol 07h
		        note  E4
		  ymVol 0Ah
		        note  Cs4
		  ymVol 07h
		        note  Cs4
		  ymVol 0Ah
		        noteL A3,48
		  ymStereo 040h
		countedLoopStart 1
		  ymInst 13
		  ymVol 0Ch
		  release 03h
		        noteL As5,8
		  ymVol 08h
		        note  As5
		        silence
		  ymVol 0Ch
		        note  A5
		  ymVol 08h
		        note  A5
		  length 32
		  ymVol 0Ch
		        noteL Gs5,8
		  ymVol 08h
		        note  Gs5
		        silence
		  ymVol 0Ch
		        note  G5
		  ymVol 08h
		        note  G5
		  length 32
		  ymVol 0Ch
		        noteL Fs5,8
		  ymVol 08h
		        note  Fs5
		        silence
		  ymVol 0Ch
		        note  F5
		  ymVol 08h
		        note  F5
		        silence
		countedLoopEnd
		  release 01h
		  ymVol 0Ah
		  ymInst 21
		  ymSustain
		        noteL As3,192
		  release 01h
		  vibrato 020h
		        note  As3
		  vibrato 02Ch
		mainLoopEnd
Music_2_Channel_5:
		  ymStereo 0C0h
		countedLoopStart 1
		        sampleL 5,168
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sampleL 5,24
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 2,8
		        sample  2
		        sample  2
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 5,8
		        sample  3
		        sample  3
		        sample  5
		        sample  3
		        sample  3
		countedLoopEnd
		mainLoopStart
		countedLoopStart 1
		        sampleL 3,18
		        sampleL 4,3
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sample  3
		        sample  4
		        sample  4
		countedLoopEnd
		repeatStart
		        sampleL 3,18
		        sampleL 4,3
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sampleL 3,24
		        sampleL 0,12
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		repeatSection1Start
		        sampleL 3,8
		        sample  4
		        sample  4
		repeatEnd
		repeatSection2Start
		        sampleL 5,24
		        sampleL 5,96
		repeatStart
		        sampleL 1,12
		        sampleL 3,3
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,20
		        sampleL 3,2
		        sample  3
		        sampleL 2,24
		        sample  2
		repeatSection1Start
		        sampleL 0,96
		repeatEnd
		repeatSection2Start
		        sampleL 0,16
		        sample  2
		        sample  2
		        sample  2
		        sample  2
		        sample  2
		countedLoopStart 1
		        sampleL 5,24
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 5,8
		        sample  3
		        sample  3
		        sampleL 5,36
		        sampleL 4,3
		        sample  4
		        sample  3
		        sample  3
		        sampleL 5,8
		        sample  3
		        sample  3
		        sample  5
		        sample  3
		        sample  3
		countedLoopEnd
		countedLoopStart 1
		        sampleL 5,18
		        sampleL 4,3
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sampleL 3,36
		        sampleL 4,3
		        sample  4
		        sample  4
		        sample  4
		        sampleL 3,8
		        sample  4
		        sample  4
		        sample  3
		        sample  4
		        sample  4
		countedLoopEnd
		mainLoopEnd
Music_2_Channel_6:
		  release 01h
		  vibrato 04Ch
		  psgInst 13
		        psgNoteL G6,6
		        silence
		  psgInst 10
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		  length 168
		  psgInst 123
		countedLoopStart 5
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  A5
		        psgNote  Gs5
		countedLoopEnd
		  psgInst 124
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  F6
		        psgNote  Fs6
		  psgInst 13
		        psgNoteL G6,6
		        silence
		  psgInst 10
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		  length 168
		  psgInst 123
		countedLoopStart 1
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  A5
		        psgNote  Gs5
		countedLoopEnd
		  psgInst 124
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		        psgNote  F6
		        psgNote  Fs6
		  psgInst 125
		        psgNoteL E6,8
		  length 4
		        psgNoteL C6,72
		  psgInst 10
		  length 6
		  psgInst 6
		        silence
		mainLoopStart
		countedLoopStart 3
		  release 013h
		  psgInst 124
		        psgNoteL As4,24
		        psgNote  As4
		  psgInst 0
		        silence
		  psgInst 124
		  release 05h
		        psgNoteL D5,8
		        psgNote  D5
		        psgNote  D5
		        psgNoteL As4,10
		  length 14
		  psgInst 0
		  length 24
		  psgInst 124
		        psgNoteL As4,8
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		        psgNote  As4
		countedLoopEnd
		  release 013h
		  psgInst 125
		        psgNoteL F5,24
		        psgNote  E5
		        psgNote  D5
		        psgNote  As4
		  psgInst 0
		  length 132
		  release 01h
		  psgInst 125
		        psgNoteL Cs7,4
		        psgNote  D7
		        psgNote  F7
		        psgNote  Fs7
		        psgNote  F7
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  A6
		        psgNote  Gs6
		        psgNote  F6
		        psgNoteL Cs6,5
		        silence
		  psgInst 10
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		  length 192
		countedLoopStart 1
		  release 05h
		  psgInst 125
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  psgInst 0
		  length 40
		  psgInst 125
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  psgInst 0
		  length 40
		  psgInst 125
		        psgNoteL Ds6,8
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  D6
		countedLoopEnd
		repeatStart
		  release 05h
		  psgInst 125
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  psgInst 0
		  length 38
		  psgInst 125
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		  release 05h
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  psgInst 0
		  length 38
		  psgInst 125
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		repeatSection1Start
		  release 05h
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  release 01h
		        psgNoteL G6,6
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		repeatEnd
		repeatSection2Start
		  release 01h
		        psgNoteL G6,6
		  psgInst 10
		        silence
		  psgInst 6
		  length 10
		  psgInst 124
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		  release 01h
		        psgNoteL G6,6
		        silence
		  psgInst 9
		        silence
		  psgInst 5
		        silence
		mainLoopEnd
Music_2_Channel_7:
		  release 01h
		  vibrato 04Ch
		  psgInst 13
		        psgNoteL G5,6
		        silence
		  psgInst 10
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		  length 176
		  shifting 010h
		  psgInst 121
		countedLoopStart 5
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  A5
		        psgNote  Gs5
		countedLoopEnd
		  psgInst 122
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		  shifting 00h
		  psgInst 13
		        psgNoteL G5,6
		        silence
		  psgInst 10
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		  length 176
		  shifting 010h
		  psgInst 121
		countedLoopStart 1
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  A5
		        psgNote  Gs5
		countedLoopEnd
		  psgInst 122
		        psgNoteL G5,4
		        psgNote  Gs5
		        psgNote  A5
		        psgNote  As5
		        psgNote  B5
		        psgNote  C6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		        psgNote  E6
		  shifting 00h
		  psgInst 125
		        psgNoteL Cs6,8
		  length 4
		        psgNoteL Gs5,72
		  psgInst 10
		  length 6
		  psgInst 6
		        silence
		mainLoopStart
		  shifting 00h
		countedLoopStart 3
		  release 013h
		  psgInst 124
		        psgNoteL G4,24
		        psgNote  G4
		  psgInst 0
		        silence
		  psgInst 124
		  release 05h
		        psgNoteL G4,8
		        psgNote  G4
		        psgNote  G4
		        psgNoteL G4,10
		  length 14
		  psgInst 0
		  length 24
		  psgInst 124
		        psgNoteL G4,8
		        psgNote  G4
		        psgNote  G4
		        psgNote  Fs4
		        psgNote  Fs4
		        psgNote  Fs4
		countedLoopEnd
		  release 013h
		  psgInst 125
		        psgNoteL D5,24
		        psgNote  Cs5
		        psgNote  As4
		        psgNote  Fs4
		  psgInst 0
		  length 140
		  shifting 010h
		  release 01h
		  psgInst 123
		        psgNoteL Cs7,4
		        psgNote  D7
		        psgNote  F7
		        psgNote  Fs7
		        psgNote  F7
		        psgNote  D7
		        psgNote  Cs7
		        psgNote  A6
		        psgNote  Gs6
		        psgNote  F6
		        psgNoteL Cs6,5
		        silence
		  psgInst 10
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		  length 184
		countedLoopStart 1
		  shifting 00h
		  release 05h
		  psgInst 125
		        psgNoteL G5,8
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  G5
		  psgInst 0
		  length 40
		  psgInst 125
		        psgNoteL G5,8
		        psgNote  G5
		        psgNote  Gs5
		        psgNote  G5
		  psgInst 0
		  length 44
		  shifting 010h
		  psgInst 124
		        psgNoteL Ds6,8
		        psgNote  D6
		        psgNote  Cs6
		        psgNote  D6
		        psgNote  Ds6
		  release 01h
		        psgNoteL D6,4
		countedLoopEnd
		  length 4
		repeatStart
		  release 05h
		  psgInst 123
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  psgInst 0
		  length 38
		  psgInst 123
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		  release 05h
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  psgInst 0
		  length 38
		  psgInst 123
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		repeatSection1Start
		  release 05h
		        psgNoteL G6,8
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		        psgNote  G6
		  release 01h
		        psgNoteL G6,6
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		repeatEnd
		repeatSection2Start
		  release 01h
		        psgNoteL G6,6
		  psgInst 8
		        silence
		  psgInst 4
		  length 10
		  psgInst 122
		  release 080h
		        psgNoteL F6,1
		        psgNote  Fs6
		  release 01h
		        psgNoteL G6,6
		        silence
		  psgInst 7
		  length 8
		mainLoopEnd
Music_2_Channel_9:
		channel_end
