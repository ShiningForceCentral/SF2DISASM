
; ASM FILE music21.asm :
; 0xF0D8..0xF243 : Music 21
Music_21:       db 0
		db 1
		db 0
		db 0D1h
		dw Music_21_Channel_0
		dw Music_21_Channel_1
		dw Music_21_Channel_2
		dw Music_21_Channel_3
		dw Music_21_Channel_4
		dw Music_21_Channel_5
		dw Music_21_Channel_6
		dw Music_21_Channel_7
		dw Music_21_Channel_9
		dw Music_21_Channel_9
Music_21_Channel_0:
		length 6
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		ymInst 15
		ymVol 0Bh
		noteL 20,90
		ymInst 26
		ymVol 0Ch
		noteL 13,12
		note 15
		note 17
		note 19
		ymVol 0Bh
		ymSustain
		noteL 20,48
		ymVol 09h
		vibrato 020h
		noteL 20,196
		release 01h
		noteL 20,192
		length 12
		channel_end
Music_21_Channel_1:
		length 6
		ymStereo 0C0h
		ymInst 15
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 34,90
		ymInst 26
		ymVol 0Dh
		noteL 44,48
		noteL 41,12
		note 43
		note 44
		noteL 48,14
		ymVol 09h
		ymSustain
		noteL 48,194
		vibrato 020h
		release 01h
		noteL 48,192
		length 12
		channel_end
Music_21_Channel_2:
		length 6
		ymStereo 0C0h
		ymInst 15
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 27,90
		ymInst 26
		ymVol 0Ch
		noteL 37,72
		noteL 39,26
		ymVol 09h
		ymSustain
		noteL 39,194
		vibrato 020h
		release 01h
		noteL 39,192
		length 12
		channel_end
Music_21_Channel_3:
		length 6
		ymStereo 0C0h
		ymInst 15
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 25,90
		ymInst 26
		ymVol 0Ch
		noteL 27,48
		length 24
		noteL 29,26
		ymInst 13
		ymVol 0Ah
		note 46
		ymVol 09h
		ymSustain
		noteL 44,24
		ymVol 07h
		vibrato 020h
		noteL 44,144
		release 01h
		noteL 44,192
		length 12
		channel_end
Music_21_Channel_4:
		ymStereo 0C0h
		release 01h
		vibrato 02Ch
		length 194
		ymInst 13
		ymVol 0Ch
		noteL 50,26
		ymVol 0Bh
		ymSustain
		noteL 51,24
		ymVol 09h
		vibrato 020h
		noteL 51,144
		release 01h
		noteL 51,192
		length 12
		channel_end
Music_21_Channel_5:
		shifting 020h
		length 12
		ymStereo 080h
		ymInst 15
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		noteL 34,90
		ymStereo 040h
		ymInst 26
		ymVol 0Ch
		noteL 44,48
		noteL 41,12
		note 43
		note 44
		noteL 48,14
		ymStereo 080h
		ymInst 13
		ymVol 0Bh
		noteL 50,26
		ymVol 0Ah
		ymSustain
		noteL 51,24
		ymVol 08h
		vibrato 020h
		noteL 51,144
		release 01h
		noteL 51,186
		length 12
		channel_end
Music_21_Channel_6:
		release 01h
		vibrato 059h
		psgInst 0
		length 220
		psgInst 125
		noteL 55,24
		note 56
		note 63
		note 62
		note 58
		noteL 60,36
		noteL 67,12
		vibrato 05Fh
		noteL 65,192
		length 6
		psgInst 0
		silence
		channel_end
Music_21_Channel_7:
		shifting 010h
		release 01h
		vibrato 059h
		psgInst 0
		length 232
		psgInst 123
		noteL 55,24
		note 56
		note 63
		note 62
		note 58
		noteL 60,36
		noteL 67,12
		vibrato 05Fh
		noteL 65,180
		length 6
		psgInst 0
		silence
		channel_end
Music_21_Channel_9:
		channel_end
