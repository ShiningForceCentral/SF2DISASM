
; ASM FILE data\maps\entries\map20\mapsetups\s2_1F5.asm :
; 0x53830..0x538B4 : 
ms_map20_flag1F5_EntityEvents:
		msEntityEvent 128, RIGHT, sub_53850-ms_map20_flag1F5_EntityEvents
		msEntityEvent 129, RIGHT, sub_53856-ms_map20_flag1F5_EntityEvents
		msEntityEvent 130, DOWN, sub_5385C-ms_map20_flag1F5_EntityEvents
		msEntityEvent 131, DOWN, sub_53864-ms_map20_flag1F5_EntityEvents
		msEntityEvent 132, DOWN, sub_53878-ms_map20_flag1F5_EntityEvents
		msEntityEvent 133, DOWN, sub_5388C-ms_map20_flag1F5_EntityEvents
		msEntityEvent 134, RIGHT, sub_538A0-ms_map20_flag1F5_EntityEvents
		msDefaultEntityEvent 0, (return_53814-ms_map20_flag1F5_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_53850:
		trap    #TEXTBOX
		dc.w $896               ; "Guooooorrrr!{W1}"
		rts

	; End of function sub_53850


; =============== S U B R O U T I N E =======================================

sub_53856:
		trap    #TEXTBOX
		dc.w $250               ; "Let me pass!{N}I must see my father!{W1}"
		rts

	; End of function sub_53856


; =============== S U B R O U T I N E =======================================

sub_5385C:
		lea     cs_53C42(pc), a0
		trap    #6
		rts

	; End of function sub_5385C


; =============== S U B R O U T I N E =======================================

sub_53864:
		trap    #CHECK_FLAG
		dc.w $103
		bne.s   loc_53872
		trap    #TEXTBOX
		dc.w $251               ; "I saw a devil enter the{N}King's body...{W2}"
		trap    #SET_FLAG
		dc.w $103
loc_53872:
		trap    #TEXTBOX
		dc.w $252               ; "and the King became{N}violent!{W1}"
		rts

	; End of function sub_53864


; =============== S U B R O U T I N E =======================================

sub_53878:
		trap    #CHECK_FLAG
		dc.w $104
		bne.s   loc_53886
		trap    #TEXTBOX
		dc.w $253               ; "Hurry to the Princess's{N}bedroom!  Hold the King{N}down!{W1}"
		trap    #SET_FLAG
		dc.w $104
loc_53886:
		trap    #TEXTBOX
		dc.w $254               ; "The King knocked down{N}the Princess....{W1}"
		rts

	; End of function sub_53878


; =============== S U B R O U T I N E =======================================

sub_5388C:
		trap    #CHECK_FLAG
		dc.w $105
		bne.s   loc_5389A
		trap    #TEXTBOX
		dc.w $24C               ; "Ooo, ouch!{N}I didn't think he could{N}be so strong!{W2}"
		trap    #SET_FLAG
		dc.w $105
loc_5389A:
		trap    #TEXTBOX
		dc.w $24D               ; "Ouch!  I was knocked down!{W1}"
		rts

	; End of function sub_5388C


; =============== S U B R O U T I N E =======================================

sub_538A0:
		trap    #CHECK_FLAG
		dc.w $106
		bne.s   loc_538AE
		trap    #TEXTBOX
		dc.w $24E               ; "Princess Elis!{N}I can't let you up there.{W2}"
		trap    #SET_FLAG
		dc.w $106
loc_538AE:
		trap    #TEXTBOX
		dc.w $24F               ; "Trust Sir Astral!{N}He knows how to cure{N}the King!{W1}"
		rts

	; End of function sub_538A0

