
; ASM FILE music25.asm :
; 0xF5B6..0xF803 : Music 25
Music_25:       db 0
		db 0
		db 0
		db 0CEh
		dw Music_25_Channel_0
		dw Music_25_Channel_1
		dw Music_25_Channel_2
		dw Music_25_Channel_3
		dw Music_25_Channel_4
		dw Music_25_Channel_5
		dw Music_25_Channel_6
		dw Music_25_Channel_7
		dw Music_25_Channel_9
		dw Music_25_Channel_9
Music_25_Channel_0:
		ymStereo 0C0h
		ymInst 12
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 16,24
		ymSustain
		noteL 24,6
		note 25
		note 26
		release 01h
		note 27
		noteL 28,48
		note 26
		noteL 24,96
		noteL 23,48
		ymSustain
		noteL 22,192
		release 01h
		vibrato 020h
		noteL 22,144
		length 24
		channel_end
Music_25_Channel_1:
		ymStereo 0C0h
		ymInst 13
		ymVol 0Ch
		release 01h
		vibrato 02Ch
		noteL 42,60
		ymVol 09h
		noteL 42,12
		ymVol 0Ch
		noteL 42,8
		ymVol 09h
		note 42
		ymVol 06h
		note 42
		ymVol 0Ch
		noteL 45,36
		noteL 47,12
		noteL 42,60
		ymVol 09h
		noteL 42,12
		ymVol 0Ch
		noteL 47,8
		ymVol 09h
		note 47
		ymVol 06h
		note 47
		ymVol 0Ch
		noteL 49,36
		noteL 51,6
		ymVol 09h
		note 51
		ymVol 0Bh
		ymSustain
		noteL 51,192
		vibrato 020h
		noteL 51,144
		ymVol 08h
		noteL 51,6
		ymVol 06h
		release 01h
		note 51
		length 12
		channel_end
Music_25_Channel_2:
		ymStereo 0C0h
		ymInst 13
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		noteL 40,60
		ymVol 07h
		noteL 40,12
		ymVol 0Ah
		noteL 40,8
		ymVol 07h
		note 40
		ymVol 04h
		note 40
		ymVol 0Ah
		noteL 42,48
		noteL 40,96
		noteL 42,48
		ymSustain
		noteL 44,192
		vibrato 020h
		noteL 44,144
		ymVol 07h
		noteL 44,6
		ymVol 05h
		release 01h
		note 44
		length 12
		channel_end
Music_25_Channel_3:
		ymStereo 0C0h
		ymInst 13
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		noteL 35,60
		ymVol 07h
		noteL 35,12
		noteL 35,8
		ymVol 07h
		note 35
		ymVol 04h
		note 35
		ymVol 0Ah
		noteL 40,48
		note 35
		note 33
		note 34
		ymSustain
		noteL 36,192
		vibrato 020h
		noteL 36,144
		ymVol 07h
		noteL 36,6
		ymVol 05h
		release 01h
		note 36
		length 12
		channel_end
Music_25_Channel_4:
		shifting 020h
		ymStereo 040h
		length 6
		ymInst 13
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 42,60
		ymVol 08h
		noteL 42,12
		ymVol 0Bh
		noteL 42,8
		ymVol 08h
		note 42
		ymVol 05h
		note 42
		ymVol 0Bh
		noteL 45,36
		noteL 47,12
		noteL 42,60
		ymVol 08h
		noteL 42,12
		ymVol 0Bh
		noteL 47,8
		ymVol 08h
		note 47
		ymVol 05h
		note 47
		ymVol 0Bh
		noteL 49,18
		vibrato 00h
		release 01h
		ymStereo 0C0h
		ymInst 62
		ymVol 08h
		noteL 12,4
		ymVol 09h
		note 14
		ymVol 0Ah
		note 16
		ymVol 0Bh
		note 18
		ymVol 0Ch
		note 20
		ymVol 0Dh
		note 22
		ymVol 0Eh
		noteL 24,192
		channel_end
Music_25_Channel_5:
		ymStereo 0C0h
		sampleL 0,24
		sampleL 2,3
		sample 2
		sample 3
		sample 3
		sample 4
		sample 4
		sample 4
		sample 4
		sampleL 2,12
		sample 3
		sampleL 2,24
		sampleL 2,12
		sampleL 2,4
		sample 3
		sample 3
		sampleL 2,12
		sample 3
		sampleL 0,24
		sampleL 2,3
		sample 2
		sample 3
		sample 3
		sample 4
		sample 4
		sample 4
		sample 4
		sampleL 2,12
		sample 3
		sampleL 2,24
		sampleL 2,6
		sample 3
		sample 3
		sample 3
		sampleL 2,18
		sampleL 1,6
		sampleL 0,96
		channel_end
Music_25_Channel_6:
		release 01h
		vibrato 04Ch
		repeatStart
		psgInst 0
		length 24
		psgInst 125
		noteL 47,8
		note 52
		note 57
		note 59
		note 57
		note 54
		note 52
		note 47
		note 45
		note 42
		repeatSection1Start
		noteL 40,8
		note 42
		note 47
		note 42
		note 40
		repeatEnd
		repeatSection2Start
		noteL 37,8
		note 42
		note 46
		note 49
		note 54
		psgInst 124
		repeatStart
		countedLoopStart 1
		noteL 56,8
		note 60
		note 56
		note 63
		note 60
		note 55
		countedLoopEnd
		repeatSection1Start
		psgInst 123
		repeatEnd
		repeatSection2Start
		psgInst 122
		repeatEnd
		repeatSection3Start
		psgInst 121
		noteL 56,8
		note 60
		note 56
		psgInst 120
		note 63
		note 60
		note 55
		psgInst 0
		length 24
		channel_end
Music_25_Channel_7:
		psgInst 0
		length 12
		shifting 010h
		release 01h
		vibrato 04Ch
		repeatStart
		psgInst 0
		length 24
		psgInst 123
		noteL 47,8
		note 52
		note 57
		note 59
		note 57
		note 54
		note 52
		note 47
		note 45
		note 42
		repeatSection1Start
		noteL 40,8
		note 42
		note 47
		note 42
		note 40
		repeatEnd
		repeatSection2Start
		noteL 37,8
		note 42
		note 46
		note 49
		note 54
		psgInst 122
		repeatStart
		countedLoopStart 1
		noteL 56,8
		note 60
		note 56
		note 63
		note 60
		note 55
		countedLoopEnd
		repeatSection1Start
		psgInst 121
		repeatEnd
		repeatSection2Start
		psgInst 120
		repeatEnd
		repeatSection3Start
		psgInst 119
		noteL 56,8
		note 60
		note 56
		psgInst 118
		note 63
		note 60
		note 55
		psgInst 0
		length 12
		channel_end
Music_25_Channel_9:
		channel_end
