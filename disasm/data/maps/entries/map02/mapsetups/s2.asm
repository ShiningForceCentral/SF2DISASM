
; ASM FILE data\maps\entries\map02\mapsetups\s2.asm :
; 0x5E938..0x5E9C8 : 
ms_map2_EntityEvents:
		msEntityEvent 128, UP, sub_5E966-ms_map2_EntityEvents
		msEntityEvent 129, UP, sub_5E970-ms_map2_EntityEvents
		msEntityEvent 130, UP, sub_5E976-ms_map2_EntityEvents
		msEntityEvent 131, UP, sub_5E97C-ms_map2_EntityEvents
		msEntityEvent 132, UP, sub_5E986-ms_map2_EntityEvents
		msEntityEvent 133, UP, sub_5E98C-ms_map2_EntityEvents
		msEntityEvent 134, UP, sub_5E99A-ms_map2_EntityEvents
		msEntityEvent 135, UP, sub_5E9A4-ms_map2_EntityEvents
		msEntityEvent 136, UP, sub_5E9B2-ms_map2_EntityEvents
		msEntityEvent 137, UP, sub_5E9C0-ms_map2_EntityEvents
		msDefaultEntityEvent 0, nullsub_154-ms_map2_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_154:
		rts

	; End of function nullsub_154


; =============== S U B R O U T I N E =======================================

sub_5E966:
		 
		txt     $DFF            ; "You're not devils, are you?{W2}"
		txt     $E00            ; "How did you get here safely?{W1}"
		rts

	; End of function sub_5E966


; =============== S U B R O U T I N E =======================================

sub_5E970:
		 
		txt     $E01            ; "I'm hungry....{W1}"
		rts

	; End of function sub_5E970


; =============== S U B R O U T I N E =======================================

sub_5E976:
		 
		txt     $E02            ; "Are you strong?  Will you{N}please kill the devils?{W1}"
		rts

	; End of function sub_5E976


; =============== S U B R O U T I N E =======================================

sub_5E97C:
		 
		txt     $E03            ; "Pacalon soldiers are so{N}proud!{W2}"
		txt     $E04            ; "But, they're just cowards{N}that hide in the castle.{W1}"
		rts

	; End of function sub_5E97C


; =============== S U B R O U T I N E =======================================

sub_5E986:
		 
		txt     $E05            ; "What will we do when we{N}lose?{W1}"
		rts

	; End of function sub_5E986


; =============== S U B R O U T I N E =======================================

sub_5E98C:
		 
		txt     $E06            ; "Do you know Geshp?{W2}"
		txt     $E07            ; "He sometimes comes here.{N}He seems so friendly.{W2}"
		txt     $E08            ; "Are all devils like him?{N}If so, I like them.{W1}"
		rts

	; End of function sub_5E98C


; =============== S U B R O U T I N E =======================================

sub_5E99A:
		 
		txt     $E09            ; "Do you think Pacalon can{N}beat the devils?{W2}"
		txt     $E0A            ; "Say yes!  Pacalon has the{N}best fighters in the world!{W1}"
		rts

	; End of function sub_5E99A


; =============== S U B R O U T I N E =======================================

sub_5E9A4:
		move.b  #$A,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5E9A4


; =============== S U B R O U T I N E =======================================

sub_5E9B2:
		move.b  #$19,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5E9B2


; =============== S U B R O U T I N E =======================================

sub_5E9C0:
		jsr     j_ChurchActions
		rts

	; End of function sub_5E9C0

