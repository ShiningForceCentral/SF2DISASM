
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
		  stereo 0C0h
		  vibrato 02Ch
		        waitL 21
		  inst 13
		  vol 0Ch
		  setRelease 05h
		        noteL F5,8
		        note  F5
		        note  F5
		  setRelease 05h
		        note  F5
		  vol 09h
		        note  F5
		  vol 0Ch
		        note  F5
		  setRelease 01h
		        noteL F5,60
		  vol 09h
		        noteL F5,6
		  vol 06h
		        note  F5
		        waitL 12
		channel_end
Music_27_Channel_1:
		  stereo 0C0h
		  setRelease 05h
		  vibrato 02Ch
		        waitL 21
		  inst 13
		  vol 0Dh
		        noteL As4,8
		        note  As4
		        note  As4
		        note  C5
		  vol 0Ah
		        note  C5
		  vol 0Dh
		        note  As4
		  setRelease 01h
		        noteL C5,60
		  vol 0Ah
		        noteL C5,6
		  vol 07h
		        note  C5
		        waitL 12
		channel_end
Music_27_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 21
		  inst 3
		  vol 0Ch
		        noteL Cs4,4
		        waitL 20
		        noteL Ds4,4
		        waitL 12
		        noteL Ds4,4
		        wait
		        noteL D4,60
		  vol 09h
		        noteL D4,6
		  vol 06h
		        note  D4
		        waitL 12
		channel_end
Music_27_Channel_3:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 21
		  inst 3
		  vol 0Dh
		        noteL Fs2,4
		        waitL 20
		        noteL Gs2,4
		        waitL 12
		        noteL Gs2,4
		        wait
		        noteL As2,60
		  vol 0Ah
		        noteL As2,6
		  vol 07h
		        note  As2
		        waitL 12
		channel_end
Music_27_Channel_4:
		  stereo 040h
		  shifting 020h
		  setRelease 05h
		  vibrato 02Ch
		        waitL 25
		  inst 13
		  vol 0Bh
		        noteL As4,8
		        note  As4
		        note  As4
		        note  C5
		  vol 08h
		        note  C5
		  vol 0Bh
		        note  As4
		  setRelease 01h
		        noteL C5,56
		  vol 06h
		        noteL C5,6
		  vol 03h
		        note  C5
		        waitL 12
		channel_end
Music_27_Channel_5:
		  stereo 0C0h
		        waitL 21
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
		  psgInst 07Dh
		  setRelease 01h
		  vibrato 04Ch
		        psgNoteL F4,3
		        psgNote  G4
		        psgNote  A4
		        psgNote  As4
		        psgNote  C5
		        psgNote  D5
		        psgNote  Ds5
		        psgNoteL F5,4
		        psgNote  Fs5
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  As4
		        psgNote  Fs4
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  Ds4
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  F4
		        psgNote  As4
		        psgNote  F4
		        psgNote  As4
		        psgNote  C5
		        psgNote  D5
		        psgNote  F5
		  psgInst 07Dh
		        psgNoteL As5,6
		        wait
		  psgInst 0Ah
		        wait
		  psgInst 08h
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        wait
		channel_end
Music_27_Channel_7:
		  psgInst 00h
		        waitL    6
		  shifting 010h
		  psgInst 07Bh
		  setRelease 01h
		  vibrato 04Ch
		        psgNoteL F4,3
		        psgNote  G4
		        psgNote  A4
		        psgNote  As4
		        psgNote  C5
		        psgNote  D5
		        psgNote  Ds5
		        psgNoteL F5,4
		        psgNote  Fs5
		        psgNote  F5
		        psgNote  Cs5
		        psgNote  As4
		        psgNote  Fs4
		        psgNote  Ds5
		        psgNote  F5
		        psgNote  Ds5
		        psgNote  C5
		        psgNote  Gs4
		        psgNote  Ds4
		        psgNote  D5
		        psgNote  Ds5
		        psgNote  D5
		        psgNote  C5
		        psgNote  As4
		        psgNote  F4
		        psgNote  As4
		        psgNote  F4
		        psgNote  As4
		        psgNote  C5
		        psgNote  D5
		        psgNote  F5
		  psgInst 07Ch
		        psgNoteL As5,6
		        wait
		  psgInst 08h
		        wait
		  psgInst 06h
		        wait
		  psgInst 00h
		        wait
		channel_end
Music_27_Channel_9:
		channel_end
