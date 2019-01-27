
; ASM FILE data\maps\entries\map03\mapsetups\s2_261.asm :
; 0x5105C..0x511CA : 
ms_map3_flag261_EntityEvents:
		msEntityEvent 128, DOWN, sub_510CC-ms_map3_flag261_EntityEvents
		msEntityEvent 129, UP, sub_510E0-ms_map3_flag261_EntityEvents
		msEntityEvent 130, DOWN, sub_510F4-ms_map3_flag261_EntityEvents
		msEntityEvent 131, DOWN, sub_510FA-ms_map3_flag261_EntityEvents
		msEntityEvent 132, DOWN, sub_51108-ms_map3_flag261_EntityEvents
		msEntityEvent 133, UP, sub_5110E-ms_map3_flag261_EntityEvents
		msEntityEvent 134, UP, sub_51114-ms_map3_flag261_EntityEvents
		msEntityEvent 135, DOWN, sub_5111A-ms_map3_flag261_EntityEvents
		msEntityEvent 136, DOWN, sub_51124-ms_map3_flag261_EntityEvents
		msEntityEvent 137, DOWN, sub_5112A-ms_map3_flag261_EntityEvents
		msEntityEvent 138, DOWN, sub_51130-ms_map3_flag261_EntityEvents
		msEntityEvent 139, DOWN, sub_51130-ms_map3_flag261_EntityEvents
		msEntityEvent 140, DOWN, sub_51136-ms_map3_flag261_EntityEvents
		msEntityEvent 141, DOWN, sub_51140-ms_map3_flag261_EntityEvents
		msEntityEvent 142, UP, sub_51146-ms_map3_flag261_EntityEvents
		msEntityEvent 143, UP, sub_5114C-ms_map3_flag261_EntityEvents
		msEntityEvent 144, DOWN, sub_51152-ms_map3_flag261_EntityEvents
		msEntityEvent 145, UP, sub_51158-ms_map3_flag261_EntityEvents
		msEntityEvent 146, UP, sub_5115E-ms_map3_flag261_EntityEvents
		msEntityEvent 147, UP, sub_51164-ms_map3_flag261_EntityEvents
		msEntityEvent 6, UP, sub_5116A-ms_map3_flag261_EntityEvents
		msEntityEvent 148, DOWN, sub_51170-ms_map3_flag261_EntityEvents
		msEntityEvent 149, DOWN, sub_51178-ms_map3_flag261_EntityEvents
		msEntityEvent 150, UP, sub_5117E-ms_map3_flag261_EntityEvents
		msEntityEvent 151, DOWN, sub_51194-ms_map3_flag261_EntityEvents
		msEntityEvent 152, UP, sub_511A8-ms_map3_flag261_EntityEvents
		msEntityEvent 153, DOWN, sub_511BC-ms_map3_flag261_EntityEvents
		msDefaultEntityEvent 0, (entevdft_5105A-ms_map3_flag261_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_510CC:
		 
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_510DA      
		txt $273                ; "The castle guard said the{N}King chose you to lead a{N}mission.{N}{LEADER}, my dear,{W2}{N}I didn't know you were old{N}enough to work for the{N}King.{W1}"
		setFlg $100             ; Temporary map setup flag 00
byte_510DA:
		txt $274                ; "Good luck, {LEADER}.{N}Your father would have{N}been proud of you.{W1}"
		rts

	; End of function sub_510CC


; =============== S U B R O U T I N E =======================================

sub_510E0:
		 
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_510EE      
		txt $275                ; "I knew your father very{N}well.{N}He was a great leader.{W2}"
		setFlg $101             ; Temporary map setup flag 01
byte_510EE:
		txt $276                ; "{LEADER}, you have to{N}study hard and be a fine{N}man like him.{W1}"
		rts

	; End of function sub_510E0


; =============== S U B R O U T I N E =======================================

sub_510F4:
		 
		txt $277                ; "He thinks of you as his{N}grandson.{W2}{N}Sometimes he may annoy{N}you, but it's because he{N}loves you.{W1}"
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
		 
		txt $278                ; "Why don't you stop by my{N}shop before you set out{N}on your journey?{W1}"
		rts

	; End of function sub_51108


; =============== S U B R O U T I N E =======================================

sub_5110E:
		 
		txt $279                ; "That Galam messenger rushed{N}out of town.{N}He looked pale.{W1}"
		rts

	; End of function sub_5110E


; =============== S U B R O U T I N E =======================================

sub_51114:
		 
		txt $27A                ; "Don't listen to what that{N}fortune teller says.{N}She's a liar.{W1}"
		rts

	; End of function sub_51114


; =============== S U B R O U T I N E =======================================

sub_5111A:
		 
		txt $27B                ; "Hear what I have to say!{N}I can see the ruins in my{N}crystal!{W2}"
		txt $27C                ; "The war!  Granseal will{N}fall in the war! {N}Believe me!{W1}"
		rts

	; End of function sub_5111A


; =============== S U B R O U T I N E =======================================

sub_51124:
		 
		txt $27D                ; "You heard about it?{N}The King was sick.{W1}"
		rts

	; End of function sub_51124


; =============== S U B R O U T I N E =======================================

sub_5112A:
		 
		txt $27E                ; "Yes, I heard about it.{N}Soldiers of the castle{N}were talking about it.{W2}{N}It must be true!{W1}"
		rts

	; End of function sub_5112A


; =============== S U B R O U T I N E =======================================

sub_51130:
		 
		txt $27F                ; "The Minister said you{N}could enter anytime you{N}want.{W1}"
		rts

	; End of function sub_51130


; =============== S U B R O U T I N E =======================================

sub_51136:
		 
		txt $280                ; "Welcome!{N}We have very novel animals{N}from the mainland!!{W2}"
		txt $281                ; "You don't want a pet?{N}I'll lower my prices for{N}you!{W1}"
		rts

	; End of function sub_51136


; =============== S U B R O U T I N E =======================================

sub_51140:
		 
		txt $282                ; "He looks so sad...{N}I feel sorry for him.{W1}"
		rts

	; End of function sub_51140


; =============== S U B R O U T I N E =======================================

sub_51146:
		 
		txt $283                ; "Bok-bok-bok.{N}Bok-gawk!{W1}"
		rts

	; End of function sub_51146


; =============== S U B R O U T I N E =======================================

sub_5114C:
		 
		txt $284                ; "Watch out!{N}Don't loiter around here!{N}Ever!{W1}"
		rts

	; End of function sub_5114C


; =============== S U B R O U T I N E =======================================

sub_51152:
		 
		txt $285                ; "Sorry, my husband is{N}angry.  He didn't catch any{N}fish today.{W1}"
		rts

	; End of function sub_51152


; =============== S U B R O U T I N E =======================================

sub_51158:
		 
		txt $286                ; "Granseal harbor is behind{N}me.{W2}{N}A ship just docked a few{N}minutes ago.{W1}"
		rts

	; End of function sub_51158


; =============== S U B R O U T I N E =======================================

sub_5115E:
		 
		txt $287                ; "The human caught me when{N}I was taking a walk in{N}Parmecia.{W1}"
		rts

	; End of function sub_5115E


; =============== S U B R O U T I N E =======================================

sub_51164:
		 
		txt $288                ; "Release me! Get me out of{N}here or I shall eat you up!!{W1}"
		rts

	; End of function sub_51164


; =============== S U B R O U T I N E =======================================

sub_5116A:
		 
		txt $289                ; "Me...(sob)...so hungry.{N}Hungry....{W1}"
		rts

	; End of function sub_5116A


; =============== S U B R O U T I N E =======================================

sub_51170:
		jsr     j_ChurchActions
		rts

	; End of function sub_51170


; =============== S U B R O U T I N E =======================================

sub_51178:
		 
		txt $28A                ; "I envy you!  You saw{N}the beautiful Princess Elis!{W1}"
		rts

	; End of function sub_51178


; =============== S U B R O U T I N E =======================================

sub_5117E:
		 
		chkFlg $116             ; Temporary map setup flag 16
		bne.s   byte_5118E      
		txt $28B                ; "A pet shop has newly opened,{N}but Mom never lets me go?{N}Why?{W1}"
		setFlg $116             ; Temporary map setup flag 16
		bra.s   return_51192
byte_5118E:
		txt $291                ; "Well, {LEADER}!{N}Come and play with me{N}later!  Promise?{W1}"
return_51192:
		rts

	; End of function sub_5117E


; =============== S U B R O U T I N E =======================================

sub_51194:
		 
		chkFlg $117             ; Temporary map setup flag 17
		bne.s   byte_511A2      
		txt $292                ; "Strangers from the mainland{N}opened a pet shop.{W2}"
		setFlg $117             ; Temporary map setup flag 17
byte_511A2:
		txt $293                ; "I don't think it's right{N}to hold animals captive.{W1}"
		rts

	; End of function sub_51194


; =============== S U B R O U T I N E =======================================

sub_511A8:
		 
		chkFlg $118             ; Temporary map setup flag 18
		bne.s   byte_511B6      
		txt $294                ; "(Sniff, sniff)...have you{N}seen or smelt any sulfur?{W2}"
		setFlg $118             ; Temporary map setup flag 18
byte_511B6:
		txt $295                ; "I'm an inventor.{N}I'm looking for some sulfur.{W1}"
		rts

	; End of function sub_511A8


; =============== S U B R O U T I N E =======================================

sub_511BC:
		move.b  #$F,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_511BC

