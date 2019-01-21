
; ASM FILE data\maps\entries\map16\mapsetups\s2_212.asm :
; 0x61058..0x6114E : 
ms_map16_flag212_EntityEvents:
		msEntityEvent 128, UP, sub_610A4-ms_map16_flag212_EntityEvents
		msEntityEvent 129, DOWN, sub_610AE-ms_map16_flag212_EntityEvents
		msEntityEvent 130, UP, sub_610B4-ms_map16_flag212_EntityEvents
		msEntityEvent 131, DOWN, sub_610BA-ms_map16_flag212_EntityEvents
		msEntityEvent 132, DOWN, sub_610C4-ms_map16_flag212_EntityEvents
		msEntityEvent 133, UP, sub_610CE-ms_map16_flag212_EntityEvents
		msEntityEvent 134, UP, sub_610D8-ms_map16_flag212_EntityEvents
		msEntityEvent 135, UP, sub_610DE-ms_map16_flag212_EntityEvents
		msEntityEvent 136, UP, sub_610E4-ms_map16_flag212_EntityEvents
		msEntityEvent 137, UP, sub_610EA-ms_map16_flag212_EntityEvents
		msEntityEvent 138, UP, sub_610F8-ms_map16_flag212_EntityEvents
		msEntityEvent 139, UP, sub_61100-ms_map16_flag212_EntityEvents
		msEntityEvent 140, UP, sub_6110A-ms_map16_flag212_EntityEvents
		msEntityEvent 141, UP, sub_61110-ms_map16_flag212_EntityEvents
		msEntityEvent 142, RIGHT, sub_61116-ms_map16_flag212_EntityEvents
		msEntityEvent 143, UP, sub_6112E-ms_map16_flag212_EntityEvents
		msEntityEvent 144, UP, sub_6113C-ms_map16_flag212_EntityEvents
		msEntityEvent 145, RIGHT, sub_61146-ms_map16_flag212_EntityEvents
		msDefaultEntityEvent 0, entevdft_6114C-ms_map16_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_610A4:
		trap    #TEXTBOX
		dc.w $DA0               ; "Red Baron is {NAME;28}.{W2}"
		trap    #TEXTBOX
		dc.w $DA1               ; "He was running around and{N}crying for somebody to kill{N}him.{W1}"
		rts

	; End of function sub_610A4


; =============== S U B R O U T I N E =======================================

sub_610AE:
		trap    #TEXTBOX
		dc.w $DA2               ; "{NAME;28} went south.{N}He was acting strange.{W1}"
		rts

	; End of function sub_610AE


; =============== S U B R O U T I N E =======================================

sub_610B4:
		trap    #TEXTBOX
		dc.w $DA3               ; "King Galam has not returned{N}from the war against{N}Granseal.{W1}"
		rts

	; End of function sub_610B4


; =============== S U B R O U T I N E =======================================

sub_610BA:
		trap    #TEXTBOX
		dc.w $DA4               ; "{NAME;28} made that hole.{W2}"
		trap    #TEXTBOX
		dc.w $DA5               ; "He jumped off the top of the{N}castle, but he didn't die!{W1}"
		rts

	; End of function sub_610BA


; =============== S U B R O U T I N E =======================================

sub_610C4:
		trap    #TEXTBOX
		dc.w $DA6               ; "My boyfriend has not{N}returned from the war...{W2}"
		trap    #TEXTBOX
		dc.w $DA7               ; "I hope he's alive...{W1}"
		rts

	; End of function sub_610C4


; =============== S U B R O U T I N E =======================================

sub_610CE:
		trap    #TEXTBOX
		dc.w $DA8               ; "I heard from a soldier that{N}Yeel is haunted.{W2}"
		trap    #TEXTBOX
		dc.w $DA9               ; "He said that he heard the{N}sound of a piano playing.{W1}"
		rts

	; End of function sub_610CE


; =============== S U B R O U T I N E =======================================

sub_610D8:
		trap    #TEXTBOX
		dc.w $DAA               ; "From Granseal?  I didn't{N}know anyone survived that{N}earthquake.{W1}"
		rts

	; End of function sub_610D8


; =============== S U B R O U T I N E =======================================

sub_610DE:
		trap    #TEXTBOX
		dc.w $DAB               ; "The priest of Yeel liked the{N}piano.  The ghost may be him.{W1}"
		rts

	; End of function sub_610DE


; =============== S U B R O U T I N E =======================================

sub_610E4:
		trap    #TEXTBOX
		dc.w $DAC               ; "Do you know about the stautue{N}of the devil?  It appeared{N}at the Ancient Tower.{W1}"
		rts

	; End of function sub_610E4


; =============== S U B R O U T I N E =======================================

sub_610EA:
		move.b  #$1D,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_610EA


; =============== S U B R O U T I N E =======================================

sub_610F8:
		jsr     j_ChurchActions
		rts

	; End of function sub_610F8


; =============== S U B R O U T I N E =======================================

sub_61100:
		trap    #TEXTBOX
		dc.w $DAD               ; "Red Baron was looking for{N}something at the Ancient{N}Tower.{W2}"
		trap    #TEXTBOX
		dc.w $DAE               ; "Nobody returned from that{N}trip.  I didn't go. I was{N}smart!{W1}"
		rts

	; End of function sub_61100


; =============== S U B R O U T I N E =======================================

sub_6110A:
		trap    #TEXTBOX
		dc.w $DB1               ; "I...I saw them...many devils{N}came from the tower....{W1}"
		rts

	; End of function sub_6110A


; =============== S U B R O U T I N E =======================================

sub_61110:
		trap    #TEXTBOX
		dc.w $DB6               ; "Good weapons and armor, huh?{W1}"
		rts

	; End of function sub_61110


; =============== S U B R O U T I N E =======================================

sub_61116:
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
		trap    #TEXTBOX
		dc.w $1A7               ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
		trap    #TEXTBOX
		dc.w $FF2               ; "A hole.{W1}"
		rts

	; End of function sub_61116


; =============== S U B R O U T I N E =======================================

sub_6112E:
		move.b  #$E,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_6112E


; =============== S U B R O U T I N E =======================================

sub_6113C:
		trap    #TEXTBOX
		dc.w $DB3               ; "You want to enter the tower?{W2}"
		trap    #TEXTBOX
		dc.w $DB4               ; "Impossible.  It's buried in{N}the ground and there is no{N}door.{W1}"
		rts

	; End of function sub_6113C


; =============== S U B R O U T I N E =======================================

sub_61146:
		jsr     j_CaravanActions
entevdft_6114C:
		
		rts

	; End of function sub_61146

