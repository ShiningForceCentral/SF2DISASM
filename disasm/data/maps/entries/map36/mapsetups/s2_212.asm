
; ASM FILE data\maps\entries\map36\mapsetups\s2_212.asm :
; 0x5D924..0x5D9C0 : 
ms_map36_flag212_EntityEvents:
		msEntityEvent 22, UP, sub_5D954-ms_map36_flag212_EntityEvents
		msEntityEvent 128, UP, sub_5D96A-ms_map36_flag212_EntityEvents
		msEntityEvent 129, UP, sub_5D970-ms_map36_flag212_EntityEvents
		msEntityEvent 130, UP, sub_5D97A-ms_map36_flag212_EntityEvents
		msEntityEvent 131, UP, sub_5D984-ms_map36_flag212_EntityEvents
		msEntityEvent 132, UP, sub_5D98A-ms_map36_flag212_EntityEvents
		msEntityEvent 133, UP, sub_5D99E-ms_map36_flag212_EntityEvents
		msEntityEvent 134, UP, sub_5D9A8-ms_map36_flag212_EntityEvents
		msEntityEvent 135, UP, (sub_5D8CA-ms_map36_flag212_EntityEvents) & $FFFF
		msEntityEvent 136, UP, sub_5D9B2-ms_map36_flag212_EntityEvents
		msEntityEvent 137, UP, (sub_5D91C-ms_map36_flag212_EntityEvents) & $FFFF
		msDefaultEntityEvent 0, (nullsub_140-ms_map36_flag212_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_5D954:
		 
		chkFlg $32B             ; set after Frayja asks to go to Moun with you
		bne.s   return_5D968
		lea     cs_5DA28(pc), a0
		trap    #6
		setFlg $32B             ; set after Frayja asks to go to Moun with you
		setFlg $52              ; Frayja is a follower
return_5D968:
		rts

	; End of function sub_5D954


; =============== S U B R O U T I N E =======================================

sub_5D96A:
		 
		txt $CEC                ; "Thanks to the rain, I'm fine.{W1}"
		rts

	; End of function sub_5D96A


; =============== S U B R O U T I N E =======================================

sub_5D970:
		 
		txt $CED                ; "The devils escaped when they{N}saw our soldiers. {W2}"
		txt $CEE                ; "They're such chickens!{W1}"
		rts

	; End of function sub_5D970


; =============== S U B R O U T I N E =======================================

sub_5D97A:
		 
		txt $CEF                ; "Vicar {NAME;22} wants to go{N}to Moun and save the people.{W2}"
		txt $CF0                ; "But, the devils will surge{N}into Parmecia as soon as{N}he opens the gate!{W1}"
		rts

	; End of function sub_5D97A


; =============== S U B R O U T I N E =======================================

sub_5D984:
		 
		txt $CF1                ; "I'm no longer thirsty,{N}but I'm not totally healthy{N}yet.{W1}"
		rts

	; End of function sub_5D984


; =============== S U B R O U T I N E =======================================

sub_5D98A:
		 
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_5D998      
		txt $CF2                ; "Practice!  Who needs{N}practice?!  Ha!{W2}"
		setFlg $101             ; Temporary map setup flag 01
byte_5D998:
		txt $CF3                ; "Oooh...I can't lift this{N}spear!{W1}"
		rts

	; End of function sub_5D98A


; =============== S U B R O U T I N E =======================================

sub_5D99E:
		 
		txt $CF4                ; "I just saw a warrior who{N}came from the south a year{N}ago.{W2}"
		txt $CF5                ; "He was shocked to find out{N}that the tunnel was blocked,{N}and went to Moun.{W1}"
		rts

	; End of function sub_5D99E


; =============== S U B R O U T I N E =======================================

sub_5D9A8:
		 
		txt $CF6                ; "Thank you, strangers!{N}You saved us!{W2}"
		txt $CF7                ; "But I didn't think we would{N}be saved by humans!{W1}"
		rts

	; End of function sub_5D9A8


; =============== S U B R O U T I N E =======================================

sub_5D9B2:
		 
		txt $CF8                ; "The King is a little upset.{W2}"
		txt $CF9                ; "We've always believed that{N}centaurs were the best{N}warriors.{W2}"
		txt $CFA                ; "But we were wrong.{N}I understand now.{W1}"
		rts

	; End of function sub_5D9B2

