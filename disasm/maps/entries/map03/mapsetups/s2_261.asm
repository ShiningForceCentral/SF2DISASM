
; SCRIPT SECTION maps\entries\map03\mapsetups\s2_261 :
; 
ms_map3_flag261_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_510CC-ms_map3_flag261_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_510E0-ms_map3_flag261_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_510F4-ms_map3_flag261_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_510FA-ms_map3_flag261_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_51108-ms_map3_flag261_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5110E-ms_map3_flag261_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_51114-ms_map3_flag261_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_5111A-ms_map3_flag261_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_51124-ms_map3_flag261_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_5112A-ms_map3_flag261_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_51130-ms_map3_flag261_EntityEvents
										dc.b $8B
										dc.b 3
										dc.w sub_51130-ms_map3_flag261_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_51136-ms_map3_flag261_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_51140-ms_map3_flag261_EntityEvents
										dc.b $8E
										dc.b 1
										dc.w sub_51146-ms_map3_flag261_EntityEvents
										dc.b $8F
										dc.b 1
										dc.w sub_5114C-ms_map3_flag261_EntityEvents
										dc.b $90
										dc.b 3
										dc.w sub_51152-ms_map3_flag261_EntityEvents
										dc.b $91
										dc.b 1
										dc.w sub_51158-ms_map3_flag261_EntityEvents
										dc.b $92
										dc.b 1
										dc.w sub_5115E-ms_map3_flag261_EntityEvents
										dc.b $93
										dc.b 1
										dc.w sub_51164-ms_map3_flag261_EntityEvents
										dc.b 6
										dc.b 1
										dc.w sub_5116A-ms_map3_flag261_EntityEvents
										dc.b $94
										dc.b 3
										dc.w sub_51170-ms_map3_flag261_EntityEvents
										dc.b $95
										dc.b 3
										dc.w sub_51178-ms_map3_flag261_EntityEvents
										dc.b $96
										dc.b 1
										dc.w sub_5117E-ms_map3_flag261_EntityEvents
										dc.b $97
										dc.b 3
										dc.w sub_51194-ms_map3_flag261_EntityEvents
										dc.b $98
										dc.b 1
										dc.w sub_511A8-ms_map3_flag261_EntityEvents
										dc.b $99
										dc.b 3
										dc.w sub_511BC-ms_map3_flag261_EntityEvents
										dc.w $FD00
										dc.w return_5105A+$10000-ms_map3_flag261_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_510CC:
										
										trap    #CHECK_FLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
										bne.s   loc_510DA
										trap    #TEXTBOX
										dc.w $273               ; "The castle guard said the{N}King chose you to lead a{N}mission.{N}{LEADER}, my dear,{W2}{N}I didn't know you were old{N}enough to work for the{N}King.{W1}"
										trap    #SET_FLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_510DA:
										
										trap    #TEXTBOX
										dc.w $274               ; "Good luck, {LEADER}.{N}Your father would have{N}been proud of you.{W1}"
										rts

	; End of function sub_510CC


; =============== S U B R O U T I N E =======================================

sub_510E0:
										
										trap    #CHECK_FLAG
										dc.w $101
										bne.s   loc_510EE
										trap    #TEXTBOX
										dc.w $275               ; "I knew your father very{N}well.{N}He was a great leader.{W2}"
										trap    #SET_FLAG
										dc.w $101
loc_510EE:
										
										trap    #TEXTBOX
										dc.w $276               ; "{LEADER}, you have to{N}study hard and be a fine{N}man like him.{W1}"
										rts

	; End of function sub_510E0


; =============== S U B R O U T I N E =======================================

sub_510F4:
										
										trap    #TEXTBOX
										dc.w $277               ; "He thinks of you as his{N}grandson.{W2}{N}Sometimes he may annoy{N}you, but it's because he{N}loves you.{W1}"
										rts

	; End of function sub_510F4


; =============== S U B R O U T I N E =======================================

sub_510FA:
										
										move.b  #0,((CURRENT_SHOP_INDEX-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_510FA


; =============== S U B R O U T I N E =======================================

sub_51108:
										
										trap    #TEXTBOX
										dc.w $278               ; "Why don't you stop by my{N}shop before you set out{N}on your journey?{W1}"
										rts

	; End of function sub_51108


; =============== S U B R O U T I N E =======================================

sub_5110E:
										
										trap    #TEXTBOX
										dc.w $279               ; "That Galam messenger rushed{N}out of town.{N}He looked pale.{W1}"
										rts

	; End of function sub_5110E


; =============== S U B R O U T I N E =======================================

sub_51114:
										
										trap    #TEXTBOX
										dc.w $27A               ; "Don't listen to what that{N}fortune teller says.{N}She's a liar.{W1}"
										rts

	; End of function sub_51114


; =============== S U B R O U T I N E =======================================

sub_5111A:
										
										trap    #TEXTBOX
										dc.w $27B               ; "Hear what I have to say!{N}I can see the ruins in my{N}crystal!{W2}"
										trap    #TEXTBOX
										dc.w $27C               ; "The war!  Granseal will{N}fall in the war! {N}Believe me!{W1}"
										rts

	; End of function sub_5111A


; =============== S U B R O U T I N E =======================================

sub_51124:
										
										trap    #TEXTBOX
										dc.w $27D               ; "You heard about it?{N}The King was sick.{W1}"
										rts

	; End of function sub_51124


; =============== S U B R O U T I N E =======================================

sub_5112A:
										
										trap    #TEXTBOX
										dc.w $27E               ; "Yes, I heard about it.{N}Soldiers of the castle{N}were talking about it.{W2}{N}It must be true!{W1}"
										rts

	; End of function sub_5112A


; =============== S U B R O U T I N E =======================================

sub_51130:
										
										trap    #TEXTBOX
										dc.w $27F               ; "The Minister said you{N}could enter anytime you{N}want.{W1}"
										rts

	; End of function sub_51130


; =============== S U B R O U T I N E =======================================

sub_51136:
										
										trap    #TEXTBOX
										dc.w $280               ; "Welcome!{N}We have very novel animals{N}from the mainland!!{W2}"
										trap    #TEXTBOX
										dc.w $281               ; "You don't want a pet?{N}I'll lower my prices for{N}you!{W1}"
										rts

	; End of function sub_51136


; =============== S U B R O U T I N E =======================================

sub_51140:
										
										trap    #TEXTBOX
										dc.w $282               ; "He looks so sad...{N}I feel sorry for him.{W1}"
										rts

	; End of function sub_51140


; =============== S U B R O U T I N E =======================================

sub_51146:
										
										trap    #TEXTBOX
										dc.w $283               ; "Bok-bok-bok.{N}Bok-gawk!{W1}"
										rts

	; End of function sub_51146


; =============== S U B R O U T I N E =======================================

sub_5114C:
										
										trap    #TEXTBOX
										dc.w $284               ; "Watch out!{N}Don't loiter around here!{N}Ever!{W1}"
										rts

	; End of function sub_5114C


; =============== S U B R O U T I N E =======================================

sub_51152:
										
										trap    #TEXTBOX
										dc.w $285               ; "Sorry, my husband is{N}angry.  He didn't catch any{N}fish today.{W1}"
										rts

	; End of function sub_51152


; =============== S U B R O U T I N E =======================================

sub_51158:
										
										trap    #TEXTBOX
										dc.w $286               ; "Granseal harbor is behind{N}me.{W2}{N}A ship just docked a few{N}minutes ago.{W1}"
										rts

	; End of function sub_51158


; =============== S U B R O U T I N E =======================================

sub_5115E:
										
										trap    #TEXTBOX
										dc.w $287               ; "The human caught me when{N}I was taking a walk in{N}Parmecia.{W1}"
										rts

	; End of function sub_5115E


; =============== S U B R O U T I N E =======================================

sub_51164:
										
										trap    #TEXTBOX
										dc.w $288               ; "Release me! Get me out of{N}here or I shall eat you up!!{W1}"
										rts

	; End of function sub_51164


; =============== S U B R O U T I N E =======================================

sub_5116A:
										
										trap    #TEXTBOX
										dc.w $289               ; "Me...(sob)...so hungry.{N}Hungry....{W1}"
										rts

	; End of function sub_5116A


; =============== S U B R O U T I N E =======================================

sub_51170:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_51170


; =============== S U B R O U T I N E =======================================

sub_51178:
										
										trap    #TEXTBOX
										dc.w $28A               ; "I envy you!  You saw{N}the beautiful Princess Elis!{W1}"
										rts

	; End of function sub_51178


; =============== S U B R O U T I N E =======================================

sub_5117E:
										
										trap    #CHECK_FLAG
										dc.w $116
										bne.s   loc_5118E
										trap    #TEXTBOX
										dc.w $28B               ; "A pet shop has newly opened,{N}but Mom never lets me go?{N}Why?{W1}"
										trap    #SET_FLAG
										dc.w $116
										bra.s   return_51192
loc_5118E:
										
										trap    #TEXTBOX
										dc.w $291               ; "Well, {LEADER}!{N}Come and play with me{N}later!  Promise?{W1}"
return_51192:
										
										rts

	; End of function sub_5117E


; =============== S U B R O U T I N E =======================================

sub_51194:
										
										trap    #CHECK_FLAG
										dc.w $117
										bne.s   loc_511A2
										trap    #TEXTBOX
										dc.w $292               ; "Strangers from the mainland{N}opened a pet shop.{W2}"
										trap    #SET_FLAG
										dc.w $117
loc_511A2:
										
										trap    #TEXTBOX
										dc.w $293               ; "I don't think it's right{N}to hold animals captive.{W1}"
										rts

	; End of function sub_51194


; =============== S U B R O U T I N E =======================================

sub_511A8:
										
										trap    #CHECK_FLAG
										dc.w $118
										bne.s   loc_511B6
										trap    #TEXTBOX
										dc.w $294               ; "(Sniff, sniff)...have you{N}seen or smelt any sulfur?{W2}"
										trap    #SET_FLAG
										dc.w $118
loc_511B6:
										
										trap    #TEXTBOX
										dc.w $295               ; "I'm an inventor.{N}I'm looking for some sulfur.{W1}"
										rts

	; End of function sub_511A8


; =============== S U B R O U T I N E =======================================

sub_511BC:
										
										move.b  #$F,((CURRENT_SHOP_INDEX-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_511BC

