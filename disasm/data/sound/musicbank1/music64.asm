
; ASM FILE music64.asm :
; 0xFD9E..0xFDB9 : Music 64
Music_64:       db 0
		db 0
		db 0
		db 0C8h
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
		dw Music_32_Channel_9
Music_32_Channel_9:
		channel_end
