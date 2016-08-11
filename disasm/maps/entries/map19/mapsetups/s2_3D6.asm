
; SCRIPT SECTION maps\entries\map19\mapsetups\s2_3D6 :
; 
ms_map19_flag3D6_EntityEvents:
										dc.b 3
										dc.b 1
										dc.w sub_62C22-ms_map19_flag3D6_EntityEvents
										dc.b 2
										dc.b 1
										dc.w sub_62C28-ms_map19_flag3D6_EntityEvents
										dc.b 5
										dc.b 1
										dc.w sub_62C2E-ms_map19_flag3D6_EntityEvents
										dc.b 7
										dc.b 1
										dc.w sub_62C34-ms_map19_flag3D6_EntityEvents
										dc.b 8
										dc.b 1
										dc.w sub_62C3E-ms_map19_flag3D6_EntityEvents
										dc.b $B
										dc.b 1
										dc.w sub_62C44-ms_map19_flag3D6_EntityEvents
										dc.b $A
										dc.b 1
										dc.w sub_62C4A-ms_map19_flag3D6_EntityEvents
										dc.b $13
										dc.b 1
										dc.w sub_62C50-ms_map19_flag3D6_EntityEvents
										dc.b $19
										dc.b 1
										dc.w sub_62C56-ms_map19_flag3D6_EntityEvents
										dc.b $1B
										dc.b 1
										dc.w sub_62C5C-ms_map19_flag3D6_EntityEvents
										dc.b $1A
										dc.b 1
										dc.w sub_62C66-ms_map19_flag3D6_EntityEvents
										dc.b $80
										dc.b 3
										dc.w sub_62C16-ms_map19_flag3D6_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_62C1C-ms_map19_flag3D6_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_62BAC+$10000-ms_map19_flag3D6_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_62BB2+$10000-ms_map19_flag3D6_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_62BB8+$10000-ms_map19_flag3D6_EntityEvents
										dc.b $85
										dc.b 0
										dc.w sub_62BBE+$10000-ms_map19_flag3D6_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_62BC4+$10000-ms_map19_flag3D6_EntityEvents
										dc.w $FD00
										dc.w nullsub_124+$10000-ms_map19_flag3D6_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_62C16:
										
										trap    #TRAP_TEXTBOX
										dc.w $FA8               ; "The Minister is waiting{N}for you.{W1}"
										rts

	; End of function sub_62C16


; =============== S U B R O U T I N E =======================================

sub_62C1C:
										
										trap    #TRAP_TEXTBOX
										dc.w $FA9               ; "Oh, {LEADER}!{N}I really respect you.{W2}"
										rts

	; End of function sub_62C1C


; =============== S U B R O U T I N E =======================================

sub_62C22:
										
										trap    #TRAP_TEXTBOX
										dc.w $FBD               ; "It's OK...{W2}{N}I'll find a girl someday!{W1}"
										rts

	; End of function sub_62C22


; =============== S U B R O U T I N E =======================================

sub_62C28:
										
										trap    #TRAP_TEXTBOX
										dc.w $F9D               ; "What does he mean?{N}I don't understand!{W1}"
										rts

	; End of function sub_62C28


; =============== S U B R O U T I N E =======================================

sub_62C2E:
										
										trap    #TRAP_TEXTBOX
										dc.w $FBE               ; "Don't worry.{N}He's tough.{W1}"
										rts

	; End of function sub_62C2E


; =============== S U B R O U T I N E =======================================

sub_62C34:
										
										trap    #TRAP_TEXTBOX
										dc.w $FBA               ; "Hurry, {LEADER}!{N}Princess Elis is upstairs!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $FBB               ; "You were so cool in our{N}adventure two years ago!{W1}"
										rts

	; End of function sub_62C34


; =============== S U B R O U T I N E =======================================

sub_62C3E:
										
										trap    #TRAP_TEXTBOX
										dc.w $F92               ; "{LEADER} is a human!{N}They will make a cute couple!{W1}"
										rts

	; End of function sub_62C3E


; =============== S U B R O U T I N E =======================================

sub_62C44:
										
										trap    #TRAP_TEXTBOX
										dc.w $F9E               ; "They remind me of when I{N}was young.{W1}"
										rts

	; End of function sub_62C44


; =============== S U B R O U T I N E =======================================

sub_62C4A:
										
										trap    #TRAP_TEXTBOX
										dc.w $FBC               ; "{LEADER}, go kiss her!{W1}"
										rts

	; End of function sub_62C4A


; =============== S U B R O U T I N E =======================================

sub_62C50:
										
										trap    #TRAP_TEXTBOX
										dc.w $F94               ; "I think he's the best{N}choice.{W1}"
										rts

	; End of function sub_62C50


; =============== S U B R O U T I N E =======================================

sub_62C56:
										
										trap    #TRAP_TEXTBOX
										dc.w $FBF               ; "You're blushing!{N}Just be cool!{W1}"
										rts

	; End of function sub_62C56


; =============== S U B R O U T I N E =======================================

sub_62C5C:
										
										trap    #TRAP_TEXTBOX
										dc.w $FA2               ; "{NAME;4} will take care{N}of {NAME;1}.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $FA3               ; "Everything went as you{N}expected, huh?{W1}"
										rts

	; End of function sub_62C5C


; =============== S U B R O U T I N E =======================================

sub_62C66:
										
										trap    #TRAP_TEXTBOX
										dc.w $FC0               ; "He was young before?{W1}"
										rts

	; End of function sub_62C66

