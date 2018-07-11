
; ASM FILE music12.asm :
; 0xD818..0xDA71 : Music 12
Music_12:       db 0
		db 1
		db 0
		db 0C4h
		dw Music_12_Channel_0
		dw Music_12_Channel_1
		dw Music_12_Channel_2
		dw Music_12_Channel_3
		dw Music_12_Channel_4
		dw Music_12_Channel_5
		dw Music_12_Channel_6
		dw Music_12_Channel_7
		dw Music_12_Channel_9
		dw Music_12_Channel_9
Music_12_Channel_0:
		ymStereo 0C0h
		mainLoopStart
		ymInst 0
		ymVol 0Bh
		release 01h
		vibrato 02Fh
		ymSustain
		noteL 10,144
		vibrato 020h
		note 10
		note 10
		release 01h
		note 10
		ymInst 25
		ymVol 0Ch
		vibrato 02Ch
		noteL 10,48
		noteL 8,96
		noteL 7,48
		noteL 6,96
		noteL 5,144
		note 10
		ymInst 0
		ymVol 0Bh
		noteL 15,24
		note 17
		note 18
		ymVol 0Ah
		note 22
		noteL 27,48
		ymSustain
		noteL 29,24
		ymVol 08h
		noteL 29,12
		ymVol 06h
		release 01h
		note 29
		ymInst 39
		ymVol 0Ah
		noteL 24,48
		note 17
		ymInst 0
		ymVol 0Bh
		noteL 12,24
		note 13
		note 15
		ymVol 0Ah
		note 18
		noteL 24,48
		ymSustain
		noteL 29,24
		ymVol 08h
		noteL 29,12
		ymVol 06h
		release 01h
		note 29
		ymInst 39
		ymVol 0Ah
		noteL 24,48
		note 17
		mainLoopEnd
Music_12_Channel_1:
		ymStereo 0C0h
		release 01h
		mainLoopStart
		vibrato 02Ch
		length 72
		ymInst 38
		ymVol 0Ch
		noteL 29,24
		noteL 30,36
		noteL 32,12
		noteL 32,216
		noteL 29,24
		noteL 30,16
		note 32
		note 34
		noteL 34,24
		noteL 33,120
		ymInst 45
		ymVol 0Ch
		noteL 41,96
		noteL 48,24
		note 46
		note 51
		note 49
		noteL 48,72
		noteL 49,24
		noteL 44,120
		noteL 42,24
		noteL 42,48
		noteL 41,96
		ymInst 7
		ymVol 09h
		note 53
		noteL 51,48
		ymSustain
		noteL 48,96
		vibrato 020h
		ymVol 06h
		noteL 48,16
		ymVol 04h
		note 48
		release 01h
		ymVol 02h
		note 48
		vibrato 02Ch
		ymInst 44
		ymVol 08h
		noteL 66,96
		noteL 65,48
		ymSustain
		noteL 60,96
		vibrato 020h
		ymVol 06h
		noteL 60,16
		ymVol 04h
		note 60
		release 01h
		ymVol 02h
		note 60
		mainLoopEnd
Music_12_Channel_2:
		ymStereo 0C0h
		ymInst 49
		ymVol 09h
		release 01h
		vibrato 02Ch
		mainLoopStart
		noteL 36,16
		note 36
		note 36
		noteL 36,96
		noteL 37,144
		noteL 39,16
		note 39
		note 39
		noteL 39,96
		note 41
		noteL 39,48
		ymInst 26
		ymVol 0Ah
		noteL 37,96
		noteL 41,48
		note 40
		noteL 40,96
		noteL 35,48
		noteL 36,96
		noteL 37,144
		ymInst 49
		ymVol 0Ah
		note 46
		note 45
		note 46
		note 45
		mainLoopEnd
Music_12_Channel_3:
		ymStereo 0C0h
		ymInst 49
		ymVol 09h
		release 01h
		vibrato 02Ch
		mainLoopStart
		noteL 34,16
		note 34
		note 34
		noteL 34,96
		noteL 34,144
		noteL 36,16
		note 36
		note 36
		noteL 36,96
		note 37
		noteL 36,48
		ymInst 26
		ymVol 0Ah
		noteL 34,96
		noteL 37,48
		note 34
		noteL 32,96
		noteL 33,144
		noteL 36,96
		noteL 34,48
		ymInst 49
		ymVol 0Ah
		noteL 42,144
		note 41
		note 39
		note 41
		mainLoopEnd
Music_12_Channel_4:
		length 12
		release 01h
		mainLoopStart
		shifting 020h
		vibrato 02Ch
		length 68
		ymStereo 040h
		ymInst 38
		ymVol 0Bh
		noteL 29,24
		noteL 30,36
		noteL 32,12
		noteL 32,216
		noteL 29,24
		noteL 30,16
		note 32
		note 34
		noteL 34,24
		noteL 33,120
		ymStereo 080h
		ymInst 45
		ymVol 0Bh
		noteL 41,96
		noteL 48,24
		note 46
		note 51
		note 49
		noteL 48,72
		noteL 49,24
		noteL 44,120
		noteL 42,24
		noteL 42,48
		noteL 41,100
		ymInst 7
		ymVol 08h
		noteL 53,96
		noteL 51,48
		ymSustain
		noteL 48,96
		vibrato 020h
		ymVol 05h
		noteL 48,16
		ymVol 03h
		note 48
		release 01h
		ymVol 01h
		note 48
		shifting 010h
		vibrato 02Ch
		ymInst 44
		ymVol 07h
		noteL 66,96
		noteL 65,48
		ymSustain
		noteL 60,96
		vibrato 020h
		ymVol 05h
		noteL 60,16
		ymVol 03h
		note 60
		release 01h
		ymVol 01h
		note 60
		mainLoopEnd
Music_12_Channel_5:
		release 01h
		vibrato 02Ch
		length 6
		mainLoopStart
		ymStereo 0C0h
		shifting 00h
		length 162
		ymInst 17
		ymVol 09h
		noteL 53,24
		noteL 60,48
		noteL 56,216
		noteL 53,24
		noteL 65,48
		note 63
		noteL 61,150
		shifting 020h
		ymStereo 040h
		ymInst 26
		ymVol 09h
		noteL 34,48
		noteL 32,96
		noteL 35,48
		noteL 36,96
		note 36
		noteL 34,48
		ymInst 0
		ymVol 0Ah
		noteL 15,24
		note 17
		note 18
		ymVol 09h
		note 22
		noteL 27,48
		ymSustain
		noteL 29,24
		ymVol 07h
		noteL 29,12
		ymVol 05h
		release 01h
		note 29
		ymInst 39
		ymVol 09h
		noteL 24,48
		note 17
		ymInst 0
		ymVol 0Ah
		noteL 12,24
		note 13
		note 15
		ymVol 09h
		note 18
		noteL 24,48
		ymSustain
		noteL 29,24
		ymVol 07h
		noteL 29,12
		ymVol 05h
		release 01h
		note 29
		ymInst 39
		ymVol 09h
		noteL 24,48
		note 17
		mainLoopEnd
Music_12_Channel_6:
		channel_end
Music_12_Channel_7:
		channel_end
Music_12_Channel_9:
		channel_end
