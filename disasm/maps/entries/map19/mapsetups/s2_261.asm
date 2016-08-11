
; SCRIPT SECTION maps\entries\map19\mapsetups\s2_261 :
; 
ms_map19_flag261_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_52FC8-ms_map19_flag261_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_52FCE-ms_map19_flag261_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_52FEE-ms_map19_flag261_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_52E4E+$10000-ms_map19_flag261_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_52FE8-ms_map19_flag261_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_52E62+$10000-ms_map19_flag261_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_52FE2-ms_map19_flag261_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_52FF4-ms_map19_flag261_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_52FFA-ms_map19_flag261_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_53000-ms_map19_flag261_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_53006-ms_map19_flag261_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_5300C-ms_map19_flag261_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_53016-ms_map19_flag261_EntityEvents
										dc.w $FD00
										dc.w return_52F0A+$10000-ms_map19_flag261_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52FC8:
										
										trap    #TRAP_TEXTBOX
										dc.w $261               ; "Very few people know{N}about the sickness, even{N}in the castle.{W2}{N}Know what I mean?{W1}"
										rts

	; End of function sub_52FC8


; =============== S U B R O U T I N E =======================================

sub_52FCE:
										
										trap    #1
										dc.w $101
										bne.s   loc_52FDC
										trap    #TRAP_TEXTBOX
										dc.w $262               ; "Sir Astral is sleeping in{N}the King's bedroom.{W2}{N}He needs some more rest{N}because he is so old.{W2}"
										trap    #2
										dc.w $101
loc_52FDC:
										
										trap    #TRAP_TEXTBOX
										dc.w $263               ; "Why don't you see him{N}before you leave?{N}He would be pleased.{W1}"
										rts

	; End of function sub_52FCE


; =============== S U B R O U T I N E =======================================

sub_52FE2:
										
										trap    #TRAP_TEXTBOX
										dc.w $264               ; "I have not seen{N}Princess Elis today.{N}Is she OK?{W1}"
										rts

	; End of function sub_52FE2


; =============== S U B R O U T I N E =======================================

sub_52FE8:
										
										trap    #TRAP_TEXTBOX
										dc.w $265               ; "Darn!{N}I can't sleep!{N}He keeps snoring!{W1}"
										rts

	; End of function sub_52FE8


; =============== S U B R O U T I N E =======================================

sub_52FEE:
										
										trap    #TRAP_TEXTBOX
										dc.w $266               ; "The Galam messenger just{N}went back to his country.{N}He looked so pale.{W2}{N}I hope he gets to Galam{N}safely?{W1}"
										rts

	; End of function sub_52FEE


; =============== S U B R O U T I N E =======================================

sub_52FF4:
										
										trap    #TRAP_TEXTBOX
										dc.w $267               ; "Breakfast is over and now{N}I have to make lunch!{N}Busy, busy!{W1}"
										rts

	; End of function sub_52FF4


; =============== S U B R O U T I N E =======================================

sub_52FFA:
										
										trap    #TRAP_TEXTBOX
										dc.w $268               ; "The messenger from Galam{N}has left.{W2}{N}He was in such hurry.{W1}"
										rts

	; End of function sub_52FFA


; =============== S U B R O U T I N E =======================================

sub_53000:
										
										trap    #TRAP_TEXTBOX
										dc.w $269               ; "Yeel?  Yes, it's a small{N}village near the mountains.{N}Travel northwest to get there.{W1}"
										rts

	; End of function sub_53000


; =============== S U B R O U T I N E =======================================

sub_53006:
										
										trap    #TRAP_TEXTBOX
										dc.w $2F7               ; "You are the pupils of{N}Sir Astral.  We are counting{N}on you.{W2}{N}Good luck.{W1}"
										rts

	; End of function sub_53006


; =============== S U B R O U T I N E =======================================

sub_5300C:
										
										trap    #TRAP_TEXTBOX
										dc.w $257               ; "The Ancient Tower was{N}originally called{N}Ground Seal.{W2}{N}Our kingdom seems to have{N}been named after it.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $258               ; "Why?  I don't know why.{N}It was already there when{N}our ancestors settled here.{W1}"
										rts

	; End of function sub_5300C


; =============== S U B R O U T I N E =======================================

sub_53016:
										
										trap    #TRAP_TEXTBOX
										dc.w $2F6               ; "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
										rts

	; End of function sub_53016

