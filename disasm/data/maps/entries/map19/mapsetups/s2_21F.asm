
; ASM FILE data\maps\entries\map19\mapsetups\s2_21F.asm :
; 0x62AFE..0x62BCA : 
ms_map19_flag21F_EntityEvents:
		dc.b 5
		dc.b 1
		dc.w sub_62B4A-ms_map19_flag21F_EntityEvents
		dc.b 7
		dc.b 1
		dc.w sub_62B58-ms_map19_flag21F_EntityEvents
		dc.b 8
		dc.b 1
		dc.w sub_62B62-ms_map19_flag21F_EntityEvents
		dc.b $B
		dc.b 1
		dc.w sub_62B6C-ms_map19_flag21F_EntityEvents
		dc.b $A
		dc.b 1
		dc.w sub_62B76-ms_map19_flag21F_EntityEvents
		dc.b $13
		dc.b 1
		dc.w sub_62B80-ms_map19_flag21F_EntityEvents
		dc.b $19
		dc.b 1
		dc.w sub_62B8A-ms_map19_flag21F_EntityEvents
		dc.b $1B
		dc.b 1
		dc.w sub_62B94-ms_map19_flag21F_EntityEvents
		dc.b $1A
		dc.b 1
		dc.w sub_62BA2-ms_map19_flag21F_EntityEvents
		dc.b $80
		dc.b 3
		dc.w sub_62B40-ms_map19_flag21F_EntityEvents
		dc.b $82
		dc.b 3
		dc.w sub_62BAC-ms_map19_flag21F_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_62BB2-ms_map19_flag21F_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_62BB8-ms_map19_flag21F_EntityEvents
		dc.b $85
		dc.b 0
		dc.w sub_62BBE-ms_map19_flag21F_EntityEvents
		dc.b $86
		dc.b 0
		dc.w sub_62BC4-ms_map19_flag21F_EntityEvents
		dc.w $FD00
		dc.w nullsub_124-ms_map19_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_124:
		rts

	; End of function nullsub_124


; =============== S U B R O U T I N E =======================================

sub_62B40:
		trap    #TEXTBOX
		dc.w $F7D               ; "Why is she still sleeping?{W2}"
		trap    #TEXTBOX
		dc.w $F7E               ; "Astral said he knew who...{W1}"
		rts

	; End of function sub_62B40


; =============== S U B R O U T I N E =======================================

sub_62B4A:
		trap    #TEXTBOX
		dc.w $F69               ; "{LEADER}, how are you?{W2}"
		trap    #TEXTBOX
		dc.w $F6A               ; "I received an invitation{N}for todays festivities.{W2}"
		trap    #TEXTBOX
		dc.w $F6B               ; "I'm happy to say that{N}everyone looks well.{W1}"
		rts

	; End of function sub_62B4A


; =============== S U B R O U T I N E =======================================

sub_62B58:
		trap    #TEXTBOX
		dc.w $F6C               ; "Hi, {LEADER}!{N}I'm serving Volcanon again.{W2}"
		trap    #TEXTBOX
		dc.w $F6D               ; "I got an invitation to a{N}wedding party.{N}Who's getting married?{W1}"
		rts

	; End of function sub_62B58


; =============== S U B R O U T I N E =======================================

sub_62B62:
		trap    #TEXTBOX
		dc.w $F6E               ; "Granseal is beautiful!{W2}"
		trap    #TEXTBOX
		dc.w $F6F               ; "{NAME;2} told me about{N}it, but it's better than I{N}pictured!{W1}"
		rts

	; End of function sub_62B62


; =============== S U B R O U T I N E =======================================

sub_62B6C:
		trap    #TEXTBOX
		dc.w $F70               ; "Hello, {LEADER}!{N}You look good!{W2}"
		trap    #TEXTBOX
		dc.w $F71               ; "The Caravan is working well!{N}I found some more ruins!{N}Ha, ha, ha!{W1}"
		rts

	; End of function sub_62B6C


; =============== S U B R O U T I N E =======================================

sub_62B76:
		trap    #TEXTBOX
		dc.w $F72               ; "Sir Astral invited{N}{NAME;7} and I.{W2}"
		trap    #TEXTBOX
		dc.w $F73               ; "It's hard to believe there{N}was ever a threat of evil!{W1}"
		rts

	; End of function sub_62B76


; =============== S U B R O U T I N E =======================================

sub_62B80:
		trap    #TEXTBOX
		dc.w $F74               ; "King Pacalon asked me to say{N}hello to you.{W2}"
		trap    #TEXTBOX
		dc.w $F75               ; "He should see this beautiful{N}castle.{W1}"
		rts

	; End of function sub_62B80


; =============== S U B R O U T I N E =======================================

sub_62B8A:
		trap    #TEXTBOX
		dc.w $F76               ; "Two years...since that{N}battle....{W2}"
		trap    #TEXTBOX
		dc.w $F77               ; "I hope {NAME;28} is OK.{W1}"
		rts

	; End of function sub_62B8A


; =============== S U B R O U T I N E =======================================

sub_62B94:
		trap    #TEXTBOX
		dc.w $F78               ; "This is wonderful!{W2}"
		trap    #TEXTBOX
		dc.w $F79               ; "{LEADER}, you were{N}younger than the Princess,{N}but now you're older!{W1}"
		trap    #TEXTBOX
		dc.w $F7A               ; "But, age doesn't matter.{W1}"
		rts

	; End of function sub_62B94


; =============== S U B R O U T I N E =======================================

sub_62BA2:
		trap    #TEXTBOX
		dc.w $F7B               ; "{NAME;11} is crazy, but{N}he's the greatest!{W2}"
		trap    #TEXTBOX
		dc.w $F7C               ; "He's living his dream of{N}continuous adventure.{N}{LEADER}, will you join us?{W1}"
		rts

	; End of function sub_62BA2


; =============== S U B R O U T I N E =======================================

sub_62BAC:
		trap    #TEXTBOX
		dc.w $FB1               ; "I'll make a delicious meal{N}for them!{W1}"
		rts

	; End of function sub_62BAC


; =============== S U B R O U T I N E =======================================

sub_62BB2:
		trap    #TEXTBOX
		dc.w $FB2               ; "We have a lot of guests{N}today.{W1}"
		rts

	; End of function sub_62BB2


; =============== S U B R O U T I N E =======================================

sub_62BB8:
		trap    #TEXTBOX
		dc.w $FB3               ; "It's my responsibility to{N}guard everybody!{W1}"
		rts

	; End of function sub_62BB8


; =============== S U B R O U T I N E =======================================

sub_62BBE:
		trap    #TEXTBOX
		dc.w $FB4               ; "Is it time to stand guard?{N}Oh, it's you, {LEADER}!{N}Let me sleep.{W1}"
		rts

	; End of function sub_62BBE


; =============== S U B R O U T I N E =======================================

sub_62BC4:
		trap    #TEXTBOX
		dc.w $FB5               ; "...zzz...earthquake...{N}go...to...ship...{N}hurry...zzzzzz....{W1}"
		rts

	; End of function sub_62BC4

