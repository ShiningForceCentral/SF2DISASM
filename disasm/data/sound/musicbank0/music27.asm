
; ASM FILE music27.asm :
; 0xF919..0xFA96 : Music 27
Music_27:       db 0
		db 0
		db 0
		db 0C4h
		dw Music_27_Channel_0
		dw Music_27_Channel_1
		dw Music_27_Channel_2
		dw Music_27_Channel_3
		dw Music_27_Channel_4
		dw Music_27_Channel_5
		dw Music_27_Channel_6
		dw Music_27_Channel_7
		dw Music_27_Channel_9
		dw Music_27_Channel_9
Music_27_Channel_0:
		  ymStereo 0C0h
		  vibrato 02Ch
		  length 21
		  ymInst 13
		  ymVol 0Ch
		  release 05h
		        noteL F5,8
		        note  F5
		        note  F5
		  release 05h
		        note  F5
		  ymVol 09h
		        note  F5
		  ymVol 0Ch
		        note  F5
		  release 01h
		        noteL F5,60
		  ymVol 09h
		        noteL F5,6
		  ymVol 06h
		        note  F5
		  length 12
		channel_end
Music_27_Channel_1:
		  ymStereo 0C0h
		  release 05h
		  vibrato 02Ch
		  length 21
		  ymInst 13
		  ymVol 0Dh
		        noteL As4,8
		        note  As4
		        note  As4
		        note  C5
		  ymVol 0Ah
		        note  C5
		  ymVol 0Dh
		        note  As4
		  release 01h
		        noteL C5,60
		  ymVol 0Ah
		        noteL C5,6
		  ymVol 07h
		        note  C5
		  length 12
		channel_end
Music_27_Channel_2:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 21
		  ymInst 3
		  ymVol 0Ch
		        noteL Cs4,4
		  length 20
		        noteL Ds4,4
		  length 12
		        noteL Ds4,4
		        silence
		        noteL D4,60
		  ymVol 09h
		        noteL D4,6
		  ymVol 06h
		        note  D4
		  length 12
		channel_end
Music_27_Channel_3:
		  ymStereo 0C0h
		  release 01h
		  vibrato 02Ch
		  length 21
		  ymInst 3
		  ymVol 0Dh
		        noteL Fs2,4
		  length 20
		        noteL Gs2,4
		  length 12
		        noteL Gs2,4
		        silence
		        noteL As2,60
		  ymVol 0Ah
		        noteL As2,6
		  ymVol 07h
		        note  As2
		  length 12
		channel_end
Music_27_Channel_4:
		  ymStereo 040h
		  shifting 020h
		  release 05h
		  vibrato 02Ch
		  length 25
		  ymInst 13
		  ymVol 0Bh
		        noteL As4,8
		        note  As4
		        note  As4
		        note  C5
		  ymVol 08h
		        note  C5
		  ymVol 0Bh
		        note  As4
		  release 01h
		        noteL C5,56
		  ymVol 06h
		        noteL C5,6
		  ymVol 03h
		        note  C5
		  length 12
		channel_end
Music_27_Channel_5:
		  ymStereo 0C0h
		  length 21
		        sampleL 5,12
		        sampleL 4,4
		        sample  3
		        sample  3
		        sampleL 2,15
		        sampleL 4,1
		        sampleL 2,8
		        sampleL 5,3
		        sample  2
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sample  4
		        sample  4
		        sample  4
		        sample  4
		        sample  4
		        sample  4
		        sample  3
		        sample  3
		        sample  3
		        sample  3
		        sampleL 2,12
		channel_end
Music_27_Channel_6:
		  psgInst 125
		  release 01h
		  vibrato 04Ch
		        psgNoteL D5,3
		        psgNote  E5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  A5
		        psgNote  B5
		        psgNote  C6
		        psgNoteL D6,4
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  As5
		        psgNote  G5
		        psgNote  Ds5
		        psgNote  C6
		        psgNote  D6
		        psgNote  C6
		        psgNote  A5
		        psgNote  F5
		        psgNote  C5
		        psgNote  B5
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  D5
		        psgNote  G5
		        psgNote  D5
		        psgNote  G5
		        psgNote  A5
		        psgNote  B5
		        psgNote  D6
		  psgInst 125
		        psgNoteL G6,6
		        silence
		  psgInst 10
		        silence
		  psgInst 8
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		        silence
		channel_end
Music_27_Channel_7:
		  psgInst 0
		  length 6
		  shifting 010h
		  psgInst 123
		  release 01h
		  vibrato 04Ch
		        psgNoteL D5,3
		        psgNote  E5
		        psgNote  Fs5
		        psgNote  G5
		        psgNote  A5
		        psgNote  B5
		        psgNote  C6
		        psgNoteL D6,4
		        psgNote  Ds6
		        psgNote  D6
		        psgNote  As5
		        psgNote  G5
		        psgNote  Ds5
		        psgNote  C6
		        psgNote  D6
		        psgNote  C6
		        psgNote  A5
		        psgNote  F5
		        psgNote  C5
		        psgNote  B5
		        psgNote  C6
		        psgNote  B5
		        psgNote  A5
		        psgNote  G5
		        psgNote  D5
		        psgNote  G5
		        psgNote  D5
		        psgNote  G5
		        psgNote  A5
		        psgNote  B5
		        psgNote  D6
		  psgInst 124
		        psgNoteL G6,6
		        silence
		  psgInst 8
		        silence
		  psgInst 6
		        silence
		  psgInst 0
		        silence
		channel_end
Music_27_Channel_9:
		channel_end
