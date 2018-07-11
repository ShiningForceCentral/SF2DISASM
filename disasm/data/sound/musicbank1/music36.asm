
; ASM FILE music36.asm :
; 0xA011..0xAFFC : Music 36
Music_36:       db 0
		db 0
		db 0
		db 0CDh
		dw Music_4_Channel_0
		dw Music_4_Channel_1
		dw Music_4_Channel_2
		dw Music_4_Channel_3
		dw Music_4_Channel_4
		dw Music_4_Channel_5
		dw Music_4_Channel_6
		dw Music_4_Channel_7
		dw Music_4_Channel_9
		dw Music_4_Channel_9
Music_4_Channel_0:
		ymStereo 0C0h
		ymInst 21
		ymVol 0Ch
		release 01h
		vibrato 02Ch
		noteL 8,0
		ymSlide 017h
		noteL 20,48
		ymStopSlide
		mainLoopStart
		noteL 25,24
		note 24
		note 20
		note 16
		repeatStart
		noteL 13,84
		ymSustain
		noteL 32,4
		note 34
		release 01h
		note 36
		noteL 37,6
		ymVol 09h
		note 37
		ymVol 0Ch
		note 37
		note 37
		noteL 32,12
		noteL 28,6
		note 27
		note 28
		note 25
		note 20
		note 19
		note 20
		note 16
		note 13
		note 12
		noteL 11,84
		ymSustain
		noteL 32,4
		note 33
		release 01h
		note 34
		noteL 35,6
		ymVol 09h
		note 35
		ymVol 0Ch
		note 35
		note 35
		noteL 33,12
		noteL 29,6
		note 27
		note 29
		note 27
		note 23
		note 21
		note 23
		note 21
		note 17
		note 13
		noteL 15,36
		ymSustain
		noteL 22,4
		note 24
		release 01h
		note 26
		noteL 27,24
		noteL 22,6
		note 18
		ymVol 09h
		note 18
		ymVol 06h
		note 18
		ymVol 0Ch
		noteL 9,36
		ymSustain
		noteL 29,4
		note 30
		release 01h
		note 31
		noteL 33,24
		noteL 27,6
		note 23
		ymVol 09h
		note 23
		ymVol 06h
		note 23
		countedLoopStart 1
		ymVol 0Ch
		release 03h
		noteL 14,12
		noteL 26,6
		note 26
		note 26
		ymVol 07h
		note 26
		ymVol 0Ch
		note 26
		note 26
		noteL 7,12
		noteL 19,6
		note 19
		note 19
		ymVol 07h
		note 19
		ymVol 0Ch
		note 19
		note 19
		countedLoopEnd
		release 01h
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 14,12
		length 210
		silence
		ymInst 12
		ymVol 0Dh
		noteL 11,0
		ymSlide 05h
		noteL 13,192
		ymStopSlide
		ymInst 21
		ymVol 0Ch
		ymSustain
		noteL 25,3
		note 24
		note 23
		note 22
		note 21
		note 20
		note 19
		note 18
		release 01h
		note 17
		length 189
		ymInst 12
		ymVol 0Dh
		noteL 9,0
		ymSlide 05h
		noteL 11,168
		ymStopSlide
		ymInst 21
		ymVol 0Ch
		ymSustain
		noteL 23,3
		note 22
		note 21
		note 20
		note 19
		note 18
		note 17
		note 16
		release 01h
		note 15
		length 165
		ymInst 12
		ymVol 0Dh
		noteL 13,0
		ymSlide 05h
		noteL 15,96
		ymStopSlide
		ymInst 21
		ymVol 0Ch
		ymSustain
		noteL 27,3
		note 26
		note 25
		note 24
		note 23
		note 22
		note 21
		note 20
		release 01h
		note 19
		length 69
		ymInst 12
		ymVol 0Dh
		noteL 7,0
		ymSlide 05h
		noteL 9,96
		ymStopSlide
		ymInst 21
		ymVol 0Ch
		ymSustain
		noteL 21,3
		note 20
		note 19
		note 18
		note 17
		note 16
		note 15
		note 14
		release 01h
		note 13
		length 69
		ymInst 12
		ymVol 0Dh
		noteL 12,0
		ymSlide 05h
		noteL 14,96
		ymStopSlide
		noteL 17,0
		ymSlide 05h
		noteL 19,96
		ymStopSlide
		ymInst 21
		ymVol 0Ch
		release 09h
		countedLoopStart 6
		noteL 32,12
		note 31
		note 27
		note 24
		note 23
		note 24
		note 27
		note 30
		countedLoopEnd
		noteL 32,12
		note 31
		note 27
		note 30
		note 32
		note 27
		release 01h
		noteL 20,24
		mainLoopEnd
Music_4_Channel_1:
		ymStereo 0C0h
		ymInst 26
		ymVol 0Ch
		release 01h
		vibrato 02Ch
		noteL 55,6
		note 47
		note 50
		note 55
		note 56
		note 48
		note 54
		note 56
		mainLoopStart
		release 00h
		noteL 61,4
		note 63
		note 61
		note 63
		note 61
		note 63
		release 01h
		noteL 61,24
		noteL 51,6
		note 43
		note 44
		note 52
		note 48
		note 49
		note 56
		ymVol 0Ah
		note 56
		countedLoopStart 1
		ymInst 13
		ymVol 0Ch
		noteL 48,30
		ymVol 0Ah
		noteL 48,6
		ymVol 0Ch
		note 48
		note 48
		noteL 48,18
		note 44
		noteL 52,108
		ymVol 0Ah
		noteL 52,6
		ymVol 08h
		note 52
		length 12
		ymVol 0Ch
		noteL 49,24
		noteL 50,18
		note 55
		noteL 51,96
		ymVol 0Ah
		noteL 51,6
		ymVol 08h
		note 51
		ymVol 0Ch
		noteL 50,30
		ymVol 0Ah
		noteL 50,6
		ymVol 0Ch
		note 50
		note 50
		noteL 50,18
		noteL 46,6
		ymVol 0Ah
		note 46
		ymVol 08h
		note 46
		ymVol 0Ch
		noteL 54,48
		noteL 53,6
		note 52
		noteL 51,12
		noteL 47,6
		ymVol 0Ah
		note 47
		ymVol 08h
		note 47
		silence
		ymVol 0Ch
		noteL 49,204
		countedLoopEnd
		ymInst 26
		ymVol 0Ch
		noteL 68,6
		note 67
		note 66
		note 62
		note 61
		note 58
		note 57
		note 54
		note 51
		note 50
		note 49
		note 45
		note 44
		note 41
		note 40
		note 37
		release 00h
		countedLoopStart 11
		noteL 34,4
		note 35
		countedLoopEnd
		ymSustain
		release 01h
		noteL 34,16
		ymVol 08h
		note 34
		release 01h
		ymVol 06h
		note 34
		length 192
		ymInst 1
		ymVol 0Ch
		note 48
		repeatStart
		ymSustain
		noteL 48,3
		note 47
		note 46
		note 45
		note 44
		note 43
		note 42
		note 41
		noteL 40,6
		repeatSection1Start
		ymVol 0Ah
		noteL 40,6
		ymVol 07h
		release 01h
		note 40
		ymVol 0Ah
		repeatEnd
		repeatSection2Start
		ymVol 07h
		noteL 40,6
		release 01h
		ymVol 05h
		note 40
		ymVol 08h
		repeatEnd
		repeatSection3Start
		ymVol 06h
		noteL 40,6
		release 01h
		ymVol 04h
		note 40
		ymVol 07h
		repeatStart
		ymSustain
		noteL 48,3
		note 47
		note 46
		note 45
		note 44
		note 43
		note 42
		note 41
		noteL 40,6
		repeatSection1Start
		ymVol 05h
		noteL 40,6
		ymVol 03h
		release 01h
		note 40
		ymVol 06h
		repeatEnd
		repeatSection2Start
		ymVol 04h
		noteL 40,6
		release 01h
		ymVol 02h
		note 40
		silence
		ymVol 0Ch
		noteL 51,168
		repeatStart
		ymSustain
		noteL 51,3
		note 50
		note 49
		note 48
		note 47
		note 46
		note 45
		note 44
		noteL 43,6
		repeatSection1Start
		ymVol 0Ah
		noteL 43,6
		ymVol 07h
		release 01h
		note 43
		ymVol 0Ah
		repeatEnd
		repeatSection2Start
		ymVol 07h
		noteL 43,6
		ymVol 05h
		release 01h
		note 43
		ymVol 08h
		repeatEnd
		repeatSection3Start
		ymVol 06h
		noteL 43,6
		ymVol 04h
		release 01h
		note 43
		ymVol 07h
		repeatStart
		ymSustain
		noteL 51,3
		note 50
		note 49
		note 48
		note 47
		note 46
		note 45
		repeatSection1Start
		noteL 44,3
		ymVol 05h
		noteL 43,6
		ymVol 03h
		note 43
		release 01h
		note 43
		ymVol 06h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 44,3
		ymVol 0Ch
		noteL 50,96
		repeatStart
		ymSustain
		noteL 50,3
		note 49
		note 48
		note 47
		note 46
		note 45
		note 44
		note 43
		noteL 42,6
		repeatSection1Start
		ymVol 0Ah
		noteL 42,6
		ymVol 07h
		release 01h
		note 42
		ymVol 0Ah
		repeatEnd
		repeatSection2Start
		ymVol 07h
		noteL 42,6
		release 01h
		ymVol 05h
		note 42
		ymVol 08h
		ymSustain
		noteL 50,3
		note 49
		note 48
		release 01h
		note 47
		ymVol 0Ch
		noteL 54,96
		repeatStart
		ymSustain
		noteL 54,3
		note 53
		note 52
		note 51
		note 50
		note 49
		note 48
		note 47
		noteL 46,6
		repeatSection1Start
		ymVol 0Ah
		noteL 46,6
		ymVol 07h
		release 01h
		note 46
		ymVol 0Ah
		repeatEnd
		repeatSection2Start
		ymVol 07h
		noteL 46,6
		ymVol 05h
		release 01h
		note 46
		ymVol 08h
		ymSustain
		noteL 54,3
		note 53
		note 52
		release 01h
		note 51
		ymVol 0Ch
		noteL 49,56
		ymVol 09h
		noteL 49,8
		ymVol 0Ch
		note 49
		ymVol 09h
		note 49
		ymVol 0Ch
		note 49
		ymVol 09h
		note 49
		ymVol 0Ch
		noteL 49,96
		repeatStart
		ymSustain
		noteL 49,3
		note 48
		note 47
		note 46
		note 45
		note 44
		note 43
		note 42
		noteL 41,6
		repeatSection1Start
		ymVol 0Ah
		noteL 41,6
		ymVol 07h
		release 01h
		note 41
		ymVol 0Ah
		repeatEnd
		repeatSection2Start
		ymVol 07h
		noteL 41,6
		release 01h
		ymVol 05h
		note 41
		ymVol 08h
		repeatEnd
		repeatSection3Start
		ymVol 06h
		noteL 41,6
		release 01h
		ymVol 04h
		note 41
		ymVol 07h
		repeatStart
		ymSustain
		noteL 49,3
		note 48
		note 47
		note 46
		note 45
		note 44
		note 43
		repeatSection1Start
		noteL 42,3
		noteL 41,6
		ymVol 05h
		note 41
		ymVol 03h
		release 01h
		note 41
		ymVol 06h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 42,3
		ymInst 44
		ymVol 0Ch
		noteL 54,4
		note 57
		noteL 56,76
		noteL 62,16
		noteL 58,4
		note 56
		note 53
		note 47
		note 50
		note 54
		note 55
		noteL 52,88
		noteL 55,6
		noteL 56,66
		repeatStart
		ymInst 26
		ymVol 0Ch
		noteL 43,6
		note 35
		note 38
		note 43
		note 44
		note 36
		note 42
		note 44
		ymVol 0Ah
		note 44
		release 03h
		ymInst 13
		ymVol 0Bh
		repeatSection1Start
		noteL 51,12
		noteL 51,6
		noteL 51,12
		noteL 51,6
		note 51
		release 01h
		repeatEnd
		repeatSection2Start
		noteL 54,12
		noteL 54,6
		noteL 54,12
		noteL 54,6
		note 54
		release 01h
		ymInst 26
		ymVol 0Ch
		note 55
		note 47
		note 50
		note 55
		note 56
		note 48
		note 54
		note 56
		note 59
		note 50
		note 55
		note 59
		note 60
		note 54
		note 56
		note 60
		mainLoopEnd
Music_4_Channel_2:
		ymStereo 0C0h
		ymInst 26
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 43,24
		note 44
		mainLoopStart
		ymInst 27
		ymVol 09h
		release 07h
		noteL 40,16
		note 40
		note 40
		release 01h
		noteL 40,48
		countedLoopStart 1
		ymInst 20
		ymVol 0Ah
		noteL 37,102
		ymVol 07h
		noteL 37,6
		ymVol 05h
		note 37
		ymVol 0Ah
		noteL 37,18
		noteL 32,12
		noteL 40,18
		noteL 34,30
		noteL 35,108
		ymVol 07h
		noteL 35,6
		ymVol 0Ah
		noteL 35,18
		noteL 29,12
		noteL 30,18
		note 33
		noteL 34,12
		noteL 39,96
		noteL 35,48
		note 31
		ymVol 07h
		noteL 31,6
		ymVol 05h
		note 31
		length 12
		ymInst 27
		ymVol 0Ah
		noteL 32,24
		noteL 41,48
		release 06h
		noteL 42,16
		note 42
		note 42
		release 01h
		noteL 41,48
		countedLoopEnd
		ymInst 26
		ymVol 0Bh
		noteL 61,12
		ymVol 09h
		noteL 61,6
		ymVol 07h
		note 61
		length 204
		silence
		ymInst 1
		ymVol 0Ah
		ymSustain
		countedLoopStart 31
		noteL 44,3
		ymSlide 020h
		note 45
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 44,3
		note 43
		note 42
		note 41
		note 40
		note 39
		note 38
		note 37
		noteL 36,6
		repeatSection1Start
		ymVol 08h
		noteL 36,6
		ymVol 05h
		release 01h
		note 36
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 36,6
		release 01h
		ymVol 03h
		note 36
		ymVol 06h
		repeatEnd
		repeatSection3Start
		ymVol 04h
		noteL 36,6
		release 01h
		ymVol 02h
		note 36
		ymVol 05h
		repeatStart
		ymSustain
		noteL 44,3
		note 43
		note 42
		note 41
		note 40
		note 39
		note 38
		note 37
		noteL 36,6
		repeatSection1Start
		ymVol 03h
		noteL 36,6
		ymVol 01h
		release 01h
		note 36
		ymVol 04h
		repeatEnd
		repeatSection2Start
		ymVol 02h
		noteL 36,6
		release 01h
		ymVol 00h
		note 36
		silence
		ymVol 0Ah
		ymSustain
		countedLoopStart 27
		noteL 45,3
		ymSlide 020h
		note 46
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 45,3
		note 44
		note 43
		note 42
		note 41
		note 40
		note 39
		note 38
		noteL 37,6
		repeatSection1Start
		ymVol 08h
		noteL 37,6
		ymVol 05h
		release 01h
		note 37
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 37,6
		ymVol 03h
		release 01h
		note 37
		ymVol 06h
		repeatEnd
		repeatSection3Start
		ymVol 04h
		noteL 37,6
		ymVol 02h
		release 01h
		note 37
		ymVol 05h
		repeatStart
		ymSustain
		noteL 45,3
		note 44
		note 43
		note 42
		note 41
		note 40
		note 39
		repeatSection1Start
		noteL 38,3
		ymVol 03h
		noteL 37,6
		ymVol 01h
		note 37
		release 01h
		note 37
		ymVol 04h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 38,3
		ymVol 0Ah
		ymSustain
		countedLoopStart 15
		noteL 46,3
		ymSlide 020h
		note 47
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 46,3
		note 45
		note 44
		note 43
		note 42
		note 41
		note 40
		note 39
		noteL 38,6
		repeatSection1Start
		ymVol 08h
		noteL 38,6
		ymVol 05h
		release 01h
		note 38
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 38,6
		release 01h
		ymVol 03h
		note 38
		ymVol 06h
		ymSustain
		noteL 46,3
		note 45
		note 44
		release 01h
		note 43
		ymVol 0Ah
		ymSustain
		countedLoopStart 15
		noteL 47,3
		ymSlide 020h
		note 49
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 47,3
		note 46
		note 45
		note 44
		note 43
		note 42
		note 41
		note 40
		noteL 39,6
		repeatSection1Start
		ymVol 08h
		noteL 39,6
		ymVol 05h
		release 01h
		note 39
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 39,6
		ymVol 03h
		release 01h
		note 39
		ymVol 06h
		ymSustain
		noteL 47,3
		note 46
		note 45
		release 01h
		note 44
		ymVol 0Ah
		ymSustain
		countedLoopStart 15
		noteL 42,3
		ymSlide 020h
		note 44
		countedLoopEnd
		countedLoopStart 15
		noteL 45,3
		note 43
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 45,3
		note 44
		note 43
		note 42
		note 41
		note 40
		note 39
		note 38
		noteL 37,6
		repeatSection1Start
		ymVol 08h
		noteL 37,6
		ymVol 05h
		release 01h
		note 37
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 37,6
		release 01h
		ymVol 03h
		note 37
		ymVol 06h
		repeatEnd
		repeatSection3Start
		ymVol 04h
		noteL 37,6
		release 01h
		ymVol 02h
		note 37
		ymVol 05h
		repeatStart
		ymSustain
		noteL 45,3
		note 44
		note 43
		note 42
		note 41
		note 40
		note 39
		repeatSection1Start
		noteL 38,3
		noteL 37,6
		ymVol 03h
		note 37
		ymVol 01h
		release 01h
		note 37
		ymVol 04h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 38,3
		length 48
		ymInst 7
		ymVol 0Ah
		noteL 50,6
		noteL 51,106
		noteL 50,16
		note 45
		noteL 41,96
		ymInst 44
		ymVol 0Ch
		noteL 50,4
		note 51
		noteL 49,20
		noteL 56,4
		note 59
		noteL 55,18
		release 03h
		ymInst 13
		ymVol 0Ah
		noteL 49,12
		noteL 49,6
		noteL 49,12
		noteL 49,6
		note 49
		release 01h
		ymInst 9
		ymVol 0Bh
		noteL 37,4
		note 41
		note 46
		note 53
		note 50
		ymVol 09h
		note 50
		ymVol 0Bh
		noteL 57,18
		noteL 52,4
		note 51
		note 46
		release 03h
		ymInst 13
		ymVol 0Ah
		noteL 51,12
		noteL 51,6
		noteL 51,12
		noteL 51,6
		note 51
		release 01h
		ymInst 7
		ymVol 0Ah
		note 44
		note 40
		note 38
		note 42
		noteL 49,4
		noteL 48,20
		ymInst 26
		ymVol 0Bh
		noteL 50,24
		note 51
		mainLoopEnd
Music_4_Channel_3:
		ymStereo 0C0h
		ymInst 26
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 35,24
		note 36
		mainLoopStart
		ymInst 27
		ymVol 09h
		release 07h
		noteL 32,16
		note 32
		note 32
		release 01h
		noteL 32,48
		countedLoopStart 1
		length 6
		ymStereo 080h
		shifting 020h
		ymInst 20
		ymVol 09h
		noteL 37,108
		ymVol 06h
		noteL 37,6
		ymVol 04h
		note 37
		ymVol 09h
		noteL 37,18
		noteL 32,12
		noteL 40,18
		noteL 34,30
		noteL 35,108
		ymVol 06h
		noteL 35,6
		ymVol 09h
		noteL 35,18
		noteL 29,12
		noteL 30,18
		note 33
		noteL 34,12
		noteL 39,96
		noteL 35,48
		note 31
		ymVol 06h
		noteL 31,6
		ymVol 04h
		note 31
		ymStereo 0C0h
		shifting 00h
		ymInst 27
		ymVol 0Ah
		noteL 30,24
		noteL 33,48
		release 06h
		noteL 32,16
		note 32
		note 32
		release 01h
		noteL 33,48
		countedLoopEnd
		ymInst 26
		ymVol 0Bh
		noteL 52,12
		shifting 020h
		ymStereo 040h
		ymInst 26
		ymVol 0Ah
		noteL 68,6
		note 67
		note 66
		note 62
		note 61
		note 58
		note 57
		note 54
		note 51
		note 50
		note 49
		note 45
		note 44
		note 41
		note 40
		note 37
		release 00h
		countedLoopStart 11
		noteL 34,4
		note 35
		countedLoopEnd
		ymSustain
		release 01h
		noteL 34,16
		ymVol 06h
		note 34
		release 01h
		ymVol 04h
		note 34
		length 180
		ymStereo 0C0h
		shifting 00h
		ymInst 1
		ymVol 0Ah
		ymSustain
		countedLoopStart 31
		noteL 40,3
		ymSlide 020h
		note 39
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 40,3
		note 39
		note 38
		note 37
		note 36
		note 35
		note 34
		note 33
		noteL 32,6
		repeatSection1Start
		ymVol 08h
		noteL 32,6
		ymVol 05h
		release 01h
		note 32
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 32,6
		release 01h
		ymVol 03h
		note 32
		ymVol 06h
		repeatEnd
		repeatSection3Start
		ymVol 04h
		noteL 32,6
		release 01h
		ymVol 02h
		note 32
		ymVol 05h
		repeatStart
		ymSustain
		noteL 40,3
		note 39
		note 38
		note 37
		note 36
		note 35
		note 34
		note 33
		noteL 32,6
		repeatSection1Start
		ymVol 03h
		noteL 32,6
		ymVol 01h
		release 01h
		note 32
		ymVol 04h
		repeatEnd
		repeatSection2Start
		ymVol 02h
		noteL 32,6
		release 01h
		ymVol 00h
		note 32
		silence
		ymVol 0Ah
		ymSustain
		countedLoopStart 27
		noteL 41,3
		ymSlide 020h
		note 42
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 41,3
		note 40
		note 39
		note 38
		note 37
		note 36
		note 35
		note 34
		noteL 33,6
		repeatSection1Start
		ymVol 08h
		noteL 33,6
		ymVol 05h
		release 01h
		note 33
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 33,6
		ymVol 03h
		release 01h
		note 33
		ymVol 06h
		repeatEnd
		repeatSection3Start
		ymVol 04h
		noteL 33,6
		ymVol 02h
		release 01h
		note 33
		ymVol 05h
		repeatStart
		ymSustain
		noteL 41,3
		note 40
		note 39
		note 38
		note 37
		note 36
		note 35
		repeatSection1Start
		noteL 34,3
		ymVol 03h
		noteL 33,6
		ymVol 01h
		note 33
		release 01h
		note 33
		ymVol 04h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 34,3
		ymVol 0Ah
		ymSustain
		countedLoopStart 15
		noteL 43,3
		ymSlide 020h
		note 42
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 43,3
		note 42
		note 41
		note 40
		note 39
		note 38
		note 37
		note 36
		noteL 35,6
		repeatSection1Start
		ymVol 08h
		noteL 35,6
		ymVol 05h
		release 01h
		note 35
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 35,6
		release 01h
		ymVol 03h
		note 35
		ymVol 06h
		ymSustain
		noteL 43,3
		note 42
		note 41
		release 01h
		note 40
		ymVol 0Ah
		ymSustain
		countedLoopStart 15
		noteL 43,3
		ymSlide 020h
		note 45
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 43,3
		note 42
		note 41
		note 40
		note 39
		note 38
		note 37
		note 36
		noteL 35,6
		repeatSection1Start
		ymVol 08h
		noteL 35,6
		ymVol 05h
		release 01h
		note 35
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 35,6
		ymVol 03h
		release 01h
		note 35
		ymVol 06h
		ymSustain
		noteL 43,3
		note 42
		note 41
		release 01h
		note 40
		ymVol 0Ah
		ymSustain
		countedLoopStart 15
		noteL 38,3
		ymSlide 020h
		note 37
		countedLoopEnd
		countedLoopStart 15
		noteL 39,3
		note 41
		countedLoopEnd
		ymStopSlide
		repeatStart
		ymSustain
		noteL 39,3
		note 38
		note 37
		note 36
		note 35
		note 34
		note 33
		note 32
		noteL 31,6
		repeatSection1Start
		ymVol 08h
		noteL 31,6
		ymVol 05h
		release 01h
		note 31
		ymVol 08h
		repeatEnd
		repeatSection2Start
		ymVol 05h
		noteL 31,6
		release 01h
		ymVol 03h
		note 31
		ymVol 06h
		repeatEnd
		repeatSection3Start
		ymVol 04h
		noteL 31,6
		release 01h
		ymVol 02h
		note 31
		ymVol 05h
		repeatStart
		ymSustain
		noteL 39,3
		note 38
		note 37
		note 36
		note 35
		note 34
		note 33
		repeatSection1Start
		noteL 32,3
		noteL 31,6
		ymVol 03h
		note 31
		ymVol 01h
		release 01h
		note 31
		ymVol 04h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 32,3
		length 54
		ymStereo 080h
		shifting 020h
		ymInst 7
		ymVol 09h
		noteL 50,6
		noteL 51,84
		ymStereo 0C0h
		shifting 00h
		ymInst 9
		ymVol 0Bh
		noteL 33,4
		note 37
		note 43
		note 46
		note 51
		note 54
		noteL 60,16
		noteL 55,4
		note 52
		note 49
		note 45
		note 41
		note 39
		ymVol 09h
		note 39
		ymVol 07h
		note 39
		ymVol 0Bh
		noteL 46,16
		noteL 48,4
		note 46
		note 48
		note 46
		note 48
		note 51
		note 50
		note 45
		noteL 46,6
		note 48
		noteL 47,12
		ymVol 09h
		noteL 47,6
		ymStereo 080h
		shifting 020h
		ymInst 44
		ymVol 0Bh
		noteL 50,4
		note 51
		noteL 49,20
		noteL 56,4
		note 59
		noteL 55,12
		release 03h
		shifting 00h
		ymStereo 0C0h
		ymInst 13
		ymVol 0Ah
		note 40
		noteL 40,6
		noteL 40,12
		noteL 40,6
		note 40
		silence
		release 01h
		ymStereo 080h
		shifting 020h
		ymInst 9
		ymVol 0Ah
		noteL 37,4
		note 41
		note 46
		note 53
		note 50
		ymVol 08h
		note 50
		ymVol 0Ah
		noteL 57,18
		noteL 52,6
		release 03h
		shifting 00h
		ymStereo 0C0h
		ymInst 13
		ymVol 0Ah
		noteL 43,12
		noteL 43,6
		noteL 43,12
		noteL 43,6
		note 43
		release 01h
		ymInst 26
		ymVol 0Bh
		noteL 43,24
		note 44
		note 47
		note 48
		mainLoopEnd
Music_4_Channel_4:
		length 6
		shifting 020h
		ymStereo 080h
		ymInst 26
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		note 55
		note 47
		note 50
		note 55
		note 56
		note 48
		note 54
		note 56
		mainLoopStart
		release 00h
		noteL 61,4
		note 63
		note 61
		note 63
		note 61
		note 63
		release 01h
		noteL 61,24
		noteL 51,6
		note 43
		note 44
		note 52
		note 48
		note 49
		note 56
		ymVol 09h
		note 56
		countedLoopStart 1
		ymStereo 040h
		ymInst 13
		ymVol 0Bh
		noteL 48,30
		ymVol 09h
		noteL 48,6
		ymVol 0Bh
		note 48
		note 48
		noteL 48,18
		note 44
		noteL 52,108
		ymVol 09h
		noteL 52,6
		ymVol 07h
		note 52
		length 12
		ymVol 0Bh
		noteL 49,24
		noteL 50,18
		note 55
		noteL 51,96
		ymVol 09h
		noteL 51,6
		ymVol 07h
		note 51
		ymVol 0Bh
		noteL 50,30
		ymVol 09h
		noteL 50,6
		ymVol 0Bh
		note 50
		note 50
		noteL 50,18
		noteL 46,6
		ymVol 09h
		note 46
		ymVol 07h
		note 46
		ymVol 0Bh
		noteL 54,48
		noteL 53,6
		note 52
		noteL 51,12
		noteL 47,6
		ymVol 09h
		note 47
		ymVol 07h
		note 47
		silence
		ymVol 0Bh
		noteL 49,36
		ymStereo 080h
		ymInst 27
		ymVol 09h
		noteL 32,24
		noteL 41,48
		release 06h
		noteL 42,16
		note 42
		note 42
		release 01h
		noteL 41,48
		countedLoopEnd
		shifting 010h
		ymInst 26
		ymVol 0Bh
		noteL 68,6
		note 67
		note 66
		note 62
		note 61
		note 58
		note 57
		note 54
		note 51
		note 50
		note 49
		note 45
		note 44
		note 41
		note 40
		note 37
		release 00h
		countedLoopStart 11
		noteL 34,4
		note 35
		countedLoopEnd
		ymSustain
		release 01h
		noteL 34,16
		ymVol 07h
		note 34
		release 01h
		ymVol 05h
		note 34
		length 204
		ymStereo 040h
		shifting 020h
		ymInst 1
		ymVol 0Bh
		noteL 48,192
		repeatStart
		ymSustain
		noteL 48,3
		note 47
		note 46
		note 45
		note 44
		note 43
		note 42
		note 41
		noteL 40,6
		repeatSection1Start
		ymVol 09h
		noteL 40,6
		ymVol 06h
		release 01h
		note 40
		ymVol 09h
		repeatEnd
		repeatSection2Start
		ymVol 06h
		noteL 40,6
		release 01h
		ymVol 04h
		note 40
		ymVol 07h
		repeatEnd
		repeatSection3Start
		ymVol 05h
		noteL 40,6
		release 01h
		ymVol 03h
		note 40
		ymVol 06h
		repeatStart
		ymSustain
		noteL 48,3
		note 47
		note 46
		note 45
		note 44
		note 43
		note 42
		note 41
		noteL 40,6
		repeatSection1Start
		ymVol 04h
		noteL 40,6
		ymVol 02h
		release 01h
		note 40
		ymVol 05h
		repeatEnd
		repeatSection2Start
		ymVol 03h
		noteL 40,6
		release 01h
		ymVol 01h
		note 40
		silence
		ymVol 0Bh
		noteL 51,168
		repeatStart
		ymSustain
		noteL 51,3
		note 50
		note 49
		note 48
		note 47
		note 46
		note 45
		note 44
		noteL 43,6
		repeatSection1Start
		ymVol 09h
		noteL 43,6
		ymVol 06h
		release 01h
		note 43
		ymVol 09h
		repeatEnd
		repeatSection2Start
		ymVol 06h
		noteL 43,6
		ymVol 04h
		release 01h
		note 43
		ymVol 07h
		repeatEnd
		repeatSection3Start
		ymVol 05h
		noteL 43,6
		ymVol 03h
		release 01h
		note 43
		ymVol 06h
		repeatStart
		ymSustain
		noteL 51,3
		note 50
		note 49
		note 48
		note 47
		note 46
		note 45
		repeatSection1Start
		noteL 44,3
		ymVol 04h
		noteL 43,6
		ymVol 02h
		note 43
		release 01h
		note 43
		ymVol 05h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 44,3
		ymVol 0Bh
		noteL 50,96
		repeatStart
		ymSustain
		noteL 50,3
		note 49
		note 48
		note 47
		note 46
		note 45
		note 44
		note 43
		noteL 42,6
		repeatSection1Start
		ymVol 09h
		noteL 42,6
		ymVol 06h
		release 01h
		note 42
		ymVol 09h
		repeatEnd
		repeatSection2Start
		ymVol 06h
		noteL 42,6
		release 01h
		ymVol 04h
		note 42
		ymVol 07h
		ymSustain
		noteL 50,3
		note 49
		note 48
		release 01h
		note 47
		ymVol 0Bh
		noteL 54,96
		repeatStart
		ymSustain
		noteL 54,3
		note 53
		note 52
		note 51
		note 50
		note 49
		note 48
		note 47
		noteL 46,6
		repeatSection1Start
		ymVol 09h
		noteL 46,6
		ymVol 06h
		release 01h
		note 46
		ymVol 09h
		repeatEnd
		repeatSection2Start
		ymVol 06h
		noteL 46,6
		ymVol 04h
		release 01h
		note 46
		ymVol 07h
		ymSustain
		noteL 54,3
		note 53
		note 52
		release 01h
		note 51
		ymVol 0Bh
		noteL 49,56
		ymVol 08h
		noteL 49,8
		ymVol 0Bh
		note 49
		ymVol 08h
		note 49
		ymVol 0Bh
		note 49
		ymVol 08h
		note 49
		ymVol 0Bh
		noteL 49,96
		repeatStart
		ymSustain
		noteL 49,3
		note 48
		note 47
		note 46
		note 45
		note 44
		note 43
		note 42
		noteL 41,6
		repeatSection1Start
		ymVol 09h
		noteL 41,6
		ymVol 06h
		release 01h
		note 41
		ymVol 09h
		repeatEnd
		repeatSection2Start
		ymVol 06h
		noteL 41,6
		release 01h
		ymVol 04h
		note 41
		ymVol 07h
		repeatEnd
		repeatSection3Start
		ymVol 05h
		noteL 41,6
		release 01h
		ymVol 03h
		note 41
		ymVol 06h
		repeatStart
		ymSustain
		noteL 49,3
		note 48
		note 47
		repeatSection1Start
		noteL 46,3
		note 45
		note 44
		note 43
		note 42
		noteL 41,6
		ymVol 04h
		note 41
		ymVol 02h
		release 01h
		note 41
		ymVol 05h
		repeatEnd
		repeatSection2Start
		release 01h
		noteL 46,3
		ymInst 44
		ymVol 0Bh
		noteL 54,4
		note 57
		noteL 56,76
		noteL 62,16
		noteL 58,4
		note 56
		note 53
		note 47
		note 50
		note 54
		note 55
		noteL 52,88
		noteL 55,6
		noteL 56,66
		repeatStart
		ymStereo 080h
		ymInst 26
		ymVol 0Bh
		noteL 43,6
		note 35
		note 38
		note 43
		note 44
		note 36
		note 42
		note 44
		ymVol 09h
		note 44
		release 03h
		ymInst 13
		ymVol 0Ah
		repeatSection1Start
		noteL 51,12
		noteL 51,6
		noteL 51,12
		noteL 51,6
		note 51
		release 01h
		repeatEnd
		repeatSection2Start
		noteL 54,12
		noteL 54,6
		noteL 54,12
		noteL 54,6
		note 54
		release 01h
		ymInst 26
		ymVol 0Bh
		note 55
		note 47
		note 50
		note 55
		note 56
		note 48
		note 54
		note 56
		note 59
		note 50
		note 55
		note 59
		note 60
		note 54
		note 56
		note 60
		mainLoopEnd
Music_4_Channel_5:
		ymStereo 0C0h
		mainLoopStart
		sampleL 4,4
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		sample 2
		sample 2
		sample 2
		sample 2
		sampleL 5,36
		sampleL 2,4
		sample 3
		sample 3
		sampleL 2,18
		sample 2
		sampleL 2,12
		repeatStart
		countedLoopStart 1
		sampleL 0,72
		sampleL 4,4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sampleL 2,12
		sampleL 3,6
		sample 3
		sampleL 2,12
		sampleL 3,6
		sample 3
		sample 2
		sample 4
		sample 3
		sample 2
		sample 4
		sample 2
		sample 4
		sample 2
		countedLoopEnd
		countedLoopStart 1
		sampleL 5,12
		sampleL 2,24
		sampleL 3,4
		sample 3
		sample 3
		sampleL 5,12
		sampleL 3,4
		sample 4
		sample 4
		sampleL 3,6
		sampleL 2,12
		sampleL 3,6
		countedLoopEnd
		countedLoopStart 1
		sampleL 3,12
		sampleL 3,6
		sample 3
		sampleL 5,12
		sampleL 3,6
		sample 3
		sample 2
		sample 4
		sample 3
		sample 3
		sample 2
		sampleL 2,12
		sampleL 3,6
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		sampleL 0,216
		silence
		sampleL 5,4
		sample 2
		sample 2
		sample 3
		sample 3
		countedLoopStart 31
		sampleL 4,4
		countedLoopEnd
		countedLoopStart 6
		sampleL 4,4
		countedLoopEnd
		sampleL 3,4
		sample 3
		sample 2
		sample 2
		sampleL 5,216
		sampleL 5,4
		sample 2
		sample 2
		sample 3
		sample 3
		countedLoopStart 31
		sampleL 4,4
		countedLoopEnd
		sampleL 4,4
		sample 3
		sample 3
		sample 2
		sample 2
		sampleL 5,192
		repeatStart
		sampleL 5,4
		sample 2
		sample 2
		sample 3
		sample 3
		countedLoopStart 14
		sampleL 4,4
		countedLoopEnd
		sampleL 3,4
		sample 3
		sample 2
		sample 2
		sampleL 5,96
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		sampleL 5,4
		sample 2
		sample 2
		sample 3
		sample 3
		countedLoopStart 6
		sampleL 4,4
		countedLoopEnd
		sampleL 3,16
		sample 2
		sample 2
		sampleL 5,4
		sample 2
		sample 2
		sample 3
		sample 3
		countedLoopStart 14
		sampleL 4,4
		countedLoopEnd
		sampleL 3,4
		sample 3
		sample 2
		sample 2
		sampleL 5,108
		sampleL 4,6
		sample 4
		countedLoopStart 13
		sampleL 3,12
		sampleL 4,6
		sample 4
		countedLoopEnd
		sampleL 3,6
		sample 4
		sample 3
		sample 3
		countedLoopStart 9
		sampleL 3,12
		sampleL 4,6
		sample 4
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_6:
		vibrato 04Ch
		mainLoopStart
		release 00h
		psgInst 12
		noteL 35,6
		note 38
		note 35
		note 38
		note 36
		note 39
		note 36
		note 39
		countedLoopStart 3
		noteL 43,3
		note 44
		countedLoopEnd
		noteL 43,6
		note 40
		note 37
		note 34
		countedLoopStart 7
		noteL 31,3
		note 32
		countedLoopEnd
		release 01h
		repeatStart
		psgInst 26
		countedLoopStart 8
		noteL 28,6
		note 32
		countedLoopEnd
		psgInst 12
		noteL 35,6
		note 36
		note 40
		note 44
		note 47
		note 48
		note 55
		note 56
		note 55
		note 56
		note 52
		note 48
		note 44
		note 40
		psgInst 26
		countedLoopStart 8
		noteL 29,6
		note 33
		countedLoopEnd
		psgInst 12
		noteL 35,6
		note 39
		note 41
		note 45
		note 47
		note 51
		note 53
		note 57
		note 53
		note 57
		note 54
		note 58
		note 54
		note 58
		psgInst 26
		countedLoopStart 4
		noteL 31,6
		note 34
		countedLoopEnd
		noteL 38,6
		note 42
		note 38
		note 34
		note 31
		note 30
		countedLoopStart 4
		noteL 31,6
		note 35
		countedLoopEnd
		noteL 37,6
		note 42
		note 43
		note 47
		note 49
		note 54
		psgInst 12
		countedLoopStart 1
		noteL 56,6
		note 54
		note 56
		note 50
		note 56
		note 54
		note 56
		note 50
		note 57
		note 53
		note 57
		note 51
		note 57
		note 53
		note 57
		note 51
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		psgInst 0
		length 144
		psgInst 42
		noteL 32,6
		note 33
		note 37
		note 40
		note 41
		note 44
		note 47
		note 52
		countedLoopStart 16
		noteL 55,6
		note 51
		note 47
		note 54
		note 50
		note 46
		note 53
		note 49
		note 45
		note 50
		note 46
		note 42
		note 58
		note 53
		note 47
		countedLoopEnd
		noteL 55,6
		note 51
		note 47
		note 54
		note 50
		note 46
		note 53
		note 49
		note 45
		countedLoopStart 4
		noteL 50,6
		note 46
		note 42
		note 52
		note 51
		note 47
		note 43
		note 53
		note 52
		note 48
		note 44
		note 54
		note 53
		note 49
		note 45
		note 55
		countedLoopEnd
		countedLoopStart 4
		noteL 47,6
		note 38
		note 43
		note 47
		note 48
		note 44
		note 42
		note 36
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_7:
		shifting 020h
		vibrato 04Ch
		mainLoopStart
		psgInst 0
		length 6
		release 00h
		psgInst 10
		note 35
		note 38
		note 35
		note 38
		note 36
		note 39
		note 36
		note 39
		countedLoopStart 3
		noteL 43,3
		note 44
		countedLoopEnd
		noteL 43,6
		note 40
		note 37
		note 34
		countedLoopStart 7
		noteL 31,3
		note 32
		countedLoopEnd
		release 01h
		repeatStart
		psgInst 24
		countedLoopStart 8
		noteL 28,6
		note 32
		countedLoopEnd
		psgInst 10
		noteL 35,6
		note 36
		note 40
		note 44
		note 47
		note 48
		note 55
		note 56
		note 55
		note 56
		note 52
		note 48
		note 44
		note 40
		psgInst 24
		countedLoopStart 8
		noteL 29,6
		note 33
		countedLoopEnd
		psgInst 10
		noteL 35,6
		note 39
		note 41
		note 45
		note 47
		note 51
		note 53
		note 57
		note 53
		note 57
		note 54
		note 58
		note 54
		note 58
		psgInst 24
		countedLoopStart 4
		noteL 31,6
		note 34
		countedLoopEnd
		noteL 38,6
		note 42
		note 38
		note 34
		note 31
		note 30
		countedLoopStart 4
		noteL 31,6
		note 35
		countedLoopEnd
		noteL 37,6
		note 42
		note 43
		note 47
		note 49
		note 54
		psgInst 10
		countedLoopStart 1
		noteL 56,6
		note 54
		note 56
		note 50
		note 56
		note 54
		note 56
		note 50
		note 57
		note 53
		note 57
		note 51
		note 57
		note 53
		note 57
		note 51
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		psgInst 0
		length 138
		shifting 00h
		psgInst 42
		noteL 22,6
		note 26
		note 29
		note 32
		note 34
		note 38
		note 41
		note 44
		countedLoopStart 23
		noteL 44,6
		note 43
		note 52
		note 57
		note 41
		note 44
		note 43
		note 48
		note 56
		note 59
		note 61
		countedLoopEnd
		countedLoopStart 4
		noteL 44,6
		note 47
		note 52
		note 53
		note 45
		note 48
		note 53
		note 54
		note 46
		note 49
		note 54
		note 55
		note 47
		note 50
		note 55
		note 56
		countedLoopEnd
		countedLoopStart 4
		noteL 31,6
		note 35
		note 26
		note 31
		note 32
		note 36
		note 27
		note 30
		countedLoopEnd
		mainLoopEnd
Music_4_Channel_9:
		channel_end
