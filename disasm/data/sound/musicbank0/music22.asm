
; ASM FILE music22.asm :
; 0xF243..0xF32A : Music 22
Music_22:       db 0
		db 1
		db 0
		db 0D4h
		dw Music_22_Channel_0
		dw Music_22_Channel_1
		dw Music_22_Channel_2
		dw Music_22_Channel_3
		dw Music_22_Channel_4
		dw Music_22_Channel_5
		dw Music_22_Channel_6
		dw Music_22_Channel_7
		dw Music_22_Channel_9
		dw Music_22_Channel_9
Music_22_Channel_0:
		  stereo 0C0h
		  inst 36
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Ch
		        noteL D3,48
		        note  G3
		  vol 0Dh
		        noteL As2,52
		        noteL A2,161
		        waitL 24
		channel_end
Music_22_Channel_1:
		  stereo 0C0h
		  inst 9
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Fh
		        noteL F4,48
		        note  A4
		        noteL C5,52
		        noteL E5,161
		        waitL 24
		channel_end
Music_22_Channel_2:
		  stereo 0C0h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 12
		  vol 0Ch
		        note  F3
		        note  A3
		        noteL C4,24
		        noteL B3,12
		        note  D4
		        noteL F4,24
		        noteL F3,12
		        noteL Gs3,14
		        noteL D4,28
		        noteL E3,13
		        noteL A3,15
		        noteL D4,17
		        noteL Cs4,102
		        waitL 24
		channel_end
Music_22_Channel_3:
		  shifting 010h
		  stereo 080h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 18
		  vol 0Bh
		        noteL F3,12
		        note  A3
		        noteL C4,24
		        noteL B3,12
		        note  D4
		        noteL F4,24
		        noteL F3,12
		        noteL Gs3,14
		        noteL D4,28
		        noteL E3,13
		        noteL A3,15
		        noteL D4,17
		        noteL Cs4,102
		        waitL 18
		channel_end
Music_22_Channel_4:
		  shifting 020h
		  stereo 040h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 24
		  vol 0Ah
		        noteL F3,12
		        note  A3
		        noteL C4,24
		        noteL B3,12
		        note  D4
		        noteL F4,24
		        noteL F3,12
		        noteL Gs3,14
		        noteL D4,28
		        noteL E3,13
		        noteL A3,15
		        noteL D4,17
		        noteL Cs4,102
		        waitL 12
		channel_end
Music_22_Channel_5:
		        waitL 6
		  shifting 020h
		  stereo 040h
		  inst 9
		  vol 0Bh
		  setRelease 01h
		  vibrato 02Fh
		        noteL F4,48
		        note  A4
		        noteL C5,52
		        noteL E5,161
		        waitL 18
		channel_end
Music_22_Channel_6:
		channel_end
Music_22_Channel_7:
		channel_end
Music_22_Channel_9:
		channel_end
