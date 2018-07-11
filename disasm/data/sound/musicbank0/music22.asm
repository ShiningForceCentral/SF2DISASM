
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
		noteL 26,48
		note 31
		ymVol 0Dh
		noteL 22,52
		noteL 21,161
		length 24
		channel_end
Music_22_Channel_1:
		ymStereo 0C0h
		ymInst 9
		ymVol 0Ch
		release 01h
		vibrato 02Fh
		noteL 41,48
		note 45
		noteL 48,52
		noteL 52,161
		length 24
		channel_end
Music_22_Channel_2:
		ymStereo 0C0h
		ymInst 26
		release 01h
		vibrato 02Ch
		length 12
		ymVol 0Ch
		note 29
		note 33
		noteL 36,24
		noteL 35,12
		note 38
		noteL 41,24
		noteL 29,12
		noteL 32,14
		noteL 38,28
		noteL 28,13
		noteL 33,15
		noteL 38,17
		noteL 37,102
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
		noteL 29,12
		note 33
		noteL 36,24
		noteL 35,12
		note 38
		noteL 41,24
		noteL 29,12
		noteL 32,14
		noteL 38,28
		noteL 28,13
		noteL 33,15
		noteL 38,17
		noteL 37,102
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
		noteL 29,12
		note 33
		noteL 36,24
		noteL 35,12
		note 38
		noteL 41,24
		noteL 29,12
		noteL 32,14
		noteL 38,28
		noteL 28,13
		noteL 33,15
		noteL 38,17
		noteL 37,102
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
		noteL 41,48
		note 45
		noteL 48,52
		noteL 52,161
		length 18
		channel_end
Music_22_Channel_6:
		channel_end
Music_22_Channel_7:
		channel_end
Music_22_Channel_9:
		channel_end
