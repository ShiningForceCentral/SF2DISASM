
; ASM FILE music26.asm :
; 0xF803..0xF919 : Music 26
Music_26:       db 0
		db 1
		db 0
		db 0C3h
		dw Music_26_Channel_0
		dw Music_26_Channel_1
		dw Music_26_Channel_2
		dw Music_26_Channel_3
		dw Music_26_Channel_4
		dw Music_26_Channel_5
		dw Music_26_Channel_6
		dw Music_26_Channel_7
		dw Music_26_Channel_9
		dw Music_26_Channel_9
Music_26_Channel_0:
		ymStereo 0C0h
		ymInst 13
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 39,6
		ymVol 08h
		note 39
		ymVol 0Bh
		note 33
		ymVol 08h
		note 33
		ymVol 05h
		note 33
		ymVol 0Bh
		note 37
		ymVol 08h
		note 37
		ymVol 05h
		note 37
		ymVol 0Bh
		note 32
		ymVol 08h
		note 32
		length 24
		channel_end
Music_26_Channel_1:
		ymStereo 0C0h
		ymInst 20
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 41,6
		release 02h
		note 42
		note 42
		note 42
		note 42
		release 01h
		note 45
		note 46
		ymVol 08h
		note 46
		ymVol 0Bh
		note 52
		ymVol 08h
		note 52
		length 24
		channel_end
Music_26_Channel_2:
		ymStereo 0C0h
		ymInst 13
		ymVol 0Bh
		release 01h
		vibrato 02Ch
		noteL 40,6
		ymVol 08h
		note 40
		length 18
		ymVol 0Bh
		noteL 39,6
		ymVol 08h
		note 39
		ymVol 05h
		note 39
		ymVol 0Bh
		note 41
		ymVol 08h
		note 41
		length 24
		channel_end
Music_26_Channel_3:
		length 6
		shifting 020h
		ymStereo 0C0h
		ymInst 20
		ymVol 09h
		release 01h
		vibrato 02Ch
		note 41
		release 02h
		note 42
		note 42
		note 42
		note 42
		release 01h
		note 45
		note 46
		ymVol 06h
		note 46
		ymVol 09h
		note 52
		ymVol 06h
		note 52
		length 18
		channel_end
Music_26_Channel_4:
		shifting 020h
		length 6
		ymStereo 040h
		ymInst 13
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		note 40
		ymVol 07h
		note 40
		length 18
		ymVol 0Ah
		noteL 39,6
		ymVol 07h
		note 39
		ymVol 04h
		note 39
		ymVol 0Ah
		note 41
		ymVol 07h
		note 41
		length 18
		channel_end
Music_26_Channel_5:
		ymStereo 080h
		length 6
		shifting 020h
		ymInst 13
		ymVol 0Ah
		release 01h
		vibrato 02Ch
		note 39
		ymVol 07h
		note 39
		ymVol 0Ah
		note 33
		ymVol 07h
		note 33
		ymVol 04h
		note 33
		ymVol 0Ah
		note 37
		ymVol 07h
		note 37
		ymVol 04h
		note 37
		ymVol 0Ah
		note 32
		ymVol 07h
		note 32
		length 18
		channel_end
Music_26_Channel_6:
		channel_end
Music_26_Channel_7:
		channel_end
Music_26_Channel_9:
		channel_end
