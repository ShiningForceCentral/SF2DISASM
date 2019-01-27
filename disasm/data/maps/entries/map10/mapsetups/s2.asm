
; ASM FILE data\maps\entries\map10\mapsetups\s2.asm :
; 0x56D80..0x56E9C : 
ms_map10_EntityEvents:
		msEntityEvent 128, DOWN, sub_56DE0-ms_map10_EntityEvents
		msEntityEvent 129, DOWN, sub_56DE6-ms_map10_EntityEvents
		msEntityEvent 130, RIGHT, sub_56DF0-ms_map10_EntityEvents
		msEntityEvent 131, RIGHT, sub_56DFE-ms_map10_EntityEvents
		msEntityEvent 132, RIGHT, sub_56E08-ms_map10_EntityEvents
		msEntityEvent 133, RIGHT, sub_56E12-ms_map10_EntityEvents
		msEntityEvent 134, RIGHT, sub_56E1C-ms_map10_EntityEvents
		msEntityEvent 135, RIGHT, sub_56E22-ms_map10_EntityEvents
		msEntityEvent 136, RIGHT, sub_56E2C-ms_map10_EntityEvents
		msEntityEvent 137, DOWN, sub_56E36-ms_map10_EntityEvents
		msEntityEvent 138, DOWN, sub_56E44-ms_map10_EntityEvents
		msEntityEvent 139, UP, sub_56E4C-ms_map10_EntityEvents
		msEntityEvent 140, DOWN, sub_56E52-ms_map10_EntityEvents
		msEntityEvent 141, DOWN, sub_56E58-ms_map10_EntityEvents
		msEntityEvent 142, DOWN, sub_56E5E-ms_map10_EntityEvents
		msEntityEvent 143, DOWN, sub_56E64-ms_map10_EntityEvents
		msEntityEvent 144, UP, sub_56E6A-ms_map10_EntityEvents
		msEntityEvent 145, DOWN, sub_56E70-ms_map10_EntityEvents
		msEntityEvent 146, DOWN, sub_56E7A-ms_map10_EntityEvents
		msEntityEvent 147, UP, sub_56E84-ms_map10_EntityEvents
		msEntityEvent 148, UP, sub_56E8A-ms_map10_EntityEvents
		msEntityEvent 149, DOWN, sub_56E90-ms_map10_EntityEvents
		msEntityEvent 10, DOWN, sub_56E96-ms_map10_EntityEvents
		msDefaultEntityEvent 0, entevdft_56E9A-ms_map10_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56DE0:
		 
		txt $621                ; "Mighty Volcanon!  He easily{N}defeated the greater devil!{W1}"
		rts

	; End of function sub_56DE0


; =============== S U B R O U T I N E =======================================

sub_56DE6:
		 
		txt $624                ; "They know that they can't{N}defeat our God.{W2}"
		txt $625                ; "What was their true{N}purpose?{W1}"
		rts

	; End of function sub_56DE6


; =============== S U B R O U T I N E =======================================

sub_56DF0:
		move.b  #$14,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_56DF0


; =============== S U B R O U T I N E =======================================

sub_56DFE:
		 
		txt $61C                ; "Creed is the last greater{N}devil to survive the war.{W2}"
		txt $61D                ; "But he retired from the army{N}and now lives alone in{N}Devil's Tail.{W1}"
		rts

	; End of function sub_56DFE


; =============== S U B R O U T I N E =======================================

sub_56E08:
		 
		txt $61A                ; "The devils were almost{N}annihilated before.{N}"
		txt $61B                ; "Why did they attack Bedoe?{W1}"
		rts

	; End of function sub_56E08


; =============== S U B R O U T I N E =======================================

sub_56E12:
		 
		txt $628                ; "(Burp)...I'm not afraid{N}of devils...{W2}"
		txt $629                ; "as long as I drink a{N}rootbeer first...(burp).{W1}"
		rts

	; End of function sub_56E12


; =============== S U B R O U T I N E =======================================

sub_56E1C:
		 
		txt $61E                ; "Uuuu...ooo....{N}He's...a...terrible...{W1}"
		rts

	; End of function sub_56E1C


; =============== S U B R O U T I N E =======================================

sub_56E22:
		 
		txt $622                ; "Ouch...the greater devil was{N}incredibly strong.{W2}"
		txt $623                ; "But the other devils were{N}strong as well!{W1}"
		rts

	; End of function sub_56E22


; =============== S U B R O U T I N E =======================================

sub_56E2C:
		 
		txt $62C                ; "Yes, they were strong.{N}But...{W2}"
		txt $62D                ; "Monsters like the Kraken and{N}Taros are much bigger!{W1}"
		rts

	; End of function sub_56E2C


; =============== S U B R O U T I N E =======================================

sub_56E36:
		move.b  #5,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_56E36


; =============== S U B R O U T I N E =======================================

sub_56E44:
		jsr     j_ChurchActions
		rts

	; End of function sub_56E44


; =============== S U B R O U T I N E =======================================

sub_56E4C:
		 
		txt $62E                ; "My spouse was...killed...{N}in the war....{W1}"
		rts

	; End of function sub_56E4C


; =============== S U B R O U T I N E =======================================

sub_56E52:
		 
		txt $62F                ; "Zzzz...dad, no...come back...!{W1}"
		rts

	; End of function sub_56E52


; =============== S U B R O U T I N E =======================================

sub_56E58:
		 
		txt $630                ; "The devils?!  I thought they{N}were only an old legend.{W1}"
		rts

	; End of function sub_56E58


; =============== S U B R O U T I N E =======================================

sub_56E5E:
		 
		txt $631                ; "I never let my hatchling{N}go out!{W1}"
		rts

	; End of function sub_56E5E


; =============== S U B R O U T I N E =======================================

sub_56E64:
		 
		txt $632                ; "Have you seen my dad?{N}Mom won't tell me anyhting{N}about him.{W1}"
		rts

	; End of function sub_56E64


; =============== S U B R O U T I N E =======================================

sub_56E6A:
		 
		txt $633                ; "We have a lot of weapons,{N}but I don't want to use any{N}of them!{W1}"
		rts

	; End of function sub_56E6A


; =============== S U B R O U T I N E =======================================

sub_56E70:
		 
		txt $634                ; "I'm bored!{N}I want to go out!{W2}"
		txt $635                ; "How wonderful it would be to{N}fly on such a beautiful day!{W1}"
		rts

	; End of function sub_56E70


; =============== S U B R O U T I N E =======================================

sub_56E7A:
		 
		txt $636                ; "We need a lot of hot water{N}to treat these injured men.{W2}"
		txt $637                ; "I've been standing here all{N}day!{W1}"
		rts

	; End of function sub_56E7A


; =============== S U B R O U T I N E =======================================

sub_56E84:
		 
		txt $68E                ; "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
		rts

	; End of function sub_56E84


; =============== S U B R O U T I N E =======================================

sub_56E8A:
		 
		txt $68D                ; "He should talk to him.{W1}"
		rts

	; End of function sub_56E8A


; =============== S U B R O U T I N E =======================================

sub_56E90:
		 
		txt $626                ; "Kneel before King Bedoe.{N}Just kidding.{W1}"
		rts

	; End of function sub_56E90


; =============== S U B R O U T I N E =======================================

sub_56E96:
		 
		txt $639                ; "If...God Volcanon doesn't{N}calm down...{W1}"
entevdft_56E9A:
		
		rts

	; End of function sub_56E96

