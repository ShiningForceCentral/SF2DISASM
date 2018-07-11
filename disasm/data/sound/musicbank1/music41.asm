
; ASM FILE music41.asm :
; 0xDC9A..0xFD9E : Music 41
Music_41:       db 0
		db 0
		db 0
		db 0C6h
		dw Music_9_Channel_0
		dw Music_9_Channel_1
		dw Music_9_Channel_2
		dw Music_9_Channel_3
		dw Music_9_Channel_4
		dw Music_9_Channel_5
		dw Music_9_Channel_6
		dw Music_9_Channel_7
		dw Music_9_Channel_9
		dw Music_9_Channel_9
Music_9_Channel_0:
		ymStereo 0C0h
		ymInst 55
		ymVol 0Ch
		ymSustain
		vibrato 02Ch
		noteL 17,192
		vibrato 020h
		note 17
		note 17
		note 17
		release 01h
		noteL 17,83
		vibrato 02Ch
		ymInst 40
		ymVol 0Bh
		noteL 16,15
		ymVol 0Ch
		noteL 14,16
		ymInst 1
		ymVol 0Bh
		noteL 1,132
		ymInst 3
		ymVol 0Dh
		noteL 10,10
		length 14
		noteL 10,78
		length 18
		ymVol 0Ch
		countedLoopStart 1
		noteL 10,8
		noteL 22,4
		silence
		note 22
		silence
		countedLoopEnd
		noteL 5,8
		noteL 17,4
		silence
		note 17
		silence
		noteL 10,12
		ymInst 32
		ymVol 0Dh
		noteL 22,6
		note 22
		note 22
		ymVol 09h
		note 22
		ymInst 3
		ymVol 0Bh
		note 10
		note 10
		note 10
		note 10
		note 10
		length 18
		noteL 17,6
		silence
		countedLoopStart 3
		noteL 10,6
		silence
		note 10
		length 18
		noteL 10,6
		note 10
		note 10
		note 10
		note 10
		length 18
		noteL 17,6
		silence
		countedLoopEnd
		repeatStart
		noteL 15,6
		silence
		note 15
		length 18
		noteL 15,6
		note 15
		note 15
		note 15
		note 15
		length 18
		noteL 17,6
		silence
		ymVol 0Ch
		noteL 10,8
		length 16
		noteL 22,12
		length 6
		note 22
		note 20
		silence
		ymVol 0Bh
		ymSustain
		note 32
		release 01h
		note 31
		note 32
		silence
		ymVol 0Ch
		note 20
		silence
		note 18
		silence
		ymVol 0Bh
		ymSustain
		note 30
		release 01h
		note 29
		note 30
		note 32
		note 34
		note 30
		note 29
		silence
		noteL 17,24
		noteL 17,6
		silence
		note 10
		silence
		note 10
		length 18
		noteL 10,6
		note 10
		note 10
		note 10
		note 10
		length 18
		noteL 17,6
		silence
		note 15
		silence
		note 15
		length 18
		noteL 15,6
		note 15
		note 15
		silence
		repeatSection1Start
		noteL 17,24
		noteL 15,12
		noteL 14,6
		silence
		note 14
		length 18
		noteL 14,6
		note 14
		note 14
		note 14
		note 14
		length 18
		noteL 21,6
		silence
		note 19
		silence
		note 19
		length 18
		noteL 19,6
		note 19
		note 17
		note 17
		note 17
		silence
		noteL 17,24
		noteL 16,6
		silence
		note 16
		length 18
		noteL 16,6
		note 16
		note 16
		note 16
		note 16
		length 18
		noteL 16,6
		silence
		note 17
		silence
		note 17
		length 18
		noteL 17,6
		silence
		note 5
		note 5
		note 5
		length 18
		noteL 5,6
		silence
		note 10
		silence
		note 10
		length 18
		noteL 10,6
		note 10
		note 10
		note 10
		note 10
		length 18
		noteL 17,6
		silence
		repeatEnd
		repeatSection2Start
		noteL 17,36
		noteL 18,48
		noteL 20,36
		ymSustain
		noteL 18,6
		release 01h
		note 20
		noteL 22,8
		length 16
		noteL 15,48
		noteL 15,24
		noteL 11,48
		noteL 13,36
		ymSustain
		noteL 11,6
		release 01h
		note 13
		noteL 15,8
		length 16
		noteL 16,72
		ymInst 2
		ymVol 0Ch
		noteL 33,48
		length 12
		noteL 28,24
		noteL 28,6
		silence
		noteL 33,72
		noteL 28,24
		noteL 32,48
		length 12
		noteL 27,24
		noteL 27,6
		silence
		noteL 32,96
		noteL 31,48
		length 12
		noteL 26,24
		noteL 26,6
		silence
		noteL 31,72
		noteL 26,24
		noteL 30,48
		length 12
		noteL 30,24
		noteL 25,6
		silence
		noteL 28,48
		length 12
		noteL 23,24
		noteL 28,12
		noteL 26,48
		length 12
		noteL 26,24
		noteL 26,6
		silence
		noteL 25,60
		noteL 27,12
		note 28
		note 32
		noteL 31,48
		length 12
		noteL 26,24
		noteL 31,12
		noteL 30,48
		length 12
		note 33
		note 35
		note 37
		noteL 38,48
		length 12
		noteL 33,24
		noteL 33,6
		silence
		noteL 37,30
		length 6
		noteL 32,18
		length 6
		noteL 28,18
		length 6
		note 25
		length 30
		ymInst 3
		ymVol 0Ch
		noteL 18,24
		silence
		note 16
		noteL 14,8
		length 16
		noteL 12,72
		countedLoopStart 1
		ymInst 3
		ymVol 0Ch
		release 07h
		noteL 17,12
		note 24
		note 29
		release 01h
		ymInst 32
		ymVol 0Dh
		noteL 17,6
		note 17
		note 17
		ymVol 09h
		note 17
		release 07h
		ymInst 3
		ymVol 0Ch
		noteL 17,12
		note 24
		note 29
		silence
		release 01h
		ymInst 32
		ymVol 0Dh
		noteL 17,6
		note 17
		note 17
		ymVol 09h
		note 17
		release 07h
		ymInst 3
		ymVol 0Ch
		noteL 17,12
		note 24
		note 29
		note 27
		note 34
		note 29
		release 01h
		ymInst 32
		ymVol 0Dh
		noteL 17,6
		note 17
		note 17
		ymVol 09h
		note 17
		length 12
		ymInst 38
		ymVol 0Bh
		noteL 39,4
		note 38
		note 36
		note 34
		note 33
		note 31
		note 41
		note 39
		note 38
		note 36
		note 34
		note 33
		note 43
		note 41
		note 39
		note 38
		note 36
		note 34
		note 45
		note 43
		note 41
		note 39
		note 38
		note 36
		note 34
		note 33
		note 31
		note 29
		note 27
		note 26
		note 24
		note 22
		note 21
		note 19
		note 17
		note 15
		countedLoopEnd
		ymInst 32
		ymVol 0Dh
		noteL 22,6
		ymVol 09h
		note 22
		ymVol 0Dh
		noteL 22,4
		note 22
		ymVol 09h
		note 22
		ymVol 0Dh
		noteL 22,12
		ymVol 09h
		noteL 22,6
		silence
		ymInst 3
		ymVol 0Dh
		noteL 10,54
		length 6
		ymVol 0Ch
		noteL 10,4
		release 05h
		noteL 10,8
		note 10
		note 10
		note 10
		silence
		note 10
		note 10
		note 10
		note 10
		note 10
		countedLoopStart 11
		release 01h
		noteL 10,8
		length 4
		note 10
		release 05h
		noteL 10,8
		note 10
		note 10
		note 10
		silence
		note 10
		note 10
		note 10
		note 10
		note 10
		countedLoopEnd
		release 01h
		noteL 10,8
		length 4
		note 10
		release 05h
		noteL 10,8
		release 01h
		noteL 5,72
		noteL 10,8
		length 16
		noteL 10,8
		length 28
		noteL 18,8
		length 16
		noteL 18,8
		length 16
		noteL 11,6
		silence
		noteL 11,8
		length 16
		noteL 16,6
		note 16
		noteL 16,8
		length 16
		noteL 16,8
		length 28
		noteL 21,8
		length 16
		noteL 23,6
		silence
		noteL 23,8
		length 16
		noteL 23,6
		note 23
		note 22
		silence
		note 10
		note 10
		note 10
		silence
		note 10
		note 10
		noteL 10,8
		length 40
		channel_end
Music_9_Channel_1:
		ymStereo 0C0h
		release 01h
		vibrato 035h
		ymInst 15
		ymVol 00h
		noteL 17,12
		ymVol 0Bh
		note 28
		note 29
		note 36
		noteL 35,36
		noteL 31,12
		note 33
		note 36
		vibrato 03Ch
		ymSustain
		noteL 40,72
		vibrato 030h
		ymVol 09h
		noteL 40,6
		ymVol 07h
		release 01h
		note 40
		ymVol 0Bh
		vibrato 035h
		noteL 28,12
		note 29
		note 36
		note 35
		note 31
		noteL 33,18
		noteL 40,6
		vibrato 03Ch
		ymSustain
		noteL 43,72
		vibrato 030h
		ymVol 09h
		noteL 43,6
		ymVol 07h
		release 01h
		note 43
		ymVol 0Bh
		vibrato 035h
		noteL 28,12
		note 29
		note 36
		note 35
		note 31
		note 33
		note 40
		note 38
		note 35
		note 36
		noteL 43,24
		noteL 41,12
		vibrato 03Ch
		ymSustain
		noteL 47,24
		vibrato 030h
		ymVol 09h
		noteL 47,6
		ymVol 07h
		release 01h
		note 47
		ymVol 0Bh
		vibrato 035h
		noteL 36,12
		note 43
		note 41
		vibrato 03Ch
		ymSustain
		noteL 47,48
		vibrato 030h
		ymVol 09h
		noteL 47,6
		ymVol 07h
		release 01h
		note 47
		vibrato 035h
		ymVol 0Bh
		noteL 36,12
		noteL 43,18
		noteL 41,6
		vibrato 03Ch
		ymSustain
		noteL 47,48
		vibrato 030h
		ymVol 09h
		noteL 47,6
		ymVol 07h
		release 01h
		note 47
		ymVol 0Bh
		vibrato 035h
		noteL 48,12
		noteL 55,18
		noteL 53,6
		vibrato 03Fh
		ymSustain
		noteL 59,222
		vibrato 030h
		ymVol 09h
		noteL 59,6
		ymVol 07h
		release 01h
		note 59
		vibrato 02Ch
		ymInst 13
		ymVol 0Ch
		noteL 55,4
		note 55
		ymVol 09h
		note 55
		ymVol 0Ch
		note 55
		ymVol 09h
		note 55
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 0Ch
		note 52
		ymVol 09h
		note 52
		ymVol 0Ch
		noteL 53,48
		ymVol 09h
		noteL 53,8
		release 05h
		ymInst 27
		ymVol 0Ah
		note 31
		note 31
		note 31
		note 34
		note 34
		note 34
		note 38
		note 38
		note 38
		note 40
		note 40
		release 01h
		noteL 41,12
		ymVol 06h
		noteL 41,6
		ymVol 04h
		note 41
		length 12
		ymInst 20
		ymVol 0Bh
		noteL 40,6
		note 40
		noteL 40,36
		ymVol 07h
		noteL 40,6
		ymVol 0Bh
		note 41
		noteL 38,96
		ymInst 16
		ymVol 0Bh
		noteL 53,6
		note 52
		noteL 53,54
		ymVol 08h
		noteL 53,6
		ymVol 0Bh
		noteL 53,4
		note 52
		note 51
		note 50
		note 49
		note 48
		ymSustain
		noteL 50,96
		ymVol 08h
		noteL 50,6
		release 01h
		ymVol 06h
		note 50
		repeatStart
		ymInst 27
		ymVol 0Bh
		noteL 33,12
		noteL 34,6
		ymVol 07h
		note 34
		ymVol 0Bh
		note 43
		ymVol 07h
		note 43
		ymVol 0Bh
		noteL 41,36
		noteL 38,6
		ymVol 07h
		note 38
		ymVol 0Bh
		note 39
		ymVol 07h
		note 39
		ymVol 0Bh
		noteL 48,24
		noteL 46,6
		ymVol 07h
		note 46
		ymVol 0Bh
		noteL 45,24
		noteL 38,18
		noteL 39,6
		ymInst 20
		ymVol 0Bh
		note 41
		ymVol 08h
		note 41
		ymVol 06h
		note 41
		silence
		ymVol 0Bh
		noteL 41,12
		ymVol 08h
		noteL 41,6
		ymVol 0Bh
		note 41
		note 43
		ymVol 08h
		note 43
		ymVol 0Bh
		noteL 43,24
		noteL 43,6
		ymVol 08h
		note 43
		ymVol 0Bh
		note 44
		ymVol 08h
		note 44
		ymVol 0Bh
		noteL 44,24
		noteL 44,6
		ymVol 08h
		note 44
		ymVol 0Bh
		note 43
		note 41
		noteL 43,36
		ymVol 08h
		noteL 43,6
		ymVol 06h
		note 43
		ymInst 26
		repeatSection1Start
		ymVol 0Ch
		noteL 45,12
		note 46
		note 55
		note 53
		note 50
		noteL 51,6
		ymVol 09h
		note 51
		ymVol 07h
		note 51
		ymVol 0Ch
		note 58
		noteL 60,36
		noteL 58,12
		noteL 57,48
		ymVol 09h
		noteL 57,6
		ymVol 07h
		note 57
		ymVol 0Ch
		noteL 29,12
		note 30
		note 39
		noteL 38,36
		noteL 36,12
		note 36
		noteL 34,24
		noteL 34,6
		note 33
		note 34
		ymVol 09h
		note 34
		ymVol 0Ch
		noteL 31,12
		note 33
		note 34
		note 38
		noteL 36,24
		note 43
		noteL 43,12
		note 41
		note 40
		noteL 43,6
		ymVol 09h
		note 43
		ymVol 0Ch
		noteL 41,84
		ymVol 09h
		noteL 41,6
		ymVol 07h
		note 41
		repeatEnd
		repeatSection2Start
		ymVol 0Dh
		noteL 33,12
		note 34
		note 43
		note 41
		note 38
		noteL 39,6
		ymVol 0Ah
		note 39
		ymVol 08h
		note 39
		ymVol 0Dh
		note 46
		noteL 48,36
		noteL 46,12
		noteL 45,36
		ymInst 13
		ymVol 0Ch
		noteL 46,6
		note 48
		noteL 49,30
		ymVol 09h
		noteL 49,6
		ymVol 0Ch
		note 49
		note 49
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 46
		ymVol 09h
		note 46
		ymVol 0Ch
		note 44
		ymVol 09h
		note 44
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 46
		ymVol 09h
		note 46
		ymVol 0Ch
		note 41
		ymVol 09h
		note 41
		ymVol 0Ch
		noteL 46,60
		ymVol 09h
		noteL 46,6
		ymVol 07h
		note 46
		ymVol 0Ch
		noteL 53,30
		ymVol 09h
		noteL 53,6
		ymVol 0Ch
		note 53
		note 53
		note 51
		ymVol 09h
		note 51
		ymVol 0Ch
		note 49
		ymVol 09h
		note 49
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 51
		ymVol 09h
		note 51
		ymVol 0Ch
		note 49
		ymVol 09h
		note 49
		ymVol 0Ch
		note 56
		ymVol 09h
		note 56
		ymVol 0Ch
		noteL 54,72
		ymVol 09h
		noteL 54,6
		ymVol 07h
		note 54
		ymVol 05h
		note 54
		length 30
		ymInst 7
		ymVol 09h
		noteL 40,24
		note 42
		noteL 44,60
		noteL 42,12
		note 40
		note 37
		noteL 39,72
		noteL 42,24
		ymSustain
		noteL 47,120
		ymVol 07h
		noteL 47,6
		ymVol 05h
		note 47
		release 01h
		ymVol 03h
		note 47
		silence
		ymInst 9
		ymVol 0Ah
		noteL 38,24
		note 40
		noteL 42,60
		noteL 47,12
		note 49
		note 50
		noteL 49,72
		noteL 45,24
		noteL 47,68
		ymInst 26
		ymVol 0Ch
		ymSustain
		noteL 32,4
		note 33
		note 35
		note 37
		note 39
		note 40
		release 01h
		note 42
		ymVol 0Dh
		ymSustain
		noteL 44,20
		release 01h
		ymSlide 035h
		noteL 56,40
		ymStopSlide
		noteL 57,12
		note 56
		note 54
		noteL 52,24
		noteL 44,72
		noteL 44,12
		note 42
		note 44
		note 45
		noteL 40,36
		noteL 42,12
		noteL 44,96
		ymSustain
		noteL 44,20
		release 01h
		ymSlide 035h
		noteL 56,40
		ymStopSlide
		noteL 57,12
		note 56
		note 54
		ymSustain
		noteL 52,20
		release 01h
		ymSlide 035h
		noteL 61,40
		ymStopSlide
		noteL 59,12
		note 56
		note 52
		ymInst 20
		ymVol 0Ch
		noteL 49,6
		note 51
		noteL 52,18
		ymVol 09h
		noteL 52,6
		ymVol 0Ch
		note 52
		ymVol 09h
		note 52
		ymVol 0Ch
		note 51
		note 52
		noteL 54,24
		ymSustain
		noteL 47,4
		note 49
		release 01h
		note 51
		noteL 52,6
		note 54
		note 56
		ymVol 09h
		note 56
		ymVol 0Ch
		noteL 57,48
		ymInst 26
		ymVol 0Ch
		ymSustain
		noteL 48,4
		note 50
		note 52
		note 53
		note 55
		release 01h
		note 57
		countedLoopStart 1
		ymInst 26
		ymVol 0Dh
		noteL 58,6
		ymVol 0Ah
		note 58
		ymVol 0Dh
		note 58
		ymVol 0Ah
		note 58
		ymVol 0Dh
		note 60
		ymVol 0Ah
		note 60
		ymVol 08h
		note 60
		ymVol 06h
		note 60
		length 12
		ymVol 0Dh
		noteL 55,6
		ymVol 0Ah
		note 55
		ymVol 0Dh
		note 55
		ymVol 0Ah
		note 55
		ymVol 0Dh
		note 57
		ymVol 0Ah
		note 57
		ymVol 08h
		note 57
		ymVol 06h
		note 57
		length 24
		ymVol 0Dh
		noteL 53,6
		ymVol 0Ah
		note 53
		ymVol 0Dh
		note 53
		ymVol 0Ah
		note 53
		ymVol 0Dh
		note 53
		ymVol 0Ah
		note 53
		ymVol 0Dh
		note 55
		ymVol 0Ah
		note 55
		ymVol 0Dh
		note 51
		ymVol 0Ah
		note 51
		ymVol 0Dh
		note 48
		ymVol 0Ah
		note 48
		ymVol 0Dh
		note 48
		ymVol 0Ah
		note 48
		ymVol 08h
		note 48
		ymVol 06h
		note 48
		ymInst 13
		ymVol 0Dh
		note 29
		ymVol 0Ah
		note 29
		ymVol 0Dh
		note 36
		ymVol 0Ah
		note 36
		ymVol 0Dh
		note 41
		ymVol 0Ah
		note 41
		ymVol 0Dh
		noteL 39,24
		ymVol 0Ah
		noteL 39,6
		ymVol 08h
		note 39
		ymVol 0Dh
		note 36
		ymVol 0Ah
		note 36
		ymVol 0Dh
		note 39
		ymVol 0Ah
		note 39
		ymVol 0Dh
		note 46
		ymVol 0Ah
		note 46
		ymVol 0Dh
		noteL 45,48
		countedLoopEnd
		ymVol 0Ah
		noteL 45,6
		ymVol 08h
		note 45
		length 24
		ymVol 0Ch
		noteL 55,4
		note 55
		ymVol 09h
		note 55
		ymVol 0Ch
		note 55
		ymVol 09h
		note 55
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 0Ch
		note 52
		ymVol 09h
		note 52
		ymSustain
		ymVol 0Ch
		noteL 53,216
		ymVol 09h
		noteL 53,8
		ymVol 07h
		note 53
		release 01h
		ymVol 05h
		note 53
		ymInst 0
		ymVol 0Ch
		noteL 21,24
		note 22
		note 29
		noteL 28,72
		noteL 24,24
		noteL 26,12
		note 29
		ymSustain
		note 33
		ymVol 09h
		noteL 33,6
		release 01h
		ymVol 07h
		note 33
		length 156
		ymVol 0Ch
		noteL 21,12
		note 22
		note 29
		noteL 28,36
		noteL 24,12
		noteL 26,18
		noteL 33,6
		ymSustain
		noteL 36,12
		ymVol 09h
		noteL 36,6
		ymVol 07h
		release 01h
		note 36
		length 36
		ymVol 0Ch
		noteL 21,12
		note 22
		note 29
		note 28
		note 24
		note 26
		note 33
		noteL 31,18
		noteL 28,6
		noteL 29,12
		noteL 36,24
		noteL 34,12
		ymVol 0Ch
		ymSustain
		note 40
		ymVol 09h
		noteL 40,6
		release 01h
		ymVol 07h
		note 40
		length 12
		ymVol 0Ch
		note 29
		note 36
		note 34
		ymSustain
		note 40
		ymVol 09h
		noteL 40,6
		ymVol 07h
		release 01h
		note 40
		length 12
		ymInst 26
		ymVol 0Ch
		note 41
		noteL 48,18
		noteL 46,6
		ymInst 15
		ymVol 0Ch
		noteL 52,52
		ymInst 26
		ymVol 0Ch
		noteL 50,4
		note 49
		note 47
		note 45
		note 44
		note 42
		note 40
		note 38
		note 37
		note 35
		note 33
		note 44
		note 42
		note 40
		note 38
		note 37
		note 35
		note 45
		note 44
		note 42
		note 40
		note 38
		note 37
		note 47
		note 45
		note 44
		note 42
		note 40
		note 38
		note 49
		note 47
		note 45
		note 44
		note 42
		note 40
		note 50
		note 49
		note 47
		note 45
		note 44
		note 42
		note 52
		note 50
		note 49
		note 47
		note 45
		note 44
		note 42
		note 44
		note 45
		note 47
		note 49
		note 50
		note 44
		note 45
		note 47
		note 49
		note 50
		note 52
		ymInst 20
		countedLoopStart 1
		ymVol 0Ch
		noteL 53,6
		ymVol 09h
		note 53
		ymVol 07h
		note 53
		silence
		countedLoopEnd
		length 12
		countedLoopStart 1
		ymVol 0Ch
		noteL 53,6
		ymVol 09h
		note 53
		ymVol 07h
		note 53
		silence
		countedLoopEnd
		ymVol 0Ch
		noteL 53,6
		ymVol 09h
		note 53
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 07h
		note 53
		silence
		ymVol 0Ch
		note 53
		note 53
		note 53
		ymVol 09h
		note 53
		ymVol 07h
		note 53
		silence
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 07h
		note 53
		length 18
		ymVol 0Ch
		noteL 53,6
		ymVol 09h
		note 53
		ymVol 07h
		note 53
		silence
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 07h
		note 53
		silence
		ymVol 0Ch
		note 53
		note 53
		ymVol 0Ch
		note 58
		ymVol 09h
		note 58
		ymVol 0Ch
		note 34
		note 34
		note 34
		ymVol 09h
		note 34
		ymVol 0Ch
		note 34
		note 34
		note 34
		ymVol 09h
		note 34
		ymVol 07h
		note 34
		ymVol 05h
		note 34
		length 24
		channel_end
Music_9_Channel_2:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 120
		ymInst 16
		countedLoopStart 2
		ymVol 09h
		noteL 59,5
		ymVol 05h
		noteL 59,3
		countedLoopEnd
		ymSustain
		ymVol 09h
		noteL 57,48
		vibrato 020h
		ymVol 07h
		noteL 57,6
		ymVol 05h
		note 57
		release 01h
		ymVol 03h
		note 57
		length 102
		vibrato 02Ch
		ymVol 09h
		noteL 62,18
		noteL 64,4
		length 2
		ymVol 08h
		ymSustain
		noteL 64,36
		ymVol 06h
		noteL 64,6
		ymVol 04h
		release 01h
		note 64
		ymInst 9
		ymVol 08h
		noteL 36,24
		note 38
		note 40
		note 41
		note 43
		note 45
		note 47
		ymSustain
		note 48
		ymVol 07h
		noteL 48,6
		ymVol 05h
		note 48
		ymVol 03h
		release 01h
		note 48
		silence
		ymInst 16
		countedLoopStart 2
		ymVol 08h
		noteL 65,5
		ymVol 05h
		noteL 65,3
		countedLoopEnd
		ymVol 08h
		ymSustain
		noteL 62,48
		ymVol 05h
		noteL 62,6
		ymVol 03h
		note 62
		release 01h
		ymVol 01h
		note 62
		silence
		countedLoopStart 2
		ymVol 08h
		noteL 65,5
		ymVol 05h
		noteL 65,3
		countedLoopEnd
		ymVol 08h
		ymSustain
		noteL 62,48
		ymVol 05h
		noteL 62,5
		ymVol 03h
		note 62
		ymVol 01h
		release 01h
		note 62
		length 10
		ymVol 08h
		noteL 65,5
		ymVol 05h
		noteL 65,4
		ymVol 08h
		noteL 65,6
		ymVol 05h
		noteL 65,4
		ymVol 08h
		noteL 65,7
		ymVol 05h
		noteL 65,4
		ymVol 08h
		noteL 62,59
		ymSustain
		noteL 63,132
		ymVol 06h
		noteL 63,6
		release 01h
		ymVol 04h
		note 63
		ymInst 13
		ymVol 0Ch
		noteL 52,4
		note 52
		ymVol 09h
		note 52
		ymVol 0Ch
		note 52
		ymVol 09h
		note 52
		ymVol 0Ch
		note 50
		ymVol 09h
		note 50
		length 8
		ymVol 0Ch
		noteL 52,48
		ymVol 09h
		noteL 52,8
		release 05h
		ymInst 27
		ymVol 0Ah
		note 28
		note 28
		note 28
		note 31
		note 31
		note 31
		note 34
		note 34
		note 34
		note 36
		note 36
		release 01h
		noteL 38,12
		ymVol 06h
		noteL 38,6
		ymVol 04h
		note 38
		length 12
		ymInst 20
		ymVol 0Ah
		noteL 38,6
		note 38
		noteL 38,36
		ymVol 06h
		noteL 38,6
		ymVol 0Ah
		note 38
		noteL 36,96
		ymInst 16
		ymVol 0Bh
		noteL 50,66
		ymVol 08h
		noteL 50,6
		ymVol 0Bh
		noteL 50,4
		note 49
		note 48
		note 47
		note 46
		note 45
		ymInst 9
		ymVol 0Ah
		noteL 40,6
		ymSustain
		noteL 41,90
		ymVol 08h
		noteL 41,6
		ymVol 06h
		release 01h
		note 41
		length 180
		repeatStart
		ymInst 20
		ymVol 0Bh
		noteL 38,6
		ymVol 08h
		note 38
		ymVol 06h
		note 38
		silence
		ymVol 0Bh
		noteL 38,12
		ymVol 08h
		noteL 38,6
		ymVol 0Bh
		note 38
		note 39
		ymVol 08h
		note 39
		ymVol 0Bh
		noteL 39,24
		noteL 39,6
		ymVol 08h
		note 39
		ymVol 0Bh
		note 41
		ymVol 08h
		note 41
		ymVol 0Bh
		noteL 41,24
		noteL 41,6
		ymVol 08h
		note 41
		ymVol 0Bh
		note 39
		note 39
		noteL 39,36
		ymVol 08h
		noteL 39,6
		ymVol 06h
		note 39
		length 84
		repeatSection1Start
		length 72
		ymInst 38
		ymVol 0Bh
		ymSustain
		noteL 53,4
		note 54
		note 55
		note 57
		note 58
		release 01h
		note 60
		ymInst 47
		ymVol 0Bh
		noteL 62,60
		noteL 53,12
		note 54
		noteL 63,36
		noteL 62,48
		noteL 60,24
		noteL 58,72
		noteL 60,12
		note 62
		noteL 60,54
		ymInst 26
		ymVol 0Bh
		noteL 58,6
		note 57
		note 53
		note 51
		note 48
		note 46
		note 45
		length 192
		repeatEnd
		repeatSection2Start
		length 96
		ymInst 13
		ymVol 0Ah
		noteL 34,48
		note 30
		noteL 29,12
		ymVol 07h
		noteL 29,6
		ymVol 05h
		note 29
		ymVol 0Ah
		noteL 29,72
		noteL 34,48
		note 32
		noteL 30,12
		ymVol 07h
		noteL 30,6
		ymVol 05h
		note 30
		ymVol 0Ah
		noteL 30,36
		ymInst 38
		ymVol 0Dh
		noteL 37,12
		note 35
		note 34
		noteL 32,36
		noteL 30,6
		note 32
		noteL 25,72
		noteL 27,24
		note 28
		note 32
		noteL 30,36
		noteL 35,6
		ymVol 0Ah
		note 35
		ymVol 0Dh
		noteL 30,144
		ymInst 20
		ymVol 0Bh
		noteL 30,30
		ymVol 08h
		noteL 30,6
		ymVol 0Bh
		note 28
		note 30
		noteL 23,64
		ymVol 08h
		noteL 23,8
		ymVol 0Bh
		noteL 25,16
		ymVol 08h
		noteL 25,8
		ymVol 0Bh
		noteL 26,16
		ymVol 08h
		noteL 26,8
		ymVol 0Bh
		noteL 30,16
		ymVol 08h
		noteL 30,8
		ymVol 0Bh
		noteL 28,30
		ymVol 08h
		noteL 28,6
		ymVol 0Bh
		note 33
		ymVol 08h
		note 33
		ymVol 0Bh
		noteL 28,42
		ymVol 08h
		noteL 28,6
		ymVol 0Bh
		noteL 30,30
		ymVol 08h
		noteL 30,6
		ymVol 0Bh
		note 35
		ymVol 08h
		note 35
		ymVol 0Bh
		noteL 30,48
		ymVol 08h
		noteL 30,6
		ymVol 06h
		note 30
		length 12
		ymInst 27
		ymVol 09h
		noteL 30,24
		note 32
		note 33
		noteL 35,36
		noteL 40,6
		ymVol 05h
		note 40
		ymSustain
		ymVol 09h
		noteL 35,54
		ymVol 05h
		noteL 35,6
		release 01h
		ymVol 03h
		note 35
		silence
		ymVol 09h
		noteL 38,24
		note 37
		note 35
		noteL 35,36
		noteL 37,6
		ymVol 05h
		note 37
		ymSustain
		ymVol 09h
		noteL 37,54
		ymVol 05h
		noteL 37,6
		ymVol 03h
		release 01h
		note 37
		silence
		ymVol 09h
		noteL 30,24
		note 38
		note 35
		note 37
		noteL 40,48
		ymSustain
		noteL 44,24
		ymVol 05h
		noteL 44,6
		ymVol 03h
		release 01h
		note 44
		length 12
		ymInst 13
		ymVol 0Ch
		noteL 52,24
		ymVol 09h
		noteL 52,6
		ymVol 07h
		note 52
		length 12
		ymVol 0Ch
		noteL 54,24
		ymVol 0Ch
		noteL 56,6
		ymVol 09h
		note 56
		ymVol 07h
		note 56
		silence
		ymVol 0Ch
		noteL 54,60
		ymVol 09h
		noteL 54,6
		ymVol 07h
		note 54
		countedLoopStart 1
		ymInst 26
		ymVol 0Ch
		noteL 50,6
		ymVol 09h
		note 50
		ymVol 0Ch
		note 50
		ymVol 09h
		note 50
		ymVol 0Ch
		note 51
		ymVol 09h
		note 51
		ymVol 07h
		note 51
		ymVol 05h
		note 51
		length 12
		ymVol 0Ch
		noteL 46,6
		ymVol 09h
		note 46
		ymVol 0Ch
		note 46
		ymVol 09h
		note 46
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		ymVol 07h
		note 48
		ymVol 05h
		note 48
		length 24
		ymVol 0Ch
		noteL 45,6
		ymVol 09h
		note 45
		ymVol 0Ch
		note 45
		ymVol 09h
		note 45
		ymVol 0Ch
		note 45
		ymVol 09h
		note 45
		ymVol 0Ch
		note 46
		ymVol 09h
		note 46
		ymVol 0Ch
		note 43
		ymVol 09h
		note 43
		ymVol 0Ch
		note 39
		ymVol 09h
		note 39
		ymVol 0Ch
		note 39
		ymVol 09h
		note 39
		ymVol 07h
		note 39
		ymVol 05h
		note 39
		length 24
		ymInst 3
		ymVol 0Dh
		noteL 24,6
		ymVol 0Ah
		note 24
		ymVol 0Dh
		note 27
		ymVol 0Ah
		note 27
		ymVol 0Dh
		note 34
		ymVol 0Ah
		note 34
		ymVol 0Dh
		noteL 33,24
		ymVol 0Ah
		noteL 33,6
		ymVol 08h
		note 33
		ymVol 0Dh
		note 29
		ymVol 0Ah
		note 29
		ymVol 0Dh
		note 36
		ymVol 0Ah
		note 36
		ymVol 0Dh
		note 41
		ymVol 0Ah
		note 41
		ymVol 0Dh
		noteL 39,24
		countedLoopEnd
		ymVol 0Ah
		noteL 39,6
		ymVol 08h
		note 39
		length 24
		ymInst 13
		ymVol 0Ch
		noteL 52,4
		note 52
		ymVol 09h
		note 52
		ymVol 0Ch
		note 52
		ymVol 09h
		note 52
		ymVol 0Ch
		note 50
		ymVol 09h
		note 50
		length 8
		ymSustain
		ymVol 0Ch
		noteL 52,216
		ymVol 09h
		noteL 52,8
		ymVol 07h
		note 52
		release 01h
		ymVol 05h
		note 52
		length 192
		ymInst 20
		ymSustain
		ymVol 0Ch
		noteL 45,6
		ymVol 09h
		note 45
		ymVol 07h
		note 45
		release 01h
		ymVol 05h
		note 45
		length 132
		silence
		ymVol 0Ch
		ymSustain
		noteL 48,6
		ymVol 09h
		note 48
		ymVol 07h
		note 48
		ymVol 05h
		release 01h
		note 48
		length 192
		ymSustain
		ymVol 0Ch
		noteL 52,6
		ymVol 09h
		note 52
		ymVol 07h
		note 52
		ymVol 05h
		release 01h
		note 52
		length 48
		ymSustain
		ymVol 0Ch
		noteL 52,6
		ymVol 09h
		note 52
		ymVol 07h
		note 52
		ymVol 05h
		release 01h
		note 52
		length 48
		ymVol 0Ch
		ymSustain
		noteL 52,192
		release 01h
		noteL 52,96
		countedLoopStart 1
		ymVol 0Bh
		noteL 48,6
		ymVol 08h
		note 48
		ymVol 06h
		note 48
		silence
		countedLoopEnd
		length 12
		countedLoopStart 1
		ymVol 0Bh
		noteL 48,6
		ymVol 08h
		note 48
		ymVol 06h
		note 48
		silence
		countedLoopEnd
		ymVol 0Bh
		noteL 46,6
		ymVol 08h
		note 46
		ymVol 0Bh
		note 46
		ymVol 08h
		note 46
		ymVol 06h
		note 46
		silence
		ymVol 0Bh
		note 47
		note 47
		note 47
		ymVol 08h
		note 47
		ymVol 06h
		note 47
		silence
		ymVol 0Bh
		note 47
		ymVol 08h
		note 47
		ymVol 06h
		note 47
		length 18
		ymVol 0Bh
		noteL 49,6
		ymVol 08h
		note 49
		ymVol 06h
		note 49
		silence
		ymVol 0Bh
		note 49
		ymVol 08h
		note 49
		ymVol 0Bh
		note 49
		ymVol 08h
		note 49
		ymVol 06h
		note 49
		silence
		ymVol 0Bh
		note 49
		note 49
		ymVol 0Bh
		note 50
		ymVol 08h
		note 50
		ymVol 0Bh
		note 22
		note 22
		note 22
		ymVol 08h
		note 22
		ymVol 0Bh
		note 22
		note 22
		note 22
		ymVol 08h
		note 22
		ymVol 06h
		note 22
		ymVol 04h
		note 22
		length 24
		channel_end
Music_9_Channel_3:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 120
		ymInst 16
		countedLoopStart 2
		ymVol 09h
		noteL 55,5
		ymVol 05h
		noteL 55,3
		countedLoopEnd
		ymSustain
		ymVol 09h
		noteL 53,48
		vibrato 020h
		ymVol 07h
		noteL 53,6
		ymVol 05h
		note 53
		ymVol 03h
		release 01h
		note 53
		length 102
		vibrato 02Ch
		ymVol 09h
		noteL 59,18
		noteL 60,4
		length 2
		ymVol 08h
		ymSustain
		noteL 60,36
		ymVol 06h
		noteL 60,6
		ymVol 04h
		release 01h
		note 60
		ymInst 9
		ymVol 08h
		noteL 33,24
		note 35
		note 36
		note 38
		note 40
		note 41
		note 43
		ymSustain
		note 45
		ymVol 07h
		noteL 45,6
		ymVol 05h
		note 45
		release 01h
		ymVol 03h
		note 45
		silence
		ymInst 16
		countedLoopStart 2
		ymVol 08h
		noteL 57,5
		ymVol 05h
		noteL 57,3
		countedLoopEnd
		ymVol 08h
		ymSustain
		noteL 53,48
		ymVol 05h
		noteL 53,6
		ymVol 03h
		note 53
		release 01h
		ymVol 01h
		note 53
		silence
		countedLoopStart 2
		ymVol 08h
		noteL 57,5
		ymVol 05h
		noteL 57,3
		countedLoopEnd
		ymVol 08h
		ymSustain
		noteL 53,48
		ymVol 05h
		noteL 53,5
		ymVol 03h
		note 53
		ymVol 01h
		release 01h
		note 53
		length 10
		ymVol 08h
		noteL 57,5
		ymVol 05h
		noteL 57,4
		ymVol 08h
		noteL 57,6
		ymVol 05h
		noteL 57,4
		ymVol 08h
		noteL 57,7
		ymVol 05h
		noteL 57,4
		ymVol 08h
		noteL 53,59
		ymSustain
		noteL 55,132
		ymVol 06h
		noteL 55,6
		ymVol 04h
		release 01h
		note 55
		ymInst 13
		ymVol 0Ch
		noteL 48,4
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		length 8
		ymVol 0Ch
		noteL 48,48
		ymVol 09h
		noteL 48,8
		silence
		shifting 020h
		ymStereo 080h
		release 05h
		ymInst 27
		ymVol 09h
		note 28
		note 28
		note 28
		note 31
		note 31
		note 31
		note 34
		note 34
		note 34
		note 36
		note 36
		release 01h
		noteL 38,12
		ymVol 05h
		noteL 38,6
		ymVol 03h
		note 38
		length 10
		ymInst 20
		ymVol 0Ah
		noteL 38,6
		note 38
		noteL 38,36
		ymVol 06h
		noteL 38,6
		ymVol 0Ah
		note 38
		noteL 36,96
		ymInst 16
		ymVol 0Ah
		noteL 50,66
		ymVol 07h
		noteL 50,6
		ymVol 0Ah
		noteL 50,4
		note 49
		note 48
		note 47
		note 46
		note 45
		ymInst 9
		ymVol 09h
		noteL 40,6
		ymSustain
		noteL 41,90
		ymVol 07h
		noteL 41,6
		ymVol 05h
		release 01h
		note 41
		length 174
		repeatStart
		ymStereo 0C0h
		shifting 00h
		ymInst 20
		ymVol 0Bh
		noteL 34,6
		ymVol 08h
		note 34
		ymVol 06h
		note 34
		silence
		ymVol 0Bh
		noteL 34,12
		ymVol 08h
		noteL 34,6
		ymVol 0Bh
		note 34
		note 36
		ymVol 08h
		note 36
		ymVol 0Bh
		noteL 36,24
		noteL 36,6
		ymVol 08h
		note 36
		ymVol 0Bh
		note 37
		ymVol 08h
		note 37
		ymVol 0Bh
		noteL 37,24
		noteL 37,6
		ymVol 08h
		note 37
		ymVol 0Bh
		note 36
		note 36
		noteL 36,36
		ymVol 08h
		noteL 36,6
		ymVol 06h
		note 36
		length 84
		repeatSection1Start
		length 80
		ymStereo 080h
		shifting 020h
		ymInst 38
		ymVol 0Ah
		ymSustain
		noteL 53,4
		note 54
		note 55
		note 57
		note 58
		release 01h
		note 60
		ymInst 47
		ymVol 0Ah
		noteL 62,58
		noteL 53,12
		note 54
		noteL 63,36
		noteL 62,48
		noteL 60,24
		noteL 58,72
		noteL 60,12
		note 62
		noteL 60,54
		ymInst 26
		ymVol 0Ah
		noteL 58,6
		note 57
		note 53
		note 51
		note 48
		note 46
		note 45
		length 186
		repeatEnd
		repeatSection2Start
		length 96
		ymInst 13
		ymVol 0Ah
		noteL 41,48
		note 39
		noteL 38,12
		ymVol 07h
		noteL 38,6
		ymVol 05h
		note 38
		ymVol 0Ah
		noteL 38,72
		noteL 42,48
		note 41
		noteL 39,12
		ymVol 07h
		noteL 39,6
		ymVol 05h
		note 39
		ymVol 0Ah
		noteL 35,42
		ymStereo 080h
		shifting 020h
		ymInst 38
		ymVol 0Ch
		noteL 37,12
		note 35
		note 34
		noteL 32,36
		noteL 30,6
		note 32
		noteL 25,72
		noteL 27,24
		note 28
		note 32
		noteL 30,36
		noteL 35,6
		ymVol 09h
		note 35
		ymVol 0Ch
		noteL 30,144
		ymInst 20
		ymVol 0Ah
		noteL 30,30
		ymVol 07h
		noteL 30,6
		ymVol 0Ah
		note 28
		note 30
		noteL 23,64
		ymVol 07h
		noteL 23,8
		ymVol 0Ah
		noteL 25,16
		ymVol 07h
		noteL 25,8
		ymVol 0Ah
		noteL 26,16
		ymVol 07h
		noteL 26,8
		ymVol 0Ah
		noteL 30,16
		ymVol 07h
		noteL 30,8
		ymVol 0Ah
		noteL 28,30
		ymVol 07h
		noteL 28,6
		ymVol 0Ah
		note 33
		ymVol 07h
		note 33
		ymVol 0Ah
		noteL 28,42
		ymVol 07h
		noteL 28,6
		ymVol 0Ah
		noteL 30,30
		ymVol 07h
		noteL 30,6
		ymVol 0Ah
		note 35
		ymVol 07h
		note 35
		ymVol 0Ah
		noteL 30,48
		ymVol 07h
		noteL 30,6
		ymVol 05h
		note 30
		length 12
		ymInst 27
		ymVol 08h
		noteL 30,24
		note 32
		note 33
		noteL 35,36
		noteL 40,6
		ymVol 04h
		note 40
		ymSustain
		ymVol 09h
		noteL 35,54
		ymVol 04h
		noteL 35,6
		release 01h
		ymVol 02h
		note 35
		silence
		ymVol 08h
		noteL 38,24
		note 37
		note 35
		noteL 35,36
		noteL 37,6
		ymVol 04h
		note 37
		ymSustain
		ymVol 08h
		noteL 37,54
		ymVol 04h
		noteL 37,6
		ymVol 02h
		release 01h
		note 37
		silence
		ymVol 08h
		noteL 30,24
		note 38
		note 35
		note 37
		noteL 40,48
		ymSustain
		noteL 44,24
		ymVol 04h
		noteL 44,6
		ymVol 02h
		release 01h
		note 44
		silence
		shifting 00h
		ymStereo 0C0h
		ymInst 13
		ymVol 0Ch
		noteL 49,24
		ymVol 09h
		noteL 49,6
		ymVol 07h
		note 49
		length 12
		ymVol 0Ch
		noteL 51,24
		ymVol 0Ch
		noteL 52,6
		ymVol 09h
		note 52
		ymVol 07h
		note 52
		silence
		ymVol 0Ch
		noteL 50,60
		ymVol 09h
		noteL 50,6
		ymVol 07h
		note 50
		silence
		ymStereo 080h
		shifting 020h
		countedLoopStart 1
		ymInst 26
		ymVol 0Bh
		noteL 50,6
		ymVol 08h
		note 50
		ymVol 0Bh
		note 50
		ymVol 08h
		note 50
		ymVol 0Bh
		note 51
		ymVol 08h
		note 51
		ymVol 06h
		note 51
		ymVol 04h
		note 51
		length 12
		ymVol 0Bh
		noteL 46,6
		ymVol 08h
		note 46
		ymVol 0Bh
		note 46
		ymVol 08h
		note 46
		ymVol 0Bh
		note 48
		ymVol 08h
		note 48
		ymVol 06h
		note 48
		ymVol 04h
		note 48
		length 24
		ymVol 0Bh
		noteL 45,6
		ymVol 08h
		note 45
		ymVol 0Bh
		note 45
		ymVol 08h
		note 45
		ymVol 0Bh
		note 45
		ymVol 08h
		note 45
		ymVol 0Bh
		note 46
		ymVol 08h
		note 46
		ymVol 0Bh
		note 43
		ymVol 08h
		note 43
		ymVol 0Bh
		note 39
		ymVol 08h
		note 39
		ymVol 0Bh
		note 39
		ymVol 08h
		note 39
		ymVol 06h
		note 39
		ymVol 04h
		note 39
		length 24
		ymInst 3
		ymVol 0Ch
		noteL 24,6
		ymVol 09h
		note 24
		ymVol 0Ch
		note 27
		ymVol 09h
		note 27
		ymVol 0Ch
		note 34
		ymVol 09h
		note 34
		ymVol 0Ch
		noteL 33,24
		ymVol 09h
		noteL 33,6
		ymVol 07h
		note 33
		ymVol 0Ch
		note 29
		ymVol 09h
		note 29
		ymVol 0Ch
		note 36
		ymVol 09h
		note 36
		ymVol 0Ch
		note 41
		ymVol 09h
		note 41
		ymVol 0Ch
		noteL 39,24
		countedLoopEnd
		ymVol 09h
		noteL 39,6
		ymVol 07h
		note 39
		length 18
		ymStereo 0C0h
		shifting 00h
		ymInst 13
		ymVol 0Ch
		noteL 48,4
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		length 8
		ymSustain
		ymVol 0Ch
		noteL 48,216
		ymVol 09h
		noteL 48,8
		ymVol 07h
		note 48
		ymVol 05h
		release 01h
		note 48
		length 198
		shifting 020h
		ymStereo 080h
		ymInst 20
		ymSustain
		ymVol 0Bh
		noteL 45,6
		ymVol 08h
		note 45
		ymVol 06h
		note 45
		release 01h
		ymVol 04h
		note 45
		length 132
		silence
		ymVol 0Bh
		ymSustain
		noteL 48,6
		ymVol 08h
		note 48
		ymVol 06h
		note 48
		ymVol 04h
		release 01h
		note 48
		length 192
		ymSustain
		ymVol 0Bh
		noteL 52,6
		ymVol 08h
		note 52
		ymVol 06h
		note 52
		ymVol 04h
		release 01h
		note 52
		length 48
		ymSustain
		ymVol 0Bh
		noteL 52,6
		ymVol 08h
		note 52
		ymVol 06h
		note 52
		ymVol 04h
		release 01h
		note 52
		length 48
		ymVol 0Bh
		ymSustain
		noteL 52,186
		release 01h
		noteL 52,96
		countedLoopStart 1
		ymVol 0Bh
		noteL 46,6
		ymVol 08h
		note 46
		ymVol 06h
		note 46
		silence
		countedLoopEnd
		length 12
		countedLoopStart 1
		ymVol 0Bh
		noteL 44,6
		ymVol 08h
		note 44
		ymVol 06h
		note 44
		silence
		countedLoopEnd
		ymVol 0Bh
		noteL 42,6
		ymVol 08h
		note 42
		ymVol 0Bh
		note 42
		ymVol 08h
		note 42
		ymVol 06h
		note 42
		silence
		ymVol 0Bh
		note 44
		note 44
		note 44
		ymVol 08h
		note 44
		ymVol 06h
		note 44
		silence
		ymVol 0Bh
		note 44
		ymVol 08h
		note 44
		ymVol 06h
		note 44
		length 18
		ymVol 0Bh
		noteL 44,6
		ymVol 08h
		note 44
		ymVol 06h
		note 44
		silence
		ymVol 0Bh
		note 45
		ymVol 08h
		note 45
		ymVol 0Bh
		note 45
		ymVol 08h
		note 45
		ymVol 06h
		note 45
		silence
		ymVol 0Bh
		note 45
		note 45
		ymVol 0Bh
		note 46
		ymVol 08h
		note 46
		ymInst 32
		ymVol 0Dh
		note 22
		note 22
		note 22
		ymVol 0Ah
		note 22
		ymVol 0Dh
		note 22
		note 22
		note 22
		ymVol 0Ah
		note 22
		ymVol 08h
		note 22
		ymVol 06h
		note 22
		length 24
		channel_end
Music_9_Channel_4:
		shifting 020h
		ymStereo 040h
		release 01h
		vibrato 035h
		length 6
		ymInst 15
		ymVol 00h
		noteL 17,12
		ymVol 0Ah
		note 28
		note 29
		note 36
		noteL 35,36
		noteL 31,12
		note 33
		note 36
		vibrato 03Ch
		ymSustain
		noteL 40,72
		vibrato 030h
		ymVol 08h
		noteL 40,6
		ymVol 06h
		release 01h
		note 40
		ymVol 0Ah
		vibrato 035h
		noteL 28,12
		note 29
		note 36
		note 35
		note 31
		noteL 33,18
		noteL 40,6
		vibrato 03Ch
		ymSustain
		noteL 43,72
		vibrato 030h
		ymVol 08h
		noteL 43,6
		ymVol 06h
		release 01h
		note 43
		ymVol 0Ah
		vibrato 035h
		noteL 28,12
		note 29
		note 36
		note 35
		note 31
		note 33
		note 40
		note 38
		note 35
		note 36
		noteL 43,24
		noteL 41,12
		vibrato 03Ch
		ymSustain
		noteL 47,24
		vibrato 030h
		ymVol 08h
		noteL 47,6
		ymVol 06h
		release 01h
		note 47
		ymVol 0Ah
		vibrato 035h
		noteL 36,12
		note 43
		note 41
		vibrato 03Ch
		ymSustain
		noteL 47,48
		vibrato 030h
		ymVol 08h
		noteL 47,6
		ymVol 06h
		release 01h
		note 47
		vibrato 035h
		ymVol 0Ah
		noteL 36,12
		noteL 43,18
		noteL 41,6
		vibrato 03Ch
		ymSustain
		noteL 47,48
		vibrato 030h
		ymVol 08h
		noteL 47,6
		ymVol 06h
		release 01h
		note 47
		ymVol 0Ah
		vibrato 035h
		noteL 48,12
		noteL 55,18
		noteL 53,6
		vibrato 03Fh
		ymSustain
		noteL 59,222
		vibrato 030h
		ymVol 08h
		noteL 59,7
		ymVol 06h
		release 01h
		note 59
		vibrato 02Ch
		ymInst 13
		ymVol 0Bh
		noteL 55,4
		note 55
		ymVol 08h
		note 55
		ymVol 0Bh
		note 55
		ymVol 08h
		note 55
		ymVol 0Bh
		note 53
		ymVol 08h
		note 53
		ymVol 0Bh
		note 52
		ymVol 08h
		note 52
		ymVol 0Bh
		noteL 53,48
		ymVol 08h
		noteL 53,8
		release 05h
		ymInst 27
		ymVol 09h
		note 31
		note 31
		note 31
		note 34
		note 34
		note 34
		note 38
		note 38
		note 38
		note 40
		note 40
		release 01h
		noteL 41,12
		ymVol 05h
		noteL 41,6
		ymVol 03h
		note 41
		length 10
		ymInst 20
		ymVol 0Ah
		noteL 40,6
		note 40
		noteL 40,36
		ymVol 06h
		noteL 40,6
		ymVol 0Ah
		note 41
		noteL 38,96
		ymInst 16
		ymVol 0Ah
		noteL 53,6
		note 52
		noteL 53,54
		ymVol 07h
		noteL 53,6
		ymVol 0Ah
		noteL 53,4
		note 52
		note 51
		note 50
		note 49
		note 48
		ymSustain
		noteL 50,96
		ymVol 07h
		noteL 50,6
		release 01h
		ymVol 05h
		note 50
		repeatStart
		ymInst 27
		ymVol 0Ah
		noteL 33,12
		noteL 34,6
		ymVol 06h
		note 34
		ymVol 0Ah
		note 43
		ymVol 06h
		note 43
		ymVol 0Ah
		noteL 41,36
		noteL 38,6
		ymVol 06h
		note 38
		ymVol 0Ah
		note 39
		ymVol 06h
		note 39
		ymVol 0Ah
		noteL 48,24
		noteL 46,6
		ymVol 06h
		note 46
		ymVol 0Ah
		noteL 45,24
		noteL 38,18
		noteL 39,6
		ymInst 20
		ymVol 0Ah
		note 41
		ymVol 07h
		note 41
		ymVol 05h
		note 41
		silence
		ymVol 0Ah
		noteL 41,12
		ymVol 07h
		noteL 41,6
		ymVol 0Ah
		note 41
		note 43
		ymVol 07h
		note 43
		ymVol 0Ah
		noteL 43,24
		noteL 43,6
		ymVol 07h
		note 43
		ymVol 0Ah
		note 44
		ymVol 07h
		note 44
		ymVol 0Ah
		noteL 44,24
		noteL 44,6
		ymVol 07h
		note 44
		ymVol 0Ah
		note 43
		note 41
		noteL 43,36
		ymVol 07h
		noteL 43,6
		ymVol 05h
		note 43
		ymInst 26
		repeatSection1Start
		ymVol 0Bh
		noteL 45,12
		note 46
		note 55
		note 53
		note 50
		noteL 51,6
		ymVol 08h
		note 51
		ymVol 06h
		note 51
		ymVol 0Bh
		note 58
		noteL 60,36
		noteL 58,12
		noteL 57,48
		ymVol 08h
		noteL 57,6
		ymVol 06h
		note 57
		ymVol 0Bh
		noteL 29,12
		note 30
		note 39
		noteL 38,36
		noteL 36,12
		note 36
		noteL 34,24
		noteL 34,6
		note 33
		note 34
		ymVol 08h
		note 34
		ymVol 0Bh
		noteL 31,12
		note 33
		note 34
		note 38
		noteL 36,24
		note 43
		noteL 43,12
		note 41
		note 40
		noteL 43,6
		ymVol 08h
		note 43
		ymVol 0Bh
		noteL 41,84
		ymVol 08h
		noteL 41,6
		ymVol 06h
		note 41
		repeatEnd
		repeatSection2Start
		ymVol 0Ch
		noteL 33,12
		note 34
		note 43
		note 41
		note 38
		noteL 39,6
		ymVol 09h
		note 39
		ymVol 07h
		note 39
		ymVol 0Ch
		note 46
		noteL 48,36
		noteL 46,12
		noteL 45,36
		ymInst 13
		ymVol 0Bh
		noteL 46,6
		note 48
		noteL 49,30
		ymVol 08h
		noteL 49,6
		ymVol 0Bh
		note 49
		note 49
		note 48
		ymVol 08h
		note 48
		ymVol 0Bh
		note 46
		ymVol 08h
		note 46
		ymVol 0Bh
		note 44
		ymVol 08h
		note 44
		ymVol 0Bh
		note 48
		ymVol 08h
		note 48
		ymVol 0Bh
		note 46
		ymVol 08h
		note 46
		ymVol 0Bh
		note 41
		ymVol 08h
		note 41
		ymVol 0Bh
		noteL 46,60
		ymVol 08h
		noteL 46,6
		ymVol 06h
		note 46
		ymVol 0Bh
		noteL 53,30
		ymVol 08h
		noteL 53,6
		ymVol 0Bh
		note 53
		note 53
		note 51
		ymVol 08h
		note 51
		ymVol 0Bh
		note 49
		ymVol 08h
		note 49
		ymVol 0Bh
		note 48
		ymVol 08h
		note 48
		ymVol 0Bh
		note 51
		ymVol 08h
		note 51
		ymVol 0Bh
		note 49
		ymVol 08h
		note 49
		ymVol 0Bh
		note 56
		ymVol 08h
		note 56
		ymVol 0Bh
		noteL 54,72
		ymVol 08h
		noteL 54,6
		ymVol 06h
		note 54
		ymVol 04h
		note 54
		length 30
		ymInst 7
		ymVol 08h
		noteL 40,24
		note 42
		noteL 44,60
		noteL 42,12
		note 40
		note 37
		noteL 39,72
		noteL 42,24
		ymSustain
		noteL 47,120
		ymVol 06h
		noteL 47,6
		ymVol 04h
		note 47
		release 01h
		ymVol 02h
		note 47
		silence
		ymInst 9
		ymVol 09h
		noteL 38,24
		note 40
		noteL 42,60
		noteL 47,12
		note 49
		note 50
		noteL 49,72
		noteL 45,24
		noteL 47,68
		ymInst 26
		ymVol 0Bh
		ymSustain
		noteL 32,4
		note 33
		note 35
		note 37
		note 39
		note 40
		release 01h
		note 42
		ymVol 0Ch
		ymSustain
		noteL 44,20
		release 01h
		ymSlide 035h
		noteL 56,40
		ymStopSlide
		noteL 57,12
		note 56
		note 54
		noteL 52,24
		noteL 44,72
		noteL 44,12
		note 42
		note 44
		note 45
		noteL 40,36
		noteL 42,12
		noteL 44,96
		ymSustain
		noteL 44,20
		release 01h
		ymSlide 035h
		noteL 56,40
		ymStopSlide
		noteL 57,12
		note 56
		note 54
		ymSustain
		noteL 52,20
		release 01h
		ymSlide 035h
		noteL 61,40
		ymStopSlide
		noteL 59,12
		note 56
		note 52
		ymInst 20
		ymVol 0Bh
		noteL 49,6
		note 51
		noteL 52,18
		ymVol 08h
		noteL 52,6
		ymVol 0Bh
		note 52
		ymVol 08h
		note 52
		ymVol 0Bh
		note 51
		note 52
		noteL 54,24
		ymSustain
		noteL 47,4
		note 49
		release 01h
		note 51
		noteL 52,6
		note 54
		note 56
		ymVol 08h
		note 56
		ymVol 0Bh
		noteL 57,48
		ymInst 26
		ymVol 0Bh
		ymSustain
		noteL 48,4
		note 50
		note 52
		note 53
		note 55
		release 01h
		note 57
		countedLoopStart 1
		ymInst 26
		ymVol 0Ch
		noteL 58,6
		ymVol 09h
		note 58
		ymVol 0Ch
		note 58
		ymVol 09h
		note 58
		ymVol 0Ch
		note 60
		ymVol 09h
		note 60
		ymVol 07h
		note 60
		ymVol 05h
		note 60
		length 12
		ymVol 0Ch
		noteL 55,6
		ymVol 09h
		note 55
		ymVol 0Ch
		note 55
		ymVol 09h
		note 55
		ymVol 0Ch
		note 57
		ymVol 09h
		note 57
		ymVol 07h
		note 57
		ymVol 05h
		note 57
		length 24
		ymVol 0Ch
		noteL 53,6
		ymVol 09h
		note 53
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 0Ch
		note 53
		ymVol 09h
		note 53
		ymVol 0Ch
		note 55
		ymVol 09h
		note 55
		ymVol 0Ch
		note 51
		ymVol 09h
		note 51
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		ymVol 0Ch
		note 48
		ymVol 09h
		note 48
		ymVol 07h
		note 48
		ymVol 05h
		note 48
		ymInst 13
		ymVol 0Ch
		note 29
		ymVol 09h
		note 29
		ymVol 0Ch
		note 36
		ymVol 09h
		note 36
		ymVol 0Ch
		note 41
		ymVol 09h
		note 41
		ymVol 0Ch
		noteL 39,24
		ymVol 09h
		noteL 39,6
		ymVol 07h
		note 39
		ymVol 0Ch
		note 36
		ymVol 09h
		note 36
		ymVol 0Ch
		note 39
		ymVol 09h
		note 39
		ymVol 0Ch
		note 46
		ymVol 09h
		note 46
		ymVol 0Ch
		noteL 45,48
		countedLoopEnd
		ymVol 09h
		noteL 45,6
		ymVol 07h
		note 45
		length 26
		ymVol 0Bh
		noteL 55,4
		note 55
		ymVol 08h
		note 55
		ymVol 0Bh
		note 55
		ymVol 08h
		note 55
		ymVol 0Bh
		note 53
		ymVol 08h
		note 53
		ymVol 0Bh
		note 52
		ymVol 08h
		note 52
		ymSustain
		ymVol 0Bh
		noteL 53,214
		ymVol 08h
		noteL 53,8
		ymVol 06h
		note 53
		release 01h
		ymVol 04h
		note 53
		ymInst 0
		ymVol 0Bh
		noteL 21,24
		note 22
		note 29
		noteL 28,72
		noteL 24,24
		noteL 26,12
		note 29
		ymSustain
		note 33
		ymVol 08h
		noteL 33,6
		release 01h
		ymVol 06h
		note 33
		length 156
		ymVol 0Bh
		noteL 21,12
		note 22
		note 29
		noteL 28,36
		noteL 24,12
		noteL 26,18
		noteL 33,6
		ymSustain
		noteL 36,12
		ymVol 08h
		noteL 36,6
		ymVol 06h
		release 01h
		note 36
		length 36
		ymVol 0Bh
		noteL 21,12
		note 22
		note 29
		note 28
		note 24
		note 26
		note 33
		noteL 31,18
		noteL 28,6
		noteL 29,12
		noteL 36,24
		noteL 34,12
		ymVol 0Bh
		ymSustain
		note 40
		ymVol 08h
		noteL 40,6
		release 01h
		ymVol 06h
		note 40
		length 12
		ymVol 0Bh
		note 29
		note 36
		note 34
		ymSustain
		note 40
		ymVol 08h
		noteL 40,6
		ymVol 06h
		release 01h
		note 40
		length 12
		ymInst 26
		ymVol 0Bh
		note 41
		noteL 48,18
		noteL 46,6
		ymInst 15
		ymVol 0Bh
		noteL 52,54
		ymInst 26
		ymVol 0Bh
		noteL 50,4
		note 49
		note 47
		note 45
		note 44
		note 42
		note 40
		note 38
		note 37
		note 35
		note 33
		note 44
		note 42
		note 40
		note 38
		note 37
		note 35
		note 45
		note 44
		note 42
		note 40
		note 38
		note 37
		note 47
		note 45
		note 44
		note 42
		note 40
		note 38
		note 49
		note 47
		note 45
		note 44
		note 42
		note 40
		note 50
		note 49
		note 47
		note 45
		note 44
		note 42
		note 52
		note 50
		note 49
		note 47
		note 45
		note 44
		note 42
		note 44
		note 45
		note 47
		note 49
		note 50
		note 44
		note 45
		note 47
		note 49
		ymStereo 0C0h
		shifting 00h
		ymInst 20
		countedLoopStart 1
		ymVol 0Bh
		noteL 38,6
		ymVol 08h
		note 38
		ymVol 06h
		note 38
		silence
		countedLoopEnd
		length 12
		countedLoopStart 1
		ymVol 0Bh
		noteL 37,6
		ymVol 08h
		note 37
		ymVol 06h
		note 37
		silence
		countedLoopEnd
		ymVol 0Bh
		noteL 37,6
		ymVol 08h
		note 37
		ymVol 0Bh
		note 37
		ymVol 08h
		note 37
		ymVol 06h
		note 37
		silence
		ymVol 0Bh
		note 39
		note 39
		note 39
		ymVol 08h
		note 39
		ymVol 06h
		note 39
		silence
		ymVol 0Bh
		note 39
		ymVol 08h
		note 39
		ymVol 06h
		note 39
		length 18
		ymVol 0Bh
		noteL 39,6
		ymVol 08h
		note 39
		ymVol 06h
		note 39
		silence
		ymVol 0Bh
		note 39
		ymVol 08h
		note 39
		ymVol 0Bh
		note 39
		ymVol 08h
		note 39
		ymVol 06h
		note 39
		silence
		ymVol 0Bh
		note 39
		note 39
		ymVol 0Bh
		note 41
		ymVol 08h
		note 41
		ymVol 06h
		note 41
		ymStereo 040h
		shifting 020h
		ymVol 0Ah
		note 34
		note 34
		note 34
		ymVol 07h
		note 34
		ymVol 0Ah
		note 34
		note 34
		note 34
		ymVol 08h
		note 34
		ymVol 07h
		note 34
		ymVol 05h
		note 34
		length 18
		channel_end
Music_9_Channel_5:
		ymStereo 0C0h
		countedLoopStart 9
		length 96
		countedLoopEnd
		length 18
		sampleL 4,3
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
		sampleL 5,24
		sampleL 5,48
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		countedLoopStart 3
		sampleL 2,4
		sample 3
		sample 3
		sample 4
		sample 4
		sample 4
		countedLoopEnd
		sampleL 2,12
		sampleL 0,6
		sample 0
		sampleL 0,12
		sampleL 4,6
		sample 4
		sample 3
		sample 4
		sampleL 4,12
		sample 3
		sampleL 4,6
		sample 4
		countedLoopStart 1
		sampleL 3,6
		sample 4
		sampleL 4,24
		sampleL 4,6
		sample 4
		sample 3
		sample 4
		sampleL 4,12
		sample 3
		sampleL 4,6
		sample 4
		countedLoopEnd
		sampleL 3,6
		sample 4
		sampleL 4,24
		sampleL 4,6
		sample 4
		sample 3
		sample 4
		sampleL 4,12
		sampleL 4,120
		repeatStart
		length 84
		sampleL 4,3
		sample 4
		sample 3
		sample 3
		countedLoopStart 1
		sampleL 2,12
		sampleL 3,4
		sample 4
		sample 4
		sampleL 2,12
		sampleL 3,6
		sampleL 3,5
		sampleL 4,1
		countedLoopEnd
		sampleL 2,4
		sample 4
		sample 4
		sample 3
		sample 4
		sample 4
		sampleL 2,12
		sampleL 3,6
		sample 3
		sample 5
		sample 2
		sampleL 5,12
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		sampleL 2,192
		repeatSection1Start
		length 240
		silence
		repeatEnd
		repeatSection2Start
		repeatStart
		countedLoopStart 1
		sampleL 2,24
		sampleL 0,12
		sampleL 3,4
		sample 3
		sample 3
		countedLoopEnd
		sampleL 5,24
		sampleL 5,48
		repeatSection1Start
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		repeatEnd
		repeatSection2Start
		sampleL 3,3
		sample 3
		sample 3
		sample 3
		sample 4
		sample 4
		sample 4
		sample 4
		countedLoopStart 2
		sampleL 1,60
		sampleL 1,24
		sampleL 1,12
		sampleL 1,96
		length 192
		countedLoopEnd
		sampleL 1,60
		sampleL 1,24
		sampleL 1,12
		sampleL 1,72
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		countedLoopStart 1
		sampleL 2,24
		sampleL 0,12
		sampleL 3,4
		sample 3
		sample 3
		countedLoopEnd
		sampleL 5,24
		sampleL 5,48
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		repeatStart
		sampleL 2,6
		sample 3
		sample 3
		sample 3
		sampleL 2,12
		sampleL 0,6
		sample 0
		sampleL 0,12
		sampleL 3,6
		sample 3
		sample 2
		sample 3
		sample 3
		sample 3
		sampleL 2,12
		sampleL 0,6
		sample 0
		sampleL 0,12
		sampleL 3,6
		sample 3
		countedLoopStart 1
		sampleL 2,6
		sample 3
		sample 3
		sample 3
		countedLoopEnd
		sampleL 2,12
		sampleL 5,6
		sample 0
		sampleL 0,12
		sampleL 4,4
		sample 4
		sample 4
		countedLoopStart 5
		sampleL 2,4
		sample 3
		sample 3
		sample 4
		sample 4
		sample 4
		countedLoopEnd
		repeatSection1Start
		repeatEnd
		repeatSection2Start
		sampleL 5,12
		sampleL 0,4
		sampleL 0,8
		sampleL 0,24
		sample 5
		sampleL 4,3
		sample 4
		sample 4
		sample 4
		sample 3
		sample 3
		sample 3
		sample 3
		countedLoopStart 12
		sampleL 2,12
		sampleL 3,4
		sampleL 2,8
		sample 2
		sample 3
		sample 3
		sample 0
		sample 3
		sampleL 3,7
		sampleL 3,1
		sampleL 2,8
		sample 3
		sample 3
		countedLoopEnd
		sampleL 2,12
		sampleL 3,4
		sampleL 2,8
		sampleL 5,24
		countedLoopStart 1
		sampleL 2,4
		sample 3
		sample 3
		sample 4
		sample 4
		sample 4
		countedLoopEnd
		sampleL 2,12
		sampleL 4,4
		sample 4
		sample 3
		sampleL 2,24
		sampleL 0,11
		sampleL 3,1
		sampleL 2,24
		sampleL 2,6
		sampleL 3,18
		sampleL 2,12
		sampleL 2,24
		sampleL 2,6
		sample 3
		sampleL 2,23
		sampleL 3,1
		sampleL 2,12
		sample 0
		sampleL 4,4
		sample 4
		sample 3
		sampleL 5,24
		sampleL 2,6
		sample 3
		sampleL 2,12
		sample 2
		sampleL 2,6
		sample 3
		sampleL 5,12
		sampleL 2,6
		sample 3
		sampleL 2,12
		sampleL 2,6
		sample 3
		sampleL 5,48
		channel_end
Music_9_Channel_6:
		ymTimer 098h
		vibrato 040h
		psgInst 0
		release 080h
		psgInst 0
		noteL 31,6
		psgInst 1
		note 31
		psgInst 2
		note 31
		psgInst 118
		countedLoopStart 8
		noteL 31,96
		countedLoopEnd
		psgInst 121
		noteL 35,96
		ymTimer 0C4h
		release 01h
		noteL 35,36
		length 12
		vibrato 04Ch
		psgInst 12
		noteL 34,4
		note 34
		silence
		noteL 34,72
		psgInst 13
		noteL 46,4
		note 45
		note 43
		note 41
		note 40
		note 38
		note 48
		note 46
		note 45
		note 43
		note 41
		note 40
		note 50
		note 48
		note 46
		note 45
		note 43
		note 41
		note 52
		note 50
		note 48
		note 46
		note 45
		note 43
		noteL 53,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 42
		psgInst 125
		noteL 53,4
		note 55
		note 57
		noteL 58,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 18
		psgInst 125
		noteL 46,4
		note 48
		note 50
		noteL 52,6
		silence
		noteL 41,4
		note 43
		note 45
		noteL 46,6
		silence
		psgInst 11
		silence
		psgInst 9
		silence
		psgInst 125
		noteL 48,4
		note 46
		note 45
		note 43
		note 41
		note 40
		psgInst 123
		countedLoopStart 2
		noteL 38,6
		note 38
		note 38
		silence
		note 38
		silence
		note 38
		note 38
		note 38
		note 38
		note 38
		silence
		noteL 38,12
		length 6
		note 38
		countedLoopEnd
		repeatStart
		noteL 39,6
		note 39
		note 39
		silence
		note 39
		silence
		note 39
		note 39
		note 39
		note 39
		note 39
		silence
		noteL 39,12
		length 6
		note 39
		psgInst 13
		note 36
		note 38
		note 41
		note 46
		note 50
		note 46
		note 41
		note 38
		note 39
		note 41
		note 43
		note 48
		note 51
		note 48
		note 43
		note 39
		note 41
		note 42
		note 44
		note 49
		note 53
		note 49
		note 44
		note 41
		note 43
		note 44
		note 46
		note 51
		note 45
		note 46
		note 48
		note 53
		psgInst 123
		note 38
		note 38
		note 38
		silence
		note 38
		silence
		note 38
		note 38
		note 38
		note 38
		note 38
		silence
		noteL 38,12
		length 6
		note 38
		note 39
		note 39
		note 39
		silence
		note 39
		silence
		note 39
		note 39
		note 39
		silence
		noteL 36,18
		length 6
		note 36
		silence
		repeatSection1Start
		noteL 48,6
		note 48
		note 48
		silence
		note 48
		silence
		note 48
		note 48
		note 48
		note 48
		note 46
		silence
		noteL 45,12
		length 6
		note 45
		note 43
		note 43
		note 43
		silence
		note 43
		silence
		note 43
		note 43
		note 43
		note 43
		note 43
		silence
		noteL 43,24
		noteL 46,6
		note 46
		note 46
		silence
		note 46
		silence
		note 46
		note 46
		note 46
		note 46
		note 46
		silence
		noteL 46,12
		length 6
		note 46
		note 46
		note 46
		note 46
		silence
		note 46
		silence
		note 46
		note 46
		note 46
		note 46
		note 46
		silence
		noteL 45,12
		length 6
		note 45
		note 38
		note 38
		note 38
		silence
		note 38
		silence
		note 38
		note 38
		note 38
		note 38
		note 38
		silence
		noteL 38,12
		length 6
		note 38
		repeatEnd
		repeatSection2Start
		psgInst 125
		noteL 46,48
		noteL 44,12
		note 42
		note 41
		note 39
		psgInst 13
		noteL 38,6
		silence
		psgInst 11
		length 12
		psgInst 125
		noteL 38,24
		length 6
		note 40
		note 41
		note 45
		note 46
		note 50
		note 53
		note 58
		noteL 61,48
		note 60
		noteL 58,6
		note 56
		note 54
		note 53
		noteL 51,40
		noteL 49,4
		note 47
		note 46
		note 44
		note 42
		note 40
		note 39
		note 37
		countedLoopStart 1
		psgInst 123
		noteL 49,6
		silence
		note 49
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 49,6
		silence
		note 49
		silence
		note 49
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 49,6
		note 49
		countedLoopEnd
		noteL 47,6
		silence
		note 47
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 47,6
		silence
		note 47
		silence
		note 47
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 47,6
		note 47
		note 47
		silence
		note 47
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 47,6
		silence
		psgInst 124
		note 59
		note 61
		note 63
		note 66
		note 64
		note 63
		note 59
		note 54
		countedLoopStart 1
		psgInst 123
		noteL 47,6
		silence
		note 47
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 47,6
		silence
		note 47
		silence
		note 47
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 47,6
		note 47
		countedLoopEnd
		noteL 45,6
		silence
		note 45
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 45,6
		length 12
		psgInst 124
		noteL 54,6
		note 56
		note 57
		note 61
		note 64
		note 62
		note 61
		psgInst 123
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		silence
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		note 44
		note 42
		silence
		note 42
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 42,6
		silence
		note 42
		silence
		note 42
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 42,6
		note 42
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		silence
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		note 44
		note 38
		silence
		note 38
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 38,6
		silence
		note 38
		silence
		note 38
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 38,6
		note 38
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		silence
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		note 40
		note 42
		silence
		note 42
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 42,6
		silence
		note 42
		silence
		note 42
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 42,6
		note 42
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		silence
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		note 44
		psgInst 0
		length 24
		psgInst 12
		note 33
		length 6
		psgInst 10
		silence
		psgInst 8
		length 12
		psgInst 12
		noteL 35,24
		noteL 37,6
		silence
		psgInst 10
		silence
		psgInst 8
		silence
		psgInst 12
		noteL 38,60
		length 6
		psgInst 10
		silence
		countedLoopStart 1
		psgInst 12
		noteL 36,6
		silence
		note 36
		silence
		note 36
		silence
		psgInst 0
		length 24
		psgInst 12
		noteL 36,6
		silence
		note 36
		silence
		note 36
		silence
		psgInst 0
		length 36
		psgInst 12
		noteL 36,6
		silence
		note 36
		silence
		note 36
		silence
		note 39
		silence
		note 39
		silence
		note 36
		silence
		note 36
		silence
		psgInst 0
		length 24
		psgInst 13
		noteL 51,4
		note 50
		note 48
		note 46
		note 45
		note 43
		note 53
		note 51
		note 50
		note 48
		note 46
		note 45
		note 55
		note 53
		note 51
		note 50
		note 48
		note 46
		note 57
		note 55
		note 53
		note 51
		note 50
		note 48
		note 58
		note 57
		note 55
		note 53
		note 51
		note 50
		note 60
		note 58
		note 57
		note 55
		note 53
		note 51
		countedLoopEnd
		ymTimer 0C2h
		psgInst 0
		length 36
		psgInst 12
		noteL 34,4
		note 34
		silence
		noteL 34,240
		length 8
		psgInst 10
		silence
		psgInst 8
		silence
		psgInst 0
		length 192
		psgInst 13
		noteL 40,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 135
		silence
		psgInst 13
		noteL 40,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 99
		silence
		countedLoopStart 1
		psgInst 13
		noteL 48,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 54
		countedLoopEnd
		psgInst 12
		release 080h
		noteL 49,192
		release 01h
		noteL 49,96
		psgInst 13
		noteL 53,6
		silence
		noteL 50,4
		note 51
		note 52
		noteL 53,6
		silence
		noteL 41,4
		note 40
		note 39
		noteL 37,6
		silence
		note 36
		note 32
		note 37
		note 36
		note 41
		note 37
		note 41
		note 42
		note 46
		note 49
		note 53
		silence
		note 41
		note 40
		note 39
		note 35
		note 32
		note 35
		note 39
		note 35
		note 32
		note 35
		length 12
		noteL 49,4
		note 51
		note 52
		noteL 53,6
		silence
		noteL 41,4
		note 39
		note 37
		noteL 35,6
		note 33
		note 39
		note 41
		noteL 47,4
		note 49
		note 51
		note 53
		note 55
		note 57
		noteL 58,6
		silence
		note 34
		note 34
		note 34
		silence
		note 34
		note 34
		note 34
		silence
		psgInst 0
		length 36
		channel_end
Music_9_Channel_7:
		vibrato 040h
		release 080h
		psgInst 0
		noteL 24,6
		psgInst 1
		note 24
		psgInst 2
		note 24
		psgInst 118
		countedLoopStart 8
		noteL 24,96
		countedLoopEnd
		psgInst 121
		release 01h
		noteL 27,132
		length 12
		vibrato 04Ch
		psgInst 12
		noteL 26,4
		note 26
		silence
		noteL 26,72
		length 8
		shifting 010h
		psgInst 11
		noteL 46,4
		note 45
		note 43
		note 41
		note 40
		note 38
		note 48
		note 46
		note 45
		note 43
		note 41
		note 40
		note 50
		note 48
		note 46
		note 45
		note 43
		note 41
		note 52
		note 50
		note 48
		note 46
		note 45
		note 43
		noteL 53,6
		silence
		psgInst 9
		silence
		psgInst 0
		length 42
		psgInst 123
		noteL 53,4
		note 55
		note 57
		noteL 58,6
		silence
		psgInst 9
		silence
		psgInst 0
		length 18
		psgInst 123
		noteL 46,4
		note 48
		note 50
		noteL 52,6
		silence
		noteL 41,4
		note 43
		note 45
		noteL 46,6
		silence
		psgInst 9
		silence
		psgInst 7
		silence
		psgInst 123
		noteL 48,4
		note 46
		note 45
		note 43
		shifting 00h
		psgInst 123
		countedLoopStart 2
		noteL 34,6
		note 34
		note 34
		silence
		note 34
		silence
		note 34
		note 34
		note 34
		note 34
		note 34
		silence
		noteL 34,12
		length 6
		note 34
		countedLoopEnd
		repeatStart
		noteL 31,6
		note 31
		note 31
		silence
		note 31
		silence
		note 31
		note 31
		note 31
		note 31
		note 31
		silence
		noteL 31,12
		length 6
		note 31
		silence
		shifting 010h
		psgInst 11
		note 36
		note 38
		note 41
		note 46
		note 50
		note 46
		note 41
		note 38
		note 39
		note 41
		note 43
		note 48
		note 51
		note 48
		note 43
		note 39
		note 41
		note 42
		note 44
		note 49
		note 53
		note 49
		note 44
		note 41
		note 43
		note 44
		note 46
		note 51
		note 45
		note 46
		note 48
		shifting 00h
		psgInst 123
		note 34
		note 34
		note 34
		silence
		note 34
		silence
		note 34
		note 34
		note 34
		note 34
		note 34
		silence
		noteL 34,12
		length 6
		note 34
		note 31
		note 31
		note 31
		silence
		note 31
		silence
		note 31
		note 31
		note 31
		silence
		noteL 33,18
		length 6
		note 33
		silence
		repeatSection1Start
		noteL 45,6
		note 45
		note 45
		silence
		note 45
		silence
		note 45
		note 45
		note 45
		note 45
		note 43
		silence
		noteL 42,12
		length 6
		note 42
		note 38
		note 38
		note 38
		silence
		note 38
		silence
		note 38
		note 38
		note 38
		note 38
		note 38
		silence
		noteL 38,24
		noteL 43,6
		note 43
		note 43
		silence
		note 43
		silence
		note 43
		note 43
		note 36
		note 36
		note 36
		silence
		noteL 36,12
		length 6
		note 36
		note 36
		note 36
		note 36
		silence
		note 36
		silence
		note 36
		note 36
		note 36
		note 36
		note 36
		silence
		noteL 36,12
		length 6
		note 36
		note 34
		note 34
		note 34
		silence
		note 34
		silence
		note 34
		note 34
		note 34
		note 34
		note 34
		silence
		noteL 34,12
		length 6
		note 34
		repeatEnd
		repeatSection2Start
		length 6
		shifting 010h
		psgInst 123
		noteL 46,48
		noteL 44,12
		note 42
		note 41
		note 39
		psgInst 11
		noteL 38,6
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 38,24
		length 6
		note 40
		note 41
		note 45
		note 46
		note 50
		note 53
		note 58
		noteL 61,48
		note 60
		noteL 58,6
		note 56
		note 54
		note 53
		noteL 51,42
		noteL 49,4
		note 47
		note 46
		note 44
		note 42
		note 40
		shifting 00h
		countedLoopStart 1
		psgInst 123
		noteL 45,6
		silence
		note 45
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 45,6
		silence
		note 45
		silence
		note 45
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 45,6
		note 45
		countedLoopEnd
		noteL 44,6
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		silence
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		note 44
		note 44
		silence
		note 44
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 44,6
		length 12
		shifting 010h
		psgInst 122
		noteL 59,6
		note 61
		note 63
		note 66
		note 64
		note 63
		note 59
		shifting 00h
		countedLoopStart 1
		psgInst 123
		noteL 43,6
		silence
		note 43
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 43,6
		silence
		note 43
		silence
		note 43
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 43,6
		note 43
		countedLoopEnd
		noteL 42,6
		silence
		note 42
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 42,6
		silence
		psgInst 9
		length 12
		shifting 010h
		psgInst 122
		noteL 54,6
		note 56
		note 57
		note 61
		note 64
		note 62
		shifting 00h
		psgInst 123
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		silence
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		note 40
		note 38
		silence
		note 38
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 38,6
		silence
		note 38
		silence
		note 38
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 38,6
		note 38
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		silence
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		note 40
		note 35
		silence
		note 35
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 35,6
		silence
		note 35
		silence
		note 35
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 35,6
		note 35
		note 33
		silence
		note 33
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 33,6
		silence
		note 33
		silence
		note 33
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 33,6
		note 33
		note 38
		silence
		note 38
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 38,6
		silence
		note 38
		silence
		note 38
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 38,6
		note 38
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		silence
		note 40
		silence
		note 40
		silence
		psgInst 9
		length 12
		psgInst 123
		noteL 40,6
		note 40
		psgInst 0
		length 24
		psgInst 12
		note 30
		length 6
		psgInst 10
		silence
		psgInst 8
		length 12
		psgInst 12
		noteL 32,24
		noteL 33,6
		silence
		psgInst 10
		silence
		psgInst 8
		silence
		psgInst 12
		noteL 33,60
		length 6
		psgInst 10
		silence
		countedLoopStart 1
		psgInst 12
		noteL 29,6
		silence
		note 29
		silence
		note 29
		silence
		psgInst 0
		length 24
		psgInst 12
		noteL 29,6
		silence
		note 29
		silence
		note 29
		silence
		psgInst 0
		length 36
		psgInst 12
		noteL 29,6
		silence
		note 29
		silence
		note 29
		silence
		note 34
		silence
		note 34
		silence
		note 33
		silence
		note 33
		silence
		psgInst 0
		length 32
		shifting 010h
		psgInst 11
		noteL 51,4
		note 50
		note 48
		note 46
		note 45
		note 43
		note 53
		note 51
		note 50
		note 48
		note 46
		note 45
		note 55
		note 53
		note 51
		note 50
		note 48
		note 46
		note 57
		note 55
		note 53
		note 51
		note 50
		note 48
		note 58
		note 57
		note 55
		note 53
		note 51
		note 50
		note 60
		note 58
		note 57
		note 55
		shifting 00h
		countedLoopEnd
		psgInst 0
		length 36
		psgInst 12
		noteL 26,4
		note 26
		silence
		noteL 26,240
		length 8
		psgInst 10
		silence
		psgInst 8
		silence
		psgInst 0
		length 192
		psgInst 13
		noteL 38,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 135
		silence
		psgInst 13
		noteL 34,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 99
		silence
		psgInst 13
		noteL 43,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 54
		psgInst 13
		noteL 44,6
		silence
		psgInst 11
		silence
		psgInst 0
		length 54
		psgInst 12
		release 080h
		noteL 45,192
		release 01h
		noteL 45,96
		length 6
		shifting 010h
		psgInst 11
		note 53
		silence
		noteL 50,4
		note 51
		note 52
		noteL 53,6
		silence
		noteL 41,4
		note 40
		note 39
		noteL 37,6
		silence
		note 36
		note 32
		note 37
		note 36
		note 41
		note 37
		note 41
		note 42
		note 46
		note 49
		note 53
		silence
		note 41
		note 40
		note 39
		note 35
		note 32
		note 35
		note 39
		note 35
		note 32
		note 35
		length 12
		noteL 49,4
		note 51
		note 52
		noteL 53,6
		silence
		noteL 41,4
		note 39
		note 37
		noteL 35,6
		note 33
		note 39
		note 41
		noteL 47,4
		note 49
		note 51
		note 53
		note 55
		note 57
		noteL 58,6
		silence
		shifting 020h
		psgInst 12
		note 34
		note 34
		note 34
		silence
		note 34
		note 34
		note 34
		silence
		psgInst 0
		length 30
		channel_end
Music_9_Channel_9:
		channel_end
