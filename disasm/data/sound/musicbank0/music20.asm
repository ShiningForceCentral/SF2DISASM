
; ASM FILE music20.asm :
; 0xEF1F..0xF0D8 : Music 20
Music_20:       db 0
		db 1
		db 0
		db 0CDh
		dw Music_20_Channel_0
		dw Music_20_Channel_1
		dw Music_20_Channel_2
		dw Music_20_Channel_3
		dw Music_20_Channel_4
		dw Music_20_Channel_5
		dw Music_20_Channel_6
		dw Music_20_Channel_7
		dw Music_20_Channel_9
		dw Music_20_Channel_9
Music_20_Channel_0:
		ymStereo 0C0h
		ymInst 25
		release 01h
		vibrato 02Ch
		length 49
		ymVol 0Bh
		noteL 26,96
		note 24
		note 23
		note 22
		ymSustain
		noteL 21,240
		ymVol 09h
		noteL 21,6
		ymVol 07h
		note 21
		ymVol 05h
		note 21
		ymVol 03h
		release 01h
		note 21
		length 12
		channel_end
Music_20_Channel_1:
		ymStereo 0C0h
		ymInst 49
		ymVol 0Dh
		release 01h
		vibrato 02Ch
		noteL 45,48
		noteL 52,72
		noteL 53,24
		noteL 50,96
		noteL 57,12
		ymVol 09h
		note 57
		ymVol 06h
		note 57
		silence
		ymVol 0Dh
		noteL 55,96
		noteL 50,12
		ymVol 09h
		note 50
		ymVol 06h
		note 50
		silence
		ymSustain
		ymVol 0Dh
		noteL 49,240
		ymVol 09h
		noteL 49,6
		ymVol 06h
		note 49
		ymVol 04h
		note 49
		ymVol 02h
		release 01h
		note 49
		length 13
		channel_end
Music_20_Channel_2:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 49
		ymInst 39
		ymVol 0Ah
		noteL 26,24
		note 33
		note 41
		note 33
		note 24
		note 33
		note 41
		note 33
		note 23
		note 33
		note 41
		note 33
		note 22
		note 33
		note 41
		note 33
		noteL 21,16
		noteL 28,10
		noteL 33,8
		note 37
		note 40
		noteL 45,16
		ymVol 08h
		noteL 37,8
		note 40
		noteL 45,16
		ymVol 06h
		noteL 37,8
		note 40
		noteL 45,126
		length 36
		channel_end
Music_20_Channel_3:
		ymStereo 080h
		shifting 010h
		release 01h
		vibrato 02Ch
		length 81
		ymInst 39
		ymVol 09h
		countedLoopStart 2
		noteL 33,24
		note 41
		noteL 33,48
		countedLoopEnd
		noteL 33,24
		note 41
		noteL 33,40
		noteL 28,10
		noteL 33,8
		note 37
		note 40
		noteL 45,16
		ymVol 07h
		noteL 37,8
		note 40
		noteL 45,16
		ymVol 05h
		noteL 37,8
		note 40
		noteL 45,126
		length 28
		channel_end
Music_20_Channel_4:
		ymStereo 040h
		shifting 020h
		release 01h
		vibrato 02Ch
		length 89
		ymInst 39
		ymVol 08h
		countedLoopStart 2
		noteL 33,24
		note 41
		noteL 33,48
		countedLoopEnd
		noteL 33,24
		note 41
		noteL 33,40
		noteL 28,10
		noteL 33,8
		note 37
		note 40
		noteL 45,16
		ymVol 06h
		noteL 37,8
		note 40
		noteL 45,16
		ymVol 04h
		noteL 37,8
		note 40
		noteL 45,126
		length 20
		channel_end
Music_20_Channel_5:
		length 12
		ymStereo 040h
		shifting 020h
		ymInst 49
		ymVol 0Ch
		release 01h
		vibrato 02Ch
		noteL 45,48
		noteL 52,72
		noteL 53,24
		noteL 50,96
		noteL 57,12
		ymVol 08h
		note 57
		ymVol 05h
		note 57
		silence
		ymVol 0Ch
		noteL 55,96
		noteL 50,12
		ymVol 08h
		note 50
		ymVol 05h
		note 50
		silence
		ymSustain
		ymVol 0Ch
		noteL 49,240
		ymVol 08h
		noteL 49,6
		ymVol 05h
		note 49
		ymVol 03h
		note 49
		ymVol 01h
		release 01h
		noteL 49,7
		channel_end
Music_20_Channel_6:
		psgInst 0
		release 01h
		vibrato 04Ch
		length 49
		psgInst 121
		noteL 41,96
		note 41
		note 41
		note 41
		noteL 40,240
		length 6
		psgInst 6
		silence
		psgInst 4
		silence
		psgInst 2
		silence
		psgInst 0
		length 12
		channel_end
Music_20_Channel_7:
		psgInst 0
		release 01h
		vibrato 04Ch
		length 49
		psgInst 121
		noteL 33,96
		note 33
		note 33
		note 33
		noteL 31,240
		length 6
		psgInst 6
		silence
		psgInst 4
		silence
		psgInst 2
		silence
		psgInst 0
		length 12
		channel_end
Music_20_Channel_9:
		channel_end
