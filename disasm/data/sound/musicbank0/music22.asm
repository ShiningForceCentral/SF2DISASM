
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
		        noteL D4,48
		        note  G4
		  vol 0Dh
		        noteL As3,52
		        noteL A3,161
		        waitL 24
		channel_end
Music_22_Channel_1:
		  stereo 0C0h
		  inst 9
		  vol 0Ch
		  setRelease 01h
		  vibrato 02Fh
		        noteL F5,48
		        note  A5
		        noteL C6,52
		        noteL E6,161
		        waitL 24
		channel_end
Music_22_Channel_2:
		  stereo 0C0h
		  inst 26
		  setRelease 01h
		  vibrato 02Ch
		        waitL 12
		  vol 0Ch
		        note  F4
		        note  A4
		        noteL C5,24
		        noteL B4,12
		        note  D5
		        noteL F5,24
		        noteL F4,12
		        noteL Gs4,14
		        noteL D5,28
		        noteL E4,13
		        noteL A4,15
		        noteL D5,17
		        noteL Cs5,102
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
		        noteL F4,12
		        note  A4
		        noteL C5,24
		        noteL B4,12
		        note  D5
		        noteL F5,24
		        noteL F4,12
		        noteL Gs4,14
		        noteL D5,28
		        noteL E4,13
		        noteL A4,15
		        noteL D5,17
		        noteL Cs5,102
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
		        noteL F4,12
		        note  A4
		        noteL C5,24
		        noteL B4,12
		        note  D5
		        noteL F5,24
		        noteL F4,12
		        noteL Gs4,14
		        noteL D5,28
		        noteL E4,13
		        noteL A4,15
		        noteL D5,17
		        noteL Cs5,102
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
		        noteL F5,48
		        note  A5
		        noteL C6,52
		        noteL E6,161
		        waitL 18
		channel_end
Music_22_Channel_6:
		channel_end
Music_22_Channel_7:
		channel_end
Music_22_Channel_9:
		channel_end
