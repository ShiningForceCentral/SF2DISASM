
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
		 
		txt $896                ; "Guooooorrrr!{W1}"
		rts

	; End of function sub_53850


; =============== S U B R O U T I N E =======================================

sub_53856:
		 
		txt $250                ; "Let me pass!{N}I must see my father!{W1}"
		rts

	; End of function sub_53856


; =============== S U B R O U T I N E =======================================

sub_5385C:
		 
		script  cs_53C42
		rts

	; End of function sub_5385C


; =============== S U B R O U T I N E =======================================

sub_53864:
		 
		chkFlg $103             ; Temporary map setup flag 03
		bne.s   byte_53872      
		txt $251                ; "I saw a devil enter the{N}King's body...{W2}"
		setFlg $103             ; Temporary map setup flag 03
byte_53872:
		txt $252                ; "and the King became{N}violent!{W1}"
		rts

	; End of function sub_53864


; =============== S U B R O U T I N E =======================================

sub_53878:
		 
		chkFlg $104             ; Temporary map setup flag 04
		bne.s   byte_53886      
		txt $253                ; "Hurry to the Princess's{N}bedroom!  Hold the King{N}down!{W1}"
		setFlg $104             ; Temporary map setup flag 04
byte_53886:
		txt $254                ; "The King knocked down{N}the Princess....{W1}"
		rts

	; End of function sub_53878


; =============== S U B R O U T I N E =======================================

sub_5388C:
		 
		chkFlg $105             ; Temporary map setup flag 05
		bne.s   byte_5389A      
		txt $24C                ; "Ooo, ouch!{N}I didn't think he could{N}be so strong!{W2}"
		setFlg $105             ; Temporary map setup flag 05
byte_5389A:
		txt $24D                ; "Ouch!  I was knocked down!{W1}"
		rts

	; End of function sub_5388C


; =============== S U B R O U T I N E =======================================

sub_538A0:
		 
		chkFlg $106             ; Temporary map setup flag 06
		bne.s   byte_538AE      
		txt $24E                ; "Princess Elis!{N}I can't let you up there.{W2}"
		setFlg $106             ; Temporary map setup flag 06
byte_538AE:
		txt $24F                ; "Trust Sir Astral!{N}He knows how to cure{N}the King!{W1}"
		rts

	; End of function sub_538A0

