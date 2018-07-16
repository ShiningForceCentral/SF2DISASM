
; ASM FILE music11.asm :
; 0x87F5..0x89C9 : Music 11
Music_11:       db 0
		db 1
		db 0
		db 0C2h
		dw Music_11_Channel_0
		dw Music_11_Channel_1
		dw Music_11_Channel_2
		dw Music_11_Channel_3
		dw Music_11_Channel_4
		dw Music_11_Channel_5
		dw Music_11_Channel_6
		dw Music_11_Channel_7
		dw Music_11_Channel_9
		dw Music_11_Channel_9
Music_11_Channel_0:
		  ymStereo 0C0h
		  ymInst 19
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		mainLoopStart
		        noteL B2,192
		        note  B2
		        noteL As2,96
		        note  E3
		        note  As2
		        note  E3
		        noteL Gs2,144
		        noteL G2,48
		        noteL F2,144
		        noteL Ds3,48
		        noteL D3,96
		        note  G2
		        note  Gs2
		        note  As2
		mainLoopEnd
Music_11_Channel_1:
		  ymStereo 0C0h
		  ymInst 17
		  ymVol 0Bh
		  release 01h
		  vibrato 03Ch
		mainLoopStart
		        noteL Gs4,18
		        noteL G4,16
		        noteL F4,14
		        noteL E4,72
		        noteL D4,24
		        note  E4
		        note  F4
		        noteL G4,18
		        noteL Gs4,16
		        noteL E5,14
		        noteL Cs5,96
		        noteL B4,48
		        noteL D5,72
		        noteL D5,8
		        note  Cs5
		        note  C5
		        noteL B4,24
		        noteL As4,48
		        noteL B4,24
		        noteL C5,18
		        noteL Cs5,16
		        noteL E5,14
		        noteL D5,36
		        noteL C5,6
		        note  B4
		        noteL As4,24
		  ymVol 0Ch
		        noteL F5,72
		  ymVol 0Bh
		        noteL C5,18
		        noteL As4,16
		        noteL Gs4,14
		        noteL G4,72
		        noteL F4,24
		        note  G4
		        note  Gs4
		        noteL B3,18
		        noteL C4,16
		        noteL G4,14
		        noteL F4,72
		        noteL Ds4,24
		        note  F4
		        note  G4
		        note  Gs4
		        note  As4
		        note  C5
		        note  Ds5
		        note  D5
		        note  C5
		        note  B4
		        note  G4
		        noteL F4,18
		        noteL Ds4,16
		        noteL Fs4,14
		        noteL F4,16
		        note  Ds4
		        noteL B4,64
		        noteL As4,48
		mainLoopEnd
Music_11_Channel_2:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 24
		  ymInst 19
		  ymVol 0Ah
		mainLoopStart
		        noteL D3,48
		        noteL Gs3,96
		        noteL D3,48
		        note  D3
		        noteL Gs3,72
		        note  Gs3
		        noteL F3,96
		        note  Gs3
		        note  F3
		        note  Gs3
		        noteL Ds3,48
		        noteL C4,144
		        noteL C3,48
		        noteL Gs3,144
		        noteL F3,96
		        note  D3
		        noteL C3,48
		        noteL Fs3,72
		        note  F3
		mainLoopEnd
Music_11_Channel_3:
		  ymStereo 0C0h
		  length 48
		  ymInst 19
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		mainLoopStart
		        noteL F3,96
		        note  F3
		        noteL F3,72
		        noteL B3,48
		        noteL F3,72
		        noteL Gs3,96
		        note  D4
		        note  Gs3
		        note  D4
		        noteL Gs3,192
		        note  F3
		        noteL Gs3,96
		        note  G3
		        noteL Ds3,72
		        noteL D3,120
		mainLoopEnd
Music_11_Channel_4:
		  length 12
		  shifting 020h
		  ymStereo 080h
		  vibrato 02Ch
		  release 01h
		  ymInst 19
		  ymVol 09h
		mainLoopStart
		        noteL B2,24
		        note  D3
		        note  F3
		        noteL Gs3,72
		        noteL F3,24
		        note  D3
		        note  B2
		        note  D3
		        note  F3
		        noteL Gs3,48
		        noteL B3,24
		        note  Gs3
		        note  F3
		countedLoopStart 1
		        noteL As2,24
		        note  F3
		        noteL Gs3,48
		        noteL E3,24
		        note  Gs3
		        noteL D4,48
		countedLoopEnd
		        noteL Gs2,24
		        note  Ds3
		        note  Gs3
		        noteL C4,72
		        noteL G2,48
		        noteL F2,24
		        note  C3
		        note  F3
		        noteL Gs3,72
		        noteL Ds3,48
		        noteL D3,24
		        note  F3
		        noteL Gs3,48
		        noteL G2,24
		        note  D3
		        noteL G3,48
		        noteL Gs2,24
		        note  C3
		        note  Ds3
		        note  Fs3
		        note  As2
		        note  D3
		        noteL F3,48
		mainLoopEnd
Music_11_Channel_5:
		  shifting 020h
		  length 12
		  ymStereo 040h
		  ymInst 17
		  ymVol 09h
		  release 01h
		  vibrato 03Ch
		mainLoopStart
		        noteL Gs4,18
		        noteL G4,16
		        noteL F4,14
		        noteL E4,72
		        noteL D4,24
		        note  E4
		        note  F4
		        noteL G4,18
		        noteL Gs4,16
		        noteL E5,14
		        noteL Cs5,96
		        noteL B4,48
		        noteL D5,72
		        noteL D5,8
		        note  Cs5
		        note  C5
		        noteL B4,24
		        noteL As4,48
		        noteL B4,24
		        noteL C5,18
		        noteL Cs5,16
		        noteL E5,14
		        noteL D5,36
		        noteL C5,6
		        note  B4
		        noteL As4,24
		  ymVol 09h
		        noteL F5,72
		  ymVol 08h
		        noteL C5,18
		        noteL As4,16
		        noteL Gs4,14
		        noteL G4,72
		        noteL F4,24
		        note  G4
		        note  Gs4
		        noteL B3,18
		        noteL C4,16
		        noteL G4,14
		        noteL F4,72
		        noteL Ds4,24
		        note  F4
		        note  G4
		        note  Gs4
		        note  As4
		        note  C5
		        note  Ds5
		        note  D5
		        note  C5
		        note  B4
		        note  G4
		        noteL F4,18
		        noteL Ds4,16
		        noteL Fs4,14
		        noteL F4,16
		        note  Ds4
		        noteL B4,64
		        noteL As4,48
		mainLoopEnd
Music_11_Channel_6:
		channel_end
Music_11_Channel_7:
		channel_end
Music_11_Channel_9:
		channel_end
