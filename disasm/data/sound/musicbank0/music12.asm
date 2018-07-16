
; ASM FILE music12.asm :
; 0xD818..0xDA71 : Music 12
Music_12:       db 0
		db 1
		db 0
		db 0C4h
		dw Music_12_Channel_0
		dw Music_12_Channel_1
		dw Music_12_Channel_2
		dw Music_12_Channel_3
		dw Music_12_Channel_4
		dw Music_12_Channel_5
		dw Music_12_Channel_6
		dw Music_12_Channel_7
		dw Music_12_Channel_9
		dw Music_12_Channel_9
Music_12_Channel_0:
		  ymStereo 0C0h
		mainLoopStart
		  ymInst 0
		  ymVol 0Bh
		  release 01h
		  vibrato 02Fh
		  ymSustain
		        noteL As1,144
		  vibrato 020h
		        note  As1
		        note  As1
		  release 01h
		        note  As1
		  ymInst 25
		  ymVol 0Ch
		  vibrato 02Ch
		        noteL As1,48
		        noteL Gs1,96
		        noteL G1,48
		        noteL Fs1,96
		        noteL F1,144
		        note  As1
		  ymInst 0
		  ymVol 0Bh
		        noteL Ds2,24
		        note  F2
		        note  Fs2
		  ymVol 0Ah
		        note  As2
		        noteL Ds3,48
		  ymSustain
		        noteL F3,24
		  ymVol 08h
		        noteL F3,12
		  ymVol 06h
		  release 01h
		        note  F3
		  ymInst 39
		  ymVol 0Ah
		        noteL C3,48
		        note  F2
		  ymInst 0
		  ymVol 0Bh
		        noteL C2,24
		        note  Cs2
		        note  Ds2
		  ymVol 0Ah
		        note  Fs2
		        noteL C3,48
		  ymSustain
		        noteL F3,24
		  ymVol 08h
		        noteL F3,12
		  ymVol 06h
		  release 01h
		        note  F3
		  ymInst 39
		  ymVol 0Ah
		        noteL C3,48
		        note  F2
		mainLoopEnd
Music_12_Channel_1:
		  ymStereo 0C0h
		  release 01h
		mainLoopStart
		  vibrato 02Ch
		  length 72
		  ymInst 38
		  ymVol 0Ch
		        noteL F3,24
		        noteL Fs3,36
		        noteL Gs3,12
		        noteL Gs3,216
		        noteL F3,24
		        noteL Fs3,16
		        note  Gs3
		        note  As3
		        noteL As3,24
		        noteL A3,120
		  ymInst 45
		  ymVol 0Ch
		        noteL F4,96
		        noteL C5,24
		        note  As4
		        note  Ds5
		        note  Cs5
		        noteL C5,72
		        noteL Cs5,24
		        noteL Gs4,120
		        noteL Fs4,24
		        noteL Fs4,48
		        noteL F4,96
		  ymInst 7
		  ymVol 09h
		        note  F5
		        noteL Ds5,48
		  ymSustain
		        noteL C5,96
		  vibrato 020h
		  ymVol 06h
		        noteL C5,16
		  ymVol 04h
		        note  C5
		  release 01h
		  ymVol 02h
		        note  C5
		  vibrato 02Ch
		  ymInst 44
		  ymVol 08h
		        noteL Fs6,96
		        noteL F6,48
		  ymSustain
		        noteL C6,96
		  vibrato 020h
		  ymVol 06h
		        noteL C6,16
		  ymVol 04h
		        note  C6
		  release 01h
		  ymVol 02h
		        note  C6
		mainLoopEnd
Music_12_Channel_2:
		  ymStereo 0C0h
		  ymInst 49
		  ymVol 09h
		  release 01h
		  vibrato 02Ch
		mainLoopStart
		        noteL C4,16
		        note  C4
		        note  C4
		        noteL C4,96
		        noteL Cs4,144
		        noteL Ds4,16
		        note  Ds4
		        note  Ds4
		        noteL Ds4,96
		        note  F4
		        noteL Ds4,48
		  ymInst 26
		  ymVol 0Ah
		        noteL Cs4,96
		        noteL F4,48
		        note  E4
		        noteL E4,96
		        noteL B3,48
		        noteL C4,96
		        noteL Cs4,144
		  ymInst 49
		  ymVol 0Ah
		        note  As4
		        note  A4
		        note  As4
		        note  A4
		mainLoopEnd
Music_12_Channel_3:
		  ymStereo 0C0h
		  ymInst 49
		  ymVol 09h
		  release 01h
		  vibrato 02Ch
		mainLoopStart
		        noteL As3,16
		        note  As3
		        note  As3
		        noteL As3,96
		        noteL As3,144
		        noteL C4,16
		        note  C4
		        note  C4
		        noteL C4,96
		        note  Cs4
		        noteL C4,48
		  ymInst 26
		  ymVol 0Ah
		        noteL As3,96
		        noteL Cs4,48
		        note  As3
		        noteL Gs3,96
		        noteL A3,144
		        noteL C4,96
		        noteL As3,48
		  ymInst 49
		  ymVol 0Ah
		        noteL Fs4,144
		        note  F4
		        note  Ds4
		        note  F4
		mainLoopEnd
Music_12_Channel_4:
		  length 12
		  release 01h
		mainLoopStart
		  shifting 020h
		  vibrato 02Ch
		  length 68
		  ymStereo 040h
		  ymInst 38
		  ymVol 0Bh
		        noteL F3,24
		        noteL Fs3,36
		        noteL Gs3,12
		        noteL Gs3,216
		        noteL F3,24
		        noteL Fs3,16
		        note  Gs3
		        note  As3
		        noteL As3,24
		        noteL A3,120
		  ymStereo 080h
		  ymInst 45
		  ymVol 0Bh
		        noteL F4,96
		        noteL C5,24
		        note  As4
		        note  Ds5
		        note  Cs5
		        noteL C5,72
		        noteL Cs5,24
		        noteL Gs4,120
		        noteL Fs4,24
		        noteL Fs4,48
		        noteL F4,100
		  ymInst 7
		  ymVol 08h
		        noteL F5,96
		        noteL Ds5,48
		  ymSustain
		        noteL C5,96
		  vibrato 020h
		  ymVol 05h
		        noteL C5,16
		  ymVol 03h
		        note  C5
		  release 01h
		  ymVol 01h
		        note  C5
		  shifting 010h
		  vibrato 02Ch
		  ymInst 44
		  ymVol 07h
		        noteL Fs6,96
		        noteL F6,48
		  ymSustain
		        noteL C6,96
		  vibrato 020h
		  ymVol 05h
		        noteL C6,16
		  ymVol 03h
		        note  C6
		  release 01h
		  ymVol 01h
		        note  C6
		mainLoopEnd
Music_12_Channel_5:
		  release 01h
		  vibrato 02Ch
		  length 6
		mainLoopStart
		  ymStereo 0C0h
		  shifting 00h
		  length 162
		  ymInst 17
		  ymVol 09h
		        noteL F5,24
		        noteL C6,48
		        noteL Gs5,216
		        noteL F5,24
		        noteL F6,48
		        note  Ds6
		        noteL Cs6,150
		  shifting 020h
		  ymStereo 040h
		  ymInst 26
		  ymVol 09h
		        noteL As3,48
		        noteL Gs3,96
		        noteL B3,48
		        noteL C4,96
		        note  C4
		        noteL As3,48
		  ymInst 0
		  ymVol 0Ah
		        noteL Ds2,24
		        note  F2
		        note  Fs2
		  ymVol 09h
		        note  As2
		        noteL Ds3,48
		  ymSustain
		        noteL F3,24
		  ymVol 07h
		        noteL F3,12
		  ymVol 05h
		  release 01h
		        note  F3
		  ymInst 39
		  ymVol 09h
		        noteL C3,48
		        note  F2
		  ymInst 0
		  ymVol 0Ah
		        noteL C2,24
		        note  Cs2
		        note  Ds2
		  ymVol 09h
		        note  Fs2
		        noteL C3,48
		  ymSustain
		        noteL F3,24
		  ymVol 07h
		        noteL F3,12
		  ymVol 05h
		  release 01h
		        note  F3
		  ymInst 39
		  ymVol 09h
		        noteL C3,48
		        note  F2
		mainLoopEnd
Music_12_Channel_6:
		channel_end
Music_12_Channel_7:
		channel_end
Music_12_Channel_9:
		channel_end
