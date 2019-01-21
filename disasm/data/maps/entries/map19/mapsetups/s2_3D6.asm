
; ASM FILE data\maps\entries\map19\mapsetups\s2_3D6.asm :
; 0x62BCA..0x62C6C : 
ms_map19_flag3D6_EntityEvents:
		msEntityEvent 3, UP, sub_62C22-ms_map19_flag3D6_EntityEvents
		msEntityEvent 2, UP, sub_62C28-ms_map19_flag3D6_EntityEvents
		msEntityEvent 5, UP, sub_62C2E-ms_map19_flag3D6_EntityEvents
		msEntityEvent 7, UP, sub_62C34-ms_map19_flag3D6_EntityEvents
		msEntityEvent 8, UP, sub_62C3E-ms_map19_flag3D6_EntityEvents
		msEntityEvent 11, UP, sub_62C44-ms_map19_flag3D6_EntityEvents
		msEntityEvent 10, UP, sub_62C4A-ms_map19_flag3D6_EntityEvents
		msEntityEvent 19, UP, sub_62C50-ms_map19_flag3D6_EntityEvents
		msEntityEvent 25, UP, sub_62C56-ms_map19_flag3D6_EntityEvents
		msEntityEvent 27, UP, sub_62C5C-ms_map19_flag3D6_EntityEvents
		msEntityEvent 26, UP, sub_62C66-ms_map19_flag3D6_EntityEvents
		msEntityEvent 128, DOWN, sub_62C16-ms_map19_flag3D6_EntityEvents
		msEntityEvent 129, UP, sub_62C1C-ms_map19_flag3D6_EntityEvents
		msEntityEvent 130, DOWN, (sub_62BAC-ms_map19_flag3D6_EntityEvents) & $FFFF
		msEntityEvent 131, UP, (sub_62BB2-ms_map19_flag3D6_EntityEvents) & $FFFF
		msEntityEvent 132, UP, (sub_62BB8-ms_map19_flag3D6_EntityEvents) & $FFFF
		msEntityEvent 133, RIGHT, (sub_62BBE-ms_map19_flag3D6_EntityEvents) & $FFFF
		msEntityEvent 134, RIGHT, (sub_62BC4-ms_map19_flag3D6_EntityEvents) & $FFFF
		msDefaultEntityEvent 0, (nullsub_124-ms_map19_flag3D6_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_62C16:
		trap    #TEXTBOX
		dc.w $FA8               ; "The Minister is waiting{N}for you.{W1}"
		rts

	; End of function sub_62C16


; =============== S U B R O U T I N E =======================================

sub_62C1C:
		trap    #TEXTBOX
		dc.w $FA9               ; "Oh, {LEADER}!{N}I really respect you.{W2}"
		rts

	; End of function sub_62C1C


; =============== S U B R O U T I N E =======================================

sub_62C22:
		trap    #TEXTBOX
		dc.w $FBD               ; "It's OK...{W2}{N}I'll find a girl someday!{W1}"
		rts

	; End of function sub_62C22


; =============== S U B R O U T I N E =======================================

sub_62C28:
		trap    #TEXTBOX
		dc.w $F9D               ; "What does he mean?{N}I don't understand!{W1}"
		rts

	; End of function sub_62C28


; =============== S U B R O U T I N E =======================================

sub_62C2E:
		trap    #TEXTBOX
		dc.w $FBE               ; "Don't worry.{N}He's tough.{W1}"
		rts

	; End of function sub_62C2E


; =============== S U B R O U T I N E =======================================

sub_62C34:
		trap    #TEXTBOX
		dc.w $FBA               ; "Hurry, {LEADER}!{N}Princess Elis is upstairs!{W2}"
		trap    #TEXTBOX
		dc.w $FBB               ; "You were so cool in our{N}adventure two years ago!{W1}"
		rts

	; End of function sub_62C34


; =============== S U B R O U T I N E =======================================

sub_62C3E:
		trap    #TEXTBOX
		dc.w $F92               ; "{LEADER} is a human!{N}They will make a cute couple!{W1}"
		rts

	; End of function sub_62C3E


; =============== S U B R O U T I N E =======================================

sub_62C44:
		trap    #TEXTBOX
		dc.w $F9E               ; "They remind me of when I{N}was young.{W1}"
		rts

	; End of function sub_62C44


; =============== S U B R O U T I N E =======================================

sub_62C4A:
		trap    #TEXTBOX
		dc.w $FBC               ; "{LEADER}, go kiss her!{W1}"
		rts

	; End of function sub_62C4A


; =============== S U B R O U T I N E =======================================

sub_62C50:
		trap    #TEXTBOX
		dc.w $F94               ; "I think he's the best{N}choice.{W1}"
		rts

	; End of function sub_62C50


; =============== S U B R O U T I N E =======================================

sub_62C56:
		trap    #TEXTBOX
		dc.w $FBF               ; "You're blushing!{N}Just be cool!{W1}"
		rts

	; End of function sub_62C56


; =============== S U B R O U T I N E =======================================

sub_62C5C:
		trap    #TEXTBOX
		dc.w $FA2               ; "{NAME;4} will take care{N}of {NAME;1}.{W2}"
		trap    #TEXTBOX
		dc.w $FA3               ; "Everything went as you{N}expected, huh?{W1}"
		rts

	; End of function sub_62C5C


; =============== S U B R O U T I N E =======================================

sub_62C66:
		trap    #TEXTBOX
		dc.w $FC0               ; "He was young before?{W1}"
		rts

	; End of function sub_62C66

