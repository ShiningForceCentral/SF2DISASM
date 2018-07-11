
; ASM FILE music11.asm :
; 0x87F5..0x89C9 : Music 11
Music_11:       db 0
		db 1
		db 0
		db 0C2h
		dw Music_11_Channel_0
		dw Music_11_Channel_1
		dw Music_11_Channel_2
		dw Music_11_Channel_3
		dw Music_11_Channel_4
		dw Music_11_Channel_5
		dw Music_11_Channel_6
		dw Music_11_Channel_7
		dw Music_11_Channel_9
		dw Music_11_Channel_9
Music_11_Channel_0:
		ymStereo 0C0h
		ymInst 19
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		mainLoopStart
		noteL 23,192
		note 23
		noteL 22,96
		note 28
		note 22
		note 28
		noteL 20,144
		noteL 19,48
		noteL 17,144
		noteL 27,48
		noteL 26,96
		note 19
		note 20
		note 22
		mainLoopEnd
Music_11_Channel_1:
		ymStereo 0C0h
		ymInst 17
		ymVol 0Bh
		release 01h
		vibrato 03Ch
		mainLoopStart
		noteL 44,18
		noteL 43,16
		noteL 41,14
		noteL 40,72
		noteL 38,24
		note 40
		note 41
		noteL 43,18
		noteL 44,16
		noteL 52,14
		noteL 49,96
		noteL 47,48
		noteL 50,72
		noteL 50,8
		note 49
		note 48
		noteL 47,24
		noteL 46,48
		noteL 47,24
		noteL 48,18
		noteL 49,16
		noteL 52,14
		noteL 50,36
		noteL 48,6
		note 47
		noteL 46,24
		ymVol 0Ch
		noteL 53,72
		ymVol 0Bh
		noteL 48,18
		noteL 46,16
		noteL 44,14
		noteL 43,72
		noteL 41,24
		note 43
		note 44
		noteL 35,18
		noteL 36,16
		noteL 43,14
		noteL 41,72
		noteL 39,24
		note 41
		note 43
		note 44
		note 46
		note 48
		note 51
		note 50
		note 48
		note 47
		note 43
		noteL 41,18
		noteL 39,16
		noteL 42,14
		noteL 41,16
		note 39
		noteL 47,64
		noteL 46,48
		mainLoopEnd
Music_11_Channel_2:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 24
		ymInst 19
		ymVol 0Ah
		mainLoopStart
		noteL 26,48
		noteL 32,96
		noteL 26,48
		note 26
		noteL 32,72
		note 32
		noteL 29,96
		note 32
		note 29
		note 32
		noteL 27,48
		noteL 36,144
		noteL 24,48
		noteL 32,144
		noteL 29,96
		note 26
		noteL 24,48
		noteL 30,72
		note 29
		mainLoopEnd
Music_11_Channel_3:
		ymStereo 0C0h
		length 48
		ymInst 19
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		mainLoopStart
		noteL 29,96
		note 29
		noteL 29,72
		noteL 35,48
		noteL 29,72
		noteL 32,96
		note 38
		note 32
		note 38
		noteL 32,192
		note 29
		noteL 32,96
		note 31
		noteL 27,72
		noteL 26,120
		mainLoopEnd
Music_11_Channel_4:
		length 12
		shifting 020h
		ymStereo 080h
		vibrato 02Ch
		release 01h
		ymInst 19
		ymVol 09h
		mainLoopStart
		noteL 23,24
		note 26
		note 29
		noteL 32,72
		noteL 29,24
		note 26
		note 23
		note 26
		note 29
		noteL 32,48
		noteL 35,24
		note 32
		note 29
		countedLoopStart 1
		noteL 22,24
		note 29
		noteL 32,48
		noteL 28,24
		note 32
		noteL 38,48
		countedLoopEnd
		noteL 20,24
		note 27
		note 32
		noteL 36,72
		noteL 19,48
		noteL 17,24
		note 24
		note 29
		noteL 32,72
		noteL 27,48
		noteL 26,24
		note 29
		noteL 32,48
		noteL 19,24
		note 26
		noteL 31,48
		noteL 20,24
		note 24
		note 27
		note 30
		note 22
		note 26
		noteL 29,48
		mainLoopEnd
Music_11_Channel_5:
		shifting 020h
		length 12
		ymStereo 040h
		ymInst 17
		ymVol 09h
		release 01h
		vibrato 03Ch
		mainLoopStart
		noteL 44,18
		noteL 43,16
		noteL 41,14
		noteL 40,72
		noteL 38,24
		note 40
		note 41
		noteL 43,18
		noteL 44,16
		noteL 52,14
		noteL 49,96
		noteL 47,48
		noteL 50,72
		noteL 50,8
		note 49
		note 48
		noteL 47,24
		noteL 46,48
		noteL 47,24
		noteL 48,18
		noteL 49,16
		noteL 52,14
		noteL 50,36
		noteL 48,6
		note 47
		noteL 46,24
		ymVol 09h
		noteL 53,72
		ymVol 08h
		noteL 48,18
		noteL 46,16
		noteL 44,14
		noteL 43,72
		noteL 41,24
		note 43
		note 44
		noteL 35,18
		noteL 36,16
		noteL 43,14
		noteL 41,72
		noteL 39,24
		note 41
		note 43
		note 44
		note 46
		note 48
		note 51
		note 50
		note 48
		note 47
		note 43
		noteL 41,18
		noteL 39,16
		noteL 42,14
		noteL 41,16
		note 39
		noteL 47,64
		noteL 46,48
		mainLoopEnd
Music_11_Channel_6:
		channel_end
Music_11_Channel_7:
		channel_end
Music_11_Channel_9:
		channel_end
