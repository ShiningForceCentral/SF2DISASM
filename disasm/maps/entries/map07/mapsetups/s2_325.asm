
; SCRIPT SECTION maps\entries\map07\mapsetups\s2_325 :
; 
ms_map7_flag325_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5561E-ms_map7_flag325_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_555E8-ms_map7_flag325_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_55648-ms_map7_flag325_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5565E-ms_map7_flag325_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_55674-ms_map7_flag325_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_556B2-ms_map7_flag325_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_556E4-ms_map7_flag325_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_55702-ms_map7_flag325_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_55730-ms_map7_flag325_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_55776-ms_map7_flag325_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_5577C-ms_map7_flag325_EntityEvents
										dc.w $FD00
										dc.w return_5579C-ms_map7_flag325_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_555B4:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   return_555E6
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_555CE
										trap    #TRAP_TEXTBOX
										dc.w $48A               ; "Time goes by very quickly....{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $48B               ; "Those two jewels around{N}your neck will always{N}remind me of that...!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $48C               ; "The chain is made of{N}Mithril.  It can't be cut!{W1}"
										bra.s   return_555E6
loc_555CE:
										
										trap    #TRAP_CHECKFLAG
										dc.w $100
										bne.s   loc_555E2
										trap    #TRAP_TEXTBOX
										dc.w $4A4               ; "{LEADER}, you can't{N}understand my regret....{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $4A5               ; "It was the last chance to see{N}Volcanon in my{N}lifetime!{W1}"
										trap    #TRAP_SETFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
										bra.s   return_555E6
loc_555E2:
										
										trap    #TRAP_TEXTBOX
										dc.w $4A6               ; "{LEADER}, I expect{N}you to find a lot of{N}allies!{W1}"
return_555E6:
										
										rts

	; End of function sub_555B4


; =============== S U B R O U T I N E =======================================

sub_555E8:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_55618
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_55602
										trap    #TRAP_TEXTBOX
										dc.w $484               ; "I feel Elis is still alive....{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $485               ; "{LEADER}, please prepare{N}a ship for me.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $486               ; "I would like to go back to{N}Grans to find her.{W1}"
										bra.s   loc_55616
loc_55602:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2BF
										bne.s   loc_55612
										trap    #TRAP_TEXTBOX
										dc.w $4A7               ; "Gee, Parmecia is full{N}of wonders!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $4A8               ; "Phoenix, Volcanon...it's{N}like living a myth!{W1}"
										bra.s   loc_55616
loc_55612:
										
										trap    #TRAP_TEXTBOX
										dc.w $4A9               ; "Elis is alive.{N}I can feel it!{W1}"
loc_55616:
										
										bra.s   return_5561C
loc_55618:
										
										trap    #TRAP_TEXTBOX
										dc.w $4D5               ; "{LEADER}, please find{N}the Princess.{W1}"
return_5561C:
										
										rts

	; End of function sub_555E8


; =============== S U B R O U T I N E =======================================

sub_5561E:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_5563E
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_55638
										trap    #TRAP_TEXTBOX
										dc.w $487               ; "Is everything OK,{N}{LEADER}?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $488               ; "Can these young men guard{N}our new town?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $489               ; "The King is no longer what{N}he was.{W1}"
										bra.s   loc_5563C
loc_55638:
										
										trap    #TRAP_TEXTBOX
										dc.w $4AA               ; "The prosperity of Granseal{N}rests in your hands!{W1}"
loc_5563C:
										
										bra.s   return_55646
loc_5563E:
										
										trap    #TRAP_TEXTBOX
										dc.w $4D6               ; "The King is unaware of{N}Sir Astral's idea.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $4D7               ; "The most important thing is{N}to defeat the devils!{W1}"
return_55646:
										
										rts

	; End of function sub_5561E


; =============== S U B R O U T I N E =======================================

sub_55648:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_55658
										trap    #TRAP_TEXTBOX
										dc.w $495               ; "I'm told to stand watch{N}here.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $496               ; "But, look!  Nothing!{N}What am I watching?{W1}"
										bra.s   return_5565C
loc_55658:
										
										trap    #TRAP_TEXTBOX
										dc.w $4D8               ; "How long should I keep{N}guard here?{W1}"
return_5565C:
										
										rts

	; End of function sub_55648


; =============== S U B R O U T I N E =======================================

sub_5565E:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_5566E
										trap    #TRAP_TEXTBOX
										dc.w $498               ; "I can't believe it!{N}This isn't Granseal!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $499               ; "I want to go back to{N}Grans Island.{W1}"
										bra.s   return_55672
loc_5566E:
										
										trap    #TRAP_TEXTBOX
										dc.w $4D9               ; "To Grans Island?  But, I{N}like Parmecia now!{W1}"
return_55672:
										
										rts

	; End of function sub_5565E


; =============== S U B R O U T I N E =======================================

sub_55674:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_556A0
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_5569A
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_55694
										trap    #TRAP_TEXTBOX
										dc.w $490               ; "I envy you, {LEADER}.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $491               ; "You can act freely, even{N}in the castle.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $492               ; "I have to stand here{N}everyday. {W1}"
										bra.s   loc_55698
loc_55694:
										
										trap    #TRAP_TEXTBOX
										dc.w $4A1               ; "{LEADER}, go see{N}Sir Astral!{W1}"
loc_55698:
										
										bra.s   loc_5569E
loc_5569A:
										
										trap    #TRAP_TEXTBOX
										dc.w $4AB               ; "While {LEADER} is away,{N}we'll guard the castle!{W1}"
loc_5569E:
										
										bra.s   return_556B0
loc_556A0:
										
										trap    #TRAP_CHECKFLAG
										dc.w $325
										bne.s   loc_556AC
										trap    #TRAP_TEXTBOX
										dc.w $4A1               ; "{LEADER}, go see{N}Sir Astral!{W1}"
										bra.s   return_556B0
loc_556AC:
										
										trap    #TRAP_TEXTBOX
										dc.w $4DA               ; "We'll guard Granseal while{N}you're away!{W1}"
return_556B0:
										
										rts

	; End of function sub_55674


; =============== S U B R O U T I N E =======================================

sub_556B2:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_556DA
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_556C4
										trap    #TRAP_TEXTBOX
										dc.w $49A               ; "Granseal Castle!{N}Hee, hee...I'm cool!{W1}"
										bra.s   loc_556D8
loc_556C4:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_556D4
										trap    #TRAP_TEXTBOX
										dc.w $49D               ; "Grans...oh!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $49E               ; "{LEADER}, you're here!{N}Sir Astral is waiting.{W1}"
										bra.s   loc_556D8
loc_556D4:
										
										trap    #TRAP_TEXTBOX
										dc.w $49A               ; "Granseal Castle!{N}Hee, hee...I'm cool!{W1}"
loc_556D8:
										
										bra.s   return_556E2
loc_556DA:
										
										trap    #TRAP_TEXTBOX
										dc.w $4DB               ; "Your pass, please!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $4DC               ; "Of course, you don't have to{N}show one, {LEADER}!{N}Go ahead!{W1}"
return_556E2:
										
										rts

	; End of function sub_556B2


; =============== S U B R O U T I N E =======================================

sub_556E4:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_556FC
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_556F6
										trap    #TRAP_TEXTBOX
										dc.w $497               ; "Tactical Base!{N}Ah, you knew that?{W1}"
										bra.s   loc_556FA
loc_556F6:
										
										trap    #TRAP_TEXTBOX
										dc.w $4AC               ; "Tactical Base!{N}Nobody has visited here{N}lately....{W1}"
loc_556FA:
										
										bra.s   return_55700
loc_556FC:
										
										trap    #TRAP_TEXTBOX
										dc.w $4DD               ; "Tactical Base!{N}Why don't you talk to your{N}friends, {LEADER}?{W1}"
return_55700:
										
										rts

	; End of function sub_556E4


; =============== S U B R O U T I N E =======================================

sub_55702:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_5572A
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_55724
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_5571E
										trap    #TRAP_TEXTBOX
										dc.w $493               ; "At least there is no danger{N}in the castle.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $494               ; "I've never seen such strange{N}races!{W1}"
										bra.s   loc_55722
loc_5571E:
										
										trap    #TRAP_TEXTBOX
										dc.w $4A1               ; "{LEADER}, go see{N}Sir Astral!{W1}"
loc_55722:
										
										bra.s   loc_55728
loc_55724:
										
										trap    #TRAP_TEXTBOX
										dc.w $4AD               ; "I'll miss you, {LEADER}...{N}but do not worry!{W1}"
loc_55728:
										
										bra.s   return_5572E
loc_5572A:
										
										trap    #TRAP_TEXTBOX
										dc.w $4DE               ; "{LEADER}, you'll be{N}surprised to see the results{N}of my practice!{W1}"
return_5572E:
										
										rts

	; End of function sub_55702


; =============== S U B R O U T I N E =======================================

sub_55730:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_55760
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_55746
										trap    #TRAP_TEXTBOX
										dc.w $49B               ; "You need permission to enter!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $49C               ; "I was told to say that,{N}but nobody ever comes!{W1}"
										bra.s   loc_5575E
loc_55746:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_55756
										trap    #TRAP_TEXTBOX
										dc.w $49F               ; "The Minister and Sir{N}Astral are inside.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $4A0               ; "They're giving a warm{N}reception to a guest.{W1}"
										bra.s   loc_5575E
loc_55756:
										
										trap    #TRAP_TEXTBOX
										dc.w $49B               ; "You need permission to enter!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $49C               ; "I was told to say that,{N}but nobody ever comes!{W1}"
loc_5575E:
										
										bra.s   return_55774
loc_55760:
										
										trap    #TRAP_CHECKFLAG
										btst    d1,-(a5)
										bne.s   loc_5576C
										trap    #TRAP_TEXTBOX
										dc.w $4DF               ; "Hello, {LEADER}.{N}The King is waiting.{W1}"
										bra.s   return_55774
loc_5576C:
										
										trap    #TRAP_TEXTBOX
										dc.w $49B               ; "You need permission to enter!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $49C               ; "I was told to say that,{N}but nobody ever comes!{W1}"
return_55774:
										
										rts

	; End of function sub_55730


; =============== S U B R O U T I N E =======================================

sub_55776:
										
										trap    #TRAP_TEXTBOX
										dc.w $48D               ; "Oh, the King looks so sad.{W1}"
										rts

	; End of function sub_55776


; =============== S U B R O U T I N E =======================================

sub_5577C:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_5578C
										trap    #TRAP_TEXTBOX
										dc.w $48E               ; "(Yaaawn)...Oh, excuse me.{N}I'm tired because of the{N}Minister.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $48F               ; "He and Sir Astral talk{N}late every night.{W1}"
										bra.s   return_55790
loc_5578C:
										
										trap    #TRAP_TEXTBOX
										dc.w $4E0               ; "See?  Our guards are getting{N}tougher day by day.{W1}"
return_55790:
										
										rts

	; End of function sub_5577C


; =============== S U B R O U T I N E =======================================

sub_55792:
										
										trap    #TRAP_TEXTBOX
										dc.w $4A2               ; "{LEADER}, something{N}important is happening.{W1}"
										rts

	; End of function sub_55792


; =============== S U B R O U T I N E =======================================

sub_55798:
										
										trap    #TRAP_TEXTBOX
										dc.w $4A3               ; "{LEADER}, Sir Astral is{N}over there. {W1}"
return_5579C:
										
										rts

	; End of function sub_55798

