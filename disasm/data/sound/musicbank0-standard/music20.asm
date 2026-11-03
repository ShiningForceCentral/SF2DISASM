
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
		        noteL D3,96
		        note  C3
		        note  B2
		        note  As2
		  sustain
		        noteL A2,240
		  vol 09h
		        noteL A2,6
		  vol 07h
		        note  A2
		  vol 05h
		        note  A2
		  vol 03h
		  setRelease 01h
		        note  A2
		        waitL 12
		channel_end
Music_20_Channel_1:
		  stereo 0C0h
		  inst 49
		  vol 0Dh
		  setRelease 01h
		  vibrato 02Ch
		        noteL A4,48
		        noteL E5,72
		        noteL F5,24
		        noteL D5,96
		        noteL A5,12
		  vol 09h
		        note  A5
		  vol 06h
		        note  A5
		        wait
		  vol 0Dh
		        noteL G5,96
		        noteL D5,12
		  vol 09h
		        note  D5
		  vol 06h
		        note  D5
		        wait
		  sustain
		  vol 0Dh
		        noteL Cs5,240
		  vol 09h
		        noteL Cs5,6
		  vol 06h
		        note  Cs5
		  vol 04h
		        note  Cs5
		  vol 02h
		  setRelease 01h
		        note  Cs5
		        waitL 13
		channel_end
Music_20_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 49
		  inst 39
		  vol 0Ah
		        noteL D3,24
		        note  A3
		        note  F4
		        note  A3
		        note  C3
		        note  A3
		        note  F4
		        note  A3
		        note  B2
		        note  A3
		        note  F4
		        note  A3
		        note  As2
		        note  A3
		        note  F4
		        note  A3
		        noteL A2,16
		        noteL E3,10
		        noteL A3,8
		        note  Cs4
		        note  E4
		        noteL A4,16
		  vol 08h
		        noteL Cs4,8
		        note  E4
		        noteL A4,16
		  vol 06h
		        noteL Cs4,8
		        note  E4
		        noteL A4,126
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
		        noteL A3,24
		        note  F4
		        noteL A3,48
		countedLoopEnd
		        noteL A3,24
		        note  F4
		        noteL A3,40
		        noteL E3,10
		        noteL A3,8
		        note  Cs4
		        note  E4
		        noteL A4,16
		  vol 07h
		        noteL Cs4,8
		        note  E4
		        noteL A4,16
		  vol 05h
		        noteL Cs4,8
		        note  E4
		        noteL A4,126
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
		        noteL A3,24
		        note  F4
		        noteL A3,48
		countedLoopEnd
		        noteL A3,24
		        note  F4
		        noteL A3,40
		        noteL E3,10
		        noteL A3,8
		        note  Cs4
		        note  E4
		        noteL A4,16
		  vol 06h
		        noteL Cs4,8
		        note  E4
		        noteL A4,16
		  vol 04h
		        noteL Cs4,8
		        note  E4
		        noteL A4,126
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
		        noteL A4,48
		        noteL E5,72
		        noteL F5,24
		        noteL D5,96
		        noteL A5,12
		  vol 08h
		        note  A5
		  vol 05h
		        note  A5
		        wait
		  vol 0Ch
		        noteL G5,96
		        noteL D5,12
		  vol 08h
		        note  D5
		  vol 05h
		        note  D5
		        wait
		  sustain
		  vol 0Ch
		        noteL Cs5,240
		  vol 08h
		        noteL Cs5,6
		  vol 05h
		        note  Cs5
		  vol 03h
		        note  Cs5
		  vol 01h
		  setRelease 01h
		        noteL Cs5,7
		channel_end
Music_20_Channel_6:
		  psgInst 00h
		  setRelease 01h
		  vibrato 04Ch
		        waitL    49
		  psgInst 079h
		        psgNoteL F4,96
		        psgNote  F4
		        psgNote  F4
		        psgNote  F4
		        psgNoteL E4,240
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
		        psgNoteL A3,96
		        psgNote  A3
		        psgNote  A3
		        psgNote  A3
		        psgNoteL G3,240
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
