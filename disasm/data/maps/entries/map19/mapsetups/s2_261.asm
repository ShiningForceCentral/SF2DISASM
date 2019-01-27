
; ASM FILE data\maps\entries\map19\mapsetups\s2_261.asm :
; 0x52F90..0x5301C : 
ms_map19_flag261_EntityEvents:
		msEntityEvent 128, DOWN, sub_52FC8-ms_map19_flag261_EntityEvents
		msEntityEvent 129, DOWN, sub_52FCE-ms_map19_flag261_EntityEvents
		msEntityEvent 130, DOWN, sub_52FEE-ms_map19_flag261_EntityEvents
		msEntityEvent 131, DOWN, (sub_52E4E-ms_map19_flag261_EntityEvents) & $FFFF
		msEntityEvent 133, UP, sub_52FE8-ms_map19_flag261_EntityEvents
		msEntityEvent 132, UP, (sub_52E62-ms_map19_flag261_EntityEvents) & $FFFF
		msEntityEvent 134, RIGHT, sub_52FE2-ms_map19_flag261_EntityEvents
		msEntityEvent 135, UP, sub_52FF4-ms_map19_flag261_EntityEvents
		msEntityEvent 136, DOWN, sub_52FFA-ms_map19_flag261_EntityEvents
		msEntityEvent 137, UP, sub_53000-ms_map19_flag261_EntityEvents
		msEntityEvent 138, DOWN, sub_53006-ms_map19_flag261_EntityEvents
		msEntityEvent 139, UP, sub_5300C-ms_map19_flag261_EntityEvents
		msEntityEvent 140, UP, sub_53016-ms_map19_flag261_EntityEvents
		msDefaultEntityEvent 0, (return_52F0A-ms_map19_flag261_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_52FC8:
		 
		txt     $261            ; "Very few people know{N}about the sickness, even{N}in the castle.{W2}{N}Know what I mean?{W1}"
		rts

	; End of function sub_52FC8


; =============== S U B R O U T I N E =======================================

sub_52FCE:
		 
		chkFlg  $101            ; Temporary map setup flag 01
		bne.s   byte_52FDC      
		txt     $262            ; "Sir Astral is sleeping in{N}the King's bedroom.{W2}{N}He needs some more rest{N}because he is so old.{W2}"
		setFlg  $101            ; Temporary map setup flag 01
byte_52FDC:
		txt     $263            ; "Why don't you see him{N}before you leave?{N}He would be pleased.{W1}"
		rts

	; End of function sub_52FCE


; =============== S U B R O U T I N E =======================================

sub_52FE2:
		 
		txt     $264            ; "I have not seen{N}Princess Elis today.{N}Is she OK?{W1}"
		rts

	; End of function sub_52FE2


; =============== S U B R O U T I N E =======================================

sub_52FE8:
		 
		txt     $265            ; "Darn!{N}I can't sleep!{N}He keeps snoring!{W1}"
		rts

	; End of function sub_52FE8


; =============== S U B R O U T I N E =======================================

sub_52FEE:
		 
		txt     $266            ; "The Galam messenger just{N}went back to his country.{N}He looked so pale.{W2}{N}I hope he gets to Galam{N}safely?{W1}"
		rts

	; End of function sub_52FEE


; =============== S U B R O U T I N E =======================================

sub_52FF4:
		 
		txt     $267            ; "Breakfast is over and now{N}I have to make lunch!{N}Busy, busy!{W1}"
		rts

	; End of function sub_52FF4


; =============== S U B R O U T I N E =======================================

sub_52FFA:
		 
		txt     $268            ; "The messenger from Galam{N}has left.{W2}{N}He was in such hurry.{W1}"
		rts

	; End of function sub_52FFA


; =============== S U B R O U T I N E =======================================

sub_53000:
		 
		txt     $269            ; "Yeel?  Yes, it's a small{N}village near the mountains.{N}Travel northwest to get there.{W1}"
		rts

	; End of function sub_53000


; =============== S U B R O U T I N E =======================================

sub_53006:
		 
		txt     $2F7            ; "You are the pupils of{N}Sir Astral.  We are counting{N}on you.{W2}{N}Good luck.{W1}"
		rts

	; End of function sub_53006


; =============== S U B R O U T I N E =======================================

sub_5300C:
		 
		txt     $257            ; "The Ancient Tower was{N}originally called{N}Ground Seal.{W2}{N}Our kingdom seems to have{N}been named after it.{W2}"
		txt     $258            ; "Why?  I don't know why.{N}It was already there when{N}our ancestors settled here.{W1}"
		rts

	; End of function sub_5300C


; =============== S U B R O U T I N E =======================================

sub_53016:
		 
		txt     $2F6            ; "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
		rts

	; End of function sub_53016

