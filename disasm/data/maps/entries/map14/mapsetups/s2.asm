
; ASM FILE data\maps\entries\map14\mapsetups\s2.asm :
; 0x58EBA..0x58F0E : 
ms_map14_EntityEvents:
		msEntityEvent 1, UP, sub_58EDE-ms_map14_EntityEvents
		msEntityEvent 2, RIGHT, sub_58EE4-ms_map14_EntityEvents
		msEntityEvent 4, UP, sub_58EEA-ms_map14_EntityEvents
		msEntityEvent 5, UP, sub_58EF0-ms_map14_EntityEvents
		msEntityEvent 6, UP, sub_58EF6-ms_map14_EntityEvents
		msEntityEvent 128, UP, sub_58EFC-ms_map14_EntityEvents
		msEntityEvent 129, DOWN, sub_58F02-ms_map14_EntityEvents
		msEntityEvent 130, UP, sub_58F08-ms_map14_EntityEvents
		msDefaultEntityEvent 0, entevdft_58EE2-ms_map14_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_58EDE:
		 
		txt     $8CD            ; "That's OK.  {NAME;3} needed{N}a bath anyway.{W1}"
entevdft_58EE2:
		
		rts

	; End of function sub_58EDE


; =============== S U B R O U T I N E =======================================

sub_58EE4:
		 
		txt     $8CF            ; "I can't talk now!{N}I'm working!{W1}"
		rts

	; End of function sub_58EE4


; =============== S U B R O U T I N E =======================================

sub_58EEA:
		 
		txt     $8CE            ; "{LEADER}, bring that plank{N}above deck.{W1}"
		rts

	; End of function sub_58EEA


; =============== S U B R O U T I N E =======================================

sub_58EF0:
		 
		txt     $8D0            ; "Boy, I sure hope {NAME;3}{N}can swim....{W1}"
		rts

	; End of function sub_58EF0


; =============== S U B R O U T I N E =======================================

sub_58EF6:
		 
		txt     $8D1            ; "What can I do to help?{W1}"
		rts

	; End of function sub_58EF6


; =============== S U B R O U T I N E =======================================

sub_58EFC:
		 
		txt     $8D2            ; "Our home town will be{N}reborn!{W1}"
		rts

	; End of function sub_58EFC


; =============== S U B R O U T I N E =======================================

sub_58F02:
		 
		txt     $8D3            ; "They're mining granite for{N}our town at North Cliff.{W1}"
		rts

	; End of function sub_58F02


; =============== S U B R O U T I N E =======================================

sub_58F08:
		 
		txt     $8D4            ; "You had better bring up that{N}plank!{W1}"
		rts

	; End of function sub_58F08

