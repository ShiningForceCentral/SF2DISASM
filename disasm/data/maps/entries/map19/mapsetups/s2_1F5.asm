
; ASM FILE data\maps\entries\map19\mapsetups\s2_1F5.asm :
; 0x52F60..0x52F90 : 
ms_map19_flag1F5_EntityEvents:
		msEntityEvent 128, UP, sub_52F70-ms_map19_flag1F5_EntityEvents
		msEntityEvent 129, DOWN, sub_52F84-ms_map19_flag1F5_EntityEvents
		msEntityEvent 130, DOWN, sub_52F8A-ms_map19_flag1F5_EntityEvents
		msDefaultEntityEvent 0, (return_52F0A-ms_map19_flag1F5_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_52F70:
		trap    #CHECK_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
		bne.s   loc_52F7E
		trap    #TEXTBOX
		dc.w $249               ; "Well, boy.  Did you hear a{N}strange noise?{W2}"
		trap    #SET_FLAG
		btst    d0,d0           ; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_52F7E:
		trap    #TEXTBOX
		dc.w $24A               ; "I don't know why, but{N}everybody ignores my{N}questions....{W1}"
		rts

	; End of function sub_52F70


; =============== S U B R O U T I N E =======================================

sub_52F84:
		trap    #TEXTBOX
		dc.w $247               ; "The Minister ordered me{N}to stand here.{N}What's happening upstairs?{W1}"
		rts

	; End of function sub_52F84


; =============== S U B R O U T I N E =======================================

sub_52F8A:
		trap    #TEXTBOX
		dc.w $248               ; "By the Minister's order,{N}I cannot let you pass.{N}Sorry!{W1}"
		rts

	; End of function sub_52F8A

