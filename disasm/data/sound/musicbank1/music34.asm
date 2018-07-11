
; ASM FILE music34.asm :
; 0x910B..0x9B7F : Music 34
Music_34:       db 0
		db 0
		db 0
		db 0BDh
		dw Music_2_Channel_0
		dw Music_2_Channel_1
		dw Music_2_Channel_2
		dw Music_2_Channel_3
		dw Music_2_Channel_4
		dw Music_2_Channel_5
		dw Music_2_Channel_6
		dw Music_2_Channel_7
		dw Music_2_Channel_9
		dw Music_2_Channel_9
Music_2_Channel_0:
		ymStereo 0C0h
		ymInst 12
		ymVol 0Ch
		vibrato 02Ch
		countedLoopStart 1
		release 05h
		noteL 22,192
		release 010h
		noteL 22,24
		note 22
		silence
		release 05h
		noteL 22,8
		note 22
		note 22
		note 22
		length 40
		noteL 22,8
		note 22
		note 22
		note 22
		note 22
		note 22
		countedLoopEnd
		mainLoopStart
		ymVol 0Bh
		countedLoopStart 3
		release 010h
		noteL 22,24
		note 22
		silence
		release 05h
		noteL 25,8
		note 25
		note 25
		note 22
		length 40
		noteL 29,8
		note 29
		note 29
		note 30
		note 30
		note 30
		countedLoopEnd
		ymVol 0Ch
		noteL 33,8
		ymVol 0Ah
		note 33
		note 33
		ymVol 0Ch
		note 37
		ymVol 0Ah
		note 37
		note 37
		ymVol 0Ch
		note 31
		ymVol 0Ah
		note 31
		note 31
		ymVol 0Ch
		note 32
		ymVol 0Ah
		note 32
		note 32
		ymVol 0Bh
		release 01h
		noteL 36,0
		ymSlide 0Ah
		noteL 38,48
		ymStopSlide
		noteL 27,6
		length 18
		noteL 32,24
		noteL 28,0
		ymSlide 0Ah
		noteL 30,96
		ymStopSlide
		noteL 31,0
		ymSlide 0Ah
		noteL 33,48
		ymStopSlide
		noteL 29,6
		length 18
		noteL 30,24
		noteL 25,0
		ymSlide 0Ah
		noteL 27,96
		ymStopSlide
		ymVol 0Ch
		countedLoopStart 1
		release 010h
		noteL 22,24
		note 22
		silence
		note 22
		note 22
		silence
		note 22
		note 22
		countedLoopEnd
		ymVol 0Bh
		countedLoopStart 1
		release 010h
		noteL 22,24
		note 22
		silence
		release 05h
		noteL 22,8
		note 22
		note 22
		note 22
		length 40
		noteL 22,8
		note 22
		note 22
		note 22
		note 22
		note 22
		countedLoopEnd
		mainLoopEnd
Music_2_Channel_1:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		repeatStart
		ymInst 13
		ymVol 0Ch
		noteL 58,6
		ymVol 09h
		note 58
		ymVol 07h
		note 58
		silence
		ymInst 20
		ymVol 0Ah
		release 05h
		noteL 33,8
		note 33
		note 33
		note 34
		note 34
		note 34
		repeatSection1Start
		release 01h
		noteL 37,84
		noteL 35,12
		note 34
		note 32
		noteL 33,6
		ymVol 07h
		note 33
		ymVol 0Ah
		noteL 30,180
		repeatEnd
		repeatSection2Start
		noteL 37,8
		ymVol 07h
		note 37
		ymVol 0Ah
		note 37
		release 01h
		noteL 40,60
		noteL 39,12
		note 37
		note 35
		noteL 36,6
		ymVol 07h
		note 36
		ymVol 0Ah
		noteL 33,180
		mainLoopStart
		ymInst 22
		ymVol 0Ch
		noteL 55,36
		noteL 53,12
		note 52
		note 50
		note 52
		note 53
		ymSustain
		noteL 49,6
		note 47
		release 01h
		noteL 49,48
		noteL 50,12
		ymSustain
		noteL 46,3
		note 47
		noteL 46,6
		release 01h
		noteL 44,12
		ymSustain
		noteL 43,6
		note 41
		release 01h
		noteL 43,180
		length 12
		ymInst 44
		ymVol 0Ch
		note 52
		note 53
		note 60
		note 59
		note 55
		note 56
		note 63
		noteL 62,6
		note 61
		noteL 62,63
		noteL 63,8
		noteL 60,7
		noteL 59,6
		ymVol 09h
		noteL 59,8
		ymVol 0Ch
		note 55
		note 56
		noteL 63,9
		noteL 62,8
		noteL 61,19
		noteL 58,12
		noteL 59,11
		noteL 61,5
		noteL 62,4
		note 65
		noteL 69,72
		ymInst 26
		ymVol 0Dh
		noteL 40,6
		note 41
		note 45
		note 48
		release 05h
		noteL 49,8
		note 49
		note 49
		note 48
		note 48
		note 48
		note 44
		note 44
		note 44
		note 40
		note 40
		note 40
		release 01h
		noteL 37,48
		noteL 38,6
		ymVol 0Ah
		note 38
		ymVol 08h
		note 38
		silence
		ymVol 0Dh
		noteL 37,4
		note 38
		note 41
		note 45
		note 49
		note 52
		ymSustain
		noteL 53,84
		ymVol 0Ah
		noteL 53,6
		ymVol 08h
		release 01h
		note 53
		ymVol 0Dh
		noteL 44,48
		noteL 45,6
		ymVol 0Ah
		note 45
		ymVol 08h
		note 45
		silence
		ymVol 0Dh
		noteL 44,4
		note 45
		note 48
		note 52
		note 56
		note 59
		ymSustain
		noteL 60,84
		ymVol 0Ah
		noteL 60,6
		ymVol 08h
		release 01h
		note 60
		countedLoopStart 1
		ymInst 13
		ymVol 0Dh
		release 03h
		noteL 58,8
		ymVol 09h
		note 58
		silence
		ymVol 0Dh
		note 57
		ymVol 09h
		note 57
		length 32
		ymVol 0Dh
		noteL 56,8
		ymVol 09h
		note 56
		silence
		ymVol 0Dh
		note 55
		ymVol 09h
		note 55
		length 32
		ymVol 0Dh
		noteL 54,8
		ymVol 09h
		note 54
		silence
		ymVol 0Dh
		note 53
		ymVol 09h
		note 53
		silence
		countedLoopEnd
		release 01h
		ymInst 20
		ymVol 0Bh
		ymSustain
		noteL 34,192
		release 01h
		vibrato 020h
		note 34
		vibrato 02Ch
		mainLoopEnd
Music_2_Channel_2:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		repeatStart
		ymInst 3
		ymVol 0Ch
		noteL 46,6
		ymVol 09h
		note 46
		ymVol 07h
		note 46
		silence
		ymInst 20
		ymVol 0Ah
		release 05h
		noteL 29,8
		note 29
		note 29
		note 30
		note 30
		note 30
		repeatSection1Start
		release 01h
		noteL 33,84
		noteL 31,12
		note 30
		note 28
		noteL 29,6
		ymVol 07h
		note 29
		ymVol 0Ah
		noteL 26,180
		repeatEnd
		repeatSection2Start
		noteL 33,8
		ymVol 07h
		note 33
		ymVol 0Ah
		note 33
		release 01h
		noteL 36,60
		noteL 35,12
		note 33
		note 31
		noteL 32,6
		ymVol 07h
		note 32
		ymVol 0Ah
		noteL 29,180
		mainLoopStart
		length 240
		ymVol 0Ah
		noteL 40,6
		ymVol 07h
		note 40
		ymVol 0Ah
		noteL 37,132
		length 120
		ymInst 13
		ymVol 0Dh
		noteL 58,6
		ymVol 0Ah
		note 58
		ymVol 08h
		note 58
		length 174
		ymVol 0Dh
		noteL 58,6
		ymVol 0Ah
		note 58
		ymVol 08h
		note 58
		length 30
		ymVol 0Dh
		noteL 58,6
		ymVol 0Ah
		note 58
		ymVol 08h
		note 58
		silence
		ymVol 0Dh
		note 58
		ymVol 0Ah
		note 58
		ymVol 08h
		note 58
		length 78
		ymInst 26
		ymVol 0Ch
		noteL 32,48
		noteL 34,6
		ymVol 09h
		note 34
		ymVol 07h
		note 34
		silence
		ymVol 0Ch
		noteL 29,24
		ymInst 27
		ymVol 0Bh
		noteL 45,16
		note 46
		note 45
		noteL 44,6
		ymVol 08h
		note 44
		ymVol 0Bh
		noteL 40,36
		ymInst 26
		ymVol 0Ch
		noteL 41,48
		noteL 42,6
		ymVol 09h
		note 42
		ymVol 07h
		note 42
		silence
		ymVol 0Ch
		noteL 41,24
		ymInst 20
		ymVol 0Bh
		noteL 41,8
		ymVol 08h
		note 41
		ymVol 0Bh
		note 40
		ymVol 08h
		note 40
		ymVol 0Bh
		note 37
		ymVol 08h
		note 37
		ymVol 0Bh
		noteL 33,48
		countedLoopStart 1
		ymInst 3
		ymVol 0Dh
		release 03h
		length 24
		noteL 58,8
		ymVol 09h
		note 58
		length 32
		ymVol 0Dh
		noteL 58,8
		ymVol 09h
		note 58
		silence
		ymVol 0Dh
		note 58
		ymVol 09h
		note 58
		length 32
		ymVol 0Dh
		noteL 58,8
		ymVol 09h
		note 58
		silence
		ymVol 0Dh
		note 58
		ymVol 09h
		note 58
		silence
		countedLoopEnd
		release 01h
		ymInst 20
		ymVol 0Bh
		noteL 30,144
		noteL 29,48
		noteL 28,192
		mainLoopEnd
Music_2_Channel_3:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		repeatStart
		ymInst 61
		ymVol 0Eh
		noteL 12,30
		ymStereo 080h
		shifting 020h
		ymInst 20
		ymVol 09h
		release 05h
		noteL 29,8
		note 29
		note 29
		note 30
		note 30
		note 30
		repeatSection1Start
		release 01h
		noteL 33,84
		noteL 31,12
		note 30
		noteL 28,6
		shifting 00h
		ymStereo 0C0h
		ymInst 3
		countedLoopStart 1
		ymVol 0Ch
		noteL 34,6
		ymVol 09h
		note 34
		ymVol 07h
		note 34
		silence
		countedLoopEnd
		length 24
		release 05h
		ymVol 0Ch
		noteL 34,8
		note 34
		note 34
		release 01h
		noteL 34,6
		ymVol 09h
		note 34
		ymVol 07h
		note 34
		length 30
		ymVol 0Ch
		release 05h
		noteL 34,8
		note 34
		note 34
		note 34
		note 34
		note 34
		repeatEnd
		repeatSection2Start
		noteL 33,8
		ymVol 07h
		note 33
		ymVol 0Ah
		note 33
		release 01h
		noteL 36,60
		noteL 35,12
		note 33
		noteL 31,6
		shifting 00h
		ymStereo 0C0h
		ymInst 3
		countedLoopStart 1
		ymVol 0Ch
		noteL 34,6
		ymVol 09h
		note 34
		ymVol 07h
		note 34
		silence
		countedLoopEnd
		length 24
		release 05h
		ymVol 0Ch
		noteL 34,8
		note 34
		note 34
		release 01h
		noteL 34,6
		ymVol 09h
		note 34
		ymVol 07h
		note 34
		length 30
		ymVol 0Ch
		release 05h
		noteL 34,8
		note 34
		note 34
		note 34
		note 34
		note 34
		length 6
		mainLoopStart
		length 6
		ymStereo 080h
		shifting 010h
		ymInst 22
		ymVol 0Ah
		noteL 55,36
		noteL 53,12
		note 52
		note 50
		note 52
		note 53
		ymSustain
		noteL 49,6
		note 47
		release 01h
		noteL 49,48
		noteL 50,12
		ymSustain
		noteL 46,3
		note 47
		noteL 46,6
		release 01h
		noteL 44,12
		ymSustain
		noteL 43,6
		note 41
		release 01h
		noteL 43,30
		shifting 020h
		ymInst 20
		ymVol 09h
		noteL 40,6
		ymVol 06h
		note 40
		ymVol 09h
		noteL 37,30
		ymStereo 0C0h
		shifting 00h
		ymInst 13
		ymVol 0Ch
		noteL 48,6
		ymVol 09h
		note 48
		ymVol 0Ch
		ymSustain
		noteL 45,84
		ymVol 09h
		noteL 45,6
		ymVol 07h
		release 01h
		note 45
		length 12
		shifting 010h
		ymStereo 080h
		ymInst 44
		ymVol 0Ah
		note 52
		note 53
		note 60
		note 59
		note 55
		note 56
		note 63
		noteL 62,6
		note 61
		ymStereo 0C0h
		shifting 00h
		ymInst 3
		ymVol 0Dh
		note 46
		ymVol 0Ah
		note 46
		ymVol 08h
		note 46
		length 45
		ymInst 44
		ymStereo 080h
		shifting 010h
		ymVol 0Ah
		noteL 63,8
		noteL 60,7
		noteL 59,6
		ymVol 07h
		noteL 59,8
		ymVol 0Ah
		note 55
		note 56
		noteL 63,9
		noteL 62,8
		noteL 61,19
		noteL 58,12
		noteL 59,11
		noteL 61,5
		noteL 62,4
		note 65
		noteL 69,12
		ymStereo 0C0h
		shifting 00h
		ymInst 3
		ymVol 0Dh
		noteL 46,6
		ymVol 0Ah
		note 46
		ymVol 08h
		note 46
		length 30
		ymVol 0Dh
		noteL 46,6
		ymVol 0Ah
		note 46
		ymVol 08h
		note 46
		silence
		ymVol 0Dh
		note 46
		ymVol 0Ah
		note 46
		ymVol 08h
		note 46
		length 78
		ymInst 26
		ymVol 0Ch
		noteL 29,48
		noteL 30,6
		ymVol 09h
		note 30
		ymVol 07h
		note 30
		silence
		ymVol 0Ch
		noteL 26,24
		ymSlide 020h
		ymSustain
		noteL 37,84
		ymStopSlide
		ymVol 09h
		noteL 37,6
		ymVol 07h
		release 01h
		note 37
		ymVol 0Ch
		noteL 37,48
		noteL 38,6
		ymVol 09h
		note 38
		ymVol 07h
		note 38
		silence
		ymVol 0Ch
		noteL 37,24
		ymSlide 020h
		noteL 45,48
		ymStopSlide
		ymSustain
		noteL 41,36
		ymVol 09h
		noteL 41,6
		ymVol 07h
		release 01h
		note 41
		countedLoopStart 1
		release 03h
		ymInst 3
		ymVol 0Ch
		noteL 46,8
		ymVol 08h
		note 46
		silence
		ymVol 0Ch
		note 46
		ymVol 08h
		note 46
		length 32
		ymVol 0Ch
		noteL 46,8
		ymVol 08h
		note 46
		silence
		ymVol 0Ch
		note 46
		ymVol 08h
		note 46
		length 32
		ymVol 0Ch
		noteL 46,8
		ymVol 08h
		note 46
		silence
		ymVol 0Ch
		note 46
		ymVol 08h
		note 46
		silence
		countedLoopEnd
		ymStereo 080h
		shifting 020h
		ymInst 20
		ymVol 0Ah
		length 6
		noteL 30,144
		noteL 29,48
		noteL 28,192
		mainLoopEnd
Music_2_Channel_4:
		length 6
		shifting 020h
		ymStereo 040h
		release 01h
		vibrato 02Ch
		repeatStart
		ymInst 13
		ymVol 0Bh
		noteL 58,6
		ymVol 08h
		note 58
		ymVol 06h
		note 58
		silence
		ymInst 20
		ymVol 09h
		release 05h
		noteL 33,8
		note 33
		note 33
		note 34
		note 34
		note 34
		repeatSection1Start
		release 01h
		noteL 37,84
		noteL 35,12
		note 34
		note 32
		noteL 33,6
		ymVol 06h
		note 33
		ymVol 09h
		noteL 30,180
		repeatEnd
		repeatSection2Start
		noteL 37,8
		ymVol 06h
		note 37
		ymVol 09h
		note 37
		release 01h
		noteL 40,60
		noteL 39,12
		note 37
		note 35
		noteL 36,6
		ymVol 06h
		note 36
		ymVol 09h
		noteL 33,180
		mainLoopStart
		ymInst 22
		ymVol 0Bh
		noteL 55,36
		noteL 53,12
		note 52
		note 50
		note 52
		note 53
		ymSustain
		noteL 49,6
		note 47
		release 01h
		noteL 49,48
		noteL 50,12
		ymSustain
		noteL 46,3
		note 47
		noteL 46,6
		release 01h
		noteL 44,12
		ymSustain
		noteL 43,6
		note 41
		release 01h
		noteL 43,84
		ymInst 13
		ymVol 0Bh
		noteL 48,6
		ymVol 08h
		note 48
		ymVol 0Bh
		ymSustain
		noteL 45,84
		ymVol 08h
		noteL 45,6
		ymVol 06h
		release 01h
		note 45
		ymStereo 080h
		ymInst 44
		ymVol 0Bh
		noteL 52,12
		note 53
		note 60
		note 59
		note 55
		note 56
		note 63
		noteL 62,6
		note 61
		noteL 62,12
		ymInst 13
		ymVol 0Ch
		noteL 58,6
		ymVol 09h
		note 58
		ymVol 07h
		note 58
		length 33
		ymInst 44
		ymVol 0Bh
		noteL 63,8
		noteL 60,7
		noteL 59,6
		ymVol 08h
		noteL 59,8
		ymVol 0Bh
		note 55
		note 56
		noteL 63,9
		noteL 62,8
		noteL 61,19
		noteL 58,12
		noteL 59,11
		noteL 61,5
		noteL 62,4
		note 65
		noteL 69,72
		ymStereo 040h
		ymInst 26
		ymVol 0Ch
		noteL 40,6
		note 41
		note 45
		note 48
		release 05h
		noteL 49,8
		note 49
		note 49
		note 48
		note 48
		note 48
		note 44
		note 44
		note 44
		note 40
		note 40
		note 40
		release 01h
		noteL 37,48
		noteL 38,6
		ymVol 09h
		note 38
		ymVol 07h
		note 38
		silence
		ymVol 0Ch
		noteL 37,4
		note 38
		note 41
		note 45
		note 49
		note 52
		ymStereo 080h
		ymInst 27
		ymVol 0Ah
		noteL 45,16
		note 46
		note 45
		noteL 44,6
		ymVol 07h
		note 44
		ymVol 0Ah
		noteL 40,36
		ymStereo 040h
		ymInst 26
		ymVol 0Ch
		noteL 44,48
		noteL 45,6
		ymVol 09h
		note 45
		ymVol 07h
		note 45
		silence
		ymVol 0Ch
		noteL 44,4
		note 45
		note 48
		note 52
		note 56
		note 59
		ymStereo 080h
		ymInst 20
		ymVol 0Ah
		noteL 41,8
		ymVol 07h
		note 41
		ymVol 0Ah
		note 40
		ymVol 07h
		note 40
		ymVol 0Ah
		note 37
		ymVol 07h
		note 37
		ymVol 0Ah
		noteL 33,48
		ymStereo 040h
		countedLoopStart 1
		ymInst 13
		ymVol 0Ch
		release 03h
		noteL 58,8
		ymVol 08h
		note 58
		silence
		ymVol 0Ch
		note 57
		ymVol 08h
		note 57
		length 32
		ymVol 0Ch
		noteL 56,8
		ymVol 08h
		note 56
		silence
		ymVol 0Ch
		note 55
		ymVol 08h
		note 55
		length 32
		ymVol 0Ch
		noteL 54,8
		ymVol 08h
		note 54
		silence
		ymVol 0Ch
		note 53
		ymVol 08h
		note 53
		silence
		countedLoopEnd
		release 01h
		ymVol 0Ah
		ymInst 21
		ymSustain
		noteL 34,192
		release 01h
		vibrato 020h
		note 34
		vibrato 02Ch
		mainLoopEnd
Music_2_Channel_5:
		ymStereo 0C0h
		countedLoopStart 1
		sampleL 5,168
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		sampleL 5,24
		sampleL 5,36
		sampleL 4,3
		sample 4
		sample 3
		sample 3
		sampleL 2,8
		sample 2
		sample 2
		sampleL 5,36
		sampleL 4,3
		sample 4
		sample 3
		sample 3
		sampleL 5,8
		sample 3
		sample 3
		sample 5
		sample 3
		sample 3
		countedLoopEnd
		mainLoopStart
		countedLoopStart 1
		sampleL 3,18
		sampleL 4,3
		sample 4
		sampleL 3,36
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sampleL 3,8
		sample 4
		sample 4
		sampleL 3,36
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sampleL 3,8
		sample 4
		sample 4
		sample 3
		sample 4
		sample 4
		countedLoopEnd
		repeatStart
		sampleL 3,18
		sampleL 4,3
		sample 4
		sampleL 3,36
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sampleL 3,8
		sample 4
		sample 4
		sampleL 3,24
		sampleL 0,12
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sampleL 3,8
		sample 4
		sample 4
		repeatSection1Start
		sampleL 3,8
		sample 4
		sample 4
		repeatEnd
		repeatSection2Start
		sampleL 5,24
		sampleL 5,96
		repeatStart
		sampleL 1,12
		sampleL 3,3
		sample 3
		sample 3
		sample 3
		sampleL 2,20
		sampleL 3,2
		sample 3
		sampleL 2,24
		sample 2
		repeatSection1Start
		sampleL 0,96
		repeatEnd
		repeatSection2Start
		sampleL 0,16
		sample 2
		sample 2
		sample 2
		sample 2
		sample 2
		countedLoopStart 1
		sampleL 5,24
		sampleL 5,36
		sampleL 4,3
		sample 4
		sample 3
		sample 3
		sampleL 5,8
		sample 3
		sample 3
		sampleL 5,36
		sampleL 4,3
		sample 4
		sample 3
		sample 3
		sampleL 5,8
		sample 3
		sample 3
		sample 5
		sample 3
		sample 3
		countedLoopEnd
		countedLoopStart 1
		sampleL 5,18
		sampleL 4,3
		sample 4
		sampleL 3,36
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sampleL 3,8
		sample 4
		sample 4
		sampleL 3,36
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sampleL 3,8
		sample 4
		sample 4
		sample 3
		sample 4
		sample 4
		countedLoopEnd
		mainLoopEnd
Music_2_Channel_6:
		release 01h
		vibrato 04Ch
		psgInst 13
		noteL 58,6
		silence
		psgInst 10
		silence
		psgInst 6
		silence
		psgInst 0
		length 168
		psgInst 123
		countedLoopStart 5
		noteL 46,4
		note 47
		note 48
		note 49
		note 48
		note 47
		countedLoopEnd
		psgInst 124
		noteL 46,4
		note 47
		note 48
		note 49
		note 50
		note 51
		note 52
		note 53
		note 54
		note 55
		note 56
		note 57
		psgInst 13
		noteL 58,6
		silence
		psgInst 10
		silence
		psgInst 6
		silence
		psgInst 0
		length 168
		psgInst 123
		countedLoopStart 1
		noteL 46,4
		note 47
		note 48
		note 49
		note 48
		note 47
		countedLoopEnd
		psgInst 124
		noteL 46,4
		note 47
		note 48
		note 49
		note 50
		note 51
		note 52
		note 53
		note 54
		note 55
		note 56
		note 57
		psgInst 125
		noteL 55,8
		length 4
		noteL 51,72
		psgInst 10
		length 6
		psgInst 6
		silence
		mainLoopStart
		countedLoopStart 3
		release 013h
		psgInst 124
		noteL 37,24
		note 37
		psgInst 0
		silence
		psgInst 124
		release 05h
		noteL 41,8
		note 41
		note 41
		noteL 37,10
		length 14
		psgInst 0
		length 24
		psgInst 124
		noteL 37,8
		note 37
		note 37
		note 37
		note 37
		note 37
		countedLoopEnd
		release 013h
		psgInst 125
		noteL 44,24
		note 43
		note 41
		note 37
		psgInst 0
		length 132
		release 01h
		psgInst 125
		noteL 64,4
		note 65
		note 68
		note 69
		note 68
		note 65
		note 64
		note 60
		note 59
		note 56
		noteL 52,5
		silence
		psgInst 10
		silence
		psgInst 6
		silence
		psgInst 0
		length 192
		countedLoopStart 1
		release 05h
		psgInst 125
		noteL 58,8
		note 58
		note 58
		note 58
		psgInst 0
		length 40
		psgInst 125
		noteL 58,8
		note 58
		note 58
		note 58
		psgInst 0
		length 40
		psgInst 125
		noteL 54,8
		note 53
		note 52
		note 53
		note 54
		note 53
		countedLoopEnd
		repeatStart
		release 05h
		psgInst 125
		noteL 58,8
		note 58
		note 58
		note 58
		psgInst 0
		length 38
		psgInst 125
		release 080h
		noteL 56,1
		note 57
		release 05h
		noteL 58,8
		note 58
		note 58
		note 58
		psgInst 0
		length 38
		psgInst 125
		release 080h
		noteL 56,1
		note 57
		repeatSection1Start
		release 05h
		noteL 58,8
		note 58
		note 58
		note 58
		note 58
		release 01h
		noteL 58,6
		release 080h
		noteL 56,1
		note 57
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 58,6
		psgInst 10
		silence
		psgInst 6
		length 10
		psgInst 124
		release 080h
		noteL 56,1
		note 57
		release 01h
		noteL 58,6
		silence
		psgInst 9
		silence
		psgInst 5
		silence
		mainLoopEnd
Music_2_Channel_7:
		release 01h
		vibrato 04Ch
		psgInst 13
		noteL 46,6
		silence
		psgInst 10
		silence
		psgInst 6
		silence
		psgInst 0
		length 176
		shifting 010h
		psgInst 121
		countedLoopStart 5
		noteL 46,4
		note 47
		note 48
		note 49
		note 48
		note 47
		countedLoopEnd
		psgInst 122
		noteL 46,4
		note 47
		note 48
		note 49
		note 50
		note 51
		note 52
		note 53
		note 54
		note 55
		shifting 00h
		psgInst 13
		noteL 46,6
		silence
		psgInst 10
		silence
		psgInst 6
		silence
		psgInst 0
		length 176
		shifting 010h
		psgInst 121
		countedLoopStart 1
		noteL 46,4
		note 47
		note 48
		note 49
		note 48
		note 47
		countedLoopEnd
		psgInst 122
		noteL 46,4
		note 47
		note 48
		note 49
		note 50
		note 51
		note 52
		note 53
		note 54
		note 55
		shifting 00h
		psgInst 125
		noteL 52,8
		length 4
		noteL 47,72
		psgInst 10
		length 6
		psgInst 6
		silence
		mainLoopStart
		shifting 00h
		countedLoopStart 3
		release 013h
		psgInst 124
		noteL 34,24
		note 34
		psgInst 0
		silence
		psgInst 124
		release 05h
		noteL 34,8
		note 34
		note 34
		noteL 34,10
		length 14
		psgInst 0
		length 24
		psgInst 124
		noteL 34,8
		note 34
		note 34
		note 33
		note 33
		note 33
		countedLoopEnd
		release 013h
		psgInst 125
		noteL 41,24
		note 40
		note 37
		note 33
		psgInst 0
		length 140
		shifting 010h
		release 01h
		psgInst 123
		noteL 64,4
		note 65
		note 68
		note 69
		note 68
		note 65
		note 64
		note 60
		note 59
		note 56
		noteL 52,5
		silence
		psgInst 10
		silence
		psgInst 6
		silence
		psgInst 0
		length 184
		countedLoopStart 1
		shifting 00h
		release 05h
		psgInst 125
		noteL 46,8
		note 46
		note 47
		note 46
		psgInst 0
		length 40
		psgInst 125
		noteL 46,8
		note 46
		note 47
		note 46
		psgInst 0
		length 44
		shifting 010h
		psgInst 124
		noteL 54,8
		note 53
		note 52
		note 53
		note 54
		release 01h
		noteL 53,4
		countedLoopEnd
		length 4
		repeatStart
		release 05h
		psgInst 123
		noteL 58,8
		note 58
		note 58
		note 58
		psgInst 0
		length 38
		psgInst 123
		release 080h
		noteL 56,1
		note 57
		release 05h
		noteL 58,8
		note 58
		note 58
		note 58
		psgInst 0
		length 38
		psgInst 123
		release 080h
		noteL 56,1
		note 57
		repeatSection1Start
		release 05h
		noteL 58,8
		note 58
		note 58
		note 58
		note 58
		release 01h
		noteL 58,6
		release 080h
		noteL 56,1
		note 57
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 58,6
		psgInst 8
		silence
		psgInst 4
		length 10
		psgInst 122
		release 080h
		noteL 56,1
		note 57
		release 01h
		noteL 58,6
		silence
		psgInst 7
		length 8
		mainLoopEnd
Music_2_Channel_9:
		channel_end
