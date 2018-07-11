
; ASM FILE music06.asm :
; 0xB7B5..0xBE8F : Music 06
Music_6:        db 0
		db 0
		db 0
		db 0CCh
		dw Music_6_Channel_0
		dw Music_6_Channel_1
		dw Music_6_Channel_2
		dw Music_6_Channel_3
		dw Music_6_Channel_4
		dw Music_6_Channel_5
		dw Music_6_Channel_6
		dw Music_6_Channel_7
		dw Music_6_Channel_9
		dw Music_6_Channel_9
Music_6_Channel_0:
		ymStereo 0C0h
		mainLoopStart
		ymInst 20
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		noteL 32,12
		noteL 31,6
		ymVol 07h
		note 31
		ymInst 3
		countedLoopStart 2
		ymVol 0Ch
		noteL 16,6
		ymVol 08h
		note 16
		ymVol 0Ch
		note 16
		note 16
		countedLoopEnd
		noteL 16,6
		ymVol 08h
		note 16
		ymVol 0Ch
		noteL 9,18
		ymVol 08h
		noteL 9,6
		ymVol 0Ch
		note 9
		note 9
		countedLoopStart 2
		noteL 9,6
		ymVol 08h
		note 9
		ymVol 0Ch
		note 9
		note 9
		countedLoopEnd
		countedLoopStart 2
		noteL 18,6
		ymVol 08h
		note 18
		ymVol 0Ch
		note 18
		note 18
		countedLoopEnd
		noteL 18,6
		ymVol 08h
		note 18
		ymVol 0Ch
		noteL 11,18
		ymVol 08h
		noteL 11,6
		ymVol 0Ch
		note 11
		note 11
		countedLoopStart 2
		noteL 11,6
		ymVol 08h
		note 11
		ymVol 0Ch
		note 11
		note 11
		countedLoopEnd
		countedLoopStart 1
		ymInst 3
		ymVol 0Dh
		ymSustain
		noteL 5,6
		note 6
		note 7
		release 01h
		note 8
		ymInst 59
		ymVol 0Ch
		noteL 9,72
		countedLoopEnd
		ymInst 3
		ymVol 0Dh
		ymSustain
		noteL 9,6
		note 10
		note 11
		release 01h
		note 12
		ymInst 59
		ymVol 0Ch
		noteL 13,72
		ymInst 3
		ymVol 0Dh
		ymSustain
		noteL 11,6
		note 12
		note 13
		release 01h
		note 14
		ymInst 59
		ymVol 0Ch
		noteL 15,72
		repeatStart
		ymInst 3
		ymVol 0Dh
		noteL 20,6
		note 20
		note 20
		ymVol 09h
		note 20
		length 12
		countedLoopStart 1
		ymVol 0Ch
		noteL 17,15
		ymVol 08h
		noteL 17,9
		countedLoopEnd
		countedLoopStart 1
		ymVol 0Ch
		noteL 17,6
		ymVol 08h
		note 17
		countedLoopEnd
		ymVol 0Ch
		noteL 16,6
		ymVol 08h
		note 16
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		ymVol 0Dh
		noteL 23,6
		ymVol 09h
		note 23
		length 84
		ymSustain
		ymVol 0Dh
		noteL 9,96
		noteL 9,1
		ymSlide 0Eh
		release 01h
		noteL 21,47
		ymStopSlide
		ymVol 0Eh
		noteL 21,6
		ymVol 0Bh
		note 21
		ymVol 09h
		note 21
		ymVol 07h
		note 21
		mainLoopEnd
Music_6_Channel_1:
		ymStereo 0C0h
		mainLoopStart
		ymInst 20
		release 01h
		vibrato 02Ch
		ymVol 0Bh
		noteL 45,12
		noteL 46,6
		ymVol 08h
		note 46
		ymVol 06h
		note 46
		ymVol 04h
		note 46
		length 36
		ymVol 0Bh
		noteL 40,12
		noteL 41,6
		ymVol 08h
		note 41
		length 12
		ymVol 0Bh
		noteL 37,84
		noteL 47,12
		noteL 48,6
		ymVol 08h
		note 48
		ymVol 06h
		note 48
		ymVol 04h
		note 48
		length 36
		ymVol 0Bh
		noteL 42,12
		noteL 43,6
		ymVol 08h
		note 43
		length 12
		ymVol 0Bh
		noteL 39,108
		ymInst 1
		ymVol 0Bh
		noteL 49,48
		noteL 48,18
		note 45
		noteL 46,6
		ymVol 09h
		note 46
		length 12
		ymVol 0Bh
		noteL 49,24
		noteL 48,6
		ymVol 09h
		note 48
		ymVol 0Bh
		noteL 45,48
		note 49
		noteL 48,18
		note 47
		noteL 48,6
		ymVol 09h
		note 48
		ymVol 0Bh
		noteL 51,24
		noteL 50,6
		ymVol 09h
		note 50
		ymVol 0Bh
		noteL 54,60
		countedLoopStart 1
		ymInst 3
		ymVol 0Ch
		noteL 55,6
		note 55
		note 55
		ymVol 09h
		note 55
		ymVol 07h
		note 55
		ymVol 05h
		note 55
		ymInst 56
		ymVol 0Bh
		noteL 32,15
		length 9
		noteL 32,15
		length 9
		noteL 32,6
		silence
		note 32
		silence
		note 31
		silence
		countedLoopEnd
		noteL 27,6
		length 12
		ymInst 20
		ymVol 0Ah
		noteL 58,222
		ymVol 0Bh
		noteL 58,6
		ymVol 09h
		note 58
		ymVol 07h
		note 58
		ymVol 05h
		note 58
		mainLoopEnd
Music_6_Channel_2:
		ymStereo 0C0h
		mainLoopStart
		ymInst 20
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		noteL 41,12
		noteL 42,6
		ymVol 07h
		note 42
		ymVol 05h
		note 42
		ymVol 03h
		note 42
		length 36
		ymVol 0Ah
		noteL 32,12
		noteL 33,6
		ymVol 07h
		note 33
		length 12
		ymVol 0Ah
		noteL 32,24
		ymInst 27
		ymVol 0Bh
		noteL 37,6
		silence
		noteL 44,18
		noteL 37,6
		noteL 44,24
		ymInst 20
		ymVol 0Ah
		noteL 43,12
		noteL 44,6
		ymVol 07h
		note 44
		ymVol 05h
		note 44
		ymVol 03h
		note 44
		length 36
		ymVol 0Ah
		noteL 34,12
		noteL 35,6
		ymVol 07h
		note 35
		length 12
		ymVol 0Ah
		noteL 34,24
		ymInst 27
		ymVol 0Bh
		noteL 39,6
		silence
		noteL 46,18
		noteL 39,6
		noteL 46,48
		length 12
		repeatStart
		ymInst 56
		ymVol 0Bh
		noteL 41,6
		countedLoopStart 1
		ymVol 0Bh
		noteL 41,6
		ymVol 08h
		note 41
		countedLoopEnd
		ymVol 0Bh
		noteL 41,12
		noteL 40,6
		ymVol 08h
		note 40
		ymVol 06h
		note 40
		length 24
		ymVol 0Bh
		repeatSection1Start
		noteL 41,6
		note 41
		ymVol 08h
		note 41
		ymVol 0Bh
		noteL 41,18
		ymVol 08h
		noteL 41,6
		ymVol 06h
		note 41
		ymVol 04h
		note 41
		ymVol 0Bh
		note 39
		ymVol 08h
		note 39
		ymVol 0Bh
		note 40
		ymVol 08h
		note 40
		ymVol 0Bh
		noteL 41,18
		ymVol 08h
		noteL 41,6
		ymVol 06h
		note 41
		repeatEnd
		repeatSection2Start
		noteL 43,6
		note 43
		ymVol 08h
		note 43
		ymVol 0Bh
		noteL 43,18
		ymVol 08h
		noteL 43,6
		ymVol 06h
		note 43
		ymVol 04h
		note 43
		ymVol 0Bh
		note 40
		ymVol 08h
		note 40
		ymVol 0Bh
		note 41
		ymVol 08h
		note 41
		ymVol 0Bh
		noteL 42,12
		noteL 43,6
		countedLoopStart 1
		ymInst 3
		ymVol 0Bh
		noteL 51,6
		note 51
		note 51
		ymVol 08h
		note 51
		ymVol 06h
		note 51
		ymVol 04h
		note 51
		ymInst 56
		ymVol 0Ah
		noteL 27,15
		length 9
		noteL 27,15
		length 9
		noteL 27,6
		silence
		note 27
		silence
		note 26
		silence
		countedLoopEnd
		noteL 22,6
		length 30
		ymInst 20
		ymVol 09h
		noteL 37,12
		noteL 39,192
		ymVol 0Ah
		noteL 39,6
		ymVol 08h
		note 39
		ymVol 06h
		note 39
		ymVol 04h
		note 39
		mainLoopEnd
Music_6_Channel_3:
		ymStereo 0C0h
		mainLoopStart
		ymInst 20
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		noteL 35,12
		noteL 35,6
		ymVol 07h
		note 35
		ymVol 05h
		note 35
		ymVol 03h
		note 35
		length 36
		ymVol 0Ah
		noteL 29,12
		noteL 30,6
		ymVol 07h
		note 30
		length 12
		ymVol 0Ah
		noteL 29,84
		noteL 36,12
		noteL 37,6
		ymVol 07h
		note 37
		ymVol 05h
		note 37
		ymVol 03h
		note 37
		length 36
		ymVol 0Ah
		noteL 31,12
		noteL 32,6
		ymVol 07h
		note 32
		length 12
		ymVol 0Ah
		noteL 31,108
		length 12
		repeatStart
		ymInst 56
		ymVol 0Bh
		noteL 33,6
		countedLoopStart 1
		ymVol 0Bh
		noteL 33,6
		ymVol 08h
		note 33
		countedLoopEnd
		ymVol 0Bh
		noteL 33,12
		noteL 32,6
		ymVol 08h
		note 32
		ymVol 06h
		note 32
		length 24
		ymVol 0Bh
		repeatSection1Start
		noteL 33,6
		note 33
		ymVol 08h
		note 33
		ymVol 0Bh
		noteL 33,18
		ymVol 08h
		noteL 33,6
		ymVol 06h
		note 33
		ymVol 04h
		note 33
		ymVol 0Bh
		note 35
		ymVol 08h
		note 35
		ymVol 0Bh
		note 36
		ymVol 08h
		note 36
		ymVol 0Bh
		noteL 37,18
		ymVol 08h
		noteL 37,6
		ymVol 06h
		note 37
		repeatEnd
		repeatSection2Start
		noteL 35,6
		note 35
		ymVol 08h
		note 35
		ymVol 0Bh
		noteL 35,18
		ymVol 08h
		noteL 35,6
		ymVol 06h
		note 35
		ymVol 04h
		note 35
		ymVol 0Bh
		note 32
		ymVol 08h
		note 32
		ymVol 0Bh
		note 33
		ymVol 08h
		note 33
		ymVol 0Bh
		noteL 34,12
		noteL 35,6
		countedLoopStart 1
		ymInst 3
		ymVol 0Bh
		noteL 47,6
		note 47
		note 47
		ymVol 08h
		note 47
		ymVol 06h
		note 47
		ymVol 04h
		note 47
		ymInst 56
		ymVol 0Ah
		noteL 21,15
		length 9
		noteL 21,15
		length 9
		noteL 21,6
		silence
		note 21
		silence
		note 20
		silence
		countedLoopEnd
		noteL 17,6
		length 60
		ymInst 20
		ymVol 09h
		noteL 30,18
		noteL 32,156
		ymVol 0Ah
		noteL 32,6
		ymVol 08h
		note 32
		ymVol 06h
		note 32
		ymVol 04h
		note 32
		mainLoopEnd
Music_6_Channel_4:
		length 6
		shifting 020h
		mainLoopStart
		ymStereo 040h
		ymInst 20
		release 01h
		vibrato 02Ch
		ymVol 0Ah
		noteL 45,12
		noteL 46,6
		ymVol 07h
		note 46
		ymVol 05h
		note 46
		ymVol 03h
		note 46
		length 36
		ymVol 0Ah
		noteL 40,12
		noteL 41,6
		ymVol 07h
		note 41
		length 12
		ymVol 0Ah
		noteL 37,24
		ymStereo 080h
		ymInst 27
		ymVol 0Ah
		noteL 37,6
		silence
		noteL 44,18
		noteL 37,6
		noteL 44,24
		ymStereo 040h
		ymInst 20
		ymVol 0Ah
		noteL 47,12
		noteL 48,6
		ymVol 07h
		note 48
		ymVol 05h
		note 48
		ymVol 03h
		note 48
		length 36
		ymVol 0Ah
		noteL 42,12
		noteL 43,6
		ymVol 07h
		note 43
		length 12
		ymVol 0Ah
		noteL 39,24
		ymStereo 080h
		ymInst 27
		ymVol 0Ah
		noteL 39,6
		silence
		noteL 46,18
		noteL 39,6
		noteL 46,48
		ymStereo 040h
		ymInst 1
		ymVol 0Ah
		note 49
		noteL 48,18
		note 45
		noteL 46,6
		ymVol 08h
		note 46
		length 12
		ymVol 0Ah
		noteL 49,24
		noteL 48,6
		ymVol 08h
		note 48
		ymVol 0Ah
		noteL 45,48
		note 49
		noteL 48,18
		note 47
		noteL 48,6
		ymVol 08h
		note 48
		ymVol 0Ah
		noteL 51,24
		noteL 50,6
		ymVol 08h
		note 50
		ymVol 0Ah
		noteL 54,60
		countedLoopStart 1
		ymStereo 080h
		ymInst 3
		ymVol 0Bh
		noteL 55,6
		note 55
		note 55
		ymVol 08h
		note 55
		ymVol 06h
		note 55
		ymVol 04h
		note 55
		ymStereo 040h
		ymInst 56
		ymVol 0Ah
		noteL 32,15
		length 9
		noteL 32,15
		length 9
		noteL 32,6
		silence
		note 32
		silence
		note 31
		silence
		countedLoopEnd
		noteL 27,6
		length 12
		ymStereo 080h
		ymInst 20
		ymVol 09h
		noteL 58,18
		ymStereo 040h
		noteL 37,12
		noteL 39,18
		ymStereo 080h
		note 30
		noteL 32,12
		ymStereo 040h
		ymSustain
		noteL 9,96
		noteL 9,1
		ymSlide 0Eh
		release 01h
		noteL 21,47
		ymStereo 080h
		ymStopSlide
		ymVol 0Ah
		noteL 58,6
		ymVol 08h
		note 58
		ymVol 06h
		note 58
		ymVol 04h
		note 58
		mainLoopEnd
Music_6_Channel_5:
		ymStereo 0C0h
		release 00h
		mainLoopStart
		repeatStart
		sampleL 5,12
		sample 5
		countedLoopStart 2
		sampleL 5,6
		sample 3
		sample 3
		sample 3
		countedLoopEnd
		sampleL 2,12
		sampleL 5,6
		sample 3
		sample 2
		sample 3
		sample 3
		sample 3
		countedLoopStart 1
		sampleL 5,6
		sample 3
		sample 3
		sample 3
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		sampleL 5,6
		sample 3
		sample 3
		sample 3
		countedLoopStart 1
		repeatStart
		sampleL 0,12
		sampleL 2,3
		sample 3
		sample 3
		sample 4
		sampleL 3,6
		sampleL 2,12
		sampleL 3,6
		repeatSection1Start
		sampleL 1,12
		sampleL 2,3
		sample 3
		sample 3
		sample 4
		sampleL 1,6
		sampleL 2,12
		sampleL 3,6
		repeatEnd
		repeatSection2Start
		sampleL 1,6
		sampleL 2,3
		sample 3
		sample 3
		sample 4
		sampleL 3,6
		sampleL 2,12
		sample 1
		countedLoopEnd
		countedLoopStart 1
		sampleL 5,6
		sample 5
		sampleL 5,24
		sample 1
		sample 1
		sampleL 1,12
		sample 1
		sampleL 4,6
		sample 3
		countedLoopEnd
		sampleL 5,96
		length 95
		sampleL 3,1
		sampleL 2,17
		sampleL 3,1
		sampleL 2,17
		sampleL 3,1
		sampleL 2,11
		sampleL 3,1
		sampleL 5,24
		mainLoopEnd
Music_6_Channel_6:
		release 01h
		vibrato 04Ch
		mainLoopStart
		psgInst 0
		length 24
		countedLoopStart 1
		psgInst 123
		noteL 58,6
		note 59
		note 60
		note 61
		note 62
		note 61
		note 60
		note 59
		countedLoopEnd
		noteL 58,6
		note 59
		note 60
		note 61
		note 62
		note 63
		note 64
		note 65
		psgInst 124
		noteL 64,4
		note 65
		note 64
		note 65
		note 64
		note 65
		note 64
		note 63
		note 62
		note 61
		note 60
		note 59
		psgInst 123
		countedLoopStart 1
		noteL 60,6
		note 61
		note 62
		note 63
		note 64
		note 63
		note 62
		note 61
		countedLoopEnd
		noteL 60,6
		note 61
		note 62
		note 63
		note 64
		note 65
		note 66
		note 67
		psgInst 124
		noteL 66,4
		note 67
		note 66
		note 67
		note 66
		note 67
		note 66
		note 65
		note 64
		note 63
		note 62
		note 61
		countedLoopStart 15
		noteL 40,6
		note 41
		countedLoopEnd
		countedLoopStart 7
		noteL 44,6
		note 45
		countedLoopEnd
		countedLoopStart 7
		noteL 46,6
		note 47
		countedLoopEnd
		countedLoopStart 1
		psgInst 0
		length 36
		psgInst 123
		noteL 56,6
		note 55
		note 54
		note 53
		note 52
		note 51
		note 50
		note 49
		note 48
		note 47
		note 46
		note 45
		note 44
		silence
		countedLoopEnd
		psgInst 0
		length 120
		psgInst 123
		noteL 52,4
		note 53
		note 54
		note 55
		note 56
		note 57
		countedLoopStart 11
		noteL 58,4
		note 59
		countedLoopEnd
		noteL 58,6
		length 18
		mainLoopEnd
Music_6_Channel_7:
		release 01h
		vibrato 04Ch
		mainLoopStart
		psgInst 0
		length 24
		countedLoopStart 1
		psgInst 123
		noteL 56,6
		note 57
		note 58
		note 59
		note 60
		note 59
		note 58
		note 57
		countedLoopEnd
		noteL 56,6
		note 57
		note 58
		note 59
		note 60
		note 61
		note 62
		note 63
		psgInst 124
		noteL 62,4
		note 63
		note 62
		note 63
		note 62
		note 63
		note 62
		note 61
		note 60
		note 59
		note 58
		note 57
		psgInst 123
		countedLoopStart 1
		noteL 58,6
		note 59
		note 60
		note 61
		note 62
		note 61
		note 60
		note 59
		countedLoopEnd
		noteL 58,6
		note 59
		note 60
		note 61
		note 62
		note 63
		note 64
		note 65
		psgInst 124
		noteL 64,4
		note 65
		note 64
		note 65
		note 64
		note 65
		note 64
		note 63
		note 62
		note 61
		note 60
		note 59
		countedLoopStart 15
		noteL 36,6
		note 37
		countedLoopEnd
		countedLoopStart 7
		noteL 40,6
		note 41
		countedLoopEnd
		countedLoopStart 7
		noteL 42,6
		note 43
		countedLoopEnd
		countedLoopStart 1
		psgInst 0
		length 36
		psgInst 123
		noteL 54,6
		note 53
		note 52
		note 51
		note 50
		note 49
		note 48
		note 47
		note 46
		note 45
		note 44
		note 43
		note 42
		silence
		countedLoopEnd
		psgInst 0
		length 120
		psgInst 123
		noteL 50,4
		note 51
		note 52
		note 53
		note 54
		note 55
		countedLoopStart 11
		noteL 56,4
		note 57
		countedLoopEnd
		noteL 56,6
		length 18
		mainLoopEnd
Music_6_Channel_9:
		channel_end
