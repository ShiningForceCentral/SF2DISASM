
; ASM FILE data\maps\entries\map19\mapsetups\s2_1FA.asm :
; 0x5301C..0x530BA : 
ms_map19_flag1FA_EntityEvents:
		msEntityEvent 129, DOWN, sub_530B4-ms_map19_flag1FA_EntityEvents
		msEntityEvent 131, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 134, DOWN, sub_53080-ms_map19_flag1FA_EntityEvents
		msEntityEvent 135, DOWN, sub_53086-ms_map19_flag1FA_EntityEvents
		msEntityEvent 136, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 137, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 138, RIGHT, sub_53094-ms_map19_flag1FA_EntityEvents
		msEntityEvent 139, RIGHT, sub_5309E-ms_map19_flag1FA_EntityEvents
		msEntityEvent 140, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 141, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 142, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 143, RIGHT, sub_530A8-ms_map19_flag1FA_EntityEvents
		msEntityEvent 144, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 145, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 146, RIGHT, sub_530AE-ms_map19_flag1FA_EntityEvents
		msEntityEvent 147, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 148, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 149, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 150, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msEntityEvent 153, RIGHT, sub_53070-ms_map19_flag1FA_EntityEvents
		msDefaultEntityEvent 0, (return_52F0A-ms_map19_flag1FA_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_53070:
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		txt $2A6                ; "Already passed away...{N}{LEADER} feels pity.{W1}"
		rts

	; End of function sub_53070


; =============== S U B R O U T I N E =======================================

sub_53080:
		 
		txt $2A7                ; "This is a nightmare.{W1}"
		rts

	; End of function sub_53080


; =============== S U B R O U T I N E =======================================

sub_53086:
		 
		txt $2A8                ; "The Galam soldiers scared{N}me.{W2}"
		txt $2A9                ; "But when Sir Astral made{N}an incantation, King Galam{N}screamed.{W2}"
		txt $2AA                ; "He ran upstairs with a{N}pained look on his face.{W1}"
		rts

	; End of function sub_53086


; =============== S U B R O U T I N E =======================================

sub_53094:
		 
		txt $2AB                ; "We Granseal soldiers{N}fought against Galam with{N}all our strength.{W2}"
		txt $2AC                ; "But we were powerless{N}against King Galam's magic.{W1}"
		rts

	; End of function sub_53094


; =============== S U B R O U T I N E =======================================

sub_5309E:
		 
		txt $2AD                ; "What King Galam said was{N}wrong!{W2}"
		txt $2AE                ; "We did not attack Galam!{W1}"
		rts

	; End of function sub_5309E


; =============== S U B R O U T I N E =======================================

sub_530A8:
		 
		txt $2AF                ; "Nobody knew that King Galam{N}was a wizard!{W1}"
		rts

	; End of function sub_530A8


; =============== S U B R O U T I N E =======================================

sub_530AE:
		 
		txt $2B0                ; "Why are we at war?{W1}"
		rts

	; End of function sub_530AE


; =============== S U B R O U T I N E =======================================

sub_530B4:
		 
		txt $2B1                ; "The Princess was taken{N}away...and I'm paralyzed{N}with fear.{W1}"
		rts

	; End of function sub_530B4

