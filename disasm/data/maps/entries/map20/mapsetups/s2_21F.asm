
; ASM FILE data\maps\entries\map20\mapsetups\s2_21F.asm :
; 0x63234..0x6329A : 
ms_map20_flag21F_EntityEvents:
		msEntityEvent 128, DOWN, sub_63252-ms_map20_flag21F_EntityEvents
		msEntityEvent 129, RIGHT, sub_63270-ms_map20_flag21F_EntityEvents
		msEntityEvent 130, UP, sub_6327E-ms_map20_flag21F_EntityEvents
		msEntityEvent 131, DOWN, sub_63284-ms_map20_flag21F_EntityEvents
		msEntityEvent 132, DOWN, sub_6328A-ms_map20_flag21F_EntityEvents
		msEntityEvent 133, DOWN, sub_63290-ms_map20_flag21F_EntityEvents
		msDefaultEntityEvent 0, nullsub_125-ms_map20_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_125:
		rts

	; End of function nullsub_125


; =============== S U B R O U T I N E =======================================

sub_63252:
		 
		chkFlg $3D6
		bne.s   byte_63266      
		txt $F66                ; "{LEADER}!{W2}"
		txt $F67                ; "I'm waiting for Sir Astral.{W2}"
		txt $F68                ; "{LEADER}, will you go{N}see him?{W1}"
		bra.s   return_6326E
byte_63266:
		txt $FAA                ; "You shouldered quite a{N}burden for the kingdom.{W2}"
		txt $FAB                ; "I'll be happy if you rule{N}this kingdom with Princess{N}Elis!{W1}"
return_6326E:
		rts

	; End of function sub_63252


; =============== S U B R O U T I N E =======================================

sub_63270:
		moveq   #1,d0
		jsr     j_ClosePortraitEyes
		txt $FAF                ; "Zzzzz....{W1}"
		rts

	; End of function sub_63270


; =============== S U B R O U T I N E =======================================

sub_6327E:
		 
		txt $FB0                ; "I'm splitting firewood!{N}My back hurts!{W1}"
		rts

	; End of function sub_6327E


; =============== S U B R O U T I N E =======================================

sub_63284:
		 
		txt $FB6                ; "This is the east tower.{N}I'm on watch.{W1}"
		rts

	; End of function sub_63284


; =============== S U B R O U T I N E =======================================

sub_6328A:
		 
		txt $FB7                ; "What a view!{N}Parmecia is beautiful!{W1}"
		rts

	; End of function sub_6328A


; =============== S U B R O U T I N E =======================================

sub_63290:
		 
		txt $FB8                ; "Yeeee!  Who are you!?{N}{LEADER}!{W2}"
		txt $FB9                ; "I wouldn't have screamed{N}if I knew it was you.{W1}"
		rts

	; End of function sub_63290

