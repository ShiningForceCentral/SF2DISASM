
; ASM FILE music26.asm :
; 0xF803..0xF919 : Music 26
Music_26:       db 0
		db 1
		db 0
		db 0C3h
		dw Music_26_Channel_0
		dw Music_26_Channel_1
		dw Music_26_Channel_2
		dw Music_26_Channel_3
		dw Music_26_Channel_4
		dw Music_26_Channel_5
		dw Music_26_Channel_6
		dw Music_26_Channel_7
		dw Music_26_Channel_9
		dw Music_26_Channel_9
Music_26_Channel_0:
		  stereo 0C0h
		  inst 13
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL Ds4,6
		  vol 08h
		        note  Ds4
		  vol 0Bh
		        note  A3
		  vol 08h
		        note  A3
		  vol 05h
		        note  A3
		  vol 0Bh
		        note  Cs4
		  vol 08h
		        note  Cs4
		  vol 05h
		        note  Cs4
		  vol 0Bh
		        note  Gs3
		  vol 08h
		        note  Gs3
		        waitL 24
		channel_end
Music_26_Channel_1:
		  stereo 0C0h
		  inst 20
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL F4,6
		  setRelease 02h
		        note  Fs4
		        note  Fs4
		        note  Fs4
		        note  Fs4
		  setRelease 01h
		        note  A4
		        note  As4
		  vol 08h
		        note  As4
		  vol 0Bh
		        note  E5
		  vol 08h
		        note  E5
		        waitL 24
		channel_end
Music_26_Channel_2:
		  stereo 0C0h
		  inst 13
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Ch
		        noteL E4,6
		  vol 08h
		        note  E4
		        waitL 18
		  vol 0Bh
		        noteL Ds4,6
		  vol 08h
		        note  Ds4
		  vol 05h
		        note  Ds4
		  vol 0Bh
		        note  F4
		  vol 08h
		        note  F4
		        waitL 24
		channel_end
Music_26_Channel_3:
		        waitL 6
		  shifting 020h
		  stereo 0C0h
		  inst 20
		  vol 09h
		  setRelease 01h
		  vibrato 02Ch
		        note  F4
		  setRelease 02h
		        note  Fs4
		        note  Fs4
		        note  Fs4
		        note  Fs4
		  setRelease 01h
		        note  A4
		        note  As4
		  vol 06h
		        note  As4
		  vol 09h
		        note  E5
		  vol 06h
		        note  E5
		        waitL 18
		channel_end
Music_26_Channel_4:
		  shifting 020h
		        waitL 6
		  stereo 040h
		  inst 13
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        note  E4
		  vol 07h
		        note  E4
		        waitL 18
		  vol 0Ah
		        noteL Ds4,6
		  vol 07h
		        note  Ds4
		  vol 04h
		        note  Ds4
		  vol 0Ah
		        note  F4
		  vol 07h
		        note  F4
		        waitL 18
		channel_end
Music_26_Channel_5:
		  stereo 080h
		        waitL 6
		  shifting 020h
		  inst 13
		  vol 0Ah
		  setRelease 01h
		  vibrato 02Ch
		        note  Ds4
		  vol 07h
		        note  Ds4
		  vol 0Ah
		        note  A3
		  vol 07h
		        note  A3
		  vol 04h
		        note  A3
		  vol 0Ah
		        note  Cs4
		  vol 07h
		        note  Cs4
		  vol 04h
		        note  Cs4
		  vol 0Ah
		        note  Gs3
		  vol 07h
		        note  Gs3
		        waitL 18
		channel_end
Music_26_Channel_6:
		channel_end
Music_26_Channel_7:
		channel_end
Music_26_Channel_9:
		channel_end
