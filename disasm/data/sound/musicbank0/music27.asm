
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
		ymStereo 0C0h
		vibrato 02Ch
		length 21
		ymInst 13
		ymVol 0Ch
		release 05h
		noteL 53,8
		note 53
		note 53
		release 05h
		note 53
		ymVol 09h
		note 53
		ymVol 0Ch
		note 53
		release 01h
		noteL 53,60
		ymVol 09h
		noteL 53,6
		ymVol 06h
		note 53
		length 12
		channel_end
Music_27_Channel_1:
		ymStereo 0C0h
		release 05h
		vibrato 02Ch
		length 21
		ymInst 13
		ymVol 0Dh
		noteL 46,8
		note 46
		note 46
		note 48
		ymVol 0Ah
		note 48
		ymVol 0Dh
		note 46
		release 01h
		noteL 48,60
		ymVol 0Ah
		noteL 48,6
		ymVol 07h
		note 48
		length 12
		channel_end
Music_27_Channel_2:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 21
		ymInst 3
		ymVol 0Ch
		noteL 37,4
		length 20
		noteL 39,4
		length 12
		noteL 39,4
		silence
		noteL 38,60
		ymVol 09h
		noteL 38,6
		ymVol 06h
		note 38
		length 12
		channel_end
Music_27_Channel_3:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 21
		ymInst 3
		ymVol 0Dh
		noteL 18,4
		length 20
		noteL 20,4
		length 12
		noteL 20,4
		silence
		noteL 22,60
		ymVol 0Ah
		noteL 22,6
		ymVol 07h
		note 22
		length 12
		channel_end
Music_27_Channel_4:
		ymStereo 040h
		shifting 020h
		release 05h
		vibrato 02Ch
		length 25
		ymInst 13
		ymVol 0Bh
		noteL 46,8
		note 46
		note 46
		note 48
		ymVol 08h
		note 48
		ymVol 0Bh
		note 46
		release 01h
		noteL 48,56
		ymVol 06h
		noteL 48,6
		ymVol 03h
		note 48
		length 12
		channel_end
Music_27_Channel_5:
		ymStereo 0C0h
		length 21
		sampleL 5,12
		sampleL 4,4
		sample 3
		sample 3
		sampleL 2,15
		sampleL 4,1
		sampleL 2,8
		sampleL 5,3
		sample 2
		sample 3
		sample 3
		sample 3
		sample 3
		sample 4
		sample 4
		sample 4
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		sampleL 2,12
		channel_end
Music_27_Channel_6:
		psgInst 125
		release 01h
		vibrato 04Ch
		noteL 41,3
		note 43
		note 45
		note 46
		note 48
		note 50
		note 51
		noteL 53,4
		note 54
		note 53
		note 49
		note 46
		note 42
		note 51
		note 53
		note 51
		note 48
		note 44
		note 39
		note 50
		note 51
		note 50
		note 48
		note 46
		note 41
		note 46
		note 41
		note 46
		note 48
		note 50
		note 53
		psgInst 125
		noteL 58,6
		silence
		psgInst 10
		silence
		psgInst 8
		silence
		psgInst 6
		silence
		psgInst 0
		silence
		channel_end
Music_27_Channel_7:
		psgInst 0
		length 6
		shifting 010h
		psgInst 123
		release 01h
		vibrato 04Ch
		noteL 41,3
		note 43
		note 45
		note 46
		note 48
		note 50
		note 51
		noteL 53,4
		note 54
		note 53
		note 49
		note 46
		note 42
		note 51
		note 53
		note 51
		note 48
		note 44
		note 39
		note 50
		note 51
		note 50
		note 48
		note 46
		note 41
		note 46
		note 41
		note 46
		note 48
		note 50
		note 53
		psgInst 124
		noteL 58,6
		silence
		psgInst 8
		silence
		psgInst 6
		silence
		psgInst 0
		silence
		channel_end
Music_27_Channel_9:
		channel_end
