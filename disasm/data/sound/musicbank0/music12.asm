
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
		  stereo 0C0h
		mainLoopStart
		  inst 0
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Fh
		  sustain
		        noteL As2,144
		  vibrato 020h
		        note  As2
		        note  As2
		  setRelease 01h
		        note  As2
		  inst 25
		  vol 0Ch
		  vibrato 02Ch
		        noteL As2,48
		        noteL Gs2,96
		        noteL G2,48
		        noteL Fs2,96
		        noteL F2,144
		        note  As2
		  inst 0
		  vol 0Bh
		        noteL Ds3,24
		        note  F3
		        note  Fs3
		  vol 0Ah
		        note  As3
		        noteL Ds4,48
		  sustain
		        noteL F4,24
		  vol 08h
		        noteL F4,12
		  vol 06h
		  setRelease 01h
		        note  F4
		  inst 39
		  vol 0Ah
		        noteL C4,48
		        note  F3
		  inst 0
		  vol 0Bh
		        noteL C3,24
		        note  Cs3
		        note  Ds3
		  vol 0Ah
		        note  Fs3
		        noteL C4,48
		  sustain
		        noteL F4,24
		  vol 08h
		        noteL F4,12
		  vol 06h
		  setRelease 01h
		        note  F4
		  inst 39
		  vol 0Ah
		        noteL C4,48
		        note  F3
		mainLoopEnd
Music_12_Channel_1:
		  stereo 0C0h
		  setRelease 01h
		mainLoopStart
		  vibrato 02Ch
		        waitL 72
		  inst 38
		  vol 0Ch
		        noteL F4,24
		        noteL Fs4,36
		        noteL Gs4,12
		        noteL Gs4,216
		        noteL F4,24
		        noteL Fs4,16
		        note  Gs4
		        note  As4
		        noteL As4,24
		        noteL A4,120
		  inst 45
		  vol 0Ch
		        noteL F5,96
		        noteL C6,24
		        note  As5
		        note  Ds6
		        note  Cs6
		        noteL C6,72
		        noteL Cs6,24
		        noteL Gs5,120
		        noteL Fs5,24
		        noteL Fs5,48
		        noteL F5,96
		  inst 7
		  vol 09h
		        note  F6
		        noteL Ds6,48
		  sustain
		        noteL C6,96
		  vibrato 020h
		  vol 06h
		        noteL C6,16
		  vol 04h
		        note  C6
		  setRelease 01h
		  vol 02h
		        note  C6
		  vibrato 02Ch
		  inst 44
		  vol 08h
		        noteL Fs7,96
		        noteL F7,48
		  sustain
		        noteL C7,96
		  vibrato 020h
		  vol 06h
		        noteL C7,16
		  vol 04h
		        note  C7
		  setRelease 01h
		  vol 02h
		        note  C7
		mainLoopEnd
Music_12_Channel_2:
		  stereo 0C0h
		  inst 49
		  vol 09h
		  setRelease 01h
		  vibrato 02Ch
		mainLoopStart
		        noteL C5,16
		        note  C5
		        note  C5
		        noteL C5,96
		        noteL Cs5,144
		        noteL Ds5,16
		        note  Ds5
		        note  Ds5
		        noteL Ds5,96
		        note  F5
		        noteL Ds5,48
		  inst 26
		  vol 0Ah
		        noteL Cs5,96
		        noteL F5,48
		        note  E5
		        noteL E5,96
		        noteL B4,48
		        noteL C5,96
		        noteL Cs5,144
		  inst 49
		  vol 0Ah
		        note  As5
		        note  A5
		        note  As5
		        note  A5
		mainLoopEnd
Music_12_Channel_3:
		  stereo 0C0h
		  inst 49
		  vol 09h
		  setRelease 01h
		  vibrato 02Ch
		mainLoopStart
		        noteL As4,16
		        note  As4
		        note  As4
		        noteL As4,96
		        noteL As4,144
		        noteL C5,16
		        note  C5
		        note  C5
		        noteL C5,96
		        note  Cs5
		        noteL C5,48
		  inst 26
		  vol 0Ah
		        noteL As4,96
		        noteL Cs5,48
		        note  As4
		        noteL Gs4,96
		        noteL A4,144
		        noteL C5,96
		        noteL As4,48
		  inst 49
		  vol 0Ah
		        noteL Fs5,144
		        note  F5
		        note  Ds5
		        note  F5
		mainLoopEnd
Music_12_Channel_4:
		        waitL 12
		  setRelease 01h
		mainLoopStart
		  shifting 020h
		  vibrato 02Ch
		        waitL 68
		  stereo 040h
		  inst 38
		  vol 0Bh
		        noteL F4,24
		        noteL Fs4,36
		        noteL Gs4,12
		        noteL Gs4,216
		        noteL F4,24
		        noteL Fs4,16
		        note  Gs4
		        note  As4
		        noteL As4,24
		        noteL A4,120
		  stereo 080h
		  inst 45
		  vol 0Bh
		        noteL F5,96
		        noteL C6,24
		        note  As5
		        note  Ds6
		        note  Cs6
		        noteL C6,72
		        noteL Cs6,24
		        noteL Gs5,120
		        noteL Fs5,24
		        noteL Fs5,48
		        noteL F5,100
		  inst 7
		  vol 08h
		        noteL F6,96
		        noteL Ds6,48
		  sustain
		        noteL C6,96
		  vibrato 020h
		  vol 05h
		        noteL C6,16
		  vol 03h
		        note  C6
		  setRelease 01h
		  vol 01h
		        note  C6
		  shifting 010h
		  vibrato 02Ch
		  inst 44
		  vol 07h
		        noteL Fs7,96
		        noteL F7,48
		  sustain
		        noteL C7,96
		  vibrato 020h
		  vol 05h
		        noteL C7,16
		  vol 03h
		        note  C7
		  setRelease 01h
		  vol 01h
		        note  C7
		mainLoopEnd
Music_12_Channel_5:
		  setRelease 01h
		  vibrato 02Ch
		        waitL 6
		mainLoopStart
		  stereo 0C0h
		  shifting 00h
		        waitL 162
		  inst 17
		  vol 09h
		        noteL F6,24
		        noteL C7,48
		        noteL Gs6,216
		        noteL F6,24
		        noteL F7,48
		        note  Ds7
		        noteL Cs7,150
		  shifting 020h
		  stereo 040h
		  inst 26
		  vol 09h
		        noteL As4,48
		        noteL Gs4,96
		        noteL B4,48
		        noteL C5,96
		        note  C5
		        noteL As4,48
		  inst 0
		  vol 0Ah
		        noteL Ds3,24
		        note  F3
		        note  Fs3
		  vol 09h
		        note  As3
		        noteL Ds4,48
		  sustain
		        noteL F4,24
		  vol 07h
		        noteL F4,12
		  vol 05h
		  setRelease 01h
		        note  F4
		  inst 39
		  vol 09h
		        noteL C4,48
		        note  F3
		  inst 0
		  vol 0Ah
		        noteL C3,24
		        note  Cs3
		        note  Ds3
		  vol 09h
		        note  Fs3
		        noteL C4,48
		  sustain
		        noteL F4,24
		  vol 07h
		        noteL F4,12
		  vol 05h
		  setRelease 01h
		        note  F4
		  inst 39
		  vol 09h
		        noteL C4,48
		        note  F3
		mainLoopEnd
Music_12_Channel_6:
		channel_end
Music_12_Channel_7:
		channel_end
Music_12_Channel_9:
		channel_end
