
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
		  ymStereo 0C0h
		  ymInst 36
		  ymVol 0Ch
		  release 01h
		  vibrato 02Ch
		        noteL D3,48
		        note  G3
		  ymVol 0Dh
		        noteL As2,52
		        noteL A2,161
		  length 24
		channel_end
Music_22_Channel_1:
		  ymStereo 0C0h
		  ymInst 9
		  ymVol 0Ch
		  release 01h
		  vibrato 02Fh
		        noteL F4,48
		        note  A4
		        noteL C5,52
		        noteL E5,161
		  length 24
		channel_end
Music_22_Channel_2:
		  ymStereo 0C0h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 12
		  ymVol 0Ch
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
		  length 24
		channel_end
Music_22_Channel_3:
		  shifting 010h
		  ymStereo 080h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 18
		  ymVol 0Bh
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
		  length 18
		channel_end
Music_22_Channel_4:
		  shifting 020h
		  ymStereo 040h
		  ymInst 26
		  release 01h
		  vibrato 02Ch
		  length 24
		  ymVol 0Ah
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
		  length 12
		channel_end
Music_22_Channel_5:
		  length 6
		  shifting 020h
		  ymStereo 040h
		  ymInst 9
		  ymVol 0Bh
		  release 01h
		  vibrato 02Fh
		        noteL F4,48
		        note  A4
		        noteL C5,52
		        noteL E5,161
		  length 18
		channel_end
Music_22_Channel_6:
		channel_end
Music_22_Channel_7:
		channel_end
Music_22_Channel_9:
		channel_end
