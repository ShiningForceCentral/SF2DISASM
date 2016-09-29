
; SCRIPT SECTION maps\entries\map36\mapsetups\s2 :
; 
ms_map36_EntityEvents:
										dc.b $16
										dc.b 1
										dc.w sub_5D8FA-ms_map36_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_5D884-ms_map36_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5D88A-ms_map36_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5D894-ms_map36_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5D89E-ms_map36_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5D8BC-ms_map36_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5D8CA-ms_map36_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5D8D8-ms_map36_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5D8E2-ms_map36_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5D8F0-ms_map36_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_5D904-ms_map36_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_5D90E-ms_map36_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_5D91C-ms_map36_EntityEvents
										dc.w $FD00
										dc.w nullsub_140-ms_map36_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_140:
										
										rts

	; End of function nullsub_140


; =============== S U B R O U T I N E =======================================

sub_5D884:
										
										trap    #TRAP_TEXTBOX
										dc.w $CD1               ; "Are you from South Parmecia?{N}Oh, great!{W1}"
										rts

	; End of function sub_5D884


; =============== S U B R O U T I N E =======================================

sub_5D88A:
										
										trap    #TRAP_TEXTBOX
										dc.w $CD2               ; "It's been dry here since the{N}devils appeared.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CD3               ; "They must have done something{N}to Goddess Mitula!{W1}"
										rts

	; End of function sub_5D88A


; =============== S U B R O U T I N E =======================================

sub_5D894:
										
										trap    #TRAP_TEXTBOX
										dc.w $CD4               ; "Brave Pacalons?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CD5               ; "None at all.  There are no{N}soldiers who can fight{N}against the devils.{W1}"
										rts

	; End of function sub_5D894


; =============== S U B R O U T I N E =======================================

sub_5D89E:
										
										trap    #1
										dc.w $32A
										bne.s   loc_5D8B6
										trap    #TRAP_TEXTBOX
										dc.w $CD6               ; "Devils are coming to town?{N}OK, I'll beat them up!{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										lea     cs_5DA7A(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $32A               ; set after speaking to a centaur at Pacalon castle (the one who moves and shivers)
loc_5D8B6:
										
										trap    #TRAP_TEXTBOX
										dc.w $CD7               ; "Oh, I can't.  I'm too hungry!{W1}"
										rts

	; End of function sub_5D89E


; =============== S U B R O U T I N E =======================================

sub_5D8BC:
										
										trap    #TRAP_TEXTBOX
										dc.w $CD8               ; "They came from Nazca, which{N}is west of Moun.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CD9               ; "We locked the gate of Moun{N}to stop their progress.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CDA               ; "Vicar {NAME;22} has the{N}key to open the gate.{W1}"
										rts

	; End of function sub_5D8BC


; =============== S U B R O U T I N E =======================================

sub_5D8CA:
										
										trap    #TRAP_TEXTBOX
										dc.w $CDB               ; "Devils came to Pacalon{N}through Moun.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CDC               ; "We blocked the invaders{N}by locking the gate of Moun.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CDD               ; "That means, we abandoned{N}the people living there.{W1}"
										rts

	; End of function sub_5D8CA


; =============== S U B R O U T I N E =======================================

sub_5D8D8:
										
										trap    #TRAP_TEXTBOX
										dc.w $CDE               ; "We don't have enough food{N}because of the long drought.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CDF               ; "Just one rainfall would make{N}us happy.{W1}"
										rts

	; End of function sub_5D8D8


; =============== S U B R O U T I N E =======================================

sub_5D8E2:
										
										trap    #TRAP_TEXTBOX
										dc.w $CE0               ; "{NAME;19} asked you to drop{N}by here?  Thank you!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CE1               ; "May I ask you a favor?{N}Please save Mitula.{N}She's in Tristan.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CE2               ; "We will be ruined by the{N}drought long before the{N}devils destroy us.{W1}"
										rts

	; End of function sub_5D8E2


; =============== S U B R O U T I N E =======================================

sub_5D8F0:
										
										trap    #TRAP_TEXTBOX
										dc.w $CE3               ; "You'll see a route through{N}the mountains when you go{N}north from here.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CE4               ; "You can get to Tristan by{N}traveling along that route.{W1}"
										rts

	; End of function sub_5D8F0


; =============== S U B R O U T I N E =======================================

sub_5D8FA:
										
										trap    #TRAP_TEXTBOX
										dc.w $CE5               ; "I committed a sin....{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CE6               ; "I abandoned the people of{N}Moun to protect the{N}Parmecia continent.{W1}"
										rts

	; End of function sub_5D8FA


; =============== S U B R O U T I N E =======================================

sub_5D904:
										
										trap    #TRAP_TEXTBOX
										dc.w $CE7               ; "What happened to the{N}soldiers who went into{N}Mitula's Shrine?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CE8               ; "Were they all killed?{W1}"
										rts

	; End of function sub_5D904


; =============== S U B R O U T I N E =======================================

sub_5D90E:
										
										trap    #TRAP_TEXTBOX
										dc.w $CE9               ; "I saw it!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CEA               ; "The Princess ate food in the{N}kitchen one night.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $CEB               ; "I didn't wish to see such{N}an uncouth princess.{W1}"
										rts

	; End of function sub_5D90E


; =============== S U B R O U T I N E =======================================

sub_5D91C:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5D91C

