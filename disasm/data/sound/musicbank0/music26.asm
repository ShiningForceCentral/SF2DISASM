
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
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL Ds4,6
		  ymVol 08h
		        note  Ds4
		  ymVol 0Bh
		        note  A3
		  ymVol 08h
		        note  A3
		  ymVol 05h
		        note  A3
		  ymVol 0Bh
		        note  Cs4
		  ymVol 08h
		        note  Cs4
		  ymVol 05h
		        note  Cs4
		  ymVol 0Bh
		        note  Gs3
		  ymVol 08h
		        note  Gs3
		  length 24
		channel_end
Music_26_Channel_1:
		  ymStereo 0C0h
		  ymInst 20
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL F4,6
		  release 02h
		        note  Fs4
		        note  Fs4
		        note  Fs4
		        note  Fs4
		  release 01h
		        note  A4
		        note  As4
		  ymVol 08h
		        note  As4
		  ymVol 0Bh
		        note  E5
		  ymVol 08h
		        note  E5
		  length 24
		channel_end
Music_26_Channel_2:
		  ymStereo 0C0h
		  ymInst 13
		  ymVol 0Bh
		  release 01h
		  vibrato 02Ch
		        noteL E4,6
		  ymVol 08h
		        note  E4
		  length 18
		  ymVol 0Bh
		        noteL Ds4,6
		  ymVol 08h
		        note  Ds4
		  ymVol 05h
		        note  Ds4
		  ymVol 0Bh
		        note  F4
		  ymVol 08h
		        note  F4
		  length 24
		channel_end
Music_26_Channel_3:
		  length 6
		  shifting 020h
		  ymStereo 0C0h
		  ymInst 20
		  ymVol 09h
		  release 01h
		  vibrato 02Ch
		        note  F4
		  release 02h
		        note  Fs4
		        note  Fs4
		        note  Fs4
		        note  Fs4
		  release 01h
		        note  A4
		        note  As4
		  ymVol 06h
		        note  As4
		  ymVol 09h
		        note  E5
		  ymVol 06h
		        note  E5
		  length 18
		channel_end
Music_26_Channel_4:
		  shifting 020h
		  length 6
		  ymStereo 040h
		  ymInst 13
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        note  E4
		  ymVol 07h
		        note  E4
		  length 18
		  ymVol 0Ah
		        noteL Ds4,6
		  ymVol 07h
		        note  Ds4
		  ymVol 04h
		        note  Ds4
		  ymVol 0Ah
		        note  F4
		  ymVol 07h
		        note  F4
		  length 18
		channel_end
Music_26_Channel_5:
		  ymStereo 080h
		  length 6
		  shifting 020h
		  ymInst 13
		  ymVol 0Ah
		  release 01h
		  vibrato 02Ch
		        note  Ds4
		  ymVol 07h
		        note  Ds4
		  ymVol 0Ah
		        note  A3
		  ymVol 07h
		        note  A3
		  ymVol 04h
		        note  A3
		  ymVol 0Ah
		        note  Cs4
		  ymVol 07h
		        note  Cs4
		  ymVol 04h
		        note  Cs4
		  ymVol 0Ah
		        note  Gs3
		  ymVol 07h
		        note  Gs3
		  length 18
		channel_end
Music_26_Channel_6:
		channel_end
Music_26_Channel_7:
		channel_end
Music_26_Channel_9:
		channel_end
