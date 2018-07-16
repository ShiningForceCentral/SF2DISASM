
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
		  ymStereo 0C0h
		  ymInst 25
		  release 01h
		  vibrato 02Ch
		  length 49
		  ymVol 0Bh
		        noteL D3,96
		        note  C3
		        note  B2
		        note  As2
		  ymSustain
		        noteL A2,240
		  ymVol 09h
		        noteL A2,6
		  ymVol 07h
		        note  A2
		  ymVol 05h
		        note  A2
		  ymVol 03h
		  release 01h
		        note  A2
		  length 12
		channel_end
Music_20_Channel_1:
		  ymStereo 0C0h
		  ymInst 49
		  ymVol 0Dh
		  release 01h
		  vibrato 02Ch
		        noteL A4,48
		        noteL E5,72
		        noteL F5,24
		        noteL D5,96
		        noteL A5,12
		  ymVol 09h
		        note  A5
		  ymVol 06h
		        note  A5
		        silence
		  ymVol 0Dh
		        noteL G5,96
		        noteL D5,12
		  ymVol 09h
		        note  D5
		  ymVol 06h
		        note  D5
		        silence
		  ymSustain
		  ymVol 0Dh
		        noteL Cs5,240
		  ymVol 09h
		        noteL Cs5,6
		  ymVol 06h
		        note  Cs5
		  ymVol 04h
		        note  Cs5
		  ymVol 02h
		  release 01h
		        note  Cs5
		  length 13
		channel_end
Music_20_Channel_2:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 49
		  ymInst 39
		  ymVol 0Ah
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
		  ymVol 08h
		        noteL Cs4,8
		        note  E4
		        noteL A4,16
		  ymVol 06h
		        noteL Cs4,8
		        note  E4
		        noteL A4,126
		  length 36
		channel_end
Music_20_Channel_3:
		  ymStereo 080h
		  shifting 010h
		  release 01h
		  vibrato 02Ch
		  length 81
		  ymInst 39
		  ymVol 09h
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
		  ymVol 07h
		        noteL Cs4,8
		        note  E4
		        noteL A4,16
		  ymVol 05h
		        noteL Cs4,8
		        note  E4
		        noteL A4,126
		  length 28
		channel_end
Music_20_Channel_4:
		  ymStereo 040h
		  shifting 020h
		  release 01h
		  vibrato 02Ch
		  length 89
		  ymInst 39
		  ymVol 08h
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
		  ymVol 06h
		        noteL Cs4,8
		        note  E4
		        noteL A4,16
		  ymVol 04h
		        noteL Cs4,8
		        note  E4
		        noteL A4,126
		  length 20
		channel_end
Music_20_Channel_5:
		  length 12
		  ymStereo 040h
		  shifting 020h
		  ymInst 49
		  ymVol 0Ch
		  release 01h
		  vibrato 02Ch
		        noteL A4,48
		        noteL E5,72
		        noteL F5,24
		        noteL D5,96
		        noteL A5,12
		  ymVol 08h
		        note  A5
		  ymVol 05h
		        note  A5
		        silence
		  ymVol 0Ch
		        noteL G5,96
		        noteL D5,12
		  ymVol 08h
		        note  D5
		  ymVol 05h
		        note  D5
		        silence
		  ymSustain
		  ymVol 0Ch
		        noteL Cs5,240
		  ymVol 08h
		        noteL Cs5,6
		  ymVol 05h
		        note  Cs5
		  ymVol 03h
		        note  Cs5
		  ymVol 01h
		  release 01h
		        noteL Cs5,7
		channel_end
Music_20_Channel_6:
		  psgInst 0
		  release 01h
		  vibrato 04Ch
		  length 49
		  psgInst 121
		        psgNoteL D5,96
		        psgNote  D5
		        psgNote  D5
		        psgNote  D5
		        psgNoteL Cs5,240
		  length 6
		  psgInst 6
		        silence
		  psgInst 4
		        silence
		  psgInst 2
		        silence
		  psgInst 0
		  length 12
		channel_end
Music_20_Channel_7:
		  psgInst 0
		  release 01h
		  vibrato 04Ch
		  length 49
		  psgInst 121
		        psgNoteL Fs4,96
		        psgNote  Fs4
		        psgNote  Fs4
		        psgNote  Fs4
		        psgNoteL E4,240
		  length 6
		  psgInst 6
		        silence
		  psgInst 4
		        silence
		  psgInst 2
		        silence
		  psgInst 0
		  length 12
		channel_end
Music_20_Channel_9:
		channel_end
