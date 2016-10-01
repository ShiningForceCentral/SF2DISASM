
; SCRIPT SECTION maps\entries\map36\mapsetups\s2_212 :
; 
ms_map36_flag212_EntityEvents:
										dc.b $16
										dc.b 1
										dc.w sub_5D954-ms_map36_flag212_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_5D96A-ms_map36_flag212_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5D970-ms_map36_flag212_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5D97A-ms_map36_flag212_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5D984-ms_map36_flag212_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5D98A-ms_map36_flag212_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5D99E-ms_map36_flag212_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5D9A8-ms_map36_flag212_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5D8CA+$10000-ms_map36_flag212_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5D9B2-ms_map36_flag212_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_5D91C+$10000-ms_map36_flag212_EntityEvents
										dc.w $FD00
										dc.w nullsub_140+$10000-ms_map36_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5D954:
										
										trap    #TRAP_CHECKFLAG
										dc.w $32B
										bne.s   return_5D968
										lea     cs_5DA28(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $32B               ; set after Frayja asks to go to Moun with you
										trap    #TRAP_SETFLAG
										dc.w $52                ; Frayja is a follower
return_5D968:
										
										rts

	; End of function sub_5D954


; =============== S U B R O U T I N E =======================================

sub_5D96A:
										
										trap    #TRAP_TEXTBOX
										dc.w $CEC               ; "Thanks to the rain, I'm fine.{W1}"
										rts

	; End of function sub_5D96A


; =============== S U B R O U T I N E =======================================

sub_5D970:
										
										trap    #TRAP_TEXTBOX
										dc.w $CED               ; "The devils escaped when they{N}saw our soldiers. {W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CEE               ; "They're such chickens!{W1}"
										rts

	; End of function sub_5D970


; =============== S U B R O U T I N E =======================================

sub_5D97A:
										
										trap    #TRAP_TEXTBOX
										dc.w $CEF               ; "Vicar {NAME;22} wants to go{N}to Moun and save the people.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CF0               ; "But, the devils will surge{N}into Parmecia as soon as{N}he opens the gate!{W1}"
										rts

	; End of function sub_5D97A


; =============== S U B R O U T I N E =======================================

sub_5D984:
										
										trap    #TRAP_TEXTBOX
										dc.w $CF1               ; "I'm no longer thirsty,{N}but I'm not totally healthy{N}yet.{W1}"
										rts

	; End of function sub_5D984


; =============== S U B R O U T I N E =======================================

sub_5D98A:
										
										trap    #TRAP_CHECKFLAG
										dc.w $101
										bne.s   loc_5D998
										trap    #TRAP_TEXTBOX
										dc.w $CF2               ; "Practice!  Who needs{N}practice?!  Ha!{W2}"
										trap    #TRAP_SETFLAG
										dc.w $101
loc_5D998:
										
										trap    #TRAP_TEXTBOX
										dc.w $CF3               ; "Oooh...I can't lift this{N}spear!{W1}"
										rts

	; End of function sub_5D98A


; =============== S U B R O U T I N E =======================================

sub_5D99E:
										
										trap    #TRAP_TEXTBOX
										dc.w $CF4               ; "I just saw a warrior who{N}came from the south a year{N}ago.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CF5               ; "He was shocked to find out{N}that the tunnel was blocked,{N}and went to Moun.{W1}"
										rts

	; End of function sub_5D99E


; =============== S U B R O U T I N E =======================================

sub_5D9A8:
										
										trap    #TRAP_TEXTBOX
										dc.w $CF6               ; "Thank you, strangers!{N}You saved us!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CF7               ; "But I didn't think we would{N}be saved by humans!{W1}"
										rts

	; End of function sub_5D9A8


; =============== S U B R O U T I N E =======================================

sub_5D9B2:
										
										trap    #TRAP_TEXTBOX
										dc.w $CF8               ; "The King is a little upset.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CF9               ; "We've always believed that{N}centaurs were the best{N}warriors.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CFA               ; "But we were wrong.{N}I understand now.{W1}"
										rts

	; End of function sub_5D9B2

