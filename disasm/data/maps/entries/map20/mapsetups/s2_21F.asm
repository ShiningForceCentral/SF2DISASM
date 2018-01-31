
; ASM FILE data\maps\entries\map20\mapsetups\s2_21F.asm :
; 0x63234..0x6329A : 
ms_map20_flag21F_EntityEvents:
		dc.b $80
		dc.b 3
		dc.w sub_63252-ms_map20_flag21F_EntityEvents
		dc.b $81
		dc.b 0
		dc.w sub_63270-ms_map20_flag21F_EntityEvents
		dc.b $82
		dc.b 1
		dc.w sub_6327E-ms_map20_flag21F_EntityEvents
		dc.b $83
		dc.b 3
		dc.w sub_63284-ms_map20_flag21F_EntityEvents
		dc.b $84
		dc.b 3
		dc.w sub_6328A-ms_map20_flag21F_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_63290-ms_map20_flag21F_EntityEvents
		dc.w $FD00
		dc.w nullsub_125-ms_map20_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_125:
		rts

	; End of function nullsub_125


; =============== S U B R O U T I N E =======================================

sub_63252:
		trap    #CHECK_FLAG
		dc.w $3D6
		bne.s   loc_63266
		trap    #TEXTBOX
		dc.w $F66               ; "{LEADER}!{W2}"
		trap    #TEXTBOX
		dc.w $F67               ; "I'm waiting for Sir Astral.{W2}"
		trap    #TEXTBOX
		dc.w $F68               ; "{LEADER}, will you go{N}see him?{W1}"
		bra.s   return_6326E
loc_63266:
		trap    #TEXTBOX
		dc.w $FAA               ; "You shouldered quite a{N}burden for the kingdom.{W2}"
		trap    #TEXTBOX
		dc.w $FAB               ; "I'll be happy if you rule{N}this kingdom with Princess{N}Elis!{W1}"
return_6326E:
		rts

	; End of function sub_63252


; =============== S U B R O U T I N E =======================================

sub_63270:
		moveq   #1,d0
		jsr     j_ClosePortraitEyes
		trap    #TEXTBOX
		dc.w $FAF               ; "Zzzzz....{W1}"
		rts

	; End of function sub_63270


; =============== S U B R O U T I N E =======================================

sub_6327E:
		trap    #TEXTBOX
		dc.w $FB0               ; "I'm splitting firewood!{N}My back hurts!{W1}"
		rts

	; End of function sub_6327E


; =============== S U B R O U T I N E =======================================

sub_63284:
		trap    #TEXTBOX
		dc.w $FB6               ; "This is the east tower.{N}I'm on watch.{W1}"
		rts

	; End of function sub_63284


; =============== S U B R O U T I N E =======================================

sub_6328A:
		trap    #TEXTBOX
		dc.w $FB7               ; "What a view!{N}Parmecia is beautiful!{W1}"
		rts

	; End of function sub_6328A


; =============== S U B R O U T I N E =======================================

sub_63290:
		trap    #TEXTBOX
		dc.w $FB8               ; "Yeeee!  Who are you!?{N}{LEADER}!{W2}"
		trap    #TEXTBOX
		dc.w $FB9               ; "I wouldn't have screamed{N}if I knew it was you.{W1}"
		rts

	; End of function sub_63290

