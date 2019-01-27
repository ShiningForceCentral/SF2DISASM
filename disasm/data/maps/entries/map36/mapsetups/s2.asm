
; ASM FILE data\maps\entries\map36\mapsetups\s2.asm :
; 0x5D84A..0x5D924 : 
ms_map36_EntityEvents:
		msEntityEvent 22, UP, sub_5D8FA-ms_map36_EntityEvents
		msEntityEvent 128, UP, sub_5D884-ms_map36_EntityEvents
		msEntityEvent 129, UP, sub_5D88A-ms_map36_EntityEvents
		msEntityEvent 130, UP, sub_5D894-ms_map36_EntityEvents
		msEntityEvent 131, UP, sub_5D89E-ms_map36_EntityEvents
		msEntityEvent 132, UP, sub_5D8BC-ms_map36_EntityEvents
		msEntityEvent 133, UP, sub_5D8CA-ms_map36_EntityEvents
		msEntityEvent 134, UP, sub_5D8D8-ms_map36_EntityEvents
		msEntityEvent 135, UP, sub_5D8E2-ms_map36_EntityEvents
		msEntityEvent 136, UP, sub_5D8F0-ms_map36_EntityEvents
		msEntityEvent 137, UP, sub_5D904-ms_map36_EntityEvents
		msEntityEvent 138, UP, sub_5D90E-ms_map36_EntityEvents
		msEntityEvent 139, UP, sub_5D91C-ms_map36_EntityEvents
		msDefaultEntityEvent 0, nullsub_140-ms_map36_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_140:
		rts

	; End of function nullsub_140


; =============== S U B R O U T I N E =======================================

sub_5D884:
		 
		txt     $CD1            ; "Are you from South Parmecia?{N}Oh, great!{W1}"
		rts

	; End of function sub_5D884


; =============== S U B R O U T I N E =======================================

sub_5D88A:
		 
		txt     $CD2            ; "It's been dry here since the{N}devils appeared.{W2}"
		txt     $CD3            ; "They must have done something{N}to Goddess Mitula!{W1}"
		rts

	; End of function sub_5D88A


; =============== S U B R O U T I N E =======================================

sub_5D894:
		 
		txt     $CD4            ; "Brave Pacalons?{W2}"
		txt     $CD5            ; "None at all.  There are no{N}soldiers who can fight{N}against the devils.{W1}"
		rts

	; End of function sub_5D894


; =============== S U B R O U T I N E =======================================

sub_5D89E:
		 
		chkFlg  $32A            ; set after speaking to a centaur at Pacalon castle (the one who moves and shivers)
		bne.s   byte_5D8B6      
		txt     $CD6            ; "Devils are coming to town?{N}OK, I'll beat them up!{W1}"
		clsTxt
		script  cs_5DA7A
		setFlg  $32A            ; set after speaking to a centaur at Pacalon castle (the one who moves and shivers)
byte_5D8B6:
		txt     $CD7            ; "Oh, I can't.  I'm too hungry!{W1}"
		rts

	; End of function sub_5D89E


; =============== S U B R O U T I N E =======================================

sub_5D8BC:
		 
		txt     $CD8            ; "They came from Nazca, which{N}is west of Moun.{W2}"
		txt     $CD9            ; "We locked the gate of Moun{N}to stop their progress.{W2}"
		txt     $CDA            ; "Vicar {NAME;22} has the{N}key to open the gate.{W1}"
		rts

	; End of function sub_5D8BC


; =============== S U B R O U T I N E =======================================

sub_5D8CA:
		 
		txt     $CDB            ; "Devils came to Pacalon{N}through Moun.{W2}"
		txt     $CDC            ; "We blocked the invaders{N}by locking the gate of Moun.{W2}"
		txt     $CDD            ; "That means, we abandoned{N}the people living there.{W1}"
		rts

	; End of function sub_5D8CA


; =============== S U B R O U T I N E =======================================

sub_5D8D8:
		 
		txt     $CDE            ; "We don't have enough food{N}because of the long drought.{W2}"
		txt     $CDF            ; "Just one rainfall would make{N}us happy.{W1}"
		rts

	; End of function sub_5D8D8


; =============== S U B R O U T I N E =======================================

sub_5D8E2:
		 
		txt     $CE0            ; "{NAME;19} asked you to drop{N}by here?  Thank you!{W2}"
		txt     $CE1            ; "May I ask you a favor?{N}Please save Mitula.{N}She's in Tristan.{W2}"
		txt     $CE2            ; "We will be ruined by the{N}drought long before the{N}devils destroy us.{W1}"
		rts

	; End of function sub_5D8E2


; =============== S U B R O U T I N E =======================================

sub_5D8F0:
		 
		txt     $CE3            ; "You'll see a route through{N}the mountains when you go{N}north from here.{W2}"
		txt     $CE4            ; "You can get to Tristan by{N}traveling along that route.{W1}"
		rts

	; End of function sub_5D8F0


; =============== S U B R O U T I N E =======================================

sub_5D8FA:
		 
		txt     $CE5            ; "I committed a sin....{W2}"
		txt     $CE6            ; "I abandoned the people of{N}Moun to protect the{N}Parmecia continent.{W1}"
		rts

	; End of function sub_5D8FA


; =============== S U B R O U T I N E =======================================

sub_5D904:
		 
		txt     $CE7            ; "What happened to the{N}soldiers who went into{N}Mitula's Shrine?{W2}"
		txt     $CE8            ; "Were they all killed?{W1}"
		rts

	; End of function sub_5D904


; =============== S U B R O U T I N E =======================================

sub_5D90E:
		 
		txt     $CE9            ; "I saw it!{W2}"
		txt     $CEA            ; "The Princess ate food in the{N}kitchen one night.{W2}"
		txt     $CEB            ; "I didn't wish to see such{N}an uncouth princess.{W1}"
		rts

	; End of function sub_5D90E


; =============== S U B R O U T I N E =======================================

sub_5D91C:
		jsr     j_ChurchActions
		rts

	; End of function sub_5D91C

