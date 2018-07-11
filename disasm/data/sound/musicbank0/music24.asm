
; ASM FILE music24.asm :
; 0xF494..0xF5B6 : Music 24
Music_24:       db 0
		db 1
		db 0
		db 0C8h
		dw Music_24_Channel_0
		dw Music_24_Channel_1
		dw Music_24_Channel_2
		dw Music_24_Channel_3
		dw Music_24_Channel_4
		dw Music_24_Channel_5
		dw Music_24_Channel_6
		dw Music_24_Channel_7
		dw Music_24_Channel_9
		dw Music_24_Channel_9
Music_24_Channel_0:
		ymStereo 0C0h
		ymInst 25
		ymVol 0Eh
		release 01h
		vibrato 02Ch
		noteL 9,74
		noteL 7,42
		noteL 5,123
		length 24
		channel_end
Music_24_Channel_1:
		ymStereo 0C0h
		ymInst 26
		ymVol 0Ch
		release 01h
		vibrato 02Ch
		noteL 43,9
		note 42
		note 43
		note 47
		noteL 50,18
		noteL 52,20
		noteL 54,32
		noteL 55,10
		noteL 57,123
		length 24
		channel_end
Music_24_Channel_2:
		ymStereo 0C0h
		ymInst 26
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 35,74
		noteL 49,42
		noteL 48,123
		length 24
		channel_end
Music_24_Channel_3:
		ymStereo 0C0h
		ymInst 26
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 31,74
		noteL 40,42
		noteL 40,123
		length 24
		channel_end
Music_24_Channel_4:
		ymStereo 080h
		shifting 020h
		ymInst 26
		release 01h
		vibrato 02Ch
		length 18
		ymVol 0Ah
		noteL 43,9
		note 42
		note 43
		note 47
		noteL 50,18
		noteL 52,20
		noteL 54,32
		noteL 55,10
		noteL 57,105
		length 24
		channel_end
Music_24_Channel_5:
		ymStereo 040h
		shifting 010h
		ymInst 26
		release 01h
		vibrato 02Ch
		length 9
		ymVol 0Bh
		note 43
		note 42
		note 43
		note 47
		noteL 50,18
		noteL 52,20
		noteL 54,32
		noteL 55,10
		noteL 57,114
		length 24
		channel_end
Music_24_Channel_6:
		psgInst 0
		release 01h
		vibrato 04Ch
		length 71
		psgInst 125
		noteL 49,5
		note 50
		note 52
		note 54
		note 55
		noteL 57,4
		note 59
		note 61
		note 62
		note 64
		noteL 65,9
		noteL 67,6
		noteL 65,5
		note 67
		countedLoopStart 7
		noteL 65,4
		note 67
		countedLoopEnd
		noteL 65,34
		length 6
		psgInst 10
		silence
		psgInst 6
		silence
		psgInst 0
		silence
		channel_end
Music_24_Channel_7:
		shifting 010h
		psgInst 0
		release 01h
		vibrato 04Ch
		length 75
		psgInst 123
		noteL 49,5
		note 50
		note 52
		note 54
		note 55
		noteL 57,4
		note 59
		note 61
		note 62
		note 64
		noteL 65,9
		noteL 67,6
		noteL 65,5
		note 67
		countedLoopStart 7
		noteL 65,4
		note 67
		countedLoopEnd
		noteL 65,36
		length 6
		psgInst 6
		silence
		psgInst 0
		silence
		channel_end
Music_24_Channel_9:
		channel_end
