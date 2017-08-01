
; ASM FILE data\maps\entries\map20\mapsetups\s2_261.asm :
; 0x538B4..0x53928 : 
ms_map20_flag261_EntityEvents:
		dc.b $80
		dc.b 0
		dc.w sub_538D4-ms_map20_flag261_EntityEvents
		dc.b $81
		dc.b 3
		dc.w sub_538DA-ms_map20_flag261_EntityEvents
		dc.b $82
		dc.b 3
		dc.w sub_538EE-ms_map20_flag261_EntityEvents
		dc.b $84
		dc.b 3
		dc.w sub_53916-ms_map20_flag261_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_53902-ms_map20_flag261_EntityEvents
		dc.b $86
		dc.b 3
		dc.w sub_5391C-ms_map20_flag261_EntityEvents
		dc.b $87
		dc.b 3
		dc.w sub_53922-ms_map20_flag261_EntityEvents
		dc.w $FD00
		dc.w (return_53814-ms_map20_flag261_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_538D4:
		trap    #TEXTBOX
		dc.w $256               ; "Sir Astral is sleeping{N}in the King's bedroom.{N}Don't worry!{W1}"
		rts

	; End of function sub_538D4


; =============== S U B R O U T I N E =======================================

sub_538DA:
		trap    #CHECK_FLAG
		dc.w $101
		bne.s   loc_538E8
		trap    #TEXTBOX
		dc.w $259               ; "Thank you, {LEADER}.{N}You've saved the King's{N}life.{W2}{N}I heard that you are going{N}to Yeel.{W2}{N}I'll take care of Sir Astral{N}for you.{W2}"
		trap    #SET_FLAG
		dc.w $101
loc_538E8:
		trap    #TEXTBOX
		dc.w $25A               ; "Please be careful.{W1}"
		rts

	; End of function sub_538DA


; =============== S U B R O U T I N E =======================================

sub_538EE:
		trap    #CHECK_FLAG
		dc.w $102
		bne.s   loc_538FC
		trap    #TEXTBOX
		dc.w $25B               ; "Are you going to see{N}Mr. Hawel?{W2}"
		trap    #SET_FLAG
		dc.w $102
loc_538FC:
		trap    #TEXTBOX
		dc.w $25C               ; "I wouldn't let you go alone{N}if I weren't...{W2}{N}I trust you, son.{W1}"
		rts

	; End of function sub_538EE


; =============== S U B R O U T I N E =======================================

sub_53902:
		trap    #CHECK_FLAG
		dc.w $104
		bne.s   loc_53910
		trap    #TEXTBOX
		dc.w $25D               ; "Princess Elis has not rested{N}since the King collapsed.{W2}"
		trap    #SET_FLAG
		dc.w $104
loc_53910:
		trap    #TEXTBOX
		dc.w $25E               ; "I understand her reasoning,{N}but she might get sick, too.{W1}"
		rts

	; End of function sub_53902


; =============== S U B R O U T I N E =======================================

sub_53916:
		trap    #TEXTBOX
		dc.w $236               ; "This east tower was built{N}in order to watch for{N}invaders.{W1}"
		rts

	; End of function sub_53916


; =============== S U B R O U T I N E =======================================

sub_5391C:
		trap    #TEXTBOX
		dc.w $25F               ; "She has been shrivering like{N}this since she came back{N}from the King's room.{W2}{N}She won't work.{W1}"
		rts

	; End of function sub_5391C


; =============== S U B R O U T I N E =======================================

sub_53922:
		trap    #TEXTBOX
		dc.w $260               ; "I...I've never seen such a{N}horrible face....{W2}{N}I can't tell anybody.{N}They wouldn't believe me.{W1}"
		rts

	; End of function sub_53922

