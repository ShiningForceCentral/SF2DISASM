
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
		        noteL F6,8
		        note  F6
		        note  F6
		  setRelease 05h
		        note  F6
		  vol 09h
		        note  F6
		  vol 0Ch
		        note  F6
		  setRelease 01h
		        noteL F6,60
		  vol 09h
		        noteL F6,6
		  vol 06h
		        note  F6
		        waitL 12
		channel_end
Music_27_Channel_1:
		  stereo 0C0h
		  setRelease 05h
		  vibrato 02Ch
		        waitL 21
		  inst 13
		  vol 0Dh
		        noteL As5,8
		        note  As5
		        note  As5
		        note  C6
		  vol 0Ah
		        note  C6
		  vol 0Dh
		        note  As5
		  setRelease 01h
		        noteL C6,60
		  vol 0Ah
		        noteL C6,6
		  vol 07h
		        note  C6
		        waitL 12
		channel_end
Music_27_Channel_2:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 21
		  inst 3
		  vol 0Ch
		        noteL Cs5,4
		        waitL 20
		        noteL Ds5,4
		        waitL 12
		        noteL Ds5,4
		        wait
		        noteL D5,60
		  vol 09h
		        noteL D5,6
		  vol 06h
		        note  D5
		        waitL 12
		channel_end
Music_27_Channel_3:
		  stereo 0C0h
		  setRelease 01h
		  vibrato 02Ch
		        waitL 21
		  inst 3
		  vol 0Dh
		        noteL Fs3,4
		        waitL 20
		        noteL Gs3,4
		        waitL 12
		        noteL Gs3,4
		        wait
		        noteL As3,60
		  vol 0Ah
		        noteL As3,6
		  vol 07h
		        note  As3
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
		        noteL As5,8
		        note  As5
		        note  As5
		        note  C6
		  vol 08h
		        note  C6
		  vol 0Bh
		        note  As5
		  setRelease 01h
		        noteL C6,56
		  vol 06h
		        noteL C6,6
		  vol 03h
		        note  C6
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
		        psgNoteL F3,3
		        psgNote  G3
		        psgNote  A3
		        psgNote  As3
		        psgNote  C4
		        psgNote  D4
		        psgNote  Ds4
		        psgNoteL F4,4
		        psgNote  Fs4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  As3
		        psgNote  Fs3
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  Ds3
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  F3
		        psgNote  As3
		        psgNote  F3
		        psgNote  As3
		        psgNote  C4
		        psgNote  D4
		        psgNote  F4
		  psgInst 07Dh
		        psgNoteL As4,6
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
		        psgNoteL F3,3
		        psgNote  G3
		        psgNote  A3
		        psgNote  As3
		        psgNote  C4
		        psgNote  D4
		        psgNote  Ds4
		        psgNoteL F4,4
		        psgNote  Fs4
		        psgNote  F4
		        psgNote  Cs4
		        psgNote  As3
		        psgNote  Fs3
		        psgNote  Ds4
		        psgNote  F4
		        psgNote  Ds4
		        psgNote  C4
		        psgNote  Gs3
		        psgNote  Ds3
		        psgNote  D4
		        psgNote  Ds4
		        psgNote  D4
		        psgNote  C4
		        psgNote  As3
		        psgNote  F3
		        psgNote  As3
		        psgNote  F3
		        psgNote  As3
		        psgNote  C4
		        psgNote  D4
		        psgNote  F4
		  psgInst 07Ch
		        psgNoteL As4,6
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
