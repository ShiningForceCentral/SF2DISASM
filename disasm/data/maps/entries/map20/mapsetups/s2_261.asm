
; ASM FILE data\maps\entries\map20\mapsetups\s2_261.asm :
; 0x538B4..0x53928 : 
ms_map20_flag261_EntityEvents:
		msEntityEvent 128, RIGHT, sub_538D4-ms_map20_flag261_EntityEvents
		msEntityEvent 129, DOWN, sub_538DA-ms_map20_flag261_EntityEvents
		msEntityEvent 130, DOWN, sub_538EE-ms_map20_flag261_EntityEvents
		msEntityEvent 132, DOWN, sub_53916-ms_map20_flag261_EntityEvents
		msEntityEvent 133, DOWN, sub_53902-ms_map20_flag261_EntityEvents
		msEntityEvent 134, DOWN, sub_5391C-ms_map20_flag261_EntityEvents
		msEntityEvent 135, DOWN, sub_53922-ms_map20_flag261_EntityEvents
		msDefaultEntityEvent 0, (return_53814-ms_map20_flag261_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_538D4:
		 
		txt $256                ; "Sir Astral is sleeping{N}in the King's bedroom.{N}Don't worry!{W1}"
		rts

	; End of function sub_538D4


; =============== S U B R O U T I N E =======================================

sub_538DA:
		 
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_538E8      
		txt $259                ; "Thank you, {LEADER}.{N}You've saved the King's{N}life.{W2}{N}I heard that you are going{N}to Yeel.{W2}{N}I'll take care of Sir Astral{N}for you.{W2}"
		setFlg $101             ; Temporary map setup flag 01
byte_538E8:
		txt $25A                ; "Please be careful.{W1}"
		rts

	; End of function sub_538DA


; =============== S U B R O U T I N E =======================================

sub_538EE:
		 
		chkFlg $102             ; Temporary map setup flag 02
		bne.s   byte_538FC      
		txt $25B                ; "Are you going to see{N}Mr. Hawel?{W2}"
		setFlg $102             ; Temporary map setup flag 02
byte_538FC:
		txt $25C                ; "I wouldn't let you go alone{N}if I weren't...{W2}{N}I trust you, son.{W1}"
		rts

	; End of function sub_538EE


; =============== S U B R O U T I N E =======================================

sub_53902:
		 
		chkFlg $104             ; Temporary map setup flag 04
		bne.s   byte_53910      
		txt $25D                ; "Princess Elis has not rested{N}since the King collapsed.{W2}"
		setFlg $104             ; Temporary map setup flag 04
byte_53910:
		txt $25E                ; "I understand her reasoning,{N}but she might get sick, too.{W1}"
		rts

	; End of function sub_53902


; =============== S U B R O U T I N E =======================================

sub_53916:
		 
		txt $236                ; "This east tower was built{N}in order to watch for{N}invaders.{W1}"
		rts

	; End of function sub_53916


; =============== S U B R O U T I N E =======================================

sub_5391C:
		 
		txt $25F                ; "She has been shrivering like{N}this since she came back{N}from the King's room.{W2}{N}She won't work.{W1}"
		rts

	; End of function sub_5391C


; =============== S U B R O U T I N E =======================================

sub_53922:
		 
		txt $260                ; "I...I've never seen such a{N}horrible face....{W2}{N}I can't tell anybody.{N}They wouldn't believe me.{W1}"
		rts

	; End of function sub_53922

