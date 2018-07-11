
; ASM FILE music09.asm :
; 0x8040..0x8325 : Music 09
Music_9:        db 0
		db 1
		db 0
		db 0C4h
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
		release 01h
		vibrato 02Ch
		length 216
		silence
		length 108
		ymInst 40
		ymVol 0Ch
		noteL 31,54
		note 29
		noteL 28,216
		mainLoopStart
		noteL 34,54
		note 32
		noteL 25,108
		ymInst 22
		ymVol 0Ch
		noteL 35,54
		noteL 43,81
		noteL 35,27
		noteL 46,81
		noteL 35,27
		note 43
		note 35
		noteL 46,216
		ymInst 27
		ymVol 0Ah
		noteL 43,36
		note 36
		ymSustain
		noteL 42,204
		ymVol 08h
		noteL 42,12
		ymVol 06h
		note 42
		ymVol 04h
		note 42
		ymVol 02h
		release 01h
		note 42
		ymInst 40
		ymVol 0Ch
		noteL 31,54
		note 29
		noteL 28,108
		mainLoopEnd
Music_9_Channel_1:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 216
		silence
		ymInst 11
		ymVol 0Dh
		ymSustain
		note 13
		vibrato 020h
		release 01h
		note 17
		mainLoopStart
		ymSustain
		vibrato 02Ch
		noteL 11,108
		release 01h
		vibrato 020h
		note 14
		countedLoopStart 1
		ymSustain
		vibrato 02Ch
		noteL 17,108
		release 01h
		vibrato 020h
		note 16
		countedLoopEnd
		ymSustain
		noteL 5,216
		vibrato 020h
		release 01h
		note 5
		vibrato 02Ch
		ymSustain
		noteL 13,108
		vibrato 020h
		release 01h
		note 17
		mainLoopEnd
Music_9_Channel_2:
		ymStereo 080h
		shifting 010h
		ymVol 00h
		release 01h
		vibrato 02Ch
		length 222
		silence
		length 108
		ymInst 40
		ymVol 0Bh
		noteL 31,54
		note 29
		noteL 28,216
		mainLoopStart
		noteL 34,54
		note 32
		noteL 25,108
		ymInst 22
		ymVol 0Bh
		noteL 35,54
		noteL 43,81
		noteL 35,27
		noteL 46,81
		noteL 35,27
		note 43
		note 35
		noteL 46,216
		ymInst 27
		ymVol 09h
		noteL 43,36
		note 36
		ymSustain
		noteL 42,204
		ymVol 07h
		noteL 42,12
		ymVol 05h
		note 42
		ymVol 03h
		note 42
		ymVol 01h
		release 01h
		note 42
		ymInst 40
		ymVol 0Bh
		noteL 31,54
		note 29
		noteL 28,108
		mainLoopEnd
Music_9_Channel_3:
		shifting 020h
		ymStereo 040h
		release 01h
		vibrato 02Ch
		length 222
		silence
		ymInst 11
		ymVol 0Ch
		ymSustain
		noteL 13,216
		vibrato 020h
		release 01h
		note 17
		mainLoopStart
		ymSustain
		vibrato 02Ch
		noteL 11,108
		release 01h
		vibrato 020h
		note 14
		countedLoopStart 1
		ymSustain
		vibrato 02Ch
		noteL 17,108
		release 01h
		vibrato 020h
		note 16
		countedLoopEnd
		ymSustain
		noteL 5,216
		vibrato 020h
		release 01h
		note 5
		vibrato 02Ch
		ymSustain
		noteL 13,108
		vibrato 020h
		release 01h
		note 17
		mainLoopEnd
Music_9_Channel_4:
		ymStereo 040h
		vibrato 02Ch
		release 00h
		length 108
		silence
		silence
		length 54
		ymInst 62
		ymVol 00h
		noteL 12,6
		ymVol 01h
		note 12
		ymVol 02h
		note 12
		ymVol 03h
		note 12
		ymVol 04h
		note 12
		ymVol 06h
		note 12
		ymVol 08h
		note 12
		ymVol 0Ah
		note 12
		ymVol 0Ch
		note 12
		ymVol 0Dh
		noteL 12,108
		length 216
		silence
		mainLoopStart
		repeatStart
		length 54
		ymInst 62
		ymVol 00h
		noteL 12,6
		ymVol 01h
		note 12
		ymVol 02h
		note 12
		ymVol 03h
		note 12
		ymVol 04h
		note 12
		ymVol 06h
		note 12
		ymVol 08h
		note 12
		ymVol 0Ah
		note 12
		ymVol 0Ch
		note 12
		ymVol 0Dh
		noteL 12,108
		silence
		repeatSection1Start
		length 216
		repeatEnd
		repeatSection2Start
		repeatEnd
		repeatSection3Start
		length 108
		mainLoopEnd
Music_9_Channel_5:
		shifting 020h
		ymStereo 080h
		vibrato 02Ch
		release 00h
		length 111
		length 108
		silence
		length 54
		ymInst 62
		ymVol 00h
		noteL 12,6
		ymVol 01h
		note 12
		ymVol 02h
		note 12
		ymVol 03h
		note 12
		ymVol 04h
		note 12
		ymVol 06h
		note 12
		ymVol 08h
		note 12
		ymVol 0Ah
		note 12
		ymVol 0Ch
		note 12
		ymVol 0Dh
		noteL 12,108
		length 216
		silence
		mainLoopStart
		repeatStart
		length 54
		ymInst 62
		ymVol 00h
		noteL 12,6
		ymVol 01h
		note 12
		ymVol 02h
		note 12
		ymVol 03h
		note 12
		ymVol 04h
		note 12
		ymVol 06h
		note 12
		ymVol 08h
		note 12
		ymVol 0Ah
		note 12
		ymVol 0Ch
		note 12
		ymVol 0Dh
		noteL 12,108
		silence
		repeatSection1Start
		length 216
		repeatEnd
		repeatSection2Start
		repeatEnd
		repeatSection3Start
		length 108
		mainLoopEnd
Music_9_Channel_6:
		release 01h
		vibrato 04Ch
		psgInst 165
		noteL 58,12
		note 59
		note 63
		note 53
		noteL 56,6
		note 50
		noteL 58,12
		psgInst 166
		note 59
		note 63
		psgInst 167
		note 53
		note 58
		psgInst 168
		note 59
		note 63
		psgInst 169
		note 53
		noteL 56,6
		note 50
		psgInst 170
		noteL 58,12
		note 59
		psgInst 171
		note 63
		note 53
		note 58
		note 59
		note 63
		note 53
		noteL 56,6
		note 50
		noteL 58,12
		note 59
		note 63
		note 53
		note 58
		note 59
		note 63
		note 53
		noteL 56,6
		note 50
		noteL 58,12
		note 59
		note 63
		note 53
		mainLoopStart
		noteL 58,6
		note 50
		note 59
		note 52
		note 63
		note 55
		note 53
		note 49
		note 56
		note 50
		note 58
		note 52
		note 59
		note 53
		note 63
		note 58
		note 53
		note 57
		mainLoopEnd
Music_9_Channel_7:
		shifting 010h
		release 01h
		vibrato 04Ch
		psgInst 0
		length 8
		psgInst 163
		noteL 58,12
		note 59
		note 63
		note 53
		noteL 56,6
		note 50
		noteL 58,12
		psgInst 164
		note 59
		note 63
		psgInst 165
		note 53
		note 58
		psgInst 166
		note 59
		note 63
		psgInst 167
		note 53
		noteL 56,6
		note 50
		psgInst 168
		noteL 58,12
		note 59
		psgInst 169
		note 63
		note 53
		note 58
		note 59
		note 63
		note 53
		noteL 56,6
		note 50
		noteL 58,12
		note 59
		note 63
		note 53
		note 58
		note 59
		note 63
		note 53
		noteL 56,6
		note 50
		noteL 58,12
		note 59
		note 63
		note 53
		mainLoopStart
		noteL 58,6
		note 50
		note 59
		note 52
		note 63
		note 55
		note 53
		note 49
		note 56
		note 50
		note 58
		note 52
		note 59
		note 53
		note 63
		note 58
		note 53
		note 57
		mainLoopEnd
Music_9_Channel_9:
		channel_end
