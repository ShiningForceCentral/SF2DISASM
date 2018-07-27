
; ASM FILE music20.asm :
; 0xEF1F..0xF0D8 : Music 20
Music_20:       db 0
		db 1
		db 0
		db 0CDh
		dw Music_20_Channel_0
		dw Music_20_Channel_1
		dw Music_20_Channel_2
		dw Music_20_Channel_3
		dw Music_20_Channel_4
		dw Music_20_Channel_5
		dw Music_20_Channel_6
		dw Music_20_Channel_7
		dw Music_20_Channel_9
		dw Music_20_Channel_9
Music_20_Channel_0:
		  stereo 0C0h
		  inst 25
		  setRelease 01h
		  vibrato 02Ch
		        waitL 49
		  vol 0Bh
		        noteL D4,96
		        note  C4
		        note  B3
		        note  As3
		  sustain
		        noteL A3,240
		  vol 09h
		        noteL A3,6
		  vol 07h
		        note  A3
		  vol 05h
		        note  A3
		  vol 03h
		  setRelease 01h
		        note  A3
		        waitL 12
		channel_end
Music_20_Channel_1:
		  stereo 0C0h
		  inst 49
		  vol 0Dh
		  setRelease 01h
		  vibrato 02Ch
		        noteL A5,48
		        noteL E6,72
		        noteL F6,24
		        noteL D6,96
		        noteL A6,12
		  vol 09h
		        note  A6
		  vol 06h
		        note  A6
		        wait
		  vol 0Dh
		        noteL G6,96
		        noteL D6,12
		  vol 09h
		        note  D6
		  vol 06h
		        note  D6
		        wait
		  sustain
		  vol 0Dh
		        noteL Cs6,240
		  vol 09h
		        noteL Cs6,6
		  vol 06h
		        note  Cs6
		  vol 04h
		        note  Cs6
		  vol 02h
		  setRelease 01h
		        note  Cs6
		        waitL 13
		channel_end
Music_20_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 49
		  inst 39
		  vol 0Ah
		        noteL D4,24
		        note  A4
		        note  F5
		        note  A4
		        note  C4
		        note  A4
		        note  F5
		        note  A4
		        note  B3
		        note  A4
		        note  F5
		        note  A4
		        note  As3
		        note  A4
		        note  F5
		        note  A4
		        noteL A3,16
		        noteL E4,10
		        noteL A4,8
		        note  Cs5
		        note  E5
		        noteL A5,16
		  vol 08h
		        noteL Cs5,8
		        note  E5
		        noteL A5,16
		  vol 06h
		        noteL Cs5,8
		        note  E5
		        noteL A5,126
		        waitL 36
		channel_end
Music_20_Channel_3:
		  stereo 080h
		  shifting 010h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 81
		  inst 39
		  vol 09h
		countedLoopStart 2
		        noteL A4,24
		        note  F5
		        noteL A4,48
		countedLoopEnd
		        noteL A4,24
		        note  F5
		        noteL A4,40
		        noteL E4,10
		        noteL A4,8
		        note  Cs5
		        note  E5
		        noteL A5,16
		  vol 07h
		        noteL Cs5,8
		        note  E5
		        noteL A5,16
		  vol 05h
		        noteL Cs5,8
		        note  E5
		        noteL A5,126
		        waitL 28
		channel_end
Music_20_Channel_4:
		  stereo 040h
		  shifting 020h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 89
		  inst 39
		  vol 08h
		countedLoopStart 2
		        noteL A4,24
		        note  F5
		        noteL A4,48
		countedLoopEnd
		        noteL A4,24
		        note  F5
		        noteL A4,40
		        noteL E4,10
		        noteL A4,8
		        note  Cs5
		        note  E5
		        noteL A5,16
		  vol 06h
		        noteL Cs5,8
		        note  E5
		        noteL A5,16
		  vol 04h
		        noteL Cs5,8
		        note  E5
		        noteL A5,126
		        waitL 20
		channel_end
Music_20_Channel_5:
		        waitL 12
		  stereo 040h
		  shifting 020h
		  inst 49
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL A5,48
		        noteL E6,72
		        noteL F6,24
		        noteL D6,96
		        noteL A6,12
		  vol 08h
		        note  A6
		  vol 05h
		        note  A6
		        wait
		  vol 0Ch
		        noteL G6,96
		        noteL D6,12
		  vol 08h
		        note  D6
		  vol 05h
		        note  D6
		        wait
		  sustain
		  vol 0Ch
		        noteL Cs6,240
		  vol 08h
		        noteL Cs6,6
		  vol 05h
		        note  Cs6
		  vol 03h
		        note  Cs6
		  vol 01h
		  setRelease 01h
		        noteL Cs6,7
		channel_end
Music_20_Channel_6:
		  psgInst 00h
		  setRelease 01h
		  vibrato 04Ch
		        waitL    49
		  psgInst 079h
		        psgNoteL F3,96
		        psgNote  F3
		        psgNote  F3
		        psgNote  F3
		        psgNoteL E3,240
		        waitL    6
		  psgInst 06h
		        wait
		  psgInst 04h
		        wait
		  psgInst 02h
		        wait
		  psgInst 00h
		        waitL    12
		channel_end
Music_20_Channel_7:
		  psgInst 00h
		  setRelease 01h
		  vibrato 04Ch
		        waitL    49
		  psgInst 079h
		        psgNoteL A2,96
		        psgNote  A2
		        psgNote  A2
		        psgNote  A2
		        psgNoteL G2,240
		        waitL    6
		  psgInst 06h
		        wait
		  psgInst 04h
		        wait
		  psgInst 02h
		        wait
		  psgInst 00h
		        waitL    12
		channel_end
Music_20_Channel_9:
		channel_end
