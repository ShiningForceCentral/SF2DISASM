
; ASM FILE data\maps\entries\map10\mapsetups\s2.asm :
; 0x56D80..0x56E9C : 
ms_map10_EntityEvents:
		dc.b $80
		dc.b 3
		dc.w sub_56DE0-ms_map10_EntityEvents
		dc.b $81
		dc.b 3
		dc.w sub_56DE6-ms_map10_EntityEvents
		dc.b $82
		dc.b 0
		dc.w sub_56DF0-ms_map10_EntityEvents
		dc.b $83
		dc.b 0
		dc.w sub_56DFE-ms_map10_EntityEvents
		dc.b $84
		dc.b 0
		dc.w sub_56E08-ms_map10_EntityEvents
		dc.b $85
		dc.b 0
		dc.w sub_56E12-ms_map10_EntityEvents
		dc.b $86
		dc.b 0
		dc.w sub_56E1C-ms_map10_EntityEvents
		dc.b $87
		dc.b 0
		dc.w sub_56E22-ms_map10_EntityEvents
		dc.b $88
		dc.b 0
		dc.w sub_56E2C-ms_map10_EntityEvents
		dc.b $89
		dc.b 3
		dc.w sub_56E36-ms_map10_EntityEvents
		dc.b $8A
		dc.b 3
		dc.w sub_56E44-ms_map10_EntityEvents
		dc.b $8B
		dc.b 1
		dc.w sub_56E4C-ms_map10_EntityEvents
		dc.b $8C
		dc.b 3
		dc.w sub_56E52-ms_map10_EntityEvents
		dc.b $8D
		dc.b 3
		dc.w sub_56E58-ms_map10_EntityEvents
		dc.b $8E
		dc.b 3
		dc.w sub_56E5E-ms_map10_EntityEvents
		dc.b $8F
		dc.b 3
		dc.w sub_56E64-ms_map10_EntityEvents
		dc.b $90
		dc.b 1
		dc.w sub_56E6A-ms_map10_EntityEvents
		dc.b $91
		dc.b 3
		dc.w sub_56E70-ms_map10_EntityEvents
		dc.b $92
		dc.b 3
		dc.w sub_56E7A-ms_map10_EntityEvents
		dc.b $93
		dc.b 1
		dc.w sub_56E84-ms_map10_EntityEvents
		dc.b $94
		dc.b 1
		dc.w sub_56E8A-ms_map10_EntityEvents
		dc.b $95
		dc.b 3
		dc.w sub_56E90-ms_map10_EntityEvents
		dc.b $A
		dc.b 3
		dc.w sub_56E96-ms_map10_EntityEvents
		dc.w $FD00
		dc.w return_56E9A-ms_map10_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56DE0:
		
		trap    #TEXTBOX
		dc.w $621               
						; "Mighty Volcanon!  He easily{N}defeated the greater devil!{W1}"
		rts

	; End of function sub_56DE0


; =============== S U B R O U T I N E =======================================

sub_56DE6:
		
		trap    #TEXTBOX
		dc.w $624               
						; "They know that they can't{N}defeat our God.{W2}"
		trap    #TEXTBOX
		dc.w $625               
						; "What was their true{N}purpose?{W1}"
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
		
		trap    #TEXTBOX
		dc.w $61C               
						; "Creed is the last greater{N}devil to survive the war.{W2}"
		trap    #TEXTBOX
		dc.w $61D               
						; "But he retired from the army{N}and now lives alone in{N}Devil's Tail.{W1}"
		rts

	; End of function sub_56DFE


; =============== S U B R O U T I N E =======================================

sub_56E08:
		
		trap    #TEXTBOX
		dc.w $61A               
						; "The devils were almost{N}annihilated before.{N}"
		trap    #TEXTBOX
		dc.w $61B               
						; "Why did they attack Bedoe?{W1}"
		rts

	; End of function sub_56E08


; =============== S U B R O U T I N E =======================================

sub_56E12:
		
		trap    #TEXTBOX
		dc.w $628               
						; "(Burp)...I'm not afraid{N}of devils...{W2}"
		trap    #TEXTBOX
		dc.w $629               
						; "as long as I drink a{N}rootbeer first...(burp).{W1}"
		rts

	; End of function sub_56E12


; =============== S U B R O U T I N E =======================================

sub_56E1C:
		
		trap    #TEXTBOX
		dc.w $61E               
						; "Uuuu...ooo....{N}He's...a...terrible...{W1}"
		rts

	; End of function sub_56E1C


; =============== S U B R O U T I N E =======================================

sub_56E22:
		
		trap    #TEXTBOX
		dc.w $622               
						; "Ouch...the greater devil was{N}incredibly strong.{W2}"
		trap    #TEXTBOX
		dc.w $623               
						; "But the other devils were{N}strong as well!{W1}"
		rts

	; End of function sub_56E22


; =============== S U B R O U T I N E =======================================

sub_56E2C:
		
		trap    #TEXTBOX
		dc.w $62C               
						; "Yes, they were strong.{N}But...{W2}"
		trap    #TEXTBOX
		dc.w $62D               
						; "Monsters like the Kraken and{N}Taros are much bigger!{W1}"
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
		
		trap    #TEXTBOX
		dc.w $62E               
						; "My spouse was...killed...{N}in the war....{W1}"
		rts

	; End of function sub_56E4C


; =============== S U B R O U T I N E =======================================

sub_56E52:
		
		trap    #TEXTBOX
		dc.w $62F               
						; "Zzzz...dad, no...come back...!{W1}"
		rts

	; End of function sub_56E52


; =============== S U B R O U T I N E =======================================

sub_56E58:
		
		trap    #TEXTBOX
		dc.w $630               
						; "The devils?!  I thought they{N}were only an old legend.{W1}"
		rts

	; End of function sub_56E58


; =============== S U B R O U T I N E =======================================

sub_56E5E:
		
		trap    #TEXTBOX
		dc.w $631               
						; "I never let my hatchling{N}go out!{W1}"
		rts

	; End of function sub_56E5E


; =============== S U B R O U T I N E =======================================

sub_56E64:
		
		trap    #TEXTBOX
		dc.w $632               
						; "Have you seen my dad?{N}Mom won't tell me anyhting{N}about him.{W1}"
		rts

	; End of function sub_56E64


; =============== S U B R O U T I N E =======================================

sub_56E6A:
		
		trap    #TEXTBOX
		dc.w $633               
						; "We have a lot of weapons,{N}but I don't want to use any{N}of them!{W1}"
		rts

	; End of function sub_56E6A


; =============== S U B R O U T I N E =======================================

sub_56E70:
		
		trap    #TEXTBOX
		dc.w $634               
						; "I'm bored!{N}I want to go out!{W2}"
		trap    #TEXTBOX
		dc.w $635               
						; "How wonderful it would be to{N}fly on such a beautiful day!{W1}"
		rts

	; End of function sub_56E70


; =============== S U B R O U T I N E =======================================

sub_56E7A:
		
		trap    #TEXTBOX
		dc.w $636               
						; "We need a lot of hot water{N}to treat these injured men.{W2}"
		trap    #TEXTBOX
		dc.w $637               
						; "I've been standing here all{N}day!{W1}"
		rts

	; End of function sub_56E7A


; =============== S U B R O U T I N E =======================================

sub_56E84:
		
		trap    #TEXTBOX
		dc.w $68E               
						; "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
		rts

	; End of function sub_56E84


; =============== S U B R O U T I N E =======================================

sub_56E8A:
		
		trap    #TEXTBOX
		dc.w $68D               
						; "He should talk to him.{W1}"
		rts

	; End of function sub_56E8A


; =============== S U B R O U T I N E =======================================

sub_56E90:
		
		trap    #TEXTBOX
		dc.w $626               
						; "Kneel before King Bedoe.{N}Just kidding.{W1}"
		rts

	; End of function sub_56E90


; =============== S U B R O U T I N E =======================================

sub_56E96:
		
		trap    #TEXTBOX
		dc.w $639               
						; "If...God Volcanon doesn't{N}calm down...{W1}"
return_56E9A:
		
		rts

	; End of function sub_56E96

